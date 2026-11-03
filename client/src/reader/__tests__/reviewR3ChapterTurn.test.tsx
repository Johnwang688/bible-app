// Regression test from the Sol review of the R-3 teams (round 1, F2).
import { renderHook } from '@testing-library/react-native';

import { readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import type { ChapterInfo } from '../../progress';
import { useReadingTime } from '../components/useReadingTime';

it('counts reading time until an immediate cached chapter turn', async () => {
  let t = new Date(2026, 10, 2, 9).getTime();
  const storage = createStorage(memoryBackend());
  const now = () => t;
  const chapter = { bookNumber: 43, chapter: 3, totalVerses: 36 };
  const h = await renderHook(
    ({ current }: { current: ChapterInfo }) =>
      useReadingTime({ storage, now, chapter: current, focused: true }),
    { initialProps: { current: chapter } },
  );

  t += 2000;
  await h.rerender({
    current: { bookNumber: 43, chapter: 4, totalVerses: 3 },
  });
  t += 1000;
  await h.unmount();

  expect(storage.get(readingProgressKey).activeMs['2026-11-02']).toBe(3000);
});
