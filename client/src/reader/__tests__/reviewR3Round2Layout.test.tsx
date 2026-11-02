// Regression test from the Sol review of the R-3 teams (round 2, F3).
import { act, renderHook } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { useVerseScroller } from '../components/scrollToVerse';

afterEach(() => jest.restoreAllMocks());

it('handles a target arriving before the replacement native layout', async () => {
  jest.replaceProperty(Platform, 'OS', 'ios');
  const scrollTo = jest.fn();
  const scrollRef = {
    current: { scrollTo },
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
  const key = '43:3:WEB';

  await act(() => {
    h.result.current.onLayout({ key, kind: 'root', y: 100 });
    h.result.current.onLayout({
      key, kind: 'row', verse: 2, y: 900,
    });
  });

  // Parallel mode is now off, but the new Text layout is pending.
  // ReaderScreen retains the same layout key.
  await act(() => h.result.current.scrollToVerse(key, 2, [
    { verse: 1, text: 'aaa' },
    { verse: 2, text: 'bbb' },
  ]));
  await act(() => h.result.current.onLayout({
    key, kind: 'text', height: 2000,
  }));

  expect(scrollTo).toHaveBeenLastCalledWith({
    y: 900, animated: false,
  });
  await h.unmount();
});
