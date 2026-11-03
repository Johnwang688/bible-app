// Sol round 2 on the Under 13 offer. Parked for John on 11-02 (claude-workflows 5a step 5); un-skipped as the
// acceptance tests of team AUTH's fixes (board 11-03, row 2).
// U13-R2-1 (the offer recorded where it must not be; S4-3/S4-4 class): needs the gate's own sign-out to fail, then an
//   ordinary sign-out and a restored session; the offer then names an account that never picked Under 13 ("Not now"
//   clears it). Fix design: clear closedOnUid on any sign-out that is not the gate's.
// U13-R2-2 (the delete sheet closable while a delete runs; U13-4 class): Back/Escape right after submit closes the
//   sheet; the delete still runs to its end and its outcome shows on the card. Fix design: the sheet's onRequestClose
//   reads the same synchronous lock as the buttons.
// Round 2 review counterexamples. Only this new test file is changed.
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
import { SIGN_IN_OFF, type SignInGate } from '../signInGate';
import { AuthError, type AuthBackend, type AuthUser, type SignInMethod } from '../types';
import { readUnder13Offer, recordUnder13Offer } from '../under13Offer';

jest.mock('../../reader/components/useReduceMotion', () => ({ useReduceMotion: () => true }));

const KID = { uid: 'kid', email: 'kid@example.com', password: 'right password' };
const KID_USER: AuthUser = { uid: KID.uid, email: KID.email };

function deferred() {
  let resolve!: () => void;
  const promise = new Promise<void>((r) => (resolve = r));
  return { promise, resolve };
}

/** Acceptance-test account table and auth callbacks, with a controllable failed local sign-out. */
function fakeAuth(initial: AuthUser | null) {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const server = new Map([[KID.email, { uid: KID.uid, password: KID.password }]]);
  const controls = { signOutFailures: 0 };
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
      restoreSession(authenticated);
      return authenticated;
    }),
    async signUp() { throw new AuthError('unknown', 'not used'); },
    signOut: jest.fn(async () => {
      if (controls.signOutFailures > 0) {
        controls.signOutFailures--;
        throw new AuthError('unknown', 'local sign-out failed');
      }
      restoreSession(null);
    }),
    async sendPasswordReset() {},
    async reauthenticate() {},
    async getIdToken() {
      return user ? `h.${btoa(JSON.stringify({ sub: user.uid }))}.s` : null;
    },
  };
  return { ...backend, server, controls, restoreSession };
}

function switchGate(open: boolean): SignInGate & { set(open: boolean): void } {
  let allowed = open;
  const listeners = new Set<() => void>();
  return {
    allowed: () => allowed,
    subscribe(l) {
      listeners.add(l);
      return () => void listeners.delete(l);
    },
    set(next) {
      allowed = next;
      listeners.forEach((l) => l());
    },
  };
}

function setup(initial: AuthUser | null, gate: SignInGate) {
  const storage = createStorage(memoryBackend());
  const auth = fakeAuth(initial);
  const remote = createMemoryRemote();
  const deleteRequest = jest.fn(async (): Promise<void> => undefined);
  const wrapper = ({ children }: { children: ReactNode }) => (
    <AccountProvider auth={auth} storage={storage} remoteFor={() => remote} domains={DOMAINS} signInGate={gate} deleteAccountRequest={deleteRequest}>
      {children}
    </AccountProvider>
  );
  return { storage, auth, remote, deleteRequest, wrapper };
}

interface HostNode {
  props: Record<string, unknown>;
  children: readonly (HostNode | string)[];
}

/** The same host-tree lookup used by the existing offer-sheet tests. */
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
const settle = () => act(async () => void (await new Promise((r) => setTimeout(r, 30))));

afterEach(() => jest.restoreAllMocks());

// U13-R2-1 (S4-3): a session restored behind an already-closed gate must not record an offer.
// Scenario: the first gate sign-out fails, an ordinary sign-out succeeds, then that uid is restored.
// Expected: no offer. Actual: closedOnUid survives the ordinary sign-out and the restore records an offer.
test('U13-R2-1: ordinary sign-out must retire a failed gate closing before the same uid is restored', async () => {
  jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  const gate = switchGate(true);
  const s = setup(KID_USER, gate);
  const view = await renderHook(() => useAccount(), { wrapper: s.wrapper });
  await waitFor(() => expect(view.result.current.status).toBe('signedIn'));
  await waitFor(() => expect(view.result.current.sync?.lastSyncedAt).not.toBeNull());

  s.auth.controls.signOutFailures = 1;
  await act(async () => gate.set(false));
  await settle();
  expect(s.auth.signOut).toHaveBeenCalledTimes(1);
  expect(s.auth.currentUser()).toEqual(KID_USER);

  // Ordinary sign-out is allowed while the gate is closed and must never create an offer.
  await act(async () => view.result.current.signOut());
  await settle();
  expect(s.auth.currentUser()).toBeNull();
  expect(readUnder13Offer(s.storage)).toBeNull();
  const callsBefore = s.remote.calls.length;

  // No new open -> closed transition: another tab/SDK restores the same uid behind the closed gate.
  await act(async () => s.auth.restoreSession(KID_USER));
  await waitFor(() => expect(s.auth.currentUser()).toBeNull());
  await settle();
  const offer = readUnder13Offer(s.storage);
  await view.unmount();
  expect(s.remote.calls.length).toBe(callsBefore);
  expect(s.auth.signOut).toHaveBeenCalledTimes(3);
  expect(offer).toBeNull();
});

// U13-R2-2 (fix1 U13-4): the sheet must lock synchronously on the first submit.
// Scenario: Return submits, then Android Back/Escape arrives before React commits busy=true.
// Expected: sheet remains open until DELETE settles. Actual: Back/Escape closes it while DELETE is still pending.
test('U13-R2-2: Back in the first submit turn must not close the sheet before the busy commit', async () => {
  const s = setup(null, SIGN_IN_OFF);
  recordUnder13Offer(s.storage, { uid: KID.uid, email: KID.email });
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
  const field = screen.getByTestId('delete-password');
  const modal = findHost(screen.container, (n) => typeof n.props.onRequestClose === 'function');
  expect(modal).not.toBeNull();
  await act(async () => {
    // As in the round-1 duplicate-submit test, dispatch both callbacks in one JS turn,
    // using one awaited act instead of overlapping RNTL fireEvent acts.
    field.props.onSubmitEditing();
    (modal!.props.onRequestClose as () => void)();
  });
  await waitFor(() => expect(s.deleteRequest).toHaveBeenCalledTimes(1));
  const stayedOpen = screen.queryByTestId('account-sheet') !== null;
  const userDuringDelete = s.auth.currentUser();
  // Finish the request and provider cleanup before the intentionally failing assertion.
  await act(async () => { held.resolve(); });
  await waitFor(() => expect(s.auth.currentUser()).toBeNull());
  await view.unmount();
  expect(userDuringDelete).toEqual(KID_USER);
  expect(s.remote.calls).toHaveLength(0);
  expect(stayedOpen).toBe(true);
});

