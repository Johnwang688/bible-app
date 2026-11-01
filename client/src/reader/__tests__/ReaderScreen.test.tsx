// Acceptance (orchestrator-owned): the Bible tab reader, end to end in the component tree.
import { act, fireEvent, screen, waitFor, within } from '@testing-library/react-native';
import { Dimensions, StyleSheet } from 'react-native';

import { readerPositionKey, readingSettingsKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { swipeDirection } from '../components/useChapterSwipe';
import { renderReader, synthText, ZH } from './readerHarness';

const JOHN3_WEB = { bookNumber: 43, chapter: 3, translation: 'WEB' } as const;
const JOHN3_16_WEB = 'For God so loved the world';

const fontSizeOf = (el: { props: { style?: unknown } }) => StyleSheet.flatten(el.props.style as never)?.fontSize as number;

async function setWindow(width: number, height: number) {
  await act(async () => {
    Dimensions.set({
      window: { width, height, scale: 2, fontScale: 1 },
      screen: { width, height, scale: 2, fontScale: 1 },
    });
  });
}

beforeEach(async () => {
  await setWindow(390, 844);
});

describe('ReaderScreen', () => {
  it('opens at the saved position with the book and chapter in the header', async () => {
    await renderReader({ position: JOHN3_WEB });
    expect(await screen.findByText(new RegExp(JOHN3_16_WEB))).toBeTruthy();
    expect(within(screen.getByTestId('reader-book-button')).getByText('John 3')).toBeTruthy();
    expect(within(screen.getByTestId('reader-translation-button')).getByText('WEB')).toBeTruthy();
  });

  it('starts a new reader at Genesis 1 in BSB and saves the position once it moves', async () => {
    const { storage } = await renderReader();
    expect(await screen.findByText(synthText('Genesis', 1, 1, 'BSB'))).toBeTruthy();
    await fireEvent.press(screen.getByTestId('reader-next'));
    expect(await screen.findByText(synthText('Genesis', 2, 1, 'BSB'))).toBeTruthy();
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 1, chapter: 2, translation: 'BSB' });
  });

  it('persists the position across a restart', async () => {
    const storage = createStorage(memoryBackend());
    const first = await renderReader({ storage, position: { bookNumber: 43, chapter: 4, translation: 'BSB' } });
    await screen.findByText(synthText('John', 4, 1, 'BSB'));
    await fireEvent.press(screen.getByTestId('reader-next'));
    await screen.findByText(synthText('John', 5, 1, 'BSB'));
    await first.ui.unmount();
    await renderReader({ storage });
    expect(await screen.findByText(synthText('John', 5, 1, 'BSB'))).toBeTruthy();
  });

  it('turns a prefetched chapter instantly: no loading state, text there on the press', async () => {
    const { calls } = await renderReader({ position: { bookNumber: 43, chapter: 4, translation: 'BSB' } });
    await screen.findByText(synthText('John', 4, 1, 'BSB'));
    await waitFor(() => expect(calls).toEqual(expect.arrayContaining(['John 5 BSB', 'John 3 BSB'])));
    await act(async () => {}); // let the prefetches settle into the cache
    await fireEvent.press(screen.getByTestId('reader-next'));
    expect(screen.queryByTestId('reader-loading')).toBeNull();
    expect(screen.getByText(synthText('John', 5, 1, 'BSB'))).toBeTruthy();
  });

  it('goes back with the previous-chapter button and crosses book boundaries', async () => {
    await renderReader({ position: { bookNumber: 41, chapter: 1, translation: 'BSB' } });
    await screen.findByText(synthText('Mark', 1, 1, 'BSB'));
    await fireEvent.press(screen.getByTestId('reader-prev'));
    expect(await screen.findByText(synthText('Matthew', 28, 1, 'BSB'))).toBeTruthy();
    expect(within(screen.getByTestId('reader-book-button')).getByText('Matthew 28')).toBeTruthy();
  });

  it('has no previous button at Genesis 1 and no next button at Revelation 22', async () => {
    const first = await renderReader({ position: { bookNumber: 1, chapter: 1, translation: 'BSB' } });
    await screen.findByText(synthText('Genesis', 1, 1, 'BSB'));
    expect(screen.queryByTestId('reader-prev')).toBeNull();
    await first.ui.unmount();
    await renderReader({ position: { bookNumber: 66, chapter: 22, translation: 'BSB' } });
    await screen.findByText(synthText('Revelation', 22, 1, 'BSB'));
    expect(screen.queryByTestId('reader-next')).toBeNull();
  });

  it('chooses a book and chapter in the picker', async () => {
    await renderReader({ position: JOHN3_WEB });
    await screen.findByText(new RegExp(JOHN3_16_WEB));
    await fireEvent.press(screen.getByTestId('reader-book-button'));
    expect(await screen.findByTestId('book-picker')).toBeTruthy();
    await fireEvent.press(screen.getByTestId('picker-testament-OT'));
    await fireEvent.press(screen.getByTestId('picker-book-19'));
    await fireEvent.press(await screen.findByTestId('picker-chapter-23'));
    expect(await screen.findByText(synthText('Psalms', 23, 1, 'WEB'))).toBeTruthy();
    expect(screen.queryByTestId('book-picker')).toBeNull();
  });

  it('filters books in the picker and shows recent passages', async () => {
    await renderReader({ position: JOHN3_WEB });
    await screen.findByText(new RegExp(JOHN3_16_WEB));
    await fireEvent.press(screen.getByTestId('reader-next'));
    await screen.findByText(synthText('John', 4, 1, 'WEB'));
    await fireEvent.press(screen.getByTestId('reader-book-button'));
    await fireEvent.changeText(await screen.findByTestId('picker-filter'), 'rom');
    expect(screen.getByTestId('picker-book-45')).toBeTruthy();
    expect(screen.queryByTestId('picker-book-43')).toBeNull();
    await fireEvent.changeText(screen.getByTestId('picker-filter'), 'zzz');
    expect(screen.getByText('No book matches “zzz”')).toBeTruthy();
    expect(within(screen.getByTestId('picker-recent-0')).getByText('John 4')).toBeTruthy();
    await fireEvent.press(screen.getByTestId('picker-close'));
    await waitFor(() => expect(screen.queryByTestId('book-picker')).toBeNull());
  });

  it('switches translation in the version picker; book names follow the translation', async () => {
    await renderReader({ position: JOHN3_WEB });
    await screen.findByText(new RegExp(JOHN3_16_WEB));
    await fireEvent.press(screen.getByTestId('reader-translation-button'));
    expect(await screen.findByTestId('version-picker')).toBeTruthy();
    await fireEvent.press(screen.getByTestId('version-CUV-SIMP'));
    expect(await screen.findByText(/神爱世人/)).toBeTruthy();
    expect(within(screen.getByTestId('reader-book-button')).getByText('约翰福音 3')).toBeTruthy();
  });

  it('draws CUV alternate readings smaller than the verse text', async () => {
    await renderReader({ position: { bookNumber: 43, chapter: 3, translation: 'CUV-SIMP' } });
    const note = (await screen.findAllByText(/^〔或作/))[0]!;
    const verseText = screen.getByText(/神爱世人/);
    expect(fontSizeOf(note)).toBeLessThan(fontSizeOf(verseText));
  });

  it('marks a tapped verse as selected (the verse sheet itself is R-2)', async () => {
    await renderReader({ position: JOHN3_WEB });
    await screen.findByText(new RegExp(JOHN3_16_WEB));
    const v16 = screen.getByTestId('verse-16');
    expect(v16.props.accessibilityLabel).toBe('Verse 16');
    await fireEvent.press(v16);
    expect(screen.getByTestId('verse-16').props.accessibilityState?.selected).toBe(true);
  });

  it('shows an error with a retry that recovers', async () => {
    const fail = new Set(['John 9 BSB']);
    await renderReader({ position: { bookNumber: 43, chapter: 9, translation: 'BSB' }, fail });
    expect(await screen.findByTestId('reader-error')).toBeTruthy();
    fail.clear();
    await fireEvent.press(screen.getByTestId('reader-retry'));
    expect(await screen.findByText(synthText('John', 9, 1, 'BSB'))).toBeTruthy();
  });

  it('changes the text size from reading settings and remembers it', async () => {
    const { storage } = await renderReader({ position: { bookNumber: 43, chapter: 4, translation: 'BSB' } });
    const before = fontSizeOf(await screen.findByText(synthText('John', 4, 1, 'BSB')));
    await fireEvent.press(screen.getByTestId('reader-settings-button'));
    await fireEvent.press(await screen.findByTestId('settings-larger'));
    await fireEvent.press(screen.getByTestId('settings-done'));
    await waitFor(() => expect(fontSizeOf(screen.getByText(synthText('John', 4, 1, 'BSB')))).toBeGreaterThan(before));
    expect(storage.get(readingSettingsKey).textSize).toBe(3);
  });
});

describe('parallel reading', () => {
  it('interleaves the second translation under each verse on a phone', async () => {
    const { storage } = await renderReader({ position: { bookNumber: 43, chapter: 4, translation: 'BSB' } });
    await screen.findByText(synthText('John', 4, 1, 'BSB'));
    await fireEvent.press(screen.getByTestId('reader-settings-button'));
    await fireEvent.press(await screen.findByTestId('settings-parallel'));
    await fireEvent.press(screen.getByTestId('settings-second-CUV-SIMP'));
    await fireEvent.press(screen.getByTestId('settings-done'));
    const row = await screen.findByTestId('verse-row-2');
    expect(within(row).getByText(synthText('John', 4, 2, 'BSB'))).toBeTruthy();
    expect(within(row).getByText(synthText('John', 4, 2, 'CUV-SIMP'))).toBeTruthy();
    expect(storage.get(readingSettingsKey).parallel).toBe('CUV-SIMP');
    expect(within(screen.getByTestId('reader-translation-button')).getByText(/BSB.*和合本|BSB.*CUV/)).toBeTruthy();
  });

  it('keeps verses aligned when the second translation lacks one: an empty cell, nothing shifted', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(readingSettingsKey, { textSize: 2, parallel: 'CUV-SIMP' });
    await renderReader({ storage, position: { bookNumber: 43, chapter: 4, translation: 'BSB' }, omit: { 'John 4 CUV-SIMP': [2] } });
    const row2 = await screen.findByTestId('verse-row-2');
    expect(within(row2).getByText(synthText('John', 4, 2, 'BSB'))).toBeTruthy();
    expect(within(row2).getByTestId('verse-2-missing')).toBeTruthy();
    expect(within(row2).getByTestId('verse-2-missing').props.accessibilityLabel).toBe('CUV has no verse 2');
    const row3 = screen.getByTestId('verse-row-3');
    expect(within(row3).getByText(synthText('John', 4, 3, 'BSB'))).toBeTruthy();
    expect(within(row3).getByText(synthText('John', 4, 3, 'CUV-SIMP'))).toBeTruthy();
  });

  it('shows two aligned columns on a wide screen, with a swap button', async () => {
    await setWindow(1024, 768);
    const storage = createStorage(memoryBackend());
    storage.set(readingSettingsKey, { textSize: 2, parallel: 'CUV-SIMP' });
    await renderReader({ storage, position: { bookNumber: 43, chapter: 4, translation: 'BSB' } });
    expect(await screen.findByTestId('parallel-columns')).toBeTruthy();
    await fireEvent.press(screen.getByTestId('reader-swap'));
    await waitFor(() => expect(storage.get(readerPositionKey)?.translation).toBe('CUV-SIMP'));
    expect(storage.get(readingSettingsKey).parallel).toBe('BSB');
  });

  it('never offers the first translation as the second one', async () => {
    await renderReader({ position: { bookNumber: 43, chapter: 4, translation: 'BSB' } });
    await screen.findByText(synthText('John', 4, 1, 'BSB'));
    await fireEvent.press(screen.getByTestId('reader-settings-button'));
    await fireEvent.press(await screen.findByTestId('settings-parallel'));
    expect(screen.queryByTestId('settings-second-BSB')).toBeNull();
    expect(screen.getByTestId('settings-second-WEB')).toBeTruthy();
  });
});

describe('Chinese interface', () => {
  it('labels the reader and picker in Simplified Chinese, with Chinese book names in the picker', async () => {
    await renderReader({ position: JOHN3_WEB, locales: [ZH] });
    await screen.findByText(new RegExp(JOHN3_16_WEB));
    expect(within(screen.getByTestId('reader-book-button')).getByText('John 3')).toBeTruthy();
    expect(screen.getByTestId('reader-settings-button').props.accessibilityLabel).toBe('阅读设置');
    await fireEvent.press(screen.getByTestId('reader-book-button'));
    expect(await screen.findByText('选择经文')).toBeTruthy();
    expect(within(screen.getByTestId('picker-book-43')).getByText('约翰福音')).toBeTruthy();
  });
});

describe('swipeDirection', () => {
  it('turns on a clear horizontal swipe and ignores scrolls and small moves', () => {
    expect(swipeDirection(-90, 10)).toBe('next');
    expect(swipeDirection(90, -8)).toBe('prev');
    expect(swipeDirection(-30, 0)).toBeNull();
    expect(swipeDirection(-90, 80)).toBeNull();
    expect(swipeDirection(0, -200)).toBeNull();
  });
});
