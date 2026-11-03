// Acceptance (board 11-03, MEM; orchestrator-owned, implementers may not edit): Memory voice's sign-in comes from R-6b's
// account (`useAccount()`), through `useAccountMemoryAuth` in memory/voice/accountAuth.tsx. The Firebase token source
// and the sign-in opener are injected here; the defaults (Firebase's current user, the Me tab) are not exercised.
import { act, renderHook } from '@testing-library/react-native';

import type { AccountStatus, AuthUser } from '../../auth';
import { useAccountMemoryAuth, type AccountAuthDeps, type AccountView } from '../voice/accountAuth';

function view(status: AccountStatus, uid: string | null, signInAllowed = true): AccountView {
  const user: AuthUser | null = uid === null ? null : { uid, email: `${uid}@example.com` };
  return { status, user, signInAllowed };
}

function setup(initial: AccountView, current: { uid: string; token: string } | null = { uid: 'alice', token: 'alice-token' }) {
  const source = { current };
  const deps: AccountAuthDeps = {
    currentToken: jest.fn(async () => source.current),
    openSignIn: jest.fn(),
  };
  const hook = renderHook(({ account }: { account: AccountView }) => useAccountMemoryAuth(account, deps), {
    initialProps: { account: initial },
  });
  return { ...hook, deps, source };
}

it('signed in: signedIn, the uid, and the Firebase token of that user', async () => {
  const { result, deps } = setup(view('signedIn', 'alice'));
  expect(result.current.signedIn).toBe(true);
  expect(result.current.user).toBe('alice');
  await expect(result.current.getIdToken()).resolves.toBe('alice-token');
  expect(deps.currentToken).toHaveBeenCalledTimes(1);
});

it.each(['signedOut', 'loading'] as const)('%s: signed out, no token, and Firebase is never asked', async (status) => {
  const { result, deps } = setup(view(status, null));
  expect(result.current.signedIn).toBe(false);
  expect(result.current.user ?? null).toBeNull();
  await expect(result.current.getIdToken()).resolves.toBeNull();
  expect(deps.currentToken).not.toHaveBeenCalled();
});

it("a Firebase user other than the account's gives no token", async () => {
  // The account view and Firebase's current user can disagree for a moment (a re-auth, a switch of account).
  const { result } = setup(view('signedIn', 'alice'), { uid: 'bob', token: 'bob-token' });
  await expect(result.current.getIdToken()).resolves.toBeNull();
});

it('no Firebase user gives no token', async () => {
  const { result } = setup(view('signedIn', 'alice'), null);
  await expect(result.current.getIdToken()).resolves.toBeNull();
});

it('a token call held from before a sign-out gives no token', async () => {
  const { result, rerender } = setup(view('signedIn', 'alice'));
  const held = result.current;
  await act(async () => rerender({ account: view('signedOut', null) }));
  await expect(held.getIdToken()).resolves.toBeNull();
});

it('a token call held from before a switch of account gives no token for the new user', async () => {
  const { result, rerender, source } = setup(view('signedIn', 'alice'));
  const held = result.current;
  source.current = { uid: 'bob', token: 'bob-token' };
  await act(async () => rerender({ account: view('signedIn', 'bob') }));
  await expect(held.getIdToken()).resolves.toBeNull();
  await expect(result.current.getIdToken()).resolves.toBe('bob-token');
  expect(result.current.user).toBe('bob');
});

it('a failing token source rejects (the voice client shows "something went wrong", not "signed out")', async () => {
  const { result, deps } = setup(view('signedIn', 'alice'));
  (deps.currentToken as jest.Mock).mockRejectedValueOnce(new Error('auth/network-request-failed'));
  await expect(result.current.getIdToken()).rejects.toThrow();
});

it('the value is the same object across renders while status, uid and signInAllowed stay', async () => {
  const { result, rerender } = setup(view('signedIn', 'alice'));
  const first = result.current;
  await act(async () => rerender({ account: view('signedIn', 'alice') }));
  expect(result.current).toBe(first);
  await act(async () => rerender({ account: view('signedOut', null) }));
  expect(result.current).not.toBe(first);
});

it('Sign in is offered only while sign-in is allowed on this device, and opens it', async () => {
  const { result, rerender, deps } = setup(view('signedOut', null, true));
  expect(typeof result.current.signIn).toBe('function');
  result.current.signIn!();
  expect(deps.openSignIn).toHaveBeenCalledTimes(1);
  await act(async () => rerender({ account: view('signedOut', null, false) }));
  expect(result.current.signIn).toBeUndefined();
});
