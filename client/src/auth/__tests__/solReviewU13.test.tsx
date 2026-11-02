// Review-only counterexamples for R6b-fu-u13. Production code and acceptance tests are unchanged.
import { act, fireEvent, render, renderHook, screen, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { AccountProvider, useAccount } from '../AccountProvider';
import { AccountCard } from '../components/AccountCard';
import { SIGN_IN_OFF } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser, type SignInMethod } from '../types';
import { readUnder13Offer, recordUnder13Offer } from '../under13Offer';

jest.mock('../../reader/components/useReduceMotion', () => ({ useReduceMotion: () => true }));

const KID = { uid: 'kid', email: 'kid@example.com', password: 'right password' };

function deferred() {
  let resolve!: () => void;
  const promise = new Promise<void>((r) => (resolve = r));
  return { promise, resolve };
}

/** Same account-table/auth-callback model as the acceptance tests, with controlled SDK completion. */
function fakeAuth() {
  let user: AuthUser | null = null;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const server = new Map([[KID.email, { uid: KID.uid, password: KID.password }]]);
  const signedInUids: string[] = [];
  const controls = { signInWait: null as Promise<void> | null, signOutFailures: 0 };
  const restoreSession = (next: AuthUser | null) => {
    user = next;
    listeners.forEach((l) => l(next));
  };
  const backend: AuthBackend = {
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    signIn: jest.fn(async (method: SignInMethod) => {
      const account = server.get(method.email);
      if (!account || account.password !== method.password) throw new AuthError('wrong-credentials');
      const authenticated = { uid: account.uid, email: method.email };
      signedInUids.push(authenticated.uid);
      restoreSession(authenticated);
      if (controls.signInWait) await controls.signInWait;
      // Firebase's credential result identifies the authenticated user even if another tab restores
      // a different currentUser before this promise settles.
      return authenticated;
    }),
    async signUp() {
      throw new AuthError('unknown', 'not used');
    },
    signOut: jest.fn(async () => {
      if (controls.signOutFailures > 0) {
        controls.signOutFailures--;
        throw new AuthError('network', 'local sign-out failed once');
      }
      restoreSession(null);
    }),
    async sendPasswordReset() {},
    async reauthenticate() {},
    async getIdToken() {
      // A restored session may already be recent enough for the endpoint, but this flow still needs
      // to prove that the entered password authenticated the offered uid.
      return user ? `h.${btoa(JSON.stringify({ sub: user.uid, auth_time: Math.floor(Date.now() / 1000) - 60 }))}.s` : null;
    },
  };
  return { ...backend, server, controls, restoreSession, signedInUids };
}

function setup() {
  const storage = createStorage(memoryBackend());
  recordUnder13Offer(storage, { uid: KID.uid, email: KID.email });
  const auth = fakeAuth();
  const remote = createMemoryRemote();
  const deleteRequest = jest.fn(async (token: string) => {
    const claims = JSON.parse(atob(token.split('.')[1]!)) as { sub: string };
    for (const [email, account] of auth.server) if (account.uid === claims.sub) auth.server.delete(email);
  });
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={() => remote} domains={DOMAINS} signInGate={SIGN_IN_OFF} deleteAccountRequest={deleteRequest}>
      {children}
    </AccountProvider>
  );
  return { storage, auth, remote, deleteRequest, wrapper };
}

const outcome = (promise: Promise<void>) => promise.then(
  () => ({ error: null as unknown }),
  (error: unknown) => ({ error }),
);

afterEach(() => jest.restoreAllMocks());

test('U13-1: the re-auth result must match the offer, even if another tab restores the offered uid', async () => {
  const s = setup();
  // The offered email was reassigned; the original account now uses another email and password.
  const newEmail = 'kid-new@example.com';
  s.auth.server.set(newEmail, { uid: KID.uid, password: 'original account password' });
  s.auth.server.set(KID.email, { uid: 'new-owner', password: KID.password });
  const held = deferred();
  s.auth.controls.signInWait = held.promise;
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.under13Offer).toEqual({ email: KID.email }));
  let done!: ReturnType<typeof outcome>;
  await act(async () => {
    done = outcome(view.result.current.deleteOfferedAccount(KID.password));
  });
  await waitFor(() => expect(s.auth.currentUser()?.uid).toBe('new-owner'));
  await act(async () => {
    s.auth.restoreSession({ uid: KID.uid, email: newEmail });
    held.resolve();
    await done;
  });
  const result = await done;
  await view.unmount();
  expect(s.auth.signedInUids).toEqual(['new-owner']);
  expect(s.remote.calls).toHaveLength(0);
  // Expected: reject without deleting; actual: the restored original account is deleted using
  // a password that authenticated only new-owner, because the signIn return value was ignored.
  expect(s.deleteRequest).not.toHaveBeenCalled();
  expect(result.error).toBeInstanceOf(AuthError);
  expect(s.auth.server.has(newEmail)).toBe(true);
  expect(readUnder13Offer(s.storage)).toEqual({ uid: KID.uid, email: KID.email });
});

test('U13-2: a successful delete must not recreate its offer after a transient final sign-out failure', async () => {
  const s = setup();
  jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  s.auth.controls.signOutFailures = 1;
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  let result!: Awaited<ReturnType<typeof outcome>>;
  await act(async () => {
    result = await outcome(view.result.current.deleteOfferedAccount(KID.password));
  });
  // Gate enforcement retries the failed sign-out after the offered delete's hold ends.
  await waitFor(() => expect(s.auth.signOut).toHaveBeenCalledTimes(2));
  await act(async () => undefined);
  const offer = readUnder13Offer(s.storage);
  await view.unmount();
  expect(result.error).toBeNull();
  expect(s.auth.currentUser()).toBeNull();
  expect(s.auth.server.has(KID.email)).toBe(false);
  // Expected: success clears the offer. Actual: setUser(null) clears blockedUid before
  // enforceGate calls offerDelete, so the already-deleted account is offered again.
  expect(offer).toBeNull();
});

test('U13-3: an unmounted failed delete must still finish signed out if the first cleanup sign-out fails', async () => {
  const s = setup();
  jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  const held = deferred();
  s.auth.controls.signInWait = held.promise;
  s.auth.controls.signOutFailures = 1;
  s.deleteRequest.mockRejectedValueOnce(new AuthError('network', 'delete response was lost'));
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedOut'));
  let done!: ReturnType<typeof outcome>;
  await act(async () => {
    done = outcome(view.result.current.deleteOfferedAccount(KID.password));
  });
  await waitFor(() => expect(s.auth.currentUser()?.uid).toBe(KID.uid));
  // Stop the provider while the SDK is still completing re-authentication.
  await view.unmount();
  held.resolve();
  const result = await done;
  expect(result.error).toBeInstanceOf(AuthError);
  expect(readUnder13Offer(s.storage)).toEqual({ uid: KID.uid, email: KID.email });
  expect(s.remote.calls).toHaveLength(0);
  // Expected: signed out in every outcome, including unmount. Actual: the failed cleanup
  // is only logged and the detached gate enforcement cannot perform the retry.
  expect(s.auth.currentUser()).toBeNull();
});

test('U13-4: duplicate submits before React commits must not unlock a still-running delete sheet', async () => {
  const s = setup();
  const held = deferred();
  s.deleteRequest.mockImplementationOnce(async () => held.promise);
  const Provider = s.wrapper;
  const wrapper = ({ children }: { children: ReactNode }) => (
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={s.storage} locales={[{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }]}>
        <ThemeProvider storage={s.storage} systemScheme="light"><Provider>{children}</Provider></ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>
  );
  const view = await render(<AccountCard />, { wrapper });
  await screen.findByTestId('account-u13-delete');
  await fireEvent.press(screen.getByTestId('account-u13-delete'));
  await fireEvent.changeText(screen.getByTestId('delete-password'), KID.password);
  const passwordField = screen.getByTestId('delete-password');
  await act(async () => {
    // Dispatch two enabled Return callbacks in one JS turn, before React commits busy=true.
    // Calling fireEvent twice without awaiting it would instead create unsupported overlapping acts.
    passwordField.props.onSubmitEditing();
    passwordField.props.onSubmitEditing();
  });
  await waitFor(() => expect(s.deleteRequest).toHaveBeenCalledTimes(1));
  const closeDisabled = screen.getByTestId('auth-close').props.accessibilityState.disabled;
  await fireEvent.press(screen.getByTestId('delete-cancel'));
  const stayedOpen = screen.queryByTestId('account-sheet') !== null;
  // Settle the genuine request before making the intentionally failing review assertions.
  await act(async () => { held.resolve(); });
  await waitFor(() => expect(s.auth.currentUser()).toBeNull());
  await view.unmount();
  expect(s.auth.signIn).toHaveBeenCalledTimes(1);
  // Expected: the first delete owns the lock until its request finishes. Actual: the rejected
  // second submit resets busy, so Cancel can close the sheet while the first delete still runs.
  expect({ closeDisabled, stayedOpen }).toEqual({ closeDisabled: true, stayedOpen: true });
});
