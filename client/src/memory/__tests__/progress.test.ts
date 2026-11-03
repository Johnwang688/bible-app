/**
 * Acceptance tests for the progress merge: `mergeLocalDeltas` (folding pre-hydration writes into
 * the rows read from the store), `adoptServerRow` (folding an RPC's returned row back into the
 * optimistic cache), and `grantedStage` (the client-side mirror of the one-rank stage clamp).
 * Ported from Little Lamb's tests/progress-merge.ts (ids P1..P19 kept).
 *
 * Every hole found in this merge so far was a case where the merge quietly produced WORSE data
 * than dropping the write: a new verse silently vanishing, a session-local count replacing a real
 * one, a stage demoted. Each is a test below.
 */
import { adoptServerRow, grantedStage, mergeLocalDeltas, STAGE_RANK } from '../progress';
import type { ProgressMap, VerseProgress } from '../types';

/** Index reads are `T | undefined` under noUncheckedIndexedAccess; a missing entry is a broken fixture. */
function must<T>(value: T | undefined, what = 'value'): T {
  if (value === undefined) throw new Error(`missing ${what}`);
  return value;
}

/** A row out of a ProgressMap, failing loudly if the slug is absent. */
function rowAt(map: ProgressMap, slug: string): VerseProgress {
  return must(map[slug], `row ${slug}`);
}

/**
 * Row builder. The four scheduling fields are server-owned, so most cases here do not care about
 * them; spelling them out in every fixture would bury the one field each test is actually about.
 */
function row(p: Partial<VerseProgress> & Pick<VerseProgress, 'stage'>): VerseProgress {
  return {
    successes: 0,
    failures: 0,
    masteryScore: 0,
    nextDueAt: null,
    lastReviewedAt: null,
    lapsedAt: null,
    ...p,
  };
}

describe('mergeLocalDeltas (progress-merge)', () => {
  it('P1 a slug absent from the DB map is created, not dropped', () => {
    // The case this whole mechanism exists for: a hard load straight onto a brand-new verse's
    // trainer. There is no progress row yet, so any merge that only visits existing rows loses
    // the attempt entirely.
    const db: ProgressMap = {};
    const local: ProgressMap = {
      'john-3-16': row({ stage: 'chunk_order', successes: 0, failures: 1 }),
    };

    const merged = mergeLocalDeltas(db, local);
    expect(merged['john-3-16']).toBeDefined();
    const r = rowAt(merged, 'john-3-16');
    expect(r.successes).toBe(0);
    expect(r.failures).toBe(1);
    expect(r.stage).toBe('chunk_order');
  });

  it('P2 counts add, never replace', () => {
    const db: ProgressMap = {
      'psalm-23-1': row({ stage: 'full_recall', successes: 5, failures: 2 }),
    };
    const local: ProgressMap = {
      'psalm-23-1': row({ stage: 'chunk_order', successes: 1, failures: 0 }),
    };

    const r = rowAt(mergeLocalDeltas(db, local), 'psalm-23-1');
    expect(r.successes).toBe(6); // db 5 + local 1
    expect(r.failures).toBe(2); // db 2 + local 0
  });

  it('P3 stage takes the higher rank when the DB is ahead', () => {
    // The pre-hydration entry's `chunk_order` is a DEFAULT, not an observation. Taking the local
    // side here would demote a verse already at review.
    const db: ProgressMap = { 'john-1-1': row({ stage: 'review', successes: 3, failures: 0 }) };
    const local: ProgressMap = {
      'john-1-1': row({ stage: 'chunk_order', successes: 0, failures: 1 }),
    };

    const merged = mergeLocalDeltas(db, local);
    expect(rowAt(merged, 'john-1-1').stage).toBe('review');
    expect(STAGE_RANK[rowAt(merged, 'john-1-1').stage]).toBeGreaterThanOrEqual(
      STAGE_RANK[rowAt(db, 'john-1-1').stage],
    );
  });

  it('P4 stage takes the higher rank when the local delta is ahead', () => {
    // A promotion that happened before hydration must still land.
    const db: ProgressMap = {
      'john-1-1': row({ stage: 'chunk_order', successes: 1, failures: 0 }),
    };
    const local: ProgressMap = {
      'john-1-1': row({ stage: 'fill_blank', successes: 1, failures: 0 }),
    };

    const r = rowAt(mergeLocalDeltas(db, local), 'john-1-1');
    expect(r.stage).toBe('fill_blank');
    expect(r.successes).toBe(2); // counts still add
  });

  it('P5 empty local deltas pass the DB map through unchanged', () => {
    const db: ProgressMap = {
      'a-1-1': row({ stage: 'review', successes: 4, failures: 1 }),
      'b-2-2': row({ stage: 'fill_blank', successes: 0, failures: 3 }),
    };

    const merged = mergeLocalDeltas(db, {});
    expect(Object.keys(merged)).toHaveLength(2);
    expect(rowAt(merged, 'a-1-1').successes).toBe(4);
    expect(rowAt(merged, 'b-2-2').failures).toBe(3);
    expect(rowAt(merged, 'b-2-2').stage).toBe('fill_blank');
  });

  it('P6 slugs only in the DB map survive a non-empty merge', () => {
    const db: ProgressMap = {
      'a-1-1': row({ stage: 'review', successes: 4, failures: 1 }),
      'b-2-2': row({ stage: 'fill_blank', successes: 0, failures: 3 }),
    };
    const local: ProgressMap = {
      'c-3-3': row({ stage: 'chunk_order', successes: 0, failures: 1 }),
    };

    const merged = mergeLocalDeltas(db, local);
    expect(Object.keys(merged)).toHaveLength(3);
    expect(rowAt(merged, 'a-1-1').successes).toBe(4); // untouched row is intact
  });

  it('P7 neither argument is mutated', () => {
    // `hydrate()` merges and publishes in three statements with no await between them. A merge
    // that wrote through to either input would make that sequence meaningless.
    const db: ProgressMap = {
      'x-1-1': row({ stage: 'fill_blank', successes: 2, failures: 1 }),
    };
    const local: ProgressMap = {
      'x-1-1': row({ stage: 'chunk_order', successes: 1, failures: 0 }),
    };
    const dbSnapshot = JSON.stringify(db);
    const localSnapshot = JSON.stringify(local);

    const merged = mergeLocalDeltas(db, local);
    expect(JSON.stringify(db)).toBe(dbSnapshot);
    expect(JSON.stringify(local)).toBe(localSnapshot);
    expect(rowAt(merged, 'x-1-1')).not.toBe(rowAt(db, 'x-1-1'));
  });

  it('P8 the four scheduling fields come from the DB row whenever one exists', () => {
    // The local side's values are unearned by construction: the client cannot compute a schedule.
    // `nextDueAt: null` on the DB row is the sharp case: it means "the server has not scheduled
    // this verse", so a `??` fallback would let the local guess pass itself off as a server answer.
    const db: ProgressMap = {
      'john-1-1': row({
        stage: 'review',
        successes: 3,
        masteryScore: 20,
        nextDueAt: null,
        lastReviewedAt: '2026-08-20T10:00:00.000Z',
        lapsedAt: '2026-08-20T10:00:00.000Z',
      }),
    };
    const local: ProgressMap = {
      'john-1-1': row({
        stage: 'chunk_order',
        successes: 1,
        masteryScore: 80,
        nextDueAt: '2026-09-30T00:00:00.000Z',
        lastReviewedAt: '2026-08-29T00:00:00.000Z',
        lapsedAt: null,
      }),
    };

    const r = rowAt(mergeLocalDeltas(db, local), 'john-1-1');
    expect(r.masteryScore).toBe(20); // mastery from the DB
    expect(r.nextDueAt).toBeNull(); // a DB null is not replaced by the local value
    expect(r.lastReviewedAt).toBe('2026-08-20T10:00:00.000Z');
    expect(r.lapsedAt).toBe('2026-08-20T10:00:00.000Z');
    expect(r.successes).toBe(4); // counts still add
  });

  it('P9 a slug with no DB row carries the local defaults through', () => {
    // The pre-hydration row for a brand-new verse: `0` / `null` across the board, which is what a
    // row the store has never seen should look like.
    const local: ProgressMap = {
      'john-3-16': row({ stage: 'chunk_order', failures: 1 }),
    };

    const r = rowAt(mergeLocalDeltas({}, local), 'john-3-16');
    expect(r.masteryScore).toBe(0);
    expect(r.nextDueAt).toBeNull();
    expect(r.lastReviewedAt).toBeNull();
    expect(r.lapsedAt).toBeNull();
  });
});

describe('adoptServerRow (progress-merge)', () => {
  it('P10 adoptServerRow returns the cached row unchanged for a null server row', () => {
    // A definer function that returns without assigning its row variable arrives as `null` over
    // PostgREST. It must not be able to blank the cache or throw inside the persist chain.
    const cached = row({ stage: 'fill_blank', successes: 2, failures: 1, masteryScore: 40 });

    expect(adoptServerRow(cached, null)).toBe(cached); // null server
    expect(adoptServerRow(cached, undefined)).toBe(cached); // undefined server
    expect(adoptServerRow(undefined, null)).toBeUndefined(); // nothing on either side
  });

  it('P11 adoptServerRow takes a copy of the server row when nothing is cached', () => {
    const server = row({ stage: 'review', successes: 6, masteryScore: 100 });

    const next = must(adoptServerRow(undefined, server), 'adopted row');
    expect(next.successes).toBe(6);
    expect(next.masteryScore).toBe(100);
    expect(next).not.toBe(server); // the server row is copied, not aliased
  });

  it('P12 adoptServerRow never moves a counter backwards', () => {
    // The cache runs ahead of the server exactly while a second write for the same slug is queued
    // behind this one. Taking the server value flat would flicker the count down on screen and
    // then back up.
    const cached = row({ stage: 'full_recall', successes: 4, failures: 2 });
    const server = row({ stage: 'full_recall', successes: 3, failures: 2 });

    const next = must(adoptServerRow(cached, server), 'adopted row');
    expect(next.successes).toBe(4); // cached ahead wins
    expect(next.failures).toBe(2); // equal is equal
  });

  it('P13 adoptServerRow takes the higher stage rank', () => {
    // Two promotions queued: link 1 legitimately returns a stage the cache has already passed, so
    // the server row must not demote it.
    const ahead = must(
      adoptServerRow(row({ stage: 'full_recall', successes: 3 }), row({ stage: 'fill_blank', successes: 3 })),
      'adopted row',
    );
    expect(ahead.stage).toBe('full_recall'); // cache ahead holds

    const behind = must(
      adoptServerRow(row({ stage: 'chunk_order', successes: 1 }), row({ stage: 'fill_blank', successes: 1 })),
      'adopted row',
    );
    expect(behind.stage).toBe('fill_blank'); // server ahead is adopted
  });

  it('P14 adoptServerRow takes the four scheduling fields from the server, always', () => {
    // Including when they move "backwards": a failure drops mastery and clears nothing but the
    // schedule, and the cache has no standing to object.
    const cached = row({
      stage: 'review',
      successes: 5,
      masteryScore: 100,
      nextDueAt: '2026-09-14T00:00:00.000Z',
      lastReviewedAt: '2026-08-29T00:00:00.000Z',
      lapsedAt: null,
    });
    const server = row({
      stage: 'review',
      successes: 5,
      failures: 1,
      masteryScore: 40,
      nextDueAt: '2026-08-30T00:00:00.000Z',
      lastReviewedAt: '2026-08-30T00:00:00.000Z',
      lapsedAt: '2026-08-30T00:00:00.000Z',
    });

    const next = must(adoptServerRow(cached, server), 'adopted row');
    expect(next.masteryScore).toBe(40); // mastery drops with the server
    expect(next.nextDueAt).toBe('2026-08-30T00:00:00.000Z'); // schedule pulled in
    expect(next.lastReviewedAt).toBe('2026-08-30T00:00:00.000Z');
    expect(next.lapsedAt).toBe('2026-08-30T00:00:00.000Z'); // a lapse the cache did not know about
  });

  it('P15 adoptServerRow mutates neither argument', () => {
    const cached = row({ stage: 'fill_blank', successes: 2, masteryScore: 20 });
    const server = row({ stage: 'full_recall', successes: 3, masteryScore: 40 });
    const cachedSnapshot = JSON.stringify(cached);
    const serverSnapshot = JSON.stringify(server);

    const next = adoptServerRow(cached, server);
    expect(JSON.stringify(cached)).toBe(cachedSnapshot);
    expect(JSON.stringify(server)).toBe(serverSnapshot);
    expect(next).not.toBe(cached);
    expect(next).not.toBe(server); // result is a new object
  });
});

describe('grantedStage (progress-merge)', () => {
  it('P16 grantedStage advances exactly one rank up the honest ladder', () => {
    // The shape every real pass has: recordAttempt has already incremented `successes` in the
    // cache, so the rank being claimed is paid for.
    expect(grantedStage(row({ stage: 'chunk_order', successes: 1 }), 'fill_blank')).toBe('fill_blank'); // rank 1
    expect(grantedStage(row({ stage: 'fill_blank', successes: 2 }), 'full_recall')).toBe('full_recall'); // rank 2
    expect(grantedStage(row({ stage: 'full_recall', successes: 3 }), 'review')).toBe('review'); // rank 3
  });

  it('P17 grantedStage refuses a skip-ahead, which is what /verses makes reachable', () => {
    // The two-tap path: 整节背诵 on an untouched verse, passed. The server's one-rank clamp declines
    // it and stores `chunk_order`; if the cache claimed `review` anyway, adoptServerRow's
    // higher-rank rule would keep the claim for the rest of the session and the dashboard would
    // count the verse as learned until the next hard load silently un-learned it.
    expect(grantedStage(row({ stage: 'chunk_order', successes: 1 }), 'review')).toBe('chunk_order'); // three ranks up
    expect(grantedStage(row({ stage: 'chunk_order', successes: 1 }), 'full_recall')).toBe('chunk_order'); // two ranks up
  });

  it('P18 grantedStage never demotes, and never grants an unpaid rank', () => {
    expect(grantedStage(row({ stage: 'review', successes: 9 }), 'fill_blank')).toBe('review'); // no demotion
    expect(grantedStage(row({ stage: 'review', successes: 9 }), 'review')).toBe('review'); // idempotent at the top
    // An imported row carries no counters, so it re-earns every rank above where it was imported:
    // the SQL's third condition.
    expect(grantedStage(row({ stage: 'full_recall', successes: 0 }), 'review')).toBe('full_recall'); // unpaid rank
    expect(grantedStage(row({ stage: 'full_recall', successes: 3 }), 'review')).toBe('review'); // paid for
  });

  it('P19 grantedStage on a verse the cache has never seen', () => {
    // Rank 0 costs nothing, so a first chunk_order claim stands. Anything above it waits for the
    // row the chained recordAttempt is about to create: the server may grant more on its insert
    // branch, and that arrives through adoptServerRow rather than being guessed at here.
    expect(grantedStage(undefined, 'chunk_order')).toBe('chunk_order'); // rank 0 on an absent row
    expect(grantedStage(undefined, 'fill_blank')).toBe('chunk_order'); // anything higher waits
  });
});
