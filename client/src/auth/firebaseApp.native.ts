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
//   back from the old clear copy (security review 4, S4-5). When MMKV itself cannot be opened that removal
//   fails too, so the write first records a SecureStore flag `bible-app-auth.legacy-drop-v1` (awaited, before
//   the write goes ahead); a migration that finds the flag drops every legacy key without importing any
//   (security review 5, S5-5). The person then signs in again, which is the safe direction.
// - A new install starts signed out. The iOS Keychain survives an uninstall (the app's files do not), so a
//   reinstall would otherwise restore the old session. getFirebaseAuth passes the keys Firebase Auth reads
//   (`firebaseSessionKeys`); on the first launch of an install (no marker in the MMKV store
//   `bible-app-install`, which goes with the app's files) their SecureStore items and the migration marker
//   are deleted before any read, then the marker is set. SecureStore cannot list its keys, so the wipe is by
//   name: exactly the keys this Firebase app reads (from its API key and app name), each item's header and
//   chunks. Until a key is wiped it reads as null (signed out); a set or remove of it counts as wiping it.
//   While the install marker cannot be read (MMKV failing to open) every read is null, and the first set of a
//   session key in the run (not Firebase's start-up probe `__sak`, which it sets and removes on every start)
//   first deletes exactly what that wipe would (a pre-wipe), then sets a SecureStore flag
//   `bible-app-auth.prewiped-v1` = '1'. Removes and `__sak` writes need no pre-wipe and write through: a remove
//   only deletes, and `__sak` holds nothing of a session (the ordinary wipe deletes it like any key). So a launch
//   whose MMKV fails once deletes nothing of an established install's session; it only hides it for that run
//   (security review, SR-N1). A later launch that opens MMKV and finds no marker but the flag reading exactly
//   '1' skips the wipe (everything under those keys was written by this install after it deleted them), so a
//   sign-in made while MMKV was down survives (security review 5, S5-4); without the flag (a pre-wipe that
//   failed, or none) it wipes as before. A launch that finds the marker deletes a flag left by such a launch; if
//   that delete fails it overwrites the flag with '0' (never trusted), and the delete is retried on every later
//   launch (Sol, AUTH-R1-3). Residuals (iOS only; Android removes Keystore data with the app): (1) an install
//   whose MMKV failed on every launch after a sign-in, then uninstalled before any launch where MMKV opened,
//   leaves the flag in the Keychain, so a reinstall on that phone keeps that install's own last session; (2) the
//   same when MMKV did open on a later launch but SecureStore refused both the flag's delete and its overwrite on
//   that launch, and the app was uninstalled before any launch after it. SecureStore is the only store that
//   works while MMKV is down, and it survives an iOS uninstall, so these cannot be closed without a store that
//   goes with the app's files.
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
/** Set by a pre-wipe: every session key was deleted on an install whose marker could not be read (S5-4). */
const PREWIPED_KEY = `${KEY_PREFIX}.prewiped-v1`;
/** Set when a write could not remove its key from the legacy clear store: the migration then imports nothing. */
const LEGACY_DROP_KEY = `${KEY_PREFIX}.legacy-drop-v1`;
/** The key Firebase Auth's React Native persistence sets and removes on every start to probe the storage. */
const PROBE_KEY = '__sak';
/** Items wiped by their own name (not a Firebase key's header and chunks). */
const RAW_KEYS: ReadonlySet<string> = new Set([MIGRATED_KEY, PREWIPED_KEY]);
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
    // A write made while MMKV was down could not remove its key from the clear copy (S5-5): importing that copy
    // could restore a session the user signed out of, so nothing is imported. A failed read of the flag rejects
    // and the migration is retried, so the import never runs on a flag it could not read.
    const dropAll = (await SecureStore.getItemAsync(LEGACY_DROP_KEY, SECURE_OPTIONS)) === '1';
    const mmkv = openMmkv(LEGACY_MMKV_ID);
    if (dropAll) {
      for (const key of mmkv.getAllKeys()) mmkv.remove(key);
      mmkv.clearAll();
      await SecureStore.setItemAsync(MIGRATED_KEY, '1', SECURE_OPTIONS);
      // After the marker: a crash or failed delete here leaves the flag with the marker set, which is harmless
      // (the marker stops the migration ever reading it; an install wipe deletes the marker, and a later
      // migration then finds the legacy store empty: an install's files never hold another install's copy).
      try {
        await SecureStore.deleteItemAsync(LEGACY_DROP_KEY, SECURE_OPTIONS);
      } catch {
        // Harmless, as above.
      }
      return true;
    }
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

/**
 * Removes `key` from the legacy clear MMKV store (only while the migration is pending). False when MMKV could
 * not be opened: the copy may still be there, and a later launch that opens MMKV could import it.
 */
function dropLegacyCopy(key: string): boolean {
  try {
    openMmkv(LEGACY_MMKV_ID).remove(key);
    return true;
  } catch {
    return false;
  }
}

/** Deletes what an earlier install may have left under `key`: a raw item, or a Firebase key's header and chunks. */
async function deleteSessionItem(key: string): Promise<void> {
  if (RAW_KEYS.has(key)) await SecureStore.deleteItemAsync(key, SECURE_OPTIONS);
  else await secureRemove(secureKeyStem(key));
}

/** The storage keys Firebase Auth's React Native persistence uses for one app (its API key and name). */
export function firebaseSessionKeys(apiKey: string, appName: string): string[] {
  return ['authUser', 'redirectUser', 'persistence'].map((name) => `firebase:${name}:${apiKey}:${appName}`).concat(PROBE_KEY);
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
  /** This run's pre-wipe (at most one per run, shared by concurrent writes, like `attempt`). Never rejects. */
  let prewipe: Promise<void> | null = null;
  /** The legacy-drop flag was stored in this run (no need to store it again). */
  let legacyDropRecorded = false;

  /** Everything an install wipe deletes. The legacy-drop flag is kept: see `checkInstall`. */
  const installWipeSet = () => new Set([...(wipeKeys ?? []), MIGRATED_KEY, PREWIPED_KEY]);

  async function checkInstall(): Promise<void> {
    let marker: string | undefined;
    try {
      marker = openMmkv(INSTALL_MMKV_ID).getString(INSTALL_MARKER);
    } catch {
      // MMKV unavailable: the install is unknown, so reads stay null and the check is retried.
      return;
    }
    if (marker !== undefined) {
      installKnown = true;
      // A pre-wipe on a launch whose MMKV failed leaves the flag behind on an install that has its marker; were
      // it kept, a reinstall would skip its wipe (AUTH-R1-3). If the delete fails the flag is overwritten with
      // '0', which nothing trusts (only '1' is), so this launch leaves no trusted flag either way; the delete is
      // retried on every launch that finds the marker. Both failing on this launch, then an uninstall before the
      // next one, is the header's residual (2).
      try {
        await SecureStore.deleteItemAsync(PREWIPED_KEY, SECURE_OPTIONS);
      } catch {
        try {
          await SecureStore.setItemAsync(PREWIPED_KEY, '0', SECURE_OPTIONS);
        } catch {
          // Residual (2) in the header; the delete is retried at the next launch.
        }
      }
      return;
    }
    // No marker: a new install, unless a pre-wipe of this install already deleted everything under the keys.
    // Only a flag reading exactly '1' is trusted ('0' is one a launch with the marker could not delete). A flag
    // that cannot be read counts as absent (the ordinary wipe: one more sign-out, safe).
    let prewiped = false;
    try {
      prewiped = (await SecureStore.getItemAsync(PREWIPED_KEY, SECURE_OPTIONS)) === '1';
    } catch {
      // As absent.
    }
    if (prewiped) {
      // The flag goes first, then the marker. A crash between the two leaves neither, so the next launch wipes
      // (it loses this install's own session: safe). The other order could leave the flag next to the marker,
      // and a reinstall would then skip its wipe. If the delete fails, nothing is skipped: the ordinary wipe
      // (which retries the flag's delete) runs instead, and the marker is set only once it is done.
      try {
        await SecureStore.deleteItemAsync(PREWIPED_KEY, SECURE_OPTIONS);
      } catch {
        pendingWipe = installWipeSet();
        installKnown = true;
        return;
      }
      installKnown = true;
      try {
        openMmkv(INSTALL_MMKV_ID).set(INSTALL_MARKER, '1');
      } catch {
        // The marker did not stick: no flag and no marker, so the next launch wipes (one more sign-out; safe).
      }
      return;
    }
    // The ordinary wipe also deletes a pre-wipe flag (an unreadable one, say). It keeps the legacy-drop flag on
    // purpose: on an upgrade whose pre-wipe failed, deleting it would let the migration import the clear copy of
    // a session the user signed out of (S5-5). A flag kept from an earlier install is harmless: a new install's
    // files hold no legacy copy, so the migration drops nothing anyone would miss.
    pendingWipe = installWipeSet();
    installKnown = true;
  }

  async function wipe(keys: Set<string>): Promise<void> {
    for (const key of [...keys]) {
      try {
        await deleteSessionItem(key);
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
    // A pre-wipe in flight finishes first, so the check below reads its flag as it ends up, never half-way.
    if (prewipe) await prewipe;
    if (!installKnown) await checkInstall();
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

  /**
   * S5-4. Deletes exactly what the install wipe would delete, then sets the pre-wipe flag, only if every delete
   * succeeded. Order: a crash after the deletes and before the flag leaves no flag, so the next launch wipes
   * (nothing of this install is lost that was not already going to be); a crash after the flag and before the
   * write leaves the keys empty under the flag, which is what the flag says. Any failed delete: no flag, and the
   * write goes ahead as before (the next launch wipes it: fail safe). Not retried in the run: a retry after this
   * run's own writes would only delete them.
   */
  async function runPrewipe(): Promise<void> {
    let ok = true;
    for (const key of installWipeSet()) {
      if (key === PREWIPED_KEY) continue;
      try {
        await deleteSessionItem(key);
      } catch {
        ok = false;
      }
    }
    if (!ok) return;
    try {
      await SecureStore.setItemAsync(PREWIPED_KEY, '1', SECURE_OPTIONS);
    } catch {
      // No flag: the next launch wipes, as before.
    }
  }

  /**
   * Before a set of a session key while the install is unknown: this run's pre-wipe (once), never overlapping
   * `prepare`. Not for Firebase's start-up probe `__sak` (it runs on every start, so it would delete an
   * established install's session on any launch whose MMKV fails once: SR-N1), and not for a remove (it only
   * deletes, so it cannot keep anything of another install). A key outside the wipe set is never wiped either.
   */
  async function prewipeBeforeSet(key: string): Promise<void> {
    if (wipeKeys === undefined || key === PROBE_KEY || !wipeKeys.includes(key)) return;
    // Wait out a prepare in flight (it may learn the install). `attempt` is read and `prewipe` set in the same
    // turn, so a prepare started later sees `prewipe` and waits for it: the two never interleave.
    while (attempt) await attempt;
    if (installKnown) return;
    prewipe ??= runPrewipe();
    await prewipe;
  }

  /**
   * A set or remove made while the migration is pending must not leave the old clear copy behind. When MMKV
   * cannot be opened to remove it, the legacy-drop flag is stored first (awaited: a crash before the write then
   * still drops the copy, losing only a session the user never changed). If the flag cannot be stored either,
   * a set is refused (rejects) rather than made without the guard; a remove still deletes its SecureStore copy,
   * then rejects with the flag's error (see `removeItem`).
   */
  const beforeWrite = async (key: string) => {
    if (migrated || dropLegacyCopy(key) || legacyDropRecorded) return;
    await SecureStore.setItemAsync(LEGACY_DROP_KEY, '1', SECURE_OPTIONS);
    legacyDropRecorded = true;
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
      await prewipeBeforeSet(key);
      await beforeWrite(key);
      await secureSet(secureKeyStem(key), value);
      afterWrite(key);
    },
    removeItem: async (key) => {
      await ready();
      // No pre-wipe (see prewipeBeforeSet). When the legacy guard cannot be recorded, the SecureStore copy is
      // still deleted (a sign-out must not leave the session it ended stored), then the remove rejects with the
      // guard's error rather than resolving: the legacy clear copy may still be there (a later launch that opens
      // MMKV could import it), so the sign-out must not be reported as complete.
      let guardFailed = false;
      let guardError: unknown;
      try {
        await beforeWrite(key);
      } catch (e) {
        guardFailed = true;
        guardError = e;
      }
      await secureRemove(secureKeyStem(key));
      afterWrite(key);
      if (guardFailed) throw guardError;
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
