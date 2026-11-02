// Acceptance tests for the account UI (R-6b; orchestrator-owned, the implementer may not edit them).
// Design: C:/dev/bible-app-work/design/proposed/r6b-*.html (approved by John 2026-11-02) plus the review fixes
// in C:/dev/bible-app-work/r6b/R6b-ui.md.
import { act, fireEvent, render, screen, waitFor, within } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../../i18n/I18nProvider';
import { en } from '../../../i18n/messages/en';
import { zhHans } from '../../../i18n/messages/zh-Hans';
import type { DeviceLocale } from '../../../i18n/types';
import { createStorage, memoryBackend, type Storage } from '../../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../../sync/memoryRemote';
import { DOMAINS } from '../../../sync/__tests__/fixtures';
import { RemoteError } from '../../../sync/types';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import { AccountProvider } from '../../AccountProvider';
import type { SignInGate } from '../../signInGate';
import { AuthError, type AuthBackend, type AuthUser, type SignInMethod } from '../../types';
import { AccountCard } from '../AccountCard';
import { ALWAYS_ALLOWED } from '../../signInGate';

const EN: DeviceLocale[] = [{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }];
const ZH: DeviceLocale[] = [{ languageTag: 'zh-Hans-CN', languageCode: 'zh', scriptCode: 'Hans', regionCode: 'CN' }];

type Fake = AuthBackend & { log: string[]; fail: Partial<Record<string, AuthError>> };

function fakeAuth(initial: AuthUser | null = null): Fake {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const log: string[] = [];
  const fail: Fake['fail'] = {};
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const maybeFail = (op: string) => {
    const e = fail[op];
    if (e) throw e;
  };
  return {
    log,
    fail,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m: SignInMethod) {
      log.push(`signIn:${m.email}:${m.password}`);
      maybeFail('signIn');
      const u = { uid: 'alice', email: m.email };
      set(u);
      return u;
    },
    async signUp(email, password) {
      log.push(`signUp:${email}:${password}`);
      maybeFail('signUp');
      const u = { uid: 'new', email };
      set(u);
      return u;
    },
    async signOut() {
      log.push('signOut');
      set(null);
    },
    async sendPasswordReset(email) {
      log.push(`reset:${email}`);
      maybeFail('reset');
    },
    async reauthenticate(m) {
      log.push(`reauth:${m.password}`);
      maybeFail('reauth');
    },
    async getIdToken() {
      return user ? `token-for-${user.uid}` : null;
    },
  };
}

const ALICE: AuthUser = { uid: 'alice', email: 'alice@example.com' };

async function renderCard(
  opts: {
    auth?: Fake;
    locales?: DeviceLocale[];
    gate?: SignInGate;
    deleteRequest?: (token: string) => Promise<void>;
    remote?: MemoryRemote;
  } = {},
) {
  const auth = opts.auth ?? fakeAuth();
  const storage: Storage = createStorage(memoryBackend());
  const remote = opts.remote ?? createMemoryRemote();
  const deleteRequest = jest.fn(opts.deleteRequest ?? (async () => undefined));
  const Wrapper = ({ children }: { children: ReactNode }) => (
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={opts.locales ?? EN}>
        <ThemeProvider storage={storage} systemScheme="light">
          <AccountProvider signInGate={ALWAYS_ALLOWED}
            auth={auth}
            storage={storage}
            remoteFor={() => remote}
            domains={DOMAINS}
            deleteAccountRequest={deleteRequest}
            {...(opts.gate ? { signInGate: opts.gate } : {})}
          >
            {children}
          </AccountProvider>
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>
  );
  const ui = await render(<AccountCard />, { wrapper: Wrapper });
  return { ui, auth, storage, remote, deleteRequest };
}

const type = async (testID: string, text: string) => {
  await act(async () => fireEvent.changeText(screen.getByTestId(testID), text));
};
const press = async (testID: string) => {
  await act(async () => fireEvent.press(screen.getByTestId(testID)));
};

describe('signed out', () => {
  test('shows the sign-in card; Sign in opens the sheet with the merge notice', async () => {
    await renderCard();
    expect(await screen.findByText(en['account.signInTitle'])).toBeTruthy();
    expect(screen.getByText(en['account.signInBody'])).toBeTruthy();
    await press('account-sign-in');
    expect(screen.getByTestId('account-sheet')).toBeTruthy();
    expect(screen.getByText(en['auth.signIn.mergeNote'])).toBeTruthy();
  });

  test('sign-in autofill: username email, current password, email keyboard', async () => {
    await renderCard();
    await screen.findByTestId('account-sign-in');
    await press('account-sign-in');
    const email = screen.getByTestId('auth-email');
    const password = screen.getByTestId('auth-password');
    expect(email.props.autoComplete).toBe('username');
    expect(email.props.textContentType).toBe('username');
    expect(email.props.keyboardType).toBe('email-address');
    expect(email.props.autoCapitalize).toBe('none');
    expect(password.props.autoComplete).toBe('current-password');
    expect(password.props.textContentType).toBe('password');
    expect(password.props.secureTextEntry).toBe(true);
    await press('auth-password-toggle');
    expect(screen.getByTestId('auth-password').props.secureTextEntry).toBe(false);
  });

  test('signs in with the typed email and password; the sheet closes and the card shows the account', async () => {
    const { auth } = await renderCard();
    await screen.findByTestId('account-sign-in');
    await press('account-sign-in');
    await type('auth-email', '  alice@example.com ');
    await type('auth-password', 'correct horse');
    await press('auth-submit');
    await waitFor(() => expect(screen.queryByTestId('account-sheet')).toBeNull());
    expect(auth.log).toContain('signIn:alice@example.com:correct horse');
    expect(await screen.findByText('alice@example.com')).toBeTruthy();
  });

  test.each<[string, AuthError, string]>([
    ['wrong credentials', new AuthError('wrong-credentials'), 'auth.error.wrongCredentials'],
    ['too many tries', new AuthError('too-many-requests'), 'auth.error.tooManyRequests'],
    ['offline', new AuthError('network'), 'auth.error.network'],
  ])('a sign-in error (%s) shows its message and keeps the sheet open', async (_l, error, key) => {
    const auth = fakeAuth();
    auth.fail.signIn = error;
    await renderCard({ auth });
    await screen.findByTestId('account-sign-in');
    await press('account-sign-in');
    await type('auth-email', 'alice@example.com');
    await type('auth-password', 'nope nope');
    await press('auth-submit');
    expect(await screen.findByText(en[key as keyof typeof en])).toBeTruthy();
    expect(screen.getByTestId('account-sheet')).toBeTruthy();
  });

  test('a malformed email is caught before any request', async () => {
    const { auth } = await renderCard();
    await screen.findByTestId('account-sign-in');
    await press('account-sign-in');
    await type('auth-email', 'not an email');
    await type('auth-password', 'correct horse');
    await press('auth-submit');
    expect(await screen.findByText(en['auth.error.invalidEmail'])).toBeTruthy();
    expect(auth.log).toEqual([]);
  });

  test('sign-up: new-password autofill, 8-character minimum, neutral email-in-use copy, privacy link', async () => {
    const auth = fakeAuth();
    await renderCard({ auth });
    await screen.findByTestId('account-sign-in');
    await press('account-sign-in');
    await press('auth-to-signup');
    const email = screen.getByTestId('auth-email');
    expect(email.props.autoComplete).toBe('email');
    expect(email.props.textContentType).toBe('emailAddress');
    const password = screen.getByTestId('auth-password');
    expect(password.props.autoComplete).toBe('new-password');
    expect(password.props.textContentType).toBe('newPassword');
    expect(screen.getByTestId('auth-privacy')).toBeTruthy();

    await type('auth-email', 'carol@example.com');
    await type('auth-password', 'short');
    await press('auth-submit');
    expect(await screen.findByText(en['auth.signUp.tooShort'])).toBeTruthy();
    expect(auth.log).toEqual([]);

    auth.fail.signUp = new AuthError('email-in-use');
    await type('auth-password', 'long enough');
    await press('auth-submit');
    expect(await screen.findByText(en['auth.error.emailInUse'])).toBeTruthy();
    // Neutral: the copy must not state that an account exists.
    expect(en['auth.error.emailInUse'].toLowerCase()).not.toMatch(/already (uses|has|exists)|account (already )?exists/);
  });

  test('password reset: sends, shows the same message for any email, resend, and send failure', async () => {
    const auth = fakeAuth();
    await renderCard({ auth });
    await screen.findByTestId('account-sign-in');
    await press('account-sign-in');
    await type('auth-email', 'who@example.com');
    await press('auth-forgot');
    expect(screen.getByTestId('auth-email').props.value).toBe('who@example.com');
    await press('auth-submit');
    expect(await screen.findByTestId('auth-reset-sent')).toBeTruthy();
    expect(auth.log).toContain('reset:who@example.com');
    await press('auth-resend');
    await waitFor(() => expect(auth.log.filter((l) => l === 'reset:who@example.com')).toHaveLength(2));

    await press('auth-back');
    await press('auth-forgot');
    auth.fail.reset = new AuthError('network');
    await press('auth-submit');
    expect(await screen.findByText(en['auth.error.network'])).toBeTruthy();
    expect(screen.queryByTestId('auth-reset-sent')).toBeNull();
  });

  test('Close while a request is in flight closes the sheet and the late result is ignored', async () => {
    const auth = fakeAuth();
    let release!: () => void;
    const gate = new Promise<void>((r) => (release = r));
    const signIn = auth.signIn.bind(auth);
    auth.signIn = async (m) => {
      await gate;
      return signIn(m);
    };
    await renderCard({ auth });
    await screen.findByTestId('account-sign-in');
    await press('account-sign-in');
    await type('auth-email', 'alice@example.com');
    await type('auth-password', 'correct horse');
    await press('auth-submit');
    expect(screen.getByTestId('auth-submit')).toBeDisabled();
    await press('auth-close');
    expect(screen.queryByTestId('account-sheet')).toBeNull();
    await act(async () => release());
    expect(screen.queryByTestId('account-sheet')).toBeNull();
  });
});

describe('signed in', () => {
  test('shows the email, the sync line, Sync now, Sign out and the renamed delete row', async () => {
    await renderCard({ auth: fakeAuth(ALICE) });
    expect(await screen.findByText('alice@example.com')).toBeTruthy();
    await waitFor(() => expect(screen.getByTestId('account-sync-status')).toHaveTextContent(en['account.sync.justNow']));
    expect(screen.getByTestId('account-sync-now')).toBeTruthy();
    expect(screen.getByTestId('account-sign-out')).toBeTruthy();
    expect(within(screen.getByTestId('account-delete')).getByText(en['account.delete'])).toBeTruthy();
  });

  test('offline: the sync line says so and the button reads Try again; sign-out warns first', async () => {
    const remote = createMemoryRemote();
    remote.failNext(new RemoteError('offline'), undefined, 50);
    const { auth } = await renderCard({ auth: fakeAuth(ALICE), remote });
    await waitFor(() => expect(screen.getByTestId('account-sync-status')).toHaveTextContent(en['account.sync.offline']));
    expect(within(screen.getByTestId('account-sync-now')).getByText(en['account.tryAgain'])).toBeTruthy();
    await press('account-sign-out');
    expect(screen.getByTestId('account-signout-sheet')).toBeTruthy();
    expect(auth.log).not.toContain('signOut');
    await press('account-signout-confirm');
    await waitFor(() => expect(auth.log).toContain('signOut'));
  });

  test('synced: sign-out needs no confirmation', async () => {
    const { auth } = await renderCard({ auth: fakeAuth(ALICE) });
    await waitFor(() => expect(screen.getByTestId('account-sync-status')).toHaveTextContent(en['account.sync.justNow']));
    await press('account-sign-out');
    await waitFor(() => expect(auth.log).toContain('signOut'));
    expect(screen.queryByTestId('account-signout-sheet')).toBeNull();
  });
});

describe('delete account and synced data', () => {
  async function openDelete(opts: Parameters<typeof renderCard>[0] = {}) {
    const r = await renderCard({ auth: fakeAuth(ALICE), ...opts });
    await screen.findByText('alice@example.com');
    await press('account-delete');
    return r;
  }

  test('confirm is disabled until a password is typed; the password field autofills as current-password', async () => {
    await openDelete();
    expect(screen.getByTestId('delete-confirm')).toBeDisabled();
    const pw = screen.getByTestId('delete-password');
    expect(pw.props.autoComplete).toBe('current-password');
    expect(pw.props.secureTextEntry).toBe(true);
    await type('delete-password', 'x');
    expect(screen.getByTestId('delete-confirm')).not.toBeDisabled();
  });

  test('success: signed out, a dismissible banner says it was deleted', async () => {
    const { deleteRequest } = await openDelete();
    await type('delete-password', 'correct horse');
    await press('delete-confirm');
    await waitFor(() => expect(deleteRequest).toHaveBeenCalledWith('token-for-alice'));
    expect(await screen.findByTestId('account-toast')).toHaveTextContent(en['account.deleted']);
    expect(await screen.findByText(en['account.signInTitle'])).toBeTruthy();
    await press('account-toast-dismiss');
    expect(screen.queryByTestId('account-toast')).toBeNull();
  });

  test('wrong password: an error, nothing deleted, still signed in', async () => {
    const auth = fakeAuth(ALICE);
    auth.fail.reauth = new AuthError('wrong-credentials');
    const { deleteRequest } = await openDelete({ auth });
    await type('delete-password', 'nope');
    await press('delete-confirm');
    expect(await screen.findByText(en['delete.wrongPassword'])).toBeTruthy();
    expect(deleteRequest).not.toHaveBeenCalled();
    expect(screen.queryByTestId('account-toast')).toBeNull();
  });

  test.each<[string, AuthError, string]>([
    ['offline', new AuthError('network'), 'delete.error.network'],
    ['server failure', new AuthError('unknown'), 'delete.error.server'],
  ])('a failed delete (%s) never looks like success', async (_l, error, key) => {
    await openDelete({
      deleteRequest: async () => {
        throw error;
      },
    });
    await type('delete-password', 'correct horse');
    await press('delete-confirm');
    expect(await screen.findByText(en[key as keyof typeof en])).toBeTruthy();
    expect(screen.queryByTestId('account-toast')).toBeNull();
    expect(screen.getByTestId('account-sheet')).toBeTruthy();
  });

  test('Forgot password? from the delete sheet sends a reset to the account email', async () => {
    const { auth } = await openDelete();
    await press('delete-forgot');
    expect(screen.getByTestId('auth-email').props.value).toBe('alice@example.com');
    await press('auth-submit');
    await waitFor(() => expect(auth.log).toContain('reset:alice@example.com'));
  });
});

describe('under 13 and Chinese', () => {
  test('when sign-in is off, one line replaces the sign-in button', async () => {
    await renderCard({ gate: { allowed: () => false, subscribe: () => () => undefined } });
    expect(await screen.findByText(en['account.under13'])).toBeTruthy();
    expect(screen.queryByTestId('account-sign-in')).toBeNull();
  });

  test('the card and sheet are in Chinese', async () => {
    await renderCard({ locales: ZH });
    expect(await screen.findByText(zhHans['account.signInTitle'])).toBeTruthy();
    await press('account-sign-in');
    expect(screen.getByText(zhHans['auth.signIn.mergeNote'])).toBeTruthy();
  });

  test('every control is at least 44 pt and no auth control uses a fixed height', async () => {
    await renderCard();
    await screen.findByTestId('account-sign-in');
    await press('account-sign-in');
    for (const id of ['auth-email', 'auth-password', 'auth-submit', 'auth-forgot', 'auth-close']) {
      const flat = [screen.getByTestId(id).props.style].flat(Infinity).filter(Boolean) as Record<string, unknown>[];
      const style = Object.assign({}, ...flat);
      expect(style.height).toBeUndefined();
      expect(Number(style.minHeight ?? 0)).toBeGreaterThanOrEqual(44);
    }
  });
});
