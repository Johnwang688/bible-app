/**
 * Acceptance tests for `buildSession`'s review draw: the deterministic, due-first band selection.
 * Ported from Little Lamb's tests/session-srs.ts (ids S1..S9 kept).
 *
 * Every case is one where a plausible reading of "due first" produces the WRONG verse: a null date
 * read as maximally overdue, a due-today verse measured against the instant the plan is built
 * rather than the end of the day, a cutoff re-derived in the wrong timezone, one unpassable verse
 * owning every slot forever, a fill draw that repeats itself.
 *
 * Everything runs through `buildSession` rather than the private selector, so the review-count
 * ladder and the lead slot are part of what is asserted:
 *   2..49 verses at `review`  -> 1 lead + 2 reviews
 *   all 60 at `review`        -> 3 reviews, +1 because no untouched verse is left for the lead
 *                                slot -> 4, and no lead item
 */
import { getAllMemoryVerses } from '../library';
import { buildSession } from '../session';
import type { ProgressMap, SessionItem, VerseProgress } from '../types';

/** Index reads are `T | undefined` under noUncheckedIndexedAccess; a missing entry is a broken fixture. */
function must<T>(value: T | undefined, what = 'value'): T {
  if (value === undefined) throw new Error(`missing ${what}`);
  return value;
}

/** Seed verses by sortOrder, so `id(0)` is always the lowest-sortOrder verse. */
const verses = [...getAllMemoryVerses()].sort((a, b) => a.sortOrder - b.sortOrder);
const id = (i: number): string => must(verses[i], `verse ${i}`).id;

/** Sunday 30 Aug 2026, 09:00 local: the cutoff tests turn on the local day. */
const TODAY = new Date(2026, 7, 30, 9, 0, 0, 0);

/** ISO timestamp `hours` from `TODAY` (negative = in the past). */
const at = (hours: number): string => new Date(TODAY.getTime() + hours * 3_600_000).toISOString();
const days = (n: number): string => at(n * 24);
/** A specific wall-clock instant in the user's own timezone, in August 2026. */
const localAt = (day: number, hour: number, minute = 0): string =>
  new Date(2026, 7, day, hour, minute).toISOString();

/**
 * A `review`-stage row. Counters and mastery are inert here: the draw reads only `stage` and the
 * three timestamps, so each test spells out just the fields it is about.
 */
function review(p: Partial<VerseProgress> = {}): VerseProgress {
  return {
    stage: 'review',
    successes: 3,
    failures: 0,
    masteryScore: 40,
    nextDueAt: null,
    lastReviewedAt: null,
    lapsedAt: null,
    ...p,
  };
}

function mapOf(rows: [number, VerseProgress][]): ProgressMap {
  const out: ProgressMap = {};
  for (const [i, p] of rows) out[id(i)] = p;
  return out;
}

/**
 * The review half of a plan. No fixture below puts a `full_recall` verse in the lead slot, so
 * every `full-recall` item is a review the draw chose.
 */
function reviewIds(items: SessionItem[]): string[] {
  return items.filter((it) => it.stage === 'full-recall').map((it) => it.verseId);
}

/** All 60 verses at `review`, none due for ten days: the backdrop for band-D cases. */
function fullLibrary(overrides: [number, VerseProgress][] = []): ProgressMap {
  const out: ProgressMap = {};
  for (let i = 0; i < verses.length; i++) {
    out[id(i)] = review({ nextDueAt: days(10), lastReviewedAt: at(-1) });
  }
  for (const [i, p] of overrides) out[id(i)] = p;
  return out;
}

describe('buildSession review draw (session-srs)', () => {
  it('S1 a lapsed verse precedes every non-lapsed one', () => {
    // v3 failed two hours ago and is due now; everything else has been due for a month.
    const progress = mapOf([
      [0, review({ nextDueAt: days(-30), lastReviewedAt: days(-30) })],
      [1, review({ nextDueAt: days(-30), lastReviewedAt: days(-30) })],
      [2, review({ nextDueAt: days(-30), lastReviewedAt: days(-30) })],
      [3, review({ nextDueAt: at(0), lastReviewedAt: at(-2), lapsedAt: at(-2) })],
      [4, review({ nextDueAt: days(-30), lastReviewedAt: days(-30) })],
      [5, review({ nextDueAt: days(-30), lastReviewedAt: days(-30) })],
    ]);

    expect(reviewIds(buildSession(progress, TODAY))).toEqual([id(3), id(0)]);
  });

  it('S2 a verse due yesterday precedes one that was never scheduled', () => {
    // The reason band C sits BELOW band B: a failure writes a real timestamp while an untouched
    // row carries null, so nulls-first would demote a verse for failing it.
    const progress = mapOf([
      [0, review({ nextDueAt: null, lastReviewedAt: null })],
      [1, review({ nextDueAt: days(-1), lastReviewedAt: days(-8) })],
    ]);

    expect(reviewIds(buildSession(progress, TODAY))).toEqual([id(1), id(0)]);
  });

  it('S3 the cap really bounds the lapsed share: a capped-out lapse is deferred, not requeued', () => {
    // Four review slots gives lapsedCap 2, so v2 (the newest of three lapses) gets no band-A
    // slot. It must not fall through to band B on its own nextDueAt either: a failure writes
    // `next_due_at = now()`, so the verses the cap turned away would be the most overdue members
    // of B and B would hand the slot straight back. v2 is deferred and re-offered only after B,
    // C and D, so the fourth slot goes to v4, a healthy verse that is not even due.
    const progress = fullLibrary([
      [0, review({ nextDueAt: at(0), lastReviewedAt: at(-72), lapsedAt: at(-72) })],
      [1, review({ nextDueAt: at(0), lastReviewedAt: at(-48), lapsedAt: at(-48) })],
      [2, review({ nextDueAt: at(0), lastReviewedAt: at(-24), lapsedAt: at(-24) })],
      [3, review({ nextDueAt: days(-30), lastReviewedAt: days(-30) })],
    ]);

    const drawn = reviewIds(buildSession(progress, TODAY));
    expect(drawn).toHaveLength(4);
    expect(drawn).toEqual([id(0), id(1), id(3), id(4)]);
  });

  it('S3b a deferred lapse is still drawn when nothing else can fill the day', () => {
    // Deferral is a ranking, never a drop. With only three review-stage verses, all lapsed, the
    // second slot must still come from the deferred pair, oldest failure first.
    const progress = mapOf([
      [0, review({ nextDueAt: at(0), lastReviewedAt: at(-72), lapsedAt: at(-72) })],
      [1, review({ nextDueAt: at(0), lastReviewedAt: at(-48), lapsedAt: at(-48) })],
      [2, review({ nextDueAt: at(0), lastReviewedAt: at(-24), lapsedAt: at(-24) })],
    ]);

    const drawn = reviewIds(buildSession(progress, TODAY));
    expect(drawn).toHaveLength(2);
    expect(drawn).toEqual([id(0), id(1)]);
  });

  it('S4 inside the due band, the most overdue comes first', () => {
    const progress = mapOf([
      [0, review({ nextDueAt: at(-2), lastReviewedAt: at(-2) })],
      [1, review({ nextDueAt: days(-30), lastReviewedAt: days(-30) })],
      [2, review({ nextDueAt: days(-1), lastReviewedAt: days(-1) })],
      [3, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
      [4, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
      [5, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
    ]);

    expect(reviewIds(buildSession(progress, TODAY))).toEqual([id(1), id(2)]);
  });

  it('S5 a never-scheduled verse is drawn, after the due band and before the fill', () => {
    // Band C is the safety net for rows minted during the deploy window. "Unknown" outranks
    // "not due yet" and loses to a real due date; it must never be dropped altogether.
    const progress = mapOf([
      [0, review({ nextDueAt: null, lastReviewedAt: null })],
      [1, review({ nextDueAt: at(-1), lastReviewedAt: days(-4) })],
      [2, review({ nextDueAt: days(10), lastReviewedAt: days(-99) })],
    ]);

    expect(reviewIds(buildSession(progress, TODAY))).toEqual([id(1), id(0)]);
  });

  it('S6 with nothing due the day keeps its length, filled least-recently-seen first', () => {
    // The fill is ordered by lastReviewedAt (nulls first), NOT by nextDueAt: a pass on a not-yet-due
    // verse does not reschedule it, so ordering by the schedule would repeat the same two verses.
    const progress = mapOf([
      [0, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
      [1, review({ nextDueAt: days(10), lastReviewedAt: days(-10) })],
      [2, review({ nextDueAt: days(10), lastReviewedAt: null })],
      [3, review({ nextDueAt: days(10), lastReviewedAt: days(-3) })],
      [4, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
      [5, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
    ]);

    const drawn = reviewIds(buildSession(progress, TODAY));
    expect(drawn).toHaveLength(2);
    expect(drawn).toEqual([id(2), id(1)]);
  });

  it('S7 the lead verse never doubles as a review', () => {
    // Two lead shapes, one rule. The new-verse lead has no progress row and the in-flight lead
    // is below `review`, so neither is a draw candidate today, but the exclusion keeps it that way.
    const withNewLead = mapOf([
      [0, review({ nextDueAt: days(-2), lastReviewedAt: days(-2) })],
      [1, review({ nextDueAt: days(-3), lastReviewedAt: days(-3) })],
      [2, review({ nextDueAt: days(-4), lastReviewedAt: days(-4) })],
    ]);
    const items = buildSession(withNewLead, TODAY);
    expect(must(items[0]).verseId).toBe(id(3));
    expect(must(items[0]).stage).toBe('chunk-order');
    const drawn = reviewIds(items);
    expect(drawn).not.toContain(id(3));
    expect(drawn).toHaveLength(2);

    const withInFlightLead: ProgressMap = {
      ...mapOf([
        [1, review({ nextDueAt: days(-3), lastReviewedAt: days(-3) })],
        [2, review({ nextDueAt: days(-4), lastReviewedAt: days(-4) })],
      ]),
      [id(0)]: review({ stage: 'fill_blank' }),
    };
    const inFlight = buildSession(withInFlightLead, TODAY);
    expect(must(inFlight[0]).verseId).toBe(id(0));
    expect(reviewIds(inFlight)).not.toContain(id(0));
  });

  it('S8 the due cutoff is the end of the local day, not the instant the plan is built', () => {
    // v0 is due at 8pm tonight and must be drawn. v2 is due at 00:30 tomorrow and must stay out:
    // the cutoff is the end of today, not 24 hours from now.
    const progress = mapOf([
      [0, review({ nextDueAt: localAt(30, 20), lastReviewedAt: at(-1) })],
      [1, review({ nextDueAt: days(10), lastReviewedAt: days(-100) })],
      [2, review({ nextDueAt: localAt(31, 0, 30), lastReviewedAt: at(-1) })],
      [3, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
      [4, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
      [5, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
    ]);

    expect(reviewIds(buildSession(progress, TODAY))).toEqual([id(0), id(1)]);
  });

  it('S8b the caller-supplied cutoff wins; it is never re-derived from `today`', () => {
    // The server builds the plan from a Date parsed in ITS timezone, so a cutoff computed there
    // is the end of the server's day. The device sends its own, and buildSession must use it.
    // Same fixture, same `today`, two cutoffs, two answers.
    const progress = mapOf([
      [0, review({ nextDueAt: localAt(30, 20), lastReviewedAt: at(-1) })],
      [1, review({ nextDueAt: days(10), lastReviewedAt: days(-100) })],
      [2, review({ nextDueAt: localAt(31, 0, 30), lastReviewedAt: at(-1) })],
      [3, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
      [4, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
      [5, review({ nextDueAt: days(10), lastReviewedAt: at(-1) })],
    ]);

    const atInstant = reviewIds(buildSession(progress, TODAY, TODAY.getTime()));
    expect(atInstant).toEqual([id(1), id(0)]);

    const endOfTomorrow = new Date(2026, 7, 31, 23, 59, 59, 999).getTime();
    const stretched = reviewIds(buildSession(progress, TODAY, endOfTomorrow));
    expect(stretched).toEqual([id(0), id(2)]);
  });

  it('S9 the draw is deterministic, and independent of key order', () => {
    // Every tie breaks on sortOrder, so the answer must not depend on the order Object.entries
    // happens to yield.
    const progress = fullLibrary([
      [0, review({ nextDueAt: at(0), lastReviewedAt: at(-72), lapsedAt: at(-72) })],
      [1, review({ nextDueAt: at(0), lastReviewedAt: at(-48), lapsedAt: at(-48) })],
      [2, review({ nextDueAt: at(0), lastReviewedAt: at(-24), lapsedAt: at(-24) })],
      [3, review({ nextDueAt: days(-30), lastReviewedAt: days(-30) })],
    ]);

    const first = reviewIds(buildSession(progress, TODAY));
    expect(reviewIds(buildSession(progress, TODAY))).toEqual(first);

    const reversed: ProgressMap = {};
    for (const [slug, p] of Object.entries(progress).reverse()) reversed[slug] = p;
    expect(reviewIds(buildSession(reversed, TODAY))).toEqual(first);
  });
});
