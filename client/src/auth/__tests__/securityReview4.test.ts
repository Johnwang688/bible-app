// Security review round 4 (R-6b follow-up): the native session store, App Check on the web, and the Under 13 delete
// offer. Reviewer-owned. A test named "S4-n ..." encodes a finding and fails on the code as reviewed; a test named
// "sound: ..." records something checked and found correct (it passes).
import { act, renderHook, waitFor } from '@testing-library/react-native';
import { createElement, type ReactNode } from 'react';
import { z } from 'zod';

import { createStorage, memoryBackend, type Storage, type StorageKey } from '../../storage/storage';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { createMemoryRemote } from '../../sync/memoryRemote';
import { AccountProvider, useAccount } from '../AccountProvider';
import { SIGN_IN_OFF, storageGate, type SignInGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser, type SignInMethod } from '../types';
import { readUnder13Offer, recordUnder13Offer } from '../under13Offer';

// ---- Provider harness -------------------------------------------------------------------------------------------

const KID = { uid: 'kid-uid', email: 'kid@example.com', password: 'kid-secret-pw-9' };
const ADULT = { uid: 'adult-uid', email: 'adult@example.com', password: 'adult-secret-pw-7' };
const ACCOUNTS = [KID, ADULT];

function fakeAuth(initial: AuthUser | null = null) {
  let user: AuthUser | null = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const backend: AuthBackend & { log: string[]; failSignOuts: number } = {
    log: [],
    failSignOuts: 0,
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
      if (backend.failSignOuts > 0) {
        backend.failSignOuts--;
        throw new Error('keychain busy');
      }
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

function mount(opts: { auth: ReturnType<typeof fakeAuth>; storage: Storage; gate: SignInGate; deleteRequest?: (t: string) => Promise<void> }) {
  const remote = createMemoryRemote();
  const deleteRequest = jest.fn(opts.deleteRequest ?? (async () => undefined));
  const wrapper = ({ children }: { children: ReactNode }) =>
    createElement(
      AccountProvider,
      { auth: opts.auth, storage: opts.storage, remoteFor: () => remote, domains: DOMAINS, signInGate: opts.gate, deleteAccountRequest: deleteRequest },
      children,
    );
  return { deleteRequest, wrapper };
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 40))));

// ---- S4-3: the offer appears for an account nobody said was under 13 --------------------------------------------

describe('S4-3 (medium): the Under 13 offer is recorded whenever a closed gate signs someone out', () => {
  // R-7a's gate "should also stay closed while the first-run state is unknown (the intro not finished)"
  // (signInGate.ts). On iOS the Keychain (and so the Firebase session, now in expo-secure-store) survives an
  // uninstall while the app's MMKV data does not: an adult who reinstalls opens the app with a restored session and
  // an unknown age. The closed gate signs them out (correct), and offerDelete then records the Under 13 offer, so
  // the signed-out card leads with "Delete account and synced data" for an adult who never picked Under 13, and it
  // stays after they finish the intro as 13+ (only a sign-in clears it). The provider infers "picked Under 13" from
  // "the gate is closed"; the gate has more reasons than that.
  const ageKey: StorageKey<'under13' | 'over13' | null> = {
    key: 'test.ageChoice',
    version: 1,
    schema: z.enum(['under13', 'over13']).nullable(),
    fallback: null,
  };

  test('S4-3 a session restored while the age is still unknown is signed out without an Under 13 offer', async () => {
    const storage = createStorage(memoryBackend());
    const gate = storageGate(storage, ageKey, (age) => age === 'over13'); // closed while unknown or under 13
    const auth = fakeAuth({ uid: ADULT.uid, email: ADULT.email }); // the Keychain session after a reinstall
    const { wrapper } = mount({ auth, storage, gate });
    const view = await renderHook(() => useAccount(), { wrapper });
    await waitFor(() => expect(auth.currentUser()).toBeNull()); // sound: the closed gate signs the session out
    await settle();
    // Expected: no offer (nobody picked Under 13). Actual: { email: 'adult@example.com' }.
    expect(view.result.current.under13Offer).toBeNull();
    // ...and none once the intro is finished as 13+.
    await act(async () => storage.set(ageKey, 'over13'));
    await settle();
    expect(view.result.current.under13Offer).toBeNull();
  });
});

// ---- S4-4: the offer comes back for the account the offer just deleted ------------------------------------------

describe('S4-4 (low): after a successful offered delete whose first sign-out fails, the offer is recorded again', () => {
  // finishDeleted sets blockedUid and tries auth.signOut(); if that fails the user stays signed in, so enforceGate
  // signs out once the hold ends. setUser(null) then clears blockedUid (a different account, none, lifts the block)
  // before enforceGate calls offerDelete(who), so offerDelete's `who.uid === blockedUid` guard never matches: the
  // offer for the deleted account is recorded again. The card then offers to delete an account that no longer
  // exists; the retry's re-auth fails with "wrong password". (The same applies to deleteAccount when the gate closes
  // around a failed sign-out.)
  test('S4-4 the offer is gone after the account was deleted', async () => {
    const storage = createStorage(memoryBackend());
    recordUnder13Offer(storage, { uid: KID.uid, email: KID.email });
    const auth = fakeAuth(null);
    const { wrapper, deleteRequest } = mount({
      auth,
      storage,
      gate: SIGN_IN_OFF,
      deleteRequest: async () => {
        auth.failSignOuts = 1; // the server deleted it; the first local sign-out fails (transient)
      },
    });
    const view = await renderHook(() => useAccount(), { wrapper });
    await waitFor(() => expect(view.result.current.under13Offer).toEqual({ email: KID.email }));

    await act(async () => view.result.current.deleteOfferedAccount(KID.password));
    await settle();

    expect(deleteRequest).toHaveBeenCalledTimes(1);
    expect(auth.currentUser()).toBeNull(); // sound: it ends signed out
    // Expected: no offer. Actual: the offer for the deleted account, recorded again by enforceGate.
    expect(readUnder13Offer(storage)).toBeNull();
    expect(view.result.current.under13Offer).toBeNull();
  });
});

// ---- Sound: the offer -----------------------------------------------------------------------------------------

describe('sound: the Under 13 offer', () => {
  test('sound: neither the password nor the email is logged when the offered delete fails, and the offer stays', async () => {
    const storage = createStorage(memoryBackend());
    recordUnder13Offer(storage, { uid: KID.uid, email: KID.email });
    const auth = fakeAuth(null);
    auth.failSignOuts = 1;
    const { wrapper } = mount({
      auth,
      storage,
      gate: SIGN_IN_OFF,
      deleteRequest: async () => {
        throw new AuthError('network', 'delete account timed out');
      },
    });
    const spies = (['log', 'warn', 'error', 'info', 'debug'] as const).map((m) => jest.spyOn(console, m).mockImplementation(() => undefined));
    try {
      const view = await renderHook(() => useAccount(), { wrapper });
      await waitFor(() => expect(view.result.current.under13Offer).not.toBeNull());
      await act(async () => {
        await expect(view.result.current.deleteOfferedAccount('wrong-password-123')).rejects.toBeInstanceOf(AuthError);
        await expect(view.result.current.deleteOfferedAccount(KID.password)).rejects.toMatchObject({ kind: 'network' });
      });
      await settle();
      const logged = JSON.stringify(spies.flatMap((s) => s.mock.calls), (_k, v: unknown) => (v instanceof Error ? `${v.message} ${String(v.cause)}` : v));
      expect(logged).not.toContain('wrong-password-123');
      expect(logged).not.toContain(KID.password);
      expect(logged).not.toContain(KID.email);
      expect(auth.currentUser()).toBeNull();
      expect(view.result.current.under13Offer).toEqual({ email: KID.email });
    } finally {
      spies.forEach((s) => s.mockRestore());
    }
  });

  test('sound: the re-auth can only ever delete the offered account (another account signed in is refused first)', async () => {
    const storage = createStorage(memoryBackend());
    recordUnder13Offer(storage, { uid: KID.uid, email: KID.email });
    const auth = fakeAuth({ uid: ADULT.uid, email: ADULT.email });
    const open = { allowed: () => true, subscribe: () => () => undefined };
    const { wrapper, deleteRequest } = mount({ auth, storage, gate: open });
    const view = await renderHook(() => useAccount(), { wrapper });
    await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
    await act(async () => {
      await expect(view.result.current.deleteOfferedAccount(KID.password)).rejects.toBeInstanceOf(AuthError);
    });
    expect(deleteRequest).not.toHaveBeenCalled();
    expect(auth.log.filter((l) => l.startsWith('signIn'))).toEqual([]);
    expect(auth.currentUser()?.uid).toBe(ADULT.uid);
  });
});

// ---- S4-2: the Under 13 delete on the web carries no App Check token --------------------------------------------

describe('S4-2 (medium): web App Check starts only with Firestore, which the Under 13 delete never creates', () => {
  // appCheck.ts: ensureAppCheck runs from getFirebaseDb() only. deleteAccount happens to create Firestore first
  // (readHasData -> remoteFor -> getFirebaseDb), but deleteOfferedAccount runs signed out behind a closed gate and
  // never touches Firestore (by design: no remote call). So getAppCheckToken() is null and DELETE /api/v1/account goes
  // without X-Firebase-AppCheck. Monitor mode logs it as "missing" (skewing the metrics the runbook says to read);
  // once APP_CHECK_MODE=enforce, every Under 13 delete on the web is a 401 and the child's account cannot be deleted
  // from the offer. docs/app-check.md's "When to enforce" does not mention it.
  const initializeAppCheck = jest.fn((_app: unknown, _opts: unknown) => ({ id: 'appcheck' }));
  const getToken = jest.fn(async (_ac: unknown, _force?: boolean) => ({ token: 'web-ac-token' }));
  const ReCaptchaEnterpriseProvider = jest.fn(function (this: { siteKey: string }, siteKey: string) {
    this.siteKey = siteKey;
  });

  type Web = {
    getFirebaseAuth(): unknown;
    getFirebaseDb(): unknown;
    createAccountApi: typeof import('../accountApi').createAccountApi;
  };

  function loadWeb(): Web {
    jest.resetModules();
    jest.doMock('firebase/app-check', () => ({ initializeAppCheck, getToken, ReCaptchaEnterpriseProvider }));
    jest.doMock('firebase/auth', () => ({ getAuth: jest.fn(() => ({ kind: 'auth' })) }));
    jest.doMock('firebase/firestore', () => ({ getFirestore: jest.fn(() => ({ kind: 'db' })) }));
    jest.doMock('../firebaseCore', () => ({
      getFirebaseApp: () => ({ name: '[DEFAULT]' }),
      withAuthEmulator: (a: unknown) => a,
      withFirestoreEmulator: (d: unknown) => d,
    }));
    // jest-expo resolves './appCheck' to the native file; the web build gets appCheck.ts.
    jest.doMock('../appCheck', () => jest.requireActual('../appCheck.ts'));
    // One module registry (no isolateModules): accountApi loads './appCheck' lazily, at request time, from it.
    /* eslint-disable @typescript-eslint/no-require-imports */
    const app = require('../firebaseApp.ts') as { getFirebaseAuth(): unknown; getFirebaseDb(): unknown };
    const api = require('../accountApi') as typeof import('../accountApi');
    /* eslint-enable @typescript-eslint/no-require-imports */
    const web: Web = { getFirebaseAuth: app.getFirebaseAuth, getFirebaseDb: app.getFirebaseDb, createAccountApi: api.createAccountApi };
    return web;
  }

  const okFetch = () => jest.fn(async (_url: string, _init?: RequestInit) => new Response(null, { status: 204 }));
  const appCheckHeader = (f: ReturnType<typeof okFetch>) => new Headers(f.mock.calls[0]![1]!.headers).get('X-Firebase-AppCheck');

  beforeEach(() => {
    initializeAppCheck.mockClear();
    getToken.mockClear();
    ReCaptchaEnterpriseProvider.mockClear();
  });
  afterEach(() => {
    for (const m of ['firebase/app-check', 'firebase/auth', 'firebase/firestore', '../firebaseCore', '../appCheck']) jest.dontMock(m);
  });

  test('sound: with Firestore created first (the ordinary delete), the request carries the App Check token', async () => {
    const web = loadWeb();
    web.getFirebaseAuth();
    web.getFirebaseDb();
    const fetch = okFetch();
    await web.createAccountApi({ baseUrl: 'https://api.test', fetch }).deleteAccount('id-token');
    expect(appCheckHeader(fetch)).toBe('web-ac-token');
  });

  test('sound: Auth alone (signed out) never loads reCAPTCHA', () => {
    const web = loadWeb();
    web.getFirebaseAuth();
    expect(initializeAppCheck).not.toHaveBeenCalled();
    expect(ReCaptchaEnterpriseProvider).not.toHaveBeenCalled();
  });

  test('S4-2 the offered delete (Auth only, no Firestore) still sends X-Firebase-AppCheck', async () => {
    const web = loadWeb();
    web.getFirebaseAuth(); // the re-auth; deleteOfferedAccount never calls remoteFor / getFirebaseDb
    const fetch = okFetch();
    await web.createAccountApi({ baseUrl: 'https://api.test', fetch }).deleteAccount('id-token');
    // Expected: 'web-ac-token'. Actual: null (no header), a 401 once the backend enforces App Check.
    expect(appCheckHeader(fetch)).toBe('web-ac-token');
  });
});

// ---- S4-5: the migration brings back a session the user signed out of --------------------------------------------

describe('S4-5 (low): a failed one-time migration later restores a signed-out session from the clear MMKV copy', () => {
  // migrateLegacyMmkv runs once per process (`migrated ??= ...`); when it fails (for example SecureStore refuses
  // reads before the first unlock on iOS), it leaves the clear MMKV copy and is retried only on the next start. In
  // the meantime the store works on SecureStore alone: the user may sign in and sign out (removeItem touches only
  // SecureStore). On the next start the migration finds SecureStore empty and imports the old clear copy, so the
  // user who signed out is signed in again (Firebase sign-out does not revoke the refresh token it held).
  let secure: Map<string, string>;
  let mmkv: Map<string, string>;
  let failGets: number;
  const KEY = 'firebase:authUser:AIzaSyApR7OouIzj9sSiZCpFo7FFijlOUTq6_X4:[DEFAULT]';

  type Store = { getItem(k: string): Promise<string | null>; setItem(k: string, v: string): Promise<void>; removeItem(k: string): Promise<void> };

  function start(): { store: Store; secureKeyStem(key: string): string } {
    jest.resetModules();
    jest.doMock('expo-secure-store', () => ({
      AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY: 'AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY',
      getItemAsync: async (k: string) => {
        if (failGets > 0) {
          failGets--;
          throw new Error('User interaction is not allowed.'); // errSecInteractionNotAllowed, before first unlock
        }
        return secure.get(k) ?? null;
      },
      setItemAsync: async (k: string, v: string) => void secure.set(k, v),
      deleteItemAsync: async (k: string) => void secure.delete(k),
    }));
    jest.doMock('react-native-mmkv', () => ({
      createMMKV: () => ({
        getAllKeys: () => [...mmkv.keys()],
        getString: (k: string) => mmkv.get(k),
        remove: (k: string) => mmkv.delete(k),
        clearAll: () => mmkv.clear(),
      }),
    }));
    jest.doMock('firebase/auth', () => ({ initializeAuth: jest.fn(() => ({})), getReactNativePersistence: jest.fn(() => ({})) }));
    jest.doMock('firebase/firestore', () => ({ initializeFirestore: jest.fn(() => ({})) }));
    jest.doMock('../firebaseCore', () => ({ getFirebaseApp: () => ({}), withAuthEmulator: (a: unknown) => a, withFirestoreEmulator: (d: unknown) => d }));
    let mod!: typeof import('../firebaseApp.native');
    jest.isolateModules(() => {
      // eslint-disable-next-line @typescript-eslint/no-require-imports
      mod = require('../firebaseApp.native');
    });
    return { store: mod.createSecureAuthStorage(), secureKeyStem: mod.secureKeyStem };
  }

  beforeEach(() => {
    secure = new Map();
    mmkv = new Map();
    failGets = 0;
  });
  afterEach(() => {
    for (const m of ['expo-secure-store', 'react-native-mmkv', 'firebase/auth', 'firebase/firestore', '../firebaseCore']) jest.dontMock(m);
  });

  test('S4-5 sign out after a failed migration, restart: still signed out', async () => {
    mmkv.set(KEY, '{"uid":"old","stsTokenManager":{"refreshToken":"OLD-REFRESH"}}'); // R-6b's first build, in clear
    // Start 1: the migration's first SecureStore read fails; everything after it works.
    failGets = 1;
    const first = start().store;
    expect(await first.getItem(KEY)).toBeNull();
    await first.setItem(KEY, '{"uid":"new","stsTokenManager":{"refreshToken":"NEW-REFRESH"}}'); // signs in again
    await first.removeItem(KEY); // and signs out
    // Start 2.
    const second = start().store;
    // Expected: null (signed out). Actual: the old clear session, imported from MMKV.
    expect(await second.getItem(KEY)).toBeNull();
  });

  test('sound: a successful migration moves the clear copy and leaves none in MMKV; later starts never read MMKV', async () => {
    mmkv.set(KEY, 'legacy-session');
    const { store } = start();
    expect(await store.getItem(KEY)).toBe('legacy-session');
    expect(mmkv.size).toBe(0);
    await store.removeItem(KEY);
    mmkv.set(KEY, 'planted-later');
    expect(await start().store.getItem(KEY)).toBeNull();
  });

  test('sound: the key encoding is one-to-one on random keys and never collides with the header/chunk suffixes', () => {
    const { secureKeyStem } = start();
    const alphabet = ['a', 'Z', '0', '-', '_', '.', ':', '[', ']', 'é', '0', '3', 'a', 'h', '😀'];
    const seen = new Map<string, string>();
    let seed = 7;
    const rand = () => (seed = (seed * 1103515245 + 12345) % 2 ** 31) / 2 ** 31;
    for (let n = 0; n < 4000; n++) {
      let key = '';
      const len = 1 + Math.floor(rand() * 8);
      for (let i = 0; i < len; i++) key += alphabet[Math.floor(rand() * alphabet.length)];
      const stem = secureKeyStem(key);
      expect(stem).toMatch(/^bible-app-auth\.k\.[A-Za-z0-9_-]+$/);
      const prior = seen.get(stem);
      if (prior !== undefined) expect(prior).toBe(key);
      seen.set(stem, key);
    }
  });
});
