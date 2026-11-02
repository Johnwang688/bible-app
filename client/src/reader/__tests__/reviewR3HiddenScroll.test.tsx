// Regression test from the Sol review of the R-3 teams (round 1, F4).
import { act, renderHook } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { useVerseScroller } from '../components/scrollToVerse';

afterEach(() => {
  jest.restoreAllMocks();
  jest.useRealTimers();
});

it('lands the target when hidden layout becomes available later', async () => {
  jest.useFakeTimers();
  jest.replaceProperty(Platform, 'OS', 'web');
  let visible = false;
  const scrollTo = jest.fn();
  const node = {
    scrollTop: 0,
    getBoundingClientRect: () => ({
      top: 0,
      height: visible ? 800 : 0,
    }),
  };
  const scrollRef = {
    current: { scrollTo, getScrollableNode: () => node },
  } as unknown as Parameters<typeof useVerseScroller>[0]['scrollRef'];
  const toolsRefs = {
    current: new Map([
      [30, { getBoundingClientRect: () => ({ top: 900 }) }],
    ]),
  };
  const h = await renderHook(() =>
    useVerseScroller({
      scrollRef, toolsRefs, viewportHeight: 800, headerBottom: 100,
    }),
  );

  await act(() => h.result.current.scrollToVerse(
    '43:3:WEB', 30, [{ verse: 30, text: 'Verse thirty' }],
  ));
  await act(() => jest.advanceTimersByTime(1500));
  visible = true;
  await h.rerender(undefined);
  await act(() => jest.advanceTimersByTime(100));

  expect(scrollTo).toHaveBeenCalledWith({ y: 700, animated: false });
});
