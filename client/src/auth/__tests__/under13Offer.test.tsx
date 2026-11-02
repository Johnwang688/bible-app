// Acceptance tests (orchestrator-owned; the implementer may not edit them): FOLLOW-UP item 2 (John, 2026-11-02).
// A signed-in user who later picks Under 13 is signed out and sync stops (as before), and the provider offers to
// delete the account and its synced data. The delete runs while sign-in is off: re-auth first (a fresh sign-in
// with the offered email, no sync engine), then the backend delete with a fresh token, then sign out.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { z } from 'zod';

import { createStorage, memoryBackend, type KeyValueBackend, type Storage, type StorageKey } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { syncStateKey } from '../../sync/state';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount } from '../AccountProvider';
import { storageGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser, type SignInMethod } from '../types';

const onboardingKey: StorageKey<{ done: boolean; ageRange: string | null }> = {
  key: 'onboarding',
  version: 1,
  schema: z.object({ done: z.boolean(), ageRange: z.string().nullable() }),
  fallback: { done: false, ageRange: null },
};
const notUnder13 = (o: { done: boolean; ageRange: string | null }) => o.done && o.ageRange !== 'under-13';

const KID = { uid: 'kid', email: 'kid@example.com', password: 'right password' };

/** A fake Firebase Auth with a server-side account table and an ordered log of calls. */
function fakeAuth(startSignedIn: boolean) {
  let user: AuthUser | null = startSignedIn ? { uid: KID.uid, email: KID.email } : null;
  const listeners = new Set<(u: AuthUser | null) => void>();
  /** Accounts on the server: email → { uid, password }. */
  const server = new Map<string, { uid: string; password: string }>([[KID.email, { uid: KID.uid, password: KID.password }]]);
  const log: string[] = [];
  /** A sign-in counter: a token carries the sign-in it came from, so a test can tell a fresh one. */
  let signIns = 0;
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const backend: AuthBackend & { server: typeof server; log: string[] } = {
    server,
    log,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(method: SignInMethod) {
      log.push(`signIn:${method.email}`);
      const acct = server.get(method.email);
      if (!acct || acct.password !== method.password) throw new AuthError('wrong-credentials');
      signIns++;
      const u = { uid: acct.uid, email: method.email };
      set(u);
      return u;
    },
    async signUp() {
      throw new AuthError('unknown', 'not used');
    },
    async signOut() {
      log.push('signOut');
      set(null);
    },
    async sendPasswordReset() {},
    async reauthenticate(method: SignInMethod) {
      log.push('reauthenticate');
      const acct = server.get(method.email);
      if (!acct || acct.password !== method.password || acct.uid !== user?.uid) throw new AuthError('wrong-credentials');
      signIns++;
    },
    async getIdToken(forceRefresh?: boolean) {
      if (!user) return null;
      log.push(`getIdToken:${forceRefresh ? 'fresh' : 'cached'}`);
      return `h.${btoa(JSON.stringify({ sub: user.uid, signIn: signIns }))}.s`;
    },
  };
  return backend;
}

function setup(opts: { startSignedIn?: boolean; storage?: Storage; backend?: KeyValueBackend; deleteFails?: boolean } = {}) {
  const backend = opts.backend ?? memoryBackend();
  const storage = opts.storage ?? createStorage(backend);
  if (!opts.storage) storage.set(onboardingKey, { done: true, ageRange: '18-24' });
  const auth = fakeAuth(opts.startSignedIn ?? true);
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  /** The backend's DELETE /api/v1/account: needs a token from a sign-in made for this delete (recent login). */
  const deleteAccountRequest = jest.fn(async (token: string) => {
    auth.log.push('deleteRequest');
    if (opts.deleteFails) throw new AuthError('unknown', 'delete account failed: HTTP 500');
    const claims = JSON.parse(atob(token.split('.')[1]!)) as { sub: string; signIn: number };
    if (claims.signIn < 1) throw new AuthError('requires-recent-login');
    for (const [email, acct] of auth.server) if (acct.uid === claims.sub) auth.server.delete(email);
  });
  const gate = storageGate(storage, onboardingKey, notUnder13);
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} signInGate={gate} deleteAccountRequest={deleteAccountRequest}>
      {children}
    </AccountProvider>
  );
  return { storage, backend, auth, remotes, wrapper, deleteAccountRequest };
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 30))));
const remoteCalls = (remotes: Map<string, MemoryRemote>) => [...remotes.values()].reduce((n, r) => n + r.calls.length, 0);

/** Signed in and synced once, then Under 13 is picked: returns the rendered hook and the setup. */
async function pickUnder13WhileSignedIn(extra: { deleteFails?: boolean } = {}) {
  const s = setup(extra);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
  await waitFor(() => expect(view.result.current.sync?.lastSyncedAt).not.toBeNull());
  expect(s.backend.getString(syncStateKey(KID.uid).key)).toBeDefined();
  await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  await settle();
  return { s, view };
}

describe('Under 13 picked while signed in', () => {
  test('signs out, stops sync and offers to delete the account', async () => {
    const { s, view } = await pickUnder13WhileSignedIn();
    expect(view.result.current.signInAllowed).toBe(false);
    expect(view.result.current.sync).toBeNull();
    expect(view.result.current.under13Offer).toEqual({ email: KID.email });
    // Signing out alone deletes nothing.
    expect(s.auth.server.has(KID.email)).toBe(true);
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
  });

  test('the offer survives a restart', async () => {
    const { s, view } = await pickUnder13WhileSignedIn();
    view.unmount();
    const again = setup({ startSignedIn: false, storage: s.storage, backend: s.backend });
    const view2 = await renderHook(() => useAccount(), { wrapper: again.wrapper });
    await waitFor(() => expect(view2.result.current.status).toBe('signedOut'));
    expect(view2.result.current.under13Offer).toEqual({ email: KID.email });
  });

  test('delete: re-auth first, then the delete with a fresh token, then sign out; no sync on the way', async () => {
    const { s, view } = await pickUnder13WhileSignedIn();
    const callsBefore = remoteCalls(s.remotes);
    s.auth.log.length = 0;

    await act(async () => view.result.current.deleteOfferedAccount(KID.password));
    await settle();

    const log = s.auth.log;
    const signIn = log.indexOf(`signIn:${KID.email}`);
    const token = log.indexOf('getIdToken:fresh');
    const del = log.indexOf('deleteRequest');
    const out = log.lastIndexOf('signOut');
    expect(signIn).toBeGreaterThanOrEqual(0);
    expect(token).toBeGreaterThan(signIn);
    expect(del).toBeGreaterThan(token);
    expect(out).toBeGreaterThan(del);

    expect(s.auth.server.has(KID.email)).toBe(false);
    expect(view.result.current.status).toBe('signedOut');
    expect(view.result.current.under13Offer).toBeNull();
    expect(view.result.current.sync).toBeNull();
    // The account's sync history on this device is forgotten.
    expect(s.backend.getString(syncStateKey(KID.uid).key)).toBeUndefined();
    // No sync engine ran while the account was signed in again for the delete.
    expect(remoteCalls(s.remotes)).toBe(callsBefore);
  });

  test('a wrong password deletes nothing and keeps the offer', async () => {
    const { s, view } = await pickUnder13WhileSignedIn();
    let error: unknown;
    await act(async () => {
      await view.result.current.deleteOfferedAccount('wrong password').catch((e: unknown) => (error = e));
    });
    await settle();
    expect(error).toBeInstanceOf(AuthError);
    expect((error as AuthError).kind).toBe('wrong-credentials');
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    expect(s.auth.server.has(KID.email)).toBe(true);
    expect(view.result.current.status).toBe('signedOut');
    expect(view.result.current.under13Offer).toEqual({ email: KID.email });
  });

  test('a failed delete ends signed out, keeps the offer and the sync history', async () => {
    const { s, view } = await pickUnder13WhileSignedIn({ deleteFails: true });
    const callsBefore = remoteCalls(s.remotes);
    let error: unknown;
    await act(async () => {
      await view.result.current.deleteOfferedAccount(KID.password).catch((e: unknown) => (error = e));
    });
    await settle();
    expect(error).toBeInstanceOf(AuthError);
    expect(s.auth.server.has(KID.email)).toBe(true);
    expect(s.auth.currentUser()).toBeNull();
    expect(view.result.current.status).toBe('signedOut');
    expect(view.result.current.under13Offer).toEqual({ email: KID.email });
    expect(s.backend.getString(syncStateKey(KID.uid).key)).toBeDefined();
    expect(remoteCalls(s.remotes)).toBe(callsBefore);
  });

  test('the email now signs in to another account: nothing is deleted', async () => {
    const { s, view } = await pickUnder13WhileSignedIn();
    s.auth.server.set(KID.email, { uid: 'someone-else', password: KID.password });
    let error: unknown;
    await act(async () => {
      await view.result.current.deleteOfferedAccount(KID.password).catch((e: unknown) => (error = e));
    });
    await settle();
    expect(error).toBeInstanceOf(AuthError);
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    expect(s.auth.currentUser()).toBeNull();
    expect(view.result.current.under13Offer).toEqual({ email: KID.email });
  });

  test('"Not now" drops the offer, also after a restart; the account stays', async () => {
    const { s, view } = await pickUnder13WhileSignedIn();
    await act(async () => view.result.current.dismissUnder13Offer());
    expect(view.result.current.under13Offer).toBeNull();
    expect(s.auth.server.has(KID.email)).toBe(true);
    view.unmount();
    const again = setup({ startSignedIn: false, storage: s.storage, backend: s.backend });
    const view2 = await renderHook(() => useAccount(), { wrapper: again.wrapper });
    await waitFor(() => expect(view2.result.current.status).toBe('signedOut'));
    expect(view2.result.current.under13Offer).toBeNull();
  });
});

describe('no offer otherwise', () => {
  test('an ordinary sign-out makes no offer, and deleteOfferedAccount rejects not-allowed', async () => {
    const s = setup();
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
    await act(async () => view.result.current.signOut());
    await settle();
    expect(view.result.current.under13Offer).toBeNull();
    let error: unknown;
    await act(async () => {
      await view.result.current.deleteOfferedAccount(KID.password).catch((e: unknown) => (error = e));
    });
    expect((error as AuthError).kind).toBe('not-allowed');
    expect(s.auth.log).not.toContain(`signIn:${KID.email}`);
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
  });

  test('Under 13 picked while signed out makes no offer', async () => {
    const s = setup({ startSignedIn: false });
    const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
    await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
    await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    await settle();
    expect(view.result.current.under13Offer).toBeNull();
  });
});
