// PARKED for John (claude-workflows 5a step 5): every S5 finding repeats a class implementer-hard already fixed in
// round 4 (S5-1/2/3: the S4-1 held-back-clock class; S5-4/5: the S4-5 session store under an MMKV failure; S5-6: the
// S4-3 offer recording). Confirmed failing by the orchestrator; the "sound:" tests stay on. Fix designs are in the
// reviewer's notes (C:/dev/bible-app-work/r6b/R6b-security-r5-result.json) and the PR.
// Security review round 5 (R-6b follow-up): the fixes for round 4 in the native session store (firebaseApp.native.ts:
// the migration retry, the legacy-copy removal, the reinstall wipe) and in the Under 13 offer recording
// (AccountProvider.tsx, S4-3). Reviewer-owned. A test named "S5-n ..." encodes a finding and fails on the code as
// reviewed; a test named "sound: ..." records something checked and found correct (it passes).
import { act, renderHook, waitFor } from '@testing-library/react-native';
import { createElement, type ReactNode } from 'react';
import { z } from 'zod';

import { createStorage, memoryBackend, type Storage, type StorageKey } from '../../storage/storage';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { AccountProvider, useAccount } from '../AccountProvider';
import { storageGate, type SignInGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser, type SignInMethod } from '../types';
import { readUnder13Offer } from '../under13Offer';

// ==== The native session store ===================================================================================

type Persisted = { getItem(k: string): Promise<string | null>; setItem(k: string, v: string): Promise<void>; removeItem(k: string): Promise<void> };

const API_KEY = 'AIzaSyApR7OouIzj9sSiZCpFo7FFijlOUTq6_X4';
const KEY = `firebase:authUser:${API_KEY}:[DEFAULT]`;
const OLD = JSON.stringify({ uid: 'old-account', stsTokenManager: { refreshToken: 'OLD-REFRESH'.repeat(300) } });
const NEW = JSON.stringify({ uid: 'new-account', stsTokenManager: { refreshToken: 'NEW-REFRESH' } });

/** The Keychain / Keystore: survives an uninstall on iOS. */
let secure: Map<string, string>;
/** MMKV stores by id (app files). */
let mmkvs: Map<string, Map<string, string>>;
/** While true, opening any MMKV store throws (react-native-mmkv failing to initialise, a full or unwritable disk). */
let mmkvDown: boolean;
let persisted: Persisted | undefined;

function mmkv(id: string): Map<string, string> {
  let m = mmkvs.get(id);
  if (!m) mmkvs.set(id, (m = new Map()));
  return m;
}

function mockNative() {
  jest.doMock('expo-secure-store', () => ({
    AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY: 'AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY',
    getItemAsync: async (k: string) => secure.get(k) ?? null,
    setItemAsync: async (k: string, v: string) => void secure.set(k, v),
    deleteItemAsync: async (k: string) => void secure.delete(k),
  }));
  jest.doMock('react-native-mmkv', () => ({
    createMMKV: (config: { id?: string } = {}) => {
      if (mmkvDown) throw new Error('MMKV failed to initialise');
      const data = mmkv(config.id ?? 'mmkv.default');
      return {
        getString: (k: string) => data.get(k),
        set: (k: string, v: string) => void data.set(k, String(v)),
        remove: (k: string) => data.delete(k),
        getAllKeys: () => [...data.keys()],
        clearAll: () => data.clear(),
      };
    },
  }));
  jest.doMock('firebase/auth', () => ({
    initializeAuth: jest.fn(() => ({})),
    getReactNativePersistence: jest.fn((storage: Persisted) => {
      persisted = storage;
      return { type: 'LOCAL' };
    }),
  }));
  jest.doMock('firebase/firestore', () => ({ initializeFirestore: jest.fn(() => ({})) }));
  jest.doMock('../firebaseCore', () => ({
    getFirebaseApp: () => ({ name: '[DEFAULT]', options: { apiKey: API_KEY } }),
    withAuthEmulator: (a: unknown) => a,
    withFirestoreEmulator: (d: unknown) => d,
  }));
}

/** A new process: loads firebaseApp.native.ts fresh and returns the storage Firebase Auth was given. */
function startApp(): Persisted {
  persisted = undefined;
  jest.resetModules();
  mockNative();
  jest.isolateModules(() => {
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    (require('../firebaseApp.native') as typeof import('../firebaseApp.native')).getFirebaseAuth();
  });
  if (!persisted) throw new Error('no storage');
  return persisted;
}

describe('the native session store and an MMKV failure', () => {
  beforeEach(() => {
    secure = new Map();
    mmkvs = new Map();
    mmkvDown = false;
  });
  afterEach(() => {
    for (const m of ['expo-secure-store', 'react-native-mmkv', 'firebase/auth', 'firebase/firestore', '../firebaseCore']) jest.dontMock(m);
  });

  test('sound: a reinstall (Keychain kept, app files gone) starts signed out, and the new session then persists', async () => {
    await startApp().setItem(KEY, OLD);
    mmkvs.clear(); // uninstall
    const s = startApp();
    expect(await s.getItem(KEY)).toBeNull();
    await s.setItem(KEY, NEW);
    expect(await startApp().getItem(KEY)).toBe(NEW);
  });

  // S5-4. createSecureAuthStorage: while the install marker cannot be read (MMKV throws), `installKnown` stays false
  // and every read is null, but setItem still writes to SecureStore, and afterWrite only clears keys from
  // `pendingWipe`, which is null then. Once MMKV opens (the next launch), checkInstall finds no marker and queues a
  // wipe of every session key, including the one this install's own sign-in wrote. The person signed in on this
  // install, and is signed out at the next start. A sign-in right after install is wiped. (Safe direction; the fix
  // card's "a set or remove of it counts as wiping it" does not hold while the install is unknown.)
  test.skip('S5-4 (low): a sign-in made on a new install while MMKV is unavailable survives the next start', async () => {
    mmkvDown = true; // the whole first launch: the install marker cannot be read or written
    const s = startApp();
    expect(await s.getItem(KEY)).toBeNull(); // sound: unknown install reads as signed out
    await s.setItem(KEY, NEW); // the person signs in on this install
    mmkvDown = false; // the next launch: MMKV works
    // Expected: NEW (written by this install, nothing of an earlier install). Actual: null (wiped as a reinstall's).
    expect(await startApp().getItem(KEY)).toBe(NEW);
  });

  // S5-5. On an upgrade from R-6b's first build the clear MMKV store `bible-app-auth` holds a session. While MMKV
  // cannot be opened, the migration fails (it is retried), and beforeWrite's dropLegacyCopy fails silently ("MMKV
  // unavailable: then the migration cannot import from it either"). That holds only while MMKV stays down: when it
  // opens again (the next launch), the migration finds the key empty in SecureStore (the person signed out) and
  // imports the old clear copy. Someone who, in the run before, signed in to another account and signed out, starts
  // signed in to the old account; the header's "a session the user signed out of can never come back from the old
  // clear copy" does not hold across an MMKV failure.
  test.skip('S5-5 (low): after a sign-in and sign-out made while MMKV was down, the next start is still signed out', async () => {
    mmkv('bible-app-auth').set(KEY, OLD); // R-6b's first build left this session in clear
    mmkvDown = true;
    const s = startApp();
    expect(await s.getItem(KEY)).toBeNull(); // signed out (the old session is not visible this run)
    await s.setItem(KEY, NEW); // signs in to another account...
    await s.removeItem(KEY); // ...and signs out
    mmkvDown = false; // the next launch
    // Expected: null (signed out). Actual: OLD, the first build's account, with its refresh token.
    expect(await startApp().getItem(KEY)).toBeNull();
  });
});

// ==== The Under 13 offer ===========================================================================================

const KID = { uid: 'kid-uid', email: 'kid@example.com', password: 'kid-secret-pw-9' };
const ACCOUNTS = [KID];

function fakeAuth(initial: AuthUser | null = null) {
  let user: AuthUser | null = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const backend: AuthBackend & { log: string[] } = {
    log: [],
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m: SignInMethod) {
      backend.log.push(`signIn:${m.email}`);
      const a = ACCOUNTS.find((x) => x.email === m.email && x.password === m.password);
      if (!a) throw new AuthError('wrong-credentials');
      set({ uid: a.uid, email: a.email });
      return { uid: a.uid, email: a.email };
    },
    async signUp() {
      throw new AuthError('unknown');
    },
    async signOut() {
      backend.log.push('signOut');
      set(null);
    },
    async sendPasswordReset() {},
    async reauthenticate() {},
    async getIdToken() {
      return user ? `h.${btoa(JSON.stringify({ sub: user.uid }))}.s` : null;
    },
  };
  return backend;
}

function wrapperFor(opts: { auth: AuthBackend; storage: Storage; gate: SignInGate; remote: MemoryRemote }) {
  const Wrapper = ({ children }: { children: ReactNode }) =>
    createElement(
      AccountProvider,
      {
        auth: opts.auth,
        storage: opts.storage,
        remoteFor: () => opts.remote,
        domains: DOMAINS,
        signInGate: opts.gate,
        deleteAccountRequest: async () => undefined,
      },
      children,
    );
  return Wrapper;
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 40))));

const ageKey: StorageKey<'under13' | 'over13' | null> = {
  key: 'test.ageChoice',
  version: 1,
  schema: z.enum(['under13', 'over13']).nullable(),
  fallback: null,
};

describe('S5-6 (low): Under 13 picked while signed in, then the app closed before the gate signed out: no offer', () => {
  // AccountProvider (S4-3 fix): the offer is recorded only when enforceGate's sign-out of `closedOnUid` succeeds, and
  // closedOnUid lives in memory. enforceGate first waits for in-flight sign-outs/deletes and the reconcile chain,
  // whose engine stop() waits for the sync run in flight (seconds on a slow network: a pull from the server). If the
  // app is closed (or the web page reloaded) in that window, or the gate's sign-out fails, the session stays persisted;
  // the next launch restores it with the gate already closed, which S4-3 deliberately treats as "never picked Under
  // 13": signed out with no offer. The child's account and synced data stay on the server and the card never offers
  // to delete them, although Under 13 was picked while that account was signed in. Fix: persist the "closed on uid"
  // fact (or record the offer) when the gate closes on a signed-in account, before the sign-out, and drop it if the
  // gate opens again.
  test.skip('S5-6 the next launch offers to delete the account that was signed in when Under 13 was picked', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(ageKey, 'over13');
    const gate = storageGate(storage, ageKey, (age) => age === 'over13');
    const auth = fakeAuth({ uid: KID.uid, email: KID.email });
    const remote = createMemoryRemote();
    const first = await renderHook(() => useAccount(), { wrapper: wrapperFor({ auth, storage, gate, remote }) });
    await waitFor(() => expect(first.result.current.status).toBe('signedIn'));
    await settle();

    const slow = remote.hold('pullSettings'); // a sync run in flight on a slow network
    const run = first.result.current.syncNow();
    await act(async () => {
      await slow.started;
    });
    await act(async () => storage.set(ageKey, 'under13')); // Under 13 picked while signed in
    await settle();
    expect(auth.currentUser()?.uid).toBe(KID.uid); // the gate's sign-out waits for the engine to stop
    expect(auth.log).not.toContain('signOut');

    await act(async () => first.unmount()); // the app is closed
    slow.release();
    await act(async () => {
      await run.catch(() => undefined);
    });
    await settle();

    // The next launch: the session is restored with the gate closed.
    const second = await renderHook(() => useAccount(), { wrapper: wrapperFor({ auth, storage, gate, remote }) });
    await waitFor(() => expect(auth.currentUser()).toBeNull()); // sound: the closed gate signs it out
    await settle();
    // Expected: the offer for the account that was signed in when Under 13 was picked. Actual: null.
    expect(readUnder13Offer(storage)).toMatchObject({ uid: KID.uid, email: KID.email });
    expect(second.result.current.under13Offer).toEqual({ email: KID.email });
  });

  test('sound: without the interruption, the gate signs the account out and records the offer', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(ageKey, 'over13');
    const gate = storageGate(storage, ageKey, (age) => age === 'over13');
    const auth = fakeAuth({ uid: KID.uid, email: KID.email });
    const remote = createMemoryRemote();
    const view = await renderHook(() => useAccount(), { wrapper: wrapperFor({ auth, storage, gate, remote }) });
    await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
    await act(async () => storage.set(ageKey, 'under13'));
    await waitFor(() => expect(auth.currentUser()).toBeNull());
    await settle();
    expect(view.result.current.under13Offer).toEqual({ email: KID.email });
  });
});
