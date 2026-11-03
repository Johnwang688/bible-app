// The Under 13 offer on the account card (FOLLOW-UP item 2, John 2026-11-02): a signed-out card with an offer shows
// a short panel, "Delete account and synced data" (the delete sheet, wired to deleteOfferedAccount) and "Not now".
// Most tests run the real provider over a fake auth backend; two use a mocked useAccount to watch the calls.
import { act, fireEvent, render, screen, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../../i18n/I18nProvider';
import { en } from '../../../i18n/messages/en';
import { zhHans } from '../../../i18n/messages/zh-Hans';
import type { DeviceLocale } from '../../../i18n/types';
import { createStorage, memoryBackend, type Storage } from '../../../storage/storage';
import { createMemoryRemote } from '../../../sync/memoryRemote';
import { DOMAINS } from '../../../sync/__tests__/fixtures';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import * as Provider from '../../AccountProvider';
import { SIGN_IN_OFF } from '../../signInGate';
import { AuthError, type AccountState, type AuthBackend, type AuthUser, type SignInMethod } from '../../types';
import { readUnder13Offer, recordUnder13Offer } from '../../under13Offer';
import { AccountCard } from '../AccountCard';

jest.mock('../../../reader/components/useReduceMotion', () => ({ useReduceMotion: () => true }));

const EN: DeviceLocale[] = [{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }];
const ZH: DeviceLocale[] = [{ languageTag: 'zh-Hans-CN', languageCode: 'zh', scriptCode: 'Hans', regionCode: 'CN' }];
const KID = { uid: 'kid', email: 'kid@example.com', password: 'right password' };

/** A signed-out fake auth with one account on the server. */
function fakeAuth(): AuthBackend & { log: string[] } {
  let user: AuthUser | null = null;
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
    async signIn(m: SignInMethod) {
      log.push(`signIn:${m.email}`);
      if (m.email !== KID.email || m.password !== KID.password) throw new AuthError('wrong-credentials');
      const u = { uid: KID.uid, email: KID.email };
      set(u);
      return u;
    },
    async signUp() {
      throw new AuthError('unknown');
    },
    async signOut() {
      log.push('signOut');
      set(null);
    },
    async sendPasswordReset() {},
    async reauthenticate() {},
    async getIdToken() {
      return user ? `h.${btoa(JSON.stringify({ sub: user.uid }))}.s` : null;
    },
  };
}

function Shell({ storage, locales, children }: { storage: Storage; locales: DeviceLocale[]; children: ReactNode }) {
  return (
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={locales}>
        <ThemeProvider storage={storage} systemScheme="light">
          {children}
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>
  );
}

/** The card under the real provider: signed out, sign-in off, an offer for KID on the device. */
async function renderWithOffer(locales: DeviceLocale[] = EN) {
  const storage = createStorage(memoryBackend());
  recordUnder13Offer(storage, { uid: KID.uid, email: KID.email });
  const auth = fakeAuth();
  const remote = createMemoryRemote();
  const deleteRequest = jest.fn(async () => undefined);
  const Wrapper = ({ children }: { children: ReactNode }) => (
    <Shell storage={storage} locales={locales}>
      <Provider.AccountProvider
        auth={auth}
        storage={storage}
        remoteFor={() => remote}
        domains={DOMAINS}
        signInGate={SIGN_IN_OFF}
        deleteAccountRequest={deleteRequest}
      >
        {children}
      </Provider.AccountProvider>
    </Shell>
  );
  await render(<AccountCard />, { wrapper: Wrapper });
  await screen.findByTestId('account-u13-offer');
  return { storage, auth, remote, deleteRequest };
}

/** A signed-out account state with an offer, for the tests that watch the calls. */
function offerState(over: Partial<AccountState> = {}): AccountState {
  return {
    status: 'signedOut',
    user: null,
    signInAllowed: false,
    sync: null,
    signIn: jest.fn(async () => undefined),
    signUp: jest.fn(async () => ({ sendError: null })),
    verify: null,
    notice: null,
    dismissNotice: jest.fn(),
    sendVerification: jest.fn(async () => undefined),
    checkVerified: jest.fn(async () => false),
    changeEmail: jest.fn(async () => undefined),
    keepOldEmail: jest.fn(),
    signOut: jest.fn(async () => undefined),
    sendPasswordReset: jest.fn(async () => undefined),
    syncNow: jest.fn(async () => undefined),
    deleteAccount: jest.fn(async () => undefined),
    under13Offer: { email: KID.email },
    deleteOfferedAccount: jest.fn(async () => undefined),
    dismissUnder13Offer: jest.fn(),
    ...over,
  };
}

async function renderMocked(state: AccountState) {
  jest.spyOn(Provider, 'useAccount').mockReturnValue(state);
  const storage = createStorage(memoryBackend());
  await render(<AccountCard />, { wrapper: ({ children }) => <Shell storage={storage} locales={EN}>{children}</Shell> });
}

interface HostNode {
  props: Record<string, unknown>;
  children: readonly (HostNode | string)[];
}

/** The first host element under `root` (depth first) that `match` accepts. */
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

const press = async (id: string) => {
  await act(async () => fireEvent.press(screen.getByTestId(id)));
};
const type = async (id: string, text: string) => {
  await act(async () => fireEvent.changeText(screen.getByTestId(id), text));
};

afterEach(() => {
  jest.restoreAllMocks();
});

describe('the offer panel', () => {
  test.each([
    ['English', EN, en],
    ['简体中文', ZH, zhHans],
  ] as const)('shows its title, sentence and both buttons (%s)', async (_name, locales, words) => {
    await renderWithOffer(locales);
    expect(screen.getByText(words['account.under13Offer.title'])).toBeTruthy();
    expect(screen.getByText(words['account.under13Offer.body'])).toBeTruthy();
    expect(screen.getByTestId('account-u13-delete')).toHaveProp('accessibilityLabel', words['account.delete']);
    expect(screen.getByTestId('account-u13-not-now')).toHaveProp('accessibilityLabel', words['account.under13Offer.notNow']);
    // The copy John set for the two choices.
    expect(words['account.delete']).toBe(locales === EN ? 'Delete account and synced data' : '删除账户和已同步的数据');
    expect(words['account.under13Offer.notNow']).toBe(locales === EN ? 'Not now' : '暂不');
    // Sign-in stays off: the card still says so and offers no sign-in.
    expect(screen.getByText(words['account.under13'])).toBeTruthy();
    expect(screen.queryByTestId('account-sign-in')).toBeNull();
  });

  test('no offer, no panel', async () => {
    await renderMocked(offerState({ under13Offer: null }));
    expect(screen.queryByTestId('account-u13-offer')).toBeNull();
  });

  test('"Not now" calls dismissUnder13Offer', async () => {
    const state = offerState();
    await renderMocked(state);
    await press('account-u13-not-now');
    expect(state.dismissUnder13Offer).toHaveBeenCalledTimes(1);
    expect(state.deleteOfferedAccount).not.toHaveBeenCalled();
  });

  test('"Not now" drops the offer: the panel goes and nothing is deleted', async () => {
    const { storage, auth, deleteRequest } = await renderWithOffer();
    await press('account-u13-not-now');
    await waitFor(() => expect(screen.queryByTestId('account-u13-offer')).toBeNull());
    expect(readUnder13Offer(storage)).toBeNull();
    expect(auth.log).toEqual([]);
    expect(deleteRequest).not.toHaveBeenCalled();
  });
});

describe('the offer delete sheet', () => {
  test('shows the offered email read-only, a current-password field, and no "Forgot password?"', async () => {
    await renderWithOffer();
    await press('account-u13-delete');
    expect(screen.getByTestId('account-sheet')).toBeTruthy();
    expect(screen.getByText(en['delete.title'])).toBeTruthy();
    expect(screen.getByTestId('offer-email')).toHaveTextContent(KID.email);
    expect(screen.getByTestId('offer-email').type).toBe('Text');
    const field = screen.getByTestId('delete-password');
    expect(field).toHaveProp('autoComplete', 'current-password');
    expect(field).toHaveProp('secureTextEntry', true);
    expect(screen.queryByTestId('delete-forgot')).toBeNull();
    expect(screen.queryByText(en['auth.forgot'])).toBeNull();
  });

  test('sends the typed password to deleteOfferedAccount', async () => {
    const state = offerState();
    await renderMocked(state);
    await press('account-u13-delete');
    await type('delete-password', 'typed password');
    await press('delete-confirm');
    expect(state.deleteOfferedAccount).toHaveBeenCalledWith('typed password');
    expect(state.deleteAccount).not.toHaveBeenCalled();
  });

  test('success: the account is deleted, the sheet and the panel go, and the toast confirms', async () => {
    const { storage, deleteRequest } = await renderWithOffer();
    await press('account-u13-delete');
    await type('delete-password', KID.password);
    await press('delete-confirm');
    expect(await screen.findByTestId('account-toast')).toHaveTextContent(en['account.deleted']);
    expect(deleteRequest).toHaveBeenCalledTimes(1);
    expect(screen.queryByTestId('account-sheet')).toBeNull();
    expect(screen.queryByTestId('account-u13-offer')).toBeNull();
    expect(readUnder13Offer(storage)).toBeNull();
    // Still the signed-out card: the re-auth never showed as a sign-in.
    expect(screen.queryByTestId('account-sync-status')).toBeNull();
  });

  test('a wrong password shows the failure, keeps the sheet open and keeps the panel', async () => {
    const { storage, deleteRequest } = await renderWithOffer();
    await press('account-u13-delete');
    await type('delete-password', 'wrong password');
    await press('delete-confirm');
    expect(await screen.findByTestId('delete-error')).toHaveTextContent(en['delete.wrongPassword']);
    expect(screen.getByTestId('account-sheet')).toBeTruthy();
    expect(screen.getByTestId('account-u13-offer')).toBeTruthy();
    expect(readUnder13Offer(storage)).toEqual({ uid: KID.uid, email: KID.email });
    expect(deleteRequest).not.toHaveBeenCalled();
    // Closing after the failure leaves the panel for another try.
    await press('delete-cancel');
    expect(screen.queryByTestId('account-sheet')).toBeNull();
    expect(screen.getByTestId('account-u13-delete')).toBeTruthy();
  });

  test('a network failure says so without mentioning sync (sync is already off)', async () => {
    const state = offerState({ deleteOfferedAccount: jest.fn(async () => Promise.reject(new AuthError('network'))) });
    await renderMocked(state);
    await press('account-u13-delete');
    await type('delete-password', 'pw');
    await press('delete-confirm');
    expect(await screen.findByTestId('delete-error')).toHaveTextContent(en['account.under13Offer.network']);
  });

  test('nothing closes the sheet while the delete runs', async () => {
    let release!: () => void;
    const held = new Promise<void>((r) => (release = r));
    const state = offerState({ deleteOfferedAccount: jest.fn(() => held) });
    await renderMocked(state);
    await press('account-u13-delete');
    await type('delete-password', 'pw');
    await press('delete-confirm');
    await waitFor(() => expect(screen.getByTestId('delete-confirm')).toBeDisabled());

    expect(screen.getByTestId('auth-close')).toBeDisabled();
    expect(screen.getByTestId('delete-cancel')).toBeDisabled();
    await press('auth-close');
    await press('delete-cancel');
    // Back (Android) and Escape (web) arrive as the Modal's onRequestClose.
    const modal = findHost(screen.container, (n) => typeof n.props.onRequestClose === 'function');
    expect(modal).not.toBeNull();
    await act(async () => (modal!.props.onRequestClose as () => void)());
    expect(screen.getByTestId('account-sheet')).toBeTruthy();

    await act(async () => release());
    expect(await screen.findByTestId('account-toast')).toHaveTextContent(en['account.deleted']);
    expect(screen.queryByTestId('account-sheet')).toBeNull();
  });
});
