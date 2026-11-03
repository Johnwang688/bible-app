// Home's one-line "confirm your email" banner (email verification, decision 13): only while signed in with an
// unconfirmed email; the new and paused wording; one link to Me with a hint; gone once confirmed; nothing outside an
// AccountProvider.
import { act, fireEvent, render, screen, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { AccountProvider, VERIFY_SHIPPED_AT } from '../../auth/AccountProvider';
import { ALWAYS_ALLOWED } from '../../auth/signInGate';
import { unconfirmed, verifyingAuth, type VerifyFake } from '../../auth/__tests__/verifyFake';
import { I18nProvider } from '../../i18n/I18nProvider';
import { en } from '../../i18n/messages/en';
import { zhHans } from '../../i18n/messages/zh-Hans';
import type { DeviceLocale } from '../../i18n/types';
import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryRemote } from '../../sync/memoryRemote';
import { DOMAINS } from '../../sync/__tests__/fixtures';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { VerifyBanner } from '../VerifyBanner';

jest.mock('../../auth/firebaseApp', () => ({
  getFirebaseAuth: () => {
    throw new Error('no firebase here');
  },
}));

const EN: DeviceLocale[] = [{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }];
const ZH: DeviceLocale[] = [{ languageTag: 'zh-Hans-CN', languageCode: 'zh', scriptCode: 'Hans', regionCode: 'CN' }];

async function renderBanner(auth: VerifyFake | null, opts: { locales?: DeviceLocale[]; onPress?: () => void } = {}) {
  const storage = createStorage(memoryBackend());
  const remote = createMemoryRemote();
  const Wrapper = ({ children }: { children: ReactNode }) => (
    <I18nProvider storage={storage} locales={opts.locales ?? EN}>
      <ThemeProvider storage={storage} systemScheme="light">
        {auth ? (
          <AccountProvider signInGate={ALWAYS_ALLOWED} auth={auth} storage={storage} remoteFor={() => remote} domains={DOMAINS}>
            {children}
          </AccountProvider>
        ) : (
          children
        )}
      </ThemeProvider>
    </I18nProvider>
  );
  await render(<VerifyBanner onPress={opts.onPress ?? (() => undefined)} />, { wrapper: Wrapper });
  await act(async () => new Promise((r) => setTimeout(r, 10)));
}

test('an unconfirmed new account: "Confirm your email to start syncing", a link to Me with a hint', async () => {
  const onPress = jest.fn();
  await renderBanner(verifyingAuth(unconfirmed('alice')), { onPress });
  const banner = await screen.findByTestId('home-verify-banner');
  expect(banner).toHaveTextContent(en['home.verifyBanner.new']);
  expect(banner.props.accessibilityRole).toBe('link');
  expect(banner.props.accessibilityLabel).toBe(en['home.verifyBanner.new']);
  expect(banner.props.accessibilityHint).toBe(en['home.verifyBanner.hint']);
  await act(async () => fireEvent.press(banner));
  expect(onPress).toHaveBeenCalledTimes(1);
});

test('an account made before the change: "Sync is paused. Confirm your email." (and zh-Hans)', async () => {
  await renderBanner(verifyingAuth(unconfirmed('old', VERIFY_SHIPPED_AT - 1)));
  expect(await screen.findByTestId('home-verify-banner')).toHaveTextContent(en['home.verifyBanner.paused']);
});

test('zh-Hans wording', async () => {
  await renderBanner(verifyingAuth(unconfirmed('alice')), { locales: ZH });
  expect(await screen.findByTestId('home-verify-banner')).toHaveTextContent(zhHans['home.verifyBanner.new']!);
});

test('confirmed, signed out, or no provider: nothing', async () => {
  await renderBanner(verifyingAuth({ ...unconfirmed('alice'), emailVerified: true }));
  expect(screen.queryByTestId('home-verify-banner')).toBeNull();
  await renderBanner(verifyingAuth(null));
  expect(screen.queryByTestId('home-verify-banner')).toBeNull();
  await renderBanner(null);
  expect(screen.queryByTestId('home-verify-banner')).toBeNull();
});

test('the banner goes once the email is confirmed', async () => {
  const auth = verifyingAuth(unconfirmed('alice'));
  await renderBanner(auth);
  expect(await screen.findByTestId('home-verify-banner')).toBeTruthy();
  auth.server.emailVerified = true;
  // A new ID token (as after the check elsewhere) reports the confirmed user.
  await act(async () => auth.emit({ ...unconfirmed('alice'), emailVerified: true }));
  await waitFor(() => expect(screen.queryByTestId('home-verify-banner')).toBeNull());
});
