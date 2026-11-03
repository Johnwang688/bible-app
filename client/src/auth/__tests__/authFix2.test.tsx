// AUTH fix 2 (11-03): regression tests for the two info findings fixed with Sol's round 1 (AUTH-R1-1..3) and the
// security review's SR-N1. Each failed with its fix reverted (the mutant checks are in the implementer's notes).
//
// - Native store: when the legacy MMKV cannot be opened and the legacy-drop flag cannot be stored, a remove (a
//   sign-out) still deletes the session from SecureStore, then rejects.
// - Account sheet: in the signed-in delete view, "Forgot password?" pressed in the same JS turn as the Return that
//   submitted the delete must not leave the view, so Close/Back still cannot close the sheet while DELETE runs.
import { act, fireEvent, render, screen, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { AccountProvider } from '../AccountProvider';
import { AccountCard } from '../components/AccountCard';
import type { SignInGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser } from '../types';

jest.mock('../../reader/components/useReduceMotion', () => ({ useReduceMotion: () => true }));

afterEach(() => jest.restoreAllMocks());

// ==== account sheet ===============================================================================================

const KID = { uid: 'kid', email: 'kid@example.com', password: 'right password' };
const KID_USER: AuthUser = { uid: KID.uid, email: KID.email };

function deferred() {
  let resolve!: () => void;
  const promise = new Promise<void>((r) => (resolve = r));
  return { promise, resolve };
}

function fakeAuth(initial: AuthUser | null) {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const backend: AuthBackend = {
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn() { throw new AuthError('unknown', 'not used'); },
    async signUp() { throw new AuthError('unknown', 'not used'); },
    signOut: jest.fn(async () => {
      user = null;
      listeners.forEach((l) => l(null));
    }),
    async sendPasswordReset() {},
    async reauthenticate() {},
    async getIdToken() {
      return user ? `h.${btoa(JSON.stringify({ sub: user.uid }))}.s` : null;
    },
  };
  return backend;
}

const OPEN: SignInGate = { allowed: () => true, subscribe: () => () => undefined };

interface HostNode {
  props: Record<string, unknown>;
  children: readonly (HostNode | string)[];
}

function findHost(root: unknown, match: (n: HostNode) => boolean): HostNode | null {
  const node = root as HostNode;
  if (node.props && match(node)) return node;
  for (const child of node.children ?? []) {
    if (typeof child === 'string') continue;
    const hit = findHost(child, match);
    if (hit) return hit;
  }
  return null;
}

test('sheet: "Forgot password?" in the turn of the delete submit does not unlock Close/Back while DELETE runs', async () => {
  const storage = createStorage(memoryBackend());
  const auth = fakeAuth(KID_USER);
  const remote = createMemoryRemote();
  const held = deferred();
  const deleteRequest = jest.fn(async (): Promise<void> => held.promise);
  const wrapper = ({ children }: { children: ReactNode }) => (
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={[{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }]}>
        <ThemeProvider storage={storage} systemScheme="light">
          <AccountProvider auth={auth} storage={storage} remoteFor={() => remote} domains={DOMAINS} signInGate={OPEN} deleteAccountRequest={deleteRequest}>
            {children}
          </AccountProvider>
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>
  );
  const view = await render(<AccountCard />, { wrapper });
  await fireEvent.press(await screen.findByTestId('account-delete'));
  // Positive control: the host's onClick (RN Pressability) runs the Pressable's onPress synchronously, so it is
  // what a same-turn press looks like. With no delete running it leaves for the reset view; Back returns.
  await act(async () => (screen.getByTestId('delete-forgot').props.onClick as (e: unknown) => void)({ nativeEvent: {} }));
  expect(screen.queryByTestId('delete-password')).toBeNull();
  await act(async () => fireEvent.press(screen.getByTestId('auth-back')));
  await fireEvent.changeText(screen.getByTestId('delete-password'), KID.password);
  const field = screen.getByTestId('delete-password');
  const forgot = screen.getByTestId('delete-forgot');
  const modal = findHost(screen.container, (n) => typeof n.props.onRequestClose === 'function');
  expect(modal).not.toBeNull();
  await act(async () => {
    // One JS turn, before React commits `busy`: Return submits, "Forgot password?" is pressed, then Back.
    field.props.onSubmitEditing();
    (forgot.props.onClick as (e: unknown) => void)({ nativeEvent: {} });
    (modal!.props.onRequestClose as () => void)();
  });
  await waitFor(() => expect(deleteRequest).toHaveBeenCalledTimes(1));
  const stayedOpen = screen.queryByTestId('account-sheet') !== null;
  const stillDeleteView = screen.queryByTestId('delete-password') !== null;
  await act(async () => held.resolve());
  await waitFor(() => expect(auth.currentUser()).toBeNull());
  await view.unmount();
  expect({ stayedOpen, stillDeleteView }).toEqual({ stayedOpen: true, stillDeleteView: true });
});

// ==== native session store ========================================================================================

type Persisted = { getItem(k: string): Promise<string | null>; setItem(k: string, v: string): Promise<void>; removeItem(k: string): Promise<void> };
const API_KEY = 'test-api-key';
const KEY = `firebase:authUser:${API_KEY}:[DEFAULT]`;
const SESSION = JSON.stringify({ uid: 'someone', stsTokenManager: { refreshToken: 'REFRESH' } });
const LEGACY_DROP = 'bible-app-auth.legacy-drop-v1';

/** The Keychain / Keystore (survives an uninstall on iOS). */
let secure: Map<string, string>;
/** MMKV stores by id (app files). */
let mmkvs: Map<string, Map<string, string>>;
let mmkvDown: boolean;
let refuse: (op: 'get' | 'set' | 'delete', key: string) => boolean;
let persisted: Persisted | undefined;

function mockNative() {
  const guard = (op: 'get' | 'set' | 'delete', key: string) => {
    if (refuse(op, key)) throw new Error('SecureStore temporarily unavailable');
  };
  jest.doMock('expo-secure-store', () => ({
    AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY: 'AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY',
    getItemAsync: async (k: string) => (guard('get', k), secure.get(k) ?? null),
    setItemAsync: async (k: string, v: string) => (guard('set', k), void secure.set(k, v)),
    deleteItemAsync: async (k: string) => (guard('delete', k), void secure.delete(k)),
  }));
  jest.doMock('react-native-mmkv', () => ({
    createMMKV: (config: { id?: string } = {}) => {
      if (mmkvDown) throw new Error('MMKV failed to initialise');
      const id = config.id ?? 'mmkv.default';
      let data = mmkvs.get(id);
      if (!data) mmkvs.set(id, (data = new Map()));
      const m = data;
      return {
        getString: (k: string) => m.get(k),
        set: (k: string, v: string) => void m.set(k, String(v)),
        remove: (k: string) => m.delete(k),
        getAllKeys: () => [...m.keys()],
        clearAll: () => m.clear(),
      };
    },
  }));
  jest.doMock('firebase/auth', () => ({
    initializeAuth: jest.fn(() => ({})),
    getReactNativePersistence: jest.fn((storage: Persisted) => {
      persisted = storage;
      return { type: 'LOCAL' };
    }),
  }));
  jest.doMock('firebase/firestore', () => ({ initializeFirestore: jest.fn(() => ({})) }));
  jest.doMock('../firebaseCore', () => ({
    getFirebaseApp: () => ({ name: '[DEFAULT]', options: { apiKey: API_KEY } }),
    withAuthEmulator: (a: unknown) => a,
    withFirestoreEmulator: (d: unknown) => d,
  }));
}

/** A new process: loads firebaseApp.native.ts fresh and returns the storage Firebase Auth was given. */
function startApp(): Persisted {
  persisted = undefined;
  jest.resetModules();
  mockNative();
  jest.isolateModules(() => {
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    (require('../firebaseApp.native') as typeof import('../firebaseApp.native')).getFirebaseAuth();
  });
  if (!persisted) throw new Error('no storage');
  return persisted;
}

describe('native store: a remove whose legacy guard cannot be stored', () => {
  beforeEach(() => {
    secure = new Map();
    mmkvs = new Map();
    mmkvDown = false;
    refuse = () => false;
  });
  afterEach(() => {
    for (const m of ['expo-secure-store', 'react-native-mmkv', 'firebase/auth', 'firebase/firestore', '../firebaseCore']) jest.dontMock(m);
  });

  test('still deletes the SecureStore session, then rejects', async () => {
    // Launch 1: signed in on a working install (marker set, migration done).
    await startApp().setItem(KEY, SESSION);
    // Launch 2: MMKV cannot be opened (so the legacy copy cannot be removed) and the legacy-drop flag is refused.
    mmkvDown = true;
    refuse = (op, k) => op === 'set' && k === LEGACY_DROP;
    await expect(startApp().removeItem(KEY)).rejects.toThrow('SecureStore temporarily unavailable');
    // Nothing of the session is left in SecureStore (header or chunks).
    expect([...secure.keys()].filter((k) => k.startsWith('bible-app-auth.k.'))).toEqual([]);
    // Launch 3: everything works again; the person stays signed out.
    mmkvDown = false;
    refuse = () => false;
    expect(await startApp().getItem(KEY)).toBeNull();
  });

  test('a set still refuses to write without the guard', async () => {
    await startApp().setItem(KEY, SESSION);
    mmkvDown = true;
    refuse = (op, k) => op === 'set' && k === LEGACY_DROP;
    const other = JSON.stringify({ uid: 'someone', stsTokenManager: { refreshToken: 'OTHER' } });
    await expect(startApp().setItem(KEY, other)).rejects.toThrow('SecureStore temporarily unavailable');
    // The new value was never written (the S5-4 pre-wipe ran before the guard, so the old one is gone too).
    expect([...secure.values()].some((v) => v.includes('OTHER'))).toBe(false);
    mmkvDown = false;
    refuse = () => false;
    expect(await startApp().getItem(KEY)).toBeNull();
  });
});
