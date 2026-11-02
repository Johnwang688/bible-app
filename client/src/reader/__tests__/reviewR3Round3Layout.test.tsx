import { act, renderHook } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { useVerseScroller } from '../components/scrollToVerse';

afterEach(() => jest.restoreAllMocks());

it('ignores previous-chapter reports without erasing current measurements', async () => {
  jest.replaceProperty(Platform, 'OS', 'ios');
  const scrollTo = jest.fn();
  const scrollRef = {
    current: { scrollTo },
  } as unknown as Parameters<typeof useVerseScroller>[0]['scrollRef'];
  const toolsRefs = { current: new Map<number, unknown>() };
  const key = '43:4:WEB';
  const h = await renderHook(() =>
    useVerseScroller({
      scrollRef,
      toolsRefs,
      viewportHeight: 800,
      headerBottom: 100,
      layout: 'rows',
      shownKey: key,
    }),
  );

  await act(() => h.result.current.scrollToVerse(
    key, 30, [{ verse: 30, text: 'Thirty' }],
  ));
  await act(() => h.result.current.onLayout({
    key, kind: 'root', y: 100,
  }));
  await act(() => h.result.current.onLayout({
    key: '43:3:WEB', kind: 'row', verse: 30, y: 3000,
  }));
  await act(() => h.result.current.onLayout({
    key, kind: 'row', verse: 30, y: 3000,
  }));

  expect(scrollTo).toHaveBeenCalledWith({
    y: 2900, animated: false,
  });
  await h.unmount();
});
