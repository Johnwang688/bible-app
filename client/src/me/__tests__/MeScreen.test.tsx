// Acceptance (orchestrator-owned): the Me screen (R-6a). Plan: "Me: account and settings";
// design: Me.dc.html (groups Appearance, Language, Reading, More). The account card is R-6b; the
// read-aloud voice is R-7; the daily goal follows R-3's progress model.
import { act, fireEvent, screen, within } from '@testing-library/react-native';

import { appearanceCustomKey } from '../../storage/appearanceCustomKey';
import { appearanceKey, languageKey, readerPositionKey, readingSettingsKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { MeScreen } from '../MeScreen';
import type { MeRoute } from '../routes';
import { renderMe, ZH } from './meHarness';

const ROWS = [
  'me-row-look',
  'me-row-mode',
  'me-row-font',
  'me-row-textSize',
  'me-row-language',
  'me-row-translation',
  'me-row-parallel',
  'me-row-goal',
  'me-row-sources',
  'me-row-about',
  'me-row-help',
  // Send feedback (John approved design/proposed/feedback.html 11-03): the last row of More.
  'me-row-feedback',
];

async function renderMeScreen(opts: Parameters<typeof renderMe>[1] = {}) {
  const routes: MeRoute[] = [];
  const out = await renderMe(<MeScreen onNavigate={(r) => routes.push(r)} />, opts);
  return { ...out, routes };
}

const value = (row: string) => screen.getByTestId(`${row}-value`);

describe('Me', () => {
  it('shows the four groups and every row, in the design order', async () => {
    await renderMeScreen();
    expect(screen.getByTestId('screen-me')).toBeTruthy();
    expect(screen.getByText('Me')).toBeTruthy();
    for (const g of ['Appearance', 'Language', 'Reading', 'More']) expect(screen.getByText(g)).toBeTruthy();
    const ids = screen.queryAllByTestId(/^me-row-[a-zA-Z]+$/).map((n) => n.props.testID as string);
    expect(ids).toEqual(ROWS);
    for (const id of ROWS) expect(screen.getByTestId(id).props.accessibilityRole).toBe('button');
  });

  it('shows the current values', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset: 'grape-soda', mode: 'dark' });
    storage.set(appearanceCustomKey, { scriptureFont: 'SourceSerif4', edits: {} });
    storage.set(readingSettingsKey, { textSize: 3, parallel: 'ASV' });
    storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await renderMeScreen({ storage });
    expect(value('me-row-look')).toHaveTextContent('Grape soda');
    expect(value('me-row-mode')).toHaveTextContent('Dark');
    expect(value('me-row-font')).toHaveTextContent('Source Serif');
    expect(value('me-row-textSize')).toHaveTextContent('22');
    expect(value('me-row-language')).toHaveTextContent('Follow the phone');
    expect(value('me-row-translation')).toHaveTextContent('WEB');
    expect(value('me-row-parallel')).toHaveTextContent('ASV');
    // Rows read as "label: value" to a screen reader.
    expect(screen.getByTestId('me-row-look').props.accessibilityLabel).toBe('Look: Grape soda');
  });

  it('defaults: the skipped-picker look, the preset font, size 20, parallel off', async () => {
    await renderMeScreen();
    expect(value('me-row-look')).toHaveTextContent('Silver');
    expect(value('me-row-mode')).toHaveTextContent('Follow the phone');
    // Silver (glass) reads in Source Serif.
    expect(value('me-row-font')).toHaveTextContent('Source Serif');
    expect(value('me-row-textSize')).toHaveTextContent('20');
    expect(value('me-row-parallel')).toHaveTextContent('Off');
  });

  it('the Appearance rows open Customise; the More rows open their screens', async () => {
    const { routes } = await renderMeScreen();
    for (const id of ['me-row-look', 'me-row-mode', 'me-row-font', 'me-row-textSize']) await act(async () => fireEvent.press(screen.getByTestId(id)));
    await act(async () => fireEvent.press(screen.getByTestId('me-row-sources')));
    await act(async () => fireEvent.press(screen.getByTestId('me-row-about')));
    await act(async () => fireEvent.press(screen.getByTestId('me-row-help')));
    expect(routes).toEqual(['customise', 'customise', 'customise', 'customise', 'sources', 'about', 'help']);
  });

  it('changes the app language at once, and stores it', async () => {
    const { storage } = await renderMeScreen();
    await act(async () => fireEvent.press(screen.getByTestId('me-row-language')));
    const sheet = await screen.findByTestId('me-language-sheet');
    for (const id of ['system', 'en', 'zh-Hans']) expect(within(sheet).getByTestId(`me-language-${id}`).props.accessibilityRole).toBe('radio');
    expect(within(sheet).getByTestId('me-language-system').props.accessibilityState).toMatchObject({ selected: true });
    await act(async () => fireEvent.press(within(sheet).getByTestId('me-language-zh-Hans')));
    expect(storage.get(languageKey)).toBe('zh-Hans');
    expect(screen.queryByTestId('me-language-sheet')).toBeNull();
    expect(screen.getByText('我的')).toBeTruthy();
    expect(screen.getByText('外观')).toBeTruthy();
  });

  it('sets the translation through the version picker', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'BSB' });
    await renderMeScreen({ storage });
    await act(async () => fireEvent.press(screen.getByTestId('me-row-translation')));
    await screen.findByTestId('version-picker');
    await act(async () => fireEvent.press(screen.getByTestId('version-WEB')));
    // The reader keeps its place and switches translation.
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 43, chapter: 3, translation: 'WEB' });
    expect(value('me-row-translation')).toHaveTextContent('WEB');
    expect(screen.queryByTestId('version-picker')).toBeNull();
  });

  it('sets the translation before anything has been read', async () => {
    const { storage } = await renderMeScreen();
    await act(async () => fireEvent.press(screen.getByTestId('me-row-translation')));
    await act(async () => fireEvent.press(await screen.findByTestId('version-ASV')));
    expect(storage.get(readerPositionKey)).toMatchObject({ bookNumber: 1, chapter: 1, translation: 'ASV' });
  });

  it('turns parallel reading on and off, never offering the main translation', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'BSB' });
    await renderMeScreen({ storage });
    await act(async () => fireEvent.press(screen.getByTestId('me-row-parallel')));
    const sheet = await screen.findByTestId('me-parallel-sheet');
    expect(within(sheet).queryByTestId('me-parallel-BSB')).toBeNull();
    expect(within(sheet).getByTestId('me-parallel-off').props.accessibilityState).toMatchObject({ selected: true });
    await act(async () => fireEvent.press(within(sheet).getByTestId('me-parallel-CUV-SIMP')));
    expect(storage.get(readingSettingsKey).parallel).toBe('CUV-SIMP');
    expect(value('me-row-parallel')).toHaveTextContent('CUV');

    await act(async () => fireEvent.press(screen.getByTestId('me-row-parallel')));
    await act(async () => fireEvent.press(await screen.findByTestId('me-parallel-off')));
    expect(storage.get(readingSettingsKey).parallel).toBeNull();
    expect(value('me-row-parallel')).toHaveTextContent('Off');
  });

  it('choosing the parallel translation as the main one turns parallel reading off', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'BSB' });
    storage.set(readingSettingsKey, { textSize: 2, parallel: 'WEB' });
    await renderMeScreen({ storage });
    await act(async () => fireEvent.press(screen.getByTestId('me-row-translation')));
    await act(async () => fireEvent.press(await screen.findByTestId('version-WEB')));
    expect(storage.get(readerPositionKey)?.translation).toBe('WEB');
    expect(storage.get(readingSettingsKey).parallel).toBeNull();
  });

  it('updates when a value changes elsewhere', async () => {
    const { storage } = await renderMeScreen();
    await act(async () => storage.set(appearanceKey, { preset: 'matcha-latte', mode: 'light' }));
    expect(value('me-row-look')).toHaveTextContent('Matcha latte');
    await act(async () => storage.set(readingSettingsKey, { textSize: 5, parallel: null }));
    expect(value('me-row-textSize')).toHaveTextContent('28');
  });

  it('in Chinese', async () => {
    await renderMeScreen({ locales: [ZH] });
    expect(screen.getByText('我的')).toBeTruthy();
    for (const g of ['外观', '语言', '阅读', '更多']) expect(screen.getByText(g)).toBeTruthy();
    expect(screen.getByText('应用语言')).toBeTruthy();
    expect(value('me-row-look')).toHaveTextContent('银色');
    expect(screen.getByTestId('me-row-look').props.accessibilityLabel).toBe('风格：银色');
  });
});
