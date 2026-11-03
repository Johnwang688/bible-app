import { act } from '@testing-library/react-native';
import { useState } from 'react';

import { useAccountMemoryAuth, type AccountAuthDeps, type AccountView } from '../voice/accountAuth';
import type { MemoryAuth } from '../voice/auth';
import { renderMemory } from './memoryHarness';

jest.mock('../../auth/firebaseApp', () => { throw new Error('Firebase must remain lazy'); });

function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((yes) => { resolve = yes; });
  return { promise, resolve };
}
function view(uid: string | null, signInAllowed = true): AccountView {
  return { status: uid === null ? 'signedOut' : 'signedIn', user: uid === null ? null : { uid, email: `${uid}@example.com` }, signInAllowed };
}
async function setup(initial: AccountView, deps?: Partial<AccountAuthDeps>) {
  let auth!: MemoryAuth;
  let update!: (account: AccountView) => void;
  function Probe() {
    const [account, setAccount] = useState(initial);
    update = setAccount;
    auth = useAccountMemoryAuth(account, deps);
    return null;
  }
  await renderMemory(() => <Probe />);
  return { read: () => auth, change: async (account: AccountView) => { await act(async () => { update(account); }); } };
}

// Finding: endpoint equality misses a sign-out or user switch that returns to the same uid while a token awaits.
it.each(['sign-out', 'user-switch'] as const)('rejects a pending token after a %s and return to the same uid', async (change) => {
  const pending = deferred<{ uid: string; token: string } | null>();
  const source = jest.fn(() => pending.promise);
  const s = await setup(view('alice'), { currentToken: source });
  const token = s.read().getIdToken();
  expect(source).toHaveBeenCalledTimes(1);
  await s.change(view(change === 'sign-out' ? null : 'bob'));
  await s.change(view('alice'));
  pending.resolve({ uid: 'alice', token: 'pre-change-token' });
  await expect(token).resolves.toBeNull();
});

it('does not import Firebase on bridge import or a signed-out default token read', async () => {
  const s = await setup(view(null));
  await expect(s.read().getIdToken()).resolves.toBeNull();
});

it('rejects a wrong-uid token and a token landing while signed out', async () => {
  const source = jest.fn(async () => ({ uid: 'bob', token: 'bob-token' }));
  const s = await setup(view('alice'), { currentToken: source });
  await expect(s.read().getIdToken()).resolves.toBeNull();
  const pending = deferred<{ uid: string; token: string } | null>();
  source.mockImplementationOnce(() => pending.promise as Promise<{ uid: string; token: string }>);
  const token = s.read().getIdToken();
  await s.change(view(null));
  pending.resolve({ uid: 'alice', token: 'alice-token' });
  await expect(token).resolves.toBeNull();
});

it('keeps value identity and a slow current token across unchanged account renders', async () => {
  const pending = deferred<{ uid: string; token: string } | null>();
  const s = await setup(view('alice'), { currentToken: () => pending.promise });
  const initial = s.read();
  const token = initial.getIdToken();
  await s.change(view('alice'));
  expect(s.read()).toBe(initial);
  pending.resolve({ uid: 'alice', token: 'current-token' });
  await expect(token).resolves.toBe('current-token');
});

it('does not offer sign-in while sign-in is off', async () => {
  const openSignIn = jest.fn();
  const s = await setup(view(null, false), { openSignIn });
  expect(s.read().signIn).toBeUndefined();
  await s.change(view(null, true));
  s.read().signIn!();
  expect(openSignIn).toHaveBeenCalledTimes(1);
  await s.change(view(null, false));
  expect(s.read().signIn).toBeUndefined();
});
