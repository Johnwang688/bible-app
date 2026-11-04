import { act, renderHook } from '@testing-library/react-native';
import type { ComponentRef } from 'react';
import type { NativeScrollEvent, NativeSyntheticEvent, ScrollView } from 'react-native';

import { useVerseScroller } from '../../reader/components/scrollToVerse';
import { useCollapsingHeader } from '../../reader/components/useCollapsingHeader';

const event = (y: number) => ({ nativeEvent: { contentOffset: { y }, contentSize: { height: 3000 }, layoutMeasurement: { height: 800 } } }) as NativeSyntheticEvent<NativeScrollEvent>;

it('syncs follow scroll positions without collapsing or revealing the header', async () => {
  const hook = await renderHook(() => useCollapsingHeader(52));
  await act(async () => hook.result.current.syncScroll(event(400)));
  expect(hook.result.current.hidden).toBe(false);
  await act(async () => hook.result.current.onScroll(event(425)));
  expect(hook.result.current.hidden).toBe(true);
  await act(async () => hook.result.current.syncScroll(event(50)));
  expect(hook.result.current.hidden).toBe(true);
  await act(async () => hook.result.current.onScroll(event(40)));
  expect(hook.result.current.hidden).toBe(false);
});

it('uses cached native rows to find a visible number and animates only when requested', async () => {
  const scrollTo = jest.fn();
  const scrollRef = { current: { scrollTo } as unknown as ComponentRef<typeof ScrollView> };
  const verses = [{ verse: 1, text: 'First' }, { verse: 2, text: 'Second' }, { verse: 3, text: 'Third' }];
  const hook = await renderHook(() => useVerseScroller({ scrollRef, toolsRefs: { current: new Map() }, viewportHeight: 800, headerBottom: 52, shownKey: 'chapter', layout: 'rows' }));
  await act(async () => {
    hook.result.current.onLayout({ key: 'chapter', kind: 'root', y: 70 });
    hook.result.current.onLayout({ key: 'chapter', kind: 'row', verse: 1, y: 0 });
    hook.result.current.onLayout({ key: 'chapter', kind: 'row', verse: 2, y: 200 });
    hook.result.current.onLayout({ key: 'chapter', kind: 'row', verse: 3, y: 500 });
  });
  expect(hook.result.current.firstVisibleVerse('chapter', verses, 200, 52)).toBe(2);
  expect(hook.result.current.firstVisibleVerse('chapter', verses, 220, 52)).toBe(3);
  await act(async () => hook.result.current.scrollToVerse('chapter', 3, verses));
  expect(scrollTo).toHaveBeenLastCalledWith({ y: 370, animated: false });
  await act(async () => hook.result.current.scrollToVerse('chapter', 2, verses, { animated: true }));
  expect(scrollTo).toHaveBeenLastCalledWith({ y: 70, animated: true });
});
