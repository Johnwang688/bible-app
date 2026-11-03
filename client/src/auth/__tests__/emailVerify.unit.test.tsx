// Email verification in the account provider (11-03, prototype r6b-verify.html): with a backend that verifies emails,
// no engine runs while the email is unconfirmed; sign-up sends the link with the continue URL and language; Send again
// keeps a 60 s cooldown per uid that survives a remount (and 5 min after too-many-requests); checkVerified reloads,
// refreshes the token before the engine starts, and shows the "confirmed" notice; a session ended by an email change
// signs out with the "email changed" notice; Change email re-authenticates then calls verifyBeforeUpdateEmail; the
// card's state tells a new account from one that synced before. A backend without the capability is unchanged.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { AppState, type AppStateStatus } from 'react-native';

import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { syncStateKey, EMPTY_SYNC_STATE } from '../../sync/state';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount, VERIFY_SHIPPED_AT } from '../AccountProvider';
import { unconfirmed, verifyingAuth } from './verifyFake';
import { ALWAYS_ALLOWED } from '../signInGate';
import { AuthError, type AccountState, type AuthBackend } from '../types';
import { readVerifyRecord, RESEND_COOLDOWN_MS, TOO_MANY_HOLD_MS } from '../verifyStore';

/** Engine starts, also written into `sink` (an auth fake's log) when set, to order them against auth calls. */
const mockEngines = { started: [] as string[], sink: null as string[] | null };
jest.mock('../../sync/engine', () => {
  const actual = jest.requireActual<typeof import('../../sync/engine')>('../../sync/engine');
  return {
    ...actual,
    createSyncEngine: (opts: Parameters<typeof actual.createSyncEngine>[0]) => {
      const engine = actual.createSyncEngine(opts);
      return {
        ...engine,
        start() {
          mockEngines.started.push(opts.uid);
          mockEngines.sink?.push(`engine:${opts.uid}`);
          engine.start();
        },
      };
    },
  };
});
jest.mock('../firebaseApp', () => ({
  getFirebaseAuth: () => {
    throw new Error('no firebase here');
  },
}));

beforeEach(() => {
  mockEngines.started = [];
  mockEngines.sink = null;
});

const fakeAuth = verifyingAuth;

interface SetupOptions {
  storage?: Storage;
  now?: () => number;
  deleteAccountRequest?: (idToken: string) => Promise<void>;
}

function setup(auth: AuthBackend, opts: SetupOptions = {}) {
  const storage = opts.storage ?? createStorage(memoryBackend());
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider
      signInGate={ALWAYS_ALLOWED}
      auth={auth}
      storage={storage}
      remoteFor={remoteFor}
      domains={DOMAINS}
      continueUrl="https://app.test/me?verified=1"
      now={opts.now}
      deleteAccountRequest={opts.deleteAccountRequest}
    >
      {children}
    </AccountProvider>
  );
  return { storage, wrapper, remotes };
}

async function mount(auth: AuthBackend, opts: Parameters<typeof setup>[1] = {}) {
  const env = setup(auth, opts);
  const view = await renderHook(() => useAccount(), { wrapper: env.wrapper });
  await waitFor(() => expect(view.result.current.status).not.toBe('loading'));
  return { ...env, view };
}

async function run<T>(fn: () => Promise<T>): Promise<T> {
  let out!: T;
  await act(async () => {
    out = await fn();
  });
  return out;
}

async function failure(fn: () => Promise<unknown>): Promise<AuthError> {
  let error: unknown = null;
  await act(async () => {
    try {
      await fn();
    } catch (e) {
      error = e;
    }
  });
  return error as AuthError;
}

const settle = () => act(async () => new Promise((r) => setTimeout(r, 20)));

describe('email verification: the sync hold', () => {
  test('no engine runs for an unconfirmed account; the card state is "new"', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    const { view } = await mount(auth);
    await settle();
    expect(view.result.current.status).toBe('signedIn');
    expect(mockEngines.started).toEqual([]);
    expect(view.result.current.sync).toBeNull();
    expect(view.result.current.verify).toEqual({ kind: 'new', sent: false, resendAt: null, pendingEmail: null });
  });

  test('an unconfirmed user with no emailVerified at all is held too (fail closed)', async () => {
    const auth = fakeAuth({ uid: 'alice', email: 'alice@example.com' });
    const { view } = await mount(auth);
    await settle();
    expect(mockEngines.started).toEqual([]);
    expect(view.result.current.verify?.kind).toBe('new');
  });

  test('a confirmed account syncs at once, and has nothing to confirm', async () => {
    const auth = fakeAuth({ ...unconfirmed('alice'), emailVerified: true });
    const { view } = await mount(auth);
    await waitFor(() => expect(mockEngines.started).toEqual(['alice']));
    expect(view.result.current.verify).toBeNull();
  });

  test('a backend that does not verify emails syncs as before', async () => {
    const auth = fakeAuth({ uid: 'alice', email: 'alice@example.com' });
    delete (auth as { verifiesEmail?: true }).verifiesEmail;
    const { view } = await mount(auth);
    await waitFor(() => expect(mockEngines.started).toEqual(['alice']));
    expect(view.result.current.verify).toBeNull();
  });

  test('an account made before the change, or with sync history here, is "paused"', async () => {
    const old = fakeAuth(unconfirmed('old', VERIFY_SHIPPED_AT - 1));
    const a = await mount(old);
    expect(a.view.result.current.verify?.kind).toBe('paused');
    await a.view.unmount();

    const storage = createStorage(memoryBackend());
    storage.set(syncStateKey('synced'), { ...EMPTY_SYNC_STATE, items: { ...EMPTY_SYNC_STATE.items, cursor: 5 } });
    const b = await mount(fakeAuth(unconfirmed('synced')), { storage });
    expect(b.view.result.current.verify?.kind).toBe('paused');
    expect(mockEngines.started).toEqual([]);
  });
});

describe('email verification: sign-up and Send again', () => {
  test('sign-up sends the link with the continue URL and language, and starts the cooldown', async () => {
    const auth = fakeAuth(null);
    let now = 1_000_000;
    const { view, storage } = await mount(auth, { now: () => now });
    const result = await run(() => view.result.current.signUp('new@example.com', 'longenough', 'zh-CN'));
    expect(result.sendError).toBeNull();
    expect(auth.log).toContain('send:zh-CN:https://app.test/me?verified=1');
    expect(view.result.current.verify).toEqual({ kind: 'new', sent: true, resendAt: now + RESEND_COOLDOWN_MS, pendingEmail: null });
    expect(readVerifyRecord(storage, 'new')?.fresh).toBe(true);
    await settle();
    expect(mockEngines.started).toEqual([]);

    // Inside the cooldown Send again is refused before reaching Firebase.
    now += 30_000;
    const early = await failure(() => view.result.current.sendVerification('en'));
    expect(early).toBeInstanceOf(AuthError);
    expect(auth.log.filter((l) => l.startsWith('send:'))).toHaveLength(1);
    now += 31_000;
    await run(() => view.result.current.sendVerification('en'));
    expect(auth.log.filter((l) => l.startsWith('send:'))).toHaveLength(2);
  });

  test('a failed send does not fail the sign-up: the account exists and the error is reported', async () => {
    const auth = fakeAuth(null);
    auth.sendFails = new AuthError('network');
    const { view } = await mount(auth);
    const result = await run(() => view.result.current.signUp('new@example.com', 'longenough'));
    expect(result.sendError?.kind).toBe('network');
    expect(view.result.current.status).toBe('signedIn');
    expect(view.result.current.verify?.sent).toBe(false);
    expect(view.result.current.verify?.resendAt).toBeNull();
  });

  test('the cooldown is per uid and survives a remount (a reload of the page)', async () => {
    const storage = createStorage(memoryBackend());
    const now = 5_000_000;
    const auth = fakeAuth(unconfirmed('alice'));
    const first = await mount(auth, { storage, now: () => now });
    await run(() => first.view.result.current.sendVerification());
    await first.view.unmount();
    const again = await mount(fakeAuth(unconfirmed('alice')), { storage, now: () => now + 1000 });
    expect(again.view.result.current.verify?.resendAt).toBe(now + RESEND_COOLDOWN_MS);
    await again.view.unmount();
    const other = await mount(fakeAuth(unconfirmed('bob')), { storage, now: () => now + 1000 });
    expect(other.view.result.current.verify?.resendAt).toBeNull();
  });

  test('too-many-requests holds Send again for 5 minutes', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    auth.sendFails = new AuthError('too-many-requests');
    const now = 9_000_000;
    const { view } = await mount(auth, { now: () => now });
    const error = await failure(() => view.result.current.sendVerification());
    expect(error.kind).toBe('too-many-requests');
    expect(view.result.current.verify?.resendAt).toBe(now + TOO_MANY_HOLD_MS);
  });
});

describe('email verification: checkVerified', () => {
  test('not yet: false, and nothing starts', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    const { view } = await mount(auth);
    expect(await run(() => view.result.current.checkVerified())).toBe(false);
    await settle();
    expect(mockEngines.started).toEqual([]);
    expect(view.result.current.notice).toBeNull();
  });

  test('confirmed: the token is refreshed before the engine starts, the notice shows, the record goes', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    const { view, storage } = await mount(auth);
    await run(() => view.result.current.sendVerification());
    expect(readVerifyRecord(storage, 'alice')).not.toBeNull();
    auth.server.emailVerified = true;
    expect(await run(() => view.result.current.checkVerified())).toBe(true);
    await waitFor(() => expect(mockEngines.started).toEqual(['alice']));
    const forced = auth.log.indexOf('token:forced');
    expect(forced).toBeGreaterThan(auth.log.indexOf('reload'));
    expect(view.result.current.verify).toBeNull();
    expect(view.result.current.notice).toEqual({ kind: 'confirmed' });
    expect(readVerifyRecord(storage, 'alice')).toBeNull();
    await act(async () => view.result.current.dismissNotice());
    expect(view.result.current.notice).toBeNull();
  });

  test('concurrent checks share one reload', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    const { view } = await mount(auth);
    await run(() => Promise.all([view.result.current.checkVerified(), view.result.current.checkVerified(), view.result.current.checkVerified()]));
    expect(auth.log.filter((l) => l === 'reload')).toHaveLength(1);
  });

  test('coming back to the front checks an unconfirmed account', async () => {
    const handlers: ((s: AppStateStatus) => void)[] = [];
    const subscription = () => ({ remove: () => undefined }) as ReturnType<typeof AppState.addEventListener>;
    const spy = jest.spyOn(AppState, 'addEventListener').mockImplementation((_type, handler) => {
      handlers.push(handler as (s: AppStateStatus) => void);
      return subscription();
    });
    try {
      const auth = fakeAuth(unconfirmed('alice'));
      const { view } = await mount(auth);
      auth.server.emailVerified = true;
      await act(async () => {
        handlers.forEach((h) => h('active'));
        await new Promise((r) => setTimeout(r, 10));
      });
      await waitFor(() => expect(view.result.current.verify).toBeNull());
      expect(auth.log).toContain('reload');
      await waitFor(() => expect(mockEngines.started).toEqual(['alice']));
    } finally {
      // Not mockRestore (AppState's own mock would then return no subscription): later providers get a plain one.
      spy.mockImplementation(subscription);
    }
  });

  test('a session ended by the email change signs out, with the "email changed" notice', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    const { view, storage } = await mount(auth);
    await run(() => view.result.current.changeEmail('alice.new@example.com', 'pw', 'en'));
    expect(view.result.current.verify?.pendingEmail).toBe('alice.new@example.com');
    auth.server.sessionGone = true;
    expect(await run(() => view.result.current.checkVerified())).toBe(false);
    expect(auth.log).toContain('signOut');
    expect(view.result.current.status).toBe('signedOut');
    expect(view.result.current.notice).toEqual({ kind: 'emailChanged', email: 'alice.new@example.com' });
    expect(readVerifyRecord(storage, 'alice')).toBeNull();
    // Signing in again ends that news.
    auth.server.emailVerified = true;
    auth.server.sessionGone = false;
    await run(() => view.result.current.signIn({ kind: 'password', email: 'alice@example.com', password: 'pw' }));
    expect(view.result.current.notice).toBeNull();
  });
});

describe('email verification: Change email', () => {
  test('re-authenticates, then sends the link to the new address; Send again goes there too; Keep the old email drops it', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    let now = 1_000;
    const { view } = await mount(auth, { now: () => now });
    await run(() => view.result.current.changeEmail('  alice.new@example.com ', 'pw', 'zh-CN'));
    expect(auth.log.slice(-2)).toEqual(['reauth:alice@example.com', 'change:alice.new@example.com:zh-CN']);
    expect(view.result.current.verify?.pendingEmail).toBe('alice.new@example.com');
    now += RESEND_COOLDOWN_MS + 1;
    await run(() => view.result.current.sendVerification('en'));
    expect(auth.log.at(-1)).toBe('change:alice.new@example.com:en');
    await act(async () => view.result.current.keepOldEmail());
    expect(view.result.current.verify?.pendingEmail).toBeNull();
  });

  test('a wrong password sends nothing', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    const { view } = await mount(auth);
    const error = await failure(() => view.result.current.changeEmail('x@example.com', 'nope'));
    expect(error.kind).toBe('wrong-credentials');
    expect(auth.log.some((l) => l.startsWith('change:'))).toBe(false);
    expect(view.result.current.verify?.pendingEmail).toBeNull();
  });
});

describe('email verification: no engine before the forced token refresh (security review)', () => {
  test("the SDK's reload reports the user confirmed before the refresh: no engine starts before token:forced", async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    auth.reloadNotifies = true;
    mockEngines.sink = auth.log;
    const { view } = await mount(auth);
    auth.server.emailVerified = true;
    expect(await run(() => view.result.current.checkVerified())).toBe(true);
    await waitFor(() => expect(mockEngines.started).toEqual(['alice']));
    const forced = auth.log.indexOf('token:forced');
    expect(forced).toBeGreaterThan(auth.log.indexOf('reload'));
    expect(auth.log.indexOf('engine:alice')).toBeGreaterThan(forced);
    expect(view.result.current.notice).toEqual({ kind: 'confirmed' });
  });

  test.each([
    ['notifies on reload', true],
    ['does not notify on reload', false],
  ])('a failed refresh (backend %s) starts no engine; the next check refreshes again, then starts it', async (_l, notifies) => {
    const auth = fakeAuth(unconfirmed('alice'));
    auth.reloadNotifies = notifies;
    auth.refreshFails = new AuthError('network');
    mockEngines.sink = auth.log;
    const { view } = await mount(auth);
    auth.server.emailVerified = true;
    const error = await failure(() => view.result.current.checkVerified());
    expect(error.kind).toBe('network');
    await settle();
    expect(mockEngines.started).toEqual([]);
    expect(view.result.current.verify).toBeNull(); // auth says confirmed; sync waits for the token
    expect(view.result.current.notice).toBeNull();
    // A check while the refresh still fails does not answer true without one.
    expect((await failure(() => view.result.current.checkVerified())).kind).toBe('network');
    await settle();
    expect(mockEngines.started).toEqual([]);

    auth.refreshFails = null;
    expect(await run(() => view.result.current.checkVerified())).toBe(true);
    await waitFor(() => expect(mockEngines.started).toEqual(['alice']));
    expect(auth.log.indexOf('engine:alice')).toBeGreaterThan(auth.log.indexOf('token:forced'));
    expect(auth.log.filter((l) => l === 'token:forced:failed').length).toBeGreaterThanOrEqual(2);
    expect(view.result.current.notice).toEqual({ kind: 'confirmed' });    await settle();
  });

  test('a confirmation seen outside a check (another tab) is held until a refresh; syncNow retries a failed one', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    auth.refreshFails = new AuthError('network');
    mockEngines.sink = auth.log;
    const { view } = await mount(auth);
    await act(async () => auth.emit({ ...unconfirmed('alice'), emailVerified: true }));
    await settle();
    expect(auth.log).toContain('token:forced:failed'); // the provider asked for the refresh itself
    expect(mockEngines.started).toEqual([]);
    expect(auth.log).not.toContain('reload');

    auth.refreshFails = null;
    await run(() => view.result.current.syncNow());
    await waitFor(() => expect(mockEngines.started).toEqual(['alice']));
    expect(auth.log.indexOf('engine:alice')).toBeGreaterThan(auth.log.indexOf('token:forced'));
  });

  test('a session restored already confirmed is not held', async () => {
    const auth = fakeAuth({ ...unconfirmed('alice'), emailVerified: true });
    await mount(auth);
    await waitFor(() => expect(mockEngines.started).toEqual(['alice']));
    expect(auth.log).not.toContain('token:forced');
  });
});

describe('email verification: a session found gone (security review)', () => {
  test('the SDK signed itself out inside reload: signed out, the "email changed" notice, the record gone', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    const { view, storage } = await mount(auth);
    await run(() => view.result.current.changeEmail('alice.new@example.com', 'pw', 'en'));
    auth.server.sessionGone = true;
    auth.onReload = () => auth.emit(null);
    expect(await run(() => view.result.current.checkVerified())).toBe(false);
    expect(view.result.current.status).toBe('signedOut');
    expect(view.result.current.notice).toEqual({ kind: 'emailChanged', email: 'alice.new@example.com' });
    expect(readVerifyRecord(storage, 'alice')).toBeNull();
    expect(auth.log).not.toContain('signOut'); // nothing left to sign out
  });

  test('another account is signed in when the gone error arrives: it is not signed out', async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    const { view, storage } = await mount(auth);
    await run(() => view.result.current.changeEmail('alice.new@example.com', 'pw', 'en'));
    auth.server.sessionGone = true;
    auth.onReload = () => auth.emit({ ...unconfirmed('bob'), emailVerified: true });
    expect(await run(() => view.result.current.checkVerified())).toBe(false);
    await settle();
    expect(auth.log).not.toContain('signOut');
    expect(view.result.current.status).toBe('signedIn');
    expect(view.result.current.user?.uid).toBe('bob');
    expect(readVerifyRecord(storage, 'alice')).toBeNull();
    expect(view.result.current.notice).toEqual({ kind: 'emailChanged', email: 'alice.new@example.com' });
  });
});

describe('email verification: delete and sign-out (security review)', () => {
  test("an unconfirmed account's delete reads nothing remote", async () => {
    const auth = fakeAuth(unconfirmed('alice'));
    const requests: string[] = [];
    const { view, remotes } = await mount(auth, { deleteAccountRequest: async (token) => void requests.push(token) });
    await run(() => view.result.current.deleteAccount('pw'));
    expect(requests).toEqual(['token-alice']);
    expect(view.result.current.status).toBe('signedOut');
    expect([...remotes.values()].flatMap((r) => r.calls)).toEqual([]);
  });

  test('an ordinary sign-out forgets the pending address, and keeps the cooldown, sent and fresh', async () => {
    const auth = fakeAuth(null);
    let now = 1_000_000;
    const { view, storage } = await mount(auth, { now: () => now });
    await run(() => view.result.current.signUp('alice@example.com', 'longenough'));
    now += RESEND_COOLDOWN_MS + 1;
    await run(() => view.result.current.changeEmail('alice.new@example.com', 'pw'));
    expect(readVerifyRecord(storage, 'alice')?.pending).toBe('alice.new@example.com');
    await run(() => view.result.current.signOut());
    expect(view.result.current.status).toBe('signedOut');
    expect(readVerifyRecord(storage, 'alice')).toMatchObject({
      pending: null,
      sent: true,
      fresh: true,
      resendAt: now + RESEND_COOLDOWN_MS,
    });
  });
});

test('the AccountState type carries the new fields', () => {
  const keys: (keyof AccountState)[] = ['verify', 'notice', 'sendVerification', 'checkVerified', 'changeEmail', 'keepOldEmail', 'dismissNotice'];
  expect(keys).toHaveLength(7);
});
