// Unit tests for the account provider's concurrency rules (R6b-auth): one engine at a time across
// rapid user changes, a delete in progress is never raced by an auth callback, unmount stops sync,
// syncNow waits for a delete in progress, and a failing default backend leaves the app signed out.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS, setNote } from '../../sync/__tests__/fixtures';
import type { RemoteStore } from '../../sync/types';
import { AccountProvider, useAccount } from '../AccountProvider';
import { AuthError, type AccountState, type AuthBackend, type AuthUser } from '../types';
import { ALWAYS_ALLOWED } from '../signInGate';

// Wraps the real engine so the test sees every start and stop.
const mockEngines = { live: new Set<number>(), maxLive: 0, started: [] as string[], nextId: 0 };
jest.mock('../../sync/engine', () => {
  const actual = jest.requireActual<typeof import('../../sync/engine')>('../../sync/engine');
  return {
    ...actual,
    createSyncEngine: (opts: Parameters<typeof actual.createSyncEngine>[0]) => {
      const engine = actual.createSyncEngine(opts);
      const id = mockEngines.nextId++;
      return {
        ...engine,
        start() {
          mockEngines.live.add(id);
          mockEngines.maxLive = Math.max(mockEngines.maxLive, mockEngines.live.size);
          mockEngines.started.push(opts.uid);
          engine.start();
        },
        async stop() {
          await engine.stop();
          mockEngines.live.delete(id);
        },
      };
    },
  };
});

// Firebase is never loaded here: the default backend's creation fails, as when Firebase is unavailable.
jest.mock('../firebaseApp', () => ({
  getFirebaseAuth: () => {
    throw new Error('no firebase here');
  },
}));

beforeEach(() => {
  mockEngines.live.clear();
  mockEngines.maxLive = 0;
  mockEngines.started = [];
});

interface Fake extends AuthBackend {
  emit(user: AuthUser | null): void;
  listeners: Set<(u: AuthUser | null) => void>;
  log: string[];
}

function fakeAuth(initial: AuthUser | null): Fake {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const log: string[] = [];
  const emit = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  return {
    emit,
    listeners,
    log,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m) {
      const u = { uid: m.email.split('@')[0]!, email: m.email };
      emit(u);
      return u;
    },
    async signUp(email) {
      const u = { uid: email.split('@')[0]!, email };
      emit(u);
      return u;
    },
    async signOut() {
      log.push('signOut');
      emit(null);
    },
    async sendPasswordReset() {},
    async reauthenticate(m) {
      log.push('reauth');
      if (m.password !== 'pw') throw new AuthError('wrong-credentials');
    },
    async getIdToken() {
      return user ? `token-${user.uid}` : null;
    },
  };
}

/** A memory remote whose calls take a few ms, so a run is often in flight when an engine stops. */
function slowRemote(inner: MemoryRemote): RemoteStore {
  const delay = () => new Promise((r) => setTimeout(r, 3));
  return {
    pullItems: async (since) => (await delay(), inner.pullItems(since)),
    pushItems: async (items) => (await delay(), inner.pushItems(items)),
    pullDevices: async () => (await delay(), inner.pullDevices()),
    pushDevice: async (p) => (await delay(), inner.pushDevice(p)),
    pullSettings: async () => (await delay(), inner.pullSettings()),
    pushSettings: async (s) => (await delay(), inner.pushSettings(s)),
  };
}

function setup(auth: Fake, extra: { deleteRequest?: (token: string) => Promise<void> } = {}) {
  const storage: Storage = createStorage(memoryBackend());
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return slowRemote(remotes.get(uid)!);
  };
  const deleteRequest = jest.fn(extra.deleteRequest ?? (async () => undefined));
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider signInGate={ALWAYS_ALLOWED} auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} deleteAccountRequest={deleteRequest}>
      {children}
    </AccountProvider>
  );
  return { storage, remotes, deleteRequest, wrapper };
}

const user = (uid: string): AuthUser => ({ uid, email: `${uid}@example.com` });

/** Runs an action inside act and returns its error (act's thenable does not work with `rejects`). */
async function failure(fn: () => Promise<void>): Promise<unknown> {
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

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 30))));

describe('AccountProvider concurrency', () => {
  test('rapid user changes never leave two engines running and end on the last user', async () => {
    const auth = fakeAuth(user('a'));
    const s = setup(auth);
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync).not.toBeNull());
    await act(async () => {
      auth.emit(user('b'));
      auth.emit(null);
      auth.emit(user('c'));
      auth.emit(user('d'));
      await Promise.resolve();
      auth.emit(user('e'));
    });
    await settle();
    await act(() => view.result.current.syncNow());
    expect(mockEngines.maxLive).toBe(1);
    expect(mockEngines.live.size).toBe(1);
    expect(mockEngines.started.at(-1)).toBe('e');
    expect(view.result.current.user?.uid).toBe('e');
    expect(view.result.current.sync).not.toBeNull();
  });

  test('an auth callback during a delete does not restart sync before the delete settles', async () => {
    const auth = fakeAuth(user('alice'));
    let release!: () => void;
    const s = setup(auth, {
      deleteRequest: () => new Promise<void>((r) => (release = r)),
    });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    let done!: Promise<void>;
    await act(async () => {
      done = view.result.current.deleteAccount('pw');
      await new Promise((r) => setTimeout(r, 20));
    });
    // The delete reads the remote once before the request (R6b-secfix-client F3), so wait for it.
    await waitFor(() => expect(s.deleteRequest).toHaveBeenCalledWith('token-alice'));
    expect(mockEngines.live.size).toBe(0);
    // Firebase reports the same user again while the request is pending.
    await act(async () => auth.emit(user('alice')));
    await settle();
    expect(mockEngines.live.size).toBe(0);
    await act(async () => {
      release();
      await done;
    });
    await settle();
    expect(mockEngines.live.size).toBe(0);
    expect(view.result.current.status).toBe('signedOut');
    expect(mockEngines.maxLive).toBe(1);
  });

  test('syncNow during a delete that fails waits, then syncs for the same user', async () => {
    const auth = fakeAuth(user('alice'));
    const s = setup(auth, {
      deleteRequest: async () => {
        await new Promise((r) => setTimeout(r, 15));
        throw new Error('backend down');
      },
    });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    let deleteError: unknown = null;
    await act(async () => {
      const del = view.result.current.deleteAccount('pw').catch((e: unknown) => void (deleteError = e));
      setNote(s.storage, '7:7:7', 'during delete', 9000);
      await view.result.current.syncNow();
      await del;
    });
    expect(deleteError).toBeInstanceOf(AuthError);
    expect((deleteError as AuthError).kind).toBe('unknown');
    expect(s.remotes.get('alice')!.items.get('note:7:7:7')).toBeDefined();
    expect(view.result.current.status).toBe('signedIn');
  });

  test('a wrong password on delete leaves sync running and never calls the backend', async () => {
    const auth = fakeAuth(user('alice'));
    const s = setup(auth);
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    const error = await failure(() => view.result.current.deleteAccount('nope'));
    expect((error as AuthError).kind).toBe('wrong-credentials');
    expect(s.deleteRequest).not.toHaveBeenCalled();
    expect(mockEngines.live.size).toBe(1);
    expect(auth.log).not.toContain('signOut');
  });

  test('unmount stops the engine and unsubscribes from auth', async () => {
    const auth = fakeAuth(user('alice'));
    const s = setup(auth);
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.sync).not.toBeNull());
    await act(async () => view.unmount());
    await settle();
    expect(mockEngines.live.size).toBe(0);
    expect(auth.listeners.size).toBe(0);
  });

  test('the context value and actions are stable across sync status changes', async () => {
    const auth = fakeAuth(user('alice'));
    const s = setup(auth);
    const seen: AccountState[] = [];
    const view = await renderHook(
      () => {
        const a = useAccount();
        seen.push(a);
        return a;
      },
      { wrapper: s.wrapper },
    );
    await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
    const first = seen[0]!;
    const last = seen.at(-1)!;
    expect(last.signIn).toBe(first.signIn);
    expect(last.deleteAccount).toBe(first.deleteAccount);
    expect(last.syncNow).toBe(first.syncNow);
  });

  test('a default backend that cannot be created leaves the app signed out', async () => {
    const warn = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
    const storage = createStorage(memoryBackend());
    const wrapper = ({ children }: { children: ReactNode }) => (
      <AccountProvider signInGate={ALWAYS_ALLOWED} storage={storage} remoteFor={() => createMemoryRemote()} domains={DOMAINS}>
        {children}
      </AccountProvider>
    );
    const view = await renderHook(() => useAccount(), { wrapper });
    await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
    const error = await failure(() => view.result.current.signIn({ kind: 'password', email: 'x@example.com', password: 'pw' }));
    expect((error as AuthError).kind).toBe('unknown');
    expect(warn).toHaveBeenCalledTimes(1);
    warn.mockRestore();
  });
});
