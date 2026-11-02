import { memoryHistoryKey, memoryLessonKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { addLocalDays, toLocalDateString } from '../localDate';
import { createMemoryStore } from '../memoryStore';

const verseId = '2-corinthians-5-17';
const otherVerseId = 'galatians-2-20';
const now = new Date(2026, 10, 2, 12);
const today = toLocalDateString(now);

it('keeps a 1000-day streak when capped history contains one duplicate date', () => {
  // P2: slicing before deduplication discards a unique day even though all 1000 distinct days fit.
  const storage = createStorage(memoryBackend());
  const uniqueDates = Array.from({ length: 999 }, (_, i) =>
    toLocalDateString(new Date(addLocalDays(now.getTime(), i - 999))),
  );
  storage.set(memoryHistoryKey, {
    startedOn: uniqueDates[0]!,
    completedDates: [...uniqueDates, uniqueDates[uniqueDates.length - 1]!],
  });
  storage.set(memoryLessonKey, {
    date: today,
    steps: [{ verseId, stage: 'chunk-order', completedAt: null }],
    completedAt: null,
  });
  const store = createMemoryStore(storage);
  expect(store.streak(now)).toBe(999);

  const out = store.submitStep({ index: 0, verseId, stage: 'chunk-order', passed: true, now });

  expect(out.dayCompleted).toBe(true);
  expect(storage.get(memoryHistoryKey).completedDates).toHaveLength(1000);
  expect(out.streak).toBe(1000);
});

it('keeps a lesson step submitted synchronously by a progress subscriber', () => {
  // P2: the precomputed outer lesson overwrites a nested submission made through Storage.subscribe.
  const storage = createStorage(memoryBackend());
  storage.set(memoryLessonKey, {
    date: today,
    steps: [
      { verseId, stage: 'chunk-order', completedAt: null },
      { verseId: otherVerseId, stage: 'chunk-order', completedAt: null },
    ],
    completedAt: null,
  });
  const store = createMemoryStore(storage);
  const unsubscribe = storage.subscribe(memoryProgressKey, () => {
    unsubscribe();
    const nested = store.submitStep({
      index: 1, verseId: otherVerseId, stage: 'chunk-order', passed: true, now,
    });
    expect(nested.recorded).toBe(true);
  });

  store.submitStep({ index: 0, verseId, stage: 'chunk-order', passed: true, now });

  expect(storage.get(memoryProgressKey)[verseId]!.successes).toBe(1);
  expect(storage.get(memoryProgressKey)[otherVerseId]!.successes).toBe(1);
  expect(storage.get(memoryLessonKey)?.steps.map((step) => step.completedAt)).toEqual([
    now.toISOString(), now.toISOString(),
  ]);
  expect(storage.get(memoryLessonKey)?.completedAt).toBe(now.toISOString());
  expect(storage.get(memoryHistoryKey).completedDates).toEqual([today]);
});

it('rejects an invalid history date before writing any progress', () => {
  // P3: a valid year-0999 Date yields an unpadded history date; validation still throws after progress is saved.
  const storage = createStorage(memoryBackend());
  const store = createMemoryStore(storage);
  const oldYear = new Date('0999-11-02T12:00:00.000Z');
  const submit = () => store.submitStep({
    index: null, verseId, stage: 'chunk-order', passed: true, now: oldYear,
  });

  expect(submit).toThrow();
  expect(storage.get(memoryHistoryKey)).toEqual({ startedOn: null, completedDates: [] });
  expect(storage.get(memoryProgressKey)).toEqual({});
});
