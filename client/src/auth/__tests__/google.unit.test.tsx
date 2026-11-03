// GOOGLE (board 11-03 row 7): "Continue with Google" through the account provider, over a fake auth backend with a
// fake Google window. A Google sign-in takes the email sign-in's path (the gate before, afterSignIn after, the offer
// and closing dropped); a Google-only account proves itself for a delete through Google's window; the Under 13 offer
// for a Google-only account re-auths with Google and never creates an account; and a wait on Google's window can be
// given up before anything is stopped or sent.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { z } from 'zod';

import { createStorage, memoryBackend, type Storage, type StorageKey } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount } from '../AccountProvider';
import { storageGate } from '../signInGate';
import { AuthError, reauthKindFor, type AuthBackend, type AuthProviderKind, type AuthUser, type GoogleSignIn, type SignInMethod } from '../types';
import { readUnder13Closing, readUnder13Offer, recordUnder13Closing, recordUnder13Offer, under13OfferKey } from '../under13Offer';

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

/** What the next Google window does: pick a Google account, or fail. */
type Window = { pick: string } | { fail: 'cancelled' | 'popup-blocked' | 'network' };

/** A fake auth backend: accounts by email, a Google window, an ordered log. */
function fakeAuth(signedIn: string | null, accounts: Record<string, Account>) {
  const server = new Map(Object.entries(accounts));
  const userFor = (email: string): AuthUser => ({ uid: server.get(email)!.uid, email, providers: [...server.get(email)!.providers].sort() });
  let user: AuthUser | null = signedIn ? userFor(signedIn) : null;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const log: string[] = [];
  let signIns = 0;
  const windows: Window[] = [];
  /** Resolves the Google window once released (to test what happens while it is open). */
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
  const backend: AuthBackend & {
    server: typeof server;
    log: string[];
    windows: Window[];
    holdWindow(): () => void;
  } = {
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
        if (options?.existingOnly) {
          log.push(`createdAndRemoved:${email}`);
          throw new AuthError('wrong-credentials');
        }
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
      log.push('reauthenticate:password');
      const acct = server.get(m.email);
      if (!acct?.password || acct.password !== m.password || acct.uid !== user?.uid) throw new AuthError('wrong-credentials');
      signIns++;
    },
    async reauthenticateWithGoogle(hint?: string) {
      log.push(`reauthenticate:google:${hint ?? ''}`);
      const email = await nextWindow();
      if (server.get(email)?.uid !== user?.uid) throw new AuthError('wrong-credentials');
      signIns++;
    },
    async getIdToken(force?: boolean) {
      if (!user) return null;
      log.push(`getIdToken:${force ? 'fresh' : 'cached'}`);
      return `h.${btoa(JSON.stringify({ sub: user.uid, signIn: signIns }))}.s`;
    },
  };
  return backend;
}

const GOOGLE_ONLY = 'gina@gmail.com';
const PASSWORD = 'pat@example.com';
const ACCOUNTS: Record<string, Account> = {
  [GOOGLE_ONLY]: { uid: 'gina', providers: ['google'] },
  [PASSWORD]: { uid: 'pat', password: 'pat password', providers: ['password'] },
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
    const claims = JSON.parse(atob(token.split('.')[1]!)) as { sub: string; signIn: number };
    if (claims.signIn < 1) throw new AuthError('requires-recent-login');
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
const remoteCalls = (remotes: Map<string, MemoryRemote>) => [...remotes.values()].reduce((n, r) => n + r.calls.length, 0);

async function mount(s: ReturnType<typeof setup>) {
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).not.toBe('loading'));
  return view;
}

async function failure(p: Promise<unknown>): Promise<AuthError> {
  let caught: unknown;
  await act(async () => {
    await p.catch((e: unknown) => (caught = e));
  });
  expect(caught).toBeInstanceOf(AuthError);
  return caught as AuthError;
}

describe('reauthKindFor', () => {
  test('password unless the account has Google and no password', () => {
    expect(reauthKindFor(null)).toBe('password');
    expect(reauthKindFor({})).toBe('password');
    expect(reauthKindFor({ providers: [] })).toBe('password');
    expect(reauthKindFor({ providers: ['password'] })).toBe('password');
    expect(reauthKindFor({ providers: ['google', 'password'] })).toBe('password');
    expect(reauthKindFor({ providers: ['google'] })).toBe('google');
  });
});

describe('Continue with Google: the same path as an email sign-in', () => {
  test('signs in (a first sign-in creates the account) and syncs', async () => {
    const s = setup();
    const view = await mount(s);
    s.auth.windows.push({ pick: 'new@gmail.com' });
    await act(async () => view.result.current.signIn({ kind: 'google' }));
    await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
    expect(view.result.current.user).toEqual({ uid: 'g-new@gmail.com', email: 'new@gmail.com', providers: ['google'] });
    await waitFor(() => expect(view.result.current.sync?.lastSyncedAt).not.toBeNull());
  });

  test('an ordinary Google sign-in never passes existingOnly or a hint, whatever the caller sends', async () => {
    const s = setup();
    const view = await mount(s);
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    await act(async () => view.result.current.signIn({ kind: 'google', existingOnly: true, loginHint: 'x@y.z' }));
    expect(s.auth.log).toContain('google:{}');
  });

  test('refused before Google is reached while sign-in is off (Under 13)', async () => {
    const s = setup({ under13: true });
    const view = await mount(s);
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    const e = await failure(view.result.current.signIn({ kind: 'google' }));
    expect(e.kind).toBe('not-allowed');
    expect(s.auth.log.filter((l) => l.startsWith('google:'))).toEqual([]);
  });

  test('Under 13 picked while Google\'s window is open: signed out again, rejected, nothing synced', async () => {
    const s = setup();
    const view = await mount(s);
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    const release = s.auth.holdWindow();
    let result: Promise<void> = Promise.resolve();
    await act(async () => {
      result = view.result.current.signIn({ kind: 'google' });
    });
    await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    release();
    const e = await failure(result);
    expect(e.kind).toBe('not-allowed');
    await settle();
    expect(view.result.current.status).toBe('signedOut');
    expect(s.auth.currentUser()).toBeNull();
    expect(remoteCalls(s.remotes)).toBe(0);
  });

  test('a Google sign-in ends an Under 13 offer and closing, like any sign-in', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(onboardingKey, { done: true, ageRange: '25-34' });
    recordUnder13Offer(storage, { uid: 'old', email: 'old@example.com' });
    recordUnder13Closing(storage, { uid: 'old', email: 'old@example.com' });
    const s = setup({ storage });
    const view = await mount(s);
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    await act(async () => view.result.current.signIn({ kind: 'google' }));
    expect(readUnder13Offer(storage)).toBeNull();
    expect(readUnder13Closing(storage)).toBeNull();
    expect(view.result.current.under13Offer).toBeNull();
  });

  test('the email has a password account: account-exists with the email; nothing signed in or linked', async () => {
    const s = setup();
    const view = await mount(s);
    s.auth.windows.push({ pick: PASSWORD });
    const e = await failure(view.result.current.signIn({ kind: 'google' }));
    expect(e.kind).toBe('account-exists');
    expect(e.email).toBe(PASSWORD);
    expect(view.result.current.status).toBe('signedOut');
    expect(s.auth.server.get(PASSWORD)!.providers).toEqual(['password']);
  });

  test('the window closed: cancelled, still signed out', async () => {
    const s = setup();
    const view = await mount(s);
    s.auth.windows.push({ fail: 'cancelled' });
    expect((await failure(view.result.current.signIn({ kind: 'google' }))).kind).toBe('cancelled');
    expect(view.result.current.status).toBe('signedOut');
  });

  test('a backend without Google refuses it', async () => {
    const s = setup();
    delete (s.auth as Partial<AuthBackend>).signInWithGoogle;
    const view = await mount(s);
    expect((await failure(view.result.current.signIn({ kind: 'google' }))).kind).toBe('unknown');
  });
});

describe('deleting a Google-only account', () => {
  test('Google proves the account, then the delete with a fresh token, then sign out', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await mount(s);
    await waitFor(() => expect(view.result.current.sync?.lastSyncedAt).not.toBeNull());
    s.auth.log.length = 0;
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    const proven = jest.fn();
    await act(async () => view.result.current.deleteAccount({ kind: 'google' }, { onProven: proven }));
    const log = s.auth.log;
    expect(log[0]).toBe(`reauthenticate:google:${GOOGLE_ONLY}`);
    expect(log.indexOf('deleteRequest')).toBeGreaterThan(log.indexOf('getIdToken:fresh'));
    expect(proven).toHaveBeenCalledTimes(1);
    expect(s.auth.server.has(GOOGLE_ONLY)).toBe(false);
    await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  });

  test('another Google account picked: wrong-credentials, nothing deleted, sync resumes', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await mount(s);
    s.auth.windows.push({ pick: 'someone@gmail.com' });
    s.auth.server.set('someone@gmail.com', { uid: 'someone', providers: ['google'] });
    const e = await failure(view.result.current.deleteAccount({ kind: 'google' }));
    expect(e.kind).toBe('wrong-credentials');
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    expect(s.auth.server.has(GOOGLE_ONLY)).toBe(true);
    await waitFor(() => expect(view.result.current.sync).not.toBeNull());
  });

  test('a Google proof for a password-only account is refused before anything', async () => {
    const s = setup({ signedIn: PASSWORD });
    const view = await mount(s);
    s.auth.log.length = 0;
    s.auth.windows.push({ pick: PASSWORD });
    const e = await failure(view.result.current.deleteAccount({ kind: 'google' }));
    expect(e.kind).toBe('unknown');
    expect(s.auth.log).toEqual([]);
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
  });

  test('given up while Google\'s window is open: cancelled, nothing stopped or sent, even though Google then proves it', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await mount(s);
    await waitFor(() => expect(view.result.current.sync?.lastSyncedAt).not.toBeNull());
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    const release = s.auth.holdWindow();
    const signal = { aborted: false };
    const proven = jest.fn();
    let result: Promise<void> = Promise.resolve();
    await act(async () => {
      result = view.result.current.deleteAccount({ kind: 'google' }, { signal, onProven: proven });
    });
    signal.aborted = true;
    release();
    expect((await failure(result)).kind).toBe('cancelled');
    expect(proven).not.toHaveBeenCalled();
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    expect(s.auth.log).not.toContain('getIdToken:fresh');
    expect(view.result.current.status).toBe('signedIn');
    expect(view.result.current.sync).not.toBeNull();
    // A later delete works (the provider's delete lock was released).
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    await act(async () => view.result.current.deleteAccount({ kind: 'google' }));
    expect(s.auth.server.has(GOOGLE_ONLY)).toBe(false);
  });

  test('an abort after Google proved the account changes nothing: the delete goes through', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await mount(s);
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    const signal = { aborted: false };
    await act(async () => view.result.current.deleteAccount({ kind: 'google' }, { signal, onProven: () => (signal.aborted = true) }));
    expect(s.deleteAccountRequest).toHaveBeenCalledTimes(1);
  });
});

describe('the Under 13 offer for a Google-only account', () => {
  async function pickUnder13(s: ReturnType<typeof setup>) {
    const view = await mount(s);
    await waitFor(() => expect(view.result.current.sync?.lastSyncedAt).not.toBeNull());
    await act(async () => s.storage.set(onboardingKey, { done: true, ageRange: 'under-13' }));
    await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
    await settle();
    return view;
  }

  test('is recorded with method google, and survives a restart', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await pickUnder13(s);
    expect(view.result.current.under13Offer).toEqual({ email: GOOGLE_ONLY, method: 'google' });
    expect(s.storage.get(under13OfferKey)).toEqual({ uid: 'gina', email: GOOGLE_ONLY, method: 'google' });
    await view.unmount();
    const again = setup({ storage: s.storage });
    const view2 = await mount(again);
    expect(view2.result.current.under13Offer).toEqual({ email: GOOGLE_ONLY, method: 'google' });
  });

  test('a password account\'s offer has no method (as before)', async () => {
    const s = setup({ signedIn: PASSWORD });
    const view = await pickUnder13(s);
    expect(view.result.current.under13Offer).toEqual({ email: PASSWORD });
    expect(s.storage.get(under13OfferKey)).toEqual({ uid: 'pat', email: PASSWORD });
  });

  test('the delete re-auths through Google (existingOnly, hinted), deletes, ends signed out; no sync on the way', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await pickUnder13(s);
    const before = remoteCalls(s.remotes);
    s.auth.log.length = 0;
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    await act(async () => view.result.current.deleteOfferedAccount({ kind: 'google' }));
    await settle();
    expect(s.auth.log[0]).toBe(`google:${JSON.stringify({ loginHint: GOOGLE_ONLY, existingOnly: true })}`);
    expect(s.auth.server.has(GOOGLE_ONLY)).toBe(false);
    expect(view.result.current.under13Offer).toBeNull();
    expect(view.result.current.status).toBe('signedOut');
    expect(s.auth.currentUser()).toBeNull();
    expect(remoteCalls(s.remotes)).toBe(before);
  });

  test('a password proof for a Google offer is refused before any sign-in', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await pickUnder13(s);
    s.auth.log.length = 0;
    const e = await failure(view.result.current.deleteOfferedAccount('a password'));
    expect(e.kind).toBe('unknown');
    expect(s.auth.log).toEqual([]);
    expect(view.result.current.under13Offer).toEqual({ email: GOOGLE_ONLY, method: 'google' });
  });

  test('a Google proof for a password offer is refused before Google is reached', async () => {
    const s = setup({ signedIn: PASSWORD });
    const view = await pickUnder13(s);
    s.auth.log.length = 0;
    const e = await failure(view.result.current.deleteOfferedAccount({ kind: 'google' }));
    expect(e.kind).toBe('unknown');
    expect(s.auth.log).toEqual([]);
  });

  test('a Google account with no app account: no account kept, nothing deleted, the offer stays, signed out', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await pickUnder13(s);
    s.auth.windows.push({ pick: 'kid.sibling@gmail.com' });
    const e = await failure(view.result.current.deleteOfferedAccount({ kind: 'google' }));
    expect(e.kind).toBe('wrong-credentials');
    expect(s.auth.log).toContain('createdAndRemoved:kid.sibling@gmail.com');
    expect(s.auth.server.has('kid.sibling@gmail.com')).toBe(false);
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    expect(view.result.current.under13Offer).toEqual({ email: GOOGLE_ONLY, method: 'google' });
    expect(s.auth.currentUser()).toBeNull();
  });

  test('another existing Google account picked: nothing deleted, signed out again, the offer stays', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await pickUnder13(s);
    s.auth.server.set('parent@gmail.com', { uid: 'parent', providers: ['google'] });
    s.auth.windows.push({ pick: 'parent@gmail.com' });
    await failure(view.result.current.deleteOfferedAccount({ kind: 'google' }));
    await settle();
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    expect(s.auth.server.has('parent@gmail.com')).toBe(true);
    expect(s.auth.currentUser()).toBeNull();
    expect(view.result.current.status).toBe('signedOut');
    expect(view.result.current.under13Offer).toEqual({ email: GOOGLE_ONLY, method: 'google' });
  });

  test('given up while Google\'s window is open: nothing deleted, signed out, the offer stays', async () => {
    const s = setup({ signedIn: GOOGLE_ONLY });
    const view = await pickUnder13(s);
    s.auth.windows.push({ pick: GOOGLE_ONLY });
    const release = s.auth.holdWindow();
    const signal = { aborted: false };
    let result: Promise<void> = Promise.resolve();
    await act(async () => {
      result = view.result.current.deleteOfferedAccount({ kind: 'google' }, { signal });
    });
    signal.aborted = true;
    release();
    expect((await failure(result)).kind).toBe('cancelled');
    await settle();
    expect(s.deleteAccountRequest).not.toHaveBeenCalled();
    expect(s.auth.server.has(GOOGLE_ONLY)).toBe(true);
    expect(s.auth.currentUser()).toBeNull();
    expect(view.result.current.under13Offer).toEqual({ email: GOOGLE_ONLY, method: 'google' });
  });
});
