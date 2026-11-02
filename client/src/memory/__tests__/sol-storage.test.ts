import { memoryHistoryKey, memoryLessonKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryStore } from '../memoryStore';
import { addLocalDays, toLocalDateString } from '../localDate';
import type { VerseProgress } from '../types';

const verseId = '2-corinthians-5-17';
const now = new Date(2026, 10, 2, 12);

it('records the next completed day when history already contains 1000 dates', () => {
  // P2: the 1001st completion writes the lesson, then throws while persisting history.
  const storage = createStorage(memoryBackend());
  const completedDates = Array.from({ length: 1000 }, (_, i) =>
    toLocalDateString(new Date(addLocalDays(now.getTime(), i - 1000))),
  );
  storage.set(memoryHistoryKey, { startedOn: completedDates[0]!, completedDates });
  storage.set(memoryLessonKey, {
    date: toLocalDateString(now),
    steps: [{ verseId, stage: 'chunk-order', completedAt: null }],
    completedAt: null,
  });
  const store = createMemoryStore(storage);
  expect(() => store.submitStep({ index: 0, verseId, stage: 'chunk-order', passed: true, now })).not.toThrow();
  expect(storage.get(memoryLessonKey)?.completedAt).toBe(now.toISOString());
  expect(storage.get(memoryHistoryKey).completedDates).toContain(toLocalDateString(now));
});

it.each(['successes', 'failures'] as const)('can record an attempt for schema-accepted %s', (counter) => {
  // P3: the schema accepts MAX_SAFE_INTEGER, but the next counter write is rejected and loses the attempt.
  const storage = createStorage(memoryBackend());
  const row: VerseProgress = {
    stage: 'chunk_order', successes: 0, failures: 0, masteryScore: 0,
    nextDueAt: null, lastReviewedAt: null, lapsedAt: null,
    [counter]: Number.MAX_SAFE_INTEGER,
  };
  const progress = { [verseId]: row };
  expect(memoryProgressKey.schema.safeParse(progress).success).toBe(true);
  storage.set(memoryProgressKey, progress);
  const store = createMemoryStore(storage);
  expect(() => store.submitStep({
    index: null, verseId, stage: 'chunk-order', passed: counter === 'successes', now,
  })).not.toThrow();
  expect(storage.get(memoryProgressKey)[verseId]!.lastReviewedAt).toBe(now.toISOString());
  expect(storage.get(memoryHistoryKey).startedOn).toBe(toLocalDateString(now));
});