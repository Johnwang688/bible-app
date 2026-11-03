// Acceptance (INT, orchestrator-owned): the gate `_layout.tsx` gives AccountProvider. Sign-in and sync stay off
// until the intro is done, and off for Under 13; an adult who finished or skipped the intro may sign in.
import { act, renderHook } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { AccountProvider, useAccount } from '../../auth/AccountProvider';
import { AuthError, type AuthBackend, type AuthUser } from '../../auth/types';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AGE_RANGES, onboardingKey, type Onboarding } from '../keys';
import { appSignInGateFor } from '../signIn';

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

function setup(initial: AuthUser | null, onboarding: Onboarding | null) {
  const storage: Storage = createStorage(memoryBackend());
  if (onboarding) storage.set(onboardingKey, onboarding);
  const auth = fakeAuth(initial);
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} signInGate={appSignInGateFor(storage)}>
      {children}
    </AccountProvider>
  );
  return { storage, auth, remotes, wrapper };
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 20))));

describe('appSignInGateFor', () => {
  it('is closed on a new device (intro not done), whatever the age', () => {
    const storage = createStorage(memoryBackend());
    expect(appSignInGateFor(storage).allowed()).toBe(false);
    for (const ageRange of [null, ...AGE_RANGES]) {
      storage.set(onboardingKey, { done: false, ageRange });
      expect([ageRange, appSignInGateFor(storage).allowed()]).toEqual([ageRange, false]);
    }
  });

  it('once the intro is done: open, except for Under 13', () => {
    const storage = createStorage(memoryBackend());
    for (const ageRange of [null, ...AGE_RANGES]) {
      storage.set(onboardingKey, { done: true, ageRange });
      expect([ageRange, appSignInGateFor(storage).allowed()]).toEqual([ageRange, ageRange !== 'under-13']);
    }
  });

  it('reads storage live and tells listeners when the first-run state changes', () => {
    const storage = createStorage(memoryBackend());
    const gate = appSignInGateFor(storage);
    const seen: boolean[] = [];
    const off = gate.subscribe(() => seen.push(gate.allowed()));
    storage.set(onboardingKey, { done: false, ageRange: '25-34' });
    storage.set(onboardingKey, { done: true, ageRange: '25-34' });
    storage.set(onboardingKey, { done: true, ageRange: 'under-13' });
    off();
    storage.set(onboardingKey, { done: true, ageRange: null });
    expect(seen).toEqual([false, true, false]);
    expect(gate.allowed()).toBe(true);
  });
});

describe('AccountProvider behind the app gate', () => {
  it('intro not done: a restored session is signed out, never syncs, and sign-in is refused', async () => {
    const { auth, remotes, wrapper } = setup(ALICE, null);
    const { result } = await renderHook(() => useAccount(), { wrapper });
    await settle();
    expect(result.current.signInAllowed).toBe(false);
    expect(result.current.status).toBe('signedOut');
    expect(auth.log).toContain('signOut');
    expect(remotes.size).toBe(0);
    await expect(result.current.signIn({ kind: 'password', email: 'a@example.com', password: 'pw-123456' })).rejects.toMatchObject({
      kind: 'not-allowed',
    });
    expect(auth.log).not.toContain('signIn');
  });

  it('intro not done, then Under 13 picked: sign-in stays off and nothing syncs', async () => {
    const { storage, auth, remotes, wrapper } = setup(null, null);
    const { result } = await renderHook(() => useAccount(), { wrapper });
    await settle();
    await act(async () => storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    await settle();
    expect(result.current.signInAllowed).toBe(false);
    await expect(result.current.signUp('kid@example.com', 'pw-123456')).rejects.toBeInstanceOf(AuthError);
    expect(auth.log).not.toContain('signUp');
    expect(remotes.size).toBe(0);
  });

  it('intro done as an adult: sign-in is allowed and a session syncs', async () => {
    const { remotes, wrapper } = setup(ALICE, { done: true, ageRange: '25-34' });
    const { result } = await renderHook(() => useAccount(), { wrapper });
    await settle();
    expect(result.current.signInAllowed).toBe(true);
    expect(result.current.status).toBe('signedIn');
    expect(remotes.has('alice')).toBe(true);
  });

  it('intro skipped (no age): sign-in is allowed', async () => {
    const { wrapper } = setup(null, { done: true, ageRange: null });
    const { result } = await renderHook(() => useAccount(), { wrapper });
    await settle();
    expect(result.current.signInAllowed).toBe(true);
  });
});
