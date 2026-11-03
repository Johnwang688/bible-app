// GOOGLE (board 11-03 row 7): the account sheet's Google parts, over a mocked account state. With the flag off
// nothing changes; with it on, "Continue with Google" sits on the sign-in and sign-up views and handles the window's
// outcomes; an account with Google and no password confirms a delete through Google, and can give the wait up.
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../../i18n/I18nProvider';
import { en } from '../../../i18n/messages/en';
import { zhHans } from '../../../i18n/messages/zh-Hans';
import type { DeviceLocale } from '../../../i18n/types';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import { useAccount } from '../../AccountProvider';
import { googleSignInEnabled } from '../../googleFlag';
import { AuthError, type AccountState, type DeleteOptions } from '../../types';
import { AccountSheet, type AccountSheetStart } from '../AccountSheet';

jest.mock('../../AccountProvider', () => ({ useAccount: jest.fn() }));
jest.mock('../../googleFlag', () => ({ googleSignInEnabled: jest.fn(() => true) }));
jest.mock('../../../reader/components/useReduceMotion', () => ({ useReduceMotion: () => true }));

const mockUseAccount = jest.mocked(useAccount);
const mockFlag = jest.mocked(googleSignInEnabled);
const EN: DeviceLocale[] = [{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }];
const ZH: DeviceLocale[] = [{ languageTag: 'zh-Hans-CN', languageCode: 'zh', scriptCode: 'Hans', regionCode: 'CN' }];
const GINA = { uid: 'gina', email: 'gina@gmail.com', providers: ['google' as const] };

function state(over: Partial<AccountState> = {}): AccountState {
  return {
    status: 'signedOut',
    user: null,
    signInAllowed: true,
    sync: null,
    signIn: jest.fn(async () => undefined),
    signUp: jest.fn(async () => ({ confirm: false, sendError: null })),
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
    under13Offer: null,
    deleteOfferedAccount: jest.fn(async () => undefined),
    dismissUnder13Offer: jest.fn(),
    ...over,
  };
}

async function renderSheet(account: AccountState, start: AccountSheetStart = 'signIn', locales = EN) {
  mockUseAccount.mockReturnValue(account);
  const storage = createStorage(memoryBackend());
  const onClose = jest.fn();
  const onDeleted = jest.fn();
  const Wrapper = ({ children }: { children: ReactNode }) => (
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={locales}>
        <ThemeProvider storage={storage} systemScheme="light">{children}</ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>
  );
  await render(<AccountSheet start={start} onClose={onClose} onDeleted={onDeleted} />, { wrapper: Wrapper });
  return { onClose, onDeleted };
}

async function press(id: string) {
  await act(async () => {
    fireEvent.press(screen.getByTestId(id));
  });
}

/** A promise with its resolve and reject, for a request still running. */
function pending() {
  let resolve!: () => void;
  let reject!: (e: unknown) => void;
  const promise = new Promise<void>((res, rej) => {
    resolve = res;
    reject = rej;
  });
  return { promise, resolve, reject };
}

beforeEach(() => mockFlag.mockReturnValue(true));
afterEach(() => jest.clearAllMocks());

describe('the flag', () => {
  test('off: no Google button on sign-in or sign-up (the reserved space only)', async () => {
    mockFlag.mockReturnValue(false);
    await renderSheet(state());
    expect(screen.queryByTestId('auth-google')).toBeNull();
    expect(screen.queryByText(en['account.google.or'])).toBeNull();
    await press('auth-to-signup');
    expect(screen.queryByTestId('auth-google')).toBeNull();
  });

  test('on: the button, then "or use email", on both views', async () => {
    await renderSheet(state());
    expect(screen.getByTestId('auth-google')).toHaveProp('accessibilityLabel', en['account.google.continue']);
    expect(screen.getByText(en['account.google.or'])).toBeTruthy();
    await press('auth-to-signup');
    expect(screen.getByTestId('auth-google')).toBeTruthy();
  });

  test('zh-Hans wording', async () => {
    await renderSheet(state(), 'signIn', ZH);
    expect(screen.getByText(zhHans['account.google.continue'])).toBeTruthy();
    expect(screen.getByText(zhHans['account.google.or'])).toBeTruthy();
  });
});

describe('Continue with Google', () => {
  test('signs in with { kind: google } and closes', async () => {
    const account = state();
    const { onClose } = await renderSheet(account);
    await press('auth-google');
    expect(account.signIn).toHaveBeenCalledWith({ kind: 'google' });
    expect(onClose).toHaveBeenCalled();
  });

  test('while the window is open: waiting label and hint, the email form waits, a second press replaces the first', async () => {
    const first = pending();
    const second = pending();
    const account = state({ signIn: jest.fn().mockReturnValueOnce(first.promise).mockReturnValueOnce(second.promise) });
    const { onClose } = await renderSheet(account);
    await press('auth-google');
    expect(screen.getByTestId('auth-google')).toHaveProp('accessibilityLabel', en['account.google.waiting']);
    expect(screen.getByTestId('auth-google-wait')).toHaveTextContent(en['account.google.waitHint']);
    expect(screen.getByTestId('auth-submit')).toBeDisabled();
    expect(screen.getByTestId('auth-google')).not.toBeDisabled();
    await press('auth-google');
    expect(account.signIn).toHaveBeenCalledTimes(2);
    // The first request's result (Firebase cancels its window) is ignored.
    await act(async () => first.reject(new AuthError('cancelled')));
    expect(screen.queryByTestId('auth-notice')).toBeNull();
    expect(screen.getByTestId('auth-google-wait')).toBeTruthy();
    await act(async () => second.resolve());
    expect(onClose).toHaveBeenCalledTimes(1);
  });

  test('the window closed: a quiet line, no alert, everything enabled again', async () => {
    const account = state({ signIn: jest.fn(async () => Promise.reject(new AuthError('cancelled'))) });
    await renderSheet(account);
    await press('auth-google');
    expect(screen.getByTestId('auth-notice')).toHaveTextContent(en['account.google.cancelled']);
    expect(screen.queryByTestId('auth-error')).toBeNull();
    expect(screen.getByTestId('auth-submit')).not.toBeDisabled();
  });

  test('blocked: the message says to press again', async () => {
    await renderSheet(state({ signIn: jest.fn(async () => Promise.reject(new AuthError('popup-blocked'))) }));
    await press('auth-google');
    expect(screen.getByTestId('auth-error')).toHaveTextContent(en['account.google.blocked']);
  });

  test('offline: the usual no-connection message', async () => {
    await renderSheet(state({ signIn: jest.fn(async () => Promise.reject(new AuthError('network'))) }));
    await press('auth-google');
    expect(screen.getByTestId('auth-error')).toHaveTextContent(en['auth.error.network']);
  });

  test('the email has a password account (from sign-up): moves to sign-in with the email filled in and the message', async () => {
    const account = state({ signIn: jest.fn(async () => Promise.reject(new AuthError('account-exists', undefined, { email: 'pat@example.com' }))) });
    await renderSheet(account);
    await press('auth-to-signup');
    await press('auth-google');
    expect(screen.getByTestId('auth-email')).toHaveProp('value', 'pat@example.com');
    expect(screen.getByTestId('auth-error')).toHaveTextContent(en['account.google.exists']);
    expect(screen.getByTestId('auth-forgot')).toBeTruthy();
  });

  test('an email sign-in running: the Google button is disabled', async () => {
    const run = pending();
    const account = state({ signIn: jest.fn(() => run.promise) });
    await renderSheet(account);
    await act(async () => {
      fireEvent.changeText(screen.getByTestId('auth-email'), 'a@example.com');
      fireEvent.changeText(screen.getByTestId('auth-password'), 'pw');
    });
    await press('auth-submit');
    expect(screen.getByTestId('auth-google')).toBeDisabled();
    await act(async () => run.resolve());
  });
});

describe('deleting an account with Google and no password', () => {
  const signedIn = (over: Partial<AccountState> = {}) => state({ status: 'signedIn', user: GINA, sync: { state: 'idle', lastSyncedAt: null }, ...over });

  test('no password field; the hint names the account; Delete asks Google', async () => {
    const account = signedIn();
    const { onDeleted } = await renderSheet(account, 'delete');
    expect(screen.queryByTestId('delete-password')).toBeNull();
    expect(screen.getByText(en['account.google.deleteHint'].replace('{email}', GINA.email))).toBeTruthy();
    expect(screen.getByTestId('delete-confirm')).not.toBeDisabled();
    await press('delete-confirm');
    expect(account.deleteAccount).toHaveBeenCalledWith({ kind: 'google' }, expect.objectContaining({ signal: expect.objectContaining({ aborted: false }) }));
    expect(onDeleted).toHaveBeenCalled();
  });

  test('shown whatever the flag (a password field would be a dead end)', async () => {
    mockFlag.mockReturnValue(false);
    await renderSheet(signedIn(), 'delete');
    expect(screen.queryByTestId('delete-password')).toBeNull();
  });

  test('an account with a password keeps the password field', async () => {
    await renderSheet(signedIn({ user: { ...GINA, providers: ['google', 'password'] } }), 'delete');
    expect(screen.getByTestId('delete-password')).toBeTruthy();
  });

  test("Cancel while Google's window is open gives the delete up and closes", async () => {
    const run = pending();
    let options: DeleteOptions | undefined;
    const account = signedIn({
      deleteAccount: jest.fn((_p, o?: DeleteOptions) => {
        options = o;
        return run.promise;
      }),
    });
    const { onClose, onDeleted } = await renderSheet(account, 'delete');
    await press('delete-confirm');
    expect(screen.getByTestId('delete-google-wait')).toHaveTextContent(en['account.google.deleteWaitHint']);
    expect(screen.getByTestId('delete-cancel')).not.toBeDisabled();
    expect(screen.getByTestId('auth-close')).not.toBeDisabled();
    await press('delete-cancel');
    expect(options?.signal?.aborted).toBe(true);
    expect(onClose).toHaveBeenCalledTimes(1);
    await act(async () => run.reject(new AuthError('cancelled')));
    expect(onDeleted).not.toHaveBeenCalled();
  });

  test('once Google has proven the account, the sheet locks like a password delete', async () => {
    const run = pending();
    const account = signedIn({
      deleteAccount: jest.fn((_p, o?: DeleteOptions) => {
        o?.onProven?.();
        return run.promise;
      }),
    });
    const { onClose } = await renderSheet(account, 'delete');
    await press('delete-confirm');
    expect(screen.queryByTestId('delete-google-wait')).toBeNull();
    expect(screen.getByTestId('delete-cancel')).toBeDisabled();
    await press('auth-close');
    expect(onClose).not.toHaveBeenCalled();
    await act(async () => run.resolve());
    expect(onClose).toHaveBeenCalledTimes(1);
  });

  test('another Google account: the mismatch message with the email; the window closed: a quiet line', async () => {
    const account = signedIn({ deleteAccount: jest.fn(async () => Promise.reject(new AuthError('wrong-credentials'))) });
    await renderSheet(account, 'delete');
    await press('delete-confirm');
    expect(screen.getByTestId('delete-error')).toHaveTextContent(en['account.google.deleteMismatch'].replace('{email}', GINA.email));
    jest.mocked(account.deleteAccount).mockRejectedValueOnce(new AuthError('cancelled'));
    await press('delete-confirm');
    expect(screen.getByTestId('delete-notice')).toHaveTextContent(en['account.google.deleteCancelled']);
    expect(screen.queryByTestId('delete-error')).toBeNull();
  });

  test('the Under 13 offer for a Google account confirms with Google too', async () => {
    const account = state({ signInAllowed: false, under13Offer: { email: GINA.email, method: 'google' } });
    await renderSheet(account, 'offerDelete');
    expect(screen.queryByTestId('delete-password')).toBeNull();
    expect(screen.getByTestId('offer-email')).toHaveTextContent(GINA.email);
    await press('delete-confirm');
    expect(account.deleteOfferedAccount).toHaveBeenCalledWith({ kind: 'google' }, expect.objectContaining({ signal: expect.any(Object) }));
  });

  test('a password offer keeps the password field', async () => {
    await renderSheet(state({ signInAllowed: false, under13Offer: { email: 'kid@example.com' } }), 'offerDelete');
    expect(screen.getByTestId('delete-password')).toBeTruthy();
  });
});
