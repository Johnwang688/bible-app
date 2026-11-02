// Security review round 2 (R6b-security-r2): probes of the F3 fix in AccountProvider.tsx. Tests named
// "FINDING" assert the intended behaviour and fail on the reviewed code.
//
// After a delete that fails with `network`, the probe forces a token refresh and treats a failure of
// kind 'wrong-credentials', 'requires-recent-login' or 'unknown' (ACCOUNT_GONE) as "the account is
// deleted": it clears the uid's sync history, blocks the uid and signs the user out. 'unknown' is the
// catch-all of mapFirebaseAuthError: it also covers transient refresh failures (auth/internal-error for a
// 5xx from the token service, auth/quota-exceeded, any non-Firebase exception) that say nothing about
// the account. Right after a timed-out request (a flaky network or a struggling backend) such a failure
// signs a live user out and drops their sync history, instead of keeping the account unconfirmed and
// asking again later.
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

function setup(auth: Fake, deleteRequest: (token: string) => Promise<void>) {
  const storage: Storage = createStorage(memoryBackend());
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} deleteAccountRequest={deleteRequest}>
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

const timedOut = async () => {
  throw new AuthError('network', 'delete account timed out');
};

// Transient refresh failures, as the real adapter (firebaseAuth.ts `mapped`) reports them.
const TRANSIENT: [string, () => unknown][] = [
  ['auth/internal-error (token service 5xx)', () => ({ code: 'auth/internal-error', name: 'FirebaseError', message: 'x' })],
  ['auth/quota-exceeded', () => ({ code: 'auth/quota-exceeded', name: 'FirebaseError', message: 'x' })],
  ['a non-Firebase exception', () => new TypeError('Cannot read properties of undefined')],
];

describe('FINDING S2-2: a transient refresh failure in the F3 probe is taken as "deleted"', () => {
  test.each(TRANSIENT)('after a timed-out delete, a refresh failing with %s keeps the live account signed in and unconfirmed', async (_label, raw) => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth, timedOut);
    setNote(s.storage, '1:1:1', 'synced', 1000);
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    await act(() => view.result.current.syncNow());
    expect(s.remotes.get('alice')!.items.get('note:1:1:1')).toBeDefined();

    // The delete's own fresh token, then the probe's refresh fails transiently.
    auth.refreshes.push(
      async () => 'token-for-alice',
      async () => {
        throw mapFirebaseAuthError(raw());
      },
    );
    const err = await actError(() => view.result.current.deleteAccount('pw'));

    // Nothing says the account is gone: it should stay signed in with sync stopped (unconfirmed),
    // its sync history intact, and the delete should report the ambiguous failure.
    expect(err).toMatchObject({ kind: 'network' });
    expect(auth.log).not.toContain('signOut');
    expect(view.result.current.status).toBe('signedIn');
    expect(mockClearSyncState).not.toHaveBeenCalled();
    expect(view.result.current.sync?.state).toBe('error');
  });
});
