// Acceptance (orchestrator-owned, B-1 #29's requirement): the first-run gate never covers /privacy. The privacy
// policy must open directly (the App Store review URL, links from outside the app) even before the intro is done.
import { render, screen } from '@testing-library/react-native';
import { Text } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { createStorage, memoryBackend, setStorageForTesting } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { FirstRunGate, isFirstRunExempt } from '../FirstRunGate';
import { onboardingKey } from '../keys';

const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };

async function gateAt(pathname: string | undefined) {
  const storage = createStorage(memoryBackend());
  setStorageForTesting(storage);
  await render(
    <SafeAreaProvider
      initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}
    >
      <I18nProvider storage={storage} locales={[EN]}>
        <ThemeProvider storage={storage} systemScheme="light">
          <FirstRunGate storage={storage} pathname={pathname}>
            <Text testID="app-content">app</Text>
          </FirstRunGate>
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>,
  );
  return storage;
}

afterEach(() => setStorageForTesting(null));

describe('paths the first-run gate never covers', () => {
  it.each(['/privacy', '/privacy/'])('%s is exempt', (p) => {
    expect(isFirstRunExempt(p)).toBe(true);
  });

  it.each(['/', '/study', '/me', '/privacy-old', '/privacyx', '/read/privacy', ''])('%s is not exempt', (p) => {
    expect(isFirstRunExempt(p)).toBe(false);
  });

  it('a direct /privacy load on a fresh device shows the page, not the intro, and does not finish the intro', async () => {
    const storage = await gateAt('/privacy');
    expect(screen.getByTestId('app-content')).toBeTruthy();
    expect(screen.queryByTestId('first-run-welcome')).toBeNull();
    expect(storage.get(onboardingKey)).toEqual({ done: false, ageRange: null });
  });

  it('any other page on a fresh device still shows the intro', async () => {
    await gateAt('/study');
    expect(screen.getByTestId('first-run-welcome')).toBeTruthy();
    expect(screen.queryByTestId('app-content')).toBeNull();
  });

  it('with no pathname the gate behaves as before', async () => {
    await gateAt(undefined);
    expect(screen.getByTestId('first-run-welcome')).toBeTruthy();
  });
});
