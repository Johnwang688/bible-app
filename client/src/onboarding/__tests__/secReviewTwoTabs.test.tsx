// INT security review F1 (Opus, 11-02), kept as a regression test. Counterexample: two web tabs share one localStorage, but storage.subscribe only hears its own
// tab. A second tab that opened on the intro keeps showing it after Under 13 was picked in the first tab, and its
// "Skip for now" (or another age) overwrites the stored Under 13: the device's gate opens and sign-in succeeds.
import { act, renderHook } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { AccountProvider, useAccount } from '../../auth/AccountProvider';
import type { AuthBackend, AuthUser } from '../../auth/types';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { useFirstRun } from '../firstRun';
import { onboardingKey } from '../keys';
import { appSignInGateFor } from '../signIn';

function fakeAuth(): AuthBackend & { log: string[] } {
  let user: AuthUser | null = null;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const log: string[] = [];
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  return {
    log,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m) {
      log.push('signIn');
      set({ uid: 'kid', email: m.email });
      return { uid: 'kid', email: m.email };
    },
    async signUp(email) {
      log.push('signUp');
      set({ uid: 'kid', email });
      return { uid: 'kid', email };
    },
    async signOut() {
      set(null);
    },
    async sendPasswordReset() {},
    async reauthenticate() {},
    async getIdToken() {
      return user ? 't' : null;
    },
  };
}

/** One "tab": its own Storage (own listeners) over the shared localStorage, as getStorage() is per tab. */
async function tab(shared: ReturnType<typeof memoryBackend>) {
  const storage: Storage = createStorage(shared);
  const auth = fakeAuth();
  const remote = createMemoryRemote();
  const wrapper = ({ children }: { children: ReactNode }) => (
    <ThemeProvider storage={storage} systemScheme="light">
      <AccountProvider auth={auth} storage={storage} remoteFor={() => remote} domains={DOMAINS} signInGate={appSignInGateFor(storage)}>
        {children}
      </AccountProvider>
    </ThemeProvider>
  );
  const view = await renderHook(() => ({ run: useFirstRun(storage), account: useAccount() }), { wrapper });
  return { storage, auth, view };
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 20))));

it('Under 13 picked in one tab stays Under 13 when a second tab (opened on the intro) skips it', async () => {
  const shared = memoryBackend(); // the browser's localStorage
  const a = await tab(shared);
  const b = await tab(shared);
  await settle();
  expect(a.view.result.current.run.needed).toBe(true);
  expect(b.view.result.current.run.needed).toBe(true);

  // Tab A: the reader picks Under 13.
  await act(async () => a.view.result.current.run.finish('under-13'));
  expect(a.storage.get(onboardingKey)).toEqual({ done: true, ageRange: 'under-13' });

  // Tab B never heard it: the intro is still on screen there.
  expect(b.view.result.current.run.needed).toBe(true);

  // Tab B: the reader taps "Skip for now" on the still-showing intro.
  await act(async () => b.view.result.current.run.skip());
  await settle();

  // Requirement 1: the Under 13 answer must still hold, so sign-in stays off.
  expect(b.storage.get(onboardingKey).ageRange).toBe('under-13');
  expect(appSignInGateFor(b.storage).allowed()).toBe(false);
  // And tab B leaves the intro instead of staying on it.
  expect(b.view.result.current.run.needed).toBe(false);
});

it('a stale tab finishing with another age keeps the stored Under 13', async () => {
  const shared = memoryBackend();
  const a = await tab(shared);
  const b = await tab(shared);
  await settle();
  await act(async () => a.view.result.current.run.finish('under-13'));
  await act(async () => b.view.result.current.run.finish('25-34'));
  await settle();
  expect(b.storage.get(onboardingKey)).toEqual({ done: true, ageRange: 'under-13' });
  expect(b.view.result.current.run.needed).toBe(false);
});

it('(the same, shown end to end) the Under 13 reader can then sign in from either tab', async () => {
  const shared = memoryBackend();
  const a = await tab(shared);
  const b = await tab(shared);
  await settle();
  await act(async () => a.view.result.current.run.finish('under-13'));
  await act(async () => b.view.result.current.run.skip());
  await settle();
  let rejected = false;
  await act(async () => {
    await a.view.result.current.account.signIn({ kind: 'password', email: 'kid@example.com', password: 'pw' }).catch(() => (rejected = true));
  });
  await settle();
  expect(a.auth.log).toEqual([]); // nothing may reach the auth backend for an Under 13 reader
  expect(rejected).toBe(true);
});
