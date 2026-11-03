// INT security review delta 2 (Opus, 11-02): every two-tab order of skip/finish, kept as a regression test.
// Security review counterexample: two web tabs share one localStorage, but storage.subscribe only hears its own
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

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 5))));
type Op = 'skip' | null | '18-24' | 'under-13';
const OPS: Op[] = ['skip', null, '18-24', 'under-13'];
const press = (run: ReturnType<typeof useFirstRun>, op: Op) => (op === 'skip' ? run.skip() : run.finish(op));

for (const first of OPS)
  for (const second of OPS)
    it(`tab A ${String(first)}, then stale tab B ${String(second)}`, async () => {
      const shared = memoryBackend();
      const a = await tab(shared);
      const b = await tab(shared);
      await settle();
      await act(async () => press(a.view.result.current.run, first));
      expect(b.view.result.current.run.needed).toBe(true);
      await act(async () => press(b.view.result.current.run, second));
      await settle();
      const u13 = first === 'under-13' || second === 'under-13';
      expect(a.storage.get(onboardingKey).done).toBe(true);
      expect(a.storage.get(onboardingKey).ageRange === 'under-13').toBe(u13);
      expect(appSignInGateFor(a.storage).allowed()).toBe(!u13);
      expect(a.view.result.current.account.signInAllowed && b.view.result.current.account.signInAllowed).toBe(!u13 ? a.view.result.current.account.signInAllowed && b.view.result.current.account.signInAllowed : false);
      if (u13) {
        for (const t of [a, b]) {
          let rejected = false;
          await act(async () => {
            await t.view.result.current.account.signIn({ kind: 'password', email: 'k@example.com', password: 'p' }).catch(() => (rejected = true));
          });
          expect([rejected, t.auth.log]).toEqual([true, []]);
        }
      }
    });
