// Round-2 privacy review: platform branches, locale propagation, and clipboard failure.
import * as Clipboard from 'expo-clipboard';
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import { Linking, Platform, StyleSheet } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import { createT } from '../../i18n/translate';
import type { AppLocale } from '../../i18n/types';
import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { PRIVACY_CONTACT } from '../index';
import { PrivacyScreen } from '../PrivacyScreen';

jest.mock('expo-clipboard', () => ({ setStringAsync: jest.fn(async () => true) }));

async function renderPage(lang: AppLocale = 'en', onLocaleChange = jest.fn()) {
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset: 'strawberry-milk', mode: 'light' });
  return render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={[{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }]}>
        <ThemeProvider storage={storage} systemScheme="light">
          <PrivacyScreen lang={lang} canGoBack={false} onBack={() => {}} onOpenApp={() => {}} onLocaleChange={onLocaleChange} />
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>,
  );
}

beforeEach(() => { jest.clearAllMocks(); });

afterEach(() => {
  jest.useRealTimers();
  jest.restoreAllMocks();
});

it.each(['en', 'zh-Hans'] as const)('does not announce a successful copy in %s when the clipboard returns false', async (locale) => {
  jest.replaceProperty(Platform, 'OS', 'web');
  // Expo SDK 58 resolves false when its web fallback fails; it need not reject.
  jest.mocked(Clipboard.setStringAsync).mockResolvedValueOnce(false);
  await renderPage(locale);
  await act(async () => { fireEvent.press(screen.getByTestId('privacy-email-copy')); });
  expect(Clipboard.setStringAsync).toHaveBeenCalledWith(PRIVACY_CONTACT);
  expect(screen.queryByText(createT(locale)('privacy.contact.copied'))).toBeNull();
});

it.each(['ios', 'android'] as const)('opens mail exactly once through Linking on %s', async (platform) => {
  jest.replaceProperty(Platform, 'OS', platform);
  const open = jest.spyOn(Linking, 'openURL').mockResolvedValue(undefined);
  await renderPage();
  const row = screen.getByTestId('privacy-email');
  expect(row.props.accessibilityRole).toBe('link');
  expect(row.props.href).toBeUndefined();
  await act(async () => { fireEvent.press(row); });
  expect(open).toHaveBeenCalledTimes(1);
  expect(open).toHaveBeenCalledWith('mailto:' + PRIVACY_CONTACT);
});

it('uses CSS alone on web even when the safe-area provider also reports 47pt', async () => {
  jest.replaceProperty(Platform, 'OS', 'web');
  await renderPage();
  const row = screen.getByTestId('privacy-open-app').parent;
  expect(StyleSheet.flatten(row?.parent?.props.style).paddingTop).toBe('env(safe-area-inset-top, 0px)');
  expect(screen.getByTestId('privacy-email').props.href).toBe('mailto:' + PRIVACY_CONTACT);
});

it.each(['en', 'zh-Hans'] as const)('propagates %s and subsequent page switches to lang and the route callback', async (initial) => {
  const changed = jest.fn();
  await renderPage(initial, changed);
  expect(changed).toHaveBeenLastCalledWith(initial);
  expect(screen.getByTestId('screen-privacy').props.lang).toBe(initial);
  const other = initial === 'en' ? 'zh-Hans' : 'en';
  await act(async () => { fireEvent.press(screen.getByTestId('privacy-language')); });
  expect(changed).toHaveBeenLastCalledWith(other);
  expect(screen.getByTestId('screen-privacy').props.lang).toBe(other);
});

it('restarts the confirmation on a repeated copy, leaving no timer on unmount', async () => {
  const page = await renderPage();
  jest.useFakeTimers();
  const scheduled = jest.spyOn(global, 'setTimeout');
  const cancelled = jest.spyOn(global, 'clearTimeout');
  const copy = () => fireEvent.press(screen.getByTestId('privacy-email-copy'));
  await act(async () => { copy(); });
  await act(async () => { jest.advanceTimersByTime(2000); });
  await act(async () => { copy(); });
  await act(async () => { jest.advanceTimersByTime(2000); });
  expect(screen.getByText('Email address copied')).toBeTruthy();
  const confirmations = scheduled.mock.calls
    .map(([, delay], index) => delay === 3000 ? scheduled.mock.results[index]?.value : undefined)
    .filter((handle) => handle !== undefined);
  expect(confirmations).toHaveLength(2);
  expect(cancelled).toHaveBeenCalledWith(confirmations[0]);
  await page.unmount();
  expect(cancelled).toHaveBeenCalledWith(confirmations[1]);
});
