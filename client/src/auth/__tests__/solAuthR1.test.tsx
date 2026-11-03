// AUTH hardening verifier round 1. Production and acceptance files are read-only.
// Failing tests are counterexamples; sound tests pin reviewed behaviour.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend } from '../../storage/storage';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { createMemoryRemote } from '../../sync/memoryRemote';
import { AccountProvider, useAccount } from '../AccountProvider';
import type { SignInGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser } from '../types';
import { readUnder13Closing, readUnder13Offer, recordUnder13Closing } from '../under13Offer';

const KID: AuthUser = { uid: 'kid', email: 'kid@example.com' };
const OTHER: AuthUser = { uid: 'other', email: 'other@example.com' };

// Same synchronous auth callbacks and controlled failures as solReviewU13r2.
function fakeAuth(initial: AuthUser | null) {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const controls = { signOutFailures: 0 };
  const restoreSession = (next: AuthUser | null) => {
    user = next;
    listeners.forEach((l) => l(next));
  };
  const backend: AuthBackend = {
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn() { throw new AuthError('unknown', 'not used'); },
    async signUp() { throw new AuthError('unknown', 'not used'); },
    signOut: jest.fn(async () => {
      if (controls.signOutFailures > 0) {
        controls.signOutFailures--;
        throw new AuthError('unknown', 'local sign-out failed');
      }
      restoreSession(null);
    }),
    async sendPasswordReset() {},
    async reauthenticate() {},
    async getIdToken() {
      return user ? `h.${btoa(JSON.stringify({ sub: user.uid }))}.s` : null;
    },
  };
  return { ...backend, controls, restoreSession };
}

function switchGate(open: boolean): SignInGate & { set(open: boolean): void } {
  let allowed = open;
  const listeners = new Set<() => void>();
  return {
    allowed: () => allowed,
    subscribe(l) {
      listeners.add(l);
      return () => void listeners.delete(l);
    },
    set(next) {
      allowed = next;
      listeners.forEach((l) => l());
    },
  };
}

function setup(initial: AuthUser | null, gate: SignInGate) {
  const storage = createStorage(memoryBackend());
  const auth = fakeAuth(initial);
  const remote = createMemoryRemote();
  const remoteFor = jest.fn(() => remote);
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} signInGate={gate}>
      {children}
    </AccountProvider>
  );
  return { storage, auth, remote, remoteFor, wrapper };
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 40))));

afterEach(() => jest.restoreAllMocks());

test('AUTH-R1-1: signing out a different restored uid must leave the stored closing alone', async () => {
  const s = setup(OTHER, switchGate(false));
  recordUnder13Closing(s.storage, { uid: KID.uid, email: KID.email! });
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(s.auth.currentUser()).toBeNull());
  await settle();
  const offer = readUnder13Offer(s.storage);
  const closing = readUnder13Closing(s.storage);
  await view.unmount();
  expect(s.remoteFor).not.toHaveBeenCalled();
  expect(s.remote.calls).toHaveLength(0);
  // Expected no offer for KID: only OTHER was signed out. Actual: KID offered, its closing removed.
  expect({ offer, closing }).toEqual({ offer: null, closing: { uid: KID.uid, email: KID.email } });
});

test('AUTH-R1-2: an ordinary sign-out in one tab retires the other tab\'s closing too', async () => {
  jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  const gate = switchGate(true);
  const s = setup(KID, gate);
  // Two provider instances model tabs sharing durable device state and SDK auth notifications.
  const first = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  const second = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(first.result.current.status).toBe('signedIn'));
  await waitFor(() => expect(second.result.current.status).toBe('signedIn'));
  await settle();
  s.auth.controls.signOutFailures = 2;
  await act(async () => gate.set(false));
  await settle();
  expect(s.auth.signOut).toHaveBeenCalledTimes(2);
  expect(s.auth.currentUser()).toEqual(KID);
  expect(readUnder13Closing(s.storage)).toEqual({ uid: KID.uid, email: KID.email });
  const callsBefore = s.remote.calls.length;
  await act(async () => first.result.current.signOut());
  await settle();
  const offer = readUnder13Offer(s.storage);
  await first.unmount();
  await second.unmount();
  expect(s.auth.currentUser()).toBeNull();
  expect(s.remote.calls.length).toBe(callsBefore);
  // Expected no offer after ordinary sign-out. Actual: the second tab consumes its stale memory copy.
  expect(offer).toBeNull();
});

test('sound: a first null auth report after the gate sign-out recovers the stored closing as an offer', async () => {
  const s = setup(null, switchGate(false));
  recordUnder13Closing(s.storage, { uid: KID.uid, email: KID.email! });
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.under13Offer).toEqual({ email: KID.email }));
  await view.unmount();
  expect(readUnder13Closing(s.storage)).toBeNull();
  expect(readUnder13Offer(s.storage)).toEqual({ uid: KID.uid, email: KID.email });
  expect(s.remoteFor).not.toHaveBeenCalled();
  expect(s.auth.signOut).not.toHaveBeenCalled();
});

// Native fakes from securityReview5, with the per-call SecureStore failure guard used by
// secureSessionInstall. Keychain survives uninstall; MMKV files do not.
type Persisted = { getItem(k: string): Promise<string | null>; setItem(k: string, v: string): Promise<void>; removeItem(k: string): Promise<void> };
const API_KEY = 'test-api-key';
const KEY = `firebase:authUser:${API_KEY}:[DEFAULT]`;
const NEW = JSON.stringify({ uid: 'new-account', stsTokenManager: { refreshToken: 'NEW-REFRESH' } });
const PREWIPED = 'bible-app-auth.prewiped-v1';
let secure: Map<string, string>;
let mmkvs: Map<string, Map<string, string>>;
let mmkvDown: boolean;
let refuse: (op: 'get' | 'set' | 'delete', key: string) => boolean;
let persisted: Persisted | undefined;

function mockNative() {
  const guard = (op: 'get' | 'set' | 'delete', key: string) => {
    if (refuse(op, key)) throw new Error('SecureStore temporarily unavailable');
  };
  jest.doMock('expo-secure-store', () => ({
    AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY: 'AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY',
    getItemAsync: async (k: string) => (guard('get', k), secure.get(k) ?? null),
    setItemAsync: async (k: string, v: string) => (guard('set', k), void secure.set(k, v)),
    deleteItemAsync: async (k: string) => (guard('delete', k), void secure.delete(k)),
  }));
  jest.doMock('react-native-mmkv', () => ({
    createMMKV: (config: { id?: string } = {}) => {
      if (mmkvDown) throw new Error('MMKV failed to initialise');
      const id = config.id ?? 'mmkv.default';
      let data = mmkvs.get(id);
      if (!data) mmkvs.set(id, (data = new Map()));
      const m = data;
      return {
        getString: (k: string) => m.get(k),
        set: (k: string, v: string) => void m.set(k, String(v)),
        remove: (k: string) => m.delete(k),
        getAllKeys: () => [...m.keys()],
        clearAll: () => m.clear(),
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

describe('native install flags', () => {
  beforeEach(() => {
    secure = new Map();
    mmkvs = new Map();
    mmkvDown = false;
    refuse = () => false;
  });
  afterEach(() => {
    for (const m of ['expo-secure-store', 'react-native-mmkv', 'firebase/auth', 'firebase/firestore', '../firebaseCore']) jest.dontMock(m);
  });

  test('AUTH-R1-3: a launch that opens MMKV must not leave a flag that restores its session after reinstall', async () => {
    await startApp().setItem(KEY, NEW); // install already has a durable marker
    mmkvDown = true;
    await startApp().setItem(KEY, NEW); // temporary outage on a later launch creates the pre-wipe flag
    expect(secure.get(PREWIPED)).toBe('1');
    mmkvDown = false;
    refuse = (op, k) => op === 'delete' && k === PREWIPED;
    // MMKV DID open after the sign-in, unlike the card's sole residual. Its marker is present.
    expect(await startApp().getItem(KEY)).toBe(NEW);
    expect(mmkvs.get('bible-app-install')?.get('auth-keychain-wiped-v1')).toBe('1');
    mmkvs.clear(); // uninstall: app files go, Keychain remains
    refuse = () => false;
    // Expected signed out. Actual: the stale pre-wipe flag bypasses the reinstall wipe, restoring NEW.
    expect(await startApp().getItem(KEY)).toBeNull();
  });

  test('sound: without cleanup failure, recovery with an existing marker makes the next reinstall signed out', async () => {
    await startApp().setItem(KEY, NEW);
    mmkvDown = true;
    await startApp().setItem(KEY, NEW);
    mmkvDown = false;
    expect(await startApp().getItem(KEY)).toBe(NEW);
    expect(secure.has(PREWIPED)).toBe(false);
    mmkvs.clear();
    expect(await startApp().getItem(KEY)).toBeNull();
  });
});
