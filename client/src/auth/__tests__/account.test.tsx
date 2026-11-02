// Acceptance tests for the account provider and the account API (R-6b, orchestrator-owned; the
// implementer may not edit them). The UI is built separately, after John approves the prototypes.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS, setNote, studyKey } from '../../sync/__tests__/fixtures';
import { createAccountApi } from '../accountApi';
import { AccountProvider, useAccount } from '../AccountProvider';
import { mapFirebaseAuthError } from '../firebaseErrors';
import { AuthError, type AuthBackend, type AuthUser, type SignInMethod } from '../types';

interface FakeAuth extends AuthBackend {
  log: string[];
  emit(user: AuthUser | null): void;
  passwords: Map<string, string>;
}

function fakeAuth(initial: AuthUser | null | 'pending' = null): FakeAuth {
  let user: AuthUser | null = initial === 'pending' ? null : initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const passwords = new Map<string, string>([['alice@example.com', 'correct horse']]);
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
    passwords,
    emit: set,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      if (initial !== 'pending') queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m) {
      log.push(`signIn:${m.email}`);
      check(m);
      const u = { uid: m.email === 'alice@example.com' ? 'alice' : 'bob', email: m.email };
      set(u);
      return u;
    },
    async signUp(email, password) {
      log.push(`signUp:${email}`);
      if (passwords.has(email)) throw new AuthError('email-in-use');
      passwords.set(email, password);
      const u = { uid: 'new-' + email, email };
      set(u);
      return u;
    },
    async signOut() {
      log.push('signOut');
      set(null);
    },
    async sendPasswordReset(email) {
      log.push(`reset:${email}`);
    },
    async reauthenticate(m) {
      log.push(`reauth:${m.email}`);
      check(m);
    },
    async getIdToken(force) {
      log.push(`token:${force ? 'fresh' : 'cached'}`);
      return user ? `token-for-${user.uid}` : null;
    },
  };
}

/** Runs an action inside act and returns what it threw. (RNTL 14's act thenable does not chain, so
 * `expect(act(...)).rejects` leaves the act open and corrupts later tests.) */
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

const ALICE: AuthUser = { uid: 'alice', email: 'alice@example.com' };

function setup(opts: { auth?: FakeAuth; deleteRequest?: (token: string) => Promise<void> } = {}) {
  const auth = opts.auth ?? fakeAuth();
  const storage: Storage = createStorage(memoryBackend());
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  const deleteRequest = jest.fn(opts.deleteRequest ?? (async (_token: string) => undefined));
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} deleteAccountRequest={deleteRequest}>
      {children}
    </AccountProvider>
  );
  return { auth, storage, remotes, remoteFor, deleteRequest, wrapper };
}

describe('AccountProvider', () => {
  test('loading until auth reports, then signed out with no sync', async () => {
    const s = setup({ auth: fakeAuth('pending') });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    expect(view.result.current.status).toBe('loading');
    await act(async () => s.auth.emit(null));
    expect(view.result.current.status).toBe('signedOut');
    expect(view.result.current.user).toBeNull();
    expect(view.result.current.sync).toBeNull();
  });

  test('a restored session starts sync for that user', async () => {
    const s = setup({ auth: fakeAuth(ALICE) });
    setNote(s.storage, '43:3:16', 'restored', 1000);
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
    expect(view.result.current.user).toEqual(ALICE);
    await waitFor(() => expect(s.remotes.get('alice')?.items.get('note:43:3:16')).toBeDefined());
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
  });

  test('sign in: wrong password rejects with AuthError and stays signed out; right one signs in', async () => {
    const s = setup();
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
    expect(
      await actError(() => view.result.current.signIn({ kind: 'password', email: 'alice@example.com', password: 'nope' })),
    ).toMatchObject({ kind: 'wrong-credentials' });
    expect(view.result.current.status).toBe('signedOut');
    await act(() => view.result.current.signIn({ kind: 'password', email: 'alice@example.com', password: 'correct horse' }));
    expect(view.result.current.status).toBe('signedIn');
    await waitFor(() => expect(s.remotes.get('alice')?.calls).toContain('pullItems'));
  });

  test('sign up signs in; an email in use rejects', async () => {
    const s = setup();
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
    expect(await actError(() => view.result.current.signUp('alice@example.com', 'whatever123'))).toMatchObject({
      kind: 'email-in-use',
    });
    await act(() => view.result.current.signUp('carol@example.com', 'long enough'));
    expect(view.result.current.user?.email).toBe('carol@example.com');
  });

  test('sign out stops sync first, keeps the device data, and nothing syncs afterwards', async () => {
    const s = setup({ auth: fakeAuth(ALICE) });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    await act(() => view.result.current.signOut());
    expect(view.result.current.status).toBe('signedOut');
    expect(s.auth.log).toContain('signOut');
    const remote = s.remotes.get('alice')!;
    remote.calls.length = 0;
    setNote(s.storage, '1:1:1', 'after sign-out', 2000);
    await act(async () => {
      await new Promise((r) => setTimeout(r, 20));
    });
    expect(remote.calls).toEqual([]);
    expect(s.storage.get(studyKey).notes['1:1:1']?.text).toBe('after sign-out');
  });

  test('switching users stops the old engine and starts one on the new user’s remote', async () => {
    const s = setup({ auth: fakeAuth(ALICE) });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    await act(async () => s.auth.emit({ uid: 'bob', email: 'bob@example.com' }));
    await waitFor(() => expect(s.remotes.get('bob')?.calls).toContain('pullItems'));
    const alice = s.remotes.get('alice')!;
    alice.calls.length = 0;
    setNote(s.storage, '2:2:2', 'for bob', 3000);
    await act(() => view.result.current.syncNow());
    expect(alice.calls).toEqual([]);
    expect(s.remotes.get('bob')!.items.get('note:2:2:2')).toBeDefined();
  });

  test('password reset passes the email through', async () => {
    const s = setup();
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await act(() => view.result.current.sendPasswordReset('who@example.com'));
    expect(s.auth.log).toContain('reset:who@example.com');
  });

  test('delete: re-authenticates, stops sync, calls the backend with a fresh token, then signs out', async () => {
    const order: string[] = [];
    const s = setup({
      auth: fakeAuth(ALICE),
      deleteRequest: async (token) => {
        order.push(`request:${token}`);
      },
    });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    setNote(s.storage, '3:3:3', 'stays on the device', 4000);
    const remote = s.remotes.get('alice')!;
    await act(() => view.result.current.deleteAccount('correct horse'));
    expect(s.deleteRequest).toHaveBeenCalledWith('token-for-alice');
    const log = s.auth.log;
    expect(log.indexOf('reauth:alice@example.com')).toBeGreaterThanOrEqual(0);
    expect(log.indexOf('reauth:alice@example.com')).toBeLessThan(log.indexOf('token:fresh'));
    expect(log).toContain('signOut');
    expect(view.result.current.status).toBe('signedOut');
    expect(s.storage.get(studyKey).notes['3:3:3']?.text).toBe('stays on the device');
    remote.calls.length = 0;
    setNote(s.storage, '3:3:4', 'later', 5000);
    await act(async () => {
      await new Promise((r) => setTimeout(r, 20));
    });
    expect(remote.calls).toEqual([]);
  });

  test('delete with the wrong password rejects, deletes nothing, and sync keeps working', async () => {
    const s = setup({ auth: fakeAuth(ALICE) });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    expect(await actError(() => view.result.current.deleteAccount('wrong'))).toMatchObject({ kind: 'wrong-credentials' });
    expect(s.deleteRequest).not.toHaveBeenCalled();
    expect(view.result.current.status).toBe('signedIn');
    setNote(s.storage, '4:4:4', 'still syncing', 6000);
    await act(() => view.result.current.syncNow());
    expect(s.remotes.get('alice')!.items.get('note:4:4:4')).toBeDefined();
  });

  test('a failed backend delete rejects, keeps the user signed in, and resumes sync', async () => {
    const s = setup({
      auth: fakeAuth(ALICE),
      deleteRequest: async () => {
        throw new AuthError('network');
      },
    });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    expect(await actError(() => view.result.current.deleteAccount('correct horse'))).toMatchObject({ kind: 'network' });
    expect(view.result.current.status).toBe('signedIn');
    expect(s.auth.log).not.toContain('signOut');
    setNote(s.storage, '5:5:5', 'resumed', 7000);
    await act(() => view.result.current.syncNow());
    expect(s.remotes.get('alice')!.items.get('note:5:5:5')).toBeDefined();
  });

  test('after a delete, signing in again as the same uid is a first sign-in (history forgotten)', async () => {
    const s = setup({ auth: fakeAuth(ALICE) });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    setNote(s.storage, '6:6:6', 'kept locally', 8000);
    // The engine's debounce (3 s) sends the note.
    await waitFor(() => expect(s.remotes.get('alice')?.items.get('note:6:6:6')).toBeDefined(), { timeout: 5000 });
    await act(() => view.result.current.deleteAccount('correct horse'));
    // The backend wiped the account: a fresh, empty remote for the same uid.
    s.remotes.set('alice', createMemoryRemote());
    await act(() => view.result.current.signIn({ kind: 'password', email: 'alice@example.com', password: 'correct horse' }));
    await act(() => view.result.current.syncNow());
    // With the old history kept, the engine would think the note was already synced and never push it.
    expect(s.remotes.get('alice')!.items.get('note:6:6:6')?.value).toEqual({ text: 'kept locally' });
  });

  test('useAccount outside the provider throws', async () => {
    const spy = jest.spyOn(console, 'error').mockImplementation(() => undefined);
    await expect(renderHook(() => useAccount())).rejects.toThrow();
    spy.mockRestore();
  });
});

describe('Firebase error mapping', () => {
  test.each([
    ['auth/invalid-credential', 'wrong-credentials'],
    ['auth/wrong-password', 'wrong-credentials'],
    ['auth/user-not-found', 'wrong-credentials'],
    ['auth/user-disabled', 'wrong-credentials'],
    ['auth/invalid-email', 'invalid-email'],
    ['auth/missing-email', 'invalid-email'],
    ['auth/email-already-in-use', 'email-in-use'],
    ['auth/weak-password', 'weak-password'],
    ['auth/password-does-not-meet-requirements', 'weak-password'],
    ['auth/too-many-requests', 'too-many-requests'],
    ['auth/network-request-failed', 'network'],
    ['auth/requires-recent-login', 'requires-recent-login'],
    ['auth/internal-error', 'unknown'],
  ])('%s → %s', (code, kind) => {
    const err = mapFirebaseAuthError({ code, message: 'Firebase: Error (' + code + ').' });
    expect(err).toBeInstanceOf(AuthError);
    expect(err.kind).toBe(kind);
  });

  test('a non-Firebase error is unknown and keeps the cause', () => {
    const cause = new Error('boom');
    const err = mapFirebaseAuthError(cause);
    expect(err.kind).toBe('unknown');
    expect(err.cause).toBe(cause);
  });
});

describe('account API', () => {
  const ok = (status: number, body?: unknown) =>
    ({ ok: status >= 200 && status < 300, status, json: async () => body, text: async () => JSON.stringify(body ?? '') }) as Response;

  test('DELETE /api/v1/account with the bearer token', async () => {
    const fetch = jest.fn(async () => ok(204));
    await createAccountApi({ baseUrl: 'http://api.test', fetch }).deleteAccount('tok');
    expect(fetch).toHaveBeenCalledWith(
      'http://api.test/api/v1/account',
      expect.objectContaining({ method: 'DELETE', headers: expect.objectContaining({ Authorization: 'Bearer tok' }) }),
    );
  });

  test.each<[number, unknown, string]>([
    [403, { detail: 'recent-login-required' }, 'requires-recent-login'],
    [401, { detail: 'Invalid or expired token' }, 'unknown'],
    [503, { detail: 'x' }, 'unknown'],
  ])('status %i maps to %s', async (status, body, kind) => {
    const fetch = jest.fn(async () => ok(status, body));
    await expect(createAccountApi({ baseUrl: 'http://api.test', fetch }).deleteAccount('tok')).rejects.toMatchObject({ kind });
  });

  test('a network failure is AuthError network', async () => {
    const fetch = jest.fn(async () => {
      throw new TypeError('Failed to fetch');
    });
    await expect(createAccountApi({ baseUrl: 'http://api.test', fetch }).deleteAccount('tok')).rejects.toMatchObject({
      kind: 'network',
    });
  });
});
