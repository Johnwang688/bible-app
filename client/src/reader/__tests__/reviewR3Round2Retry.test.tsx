// Regression test from the Sol review of the R-3 teams (round 2, F2).
import { act, renderHook } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { useVerseScroller } from '../components/scrollToVerse';

afterEach(() => {
  jest.restoreAllMocks();
  jest.useRealTimers();
});

it('stops retrying when the loaded translation lacks the target verse', async () => {
  jest.useFakeTimers();
  jest.replaceProperty(Platform, 'OS', 'web');
  const scrollTo = jest.fn();
  const getScrollableNode = jest.fn(() => ({
    scrollTop: 0,
    getBoundingClientRect: () => ({ top: 0, height: 800 }),
  }));
  const scrollRef = {
    current: { scrollTo, getScrollableNode },
  } as unknown as Parameters<typeof useVerseScroller>[0]['scrollRef'];
  const toolsRefs = { current: new Map<number, unknown>() };
  const h = await renderHook(() =>
    useVerseScroller({
      scrollRef,
      toolsRefs,
      viewportHeight: 800,
      headerBottom: 100,
    }),
  );

  await act(() => h.result.current.scrollToVerse(
    '43:4:WEB',
    2,
    [{ verse: 1, text: 'One' }, { verse: 3, text: 'Three' }],
  ));
  await act(() => jest.advanceTimersByTime(60_000));
  jest.runAllTicks();

  expect(getScrollableNode.mock.calls.length).toBeLessThan(100);
  expect(jest.getTimerCount()).toBe(0);
  await h.unmount();
});
