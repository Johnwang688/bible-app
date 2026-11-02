// R-7a follow-up (John, 11-02, r7a/FOLLOW-UP.md item 2). Orchestrator-owned acceptance tests; do not edit.
// At start the app loads only the active look's fonts (its UI font and its Scripture font), with
// `font-display: swap`, plus the Chinese Scripture font only when the interface or the translation is Chinese.
// On the web nothing waits for them (text shows at once in a fallback font). Another look's fonts load when that
// look is chosen, and when the look picker shows it.
import { act, render, screen } from '@testing-library/react-native';
import { useEffect, type ReactNode } from 'react';
import { Platform, Text } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { LookStep } from '../../onboarding/steps/LookStep';
import { appearanceKey, readerPositionKey } from '../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting, type Storage } from '../../storage/storage';
import { getTheme } from '../../theme/presets';
import { ThemeProvider, useAppearance } from '../../theme/ThemeProvider';
import { FontGate } from '../FontGate';
import { ensureFont } from '../lazy';
import { ensureLookFonts, lookFontNames, resetLookFontsForTesting } from '../lookFonts';

jest.mock('expo-font', () => ({
  loadAsync: jest.fn(),
  isLoaded: jest.fn(() => false),
  FontDisplay: { AUTO: 'auto', SWAP: 'swap', BLOCK: 'block', FALLBACK: 'fallback', OPTIONAL: 'optional' },
}));
jest.mock('../lazy', () => ({ ...jest.requireActual('../lazy'), ensureFont: jest.fn(() => Promise.resolve()) }));

// eslint-disable-next-line import/first
import * as Font from 'expo-font';

const loadAsync = Font.loadAsync as unknown as jest.Mock;
const mockEnsureFont = ensureFont as unknown as jest.Mock;

const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
const ZH: DeviceLocale = { languageTag: 'zh-Hans-CN', languageCode: 'zh', scriptCode: 'Hans', regionCode: 'CN' };

const GLASS = [
  'PlusJakartaSans_400Regular',
  'PlusJakartaSans_700Bold',
  'PlusJakartaSans_800ExtraBold',
  'SourceSerif4_400Regular',
  'SourceSerif4_400Regular_Italic',
  'SourceSerif4_700Bold',
];
const PASTEL = [
  'SpaceGrotesk_400Regular',
  'SpaceGrotesk_700Bold',
  'Literata_400Regular',
  'Literata_400Regular_Italic',
  'Literata_700Bold',
];

/** Every face name passed to `loadAsync`, whether as a map or as (name, source); with each source. */
function loaded(): { name: string; source: unknown }[] {
  const out: { name: string; source: unknown }[] = [];
  for (const args of loadAsync.mock.calls) {
    if (typeof args[0] === 'string') out.push({ name: args[0], source: args[1] });
    else for (const [name, source] of Object.entries(args[0] as Record<string, unknown>)) out.push({ name, source });
  }
  return out;
}
const names = () => [...new Set(loaded().map((l) => l.name))].sort();

let os: typeof Platform.OS;
beforeEach(() => {
  os = Platform.OS;
  loadAsync.mockReset();
  loadAsync.mockImplementation(() => new Promise(() => undefined)); // never settles unless a test says so
  mockEnsureFont.mockClear();
  resetLookFontsForTesting();
});
afterEach(() => {
  Platform.OS = os;
  setStorageForTesting(null);
});

function Providers({ storage, locale, children }: { storage: Storage; locale: DeviceLocale; children: ReactNode }) {
  return (
    <SafeAreaProvider
      initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}
    >
      <I18nProvider storage={storage} locales={[locale]}>
        <ThemeProvider storage={storage} systemScheme="light">
          {children}
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>
  );
}

let chooser: ((id: 'strawberry-milk' | 'silver') => void) | null = null;
function Chooser() {
  const { choice, setChoice } = useAppearance();
  useEffect(() => {
    chooser = (id) => setChoice({ ...choice, preset: id });
  }, [choice, setChoice]);
  return null;
}

async function start(opts: { os: typeof Platform.OS; preset?: 'silver' | 'strawberry-milk'; locale?: DeviceLocale; translation?: 'BSB' | 'CUV' | 'CUV-SIMP'; onReady?: () => void }) {
  Platform.OS = opts.os;
  const storage = createStorage(memoryBackend());
  if (opts.preset) storage.set(appearanceKey, { preset: opts.preset, mode: 'system' });
  if (opts.translation) storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: opts.translation });
  setStorageForTesting(storage);
  await render(
    <Providers storage={storage} locale={opts.locale ?? EN}>
      <Chooser />
      <FontGate onReady={opts.onReady}>
        <Text testID="app">app</Text>
      </FontGate>
    </Providers>,
  );
  return storage;
}

describe('lookFontNames', () => {
  it('is the glass looks’ UI and Scripture faces, and nothing else', () => {
    for (const id of ['silver', 'graphite', 'northern-lights'] as const) expect([...lookFontNames(getTheme(id))].sort()).toEqual([...GLASS].sort());
  });
  it('is the pastel looks’ UI and Scripture faces, and nothing else', () => {
    for (const id of ['strawberry-milk', 'bubblegum-night'] as const) expect([...lookFontNames(getTheme(id))].sort()).toEqual([...PASTEL].sort());
  });
});

describe('ensureLookFonts', () => {
  it('loads each face once, with font-display: swap', async () => {
    loadAsync.mockImplementation(() => Promise.resolve());
    await ensureLookFonts(getTheme('silver'));
    await ensureLookFonts(getTheme('graphite'));
    expect(names()).toEqual([...GLASS].sort());
    expect(loaded()).toHaveLength(GLASS.length);
    for (const { source } of loaded()) expect(source).toMatchObject({ display: 'swap' });
  });
  it('forgets a failed load, so the next call retries it', async () => {
    loadAsync.mockImplementationOnce(() => Promise.reject(new Error('offline')));
    loadAsync.mockImplementation(() => Promise.resolve());
    await ensureLookFonts(getTheme('silver')).catch(() => undefined);
    const before = loaded().length;
    await ensureLookFonts(getTheme('silver'));
    expect(loaded().length).toBeGreaterThan(before);
  });
});

describe('FontGate on the web', () => {
  it('shows the app at once and loads only the active look’s fonts (Silver)', async () => {
    const onReady = jest.fn();
    await start({ os: 'web', onReady });
    expect(screen.getByTestId('app')).toBeTruthy();
    expect(onReady).toHaveBeenCalledTimes(1);
    expect(names()).toEqual([...GLASS].sort());
    for (const { source } of loaded()) expect(source).toMatchObject({ display: 'swap' });
    expect(mockEnsureFont).not.toHaveBeenCalled();
  });

  it('loads only the pastel faces for a pastel look', async () => {
    await start({ os: 'web', preset: 'strawberry-milk' });
    expect(names()).toEqual([...PASTEL].sort());
  });

  it('loads the Chinese Scripture font at start when the interface is Chinese', async () => {
    await start({ os: 'web', locale: ZH });
    expect(mockEnsureFont).toHaveBeenCalledWith('chineseScripture');
    expect(names()).toEqual([...GLASS].sort());
  });

  it.each(['CUV', 'CUV-SIMP'] as const)('loads the Chinese Scripture font at start when the translation is %s', async (translation) => {
    await start({ os: 'web', translation });
    expect(mockEnsureFont).toHaveBeenCalledWith('chineseScripture');
  });

  it('does not load the Chinese Scripture font for English with an English translation', async () => {
    await start({ os: 'web', translation: 'BSB' });
    expect(mockEnsureFont).not.toHaveBeenCalled();
  });

  it('loads a look’s fonts when it is chosen, and only then', async () => {
    await start({ os: 'web' });
    expect(names()).toEqual([...GLASS].sort());
    await act(async () => chooser!('strawberry-milk'));
    expect(names()).toEqual([...GLASS, ...PASTEL].sort());
    const count = loaded().length;
    await act(async () => chooser!('silver'));
    expect(loaded().length).toBe(count); // already asked for: not again
  });
});

describe('FontGate on a phone', () => {
  it('waits for the active look’s fonts (bundled, local), then shows the app', async () => {
    let resolve!: () => void;
    loadAsync.mockImplementation(() => new Promise<void>((r) => (resolve = r)));
    const onReady = jest.fn();
    await start({ os: 'ios', onReady });
    expect(screen.queryByTestId('app')).toBeNull();
    expect(onReady).not.toHaveBeenCalled();
    expect(names()).toEqual([...GLASS].sort());
    await act(async () => resolve());
    expect(screen.getByTestId('app')).toBeTruthy();
    expect(onReady).toHaveBeenCalledTimes(1);
  });

  it('shows the app with the system font if a font fails to load', async () => {
    loadAsync.mockImplementation(() => Promise.reject(new Error('bad font')));
    await start({ os: 'android' });
    expect(screen.getByTestId('app')).toBeTruthy();
  });

  it('never hides the app again when another look is chosen', async () => {
    loadAsync.mockImplementation(() => Promise.resolve());
    await start({ os: 'ios' });
    loadAsync.mockImplementation(() => new Promise(() => undefined));
    await act(async () => chooser!('strawberry-milk'));
    expect(screen.getByTestId('app')).toBeTruthy();
    expect(names()).toEqual([...GLASS, ...PASTEL].sort());
  });
});

describe('the look picker', () => {
  it('loads the fonts of the looks its cards show', async () => {
    Platform.OS = 'web';
    const storage = createStorage(memoryBackend());
    setStorageForTesting(storage);
    await render(
      <Providers storage={storage} locale={EN}>
        <LookStep announce={false} onNext={() => undefined} onSkip={() => undefined} onBack={() => undefined} chooseLook={() => undefined} />
      </Providers>,
    );
    // Silver is active; the pastel card shows Strawberry milk in its heading font.
    expect(names()).toContain('SpaceGrotesk_700Bold');
  });
});
