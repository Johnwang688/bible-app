// Round 2 UI counterexamples. Only this new test file is changed; assertions describe the required UI.
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../../i18n/I18nProvider';
import { en } from '../../../i18n/messages/en';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import { useAccount } from '../../AccountProvider';
import type { AccountState } from '../../types';
import { AccountCard } from '../AccountCard';

jest.mock('../../AccountProvider', () => ({ useAccount: jest.fn() }));
jest.mock('../../../reader/components/useReduceMotion', () => ({ useReduceMotion: () => true }));

const mockUseAccount = jest.mocked(useAccount);

function accountState(signedIn = false): AccountState {
  return {
    status: signedIn ? 'signedIn' : 'signedOut',
    user: signedIn ? { uid: 'alice', email: 'alice@example.com' } : null,
    signInAllowed: true,
    sync: signedIn ? { state: 'idle', lastSyncedAt: null } : null,
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
    under13Offer: null,
    deleteOfferedAccount: jest.fn(async () => undefined),
    dismissUnder13Offer: jest.fn(),
  };
}

async function renderCard(account: AccountState) {
  mockUseAccount.mockReturnValue(account);
  const storage = createStorage(memoryBackend());
  const Wrapper = ({ children }: { children: ReactNode }) => (
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={[{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }]}>
        <ThemeProvider storage={storage} systemScheme="light">{children}</ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>
  );
  return await render(<AccountCard />, { wrapper: Wrapper });
}

async function press(id: string) {
  await act(async () => { fireEvent.press(screen.getByTestId(id)); });
}

afterEach(() => {
  jest.useRealTimers();
  jest.clearAllMocks();
});

describe('Sol UI review round 2: new counterexamples', () => {
  test('R2-1: a newly supplied idle sync status uses the current clock immediately', async () => {
    jest.useFakeTimers();
    const mountedAt = new Date('2026-11-02T12:00:00Z').getTime();
    jest.setSystemTime(mountedAt);
    const ui = await renderCard(accountState());
    // No sync timestamp exists yet, so there is no clock-refresh timer while this card sits signed out.
    await act(async () => { jest.advanceTimersByTime(10 * 60_000); });
    const signedIn = accountState(true);
    signedIn.sync = { state: 'idle', lastSyncedAt: mountedAt };
    mockUseAccount.mockReturnValue(signedIn);
    await ui.rerender(<AccountCard />);
    expect(Date.now() - mountedAt).toBe(10 * 60_000);
    // Rule: idle with a timestamp uses elapsed minutes, not the time when AccountCard first mounted.
    // Actual: "Synced just now" until the newly scheduled timer eventually updates useNow.
    expect(screen.getByTestId('account-sync-status')).toHaveTextContent(en['account.sync.minutesAgo'].replace('{n}', '10'));
  });

  test('R2-2: the sign-up privacy link exposes link semantics to assistive technology', async () => {
    await renderCard(accountState());
    await press('account-sign-in');
    await press('auth-to-signup');
    expect(screen.getByTestId('auth-privacy')).toHaveTextContent(en['auth.privacy']);
    // Rule: the privacy navigation is a link. Actual: TextButton exposes accessibilityRole="button".
    expect(screen.getByTestId('auth-privacy')).toHaveProp('accessibilityRole', 'link');
  });

  test('R2-3: the pending sign-out confirmation disappears when the account becomes signed out', async () => {
    const account = accountState(true);
    account.sync = { state: 'offline', lastSyncedAt: null };
    const ui = await renderCard(account);
    await press('account-sign-out');
    expect(screen.getByTestId('account-signout-sheet')).toBeTruthy();
    // An auth-state notification can arrive while the confirmation is open. The provider is authoritative.
    mockUseAccount.mockReturnValue(accountState());
    await ui.rerender(<AccountCard />);
    expect(screen.getByTestId('account-sign-in')).toBeTruthy();
    // Rule: show the current account state. Actual: the obsolete sign-out confirmation still covers the card.
    expect(screen.queryByTestId('account-signout-sheet')).toBeNull();
  });
});
