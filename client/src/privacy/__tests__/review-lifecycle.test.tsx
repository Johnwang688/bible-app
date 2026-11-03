// B1-review-privacy: counterexamples and additional lifecycle/locale acceptance coverage.
import * as Clipboard from 'expo-clipboard';
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import { StyleSheet } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import { languageKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { PrivacyScreen } from '../PrivacyScreen';

jest.mock('expo-clipboard', () => ({ setStringAsync: jest.fn(async () => true) }));

async function renderPage(lang?: string | string[], canGoBack = false) {
  const storage = createStorage(memoryBackend());
  storage.set(languageKey, 'zh-Hans');
  const result = await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={[{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }]}>
        <ThemeProvider storage={storage} systemScheme="light">
          <PrivacyScreen lang={lang} canGoBack={canGoBack} onBack={() => {}} onOpenApp={() => {}} />
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>,
  );
  return { ...result, storage };
}

afterEach(() => {
  jest.useRealTimers();
  jest.restoreAllMocks();
});

it('does not create a confirmation timer when clipboard resolves after unmount', async () => {
  let finishCopy!: (value: boolean) => void;
  jest.mocked(Clipboard.setStringAsync).mockImplementationOnce(
    () => new Promise<boolean>((resolve) => { finishCopy = resolve; }),
  );
  const page = await renderPage('en');
  const scheduled = jest.spyOn(global, 'setTimeout');
  await act(async () => { fireEvent.press(screen.getByTestId('privacy-email-copy')); });
  expect(scheduled.mock.calls.filter(([, delay]) => delay === 3000)).toHaveLength(0);
  await page.unmount();
  await act(async () => { finishCopy(true); });
  // Cleanup already ran while the clipboard promise was pending.
  // Clear the leaked real timer ourselves so this failing test leaves no open handle.
  scheduled.mock.calls.forEach(([, delay], index) => {
    if (delay === 3000) clearTimeout(scheduled.mock.results[index]?.value);
  });
  expect(scheduled.mock.calls.filter(([, delay]) => delay === 3000)).toHaveLength(0);
});

it('cancels an existing confirmation timer on unmount', async () => {
  const page = await renderPage('en');
  const scheduled = jest.spyOn(global, 'setTimeout');
  const cancelled = jest.spyOn(global, 'clearTimeout');
  await act(async () => { fireEvent.press(screen.getByTestId('privacy-email-copy')); });
  expect(screen.getByText('Email address copied').props.accessibilityLiveRegion).toBe('polite');
  const index = scheduled.mock.calls.findIndex(([, delay]) => delay === 3000);
  expect(index).toBeGreaterThanOrEqual(0);
  const handle = scheduled.mock.results[index]?.value;
  await page.unmount();
  expect(cancelled).toHaveBeenCalledWith(handle);
});

it('removes the confirmation after three seconds', async () => {
  const page = await renderPage('en');
  jest.useFakeTimers();
  await act(async () => { fireEvent.press(screen.getByTestId('privacy-email-copy')); });
  expect(screen.getByText('Email address copied')).toBeTruthy();
  await act(async () => { jest.advanceTimersByTime(3000); });
  expect(screen.queryByText('Email address copied')).toBeNull();
  await page.unmount();
});

it('handles clipboard rejection without a false success message', async () => {
  jest.mocked(Clipboard.setStringAsync).mockRejectedValueOnce(new Error('clipboard denied'));
  await renderPage('en');
  await act(async () => { fireEvent.press(screen.getByTestId('privacy-email-copy')); });
  expect(screen.queryByText('Email address copied')).toBeNull();
});

it.each([undefined, 'unknown', '', [], ['unknown', 'en']])(
  'falls back to the saved interface locale for %j without persisting a page switch',
  async (lang) => {
    const { storage } = await renderPage(lang);
    const write = jest.spyOn(storage, 'set');
    expect(screen.getByRole('header', { name: '隐私政策' })).toBeTruthy();
    await act(async () => { fireEvent.press(screen.getByTestId('privacy-language')); });
    expect(screen.getByRole('header', { name: 'Privacy policy' })).toBeTruthy();
    expect(storage.get(languageKey)).toBe('zh-Hans');
    expect(write).not.toHaveBeenCalled();
  },
);

it('uses the supplied notch inset and keeps all controls at least 44 by 44', async () => {
  await renderPage('en', true);
  const back = screen.getByTestId('privacy-back');
  for (const id of ['privacy-back', 'privacy-language', 'privacy-email-copy']) {
    const style = StyleSheet.flatten(screen.getByTestId(id).props.style);
    expect(style.minWidth).toBeGreaterThanOrEqual(44);
    expect(style.minHeight).toBeGreaterThanOrEqual(44);
  }
  const bar = back.parent;
  expect(bar).not.toBeNull();
  // The host row's parent applies the SafeAreaProvider's 47pt notch inset.
  expect(StyleSheet.flatten(bar?.parent?.props.style).paddingTop).toBe(47);
});

