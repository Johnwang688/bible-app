// Acceptance tests for the under-13 sign-in gate (R-6b, John 2026-11-02; orchestrator-owned, the implementer
// may not edit them). Under 13 → no sign-in and no sync; the age choice never leaves the device.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { z } from 'zod';

import { createStorage, memoryBackend, type Storage, type StorageKey } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS, setNote } from '../../sync/__tests__/fixtures';
import { SETTING_KEYS } from '../../sync/types';
import { AccountProvider, useAccount } from '../AccountProvider';
import { ALWAYS_ALLOWED, storageGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser } from '../types';

// Stand-in for R-7a's onboarding key (client/src/onboarding/keys.ts on r7a-firstrun).
const onboardingKey: StorageKey<{ done: boolean; ageRange: string | null }> = {
  key: 'onboarding',
  version: 1,
  schema: z.object({ done: z.boolean(), ageRange: z.string().nullable() }),
  fallback: { done: false, ageRange: null },
};
const notUnder13 = (o: { ageRange: string | null }) => o.ageRange !== 'under-13';

const ALICE: AuthUser = { uid: 'alice', email: 'alice@example.com' };

function fakeAuth(initial: AuthUser | null): AuthBackend & { log: string[] } {
  let user = initial;
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
      set({ uid: 'alice', email: m.email });
      return { uid: 'alice', email: m.email };
    },
    async signUp(email) {
      log.push('signUp');
      set({ uid: 'new', email });
      return { uid: 'new', email };
    },
    async signOut() {
      log.push('signOut');
      set(null);
    },
    async sendPasswordReset() {
      log.push('reset');
    },
    async reauthenticate() {
      log.push('reauth');
    },
    async getIdToken() {
      return user ? `token-for-${user.uid}` : null;
    },
  };
}

function setup(initial: AuthUser | null, ageRange: string | null) {
  const storage: Storage = createStorage(memoryBackend());
  storage.set(onboardingKey, { done: true, ageRange });
  const auth = fakeAuth(initial);
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  const gate = storageGate(storage, onboardingKey, notUnder13);
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} signInGate={gate}>
      {children}
    </AccountProvider>
  );
  return { storage, auth, remotes, wrapper };
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 20))));

test('the gate helpers: ALWAYS_ALLOWED, and storageGate follows the stored value live', () => {
  expect(ALWAYS_ALLOWED.allowed()).toBe(true);
  const storage = createStorage(memoryBackend());
  const gate = storageGate(storage, onboardingKey, notUnder13);
  expect(gate.allowed()).toBe(true);
  const seen: boolean[] = [];
  const off = gate.subscribe(() => seen.push(gate.allowed()));
  storage.set(onboardingKey, { done: true, ageRange: 'under-13' });
  expect(gate.allowed()).toBe(false);
  storage.set(onboardingKey, { done: true, ageRange: '18-24' });
  off();
  expect(seen).toEqual([false, true]);
});

test('under 13: signInAllowed is false, sign-in and sign-up reject without reaching auth', async () => {
  const s = setup(null, 'under-13');
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  expect(view.result.current.signInAllowed).toBe(false);
  for (const action of [
    () => view.result.current.signIn({ kind: 'password', email: 'kid@example.com', password: 'whatever1' }),
    () => view.result.current.signUp('kid@example.com', 'whatever1'),
  ]) {
    let error: unknown;
    await act(async () => {
      try {
        await action();
      } catch (e) {
        error = e;
      }
    });
    expect(error).toBeInstanceOf(AuthError);
    expect((error as AuthError).kind).toBe('not-allowed');
  }
  expect(s.auth.log).toEqual([]);
});

test('under 13 with a restored session: signs out and never starts sync', async () => {
  const s = setup(ALICE, 'under-13');
  setNote(s.storage, '43:3:16', 'stays here', 1000);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  await settle();
  expect(s.auth.log).toContain('signOut');
  expect(s.remotes.get('alice')?.calls ?? []).toEqual([]);
  expect(view.result.current.sync).toBeNull();
});

test('a signed-in user who picks Under 13 later is signed out and sync stops', async () => {
  const s = setup(ALICE, '18-24');
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.sync?.state).toBe('idle'));
  expect(view.result.current.signInAllowed).toBe(true);
  await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  expect(view.result.current.signInAllowed).toBe(false);
  const remote = s.remotes.get('alice')!;
  remote.calls.length = 0;
  setNote(s.storage, '1:1:1', 'after', 2000);
  await settle();
  expect(remote.calls).toEqual([]);
});

test('signInAllowed defaults to true without a gate', async () => {
  const storage = createStorage(memoryBackend());
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={fakeAuth(null)} storage={storage} remoteFor={() => createMemoryRemote()} domains={DOMAINS}>
      {children}
    </AccountProvider>
  );
  const view = await renderHook(() => useAccount(), { wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  expect(view.result.current.signInAllowed).toBe(true);
});

test('the age choice is never a synced setting', () => {
  expect(SETTING_KEYS).not.toContain('onboarding' as never);
});
