// R6b-fu-u13-fix1: an account deleted on this device is never offered again, whichever path signs it out later
// (the gate's sign-out lifts `blockedUid`, so the offer reads its own record of deleted uids), and an offered delete
// whose every in-flow sign-out fails still ends signed out (the gate retries once the hold is released).
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount } from '../AccountProvider';
import { SIGN_IN_OFF, type SignInGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser, type SignInMethod } from '../types';
import { readUnder13Offer, recordUnder13Offer } from '../under13Offer';

const KID = { uid: 'kid', email: 'kid@example.com', password: 'pw' };

function fakeAuth(initial: AuthUser | null) {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const controls = { signOutFailures: 0 };
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
      if (m.email !== KID.email || m.password !== KID.password) throw new AuthError('wrong-credentials');
      const u = { uid: KID.uid, email: KID.email };
      set(u);
      return u;
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
  return { ...backend, controls };
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

function setup(initial: AuthUser | null, gate: SignInGate) {
  const storage = createStorage(memoryBackend());
  const auth = fakeAuth(initial);
  const remote = createMemoryRemote();
  const deleteRequest = jest.fn(async () => undefined);
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={() => remote} domains={DOMAINS} signInGate={gate} deleteAccountRequest={deleteRequest}>
      {children}
    </AccountProvider>
  );
  return { storage, auth, deleteRequest, wrapper };
}

beforeEach(() => jest.spyOn(console, 'warn').mockImplementation(() => undefined));
afterEach(() => jest.restoreAllMocks());

test('an account deleted here whose sign-out failed is not offered when the gate later signs it out', async () => {
  const gate = switchGate(true);
  const s = setup({ uid: KID.uid, email: KID.email }, gate);
  s.auth.controls.signOutFailures = 1;
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
  await act(async () => view.result.current.deleteAccount(KID.password));
  expect(s.deleteRequest).toHaveBeenCalledTimes(1);
  expect(s.auth.currentUser()?.uid).toBe(KID.uid); // its own sign-out failed

  await act(async () => gate.set(false)); // Under 13 picked: the gate signs the deleted account out
  await waitFor(() => expect(s.auth.currentUser()).toBeNull());
  await act(async () => undefined);
  expect(readUnder13Offer(s.storage)).toBeNull();
  expect(view.result.current.under13Offer).toBeNull();
  await view.unmount();
});

test('an offered delete whose every in-flow sign-out fails ends signed out through the gate, with no offer back', async () => {
  const s = setup(null, SIGN_IN_OFF);
  recordUnder13Offer(s.storage, { uid: KID.uid, email: KID.email });
  // finishDeleted's sign-out and all three of the flow's own tries fail; the gate's pass afterwards succeeds.
  s.auth.controls.signOutFailures = 4;
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.under13Offer).toEqual({ email: KID.email }));
  await act(async () => view.result.current.deleteOfferedAccount(KID.password));
  expect(s.deleteRequest).toHaveBeenCalledTimes(1);
  await waitFor(() => expect(s.auth.currentUser()).toBeNull());
  await act(async () => undefined);
  expect(s.auth.signOut).toHaveBeenCalledTimes(5);
  expect(readUnder13Offer(s.storage)).toBeNull();
  expect(view.result.current.under13Offer).toBeNull();
  expect(view.result.current.status).toBe('signedOut');
  await view.unmount();
});
