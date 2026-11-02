import { act, renderHook } from '@testing-library/react-native';
import type { LayoutChangeEvent } from 'react-native';

import type { ChapterInfo } from '../../progress';
import { readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { useReadingTime } from '../components/useReadingTime';

afterEach(() => jest.useRealTimers());

it('does not assign an old content-size event to the new chapter', async () => {
  jest.useFakeTimers();
  jest.setSystemTime(new Date(2026, 10, 2, 9));
  const storage = createStorage(memoryBackend());
  const now = () => Date.now();
  const h = await renderHook(
    ({ chapter }: { chapter: ChapterInfo }) =>
      useReadingTime({ storage, now, chapter, focused: true }),
    {
      initialProps: {
        chapter: { bookNumber: 19, chapter: 117, totalVerses: 3 },
      },
    },
  );
  await act(() => h.result.current.onLayout({
    nativeEvent: {
      layout: { x: 0, y: 0, width: 390, height: 700 },
    },
  } as LayoutChangeEvent));

  await h.rerender({
    chapter: { bookNumber: 43, chapter: 3, totalVerses: 36 },
  });
  // The ScrollView is reused: an event queued for its previous
  // content reaches the current onContentSizeChange handler.
  await act(() => h.result.current.onContentSizeChange(390, 700));
  await act(() => jest.advanceTimersByTime(350));
  await act(() => h.result.current.onContentSizeChange(390, 7000));
  await act(() => jest.advanceTimersByTime(55_000));
  await h.unmount();

  expect(storage.get(readingProgressKey).chaptersRead)
    .not.toHaveProperty('43:3');
});
