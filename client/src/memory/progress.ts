/**
 * The pre-hydration delta merge, the one-rank stage clamp and the server-row adoption.
 * Ported from Little Lamb's progress-merge.ts. Kept for sync (R-6b): on the device alone the schedule
 * is computed by `schedule.ts`; these fold rows from another copy of the same progress into this one.
 * The shapes (`LearnStage`, `VerseProgress`, `ProgressMap`, `STAGE_RANK`) live in `types.ts`.
 * "Server" in the comments below means the other copy of the progress, once there is one.
 */
import { STAGE_RANK, type LearnStage, type ProgressMap, type VerseProgress } from './types';

export { STAGE_RANK };

/**
 * Fold writes that landed in the cache before hydration finished into the rows
 * just read from Postgres.
 *
 * `localDeltas` is the pre-hydration cache itself, which is exactly why it can
 * be trusted as a delta ledger: it starts `{}` and only `recordAttempt` /
 * `setStageAtLeast` ever write to it, so every entry is a change that has not
 * reached the DB. Iterating it — rather than a parallel bookkeeping map — is
 * also what keeps brand-new verses alive: a slug absent from `dbMap` is CREATED
 * here, and a hard load straight onto an untouched verse's trainer is the single
 * most common case this exists for.
 *
 * Counts ADD. Replacing them would overwrite a real DB count with a
 * session-local one computed against an empty cache.
 *
 * `stage` is the exception. A cache entry's stage is an absolute, not a delta,
 * and its `'chunk_order'` is a DEFAULT rather than an observation — so the merge
 * takes whichever side ranks higher. Nothing else can be guaranteed not to
 * demote a DB row.
 *
 * The four scheduling fields take the DB side outright whenever a DB row exists,
 * because the client cannot produce them at all. Note the test is `base ?` and
 * NOT `base?.nextDueAt ?? delta.nextDueAt`: a real row's `nextDueAt: null` means
 * "the server has not scheduled this verse", and a `??` would let the local
 * default silently stand in for a server answer that was legitimately null.
 *
 * Pure: returns a new map and mutates neither argument.
 */
export function mergeLocalDeltas(dbMap: ProgressMap, localDeltas: ProgressMap): ProgressMap {
  const merged: ProgressMap = { ...dbMap };
  for (const [slug, delta] of Object.entries(localDeltas)) {
    const base = dbMap[slug];
    merged[slug] = {
      stage:
        base && STAGE_RANK[base.stage] > STAGE_RANK[delta.stage] ? base.stage : delta.stage,
      successes: (base?.successes ?? 0) + delta.successes,
      failures: (base?.failures ?? 0) + delta.failures,
      masteryScore: base ? base.masteryScore : delta.masteryScore,
      nextDueAt: base ? base.nextDueAt : delta.nextDueAt,
      lastReviewedAt: base ? base.lastReviewedAt : delta.lastReviewedAt,
      lapsedAt: base ? base.lapsedAt : delta.lapsedAt,
    };
  }
  return merged;
}

/**
 * The stage `promote_verse_stage` would actually store, given the row the cache
 * currently holds and the stage the trainer is asking for.
 *
 * This mirrors the SQL, condition for condition (`0008`): strictly higher rank
 * than the stored one, at most one rank up, and only a rank the row's
 * `successes` have paid for. It exists because the optimistic cache must not
 * assert a promotion the server will refuse — `adoptServerRow` keeps whichever
 * stage ranks higher, so an over-claimed stage does not merely appear for a
 * moment, it survives every correction the server sends for the rest of the
 * session and disappears only on the next `hydrate()`. `/verses` offers all
 * three trainers on every verse, so "pass 整节背诵 on an untouched verse" is a
 * two-tap path to a verse the dashboard counts as learned and the database has
 * at `chunk_order`.
 *
 * The absent-row case returns `target` only at rank 0, which is stricter than
 * the SQL's insert branch (that allows rank ≤ 1 against the implicit starting
 * rank). Stricter is the safe direction: if the server grants more, the higher
 * rank arrives in the returned row and `adoptServerRow` takes it.
 *
 * Pure, and kept here rather than in `learned-verses.ts` for the reason at the
 * top of this file — it is branching that has to stay in step with a migration,
 * which is exactly the kind that has to be testable.
 */
export function grantedStage(
  cached: VerseProgress | undefined,
  target: LearnStage,
): LearnStage {
  const currentRank = cached ? STAGE_RANK[cached.stage] : -1;
  const targetRank = STAGE_RANK[target];
  const granted =
    targetRank > currentRank &&
    targetRank <= currentRank + 1 &&
    (cached?.successes ?? 0) >= targetRank;
  return granted ? target : cached?.stage ?? 'chunk_order';
}

/**
 * Fold the row an RPC just returned back into the cached row it came from.
 *
 * The write path is optimistic: `recordAttempt` / `setStageAtLeast` update the
 * cache first and the RPC resolves later, by which time further writes for the
 * same slug may already be queued behind it. So this is not an assignment — it
 * is a merge that may never move a value backwards.
 *
 * - A null/undefined `server` returns `cached` untouched. A `security definer`
 *   function that returns without assigning its row variable arrives as `null`
 *   over PostgREST, and the persist chain must not be one such response away
 *   from a throw. `undefined` out means the caller had no cached row either and
 *   there is nothing to write — skip the assignment rather than inventing a row.
 * - Counters take `Math.max`. The cache can only ever run AHEAD of the server,
 *   and only while a write is in flight; taking the server value flat would
 *   flicker a count backwards on screen between two chained attempts.
 * - `stage` takes the higher rank, for the same reason: with two promotions
 *   queued, link 1 legitimately returns a stage the cache has already passed.
 *   This is the one field where a DISHONEST client value survives the round trip
 *   in the cache — the DB row is authoritative regardless (the server clamps
 *   what it stores), and the next `hydrate()` overwrites the lie.
 * - The four scheduling fields take the server side unconditionally, including
 *   its nulls. There is no local opinion about them to preserve.
 *
 * Pure: returns a new row and mutates neither argument.
 */
export function adoptServerRow(
  cached: VerseProgress | undefined,
  server: VerseProgress | null | undefined,
): VerseProgress | undefined {
  if (!server) return cached;
  if (!cached) return { ...server };
  return {
    stage: STAGE_RANK[cached.stage] > STAGE_RANK[server.stage] ? cached.stage : server.stage,
    successes: Math.max(cached.successes, server.successes),
    failures: Math.max(cached.failures, server.failures),
    masteryScore: server.masteryScore,
    nextDueAt: server.nextDueAt,
    lastReviewedAt: server.lastReviewedAt,
    lapsedAt: server.lapsedAt,
  };
}
