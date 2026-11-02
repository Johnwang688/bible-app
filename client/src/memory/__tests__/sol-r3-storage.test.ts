import { memoryHistoryKey, memoryLessonKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { toLocalDateString } from '../localDate';
import { createMemoryStore } from '../memoryStore';

it('keeps the first attempt date when a lesson subscriber submits after midnight', () => {
  // P3: lesson notifications now precede history initialization. A nested attempt on the next
  // local day claims startedOn even though the outer attempt and completion happened first.
  const beforeMidnight = new Date(2026, 10, 2, 23, 59, 59, 999);
  const afterMidnight = new Date(beforeMidnight.getTime() + 1);
  const verseId = '2-corinthians-5-17';
  const otherVerseId = 'galatians-2-20';
  const storage = createStorage(memoryBackend());
  const store = createMemoryStore(storage);
  storage.set(memoryLessonKey, {
    date: toLocalDateString(beforeMidnight),
    steps: [{ verseId, stage: 'chunk-order', completedAt: null }],
    completedAt: null,
  });

  jest.useFakeTimers();
  jest.setSystemTime(beforeMidnight);
  const unsubscribe = storage.subscribe(memoryLessonKey, () => {
    unsubscribe();
    // Model the clock rolling over during the synchronous notification; both calls use the
    // public default clock, as a screen and its storage listener would.
    jest.setSystemTime(afterMidnight);
    store.submitStep({ index: null, verseId: otherVerseId, stage: 'chunk-order', passed: false });
  });
  try {
    store.submitStep({ index: 0, verseId, stage: 'chunk-order', passed: true });

    expect(storage.get(memoryProgressKey)[verseId]?.lastReviewedAt).toBe(beforeMidnight.toISOString());
    expect(storage.get(memoryProgressKey)[otherVerseId]?.lastReviewedAt).toBe(afterMidnight.toISOString());
    expect(storage.get(memoryLessonKey)?.completedAt).toBe(beforeMidnight.toISOString());
    expect(storage.get(memoryHistoryKey).completedDates).toEqual([toLocalDateString(beforeMidnight)]);
    expect(storage.get(memoryHistoryKey).startedOn).toBe(toLocalDateString(beforeMidnight));
  } finally {
    unsubscribe();
    jest.useRealTimers();
  }
});
