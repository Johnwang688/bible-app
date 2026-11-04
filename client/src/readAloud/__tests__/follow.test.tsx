import { act, renderHook } from '@testing-library/react-native';
import type { ComponentRef } from 'react';
import { Platform, type NativeScrollEvent, type NativeSyntheticEvent, type ScrollView } from 'react-native';

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

describe('pending reading follow', () => {
  beforeEach(() => jest.useFakeTimers());
  afterEach(() => {
    jest.useRealTimers();
    jest.restoreAllMocks();
  });

  it.each(['ios', 'web'] as const)('%s cancels a waiting follow but preserves a waiting passage target', async (os) => {
    jest.replaceProperty(Platform, 'OS', os);
    const scrollTo = jest.fn();
    let measured = false;
    const node = { scrollTop: 0, getBoundingClientRect: () => ({ top: 0, height: measured ? 800 : 0 }) };
    const scrollRef = { current: { scrollTo, getScrollableNode: () => node } as unknown as ComponentRef<typeof ScrollView> };
    const toolsRefs = { current: new Map([[2, { getBoundingClientRect: () => ({ top: 600 }) }]]) };
    const verses = [{ verse: 2, text: 'Second' }];
    const hook = await renderHook(() => useVerseScroller({ scrollRef, toolsRefs, viewportHeight: 800, headerBottom: 52, shownKey: 'chapter', layout: 'rows' }));
    const reportLayout = () => {
      measured = true;
      hook.result.current.onLayout({ key: 'chapter', kind: 'root', y: 100 });
      hook.result.current.onLayout({ key: 'chapter', kind: 'row', verse: 2, y: 500 });
      hook.result.current.retry();
    };
    await act(async () => hook.result.current.scrollToVerse('chapter', 2, verses, { follow: true }));
    expect(scrollTo).not.toHaveBeenCalled();
    await act(async () => {
      hook.result.current.cancelFollow();
      hook.result.current.release();
      reportLayout();
      jest.advanceTimersByTime(3000);
    });
    expect(scrollTo).not.toHaveBeenCalled();

    // A new chapter has no cached layout; the non-follow passage target must still wait for it.
    measured = false;
    await hook.unmount();
    const passage = await renderHook(() => useVerseScroller({ scrollRef, toolsRefs, viewportHeight: 800, headerBottom: 52, shownKey: 'passage', layout: 'rows' }));
    await act(async () => passage.result.current.scrollToVerse('passage', 2, verses));
    expect(scrollTo).not.toHaveBeenCalled();
    await act(async () => {
      passage.result.current.cancelFollow();
      passage.result.current.release();
      measured = true;
      passage.result.current.onLayout({ key: 'passage', kind: 'root', y: 100 });
      passage.result.current.onLayout({ key: 'passage', kind: 'row', verse: 2, y: 500 });
      passage.result.current.retry();
    });
    expect(scrollTo).toHaveBeenCalledTimes(1);
    expect(scrollTo).toHaveBeenCalledWith({ y: 400, animated: false });
  });

  it.each(['ios', 'web'] as const)('%s protects the header when placement waits more than 700ms', async (os) => {
    jest.replaceProperty(Platform, 'OS', os);
    let measured = false;
    let deadline = 0;
    const node = { scrollTop: 0, getBoundingClientRect: () => ({ top: 0, height: measured ? 800 : 0 }) };
    const scrollTo = jest.fn(({ y }: { y: number }) => {
      const header = hook.result.current.header;
      if (Date.now() < deadline) header.syncScroll(event(y));
      else header.onScroll(event(y));
    });
    const scrollRef = { current: { scrollTo, getScrollableNode: () => node } as unknown as ComponentRef<typeof ScrollView> };
    const toolsRefs = { current: new Map([[2, { getBoundingClientRect: () => ({ top: 600 }) }]]) };
    const hook = await renderHook(() => ({
      header: useCollapsingHeader(52),
      scroller: useVerseScroller({ scrollRef, toolsRefs, viewportHeight: 800, headerBottom: 52, shownKey: 'chapter', layout: 'rows' }),
    }));
    const onPlace = jest.fn(() => { deadline = Date.now() + 700; });
    await act(async () => hook.result.current.scroller.scrollToVerse('chapter', 2, [{ verse: 2, text: 'Second' }], { follow: true, onPlace }));
    await act(async () => jest.advanceTimersByTime(1000));
    expect(scrollTo).not.toHaveBeenCalled();
    expect(onPlace).not.toHaveBeenCalled();
    await act(async () => {
      measured = true;
      hook.result.current.scroller.onLayout({ key: 'chapter', kind: 'root', y: 100 });
      hook.result.current.scroller.onLayout({ key: 'chapter', kind: 'row', verse: 2, y: 500 });
      hook.result.current.scroller.retry();
    });
    expect(scrollTo).toHaveBeenCalledWith({ y: 400, animated: false });
    expect(onPlace).toHaveBeenCalledTimes(1);
    expect(hook.result.current.header.hidden).toBe(false);
    if (os === 'ios') {
      await act(async () => {
        jest.advanceTimersByTime(800);
        hook.result.current.scroller.onLayout({ key: 'chapter', kind: 'row', verse: 2, y: 550 });
      });
      expect(onPlace).toHaveBeenCalledTimes(2);
      expect(scrollTo).toHaveBeenLastCalledWith({ y: 450, animated: false });
      expect(hook.result.current.header.hidden).toBe(false);
    }
  });
});
