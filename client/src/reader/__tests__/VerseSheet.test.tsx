// Acceptance (orchestrator-owned): the R-2 verse sheet, Original words and the word card (HG-3a
// behaviours ported), 44 pt targets and the screen-reader pass.
import { fireEvent, screen, waitFor, within } from '@testing-library/react-native';
import * as Clipboard from 'expo-clipboard';
import { Platform, Share, StyleSheet } from 'react-native';

import { readerPositionKey, readingSettingsKey, studyItemsKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { HIGHLIGHTS } from '../../theme/highlights';
import { renderReader, ZH } from './readerHarness';

jest.mock('expo-clipboard', () => ({ setStringAsync: jest.fn(async () => true) }));

const JOHN3_WEB = { bookNumber: 43, chapter: 3, translation: 'WEB' } as const;
const style = (el: { props: { style?: unknown } }) => StyleSheet.flatten(el.props.style as never) ?? {};

async function openSheetOn(verse: number) {
  await screen.findByText(/For God so loved the world/);
  await fireEvent.press(screen.getByTestId(`verse-${verse}`));
  return screen.findByTestId('verse-sheet');
}

describe('verse sheet', () => {
  it('opens on a verse tap with the reference, and closes', async () => {
    await renderReader({ position: JOHN3_WEB });
    const sheet = await openSheetOn(16);
    expect(within(sheet).getByText('John 3:16')).toBeTruthy();
    await fireEvent.press(within(sheet).getByTestId('sheet-close'));
    await waitFor(() => expect(screen.queryByTestId('verse-sheet')).toBeNull());
  });

  it('highlights in a colour, shows the wash behind the verse, and a second tap removes it', async () => {
    const { storage } = await renderReader({ position: JOHN3_WEB });
    const sheet = await openSheetOn(16);
    const yellow = within(sheet).getByTestId('sheet-swatch-yellow');
    expect(yellow.props.accessibilityLabel).toBe('Highlight Yellow');
    await fireEvent.press(yellow);
    expect(storage.get(studyItemsKey).highlights['43:3:16']).toBe('yellow');
    expect(within(sheet).getByTestId('sheet-swatch-yellow').props.accessibilityState?.selected).toBe(true);
    expect(style(screen.getByTestId('verse-16')).backgroundColor).toBe(HIGHLIGHTS.yellow.wash.light);
    await fireEvent.press(within(sheet).getByTestId('sheet-swatch-yellow'));
    expect(storage.get(studyItemsKey).highlights['43:3:16']).toBeUndefined();
  });

  it('toggles a bookmark', async () => {
    const { storage } = await renderReader({ position: JOHN3_WEB });
    const sheet = await openSheetOn(16);
    await fireEvent.press(within(sheet).getByTestId('sheet-bookmark'));
    expect(storage.get(studyItemsKey).bookmarks['43:3:16']).toBeDefined();
    expect(within(sheet).getByTestId('sheet-bookmark').props.accessibilityLabel).toBe('Remove bookmark');
    await fireEvent.press(within(sheet).getByTestId('sheet-bookmark'));
    expect(storage.get(studyItemsKey).bookmarks['43:3:16']).toBeUndefined();
  });

  it('writes, edits and deletes a note', async () => {
    const { storage } = await renderReader({ position: JOHN3_WEB });
    let sheet = await openSheetOn(16);
    await fireEvent.press(within(sheet).getByTestId('sheet-note'));
    await fireEvent.changeText(await screen.findByTestId('note-input'), 'He gave');
    await fireEvent.press(screen.getByTestId('note-save'));
    expect(storage.get(studyItemsKey).notes['43:3:16']?.text).toBe('He gave');
    sheet = await screen.findByTestId('verse-sheet');
    expect(within(sheet).getByTestId('sheet-note').props.accessibilityLabel).toBe('Edit note');
    await fireEvent.press(within(sheet).getByTestId('sheet-note'));
    expect((await screen.findByTestId('note-input')).props.value).toBe('He gave');
    await fireEvent.press(screen.getByTestId('note-delete'));
    expect(storage.get(studyItemsKey).notes['43:3:16']).toBeUndefined();
  });

  it('copies and shares the verse with its reference and translation', async () => {
    const share = jest.spyOn(Share, 'share').mockResolvedValue({ action: 'sharedAction' } as never);
    await renderReader({ position: JOHN3_WEB });
    const sheet = await openSheetOn(16);
    await fireEvent.press(within(sheet).getByTestId('sheet-copy'));
    expect(Clipboard.setStringAsync).toHaveBeenCalledWith(expect.stringMatching(/^For God so loved the world[\s\S]*\n— John 3:16 \(WEB\)$/));
    await fireEvent.press(within(sheet).getByTestId('sheet-share'));
    expect(share).toHaveBeenCalledWith(expect.objectContaining({ message: expect.stringContaining('— John 3:16 (WEB)') }));
    share.mockRestore();
  });

  it('extends the selection to a range with a long press, and acts on every verse', async () => {
    const { storage } = await renderReader({ position: JOHN3_WEB });
    await openSheetOn(16);
    await fireEvent(screen.getByTestId('verse-18'), 'longPress');
    const sheet = await screen.findByTestId('verse-sheet');
    expect(within(sheet).getByText('John 3:16–18')).toBeTruthy();
    await fireEvent.press(within(sheet).getByTestId('sheet-swatch-green'));
    const hl = storage.get(studyItemsKey).highlights;
    expect([hl['43:3:16'], hl['43:3:17'], hl['43:3:18']]).toEqual(['green', 'green', 'green']);
  });

  it('tapping a second verse while the sheet is open extends the selection (plan: Bible: the reader)', async () => {
    await renderReader({ position: JOHN3_WEB });
    await openSheetOn(16);
    await fireEvent.press(screen.getByTestId('verse-18'));
    expect(within(await screen.findByTestId('verse-sheet')).getByText('John 3:16–18')).toBeTruthy();
  });

  it('opens a commentary placeholder (the commentary sheet itself is R-5)', async () => {
    await renderReader({ position: JOHN3_WEB });
    const sheet = await openSheetOn(16);
    await fireEvent.press(within(sheet).getByTestId('sheet-commentary'));
    expect(await screen.findByTestId('commentary-placeholder')).toBeTruthy();
  });

  it('shows a highlight on both sides in parallel reading (items attach to the reference)', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(readingSettingsKey, { textSize: 2, parallel: 'CUV-SIMP' });
    storage.set(studyItemsKey, { highlights: { '43:3:16': 'blue' }, notes: {}, bookmarks: {} });
    await renderReader({ storage, position: JOHN3_WEB });
    const row = await screen.findByTestId('verse-row-16');
    // The wash sits on the row, or on both translations' text.
    const first = style(within(row).getByTestId('verse-16')).backgroundColor;
    const second = style(within(row).getByTestId('verse-16-second')).backgroundColor;
    const wash = HIGHLIGHTS.blue.wash.light;
    expect(style(row).backgroundColor === wash || (first === wash && second === wash)).toBe(true);
  });
});

describe('Original words (HG-3a behaviours)', () => {
  it('lists English phrases beside the Greek, with the language and the BSB note', async () => {
    await renderReader({ position: JOHN3_WEB });
    const sheet = await openSheetOn(16);
    await fireEvent.press(within(sheet).getByTestId('sheet-original-words'));
    const list = await screen.findByTestId('words-list');
    expect(within(list).getByRole('header', { name: 'Original words' })).toBeTruthy();
    expect(within(list).getByText(/Greek/)).toBeTruthy();
    expect(within(list).getByText('Word alignment from the Berean Standard Bible (BSB)')).toBeTruthy();
    expect(within(list).getByText('For')).toBeTruthy();
    expect(within(list).getAllByText('not translated').length).toBeGreaterThan(0);
    expect(within(list).getByText('translated elsewhere in this verse')).toBeTruthy();
  });

  it('opens the word card with meaning, grammar behind More, usage, references and credit', async () => {
    await renderReader({ position: JOHN3_WEB });
    const sheet = await openSheetOn(16);
    await fireEvent.press(within(sheet).getByTestId('sheet-original-words'));
    await screen.findByTestId('words-list');
    const loved = screen.getAllByTestId(/^word-row-/).find((el) => within(el).queryByText('loved'))!;
    await fireEvent.press(loved);
    const card = await screen.findByTestId('word-card');
    expect(within(card).getByRole('header')).toBeTruthy();
    expect(await within(card).findByText('Used 143 times in 110 verses')).toBeTruthy();
    expect(within(card).queryByTestId('word-parsing')).toBeNull();
    await fireEvent.press(within(card).getByTestId('word-more'));
    expect(within(card).getByTestId('word-parsing')).toBeTruthy();
    await fireEvent.press(within(card).getByTestId('word-full-definition'));
    expect(within(card).getByTestId('word-definition')).toBeTruthy();
    expect(within(card).getByText(/STEP Bible brief lexicon/)).toBeTruthy();
    expect(within(card).getByText('Alignment: Berean Standard Bible')).toBeTruthy();
    await fireEvent.press(within(card).getByTestId('word-back'));
    expect(await screen.findByTestId('words-list')).toBeTruthy();
  });

  it('a reference on the card takes the reader there and closes the sheet', async () => {
    const { storage } = await renderReader({ position: JOHN3_WEB });
    const sheet = await openSheetOn(16);
    await fireEvent.press(within(sheet).getByTestId('sheet-original-words'));
    await screen.findByTestId('words-list');
    await fireEvent.press(screen.getAllByTestId(/^word-row-/).find((el) => within(el).queryByText('loved'))!);
    await fireEvent.press(await screen.findByTestId('word-ref-0'));
    await waitFor(() => expect(screen.queryByTestId('verse-sheet')).toBeNull());
    expect(storage.get(readerPositionKey)).toMatchObject({ bookNumber: 40, chapter: 5, translation: 'WEB' });
  });

  it('draws Hebrew right to left', async () => {
    await renderReader({ position: { bookNumber: 1, chapter: 1, translation: 'WEB' } });
    await screen.findByText(/In the beginning/);
    await fireEvent.press(screen.getByTestId('verse-1'));
    await fireEvent.press(within(await screen.findByTestId('verse-sheet')).getByTestId('sheet-original-words'));
    const list = await screen.findByTestId('words-list');
    const hebrew = within(list).getAllByTestId(/^word-original-/)[0]!;
    expect(style(hebrew).writingDirection).toBe('rtl');
    expect(within(list).getByText(/Hebrew/)).toBeTruthy();
  });

  it('explains a verse with no alignment', async () => {
    await renderReader({ position: JOHN3_WEB });
    const sheet = await openSheetOn(17);
    await fireEvent.press(within(sheet).getByTestId('sheet-original-words'));
    expect(await screen.findByText('No original-language words for this verse.')).toBeTruthy();
  });

  it('offers a retry after a failure, and the retry works', async () => {
    const failWords = new Set(['John 3:16']);
    await renderReader({ position: JOHN3_WEB, failWords });
    const sheet = await openSheetOn(16);
    await fireEvent.press(within(sheet).getByTestId('sheet-original-words'));
    expect(await screen.findByText('Couldn’t load the original words.')).toBeTruthy();
    failWords.clear();
    await fireEvent.press(screen.getByTestId('words-retry'));
    expect(await screen.findByTestId('words-list')).toBeTruthy();
  });

  it('leaving a verse discards its open card; another verse shows its own list (HG-3a F2)', async () => {
    await renderReader({ position: JOHN3_WEB });
    let sheet = await openSheetOn(16);
    await fireEvent.press(within(sheet).getByTestId('sheet-original-words'));
    await screen.findByTestId('words-list');
    await fireEvent.press(screen.getAllByTestId(/^word-row-/)[0]!);
    await screen.findByTestId('word-card');
    await fireEvent.press(screen.getByTestId('sheet-close'));
    await waitFor(() => expect(screen.queryByTestId('verse-sheet')).toBeNull());
    sheet = await openSheetOn(16);
    expect(within(sheet).queryByTestId('word-card')).toBeNull();
    expect(within(sheet).getByText('John 3:16')).toBeTruthy();
  });

  it('labels English-only glosses and definitions 英文 in Chinese', async () => {
    await renderReader({ position: JOHN3_WEB, locales: [ZH] });
    const sheet = await openSheetOn(16);
    await fireEvent.press(within(sheet).getByTestId('sheet-original-words'));
    await screen.findByTestId('words-list');
    expect(screen.getAllByText('英文').length).toBeGreaterThan(0);
    await fireEvent.press(screen.getAllByTestId(/^word-row-/).find((el) => within(el).queryByText('loved'))!);
    const card = await screen.findByTestId('word-card');
    expect(within(card).getAllByText('英文').length).toBeGreaterThan(0);
    expect(within(card).getByText('出现 143 次，共 110 节')).toBeTruthy();
  });
});

describe('screen-reader pass and targets', () => {
  it('reads the verse text as text, and gives each verse a labelled verse-tools button', async () => {
    await renderReader({ position: JOHN3_WEB });
    await screen.findByText(/For God so loved the world/);
    const text = screen.getByTestId('verse-16');
    expect(text.props.accessibilityRole).not.toBe('link');
    expect(text.props.accessibilityLabel).toBeUndefined();
    const tools = screen.getByTestId('verse-16-tools');
    expect(tools.props.accessibilityRole).toBe('button');
    expect(tools.props.accessibilityLabel).toBe('Verse 16: verse tools');
    await fireEvent.press(tools);
    expect(await screen.findByTestId('verse-sheet')).toBeTruthy();
    expect(screen.getByTestId('verse-16-tools').props.accessibilityState?.selected).toBe(true);
  });

  it('on the web, the verse text is never a link and the tools control is a button', async () => {
    const os = jest.replaceProperty(Platform, 'OS', 'web');
    try {
      await renderReader({ position: JOHN3_WEB });
      await screen.findByText(/For God so loved the world/);
      expect(screen.getByTestId('verse-16').props.accessibilityRole).not.toBe('link');
      expect(screen.getByTestId('verse-16').props.role).not.toBe('link');
      expect(screen.getByTestId('verse-16-tools').props.accessibilityRole).toBe('button');
    } finally {
      os.restore();
    }
  });

  it('every control in the verse sheet is labelled and at least 44 pt', async () => {
    await renderReader({ position: JOHN3_WEB });
    const sheet = await openSheetOn(16);
    const buttons = within(sheet).getAllByRole('button');
    expect(buttons.length).toBeGreaterThanOrEqual(12);
    for (const b of buttons) {
      const s = style(b);
      const label = b.props.accessibilityLabel ?? '';
      const hasText = within(b).queryAllByText(/\S/).length > 0;
      expect([b.props.testID, label.length > 0 || hasText]).toEqual([b.props.testID, true]);
      expect([b.props.testID, Math.max(s.height ?? 0, s.minHeight ?? 0) >= 44]).toEqual([b.props.testID, true]);
      // A fixed width, where one is set, is at least 44 too (flexible widths fill their row).
      if (typeof s.width === 'number') expect([b.props.testID, s.width >= 44]).toEqual([b.props.testID, true]);
    }
  });

  it('labels the sheet in Chinese', async () => {
    await renderReader({ position: JOHN3_WEB, locales: [ZH] });
    const sheet = await openSheetOn(16);
    expect(within(sheet).getByTestId('sheet-bookmark').props.accessibilityLabel).toBe('书签');
    expect(within(sheet).getByTestId('sheet-close').props.accessibilityLabel).toBe('关闭');
    expect(within(sheet).getByTestId('sheet-swatch-yellow').props.accessibilityLabel).toBe('标记为黄色');
  });
});
