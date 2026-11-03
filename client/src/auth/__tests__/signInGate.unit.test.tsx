// Unit tests for the sign-in gate's races in the account provider (R6b-gate): a gate flip during a sign-in,
// a delete or a user switch never leaves an engine running and ends signed out; reopening the gate does
// nothing by itself; the gate is unsubscribed on unmount; a gate that throws fails closed.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount } from '../AccountProvider';
import type { SignInGate } from '../signInGate';
import { AuthError, type AccountState, type AuthBackend, type AuthUser } from '../types';

// Wraps the real engine so the test sees every start and stop.
const mockEngines = { live: new Set<number>(), started: [] as string[], nextId: 0 };
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

beforeEach(() => {
  mockEngines.live.clear();
  mockEngines.started = [];
});

interface Fake extends AuthBackend {
  emit(user: AuthUser | null): void;
  log: string[];
  /** When set, signIn waits for it before signing in. */
  signInGate: Promise<void> | null;
}

function fakeAuth(initial: AuthUser | null): Fake {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const log: string[] = [];
  const emit = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const fake: Fake = {
    emit,
    log,
    signInGate: null,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m) {
      log.push('signIn');
      if (fake.signInGate) await fake.signInGate;
      const u = { uid: m.email.split('@')[0]!, email: m.email };
      emit(u);
      return u;
    },
    async signUp(email) {
      log.push('signUp');
      const u = { uid: email.split('@')[0]!, email };
      emit(u);
      return u;
    },
    async signOut() {
      log.push('signOut');
      emit(null);
    },
    async sendPasswordReset() {
      log.push('reset');
    },
    async reauthenticate() {
      log.push('reauth');
    },
    async getIdToken() {
      return user ? `token-${user.uid}` : null;
    },
  };
  return fake;
}

function manualGate(initial: boolean): SignInGate & { set(open: boolean): void; listeners: Set<() => void> } {
  let open = initial;
  const listeners = new Set<() => void>();
  return {
    listeners,
    allowed: () => open,
    subscribe(l) {
      listeners.add(l);
      return () => void listeners.delete(l);
    },
    set(next) {
      open = next;
      listeners.forEach((l) => l());
    },
  };
}

function setup(auth: Fake, gate: SignInGate, deleteRequest?: (token: string) => Promise<void>) {
  const storage: Storage = createStorage(memoryBackend());
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider
      auth={auth}
      storage={storage}
      remoteFor={remoteFor}
      domains={DOMAINS}
      signInGate={gate}
      deleteAccountRequest={deleteRequest ?? (async () => undefined)}
    >
      {children}
    </AccountProvider>
  );
  return { storage, remotes, wrapper };
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 20))));

async function rejection(run: () => Promise<void>): Promise<unknown> {
  let error: unknown;
  await act(async () => {
    try {
      await run();
    } catch (e) {
      error = e;
    }
  });
  return error;
}

const ALICE: AuthUser = { uid: 'alice', email: 'alice@example.com' };

test('the gate closes while a sign-in is in flight: it rejects not-allowed, signs out, never starts an engine', async () => {
  const auth = fakeAuth(null);
  const gate = manualGate(true);
  const s = setup(auth, gate);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));

  let release!: () => void;
  auth.signInGate = new Promise<void>((r) => (release = r));
  let error: unknown;
  let done!: Promise<void>;
  await act(async () => {
    done = view.result.current.signIn({ kind: 'password', email: 'alice@example.com', password: 'pw' }).catch((e: unknown) => {
      error = e;
    });
  });
  await act(async () => gate.set(false));
  await act(async () => {
    release();
    await done;
  });
  await settle();
  expect(error).toBeInstanceOf(AuthError);
  expect((error as AuthError).kind).toBe('not-allowed');
  expect(auth.log).toEqual(['signIn', 'signOut']);
  expect(view.result.current.status).toBe('signedOut');
  expect(mockEngines.started).toEqual([]);
});

test('the gate closes during a delete: no engine resumes, and a failed delete still ends signed out', async () => {
  const auth = fakeAuth(ALICE);
  const gate = manualGate(true);
  let fail!: (e: unknown) => void;
  const s = setup(auth, gate, () => new Promise<void>((_, reject) => (fail = reject)));
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
  expect(mockEngines.live.size).toBe(1);

  let error: unknown;
  let done!: Promise<void>;
  await act(async () => {
    done = view.result.current.deleteAccount('pw').catch((e: unknown) => {
      error = e;
    });
  });
  await waitFor(() => expect(fail).toBeDefined());
  expect(mockEngines.live.size).toBe(0);
  await act(async () => gate.set(false));
  await settle();
  expect(auth.log).not.toContain('signOut'); // the sign-out waits for the delete to settle
  await act(async () => {
    fail(new AuthError('unknown', 'server said no'));
    await done;
  });
  await settle();
  expect((error as AuthError).kind).toBe('unknown');
  expect(auth.log).toContain('signOut');
  expect(view.result.current.status).toBe('signedOut');
  expect(mockEngines.live.size).toBe(0);
  expect(mockEngines.started).toEqual(['alice']);
});

test('the gate closes during a user switch: the old engine stops, none starts for the new user, who is signed out', async () => {
  const auth = fakeAuth(ALICE);
  const gate = manualGate(true);
  const s = setup(auth, gate);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
  await act(async () => {
    auth.emit({ uid: 'bob', email: 'bob@example.com' });
    gate.set(false);
  });
  await settle();
  expect(mockEngines.started).toEqual(['alice']);
  expect(mockEngines.live.size).toBe(0);
  expect(view.result.current.status).toBe('signedOut');
  expect(view.result.current.sync).toBeNull();
});

test('reopening the gate does nothing by itself; signing in afterwards works', async () => {
  const auth = fakeAuth(ALICE);
  const gate = manualGate(false);
  const s = setup(auth, gate);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  await settle();
  expect(view.result.current.signInAllowed).toBe(false);
  await act(async () => gate.set(true));
  await settle();
  expect(view.result.current.signInAllowed).toBe(true);
  expect(view.result.current.status).toBe('signedOut');
  expect(auth.log).toEqual(['signOut']);
  expect(mockEngines.started).toEqual([]);
  await act(() => view.result.current.signIn({ kind: 'password', email: 'alice@example.com', password: 'pw' }));
  await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
  expect(mockEngines.started).toEqual(['alice']);
});

test('password reset is off behind the gate too', async () => {
  const auth = fakeAuth(null);
  const s = setup(auth, manualGate(false));
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  const error = await rejection(() => view.result.current.sendPasswordReset('kid@example.com'));
  expect((error as AuthError).kind).toBe('not-allowed');
  expect(auth.log).toEqual([]);
});

test('the gate is subscribed on mount and unsubscribed on unmount', async () => {
  const gate = manualGate(true);
  const s = setup(fakeAuth(null), gate);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  expect(gate.listeners.size).toBe(1);
  await act(async () => view.unmount());
  expect(gate.listeners.size).toBe(0);
});

test('a gate that throws fails closed', async () => {
  const warn = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  try {
    const auth = fakeAuth(ALICE);
    const gate: SignInGate = {
      allowed: () => {
        throw new Error('broken');
      },
      subscribe: () => () => undefined,
    };
    const s = setup(auth, gate);
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
    await settle();
    expect(view.result.current.signInAllowed).toBe(false);
    expect(auth.log).toEqual(['signOut']);
    expect(mockEngines.started).toEqual([]);
    const state: AccountState = view.result.current;
    const error = await rejection(() => state.signUp('kid@example.com', 'whatever1').then(() => undefined));
    expect((error as AuthError).kind).toBe('not-allowed');
  } finally {
    warn.mockRestore();
  }
});
