// Unit tests for the security fixes in the delete flow (R6b-secfix-client): after a delete that fails
// with `network` (the request may have reached the server) sync stays stopped until a probe (a forced
// token refresh, then the remote's contents) settles it (F3); the delete never carries a token for an
// account other than the one that re-authenticated (F5); `auth/user-token-expired` maps to
// requires-recent-login.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS, setNote } from '../../sync/__tests__/fixtures';
import { AccountProvider, tokenSubject, useAccount } from '../AccountProvider';
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
const BOB: AuthUser = { uid: 'bob', email: 'bob@example.com' };

interface Fake extends AuthBackend {
  log: string[];
  switchTo(u: AuthUser | null): void;
  /** What the next forced refreshes do (a queue; empty: return the current user's token). */
  refreshes: (() => Promise<string | null>)[];
  /** Overrides the token format. */
  tokenFor: (u: AuthUser) => string;
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
    tokenFor: (u) => `token-for-${u.uid}`,
    switchTo: set,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m) {
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
      if (m.password !== 'pw') throw new AuthError('wrong-credentials');
    },
    async getIdToken(force) {
      log.push(`token:${force ? 'fresh' : 'cached'}`);
      const next = force ? fake.refreshes.shift() : undefined;
      if (next) return next();
      return user ? fake.tokenFor(user) : null;
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
  const request = jest.fn(deleteRequest);
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} deleteAccountRequest={request}>
      {children}
    </AccountProvider>
  );
  return { storage, remotes, request, wrapper };
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

const failing = (kind: AuthError['kind']) => async (): Promise<string | null> => {
  throw new AuthError(kind);
};

/** Signs Alice in, writes a note and waits until it is on her remote (so the remote has data). */
async function aliceWithData(auth: Fake, s: ReturnType<typeof setup>) {
  setNote(s.storage, '1:1:1', 'synced', 1000);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
  await act(() => view.result.current.syncNow());
  expect(s.remotes.get('alice')!.items.get('note:1:1:1')).toBeDefined();
  return view;
}

const timedOut = async () => {
  throw new AuthError('network', 'delete account timed out');
};

describe('F3: a delete that fails with network', () => {
  test('a refresh that fails as for a deleted user finishes the delete: history cleared, signed out, resolves', async () => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth, timedOut);
    const view = await aliceWithData(auth, s);
    // The first forced refresh is the delete's own token; the second is the probe.
    auth.refreshes.push(async () => 'token-for-alice', failing('requires-recent-login'));
    await act(() => view.result.current.deleteAccount('pw'));
    expect(view.result.current.status).toBe('signedOut');
    expect(auth.log).toContain('signOut');
    expect(mockClearSyncState).toHaveBeenCalledWith(s.storage, 'alice');
  });

  // 'unknown' left out after S2-2 (security review r2): a codeless unknown failure is unconfirmed, not 'deleted'.
  test.each(['wrong-credentials'] as const)('a refresh failing with %s also finishes the delete', async (kind) => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth, timedOut);
    const view = await aliceWithData(auth, s);
    auth.refreshes.push(async () => 'token-for-alice', failing(kind));
    await act(() => view.result.current.deleteAccount('pw'));
    expect(view.result.current.status).toBe('signedOut');
  });

  test('an unreachable probe keeps sync stopped (status error), rejects with network, and asks again on syncNow', async () => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth, timedOut);
    const view = await aliceWithData(auth, s);
    auth.refreshes.push(async () => 'token-for-alice', failing('network'));
    expect(await actError(() => view.result.current.deleteAccount('pw'))).toMatchObject({ kind: 'network' });
    expect(view.result.current.status).toBe('signedIn');
    expect(view.result.current.sync?.state).toBe('error');
    const remote = s.remotes.get('alice')!;

    // Still offline: the next syncNow probes again and nothing reaches the remote.
    auth.refreshes.push(failing('network'));
    remote.calls.length = 0;
    setNote(s.storage, '2:2:2', 'while unconfirmed', 2000);
    await act(() => view.result.current.syncNow());
    expect(remote.calls.filter((c) => c.startsWith('push'))).toEqual([]);
    expect(view.result.current.sync?.state).toBe('error');

    // Back online, the account and its data are there: sync resumes.
    await act(() => view.result.current.syncNow());
    expect(remote.items.get('note:2:2:2')).toBeDefined();
    expect(view.result.current.sync?.state).toBe('idle');
  });

  test('an unconfirmed delete that the next probe finds done signs out without syncing', async () => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth, timedOut);
    const view = await aliceWithData(auth, s);
    auth.refreshes.push(async () => 'token-for-alice', failing('network'));
    await actError(() => view.result.current.deleteAccount('pw'));
    auth.refreshes.push(failing('requires-recent-login'));
    const remote = s.remotes.get('alice')!;
    remote.calls.length = 0;
    await act(() => view.result.current.syncNow());
    expect(view.result.current.status).toBe('signedOut');
    expect(mockClearSyncState).toHaveBeenCalledWith(s.storage, 'alice');
    expect(remote.calls.filter((c) => c.startsWith('push'))).toEqual([]);
  });

  test('a remote emptied by the request keeps sync stopped even though the token still refreshes', async () => {
    const auth = fakeAuth(ALICE);
    let s!: ReturnType<typeof setup>;
    s = setup(auth, async () => {
      const r = s.remotes.get('alice')!;
      r.items.clear();
      r.devices.clear();
      r.settings.clear();
      throw new AuthError('network');
    });
    const view = await aliceWithData(auth, s);
    expect(await actError(() => view.result.current.deleteAccount('pw'))).toMatchObject({ kind: 'network' });
    expect(view.result.current.sync?.state).toBe('error');
    setNote(s.storage, '3:3:3', 'after', 3000);
    await act(() => view.result.current.syncNow());
    const r = s.remotes.get('alice')!;
    expect(r.items.size + r.devices.size + r.settings.size).toBe(0);
    // Signing in afresh is a new start.
    await act(() => view.result.current.signIn({ kind: 'password', email: ALICE.email!, password: 'pw' }));
    await act(() => view.result.current.syncNow());
    expect(r.items.get('note:3:3:3')).toBeDefined();
  });

  test('a failure that is not network (the server answered) resumes sync without probing', async () => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth, async () => {
      throw new AuthError('unknown', 'HTTP 503');
    });
    const view = await aliceWithData(auth, s);
    auth.log.length = 0;
    expect(await actError(() => view.result.current.deleteAccount('pw'))).toMatchObject({ kind: 'unknown' });
    expect(auth.log.filter((l) => l === 'token:fresh')).toHaveLength(1);
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
  });
});

describe('F5: the delete only ever carries the re-authenticated account’s token', () => {
  const jwt = (sub: string) => {
    const b64 = (o: object) => btoa(JSON.stringify(o)).replace(/=+$/, '').replace(/\+/g, '-').replace(/\//g, '_');
    return `${b64({ alg: 'RS256' })}.${b64({ sub, aud: 'bible-app-492520' })}.sig`;
  };

  test('tokenSubject reads a JWT’s sub and returns null for anything else', () => {
    expect(tokenSubject(jwt('alice'))).toBe('alice');
    expect(tokenSubject('token-for-alice')).toBeNull();
    expect(tokenSubject('a.%%%.c')).toBeNull();
  });

  test('a token whose sub is another account aborts with unknown before the backend, and sync resumes', async () => {
    const auth = fakeAuth(ALICE);
    auth.tokenFor = () => jwt('mallory');
    const s = setup(auth, async () => undefined);
    const view = await aliceWithData(auth, s);
    expect(await actError(() => view.result.current.deleteAccount('pw'))).toMatchObject({ kind: 'unknown' });
    expect(s.request).not.toHaveBeenCalled();
    expect(view.result.current.status).toBe('signedIn');
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
  });

  test('a matching JWT goes through', async () => {
    const auth = fakeAuth(ALICE);
    auth.tokenFor = (u) => jwt(u.uid);
    const s = setup(auth, async () => undefined);
    const view = await aliceWithData(auth, s);
    await act(() => view.result.current.deleteAccount('pw'));
    expect(s.request).toHaveBeenCalledWith(jwt('alice'));
    expect(view.result.current.status).toBe('signedOut');
  });

  test('a user switch during the token refresh aborts, and the new user’s sync takes over', async () => {
    const auth = fakeAuth(ALICE);
    const s = setup(auth, async () => undefined);
    const view = await aliceWithData(auth, s);
    auth.refreshes.push(async () => {
      auth.switchTo(BOB);
      return 'token-for-alice';
    });
    expect(await actError(() => view.result.current.deleteAccount('pw'))).toMatchObject({ kind: 'unknown' });
    expect(s.request).not.toHaveBeenCalled();
    await waitFor(() => expect(s.remotes.get('bob')?.calls).toContain('pullItems'));
    expect(view.result.current.user).toEqual(BOB);
  });
});

test('auth/user-token-expired maps to requires-recent-login', () => {
  expect(mapFirebaseAuthError({ code: 'auth/user-token-expired' }).kind).toBe('requires-recent-login');
});
