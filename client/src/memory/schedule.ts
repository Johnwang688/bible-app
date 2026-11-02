// The review schedule, on the device. Ported from Little Lamb's Postgres functions
// (supabase/migrations/0008_progress_rpcs.sql): `progress_review_interval`, `record_verse_attempt`
// and `promote_verse_stage`. Same rules, in TypeScript, pure: no function here mutates its arguments.
import { addLocalDays } from './localDate';
import { STAGE_RANK, type LearnStage, type VerseProgress } from './types';

const HOUR_MS = 3_600_000;

/** The caller's day end is trusted only within this distance of `now` (clock skew, not a free schedule). */
const DAY_END_WINDOW_MS = 36 * HOUR_MS;

/**
 * The interval ladder, in days, in one place.
 *
 * Boundaries are `>=` and the ladder is total over 0..100 on purpose. Mastery moves +20 on a pass
 * and -60 on a fail from a floor of 0, so it only ever holds multiples of 20 and the `< 20` bucket
 * is unreachable today, but a table written against the reachable set alone would silently depend
 * on the step size staying 20 forever.
 *
 * The ceiling is 16 days, not a month. With a 60-verse library a 30-day ceiling puts review demand
 * at ~2/day against 2-4 slots, so the day is padded from the not-yet-due pool nearly every day and
 * the ladder decides order but never membership. At 16 days demand is ~3.75/day against 3-4 slots
 * at a full library, which makes the fill the exception it is meant to be.
 */
export function reviewIntervalDays(mastery: number): number {
  if (mastery >= 100) return 16;
  if (mastery >= 80) return 8;
  if (mastery >= 60) return 4;
  if (mastery >= 40) return 2;
  return 1;
}

/** Add one to a counter when `add` is set, saturating at the largest integer the stored schema accepts. */
function bumpCounter(value: number, add: boolean): number {
  return add ? Math.min(Number.MAX_SAFE_INTEGER, value + 1) : value;
}

/**
 * Count one graded verdict on one verse and advance the review schedule. Never moves the stage;
 * that is `promoteStage`'s only job.
 *
 * THE DUE-GATE. Mastery and the schedule advance on a pass ONLY when the row was actually due.
 * Without it the interval measures taps rather than retention: chunk-order is graded locally by a
 * pure permutation check, so re-solving the same drag puzzle five times in two minutes would carry
 * a verse 0 -> 100 and buy it a fortnight off. Massed repetition is the thing an interval exists to
 * prevent, so it must not be able to extend one. Counters and `lastReviewedAt` still move on every
 * call (what the user did is recorded either way); only the schedule declines to react.
 *
 * "DUE" IS A DAY, NOT AN INSTANT, AND THE DAY IS THE USER'S. `dayEnd` is the end of the caller's
 * local day (`endOfLocalDay`) and it is BOTH the gate's cutoff and the base the next date is
 * stamped from, because it is also the cutoff `buildSession` drew today's verses against. Stamping
 * from `dayEnd` rather than `now` is what makes the two sides one predicate: every `nextDueAt` is
 * an end-of-local-day instant, and "due today" means `nextDueAt <= dayEnd`. It is also the
 * anti-grind bound: a credited pass sets `nextDueAt` to at least `dayEnd` + 1 day, strictly past
 * `dayEnd`, so a second attempt in the same local day can never be due.
 *
 * `dayEnd` is clamped to `now` +/- 36 hours: an honest end-of-day is under 24 hours out, the rest
 * absorbs clock skew, and an unclamped value would be the caller writing its own schedule. Dates
 * are `addLocalDays(cutoff, interval)`, so a DST change cannot shift them off an end-of-day.
 *
 * THE FAIL BRANCH IS NEVER GATED. The gate exists to stop massed practice inflating an interval,
 * and a failure can only ever shorten one: it always drops mastery, always sets `nextDueAt = now`
 * and always sets `lapsedAt = now`. A fail costs -60 against a pass's +20 because a lapse must cost
 * more than one pass restores: at -40 a verse at 100 failed on Monday and passed on Tuesday is back
 * in an 80 / 8-day slot the day after the user demonstrably forgot it.
 *
 * A first FAILED attempt on an untouched verse creates a `chunk_order` row (that verse then reads
 * as in flight to `buildSession` and takes tomorrow's lead slot).
 */
export function recordAttempt(
  row: VerseProgress | undefined,
  passed: boolean,
  now: Date,
  dayEnd: number,
): VerseProgress {
  const nowMs = now.getTime();
  const cutoff = Math.min(Math.max(dayEnd, nowMs - DAY_END_WINDOW_MS), nowMs + DAY_END_WINDOW_MS);
  const stamp = now.toISOString();

  if (!row) {
    return {
      stage: 'chunk_order',
      successes: passed ? 1 : 0,
      failures: passed ? 0 : 1,
      masteryScore: passed ? 20 : 0,
      nextDueAt: passed ? new Date(addLocalDays(cutoff, reviewIntervalDays(20))).toISOString() : stamp,
      lastReviewedAt: stamp,
      lapsedAt: passed ? null : stamp,
    };
  }

  const due = row.nextDueAt === null || Date.parse(row.nextDueAt) <= cutoff;
  let masteryScore = row.masteryScore;
  let nextDueAt = row.nextDueAt;
  if (!passed) {
    masteryScore = Math.max(0, row.masteryScore - 60);
    nextDueAt = stamp;
  } else if (due) {
    masteryScore = Math.min(100, row.masteryScore + 20);
    nextDueAt = new Date(addLocalDays(cutoff, reviewIntervalDays(masteryScore))).toISOString();
  }
  return {
    stage: row.stage,
    successes: bumpCounter(row.successes, passed),
    failures: bumpCounter(row.failures, !passed),
    masteryScore,
    nextDueAt,
    lastReviewedAt: stamp,
    // Unconditional on a pass, gate or no gate: a pass repairs the lapse. The band this feeds
    // means "not yet made good", not "failed while due".
    lapsedAt: passed ? null : stamp,
  };
}

/**
 * Advance the ladder, clamped and earned. The stored stage moves to `target` only when all three
 * hold, and is otherwise left exactly as it is:
 *
 *   1. strictly higher rank than the stored one: monotonic, so a stale or out-of-order call can
 *      never demote;
 *   2. at most one rank above it, so free practice cannot name `review` on an untouched verse and
 *      have it stick;
 *   3. `successes >=` the rank being claimed. The honest ladder spends exactly one pass per rank
 *      and `recordAttempt` always lands first, so this never binds on a real pass.
 *
 * Row absent: created at `target` only within one rank of the implicit starting rank (rank <= 1),
 * else at `chunk_order`. Touches nothing but the stage.
 */
export function promoteStage(row: VerseProgress | undefined, target: LearnStage): VerseProgress {
  const targetRank = STAGE_RANK[target];
  if (!row) {
    return {
      stage: targetRank <= 1 ? target : 'chunk_order',
      successes: 0,
      failures: 0,
      masteryScore: 0,
      nextDueAt: null,
      lastReviewedAt: null,
      lapsedAt: null,
    };
  }
  const currentRank = STAGE_RANK[row.stage];
  const granted = targetRank > currentRank && targetRank <= currentRank + 1 && row.successes >= targetRank;
  return { ...row, stage: granted ? target : row.stage };
}
