// Security / privacy review round 3 (R6b-security-r3): the under-13 sign-in gate in the account provider. Each test
// states what should hold; the ones that fail on the reviewed code are findings (see the review notes).
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { z } from 'zod';

import { createStorage, memoryBackend, type Storage, type StorageKey } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount } from '../AccountProvider';
import { storageGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser } from '../types';

// Stand-in for R-7a's onboarding key, as in signInGate.test.tsx.
const onboardingKey: StorageKey<{ done: boolean; ageRange: string | null }> = {
  key: 'onboarding',
  version: 1,
  schema: z.object({ done: z.boolean(), ageRange: z.string().nullable() }),
  fallback: { done: false, ageRange: null },
};
const notUnder13 = (o: { ageRange: string | null }) => o.ageRange !== 'under-13';

/** A fake Firebase Auth with a server-side account table, so a test can see what is left on the server. */
function fakeAuth() {
  let user: AuthUser | null = null;
  const listeners = new Set<(u: AuthUser | null) => void>();
  /** Accounts on the server, by uid → email. */
  const server = new Map<string, string>();
  let hold: Promise<void> | null = null;
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const backend: AuthBackend & { server: Map<string, string>; holdNext(): () => void; deleteUser(): Promise<void> } = {
    server,
    holdNext() {
      let release!: () => void;
      hold = new Promise<void>((r) => (release = r));
      return release;
    },
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn() {
      throw new AuthError('wrong-credentials');
    },
    async signUp(email) {
      // The request reaches the server at once; the answer comes back when released.
      server.set('kid', email);
      if (hold) await hold;
      hold = null;
      const u = { uid: 'kid', email };
      set(u);
      return u;
    },
    async signOut() {
      set(null);
    },
    async sendPasswordReset() {},
    async reauthenticate() {},
    async getIdToken() {
      return user ? `h.${btoa(JSON.stringify({ sub: user.uid }))}.s` : null;
    },
    /** Firebase's deleteUser(currentUser), for a fix that removes the just-created account directly. */
    async deleteUser() {
      if (user) server.delete(user.uid);
    },
  };
  return backend;
}

function setup() {
  const storage: Storage = createStorage(memoryBackend());
  storage.set(onboardingKey, { done: true, ageRange: '18-24' });
  const auth = fakeAuth();
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  // The backend's DELETE /api/v1/account: removes the token's account.
  const deleteAccountRequest = jest.fn(async (token: string) => {
    const sub = (JSON.parse(atob(token.split('.')[1]!)) as { sub: string }).sub;
    auth.server.delete(sub);
  });
  const gate = storageGate(storage, onboardingKey, notUnder13);
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} signInGate={gate} deleteAccountRequest={deleteAccountRequest}>
      {children}
    </AccountProvider>
  );
  return { storage, auth, remotes, wrapper };
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 30))));

describe('S3-5 the gate closes while a sign-up is in flight', () => {
  test('the new account (an under-13 email) is not left on the server', async () => {
    const s = setup();
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.status).toBe('signedOut'));

    const release = s.auth.holdNext();
    let outcome: unknown = 'pending';
    await act(async () => {
      void view.result.current.signUp('kid@example.com', 'long enough').then(
        () => (outcome = 'resolved'),
        (e: unknown) => (outcome = e),
      );
    });
    // First run's age question is answered Under 13 (or corrected to it) while the request is out.
    await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    await act(async () => release());
    await settle();

    // What the gate already gets right: rejected, signed out, nothing synced.
    expect(outcome).toBeInstanceOf(AuthError);
    expect((outcome as AuthError).kind).toBe('not-allowed');
    expect(view.result.current.status).toBe('signedOut');
    expect([...s.remotes.values()].every((r) => r.calls.length === 0)).toBe(true);

    // The finding: the account just created with that email is still on the server.
    expect([...s.auth.server.values()]).not.toContain('kid@example.com');
  });
});
