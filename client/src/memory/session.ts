// Today's session planner and the lesson hrefs. Ported from Little Lamb's session.ts.
import type { DailyLessonRecord } from './dailyLesson';
import { getAllMemoryVerses, getMemoryVerse } from './library';
import { endOfLocalDay, localDayIndex } from './localDate';
import { isStageSlug, stageToSlug } from './stages';
import type { LearnStage, MemoryVerse, ProgressMap, SessionItem } from './types';

export const SESSION_PARAM = 's';
export const INDEX_PARAM = 'i';

const SESSION_DELIM = ',';
const ITEM_DELIM = '~';

function nextStage(stage: LearnStage): LearnStage {
  switch (stage) {
    case 'chunk_order':
      return 'fill_blank';
    case 'fill_blank':
      return 'full_recall';
    case 'full_recall':
    case 'review':
      return 'review';
  }
}

function dayParity(today: Date): number {
  return localDayIndex(today) % 2;
}

// ---------------------------------------------------------------------------
// Build
// ---------------------------------------------------------------------------

/**
 * Today's session planner.
 *
 * Two modes:
 *
 * BEGINNER (fewer than 2 verses at `review`)
 *   Pick 2 verses, lowest sortOrder first — in-flight before untouched.
 *   For each, queue 2 items: current stage + next stage in the ladder. 4
 *   items total. Bootstraps users into the review pool quickly.
 *
 * NORMAL (≥ 2 verses at `review`) — review count scales with learned count:
 *   <50  → 1 lead + 2 review
 *   <100 → 1 lead + 3 review
 *   <200 → 1 lead + 4 review
 *   ≥200 → 1 lead every other day + 4 review
 *
 *   Lead-slot priority: any in-flight verse (chunk_order/fill_blank/full_recall)
 *   wins over introducing a new untouched one — finish what's started first.
 *   Day parity (local days since epoch) gates introducing a new verse at 200+;
 *   in-flight verses ignore parity. If no untouched verse remains and no
 *   in-flight verse exists, the lead slot becomes an extra review.
 *
 *   WHICH verses fill the review slots is `selectReviewIds` — a deterministic
 *   due-first draw over the schedule `recordAttempt` keeps, not a shuffle.
 *
 * `dueCutoff` is the end of the user's local day, in epoch ms: the instant a
 * verse must be due at or before to be drawn today. It is a parameter so the
 * tests can pin it; the default is `endOfLocalDay(today)`. It must be the same
 * instant `recordAttempt` (schedule.ts) is handed as `dayEnd`: when the two
 * disagree the user is handed a verse whose pass then buys nothing. See
 * `endOfLocalDay`.
 */
export function buildSession(
  progress: ProgressMap,
  today: Date = new Date(),
  dueCutoff: number = endOfLocalDay(today),
): SessionItem[] {
  const learnedCount = Object.values(progress).filter((p) => p.stage === 'review').length;

  if (learnedCount < 2) {
    return beginnerSession(progress);
  }
  return normalSession(progress, learnedCount, today, dueCutoff);
}

function beginnerSession(progress: ProgressMap): SessionItem[] {
  const all = getAllMemoryVerses().sort((a, b) => a.sortOrder - b.sortOrder);

  const inFlight: MemoryVerse[] = all.filter((v) => {
    const s = progress[v.id]?.stage;
    return s === 'chunk_order' || s === 'fill_blank' || s === 'full_recall';
  });
  const untouched: MemoryVerse[] = all.filter((v) => !progress[v.id]);

  const picks: MemoryVerse[] = [];
  for (const v of inFlight) {
    if (picks.length >= 2) break;
    picks.push(v);
  }
  for (const v of untouched) {
    if (picks.length >= 2) break;
    picks.push(v);
  }

  const items: SessionItem[] = [];
  for (const verse of picks) {
    let stage: LearnStage = progress[verse.id]?.stage ?? 'chunk_order';
    for (let i = 0; i < 2; i++) {
      items.push({ verseId: verse.id, stage: stageToSlug(stage) });
      stage = nextStage(stage);
    }
  }
  return items;
}

function normalSession(
  progress: ProgressMap,
  learnedCount: number,
  today: Date,
  dueCutoff: number,
): SessionItem[] {
  let reviewCount: number;
  let introduceNew: boolean;
  if (learnedCount < 50) {
    reviewCount = 2;
    introduceNew = true;
  } else if (learnedCount < 100) {
    reviewCount = 3;
    introduceNew = true;
  } else if (learnedCount < 200) {
    reviewCount = 4;
    introduceNew = true;
  } else {
    reviewCount = 4;
    introduceNew = dayParity(today) === 0;
  }

  const items: SessionItem[] = [];
  const exclude = new Set<string>();

  // In-flight verses (chunk_order, fill_blank, full_recall) take the lead
  // slot — finish what's started before introducing yet another verse. Only
  // when nothing is in flight do we honor `introduceNew` and pull an
  // untouched verse from the pool.
  const sorted = getAllMemoryVerses().sort((a, b) => a.sortOrder - b.sortOrder);
  const inFlight = sorted.find((v) => {
    const s = progress[v.id]?.stage;
    return s === 'chunk_order' || s === 'fill_blank' || s === 'full_recall';
  });

  if (inFlight) {
    const stage = progress[inFlight.id]!.stage;
    items.push({ verseId: inFlight.id, stage: stageToSlug(stage) });
    exclude.add(inFlight.id);
  } else if (introduceNew) {
    const newVerse = sorted.find((v) => !progress[v.id]);
    if (newVerse) {
      items.push({ verseId: newVerse.id, stage: 'chunk-order' });
      exclude.add(newVerse.id);
    } else {
      // No untouched verses left — pad with one more review.
      reviewCount += 1;
    }
  }

  for (const id of selectReviewIds(progress, exclude, reviewCount, dueCutoff)) {
    items.push({ verseId: id, stage: 'full-recall' });
  }
  return items;
}

// ---------------------------------------------------------------------------
// Review draw
// ---------------------------------------------------------------------------

/** A review-eligible verse, with its four scheduling fields resolved to epoch ms. */
interface ReviewCandidate {
  id: string;
  sortOrder: number;
  nextDueAt: number | null;
  lastReviewedAt: number | null;
  lapsedAt: number | null;
}

/**
 * ISO timestamptz → epoch ms; an absent or unparseable value reads as `null`.
 *
 * A malformed string is a row we know nothing about, and "unknown" is exactly
 * what `null` already means in this draw. Letting it through as `NaN` would be
 * worse than dropping it: NaN compares false against everything, so it would
 * sort wherever the input order happened to put it and take determinism with it.
 */
function toTime(iso: string | null): number | null {
  if (!iso) return null;
  const t = Date.parse(iso);
  return Number.isNaN(t) ? null : t;
}

/**
 * Pick today's review verses — deterministically, due-first.
 *
 * This replaced `shuffle(reviewIds).slice(0, reviewCount)`, under which a verse
 * passed forty times and one that barely scraped through had identical odds of
 * coming up tomorrow, and a failed recall changed nothing about when a verse
 * came back. There is no `Math.random` in this path on purpose: the plan is
 * frozen on the first call of the day, so determinism costs nothing
 * and is what makes the whole draw testable.
 *
 * Five bands, taken in order. Every tie-break is `sortOrder`, so the result is
 * total and stable regardless of the key order of `progress`:
 *
 *   A — lapsed        `lapsedAt !== null`, first `lapsedCap` only  by `lapsedAt` asc — oldest unrepaired failure first
 *   B — due           `nextDueAt !== null && <= cutoff`  by `nextDueAt` asc — most overdue first
 *   C — never sched.  `nextDueAt === null`           by `sortOrder`
 *   D — fill          everything else                by `lastReviewedAt` asc, NULLS FIRST
 *   E — deferred      the lapses band A had no room for, in band A's order
 *
 * Four orderings here are load-bearing:
 *
 *  - **C ranks BELOW B.** Sorting the due pool nulls-first (the obvious reading
 *    of "no date = maximally overdue") inverts the whole feature: a failure
 *    writes a real timestamp while an untouched row carries `null`, so failing a
 *    verse would DEMOTE it in tomorrow's draw. A null is "unknown", not
 *    "overdue". `recordAttempt` always writes a `nextDueAt`, so C should be empty in
 *    practice; it exists for rows written before the schedule existed (or
 *    merged in from another copy).
 *  - **A is capped** at `max(1, floor(reviewCount / 2))`. Uncapped, one or two
 *    verses the user cannot pass own 100% of a two-slot day forever and nothing
 *    else is ever reviewed again — and there is no escape state, because a
 *    failure never demotes and some users genuinely cannot pass a spoken stage.
 *  - **A capped-out lapse is DEFERRED out of B, C and D and re-offered last, as
 *    band E.** Letting it fall through to B instead — which is what this draw
 *    did first, on the reasoning that its own `nextDueAt` would rank it fairly —
 *    makes the cap decorative: a failure writes `next_due_at = now()`, so the
 *    verses the cap just turned away are also the MOST overdue members of B and
 *    B hands the slots straight back to them. Simulated over 20 days (10 verses
 *    at `review`, two of them unpassable, two slots a day) that draw gave the two
 *    unpassable verses 60% of all review slots and 100% of them on four days,
 *    while the eight healthy verses got two reviews each — the exact monopoly the
 *    cap is named for. Deferring keeps them eligible (the day never shortens to
 *    enforce a cap) without letting them outrank the verses the cap protects.
 *  - **D is ordered by `lastReviewedAt`, not `nextDueAt`.** `recordAttempt`
 *    only reschedules a verse that was actually due, so ordering the fill by the
 *    schedule would hand the user the identical not-yet-due verses every day
 *    until their real due date arrived. Least-recently-seen first makes the fill
 *    what it is meant to be — extra practice, not a scheduling event.
 *
 * D exists at all because the day's length is what the streak and the frozen
 * plan are built on: a short due queue must shorten nobody's day. One asymmetry
 * to know about and accept: on a band-D pick the schedule can only move DOWN. A
 * pass on a not-yet-due verse is refused by the due-gate and changes nothing,
 * while a failure is ungated and costs it `-60` mastery plus a lapse flag. That
 * is deliberate — a failed recall is real evidence either way, and the gate
 * exists to stop massed practice inflating an interval, which a failure cannot
 * do — but it does mean padding is a one-way ratchet, so it is stated here
 * rather than left for someone to rediscover as a bug.
 *
 * `cutoff` is the end of the user's LOCAL day (see `endOfLocalDay`), and is the
 * same instant `recordAttempt` is handed as `dayEnd`. The two must not
 * be derived independently.
 */
function selectReviewIds(
  progress: ProgressMap,
  exclude: Set<string>,
  reviewCount: number,
  cutoff: number,
): string[] {
  if (reviewCount <= 0) return [];

  const candidates: ReviewCandidate[] = [];
  for (const [id, p] of Object.entries(progress)) {
    if (p.stage !== 'review' || exclude.has(id)) continue;
    const verse = getMemoryVerse(id);
    if (!verse) continue;
    candidates.push({
      id,
      sortOrder: verse.sortOrder,
      nextDueAt: toTime(p.nextDueAt),
      lastReviewedAt: toTime(p.lastReviewedAt),
      lapsedAt: toTime(p.lapsedAt),
    });
  }

  // The cap is applied by slicing the band, not by a ceiling on the draw, so
  // the verses it turns away are an explicit set the other bands can exclude.
  const lapsedCap = Math.max(1, Math.floor(reviewCount / 2));
  const lapsedAll = candidates
    .filter((c) => c.lapsedAt !== null)
    .sort((a, b) => a.lapsedAt! - b.lapsedAt! || a.sortOrder - b.sortOrder);
  const lapsed = lapsedAll.slice(0, lapsedCap);
  const deferred = lapsedAll.slice(lapsedCap);
  const deferredIds = new Set(deferred.map((c) => c.id));
  const eligible = (c: ReviewCandidate) => !deferredIds.has(c.id);

  const due = candidates
    .filter((c) => eligible(c) && c.nextDueAt !== null && c.nextDueAt <= cutoff)
    .sort((a, b) => a.nextDueAt! - b.nextDueAt! || a.sortOrder - b.sortOrder);
  const neverScheduled = candidates
    .filter((c) => eligible(c) && c.nextDueAt === null)
    .sort((a, b) => a.sortOrder - b.sortOrder);
  const fill = candidates
    .filter((c) => eligible(c) && c.nextDueAt !== null && c.nextDueAt > cutoff)
    .sort((a, b) => {
      if (a.lastReviewedAt === null && b.lastReviewedAt === null) return a.sortOrder - b.sortOrder;
      if (a.lastReviewedAt === null) return -1;
      if (b.lastReviewedAt === null) return 1;
      return a.lastReviewedAt - b.lastReviewedAt || a.sortOrder - b.sortOrder;
    });

  const picked: string[] = [];
  const seen = new Set<string>();
  // The bands still overlap — a lapsed verse inside the cap is also a member of
  // B — so `seen` dedupes rather than the filters doing all the work.
  const drawFrom = (band: ReviewCandidate[]) => {
    for (const c of band) {
      if (picked.length >= reviewCount) return;
      if (seen.has(c.id)) continue;
      seen.add(c.id);
      picked.push(c.id);
    }
  };

  drawFrom(lapsed);
  drawFrom(due);
  drawFrom(neverScheduled);
  drawFrom(fill);
  // Last, never dropped: the cap bounds the share of the day a lapse can take,
  // not whether it is eligible at all.
  drawFrom(deferred);
  return picked;
}

// ---------------------------------------------------------------------------
// Encode / decode
// ---------------------------------------------------------------------------

export function encodeSession(items: SessionItem[]): string {
  return items.map((it) => `${it.verseId}${ITEM_DELIM}${it.stage}`).join(SESSION_DELIM);
}

export function decodeSession(raw: string | string[] | undefined): SessionItem[] {
  if (!raw) return [];
  const str = Array.isArray(raw) ? raw[0] : raw;
  if (!str) return [];
  const out: SessionItem[] = [];
  for (const chunk of str.split(SESSION_DELIM)) {
    if (!chunk) continue;
    const [verseId, stage] = chunk.split(ITEM_DELIM);
    if (!verseId || !stage || !isStageSlug(stage)) continue;
    out.push({ verseId, stage });
  }
  return out;
}

// ---------------------------------------------------------------------------
// Navigation
// ---------------------------------------------------------------------------

function buildHref(item: SessionItem, items: SessionItem[], index: number): string {
  const params = new URLSearchParams({
    [SESSION_PARAM]: encodeSession(items),
    [INDEX_PARAM]: String(index),
  });
  return `/memory/lesson/${item.verseId}/${item.stage}?${params.toString()}`;
}

export function firstStepHref(items: SessionItem[]): string | null {
  return stepHref(items, 0);
}

/**
 * Link to an arbitrary step of a session. The Memory tab uses this to resume at
 * the first step not yet ticked off, so reopening the Memory tab mid-way
 * through the day picks up where the user left off instead of restarting.
 */
export function stepHref(items: SessionItem[], index: number): string | null {
  if (index < 0 || index >= items.length) return null;
  const item = items[index];
  return item ? buildHref(item, items, index) : null;
}

/** Where a finished step goes next. The UI maps `kind` to its own label. */
export interface NextStep {
  href: string;
  kind: 'next' | 'done';
  isLast: boolean;
}

export function getNextStep(items: SessionItem[], currentIndex: number): NextStep {
  const nextIndex = currentIndex + 1;

  // No session at all: free practice reached straight from the library. There's no
  // day to finish here, so send them back to Memory home, which lives in the Study
  // tab's stack at /study/memory. (This path used to return ?completed=1, which is how
  // that URL ended up in people's bookmarks and history in the first place.)
  if (items.length === 0) {
    return { href: '/study/memory', kind: 'done', isLast: false };
  }

  const next = items[nextIndex];
  if (!next) {
    // The lesson's end screen decides what to show: the day complete, or the steps still
    // left (a skipped one is offered there). The trainers themselves stay at
    // /memory/lesson/<verseId>/<stage>.
    return { href: '/memory/complete', kind: 'done', isLast: true };
  }
  return { href: buildHref(next, items, nextIndex), kind: 'next', isLast: false };
}

/**
 * Where Next goes after step `index` of the stored lesson: the first LATER step not yet
 * ticked off, or the end screen when none is left. It does not wrap round to an earlier
 * skipped step: the end screen offers that. Free practice (no lesson or no index) goes
 * back to Memory home.
 */
export function nextHrefAfter(lesson: DailyLessonRecord | null, index: number | null): string {
  if (!lesson || index === null) return '/study/memory';
  const items: SessionItem[] = lesson.steps.map((s) => ({ verseId: s.verseId, stage: s.stage }));
  for (let i = index + 1; i < lesson.steps.length; i++) {
    if (lesson.steps[i]?.completedAt === null) return stepHref(items, i) ?? '/memory/complete';
  }
  return '/memory/complete';
}
