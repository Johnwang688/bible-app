// R-6a round 2: exercise press paths missed by the first review.
import { act, fireEvent, screen } from '@testing-library/react-native';
import { findEventHandler } from '@testing-library/react-native/dist/events/propagation';

import { appearanceCustomKey } from '../../storage/appearanceCustomKey';
import { appearanceKey, languageKey, readerPositionKey, readingSettingsKey, recentPassagesKey } from '../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting } from '../../storage/storage';
import { NO_CUSTOM, setTokenEdit, type EditResult } from '../../theme/custom';
import { useAppearance } from '../../theme/ThemeProvider';
import { AdvancedScreen } from '../AdvancedScreen';
import { CustomiseScreen } from '../CustomiseScreen';
import { MeScreen } from '../MeScreen';
import { renderMe } from './meHarness';

const ID = 'strawberry-milk';
const customise = <CustomiseScreen onBack={() => {}} onAdvanced={() => {}} />;
function setup() {
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset: ID, mode: 'light' });
  return storage;
}
function accepted(result: EditResult) {
  if (!result.ok) throw new Error(`Invalid test setup: ${JSON.stringify(result)}`);
  return result.custom;
}
function pressHandler(id: string): () => void {
  const { handler } = findEventHandler(screen.getByTestId(id), 'press', { bubbles: true });
  if (!handler) throw new Error(`No enabled press handler: ${id}`);
  return () => handler();
}
afterEach(() => {
  jest.restoreAllMocks();
  setStorageForTesting(null);
});

// F7: pick still compares against render-time theme.mode inside the functional updater.
it.each([
  ['light', 'dark', 'sky'],
  ['dark', 'light', 'deep-blue'],
] as const)('F7: a quick %s -> %s mode change then preset %s actually shows that preset', async (initial, next, preset) => {
  const storage = setup();
  storage.set(appearanceKey, { preset: ID, mode: initial });
  await renderMe(customise, { storage });
  const mode = pressHandler(`customise-mode-${next}`);
  const pick = pressHandler(`customise-preset-${preset}`);
  await act(() => { mode(); pick(); });
  expect(storage.get(appearanceKey)).toEqual({ preset, mode: initial });
  expect(screen.getByTestId(`customise-preset-${preset}`).props.accessibilityState.selected).toBe(true);
});

// F8: parallel writes read the latest size but never recheck the latest main translation.
it('F8: a parallel option cannot become identical to a main translation changed before the press', async () => {
  const storage = setup();
  storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'BSB' });
  await renderMe(<MeScreen onNavigate={() => {}} />, { storage });
  await fireEvent.press(screen.getByTestId('me-row-parallel'));
  const web = pressHandler('me-parallel-WEB');
  await act(() => {
    storage.set(readerPositionKey, { bookNumber: 50, chapter: 2, translation: 'WEB' });
    web();
  });
  expect(storage.get(readingSettingsKey).parallel).not.toBe(storage.get(readerPositionKey)?.translation);
});

// F9: resetting one token can fail contrast against another edit; reset currently drops the error.
it('F9: a refused token reset writes nothing and explains the contrast refusal', async () => {
  const storage = setup();
  const whiteCta = accepted(setTokenEdit(NO_CUSTOM, ID, 'cta', '#FFFFFF'));
  const custom = accepted(setTokenEdit(whiteCta, ID, 'onCta', '#707070'));
  expect(setTokenEdit(custom, ID, 'cta', null)).toMatchObject({ ok: false, reason: 'contrast' });
  storage.set(appearanceCustomKey, custom);
  await renderMe(<AdvancedScreen onBack={() => {}} />, { storage });
  await fireEvent.changeText(screen.getByTestId('advanced-input-cta'), '#707070');
  await fireEvent.press(screen.getByTestId('advanced-apply-cta'));
  expect(screen.queryByTestId('advanced-error-cta')).toHaveTextContent(/Too hard to read/);
  const write = jest.spyOn(storage, 'set');
  await fireEvent.press(screen.getByTestId('advanced-reset-cta'));
  expect(write).not.toHaveBeenCalled();
  expect(storage.get(appearanceCustomKey)).toEqual(custom);
  expect(screen.queryByTestId('advanced-error-cta')).toHaveTextContent(/Too hard to read/);
});

it.each(['invalid', 'contrast'] as const)('control: refused %s Apply/submit writes nothing and still shows its error', async (reason) => {
  const storage = setup();
  await renderMe(<AdvancedScreen onBack={() => {}} />, { storage });
  await fireEvent.changeText(screen.getByTestId('advanced-input-text'), reason === 'invalid' ? 'invalid' : '#FFF0F3');
  const write = jest.spyOn(storage, 'set');
  if (reason === 'invalid') await fireEvent.press(screen.getByTestId('advanced-apply-text'));
  else await fireEvent(screen.getByTestId('advanced-input-text'), 'submitEditing');
  expect(write).not.toHaveBeenCalled();
  expect(screen.getByTestId('advanced-error-text')).toBeTruthy();
});

it.each(['language', 'parallel', 'translation'] as const)('control: %s sheet writes only once on two queued choices and works when reopened', async (sheet) => {
  const storage = setup();
  storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'BSB' });
  const recent = { bookNumber: 1, chapter: 2, translation: 'ASV' as const };
  storage.set(recentPassagesKey, [recent]);
  await renderMe(<MeScreen onNavigate={() => {}} />, { storage });
  const row = `me-row-${sheet}`;
  const firstId = sheet === 'language' ? 'me-language-en' : sheet === 'parallel' ? 'me-parallel-WEB' : 'version-WEB';
  const secondId = sheet === 'language' ? 'me-language-zh-Hans' : sheet === 'parallel' ? 'me-parallel-ASV' : 'version-ASV';
  await fireEvent.press(screen.getByTestId(row));
  const first = pressHandler(firstId);
  const second = pressHandler(secondId);
  const write = jest.spyOn(storage, 'set');
  await act(() => { first(); second(); });
  const key = sheet === 'language' ? languageKey.key : sheet === 'parallel' ? readingSettingsKey.key : readerPositionKey.key;
  expect(write.mock.calls.filter(([k]) => k.key === key)).toHaveLength(1);
  if (sheet === 'translation') {
    expect(storage.get(recentPassagesKey)).toEqual([{ bookNumber: 43, chapter: 3, translation: 'WEB' }, recent]);
  }
  await fireEvent.press(screen.getByTestId(row));
  await fireEvent.press(screen.getByTestId(secondId));
  expect(write.mock.calls.filter(([k]) => k.key === key)).toHaveLength(2);
});

it('control: null functional updaters cause zero writes', async () => {
  const storage = setup();
  let appearance: ReturnType<typeof useAppearance> | undefined;
  function Probe() {
    appearance = useAppearance();
    return null;
  }
  await renderMe(<Probe />, { storage });
  const write = jest.spyOn(storage, 'set');
  await act(() => {
    appearance!.updateChoice(() => null);
    appearance!.updateCustom(() => null);
  });
  expect(write).not.toHaveBeenCalled();
});
