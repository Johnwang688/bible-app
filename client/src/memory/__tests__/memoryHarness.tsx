// Test harness for the Memory screens (orchestrator-owned, MEM screens): the providers every screen needs and
// a store seeded on a fixed "now". Screens take `onNavigate` instead of importing the router.
import { render } from '@testing-library/react-native';
import type { ReactElement } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { VerseLanguageOverride, type VerseLanguage } from '../verseLanguage';
import { MemoryAuthProvider, SIGNED_OUT, type MemoryAuth } from '../voice/auth';

export const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
export const ZH: DeviceLocale = { languageTag: 'zh-Hans-CN', languageCode: 'zh', scriptCode: 'Hans', regionCode: 'CN' };

/** Thursday 5 November 2026, 18:00 local. */
export const NOW = new Date(2026, 10, 5, 18, 0);

export const SIGNED_IN: MemoryAuth = { signedIn: true, getIdToken: async () => 'token' };

export async function renderMemory(
  build: (ctx: { storage: Storage; now: () => Date; onNavigate: jest.Mock }) => ReactElement,
  opts: {
    storage?: Storage;
    locales?: DeviceLocale[];
    auth?: MemoryAuth;
    now?: Date;
    /**
     * The verse language. Default 'zh': the suites written before English Memory render in the English interface but
     * test the Chinese verses. 'locale' follows the interface language, as the app does (the English Memory tests).
     */
    verses?: VerseLanguage | 'locale';
  } = {},
) {
  const verses = opts.verses ?? 'zh';
  const storage = opts.storage ?? createStorage(memoryBackend());
  const onNavigate = jest.fn();
  const now = opts.now ?? NOW;
  const ui = await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={opts.locales ?? [EN]}>
        <ThemeProvider storage={storage} systemScheme="light">
          <VerseLanguageOverride.Provider value={verses === 'locale' ? null : verses}>
            <MemoryAuthProvider value={opts.auth ?? SIGNED_OUT}>{build({ storage, now: () => now, onNavigate })}</MemoryAuthProvider>
          </VerseLanguageOverride.Provider>
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>,
  );
  return { ui, storage, onNavigate, now };
}

/** A local `YYYY-MM-DD`, `days` from NOW. */
export function dayFromNow(days: number, from: Date = NOW): string {
  const d = new Date(from.getFullYear(), from.getMonth(), from.getDate() + days);
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
}
