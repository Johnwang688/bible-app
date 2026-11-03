// Acceptance (MEM 3; orchestrator-owned, implementers may not edit): the pure merge and wire encoding of Memory
// progress and history (sync/domains/memory.ts). Progress: per verse, the newer review wins. History: completed
// days are a union (no day is ever lost), the start is the earliest. Merges are commutative, associative and
// idempotent, so any order of syncs between any number of devices ends in the same value.
import type { MemoryHistory } from '../../storage/memoryKeys';
import type { ProgressMap, VerseProgress } from '../../memory/types';
import {
  decodeMemoryProgress,
  encodeMemoryProgress,
  mergeMemoryHistory,
  mergeMemoryProgress,
} from '../domains/memory';

const row = (over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'fill_blank',
  successes: 1,
  failures: 0,
  masteryScore: 20,
  nextDueAt: '2026-11-04T09:00:00.000Z',
  lastReviewedAt: '2026-11-02T09:00:00.000Z',
  lapsedAt: null,
  ...over,
});

describe('mergeMemoryProgress', () => {
  it('keeps verses only one side has', () => {
    const a: ProgressMap = { 'john-3-16': row() };
    const b: ProgressMap = { 'romans-12-1': row({ stage: 'review' }) };
    expect(mergeMemoryProgress(a, b)).toEqual({ ...a, ...b });
  });

  it('per verse, the row with the newer review wins whole', () => {
    const older = row({ stage: 'review', masteryScore: 80, lastReviewedAt: '2026-11-01T09:00:00.000Z' });
    const newer = row({ stage: 'fill_blank', masteryScore: 10, lastReviewedAt: '2026-11-02T09:00:00.000Z', lapsedAt: '2026-11-02T09:00:00.000Z' });
    expect(mergeMemoryProgress({ v: older }, { v: newer })).toEqual({ v: newer });
    expect(mergeMemoryProgress({ v: newer }, { v: older })).toEqual({ v: newer });
  });

  it('a reviewed row beats one never reviewed', () => {
    const never = row({ lastReviewedAt: null });
    const reviewed = row({ lastReviewedAt: '2020-01-01T00:00:00.000Z' });
    expect(mergeMemoryProgress({ v: never }, { v: reviewed })).toEqual({ v: reviewed });
  });

  it('a tie on the review time picks the same row whichever side it is on', () => {
    const x = row({ successes: 3, failures: 1 });
    const y = row({ successes: 2, failures: 0, masteryScore: 90 });
    expect(mergeMemoryProgress({ v: x }, { v: y })).toEqual(mergeMemoryProgress({ v: y }, { v: x }));
  });

  it('is idempotent and associative', () => {
    const a: ProgressMap = { v: row({ lastReviewedAt: '2026-11-01T00:00:00.000Z' }), w: row() };
    const b: ProgressMap = { v: row({ lastReviewedAt: '2026-11-03T00:00:00.000Z' }) };
    const c: ProgressMap = { w: row({ lastReviewedAt: '2026-11-05T00:00:00.000Z' }), x: row() };
    expect(mergeMemoryProgress(a, a)).toEqual(a);
    expect(mergeMemoryProgress(mergeMemoryProgress(a, b), c)).toEqual(mergeMemoryProgress(a, mergeMemoryProgress(b, c)));
  });
});

describe('mergeMemoryHistory', () => {
  const h = (startedOn: string | null, completedDates: string[]): MemoryHistory => ({ startedOn, completedDates });

  it('completed days are a sorted union without repeats', () => {
    expect(mergeMemoryHistory(h('2026-10-30', ['2026-10-30', '2026-11-01']), h('2026-11-01', ['2026-11-01', '2026-11-02']))).toEqual(
      h('2026-10-30', ['2026-10-30', '2026-11-01', '2026-11-02']),
    );
  });

  it('the start is the earliest known start', () => {
    expect(mergeMemoryHistory(h(null, []), h('2026-11-01', ['2026-11-01'])).startedOn).toBe('2026-11-01');
    expect(mergeMemoryHistory(h('2026-11-03', []), h('2026-11-01', [])).startedOn).toBe('2026-11-01');
    expect(mergeMemoryHistory(h(null, []), h(null, []))).toEqual(h(null, []));
  });

  it('keeps the latest 1000 days when the union is longer (the storage cap)', () => {
    const days = (from: number, n: number) =>
      Array.from({ length: n }, (_, i) => new Date(Date.UTC(2020, 0, from + i)).toISOString().slice(0, 10));
    const merged = mergeMemoryHistory(h('2020-01-01', days(1, 800)), h('2020-01-01', days(601, 800)));
    expect(merged.completedDates).toHaveLength(1000);
    expect(merged.completedDates.at(-1)).toBe(days(601, 800).at(-1));
  });

  it('is commutative and idempotent', () => {
    const a = h('2026-10-01', ['2026-10-02']);
    const b = h('2026-09-01', ['2026-10-03']);
    expect(mergeMemoryHistory(a, b)).toEqual(mergeMemoryHistory(b, a));
    expect(mergeMemoryHistory(a, a)).toEqual(a);
  });
});

describe('the wire encoding of progress', () => {
  it('round-trips every field, nulls included', () => {
    const p: ProgressMap = {
      'john-3-16': row(),
      'psalm-119-911': row({ stage: 'review', successes: 12, failures: 3, masteryScore: 100, nextDueAt: null, lapsedAt: '2026-11-02T10:11:12.345Z' }),
      'romans-12-1': row({ stage: 'chunk_order', successes: 0, failures: 0, masteryScore: 0, nextDueAt: null, lastReviewedAt: null }),
    };
    const s = encodeMemoryProgress(p);
    expect(typeof s).toBe('string');
    expect(decodeMemoryProgress(s)).toEqual(p);
    expect(decodeMemoryProgress(encodeMemoryProgress({}))).toEqual({});
  });

  it('refuses anything that is not exactly an encoding (the device ignores it)', () => {
    const good = encodeMemoryProgress({ v: row() });
    for (const bad of ['garbage', `${good};x`, `x${good}`, good.slice(0, -3), encodeMemoryProgress({ v: row() }).replace('v', 'V')]) {
      expect(decodeMemoryProgress(bad)).toBeNull();
    }
  });
});
