// Firebase on iOS and Android (R-6b). Firestore auto-detects long polling (some networks break its
// streaming transport on React Native) and has no offline cache: the device store is the local copy.
// Everything is created once, on first use.
//
// The Auth session (ID and refresh tokens) is kept in expo-secure-store: the iOS Keychain and the Android
// Keystore (R-6b follow-up). Every item is AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY: never in a backup or on
// another device, and readable after the first unlock so a background token refresh works. The
// expo-secure-store config plugin in app.json excludes its Android data from Auto Backup, and drops the
// Face ID usage string (no biometrics are used).
//
// - A Firebase session record is ~2–3 KB, above SecureStore's 2048-byte guidance, so each value is split into
//   chunks under derived keys plus a header item naming a write id and the chunk count. Every chunk carries
//   the write id; a read with a missing chunk or a chunk from another write is null (signed out, which is
//   safe), so interleaved writes never read back as a mixed session. A set writes the header last; a remove
//   deletes the header first.
// - SecureStore keys allow only [A-Za-z0-9._-] and Firebase's contain ':' and '['. A key is a prefix plus an
//   escape of the Firebase key ([A-Za-z0-9-] kept, anything else `_` + 4 hex digits of the UTF-16 unit):
//   deterministic and one-to-one, and never contains '.', which separates the header and chunk suffixes.
// - Migration: R-6b's first build kept the session in clear in an MMKV store `bible-app-auth`. Before the
//   store's first use any value there is moved into SecureStore and removed from MMKV (no clear copy is
//   left; if SecureStore refuses it, the value is dropped and the reader signs in again). A marker item then
//   stops MMKV ever being opened again. A failed migration (SecureStore refusing reads before the first
//   unlock, say) is retried on every later store call until it succeeds, and until then a set or remove of
//   a key also removes that key from the legacy MMKV store: a session the user signed out of can never come
//   back from the old clear copy (security review 4, S4-5).
// - A new install starts signed out. The iOS Keychain survives an uninstall (the app's files do not), so a
//   reinstall would otherwise restore the old session. getFirebaseAuth passes the keys Firebase Auth reads
//   (`firebaseSessionKeys`); on the first launch of an install (no marker in the MMKV store
//   `bible-app-install`, which goes with the app's files) their SecureStore items and the migration marker
//   are deleted before any read, then the marker is set. SecureStore cannot list its keys, so the wipe is by
//   name: exactly the keys this Firebase app reads (from its API key and app name), each item's header and
//   chunks. Until a key is wiped it reads as null (signed out); a set or remove of it counts as wiping it.
// - Why not MMKV encrypted with a key kept in SecureStore: that key must come from a CSPRNG, and this app has
//   none on native (no expo-crypto; React Native has no crypto.getRandomValues). The write ids below need
//   only to differ between writes, not to be secret.
import { initializeAuth, type Auth, type Persistence, type ReactNativeAsyncStorage } from 'firebase/auth';
import { initializeFirestore, type Firestore } from 'firebase/firestore';
import * as SecureStore from 'expo-secure-store';

import { getFirebaseConfig } from './firebaseConfig';
import { getFirebaseApp, withAuthEmulator, withFirestoreEmulator } from './firebaseCore';

export { getFirebaseApp };

let auth: Auth | null = null;
let db: Firestore | null = null;

const LEGACY_MMKV_ID = 'bible-app-auth';
const KEY_PREFIX = 'bible-app-auth';
const MIGRATED_KEY = `${KEY_PREFIX}.migrated-v1`;
/** The MMKV store holding the install marker: app data, so an uninstall removes it (unlike the Keychain). */
const INSTALL_MMKV_ID = 'bible-app-install';
const INSTALL_MARKER = 'auth-keychain-wiped-v1';
/** Characters per chunk: at most 1800 UTF-16 units, so under 2048 bytes for the ASCII a session holds. */
export const SESSION_CHUNK_SIZE = 1800;
/** A sanity bound on the chunk count read from a header (a corrupt header reads as null). */
const MAX_CHUNKS = 256;

const SECURE_OPTIONS: SecureStore.SecureStoreOptions = {
  keychainAccessible: SecureStore.AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY,
};

/** The SecureStore key stem for a Firebase storage key: only [A-Za-z0-9_-], and one-to-one. */
export function secureKeyStem(key: string): string {
  let out = '';
  for (let i = 0; i < key.length; i++) {
    const ch = key[i]!;
    out += /[A-Za-z0-9-]/.test(ch) ? ch : `_${key.charCodeAt(i).toString(16).padStart(4, '0')}`;
  }
  return `${KEY_PREFIX}.k.${out}`;
}
const headerKey = (stem: string) => `${stem}.h`;
const chunkKey = (stem: string, i: number) => `${stem}.${i}`;

let writeCounter = 0;
function newWriteId(): string {
  writeCounter = (writeCounter + 1) % 1_000_000;
  return `${Date.now().toString(36)}${writeCounter.toString(36)}${Math.floor(Math.random() * 2 ** 32).toString(36)}`;
}

function parseHeader(raw: string | null): { id: string; count: number } | null {
  const m = raw ? /^v1\|([0-9a-z]+)\|(\d{1,4})$/.exec(raw) : null;
  if (!m) return null;
  const count = Number(m[2]);
  return count >= 1 && count <= MAX_CHUNKS ? { id: m[1]!, count } : null;
}

async function secureGet(stem: string): Promise<string | null> {
  const header = parseHeader(await SecureStore.getItemAsync(headerKey(stem), SECURE_OPTIONS));
  if (!header) return null;
  const tag = `${header.id}|`;
  let value = '';
  for (let i = 0; i < header.count; i++) {
    const chunk = await SecureStore.getItemAsync(chunkKey(stem, i), SECURE_OPTIONS);
    if (chunk === null || !chunk.startsWith(tag)) return null;
    value += chunk.slice(tag.length);
  }
  return value;
}

/** Deletes chunks from `from` upwards: every index below `known`, then while one exists. */
async function deleteChunks(stem: string, from: number, known: number): Promise<void> {
  for (let i = from; i < MAX_CHUNKS; i++) {
    if (i >= known && (await SecureStore.getItemAsync(chunkKey(stem, i), SECURE_OPTIONS)) === null) return;
    await SecureStore.deleteItemAsync(chunkKey(stem, i), SECURE_OPTIONS);
  }
}

async function secureSet(stem: string, value: string): Promise<void> {
  const previous = parseHeader(await SecureStore.getItemAsync(headerKey(stem), SECURE_OPTIONS));
  const id = newWriteId();
  const count = Math.max(1, Math.ceil(value.length / SESSION_CHUNK_SIZE));
  for (let i = 0; i < count; i++) {
    const part = value.slice(i * SESSION_CHUNK_SIZE, (i + 1) * SESSION_CHUNK_SIZE);
    await SecureStore.setItemAsync(chunkKey(stem, i), `${id}|${part}`, SECURE_OPTIONS);
  }
  await SecureStore.setItemAsync(headerKey(stem), `v1|${id}|${count}`, SECURE_OPTIONS);
  // A shorter value leaves the old tail behind; remove it (it held part of the old tokens).
  await deleteChunks(stem, count, previous?.count ?? 0);
}

async function secureRemove(stem: string): Promise<void> {
  const previous = parseHeader(await SecureStore.getItemAsync(headerKey(stem), SECURE_OPTIONS));
  await SecureStore.deleteItemAsync(headerKey(stem), SECURE_OPTIONS);
  await deleteChunks(stem, 0, previous?.count ?? 0);
}

type Mmkv = ReturnType<typeof import('react-native-mmkv').createMMKV>;

function openMmkv(id: string): Mmkv {
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  const { createMMKV } = require('react-native-mmkv') as typeof import('react-native-mmkv');
  return createMMKV({ id });
}

/**
 * Moves anything R-6b's first build left in clear in MMKV into SecureStore. True once done (the marker is
 * set); false when it could not finish (the caller retries on its next call). Never rejects.
 */
async function migrateLegacyMmkv(): Promise<boolean> {
  try {
    if ((await SecureStore.getItemAsync(MIGRATED_KEY, SECURE_OPTIONS)) === '1') return true;
    const mmkv = openMmkv(LEGACY_MMKV_ID);
    for (const key of mmkv.getAllKeys()) {
      const value = mmkv.getString(key);
      try {
        const stem = secureKeyStem(key);
        // A session already in SecureStore is newer than the legacy copy.
        if (value !== undefined && (await secureGet(stem)) === null) await secureSet(stem, value);
      } catch {
        // SecureStore refused it: drop the clear copy anyway (the reader signs in again).
      } finally {
        mmkv.remove(key);
      }
    }
    mmkv.clearAll();
    await SecureStore.setItemAsync(MIGRATED_KEY, '1', SECURE_OPTIONS);
    return true;
  } catch {
    // MMKV or SecureStore unavailable: retried on the next store call; nothing is read from MMKV meanwhile.
    return false;
  }
}

/** Removes `key` from the legacy clear MMKV store (best effort; only while the migration is pending). */
function dropLegacyCopy(key: string): void {
  try {
    openMmkv(LEGACY_MMKV_ID).remove(key);
  } catch {
    // MMKV unavailable: then the migration cannot import from it either.
  }
}

/** The storage keys Firebase Auth's React Native persistence uses for one app (its API key and name). */
export function firebaseSessionKeys(apiKey: string, appName: string): string[] {
  return ['authUser', 'redirectUser', 'persistence'].map((name) => `firebase:${name}:${apiKey}:${appName}`).concat('__sak');
}

export interface SecureAuthStorageOptions {
  /**
   * Firebase keys whose SecureStore items are deleted once per install, before anything is read (the iOS
   * Keychain survives an uninstall). The install marker lives in MMKV `bible-app-install`. Omitted: no wipe.
   */
  wipeOnNewInstall?: readonly string[];
}

/** The storage Firebase Auth persists its session through on native: SecureStore, chunked. */
export function createSecureAuthStorage(options: SecureAuthStorageOptions = {}): ReactNativeAsyncStorage {
  const wipeKeys = options.wipeOnNewInstall;
  /** False until the install marker was read (only with `wipeOnNewInstall`); every read is null meanwhile. */
  let installKnown = wipeKeys === undefined;
  /** Keys still to wipe on this new install (null: none). Each reads as null until it is wiped. */
  let pendingWipe: Set<string> | null = null;
  let migrated = false;
  let attempt: Promise<void> | null = null;

  function checkInstall(): void {
    try {
      if (openMmkv(INSTALL_MMKV_ID).getString(INSTALL_MARKER) === undefined) {
        pendingWipe = new Set([...(wipeKeys ?? []), MIGRATED_KEY]);
      }
      installKnown = true;
    } catch {
      // MMKV unavailable: the install is unknown, so reads stay null and the check is retried.
    }
  }

  async function wipe(keys: Set<string>): Promise<void> {
    for (const key of [...keys]) {
      try {
        if (key === MIGRATED_KEY) await SecureStore.deleteItemAsync(MIGRATED_KEY, SECURE_OPTIONS);
        else await secureRemove(secureKeyStem(key));
        keys.delete(key);
      } catch {
        // SecureStore refused (before the first unlock, say): the key stays pending and reads as null.
      }
    }
    if (keys.size > 0 || pendingWipe !== keys) return;
    pendingWipe = null;
    try {
      openMmkv(INSTALL_MMKV_ID).set(INSTALL_MARKER, '1');
    } catch {
      // The marker did not stick: the next launch wipes again (one more sign-out; safe).
    }
  }

  async function prepare(): Promise<void> {
    if (!installKnown) checkInstall();
    if (pendingWipe) await wipe(pendingWipe);
    // Only after the wipe, so a session migrated on an upgrade is never wiped afterwards.
    if (installKnown && !pendingWipe && !migrated) migrated = await migrateLegacyMmkv();
  }

  /** Runs the outstanding one-time steps (one run at a time); immediate once everything is done. */
  const ready = (): Promise<void> => {
    if (installKnown && !pendingWipe && migrated) return Promise.resolve();
    attempt ??= prepare().finally(() => {
      attempt = null;
    });
    return attempt;
  };

  /** A set or remove made while the migration is pending must not leave the old clear copy behind. */
  const beforeWrite = (key: string) => {
    if (!migrated) dropLegacyCopy(key);
  };
  /** The write replaced or removed whatever an earlier install left under `key`. */
  const afterWrite = (key: string) => {
    pendingWipe?.delete(key);
  };

  return {
    getItem: async (key) => {
      await ready();
      if (!installKnown || pendingWipe?.has(key)) return null;
      return secureGet(secureKeyStem(key));
    },
    setItem: async (key, value) => {
      await ready();
      beforeWrite(key);
      await secureSet(secureKeyStem(key), value);
      afterWrite(key);
    },
    removeItem: async (key) => {
      await ready();
      beforeWrite(key);
      await secureRemove(secureKeyStem(key));
      afterWrite(key);
    },
  };
}

export function getFirebaseAuth(): Auth {
  if (!auth) {
    // `getReactNativePersistence` exists only in the React Native build of @firebase/auth, which Metro
    // resolves on iOS and Android. TypeScript sees the web typings (the RN ones are in
    // @firebase/auth/dist/rn/index.rn.d.ts), so its signature is declared here.
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    const { getReactNativePersistence } = require('firebase/auth') as {
      getReactNativePersistence(storage: ReactNativeAsyncStorage): Persistence;
    };
    const app = getFirebaseApp();
    // Firebase Auth derives its storage keys from the app's API key and name; those are wiped once per install.
    const apiKey = app.options?.apiKey ?? getFirebaseConfig().apiKey ?? '';
    const wipeOnNewInstall = firebaseSessionKeys(apiKey, app.name ?? '[DEFAULT]');
    const persistence = getReactNativePersistence(createSecureAuthStorage({ wipeOnNewInstall }));
    auth = withAuthEmulator(initializeAuth(app, { persistence }));
  }
  return auth;
}

export function getFirebaseDb(): Firestore {
  if (!db) db = withFirestoreEmulator(initializeFirestore(getFirebaseApp(), { experimentalAutoDetectLongPolling: true }));
  return db;
}
