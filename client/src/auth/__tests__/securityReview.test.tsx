// Security review probes for the client auth layer (R6b-security). Tests named "FINDING" assert the
// secure behaviour and are expected to FAIL on the reviewed code; "sound" tests pass and document
// checks that held.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS, setNote } from '../../sync/__tests__/fixtures';
import { createAccountApi } from '../accountApi';
import { AccountProvider, useAccount } from '../AccountProvider';
import { firebaseEmulatorsEnabled } from '../firebaseConfig';
import { AuthError, type AuthBackend, type AuthUser, type SignInMethod } from '../types';

const ALICE: AuthUser = { uid: 'alice', email: 'alice@example.com' };
const BOB: AuthUser = { uid: 'bob', email: 'bob@example.com' };

interface FakeAuth extends AuthBackend {
  log: string[];
  /** Another tab (web shares the auth state across tabs) or the SDK switches the current user. */
  switchTo(user: AuthUser | null): void;
}

function fakeAuth(initial: AuthUser | null): FakeAuth {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const passwords = new Map([
    ['alice@example.com', 'alice pw'],
    ['bob@example.com', 'bob pw'],
  ]);
  const log: string[] = [];
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const check = (m: SignInMethod) => {
    if (passwords.get(m.email) !== m.password) throw new AuthError('wrong-credentials');
  };
  return {
    log,
    switchTo: set,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m) {
      check(m);
      const u = m.email === ALICE.email ? ALICE : BOB;
      set(u);
      return u;
    },
    async signUp() {
      throw new AuthError('unknown');
    },
    async signOut() {
      log.push('signOut');
      set(null);
    },
    async sendPasswordReset() {},
    async reauthenticate(m) {
      log.push(`reauth:${m.email}`);
      check(m);
    },
    async getIdToken() {
      return user ? `token-for-${user.uid}` : null;
    },
  };
}

async function actError(fn: () => Promise<unknown>): Promise<unknown> {
  let error: unknown;
  await act(async () => {
    try {
      await fn();
    } catch (e) {
      error = e;
    }
  });
  return error;
}

function setup(auth: FakeAuth, deleteRequest: (token: string) => Promise<void>) {
  const storage: Storage = createStorage(memoryBackend());
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  const request = jest.fn(deleteRequest);
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} deleteAccountRequest={request}>
      {children}
    </AccountProvider>
  );
  return { storage, remotes, remoteFor, request, wrapper };
}

function wipe(r: MemoryRemote) {
  r.items.clear();
  r.devices.clear();
  r.settings.clear();
}

describe('FINDING: a timed-out delete resumes sync and resurrects the deleted data', () => {
  test('after DELETE times out client-side (the server finished it), no new write reaches users/{uid}', async () => {
    const auth = fakeAuth(ALICE);
    // The backend wipes the data and deletes the user, but the response arrives after the client's
    // 15 s timeout (recursive_delete of a large account is slow).
    let s!: ReturnType<typeof setup>;
    s = setup(auth, async () => {
      wipe(s.remotes.get('alice')!);
      throw new AuthError('network', 'delete account timed out');
    });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));

    expect(await actError(() => view.result.current.deleteAccount('alice pw'))).toMatchObject({ kind: 'network' });

    // The user keeps reading; the resumed engine pushes with the ID token Firestore still accepts.
    setNote(s.storage, '5:5:5', 'written after the delete', 9000);
    await act(() => view.result.current.syncNow());
    const r = s.remotes.get('alice')!;
    expect(r.items.size + r.devices.size + r.settings.size).toBe(0);
  });
});

describe('FINDING: delete can act on a different account than the one that re-authenticated', () => {
  test('a user switch while the engine stops makes DELETE carry the other account\'s fresh token', async () => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth, async () => undefined);
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));

    // A sync is in flight, so deleteAccount waits in engine.stop() after re-authenticating Alice.
    const held = s.remotes.get('alice')!.hold('pullItems');
    let inFlight: Promise<void> | undefined;
    await act(async () => {
      inFlight = view.result.current.syncNow();
      await held.started;
    });

    let done: Promise<void> | undefined;
    await act(async () => {
      done = view.result.current.deleteAccount('alice pw').catch(() => undefined);
      await Promise.resolve();
    });
    await waitFor(() => expect(auth.log).toContain('reauth:alice@example.com'));

    // Meanwhile Bob signs in on this browser (another tab; web shares the session across tabs).
    await act(async () => auth.switchTo(BOB));
    await act(async () => {
      held.release();
      await done;
      await inFlight;
    });

    // Alice's password must never delete Bob's account.
    expect(s.request).not.toHaveBeenCalledWith('token-for-bob');
  });
});

// Not fixed in R-6b: encrypting MMKV needs a key in expo-secure-store (a new dependency). John's call; see the PR.
describe.skip('ACCEPTED RISK (pending John): the native session store is not encrypted', () => {
  test('firebaseApp.native.ts creates its MMKV store with an encryption key', () => {
    jest.isolateModules(() => {
      const createMMKV = jest.fn(() => ({ getString: jest.fn(), set: jest.fn(), remove: jest.fn() }));
      jest.doMock('react-native-mmkv', () => ({ createMMKV }));
      jest.doMock('firebase/auth', () => ({
        initializeAuth: jest.fn(() => ({})),
        getReactNativePersistence: jest.fn(() => ({})),
        connectAuthEmulator: jest.fn(),
      }));
      jest.doMock('firebase/firestore', () => ({ initializeFirestore: jest.fn(() => ({})), connectFirestoreEmulator: jest.fn() }));
      jest.doMock('../firebaseCore', () => ({
        getFirebaseApp: jest.fn(() => ({})),
        withAuthEmulator: (a: unknown) => a,
        withFirestoreEmulator: (d: unknown) => d,
      }));
      // eslint-disable-next-line @typescript-eslint/no-require-imports
      const native = require('../firebaseApp.native') as typeof import('../firebaseApp.native');
      native.getFirebaseAuth();
      // The refresh token (a long-lived credential) lands in this store; Android Auto Backup and iOS
      // backups copy the app's files directory, so an unencrypted MMKV file carries the session along.
      expect(createMMKV).toHaveBeenCalledWith(expect.objectContaining({ encryptionKey: expect.any(String) }));
    });
  });
});

describe('sound', () => {
  test('the emulator flag is ignored in a production build (__DEV__ false)', () => {
    const g = globalThis as { __DEV__?: boolean };
    const before = g.__DEV__;
    const env = process.env.EXPO_PUBLIC_FIREBASE_EMULATORS;
    try {
      process.env.EXPO_PUBLIC_FIREBASE_EMULATORS = '1';
      g.__DEV__ = false;
      expect(firebaseEmulatorsEnabled()).toBe(false);
      g.__DEV__ = true;
      expect(firebaseEmulatorsEnabled()).toBe(true);
    } finally {
      g.__DEV__ = before;
      if (env === undefined) delete process.env.EXPO_PUBLIC_FIREBASE_EMULATORS;
      else process.env.EXPO_PUBLIC_FIREBASE_EMULATORS = env;
    }
  });

  test('the account API never logs the token, nor puts it in an error message', async () => {
    const spies = (['log', 'warn', 'error', 'info', 'debug'] as const).map((m) => jest.spyOn(console, m).mockImplementation(() => undefined));
    try {
      const failing = jest.fn(async () => {
        throw new TypeError('Failed to fetch');
      });
      const err = await createAccountApi({ baseUrl: 'http://api.test', fetch: failing }).deleteAccount('secret-token-xyz').catch((e: unknown) => e);
      expect(String((err as Error).message)).not.toContain('secret-token-xyz');
      const bad = jest.fn(async () => ({ status: 500, json: async () => ({ detail: 'x' }) }) as Response);
      const err2 = await createAccountApi({ baseUrl: 'http://api.test', fetch: bad }).deleteAccount('secret-token-xyz').catch((e: unknown) => e);
      expect(String((err2 as Error).message)).not.toContain('secret-token-xyz');
      for (const spy of spies) for (const call of spy.mock.calls) expect(JSON.stringify(call)).not.toContain('secret-token-xyz');
    } finally {
      spies.forEach((s) => s.mockRestore());
    }
  });

  test('the wrong password never reaches the backend delete, and sync is not held', async () => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth, async () => undefined);
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    expect(await actError(() => view.result.current.deleteAccount('bob pw'))).toMatchObject({ kind: 'wrong-credentials' });
    expect(s.request).not.toHaveBeenCalled();
  });

  test('a user switch stops the old engine before the new one starts (no write lands in the wrong account)', async () => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth, async () => undefined);
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    await act(async () => auth.switchTo(BOB));
    await waitFor(() => expect(s.remotes.get('bob')?.calls).toContain('pullItems'));
    const aliceCalls = s.remotes.get('alice')!.calls.length;
    setNote(s.storage, '7:7:7', 'bob writes', 10_000);
    await act(() => view.result.current.syncNow());
    expect(s.remotes.get('alice')!.calls.length).toBe(aliceCalls);
  });
});
