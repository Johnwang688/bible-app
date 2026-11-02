// Regression test from the Sol review of the R-3 teams (round 1, F1).
import { act, renderHook } from '@testing-library/react-native';
import type { NativeScrollEvent, NativeSyntheticEvent } from 'react-native';

import { readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { useReadingTime } from '../components/useReadingTime';

it('flushes the final throttled bottom report on unmount', async () => {
  jest.useFakeTimers();
  try {
    let t = new Date(2026, 10, 2, 9).getTime();
    const storage = createStorage(memoryBackend());
    const chapter = { bookNumber: 43, chapter: 3, totalVerses: 36 };
    const now = () => t;
    const h = await renderHook(() =>
      useReadingTime({ storage, now, chapter, focused: true }),
    );
    const scroll = (y: number) => ({
      nativeEvent: {
        contentOffset: { x: 0, y },
        layoutMeasurement: { width: 390, height: 700 },
        contentSize: { width: 390, height: 7000 },
      },
    }) as NativeSyntheticEvent<NativeScrollEvent>;

    await act(() => h.result.current.onScroll(scroll(0)));
    t += 100;
    await act(() => h.result.current.onScroll(scroll(6300)));
    await h.unmount();

    expect(
      storage.get(readingProgressKey).evidence.chapters['43:3']?.furthestVerse,
    ).toBe(36);
  } finally {
    jest.useRealTimers();
  }
});
