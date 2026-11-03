// Counterexamples for the R-6b UI review. Production code stays unchanged.
// Each test asserts the task card's required behaviour and should fail until its finding is fixed.
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../../i18n/I18nProvider';
import { en } from '../../../i18n/messages/en';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import { contrastRatio } from '../../../theme/contrast';
import { dangerColours } from '../../../theme/danger';
import { getTheme } from '../../../theme/presets';
import { PRESET_IDS } from '../../../theme/types';
import { fieldSurfaces } from '../fieldStyle';
import { useAccount } from '../../AccountProvider';
import { AuthError, type AccountState } from '../../types';
import { AccountCard } from '../AccountCard';

jest.mock('../../AccountProvider', () => ({ useAccount: jest.fn() }));
jest.mock('../../../reader/components/useReduceMotion', () => ({ useReduceMotion: () => true }));

const mockUseAccount = jest.mocked(useAccount);


function accountState(signedIn = false): AccountState {
  return {
    status: signedIn ? 'signedIn' : 'signedOut',
    user: signedIn ? { uid: 'alice', email: 'alice@example.com' } : null,
    signInAllowed: true,
    sync: null,
    signIn: jest.fn(async () => undefined),
    signUp: jest.fn(async () => undefined),
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

async function type(id: string, value: string) {
  await act(async () => { fireEvent.changeText(screen.getByTestId(id), value); });
}

afterEach(() => {
  jest.useRealTimers();
  jest.clearAllMocks();
});

describe('Sol review: reproducible account UI counterexamples', () => {
  test('R1: entering reset and returning must clear the previous delete password', async () => {
    const account = accountState(true);
    await renderCard(account);
    await press('account-delete');
    await type('delete-password', 'previous-password');
    await press('delete-forgot');
    expect(screen.getByTestId('auth-email').props.value).toBe('alice@example.com');
    await press('auth-back');
    // The confirmation must require typing again after leaving this form.
    expect(screen.getByTestId('delete-password').props.value).toBe('');
    expect(screen.getByTestId('delete-confirm')).toBeDisabled();
  });

  // R2 and R3 (late delete results after Cancel) are superseded by security review S3-4: Cancel, Close and the
  // scrim are not offered while a delete runs, because closing cannot stop it (orchestrator, same intent:
  // no stale state from a closed sheet).
  test('R2/R3 (rewritten): while a delete runs the sheet cannot be closed, and its result is shown in place', async () => {
    const account = accountState(true);
    let resolveDelete!: () => void;
    const pending = new Promise<void>((resolve) => { resolveDelete = resolve; });
    account.deleteAccount = jest.fn(() => pending);
    await renderCard(account);
    await press('account-delete');
    await type('delete-password', 'correct-password');
    await press('delete-confirm');
    expect(screen.getByTestId('delete-cancel')).toBeDisabled();
    expect(screen.getByTestId('auth-close')).toBeDisabled();
    await press('delete-cancel');
    expect(screen.getByTestId('account-sheet')).toBeTruthy();
    await act(async () => { resolveDelete(); await pending; });
    expect(screen.queryByTestId('account-sheet')).toBeNull();
  });

  test('R4: reset resend invalid-email failures must be visible in auth-error', async () => {
    const account = accountState();
    const reset = jest.fn(async (_email: string) => undefined);
    account.sendPasswordReset = reset;
    await renderCard(account);
    await press('account-sign-in');
    await type('auth-email', 'alice@example.com');
    await press('auth-forgot');
    await press('auth-submit');
    expect(screen.getByTestId('auth-reset-sent')).toBeTruthy();
    reset.mockRejectedValueOnce(new AuthError('invalid-email'));
    // Catch the injected rejection within act; the production handler also catches it.
    await press('auth-resend');
    expect(reset).toHaveBeenCalledTimes(2);
    expect(screen.queryByTestId('auth-error')).not.toBeNull();
    expect(screen.getByTestId('auth-error')).toHaveTextContent(en['auth.error.invalidEmail']);
  });

  test('R5: the delete sub-view must expose the task card\'s auth-close control', async () => {
    await renderCard(accountState(true));
    await press('account-delete');
    // The prototype omits this, but the task card explicitly requires auth-close on the one sheet.
    expect(screen.queryByTestId('auth-close')).toBeTruthy();
  });
});

// Error fields use the danger border colour. It must retain 3:1 (orchestrator: rewritten from `.text` to the new
// `.border` field, same intent, so John's approved danger text colour stays).
test('R6: invalid-field borders retain 3:1 on every preset field and sheet surface', () => {
  const failures = PRESET_IDS.flatMap((id) => {
    const theme = getTheme(id);
    const { sheet, field } = fieldSurfaces(theme);
    const ratio = Math.min(...[...sheet, ...field].map((bg) => contrastRatio(dangerColours(theme).border, bg)));
    return ratio < 3 ? [{ id, ratio: Number(ratio.toFixed(2)) }] : [];
  });
  expect(failures).toEqual([]);
});
