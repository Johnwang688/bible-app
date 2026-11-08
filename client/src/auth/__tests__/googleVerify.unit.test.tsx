// GOOGLE meets email verification (merge of #55 into #51): Firebase marks a Gmail address that signs in with Google
// verified, so a Google sign-in on a backend that verifies emails reports the user confirmed: nothing to confirm, and
// sync starts at once (the popup's new ID token already carries the claim). A Google sign-in that lands on an account
// this run saw unconfirmed (the same uid) is held like any confirmation in the run, until a forced token refresh.
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { AccountProvider, useAccount } from '../AccountProvider';
import { NEW_ACCOUNT_AT, unconfirmed, verifyingAuth, type VerifyFake } from './verifyFake';
import { ALWAYS_ALLOWED } from '../signInGate';
import { AuthError, type AuthUser } from '../types';

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

/** The verifying fake plus Google's window: it signs in `who`, confirmed (as Firebase does for a Gmail address). */
function googleAuth(initial: AuthUser | null, who: AuthUser): VerifyFake {
  const auth = verifyingAuth(initial);
  auth.signInWithGoogle = async () => {
    auth.log.push('google');
    auth.server.emailVerified = true;
    const u: AuthUser = { ...who, providers: ['google'], emailVerified: true };
    auth.emit(u);
    return u;
  };
  return auth;
}

async function mount(auth: VerifyFake) {
  const storage = createStorage(memoryBackend());
  const remotes = new Map<string, MemoryRemote>();
  const remoteFor = (uid: string) => {
    if (!remotes.has(uid)) remotes.set(uid, createMemoryRemote());
    return remotes.get(uid)!;
  };
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider signInGate={ALWAYS_ALLOWED} auth={auth} storage={storage} remoteFor={remoteFor} domains={DOMAINS} continueUrl="https://app.test/me?verified=1">
      {children}
    </AccountProvider>
  );
  const view = await renderHook(() => useAccount(), { wrapper });
  await waitFor(() => expect(view.result.current.status).not.toBe('loading'));
  return view;
}

const settle = () => act(async () => new Promise((r) => setTimeout(r, 20)));

describe('Google sign-in with email verification', () => {
  test('a Google sign-in is confirmed: nothing to confirm, and sync starts with no forced refresh', async () => {
    const auth = googleAuth(null, { uid: 'gina', email: 'gina@gmail.com', createdAt: NEW_ACCOUNT_AT });
    const view = await mount(auth);
    await act(async () => {
      await view.result.current.signIn({ kind: 'google' });
    });
    expect(view.result.current.status).toBe('signedIn');
    expect(view.result.current.user?.emailVerified).toBe(true);
    expect(view.result.current.verify).toBeNull();
    await waitFor(() => expect(mockEngines.started).toEqual(['gina']));
    expect(auth.log).not.toContain('token:forced');
    expect(auth.log.some((l) => l.startsWith('send:'))).toBe(false);
  });

  test('Google landing on an account this run saw unconfirmed waits for the forced refresh before syncing', async () => {
    const auth = googleAuth(unconfirmed('gina'), { uid: 'gina', email: 'gina@example.com', createdAt: NEW_ACCOUNT_AT });
    mockEngines.sink = auth.log;
    const view = await mount(auth);
    await settle();
    expect(view.result.current.verify?.kind).toBe('new');
    expect(mockEngines.started).toEqual([]);
    await act(async () => {
      await view.result.current.signIn({ kind: 'google' });
    });
    await waitFor(() => expect(mockEngines.started).toEqual(['gina']));
    expect(view.result.current.verify).toBeNull();
    const forced = auth.log.indexOf('token:forced');
    expect(forced).toBeGreaterThan(auth.log.indexOf('google'));
    expect(auth.log.indexOf('engine:gina')).toBeGreaterThan(forced);
  });

  test('...and while that refresh fails, nothing syncs', async () => {
    const auth = googleAuth(unconfirmed('gina'), { uid: 'gina', email: 'gina@example.com', createdAt: NEW_ACCOUNT_AT });
    auth.refreshFails = new AuthError('network');
    const view = await mount(auth);
    await settle();
    await act(async () => {
      await view.result.current.signIn({ kind: 'google' });
    });
    await settle();
    expect(auth.log).toContain('token:forced:failed');
    expect(view.result.current.verify).toBeNull();
    expect(mockEngines.started).toEqual([]);
  });
});
