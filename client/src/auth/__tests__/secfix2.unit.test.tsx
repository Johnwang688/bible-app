// Unit tests for R6b-secfix2 (S2-2): after a delete that fails with `network`, only a refresh failure whose
// Firebase code proves the account is gone or its tokens revoked counts as "deleted"; every other failure
// keeps the account unconfirmed (sync stopped, history kept, signed in) and it is probed again later.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS, setNote } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount } from '../AccountProvider';
import { mapFirebaseAuthError } from '../firebaseErrors';
import { AuthError, type AuthBackend, type AuthUser } from '../types';

const mockClearSyncState = jest.fn();
jest.mock('../../sync/engine', () => {
  const actual = jest.requireActual<typeof import('../../sync/engine')>('../../sync/engine');
  return {
    ...actual,
    clearSyncState: (...a: Parameters<typeof actual.clearSyncState>) => {
      mockClearSyncState(...a);
      actual.clearSyncState(...a);
    },
  };
});

beforeEach(() => mockClearSyncState.mockClear());

const ALICE: AuthUser = { uid: 'alice', email: 'alice@example.com' };

interface Fake extends AuthBackend {
  log: string[];
  refreshes: (() => Promise<string | null>)[];
}

function fakeAuth(initial: AuthUser | null): Fake {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const log: string[] = [];
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const fake: Fake = {
    log,
    refreshes: [],
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn() {
      set(ALICE);
      return ALICE;
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
      if (m.password !== 'pw') throw new AuthError('wrong-credentials');
    },
    async getIdToken(force) {
      const next = force ? fake.refreshes.shift() : undefined;
      if (next) return next();
      return user ? `token-for-${user.uid}` : null;
    },
  };
  return fake;
}

function setup(auth: Fake) {
  const storage: Storage = createStorage(memoryBackend());
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  const timedOut = async () => {
    throw new AuthError('network', 'delete account timed out');
  };
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} deleteAccountRequest={timedOut}>
      {children}
    </AccountProvider>
  );
  return { storage, remotes, wrapper };
}

async function actError(fn: () => Promise<unknown>): Promise<unknown> {
  let error: unknown = null;
  await act(async () => {
    try {
      await fn();
    } catch (e) {
      error = e;
    }
  });
  return error;
}

const fbError = (code: string) => Object.assign(new Error(`Firebase: Error (${code}).`), { code, name: 'FirebaseError' });
/** A refresh that fails as the real adapter reports it (mapped). */
const mappedFailure = (raw: unknown) => async (): Promise<string | null> => {
  throw mapFirebaseAuthError(raw);
};

async function aliceWithData(s: ReturnType<typeof setup>) {
  setNote(s.storage, '1:1:1', 'synced', 1000);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
  await act(() => view.result.current.syncNow());
  expect(s.remotes.get('alice')!.items.get('note:1:1:1')).toBeDefined();
  return view;
}

describe('mapFirebaseAuthError keeps the Firebase code', () => {
  test('a Firebase error carries its code', () => {
    expect(mapFirebaseAuthError(fbError('auth/user-disabled'))).toMatchObject({ kind: 'wrong-credentials', code: 'auth/user-disabled' });
    expect(mapFirebaseAuthError(fbError('auth/internal-error'))).toMatchObject({ kind: 'unknown', code: 'auth/internal-error' });
  });

  test('a non-Firebase error has no code', () => {
    expect(mapFirebaseAuthError(new TypeError('x')).code).toBeUndefined();
    expect(new AuthError('network').code).toBeUndefined();
  });
});

describe('S2-2: the F3 probe after a timed-out delete', () => {
  test.each(['auth/user-not-found', 'auth/user-disabled', 'auth/user-token-expired', 'auth/invalid-user-token'])(
    'a refresh failing with %s finishes the delete',
    async (code) => {
      const auth = fakeAuth(ALICE);
      const s = setup(auth);
      const view = await aliceWithData(s);
      auth.refreshes.push(async () => 'token-for-alice', mappedFailure(fbError(code)));
      await act(() => view.result.current.deleteAccount('pw'));
      expect(view.result.current.status).toBe('signedOut');
      expect(mockClearSyncState).toHaveBeenCalledWith(s.storage, 'alice');
    },
  );

  test('an unmapped Firebase error with a proving code also finishes the delete', async () => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth);
    const view = await aliceWithData(s);
    auth.refreshes.push(async () => 'token-for-alice', async () => {
      throw fbError('auth/user-not-found');
    });
    await act(() => view.result.current.deleteAccount('pw'));
    expect(view.result.current.status).toBe('signedOut');
  });

  const NOT_PROOF: [string, () => Promise<string | null>][] = [
    ['auth/internal-error', mappedFailure(fbError('auth/internal-error'))],
    ['auth/quota-exceeded', mappedFailure(fbError('auth/quota-exceeded'))],
    ['auth/network-request-failed', mappedFailure(fbError('auth/network-request-failed'))],
    // Kinds that would count without a code, but whose code proves nothing.
    ['auth/wrong-password', mappedFailure(fbError('auth/wrong-password'))],
    ['auth/requires-recent-login', mappedFailure(fbError('auth/requires-recent-login'))],
    ['a non-Firebase exception (mapped)', mappedFailure(new TypeError('boom'))],
    [
      'a non-Firebase exception (unmapped)',
      async () => {
        throw new TypeError('boom');
      },
    ],
    [
      "AuthError 'unknown' without a code",
      async () => {
        throw new AuthError('unknown');
      },
    ],
  ];

  test.each(NOT_PROOF)('a refresh failing with %s keeps the account unconfirmed', async (_label, failure) => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth);
    const view = await aliceWithData(s);
    auth.refreshes.push(async () => 'token-for-alice', failure);
    expect(await actError(() => view.result.current.deleteAccount('pw'))).toMatchObject({ kind: 'network' });
    expect(auth.log).not.toContain('signOut');
    expect(view.result.current.status).toBe('signedIn');
    expect(view.result.current.sync?.state).toBe('error');
    expect(mockClearSyncState).not.toHaveBeenCalled();
  });

  test('an unconfirmed account is probed again: a transient failure keeps it stopped, a proving one finishes it', async () => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth);
    const view = await aliceWithData(s);
    auth.refreshes.push(async () => 'token-for-alice', mappedFailure(fbError('auth/internal-error')));
    await actError(() => view.result.current.deleteAccount('pw'));
    const remote = s.remotes.get('alice')!;
    remote.calls.length = 0;
    setNote(s.storage, '2:2:2', 'while unconfirmed', 2000);

    auth.refreshes.push(mappedFailure(new TypeError('still flaky')));
    await act(() => view.result.current.syncNow());
    expect(view.result.current.status).toBe('signedIn');
    expect(view.result.current.sync?.state).toBe('error');
    expect(remote.calls.filter((c) => c.startsWith('push'))).toEqual([]);

    auth.refreshes.push(mappedFailure(fbError('auth/user-token-expired')));
    await act(() => view.result.current.syncNow());
    expect(view.result.current.status).toBe('signedOut');
    expect(mockClearSyncState).toHaveBeenCalledWith(s.storage, 'alice');
    expect(remote.calls.filter((c) => c.startsWith('push'))).toEqual([]);
  });
});
