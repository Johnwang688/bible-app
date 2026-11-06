// The security review of GOOGLE (Opus, 2026-11-03): its counterexamples G-2, G-3 and the delta check's D-1, kept as regression tests. Each
// asserts the required behaviour. G-2's Cancel is an AbortController now (the delete's `signal`); G-3's fix refuses
// the offered delete while a sign-in waits on Google's window (a sign-in that then completes ends the offer, as any
// sign-in does), so its assertions follow that rule.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { z } from 'zod';

import { createStorage, memoryBackend, type Storage, type StorageKey } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount } from '../AccountProvider';
import { storageGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthProviderKind, type AuthUser, type GoogleSignIn, type SignInMethod } from '../types';
import { recordUnder13Offer } from '../under13Offer';

const onboardingKey: StorageKey<{ done: boolean; ageRange: string | null }> = {
  key: 'onboarding',
  version: 1,
  schema: z.object({ done: z.boolean(), ageRange: z.string().nullable() }),
  fallback: { done: false, ageRange: null },
};
const allowedFor = (o: { done: boolean; ageRange: string | null }) => o.done && o.ageRange !== 'under-13';

interface Account {
  uid: string;
  password?: string;
  providers: AuthProviderKind[];
}
type Window = { pick: string } | { fail: 'cancelled' | 'popup-blocked' | 'network' };

function fakeAuth(signedIn: string | null, accounts: Record<string, Account>) {
  const server = new Map(Object.entries(accounts));
  const userFor = (email: string): AuthUser => ({ uid: server.get(email)!.uid, email, providers: [...server.get(email)!.providers].sort() });
  let user: AuthUser | null = signedIn ? userFor(signedIn) : null;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const log: string[] = [];
  let signIns = 0;
  const windows: Window[] = [];
  let hold: Promise<void> | null = null;
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const nextWindow = async (): Promise<string> => {
    if (hold) await hold;
    const w = windows.shift() ?? { fail: 'cancelled' as const };
    if ('fail' in w) throw new AuthError(w.fail);
    return w.pick;
  };
  const backend: AuthBackend & { server: typeof server; log: string[]; windows: Window[]; holdWindow(): () => void } = {
    server,
    log,
    windows,
    holdWindow() {
      let release!: () => void;
      hold = new Promise<void>((r) => (release = r));
      return () => {
        hold = null;
        release();
      };
    },
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m: SignInMethod) {
      log.push(`signIn:${m.email}`);
      const acct = server.get(m.email);
      if (!acct?.password || acct.password !== m.password) throw new AuthError('wrong-credentials');
      signIns++;
      const u = userFor(m.email);
      set(u);
      return u;
    },
    async signInWithGoogle(options?: Omit<GoogleSignIn, 'kind'>) {
      log.push(`google:${JSON.stringify(options ?? {})}`);
      const email = await nextWindow();
      const acct = server.get(email);
      if (acct && !acct.providers.includes('google')) throw new AuthError('account-exists', undefined, { email });
      if (!acct) {
        if (options?.existingOnly) throw new AuthError('wrong-credentials');
        server.set(email, { uid: `g-${email}`, providers: ['google'] });
      }
      signIns++;
      const u = userFor(email);
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
    async reauthenticate(m: SignInMethod) {
      const acct = server.get(m.email);
      if (!acct?.password || acct.password !== m.password || acct.uid !== user?.uid) throw new AuthError('wrong-credentials');
      signIns++;
    },
    async reauthenticateWithGoogle() {
      log.push('reauthenticate:google');
      const email = await nextWindow();
      if (server.get(email)?.uid !== user?.uid) throw new AuthError('wrong-credentials');
      signIns++;
    },
    async getIdToken() {
      if (!user) return null;
      return `h.${btoa(JSON.stringify({ sub: user.uid, signIn: signIns }))}.s`;
    },
  };
  return backend;
}

const GOOGLE_ONLY = 'gina@gmail.com';
const PASSWORD_ACCOUNT = 'pat@example.com';
const ACCOUNTS: Record<string, Account> = {
  [GOOGLE_ONLY]: { uid: 'gina', providers: ['google'] },
  [PASSWORD_ACCOUNT]: { uid: 'pat', password: 'pat password', providers: ['password'] },
};

function setup(opts: { signedIn?: string | null; storage?: Storage; under13?: boolean } = {}) {
  const storage = opts.storage ?? createStorage(memoryBackend());
  if (!opts.storage) storage.set(onboardingKey, { done: true, ageRange: opts.under13 ? 'under-13' : '25-34' });
  const auth = fakeAuth(opts.signedIn === undefined ? null : opts.signedIn, ACCOUNTS);
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  const deleteAccountRequest = jest.fn(async (token: string) => {
    auth.log.push('deleteRequest');
    const claims = JSON.parse(atob(token.split('.')[1]!)) as { sub: string };
    for (const [email, acct] of auth.server) if (acct.uid === claims.sub) auth.server.delete(email);
  });
  const gate = storageGate(storage, onboardingKey, allowedFor);
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} signInGate={gate} deleteAccountRequest={deleteAccountRequest}>
      {children}
    </AccountProvider>
  );
  return { storage, auth, remotes, wrapper, deleteAccountRequest };
}

const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 30))));

async function mount(s: ReturnType<typeof setup>) {
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).not.toBe('loading'));
  return view;
}

describe('G-2: a Google delete given up while Google\'s window stays open still holds the provider', () => {
  test('Under 13 picked after Cancel: the account should be signed out now, not when the abandoned window closes', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await mount(s);
    await waitFor(() => expect(view.result.current.sync?.lastSyncedAt).not.toBeNull());
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    const release = s.auth.holdWindow(); // the window is left open behind the page
    const cancel = new AbortController();
    let result: Promise<void> = Promise.resolve();
    await act(async () => {
      result = view.result.current.deleteAccount({ kind: 'google' }, { signal: cancel.signal }).catch(() => undefined);
    });
    await act(async () => cancel.abort()); // the sheet's Cancel / Close / scrim (abandonGoogleDelete), sheet closed
    await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    await settle();
    try {
      // The gate's sign-out happens now, not when the abandoned window closes.
      expect(s.auth.currentUser()).toBeNull();
      expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    } finally {
      release();
      await act(async () => void (await result));
    }
  });

  test('offer delete given up: "Not now" should work while the abandoned window is still open', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await mount(s);
    await waitFor(() => expect(view.result.current.sync?.lastSyncedAt).not.toBeNull());
    await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    await waitFor(() => expect(view.result.current.under13Offer).not.toBeNull());
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    const release = s.auth.holdWindow();
    const cancel = new AbortController();
    let result: Promise<void> = Promise.resolve();
    await act(async () => {
      result = view.result.current.deleteOfferedAccount({ kind: 'google' }, { signal: cancel.signal }).catch(() => undefined);
    });
    await act(async () => cancel.abort()); // Cancel: the sheet closes, the card shows the offer again
    await act(async () => view.result.current.dismissUnder13Offer());
    try {
      expect(view.result.current.under13Offer).toBeNull();
    } finally {
      release();
      await act(async () => void (await result));
    }
    // The abandoned window's late sign-in is signed out by the closed gate; nothing was deleted.
    await settle();
    expect(s.auth.currentUser()).toBeNull();
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    expect(s.auth.server.has(GOOGLE_ONLY)).toBe(true);
  });
});

describe('G-3: an ordinary Google sign-in still waiting on its window when an offered delete starts', () => {
  test('the offered delete is refused while the sign-in waits; the sign-in then completes signed in', async () => {
    const s = setup(); // gate open, signed out
    recordUnder13Offer(s.storage, { uid: 'pat', email: PASSWORD_ACCOUNT }); // an offer kept on the device
    const view = await mount(s);
    expect(view.result.current.under13Offer).toEqual({ email: PASSWORD_ACCOUNT });
    // 1. Continue with Google; the window stays open; the person closes the sheet (allowed while waiting).
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    const releaseWindow = s.auth.holdWindow();
    let signIn: Promise<unknown> = Promise.resolve();
    await act(async () => {
      signIn = view.result.current.signIn({ kind: 'google' }).then(() => 'resolved', (e: AuthError) => `rejected ${e.kind}`);
    });
    // 2. From the card: the offer's Delete with pat's password. Its request is slow and then fails (network).
    let releaseRequest!: () => void;
    const requestGate = new Promise<void>((r) => (releaseRequest = r));
    s.deleteAccountRequest.mockImplementationOnce(async () => {
      await requestGate;
      throw new AuthError('network');
    });
    let offered: Promise<unknown> = Promise.resolve();
    await act(async () => {
      offered = view.result.current.deleteOfferedAccount('pat password').then(() => 'resolved', (e: AuthError) => `rejected ${e.kind}`);
    });
    await settle();
    // 3. Google's window completes while the offered delete's request is in flight.
    releaseWindow();
    await act(async () => void (await signIn));
    releaseRequest();
    await act(async () => void (await offered));
    await settle();
    // The offered delete was refused before anything (a sign-in was waiting): nothing deleted, no request sent.
    expect(await offered).toBe('rejected unknown');
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    expect(s.auth.server.has(PASSWORD_ACCOUNT)).toBe(true);
    // The sign-in then completed and stays signed in; like any sign-in, it ended the offer.
    expect(await signIn).toBe('resolved');
    expect(s.auth.currentUser()?.email).toBe(GOOGLE_ONLY);
    expect(view.result.current.under13Offer).toBeNull();
  });
});

describe('D-1 (delta): the offered delete given up early, then the abandoned window completes late', () => {
  async function abandoned(reopenGate: boolean) {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await mount(s);
    await waitFor(() => expect(view.result.current.sync?.lastSyncedAt).not.toBeNull());
    await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    await waitFor(() => expect(view.result.current.under13Offer).not.toBeNull());
    await settle();
    const callsBefore = [...s.remotes.values()].reduce((n, r) => n + r.calls.length, 0);
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    const release = s.auth.holdWindow();
    const ctl = new AbortController();
    let result: Promise<unknown> = Promise.resolve();
    await act(async () => {
      result = view.result.current.deleteOfferedAccount({ kind: 'google' }, { signal: ctl.signal }).then(() => 'resolved', (e: AuthError) => `rejected ${e.kind}`);
    });
    ctl.abort();
    await act(async () => void (await result));
    if (reopenGate) await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: '25-34' }));
    release(); // the person finishes Google's window anyway
    await settle();
    await settle();
    const callsAfter = [...s.remotes.values()].reduce((n, r) => n + r.calls.length, 0);
    expect(await result).toBe('rejected cancelled');
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    expect(view.result.current.status).toBe('signedOut');
    expect(view.result.current.under13Offer).toEqual({ email: GOOGLE_ONLY, method: 'google' });
    return { s, view, synced: callsAfter - callsBefore };
  }

  test('gate still closed: the late sign-in is signed out again, nothing synced', async () => {
    const { s, synced } = await abandoned(false);
    expect(s.auth.currentUser()).toBeNull();
    expect(synced).toBe(0);
  });

  test('gate reopened meanwhile: the late window should not leave a signed-in, syncing session nobody asked for', async () => {
    const { s, synced } = await abandoned(true);
    expect(s.auth.currentUser()).toBeNull();
    expect(synced).toBe(0);
  });
  test('a sign-in the person starts after giving up is theirs: it stays signed in and syncs', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await mount(s);
    await waitFor(() => expect(view.result.current.sync?.lastSyncedAt).not.toBeNull());
    await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    await waitFor(() => expect(view.result.current.under13Offer).not.toBeNull());
    s.auth.windows.push({ pick: GOOGLE_ONLY }, { pick: GOOGLE_ONLY });
    const release = s.auth.holdWindow();
    const ctl = new AbortController();
    let result: Promise<unknown> = Promise.resolve();
    await act(async () => {
      result = view.result.current.deleteOfferedAccount({ kind: 'google' }, { signal: ctl.signal }).catch(() => undefined);
    });
    ctl.abort();
    await act(async () => void (await result));
    await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: '25-34' }));
    let signIn: Promise<void> = Promise.resolve();
    await act(async () => {
      signIn = view.result.current.signIn({ kind: 'google' });
    });
    release();
    await act(async () => void (await signIn));
    await settle();
    expect(s.auth.currentUser()?.email).toBe(GOOGLE_ONLY);
    await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
    await waitFor(() => expect(view.result.current.sync).not.toBeNull());
  });
});
