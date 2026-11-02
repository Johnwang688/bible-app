// Acceptance (orchestrator-owned): the Memory section's device storage (storage/memoryKeys.ts) and
// the store that applies a graded step (memory/memoryStore.ts), as Little Lamb's trainers did:
// every graded verdict is recorded, a pass promotes to the next stage, and a passed lesson step
// is ticked off the day's plan.
import {
  memoryHistoryKey,
  memoryLessonKey,
  memoryProgressKey,
  memorySettingsKey,
} from '../../storage/memoryKeys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createMemoryStore } from '../memoryStore';

const day = (d: number, h = 9) => new Date(2026, 10, d, h, 0);
const V1 = '2-corinthians-5-17';
const V2 = 'galatians-2-20';

let storage: Storage;
beforeEach(() => {
  storage = createStorage(memoryBackend());
});

describe('memoryKeys', () => {
  it('has safe fallbacks', () => {
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(storage.get(memoryLessonKey)).toBeNull();
    expect(storage.get(memoryHistoryKey)).toEqual({ startedOn: null, completedDates: [] });
    expect(storage.get(memorySettingsKey)).toEqual({ speech: 'mandarin', script: 'simplified', voice: true, voiceConsent: false });
  });

  const good = {
    stage: 'review' as const, successes: 2, failures: 1, masteryScore: 40,
    nextDueAt: '2026-11-05T05:59:59.999Z', lastReviewedAt: null, lapsedAt: null,
  };

  it('accepts a valid progress map', () => {
    storage.set(memoryProgressKey, { [V1]: good });
    expect(storage.get(memoryProgressKey)).toEqual({ [V1]: good });
  });

  it.each([
    ['mastery over 100', { [V1]: { ...good, masteryScore: 101 } }],
    ['negative count', { [V1]: { ...good, failures: -1 } }],
    ['fractional count', { [V1]: { ...good, successes: 1.5 } }],
    ['unknown stage', { [V1]: { ...good, stage: 'mastered' } }],
    ['bad date', { [V1]: { ...good, nextDueAt: 'tomorrow' } }],
    ['bad verse id', { 'John 3:16': good }],
  ])('rejects a progress map with a %s', (_label, value) => {
    expect(() => storage.set(memoryProgressKey, value as never)).toThrow();
  });

  it('rejects a lesson with too many steps or a bad date, and settings outside the enums', () => {
    const step = { verseId: V1, stage: 'chunk-order' as const, completedAt: null };
    expect(() => storage.set(memoryLessonKey, { date: '2026-11-04', steps: Array(21).fill(step), completedAt: null })).toThrow();
    expect(() => storage.set(memoryLessonKey, { date: '4 Nov', steps: [step], completedAt: null })).toThrow();
    expect(() => storage.set(memoryHistoryKey, { startedOn: null, completedDates: ['2026-13-01'] })).toThrow();
    expect(() => storage.set(memorySettingsKey, { speech: 'hakka', script: 'simplified' } as never)).toThrow();
  });

  it('reads corrupt stored data as the fallback', () => {
    const backend = memoryBackend();
    backend.set(memoryProgressKey.key, JSON.stringify({ v: memoryProgressKey.version, data: { [V1]: { stage: 'x' } } }));
    expect(createStorage(backend).get(memoryProgressKey)).toEqual({});
  });
});

describe('createMemoryStore', () => {
  it('a passed chunk order on an untouched verse records it and promotes it to fill_blank', () => {
    const store = createMemoryStore(storage);
    store.submitStep({ index: null, verseId: V1, stage: 'chunk-order', passed: true, now: day(4) });
    const row = storage.get(memoryProgressKey)[V1]!;
    expect(row.stage).toBe('fill_blank');
    expect(row.successes).toBe(1);
    expect(row.masteryScore).toBe(20);
  });

  it('a failed attempt is recorded and promotes nothing', () => {
    const store = createMemoryStore(storage);
    store.submitStep({ index: null, verseId: V1, stage: 'chunk-order', passed: false, now: day(4) });
    const row = storage.get(memoryProgressKey)[V1]!;
    expect(row).toMatchObject({ stage: 'chunk_order', successes: 0, failures: 1 });
    expect(row.lapsedAt).not.toBeNull();
  });

  it('free practice cannot skip stages: a full recall pass on an untouched verse stays at chunk_order', () => {
    const store = createMemoryStore(storage);
    store.submitStep({ index: null, verseId: V1, stage: 'full-recall', passed: true, now: day(4) });
    expect(storage.get(memoryProgressKey)[V1]).toMatchObject({ stage: 'chunk_order', successes: 1 });
  });

  it('ignores an unknown verse', () => {
    const store = createMemoryStore(storage);
    const out = store.submitStep({ index: null, verseId: 'not-a-verse', stage: 'chunk-order', passed: true, now: day(4) });
    expect(out.recorded).toBe(false);
    expect(storage.get(memoryProgressKey)).toEqual({});
  });

  it('runs a whole beginner day: the plan is stored, each pass ticks a step, the last one completes the day', () => {
    const store = createMemoryStore(storage);
    const lesson = store.todayLesson(day(4));
    expect(storage.get(memoryLessonKey)).toEqual(lesson);
    expect(lesson.steps.map((s) => [s.verseId, s.stage])).toEqual([
      [V1, 'chunk-order'], [V1, 'fill-blank'], [V2, 'chunk-order'], [V2, 'fill-blank'],
    ]);

    const fail = store.submitStep({ index: 0, verseId: V1, stage: 'chunk-order', passed: false, now: day(4) });
    expect(fail).toMatchObject({ recorded: false, dayCompleted: false });

    let last = fail;
    lesson.steps.forEach((s, i) => {
      last = store.submitStep({ index: i, verseId: s.verseId, stage: s.stage, passed: true, now: day(4, 10 + i) });
      expect(last.recorded).toBe(true);
      expect(last.dayCompleted).toBe(i === 3);
    });
    expect(last.streak).toBe(1);
    expect(storage.get(memoryHistoryKey)).toEqual({ startedOn: '2026-11-04', completedDates: ['2026-11-04'] });
    expect(storage.get(memoryProgressKey)[V1]!.stage).toBe('full_recall');
    expect(storage.get(memoryProgressKey)[V2]!.stage).toBe('full_recall');
  });

  it('the plan stays frozen within the day and is replanned the next day; the streak carries', () => {
    const store = createMemoryStore(storage);
    const first = store.todayLesson(day(4));
    first.steps.forEach((s, i) =>
      store.submitStep({ index: i, verseId: s.verseId, stage: s.stage, passed: true, now: day(4) }),
    );
    expect(store.todayLesson(day(4, 22))).toEqual(storage.get(memoryLessonKey));
    expect(store.todayLesson(day(4, 22)).completedAt).not.toBeNull();

    const next = store.todayLesson(day(5));
    expect(next.date).toBe('2026-11-05');
    expect(next.completedAt).toBeNull();
    next.steps.forEach((s, i) =>
      store.submitStep({ index: i, verseId: s.verseId, stage: s.stage, passed: true, now: day(5) }),
    );
    expect(storage.get(memoryHistoryKey).completedDates).toEqual(['2026-11-04', '2026-11-05']);
    expect(store.streak(day(5))).toBe(2);
    expect(store.streak(day(6))).toBe(2);
    expect(store.streak(day(7))).toBe(0);
  });

  it('a step index from yesterday\'s plan records the attempt but ticks nothing today', () => {
    const store = createMemoryStore(storage);
    store.todayLesson(day(4));
    const out = store.submitStep({ index: 0, verseId: V1, stage: 'chunk-order', passed: true, now: day(5) });
    expect(out.recorded).toBe(false);
    expect(storage.get(memoryProgressKey)[V1]!.successes).toBe(1);
  });
});
