// R6b-fu-sec4-provider (security review 4, S4-3): the Under 13 offer is recorded only when the gate goes from open to
// closed while that account is signed in, in this run of the provider. A session restored, or a sign-in completed,
// with the gate already closed is signed out with no offer; the closing is remembered across a failed sign-out, and
// forgotten when the gate opens again.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount } from '../AccountProvider';
import type { SignInGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser, type SignInMethod } from '../types';
import { readUnder13Offer } from '../under13Offer';

const KID = { uid: 'kid', email: 'kid@example.com', password: 'pw' };
const KID_USER: AuthUser = { uid: KID.uid, email: KID.email };

function fakeAuth(initial: AuthUser | null) {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const controls = { signOutFailures: 0, signInHold: null as Promise<void> | null };
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const backend: AuthBackend = {
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m: SignInMethod) {
      if (controls.signInHold) await controls.signInHold;
      if (m.email !== KID.email || m.password !== KID.password) throw new AuthError('wrong-credentials');
      set(KID_USER);
      return KID_USER;
    },
    async signUp() {
      throw new AuthError('unknown');
    },
    signOut: jest.fn(async () => {
      if (controls.signOutFailures > 0) {
        controls.signOutFailures--;
        throw new AuthError('unknown', 'local sign-out failed');
      }
      set(null);
    }),
    async sendPasswordReset() {},
    async reauthenticate() {},
    async getIdToken() {
      return user ? `h.${btoa(JSON.stringify({ sub: user.uid }))}.s` : null;
    },
  };
  /** Another tab (or the SDK restoring a session) changes the signed-in user. */
  const externally = (u: AuthUser | null) => set(u);
  return { ...backend, controls, externally };
}

/** A gate the test opens and closes. */
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

async function setup(initial: AuthUser | null, gate: SignInGate) {
  const storage = createStorage(memoryBackend());
  const auth = fakeAuth(initial);
  const remote = createMemoryRemote();
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={() => remote} domains={DOMAINS} signInGate={gate} deleteAccountRequest={async () => undefined}>
      {children}
    </AccountProvider>
  );
  const view = await renderHook(() => useAccount(), { wrapper });
  return { storage, auth, view };
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 30))));

beforeEach(() => jest.spyOn(console, 'warn').mockImplementation(() => undefined));
afterEach(() => jest.restoreAllMocks());

test('a session restored behind a closed gate: no offer, also after the gate opens and closes again while signed out', async () => {
  const gate = switchGate(false);
  const { storage, auth, view } = await setup(KID_USER, gate);
  await waitFor(() => expect(auth.currentUser()).toBeNull());
  await settle();
  expect(view.result.current.under13Offer).toBeNull();

  await act(async () => gate.set(true));
  await act(async () => gate.set(false)); // nobody signed in when it closed
  await settle();
  expect(readUnder13Offer(storage)).toBeNull();
  expect(view.result.current.under13Offer).toBeNull();
  await view.unmount();
});

test('a sign-in that completes after the gate closed is signed out with no offer', async () => {
  const gate = switchGate(true);
  const { storage, auth, view } = await setup(null, gate);
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  let release!: () => void;
  auth.controls.signInHold = new Promise<void>((r) => (release = r));

  let error: unknown;
  let signingIn!: Promise<void>;
  await act(async () => {
    signingIn = view.result.current.signIn({ kind: 'password', email: KID.email, password: KID.password }).catch((e: unknown) => {
      error = e;
    });
  });
  await act(async () => gate.set(false)); // Under 13 picked while the sign-in is still in flight (nobody signed in yet)
  await act(async () => {
    release();
    await signingIn;
  });
  await settle();

  expect((error as AuthError).kind).toBe('not-allowed');
  expect(auth.currentUser()).toBeNull();
  expect(readUnder13Offer(storage)).toBeNull();
  expect(view.result.current.under13Offer).toBeNull();
  await view.unmount();
});

test('Under 13 picked while signed in, first sign-out fails: the offer is recorded when the retry signs out', async () => {
  const gate = switchGate(true);
  const { storage, auth, view } = await setup(KID_USER, gate);
  await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
  auth.controls.signOutFailures = 1;

  await act(async () => gate.set(false));
  await settle();
  expect(auth.currentUser()?.uid).toBe(KID.uid); // the gate's sign-out failed
  expect(readUnder13Offer(storage)).toBeNull();

  await act(async () => gate.set(false)); // the next gate change tries again (still closed: no new open → closed)
  await waitFor(() => expect(auth.currentUser()).toBeNull());
  await settle();
  expect(readUnder13Offer(storage)).toEqual({ uid: KID.uid, email: KID.email });
  expect(view.result.current.under13Offer).toEqual({ email: KID.email });
  await view.unmount();
});

test('the gate opening again forgets the closing: a later restore behind the closed gate makes no offer', async () => {
  const gate = switchGate(true);
  const { storage, auth, view } = await setup(KID_USER, gate);
  await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
  auth.controls.signOutFailures = 1;
  await act(async () => gate.set(false)); // closed while signed in; the gate's sign-out fails
  await settle();
  expect(auth.currentUser()?.uid).toBe(KID.uid);

  await act(async () => gate.set(true)); // 13+ after all
  await act(async () => view.result.current.signOut()); // an ordinary sign-out
  expect(auth.currentUser()).toBeNull();
  await act(async () => gate.set(false)); // closed again, nobody signed in
  await act(async () => auth.externally(KID_USER)); // the session comes back (another tab)
  await waitFor(() => expect(auth.currentUser()).toBeNull()); // the gate signs it out
  await settle();
  expect(readUnder13Offer(storage)).toBeNull();
  expect(view.result.current.under13Offer).toBeNull();
  await view.unmount();
});
