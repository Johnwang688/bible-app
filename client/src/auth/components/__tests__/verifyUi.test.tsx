// The email-verification UI (11-03, prototype design/proposed/r6b-verify.html) over the real provider and a fake
// backend that verifies emails: Create account turns the sheet into "Confirm your email"; the card's unconfirmed,
// paused, sent, checking, error and pending-change states; Change email; the confirmed banner; /me?verified=1; the
// automatic check while the sheet is open; en and zh-Hans wording.
import { act, fireEvent, render, screen, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { Platform } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../../i18n/I18nProvider';
import { en } from '../../../i18n/messages/en';
import { zhHans } from '../../../i18n/messages/zh-Hans';
import type { DeviceLocale } from '../../../i18n/types';
import { createStorage, memoryBackend, type Storage } from '../../../storage/storage';
import { createMemoryRemote } from '../../../sync/memoryRemote';
import { DOMAINS } from '../../../sync/__tests__/fixtures';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import { AccountProvider, VERIFY_SHIPPED_AT } from '../../AccountProvider';
import { ALWAYS_ALLOWED } from '../../signInGate';
import { AuthError, type AuthUser } from '../../types';
import { unconfirmed, verifyingAuth, type VerifyFake } from '../../__tests__/verifyFake';
import { AccountCard } from '../AccountCard';
import { AUTO_CHECK_MS } from '../AccountSheet';

jest.mock('../../../reader/components/useReduceMotion', () => ({ useReduceMotion: () => true }));
jest.mock('../../firebaseApp', () => ({
  getFirebaseAuth: () => {
    throw new Error('no firebase here');
  },
}));

const EN: DeviceLocale[] = [{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }];
const ZH: DeviceLocale[] = [{ languageTag: 'zh-Hans-CN', languageCode: 'zh', scriptCode: 'Hans', regionCode: 'CN' }];

async function renderCard(auth: VerifyFake, opts: { locales?: DeviceLocale[]; storage?: Storage; now?: () => number } = {}) {
  const storage = opts.storage ?? createStorage(memoryBackend());
  const remote = createMemoryRemote();
  const Wrapper = ({ children }: { children: ReactNode }) => (
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={opts.locales ?? EN}>
        <ThemeProvider storage={storage} systemScheme="light">
          <AccountProvider
            signInGate={ALWAYS_ALLOWED}
            auth={auth}
            storage={storage}
            remoteFor={() => remote}
            domains={DOMAINS}
            continueUrl="https://app.test/me?verified=1"
            now={opts.now}
          >
            {children}
          </AccountProvider>
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>
  );
  const ui = await render(<AccountCard />, { wrapper: Wrapper });
  return { ui, storage };
}

const type = async (testID: string, text: string) => {
  await act(async () => fireEvent.changeText(screen.getByTestId(testID), text));
};
const press = async (testID: string) => {
  await act(async () => fireEvent.press(screen.getByTestId(testID)));
};
const fill = (template: string, values: Record<string, string>) => template.replace(/\{(\w+)\}/g, (_, k: string) => values[k] ?? '');

describe('Create account, then "Confirm your email"', () => {
  test('the sheet stays open and turns into Confirm your email, with the countdown; nothing syncs', async () => {
    const auth = verifyingAuth(null);
    await renderCard(auth);
    await press(await screen.findByTestId('account-sign-in').then(() => 'account-sign-in'));
    await press('auth-to-signup');
    expect(screen.getByText(en['auth.signUp.note'])).toBeTruthy(); // decision 12's small print
    await type('auth-email', 'carol@example.com');
    await type('auth-password', 'long enough');
    await press('auth-submit');
    expect(await screen.findByTestId('verify-sheet')).toBeTruthy();
    expect(screen.getAllByText(en['account.verify.title']).length).toBeGreaterThanOrEqual(1);
    expect(screen.getByTestId('verify-sent-to')).toHaveTextContent(fill(en['account.verify.sent'], { email: 'carol@example.com' }));
    expect(screen.queryByTestId('auth-back')).toBeNull(); // the account exists: no Back
    expect(auth.log).toContain('send:en:https://app.test/me?verified=1');
    const resend = screen.getByTestId('verify-resend');
    expect(resend.props.accessibilityState).toMatchObject({ disabled: true });
    expect(resend).toHaveTextContent(/Send again in (0:5\d|1:00)/);
  });

  test('a failed send shows its error in the confirm view, and Send again stays available', async () => {
    const auth = verifyingAuth(null);
    auth.sendFails = new AuthError('network');
    await renderCard(auth);
    await press(await screen.findByTestId('account-sign-in').then(() => 'account-sign-in'));
    await press('auth-to-signup');
    await type('auth-email', 'carol@example.com');
    await type('auth-password', 'long enough');
    await press('auth-submit');
    expect(await screen.findByText(en['account.verify.offline'])).toBeTruthy();
    expect(screen.getByTestId('verify-resend').props.accessibilityState).toMatchObject({ disabled: false });
  });

  test('the sheet checks by itself every 10 s and closes once the email is confirmed; the card says so', async () => {
    jest.useFakeTimers();
    try {
      const auth = verifyingAuth(null);
      await renderCard(auth);
      await act(async () => {
        await jest.advanceTimersByTimeAsync(10);
      });
      await press('account-sign-in');
      await press('auth-to-signup');
      await type('auth-email', 'carol@example.com');
      await type('auth-password', 'long enough');
      await press('auth-submit');
      expect(screen.getByTestId('verify-sheet')).toBeTruthy();
      await act(async () => {
        await jest.advanceTimersByTimeAsync(AUTO_CHECK_MS + 5);
      });
      expect(auth.log.filter((l) => l === 'reload')).toHaveLength(1);
      expect(screen.queryByTestId('verify-status')).toBeNull(); // an automatic check that finds nothing says nothing
      auth.server.emailVerified = true;
      await act(async () => {
        await jest.advanceTimersByTimeAsync(AUTO_CHECK_MS + 5);
      });
      expect(screen.queryByTestId('verify-sheet')).toBeNull();
      expect(screen.getByTestId('account-toast')).toHaveTextContent(en['account.verify.confirmed']);
      expect(screen.queryByTestId('verify-card')).toBeNull();
    } finally {
      jest.useRealTimers();
    }
  });
});

describe('the card while unconfirmed', () => {
  test('state 2: the sync line, the notice in place of Sync now, Sign out and Delete stay', async () => {
    await renderCard(verifyingAuth(unconfirmed('alice')));
    expect(await screen.findByTestId('verify-card')).toBeTruthy();
    expect(screen.getByText(en['account.verify.line'])).toBeTruthy();
    expect(screen.getByTestId('verify-card-body')).toHaveTextContent(fill(en['account.verify.cardBody'], { email: 'alice@example.com' }));
    expect(screen.queryByTestId('account-sync-now')).toBeNull();
    expect(screen.getByTestId('account-sign-out')).toBeTruthy();
    expect(screen.getByTestId('account-delete')).toBeTruthy();
    expect(screen.getByTestId('verify-card-resend')).toHaveTextContent(en['account.verify.resend']);
  });

  test('I’ve confirmed: Checking…, then "Not confirmed yet" as a quiet status', async () => {
    const auth = verifyingAuth(unconfirmed('alice'));
    let release!: () => void;
    const reload = auth.reload!.bind(auth);
    auth.reload = () => new Promise<AuthUser | null>((resolve) => (release = () => void reload().then(resolve)));
    await renderCard(auth);
    await press(await screen.findByTestId('verify-card-done').then(() => 'verify-card-done'));
    expect(screen.getByTestId('verify-card-done')).toHaveTextContent(en['account.verify.checking']);
    expect(screen.getByTestId('verify-card-done').props.accessibilityState).toMatchObject({ busy: true });
    await act(async () => release());
    expect(await screen.findByText(en['account.verify.notYet'])).toBeTruthy();
  });

  test('Send again: "Sent" (polite) and the countdown', async () => {
    const auth = verifyingAuth(unconfirmed('alice'));
    await renderCard(auth);
    await press(await screen.findByTestId('verify-card-resend').then(() => 'verify-card-resend'));
    expect(await screen.findByText(en['account.verify.resent'])).toBeTruthy();
    expect(screen.getByTestId('verify-card-status-slot').props.accessibilityLiveRegion).toBe('polite');
    const resend = screen.getByTestId('verify-card-resend');
    expect(resend.props.accessibilityState).toMatchObject({ disabled: true });
    expect(resend).toHaveTextContent(/Send again in (0:5\d|1:00)/);
  });

  test('too many emails: the red box (an alert) and Send again held for 5 minutes', async () => {
    const auth = verifyingAuth(unconfirmed('alice'));
    auth.sendFails = new AuthError('too-many-requests');
    await renderCard(auth);
    await press(await screen.findByTestId('verify-card-resend').then(() => 'verify-card-resend'));
    const box = await screen.findByTestId('verify-card-status');
    expect(box).toHaveTextContent(en['account.verify.tooMany']);
    expect(box.props.accessibilityRole).toBe('alert');
    expect(screen.getByTestId('verify-card-resend')).toHaveTextContent(/Send again in (4:5\d|5:00)/);
  });

  test('offline: the red box, and Send again stays available', async () => {
    const auth = verifyingAuth(unconfirmed('alice'));
    auth.sendFails = new AuthError('network');
    await renderCard(auth);
    await press(await screen.findByTestId('verify-card-resend').then(() => 'verify-card-resend'));
    expect(await screen.findByText(en['account.verify.offline'])).toBeTruthy();
    expect(screen.getByTestId('verify-card-resend').props.accessibilityState).toMatchObject({ disabled: false });
  });

  test('an older account: Sync is paused, then Send confirmation email', async () => {
    const auth = verifyingAuth(unconfirmed('old', VERIFY_SHIPPED_AT - 86_400_000));
    await renderCard(auth);
    expect(await screen.findByText(en['account.verify.pausedLine'])).toBeTruthy();
    expect(screen.getByText(en['account.verify.pausedTitle'])).toBeTruthy();
    expect(screen.getByTestId('verify-card-body')).toHaveTextContent(fill(en['account.verify.pausedBody'], { email: 'old@example.com' }));
    await press('verify-card-first-send');
    expect(auth.log.some((l) => l.startsWith('send:'))).toBe(true);
    // After the first send it is state 2, still paused.
    expect(await screen.findByTestId('verify-card-done')).toBeTruthy();
    expect(screen.getByText(en['account.verify.pausedLine'])).toBeTruthy();
    expect(screen.getByText(en['account.verify.resent'])).toBeTruthy();
  });

  test('Change email: the sheet, Link sent, then the card waits for the new address; Keep the old email', async () => {
    const auth = verifyingAuth(unconfirmed('alice'));
    await renderCard(auth);
    await press(await screen.findByTestId('verify-card-change').then(() => 'verify-card-change'));
    expect(screen.getByText(en['account.changeEmail.intro'])).toBeTruthy();
    await type('change-email', 'alice@example.com');
    await type('change-password', 'pw');
    await press('change-submit');
    expect(screen.getByText(en['account.changeEmail.same'])).toBeTruthy();
    await type('change-email', 'alice.new@example.org');
    await type('change-password', 'wrong');
    await press('change-submit');
    expect(screen.getByText(en['delete.wrongPassword'])).toBeTruthy();
    await type('change-password', 'pw');
    await press('change-submit');
    expect(await screen.findByTestId('change-sent')).toBeTruthy();
    expect(auth.log).toContain('change:alice.new@example.org:en');
    await press('change-done');
    expect(screen.queryByTestId('change-sent')).toBeNull();
    expect(screen.getByText(en['account.verify.pendingTitle'])).toBeTruthy();
    expect(screen.getByTestId('verify-card-body')).toHaveTextContent(
      fill(en['account.verify.pendingBody'], { email: 'alice.new@example.org', old: 'alice@example.com' }),
    );
    await press('verify-card-keep');
    expect(screen.getByText(en['account.verify.title'])).toBeTruthy();
  });

  test('zh-Hans wording', async () => {
    await renderCard(verifyingAuth(unconfirmed('alice')), { locales: ZH });
    expect(await screen.findByText(zhHans['account.verify.line']!)).toBeTruthy();
    expect(screen.getByText(zhHans['account.verify.title']!)).toBeTruthy();
    expect(screen.getByTestId('verify-card-done')).toHaveTextContent(zhHans['account.verify.done']!);
    expect(screen.getByTestId('verify-card-change')).toHaveTextContent(zhHans['account.verify.change']!);
  });
});

describe('/me?verified=1 (web)', () => {
  const realOS = Platform.OS;
  let replaced: string | null = null;
  beforeEach(() => {
    replaced = null;
    Object.defineProperty(Platform, 'OS', { value: 'web', configurable: true });
    (globalThis as { window?: unknown }).window = Object.assign((globalThis as { window?: object }).window ?? {}, {
      location: { href: 'https://app.test/me?verified=1', origin: 'https://app.test' },
      history: { state: null, replaceState: (_s: unknown, _t: string, url: string) => (replaced = url) },
    });
  });
  afterEach(() => {
    Object.defineProperty(Platform, 'OS', { value: realOS, configurable: true });
  });

  test('signed out on this browser: "Email confirmed. Sign in to sync.", and the parameter is dropped', async () => {
    await renderCard(verifyingAuth(null));
    expect(await screen.findByTestId('account-toast')).toHaveTextContent(en['account.verify.confirmedSignedOut']);
    expect(replaced).toBe('/me');
  });

  test('signed in and now confirmed: one check, then "Email confirmed. Syncing now."', async () => {
    const auth = verifyingAuth(unconfirmed('alice'));
    auth.server.emailVerified = true;
    await renderCard(auth);
    await waitFor(() => expect(screen.getByTestId('account-toast')).toHaveTextContent(en['account.verify.confirmed']));
    expect(auth.log.filter((l) => l === 'reload')).toHaveLength(1);
    expect(screen.queryByTestId('verify-card')).toBeNull();
  });
});
