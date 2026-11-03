// R-6a review: real storage/provider integration, with writes in the render-to-press window.
import { act, fireEvent, screen } from '@testing-library/react-native';
import { findEventHandler } from '@testing-library/react-native/dist/events/propagation';

import { appearanceCustomKey } from '../../storage/appearanceCustomKey';
import { appearanceKey, languageKey, readerPositionKey, readingSettingsKey } from '../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting } from '../../storage/storage';
import { ACCENT_CHOICES, NO_CUSTOM, setAccent, setTokenEdit, type EditResult } from '../../theme/custom';
import { getTheme, PRESETS } from '../../theme/presets';
import { AdvancedScreen } from '../AdvancedScreen';
import { CustomiseScreen } from '../CustomiseScreen';
import { MeScreen } from '../MeScreen';
import { renderMe } from './meHarness';

const ID = 'strawberry-milk';
const BLUE = ACCENT_CHOICES[0].color;
function accepted(result: EditResult) {
  if (!result.ok) throw new Error(`Invalid test setup: ${JSON.stringify(result)}`);
  return result.custom;
}
function setup() {
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset: ID, mode: 'light' });
  setStorageForTesting(storage);
  return storage;
}
const customise = <CustomiseScreen onBack={() => {}} onAdvanced={() => {}} />;
// Resolve exactly the handler fireEvent uses, then deliver both events inside one batch.
// Calling the async fireEvent twice without awaiting would produce overlapping act scopes.
const pressHandler = (id: string): (() => void) => {
  const { handler } = findEventHandler(screen.getByTestId(id), 'press', { bubbles: true });
  if (!handler) throw new Error(`No enabled press handler: ${id}`);
  return () => handler();
};
afterEach(() => setStorageForTesting(null));

it('F2: two quick accent/font presses preserve both changes', async () => {
  const storage = setup();
  await renderMe(customise, { storage });
  const accent = pressHandler('customise-accent-blue');
  const font = pressHandler('customise-font-SourceSerif4');
  await act(() => { accent(); font(); });
  expect(storage.get(appearanceCustomKey)).toEqual({
    ...accepted(setAccent(NO_CUSTOM, ID, BLUE)), scriptureFont: 'SourceSerif4',
  });
});

it('F2: preset reset preserves a different preset edit written between render and press', async () => {
  const storage = setup();
  const initial = accepted(setTokenEdit(NO_CUSTOM, ID, 'text', '#2A2A2A'));
  storage.set(appearanceCustomKey, initial);
  await renderMe(customise, { storage });
  const reset = pressHandler('customise-reset');
  const newer = accepted(setTokenEdit(initial, 'silver', 'text', '#000000'));
  await act(() => { storage.set(appearanceCustomKey, newer); reset(); });
  expect(storage.get(appearanceCustomKey).edits).toEqual({ silver: { text: '#000000' } });
});

it('F2: two quick Advanced applies preserve both token edits', async () => {
  const storage = setup();
  await renderMe(<AdvancedScreen onBack={() => {}} />, { storage });
  await fireEvent.changeText(screen.getByTestId('advanced-input-text'), '#2A2A2A');
  await fireEvent.changeText(screen.getByTestId('advanced-input-muted'), '#333333');
  const text = pressHandler('advanced-apply-text');
  const muted = pressHandler('advanced-apply-muted');
  await act(() => { text(); muted(); });
  expect(storage.get(appearanceCustomKey).edits[ID]).toEqual({ text: '#2A2A2A', muted: '#333333' });
});

it('F3: a quick preset then mode press keeps the newly chosen preset', async () => {
  const storage = setup();
  await renderMe(customise, { storage });
  const preset = pressHandler('customise-preset-sky');
  const dark = pressHandler('customise-mode-dark');
  await act(() => { preset(); dark(); });
  expect(storage.get(appearanceKey)).toEqual({ preset: 'sky', mode: 'dark' });
});

it('F4: two quick size increases each advance one step', async () => {
  const storage = setup();
  storage.set(readingSettingsKey, { textSize: 2, parallel: 'ASV' });
  await renderMe(customise, { storage });
  const larger = pressHandler('customise-size-larger');
  await act(() => { larger(); larger(); });
  expect(storage.get(readingSettingsKey)).toEqual({ textSize: 4, parallel: 'ASV' });
});

it('F4: size change keeps parallel settings written between render and press', async () => {
  const storage = setup();
  storage.set(readingSettingsKey, { textSize: 2, parallel: null });
  await renderMe(customise, { storage });
  const larger = pressHandler('customise-size-larger');
  await act(() => { storage.set(readingSettingsKey, { textSize: 2, parallel: 'ASV' }); larger(); });
  expect(storage.get(readingSettingsKey)).toEqual({ textSize: 3, parallel: 'ASV' });
});

it('F5: translation change preserves the latest reader position and clears the latest parallel', async () => {
  const storage = setup();
  storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'BSB' });
  await renderMe(<MeScreen onNavigate={() => {}} />, { storage });
  await fireEvent.press(screen.getByTestId('me-row-translation'));
  const web = pressHandler('version-WEB');
  await act(() => {
    storage.set(readerPositionKey, { bookNumber: 50, chapter: 2, translation: 'BSB' });
    storage.set(readingSettingsKey, { textSize: 4, parallel: 'WEB' });
    web();
  });
  expect({ position: storage.get(readerPositionKey), settings: storage.get(readingSettingsKey) }).toEqual({
    position: { bookNumber: 50, chapter: 2, translation: 'WEB' }, settings: { textSize: 4, parallel: null },
  });
});

it('F5: parallel choice preserves the latest text size', async () => {
  const storage = setup();
  storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'BSB' });
  await renderMe(<MeScreen onNavigate={() => {}} />, { storage });
  await fireEvent.press(screen.getByTestId('me-row-parallel'));
  const web = pressHandler('me-parallel-WEB');
  await act(() => { storage.set(readingSettingsKey, { textSize: 5, parallel: null }); web(); });
  expect(storage.get(readingSettingsKey)).toEqual({ textSize: 5, parallel: 'WEB' });
});

// Controls: these rule out ordinary preset resolution and language switching as the failures above.
it.each(PRESETS.map((p) => [p.id, p.mode, p.pair] as const))(
  'control: %s shows when selected and survives a completed mode switch', async (id, mode, pair) => {
    const storage = setup();
    await renderMe(customise, { storage });
    await fireEvent.press(screen.getByTestId(`customise-preset-${id}`));
    expect(screen.getByTestId(`customise-preset-${id}`).props.accessibilityState.selected).toBe(true);
    const opposite = mode === 'light' ? 'dark' : 'light';
    await fireEvent.press(screen.getByTestId(`customise-mode-${opposite}`));
    expect(storage.get(appearanceKey)).toEqual({ preset: id, mode: opposite });
    expect(screen.getByTestId(`customise-preset-${pair ?? id}`).props.accessibilityState.selected).toBe(true);
    expect(getTheme(id).mode).toBe(mode);
  },
);

it('control: language changes immediately and the parallel sheet excludes the main translation', async () => {
  const storage = setup();
  storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'BSB' });
  await renderMe(<MeScreen onNavigate={() => {}} />, { storage });
  await fireEvent.press(screen.getByTestId('me-row-language'));
  await fireEvent.press(screen.getByTestId('me-language-zh-Hans'));
  expect(storage.get(languageKey)).toBe('zh-Hans');
  expect(screen.getByTestId('me-row-language-value')).toHaveTextContent('简体中文');
  await fireEvent.press(screen.getByTestId('me-row-parallel'));
  expect(screen.queryByTestId('me-parallel-BSB')).toBeNull();
});
