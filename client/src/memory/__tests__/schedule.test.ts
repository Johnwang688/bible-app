// Acceptance (orchestrator-owned): the review schedule, ported from Little Lamb's Postgres
// functions progress_review_interval, record_verse_attempt and promote_verse_stage
// (supabase/migrations/0008_progress_rpcs.sql) to run on the device.
import { addLocalDays, endOfLocalDay } from '../localDate';
import { promoteStage, recordAttempt, reviewIntervalDays } from '../schedule';
import type { VerseProgress } from '../types';

const HOUR = 3_600_000;
const now = new Date(2026, 10, 2, 9, 30); // Mon 2 Nov 2026, 09:30 local
const dayEnd = endOfLocalDay(now);
const iso = (ms: number) => new Date(ms).toISOString();

function row(over: Partial<VerseProgress> = {}): VerseProgress {
  return {
    stage: 'review',
    successes: 3,
    failures: 0,
    masteryScore: 40,
    nextDueAt: iso(dayEnd - 2 * HOUR),
    lastReviewedAt: iso(dayEnd - 30 * HOUR),
    lapsedAt: null,
    ...over,
  };
}

describe('reviewIntervalDays (progress_review_interval)', () => {
  it.each([
    [0, 1], [39, 1], [40, 2], [59, 2], [60, 4], [79, 4], [80, 8], [99, 8], [100, 16],
  ])('mastery %i -> %i day(s)', (m, d) => {
    expect(reviewIntervalDays(m)).toBe(d);
  });
});

describe('addLocalDays', () => {
  it('keeps the local wall-clock time across a DST change', () => {
    // US clocks fall back on Sun 1 Nov 2026; in any zone this must land on the next end of day.
    expect(addLocalDays(endOfLocalDay(new Date(2026, 9, 31)), 1)).toBe(endOfLocalDay(new Date(2026, 10, 1)));
    expect(addLocalDays(endOfLocalDay(new Date(2026, 2, 7)), 2)).toBe(endOfLocalDay(new Date(2026, 2, 9)));
  });
});

describe('recordAttempt (record_verse_attempt)', () => {
  it('first pass on an untouched verse creates the row at chunk_order, mastery 20, due tomorrow', () => {
    expect(recordAttempt(undefined, true, now, dayEnd)).toEqual({
      stage: 'chunk_order',
      successes: 1,
      failures: 0,
      masteryScore: 20,
      lastReviewedAt: now.toISOString(),
      nextDueAt: iso(addLocalDays(dayEnd, 1)),
      lapsedAt: null,
    });
  });

  it('first failure on an untouched verse creates a lapsed row due now', () => {
    expect(recordAttempt(undefined, false, now, dayEnd)).toEqual({
      stage: 'chunk_order',
      successes: 0,
      failures: 1,
      masteryScore: 0,
      lastReviewedAt: now.toISOString(),
      nextDueAt: now.toISOString(),
      lapsedAt: now.toISOString(),
    });
  });

  it('a pass on a due verse adds 20 mastery and schedules from the end of the day by the new mastery', () => {
    const out = recordAttempt(row({ masteryScore: 40, lapsedAt: iso(dayEnd - 40 * HOUR) }), true, now, dayEnd);
    expect(out.masteryScore).toBe(60);
    expect(out.nextDueAt).toBe(iso(addLocalDays(dayEnd, 4)));
    expect(out.successes).toBe(4);
    expect(out.failures).toBe(0);
    expect(out.lastReviewedAt).toBe(now.toISOString());
    expect(out.lapsedAt).toBeNull();
    expect(out.stage).toBe('review');
  });

  it('a verse due exactly at the cutoff counts as due', () => {
    const out = recordAttempt(row({ nextDueAt: iso(dayEnd) }), true, now, dayEnd);
    expect(out.masteryScore).toBe(60);
  });

  it('a never-scheduled row (nextDueAt null) counts as due', () => {
    const out = recordAttempt(row({ nextDueAt: null, masteryScore: 0 }), true, now, dayEnd);
    expect(out.masteryScore).toBe(20);
    expect(out.nextDueAt).toBe(iso(addLocalDays(dayEnd, 1)));
  });

  it('mastery caps at 100 and the interval at 16 days', () => {
    const out = recordAttempt(row({ masteryScore: 90 }), true, now, dayEnd);
    expect(out.masteryScore).toBe(100);
    expect(out.nextDueAt).toBe(iso(addLocalDays(dayEnd, 16)));
  });

  it('the due-gate: a pass on a not-yet-due verse moves neither mastery nor the schedule', () => {
    const due = iso(addLocalDays(dayEnd, 3));
    const out = recordAttempt(row({ nextDueAt: due, masteryScore: 60, lapsedAt: null }), true, now, dayEnd);
    expect(out.masteryScore).toBe(60);
    expect(out.nextDueAt).toBe(due);
    expect(out.successes).toBe(4);
    expect(out.lastReviewedAt).toBe(now.toISOString());
    expect(out.lapsedAt).toBeNull();
  });

  it('anti-grind: a second pass the same day earns nothing more', () => {
    const once = recordAttempt(row({ masteryScore: 40 }), true, now, dayEnd);
    const twice = recordAttempt(once, true, new Date(now.getTime() + HOUR), dayEnd);
    expect(twice.masteryScore).toBe(60);
    expect(twice.nextDueAt).toBe(once.nextDueAt);
    expect(twice.successes).toBe(once.successes + 1);
  });

  it('a failure is ungated: -60 mastery (floor 0), due now, lapsed now, stage kept', () => {
    const notDue = iso(addLocalDays(dayEnd, 5));
    const out = recordAttempt(row({ masteryScore: 80, nextDueAt: notDue }), false, now, dayEnd);
    expect(out.masteryScore).toBe(20);
    expect(out.nextDueAt).toBe(now.toISOString());
    expect(out.lapsedAt).toBe(now.toISOString());
    expect(out.failures).toBe(1);
    expect(out.successes).toBe(3);
    expect(out.stage).toBe('review');
    expect(recordAttempt(row({ masteryScore: 40 }), false, now, dayEnd).masteryScore).toBe(0);
  });

  it('never moves the stage', () => {
    for (const stage of ['chunk_order', 'fill_blank', 'full_recall', 'review'] as const) {
      expect(recordAttempt(row({ stage }), true, now, dayEnd).stage).toBe(stage);
      expect(recordAttempt(row({ stage }), false, now, dayEnd).stage).toBe(stage);
    }
  });

  it('clamps the day end to now +/- 36 hours', () => {
    const far = now.getTime() + 10 * 24 * HOUR;
    expect(recordAttempt(undefined, true, now, far).nextDueAt).toBe(iso(addLocalDays(now.getTime() + 36 * HOUR, 1)));
    // A due date between the real cutoff and the far one is NOT due: the clamp decides.
    const dueIn3Days = iso(now.getTime() + 3 * 24 * HOUR);
    expect(recordAttempt(row({ nextDueAt: dueIn3Days }), true, now, far).masteryScore).toBe(40);
    const past = now.getTime() - 10 * 24 * HOUR;
    expect(recordAttempt(undefined, true, now, past).nextDueAt).toBe(iso(addLocalDays(now.getTime() - 36 * HOUR, 1)));
  });

  it('does not mutate its input', () => {
    const r = row();
    const copy = { ...r };
    recordAttempt(r, true, now, dayEnd);
    recordAttempt(r, false, now, dayEnd);
    expect(r).toEqual(copy);
  });
});

describe('promoteStage (promote_verse_stage)', () => {
  const fresh = (stage: VerseProgress['stage'], successes: number) => row({ stage, successes });

  it('an absent row is created at the target when it is rank 0 or 1, else at chunk_order', () => {
    const base = { successes: 0, failures: 0, masteryScore: 0, nextDueAt: null, lastReviewedAt: null, lapsedAt: null };
    expect(promoteStage(undefined, 'chunk_order')).toEqual({ stage: 'chunk_order', ...base });
    expect(promoteStage(undefined, 'fill_blank')).toEqual({ stage: 'fill_blank', ...base });
    expect(promoteStage(undefined, 'full_recall')).toEqual({ stage: 'chunk_order', ...base });
    expect(promoteStage(undefined, 'review')).toEqual({ stage: 'chunk_order', ...base });
  });

  it('moves one rank up when the successes have paid for it', () => {
    expect(promoteStage(fresh('chunk_order', 1), 'fill_blank').stage).toBe('fill_blank');
    expect(promoteStage(fresh('fill_blank', 2), 'full_recall').stage).toBe('full_recall');
    expect(promoteStage(fresh('full_recall', 3), 'review').stage).toBe('review');
  });

  it('refuses an unpaid rank', () => {
    expect(promoteStage(fresh('chunk_order', 0), 'fill_blank').stage).toBe('chunk_order');
    expect(promoteStage(fresh('full_recall', 2), 'review').stage).toBe('full_recall');
  });

  it('refuses to skip a rank, to demote, or to re-promote', () => {
    expect(promoteStage(fresh('chunk_order', 9), 'full_recall').stage).toBe('chunk_order');
    expect(promoteStage(fresh('review', 9), 'fill_blank').stage).toBe('review');
    expect(promoteStage(fresh('fill_blank', 9), 'fill_blank').stage).toBe('fill_blank');
  });

  it('touches nothing but the stage, and does not mutate its input', () => {
    const r = fresh('chunk_order', 1);
    const copy = { ...r };
    expect(promoteStage(r, 'fill_blank')).toEqual({ ...copy, stage: 'fill_blank' });
    expect(r).toEqual(copy);
  });
});
