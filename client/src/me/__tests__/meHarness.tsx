// Test harness for the Me tab (R-6a). Orchestrator-owned.
import { render } from '@testing-library/react-native';
import type { ReactElement } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { createStorage, memoryBackend, setStorageForTesting, type Storage } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import type { ThemeMode } from '../../theme/types';

export const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
export const ZH: DeviceLocale = { languageTag: 'zh-CN', languageCode: 'zh', regionCode: 'CN' };

export interface RenderMeOptions {
  storage?: Storage;
  locales?: readonly DeviceLocale[];
  scheme?: ThemeMode;
}

export async function renderMe(ui: ReactElement, opts: RenderMeOptions = {}) {
  const storage = opts.storage ?? createStorage(memoryBackend());
  // Hooks that read the app's default storage (useReaderPosition, useReadingSettings) get the test's storage
  // too. Each render sets its own; it is not reset after a test, because the tree unmounts after afterEach hooks.
  setStorageForTesting(storage);
  const result = await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={opts.locales ?? [EN]}>
        <ThemeProvider storage={storage} systemScheme={opts.scheme ?? 'light'}>
          {ui}
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>,
  );
  return { ...result, storage };
}
