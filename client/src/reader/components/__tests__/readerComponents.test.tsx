// R1-ui unit tests: the header's collapse thresholds and the book picker's filter.
import { act, renderHook } from '@testing-library/react-native';
import type { NativeScrollEvent, NativeSyntheticEvent } from 'react-native';

import type { BookInfo } from '../../../api/schemas';
import { bookMatches } from '../BookPicker';
import { useCollapsingHeader } from '../useCollapsingHeader';

const scrollTo = (y: number) =>
  ({
    nativeEvent: {
      contentOffset: { x: 0, y },
      contentSize: { width: 390, height: 5000 },
      layoutMeasurement: { width: 390, height: 800 },
    },
  }) as NativeSyntheticEvent<NativeScrollEvent>;

describe('useCollapsingHeader', () => {
  async function scrollThrough(ys: number[]) {
    const view = await renderHook(() => useCollapsingHeader(100));
    const seen: boolean[] = [];
    for (const y of ys) {
      await act(async () => view.result.current.onScroll(scrollTo(y)));
      seen.push(view.result.current.hidden);
    }
    return { seen, view };
  }

  it('hides after scrolling down more than 24 px', async () => {
    const { seen } = await scrollThrough([10, 24, 25, 60]);
    expect(seen).toEqual([false, false, true, true]);
  });

  it('comes back on an upward scroll of more than 8 px', async () => {
    const { seen } = await scrollThrough([0, 100, 150, 145, 141, 150, 200, 190, 180]);
    // 150→141 is 9 px up from the turning point: shown. Down again to 200 hides it; 200→190 is 10 px: shown.
    expect(seen).toEqual([false, true, true, true, false, false, true, false, false]);
  });

  it('shows again at the top and when the pill is pressed', async () => {
    const { seen, view } = await scrollThrough([100, 200, 0]);
    expect(seen).toEqual([true, true, false]);
    await act(async () => view.result.current.onScroll(scrollTo(300)));
    expect(view.result.current.hidden).toBe(true);
    await act(async () => view.result.current.show());
    expect(view.result.current.hidden).toBe(false);
  });
});

describe('bookMatches', () => {
  const book = (name: string, zh: string): BookInfo => ({
    book_number: 62,
    name,
    name_zh: null,
    name_zh_simplified: zh,
    testament: 'NT',
    total_chapters: 5,
  });

  it('matches the start of any word, case-insensitively', () => {
    const song = book('Song of Solomon', '雅歌');
    expect(bookMatches(song, 'sol', 'en')).toBe(true);
    expect(bookMatches(song, 'SONG OF', 'en')).toBe(true);
    expect(bookMatches(song, 'olomon', 'en')).toBe(false);
  });

  it('matches the interface-language name', () => {
    const john = book('1 John', '约翰一书');
    expect(bookMatches(john, '约翰', 'zh-Hans')).toBe(true);
    expect(bookMatches(john, '约翰', 'en')).toBe(false);
    expect(bookMatches(john, '1 jo', 'en')).toBe(true);
  });
});
