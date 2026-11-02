// The Under 13 offer's delete on the provider's concurrency chain (FOLLOW-UP item 2): a second delete while one
// runs rejects, "Not now" during a run is ignored, the re-auth never shows as a sign-in, enforceGate does not sign
// it out underneath the delete, a sign-in clears the offer, and no engine starts even with the gate open.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount } from '../AccountProvider';
import { ALWAYS_ALLOWED, SIGN_IN_OFF, type SignInGate } from '../signInGate';
import { AuthError, type AccountState, type AuthBackend, type AuthUser, type SignInMethod } from '../types';
import { readUnder13Offer, recordUnder13Offer } from '../under13Offer';

const KID = { uid: 'kid', email: 'kid@example.com', password: 'pw' };

function deferred() {
  let resolve!: () => void;
  const promise = new Promise<void>((r) => (resolve = r));
  return { promise, resolve };
}

function fakeAuth() {
  let user: AuthUser | null = null;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const log: string[] = [];
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const backend: AuthBackend & { log: string[]; signInGate: Promise<void> | null } = {
    log,
    signInGate: null,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m: SignInMethod) {
      log.push(`signIn:${m.email}`);
      if (m.password !== KID.password) throw new AuthError('wrong-credentials');
      const u = { uid: KID.uid, email: m.email };
      set(u);
      if (backend.signInGate) await backend.signInGate;
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
    async reauthenticate() {},
    async getIdToken() {
      return user ? `h.${btoa(JSON.stringify({ sub: user.uid }))}.s` : null;
    },
  };
  return backend;
}

function setup(gate: SignInGate = SIGN_IN_OFF) {
  const storage: Storage = createStorage(memoryBackend());
  recordUnder13Offer(storage, { uid: KID.uid, email: KID.email });
  const auth = fakeAuth();
  const remote: MemoryRemote = createMemoryRemote();
  const request = { held: null as Promise<void> | null };
  const deleteRequest = jest.fn(async () => {
    auth.log.push('deleteRequest');
    if (request.held) await request.held;
  });
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={() => remote} domains={DOMAINS} signInGate={gate} deleteAccountRequest={deleteRequest}>
      {children}
    </AccountProvider>
  );
  return { storage, auth, remote, request, deleteRequest, wrapper };
}

async function rejection(p: Promise<unknown>): Promise<unknown> {
  try {
    await p;
  } catch (e) {
    return e;
  }
  throw new Error('expected a rejection');
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 30))));

test('while the delete runs: a second delete rejects, "Not now" is ignored, the re-auth is not shown, no sign-out underneath', async () => {
  const s = setup();
  const seen: AccountState[] = [];
  const view = await renderHook(
    () => {
      const a = useAccount();
      seen.push(a);
      return a;
    },
    { wrapper: s.wrapper },
  );
  await waitFor(() => expect(view.result.current.under13Offer).toEqual({ email: KID.email }));
  const held = deferred();
  s.request.held = held.promise;

  let first!: Promise<void>;
  await act(async () => {
    first = view.result.current.deleteOfferedAccount(KID.password);
  });
  await waitFor(() => expect(s.deleteRequest).toHaveBeenCalledTimes(1));

  // The re-auth is signed in, the gate is closed: enforceGate must wait for the delete, not sign out now.
  expect(s.auth.currentUser()?.uid).toBe(KID.uid);
  await settle();
  expect(s.auth.log).not.toContain('signOut');
  // The person never sees a sign-in.
  expect(seen.every((a) => a.status !== 'signedIn' && a.user === null)).toBe(true);

  const second = (await rejection(view.result.current.deleteOfferedAccount(KID.password))) as AuthError;
  expect(second).toBeInstanceOf(AuthError);
  await act(async () => view.result.current.dismissUnder13Offer());
  expect(readUnder13Offer(s.storage)).toEqual({ uid: KID.uid, email: KID.email });

  await act(async () => {
    held.resolve();
    await first;
  });
  await settle();
  expect(s.auth.log.filter((l) => l.startsWith('signIn'))).toHaveLength(1);
  expect(s.deleteRequest).toHaveBeenCalledTimes(1);
  expect(s.auth.currentUser()).toBeNull();
  expect(view.result.current.under13Offer).toBeNull();
  expect(seen.every((a) => a.status !== 'signedIn')).toBe(true);
  expect(s.remote.calls).toHaveLength(0);
});

test('with the gate open again, the re-auth still starts no engine', async () => {
  const s = setup(ALWAYS_ALLOWED);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.under13Offer).toEqual({ email: KID.email }));
  const held = deferred();
  s.auth.signInGate = held.promise; // the re-auth is signed in and its auth callback has fired
  let done!: Promise<void>;
  await act(async () => {
    done = view.result.current.deleteOfferedAccount(KID.password);
  });
  await settle();
  expect(s.remote.calls).toHaveLength(0);
  expect(view.result.current.status).toBe('signedOut');
  await act(async () => {
    held.resolve();
    await done;
  });
  await settle();
  expect(s.remote.calls).toHaveLength(0);
  expect(view.result.current.status).toBe('signedOut');
  expect(view.result.current.under13Offer).toBeNull();
});

test('an ordinary sign-in clears the offer', async () => {
  const s = setup(ALWAYS_ALLOWED);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.under13Offer).toEqual({ email: KID.email }));
  await act(async () => view.result.current.signIn({ kind: 'password', email: KID.email, password: KID.password }));
  await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
  expect(view.result.current.under13Offer).toBeNull();
  expect(readUnder13Offer(s.storage)).toBeNull();
  await act(async () => view.result.current.signOut());
  await settle();
});
