// Regression test from the Sol review of the R-3 teams (round 2, F1).
import { act, renderHook } from '@testing-library/react-native';
import type { LayoutChangeEvent } from 'react-native';

import type { ChapterInfo } from '../../progress';
import { readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import {
  GEOMETRY_SETTLE_MS,
  useReadingTime,
} from '../components/useReadingTime';

afterEach(() => jest.useRealTimers());

it('does not credit a long chapter using the preceding short chapter geometry', async () => {
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

  await act(() => {
    h.result.current.onLayout({
      nativeEvent: {
        layout: { x: 0, y: 0, width: 390, height: 700 },
      },
    } as LayoutChangeEvent);
    h.result.current.onContentSizeChange(390, 700);
    jest.advanceTimersByTime(1000);
  });

  await h.rerender({
    chapter: { bookNumber: 43, chapter: 3, totalVerses: 36 },
  });
  // New chapter data is ready; its layout measurement arrives later.
  await act(() =>
    jest.advanceTimersByTime(GEOMETRY_SETTLE_MS + 50),
  );
  await act(() =>
    h.result.current.onContentSizeChange(390, 7000),
  );
  await act(() => jest.advanceTimersByTime(55_000));
  await h.unmount();

  const p = storage.get(readingProgressKey);
  expect(p.chaptersRead).not.toHaveProperty('43:3');
  expect(p.evidence.chapters['43:3']?.furthestVerse)
    .toBeLessThan(18);
});
