/**
 * Acceptance tests for the daily lesson's pure pieces: step grading, the local-date parser, the
 * step-index helpers, the session navigation that stopped free practice from handing out
 * `/memory?completed=1`, and the local week strip (days before signup are not misses).
 * Ported from Little Lamb's tests/daily-lesson.ts (ids kept; server-only C1-C4 and F1-F5 are in
 * the not-ported list, see the report).
 */
import { gradeStep } from '../grading';
import { MANDARIN_SYNC_KEYER } from '../speech/keyer';
import {
  firstIncompleteIndex,
  isValidStepIndex,
  parseLocalDate,
  parseStepIndex,
  type LessonStep,
} from '../lessonPlan';
import { isPreSignupDay, toLocalDateString } from '../localDate';
import { getAllMemoryVerses } from '../library';
import { getNextStep } from '../session';
import type { MemoryVerse, SessionItem } from '../types';

/** Index reads are `T | undefined` under noUncheckedIndexedAccess; a missing entry is a broken fixture. */
function must<T>(value: T | undefined, what = 'value'): T {
  if (value === undefined) throw new Error(`missing ${what}`);
  return value;
}

// A verse with enough chunks to reorder meaningfully.
const verse: MemoryVerse = must(
  getAllMemoryVerses().find((v: MemoryVerse) => v.chunks.length >= 2),
  'multi-chunk verse in the library',
);

describe('gradeStep, chunk-order (daily-lesson)', () => {
  it('A1 identity permutation passes', () => {
    const order = verse.chunks.map((_, i) => i);
    const r = gradeStep(verse.id, 'chunk-order', { kind: 'chunk-order', order });
    expect(r.passed).toBe(true);
    expect(r.matchPct).toBe(100);
  });

  it('A2 swapped chunks fail', () => {
    // Swap the first two positions by building the order with map, which stays typed under
    // noUncheckedIndexedAccess.
    const order = verse.chunks.map((_, i) => (i === 0 ? 1 : i === 1 ? 0 : i));
    const r = gradeStep(verse.id, 'chunk-order', { kind: 'chunk-order', order });
    expect(r.passed).toBe(false);
  });

  it('A3 short order is rejected, not merely failed', () => {
    const r = gradeStep(verse.id, 'chunk-order', { kind: 'chunk-order', order: [0] });
    expect(r.passed).toBe(false);
    expect(r.error).toBeTruthy();
  });

  it('A4 a recall answer cannot satisfy a chunk-order step', () => {
    const r = gradeStep(verse.id, 'chunk-order', { kind: 'recall', transcript: verse.textZh });
    expect(r.passed).toBe(false);
    expect(r.error).toBeTruthy();
  });
});

describe('gradeStep, recall stages (daily-lesson)', () => {
  it('B1 the verse text with its reference passes full-recall', () => {
    const r = gradeStep(verse.id, 'full-recall', {
      kind: 'recall',
      transcript: `${verse.referenceZh}。${verse.textZh}`,
    });
    expect(r.passed).toBe(true);
  });

  it('B2 unrelated text fails full-recall', () => {
    const r = gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript: '今天天气很好' });
    expect(r.passed).toBe(false);
  });

  it('B3 an empty transcript fails rather than passing vacuously', () => {
    const r = gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript: '   ' });
    expect(r.passed).toBe(false);
    expect(r.matchPct).toBe(0);
  });

  it('B4 the hidden chunk passes fill-blank at its own position', () => {
    const chunk = must(verse.chunks[1], 'chunk 1');
    const r = gradeStep(verse.id, 'fill-blank', {
      kind: 'recall',
      transcript: chunk,
      chunkPosition: 1,
    });
    expect(r.passed).toBe(true);
  });

  it('B5 an out-of-range chunkPosition is rejected', () => {
    const r = gradeStep(verse.id, 'fill-blank', {
      kind: 'recall',
      transcript: must(verse.chunks[0], 'chunk 0'),
      chunkPosition: verse.chunks.length + 5,
    });
    expect(r.passed).toBe(false);
    expect(r.error).toBeTruthy();
  });

  it('B6 fill-blank without a chunkPosition is rejected', () => {
    const r = gradeStep(verse.id, 'fill-blank', {
      kind: 'recall',
      transcript: must(verse.chunks[0], 'chunk 0'),
    });
    expect(r.passed).toBe(false);
  });

  it('B7 an unknown verse is rejected', () => {
    const r = gradeStep('not-a-real-verse', 'full-recall', { kind: 'recall', transcript: '任意' });
    expect(r.passed).toBe(false);
    expect(r.error).toBeTruthy();
  });

  it('B8 a missing answer is rejected', () => {
    const r = gradeStep(verse.id, 'full-recall', undefined);
    expect(r.passed).toBe(false);
    expect(r.error).toBeTruthy();
  });

  it('B9 the explicit Mandarin keyer is the omitted-argument default (full-recall)', () => {
    const answer = { kind: 'recall' as const, transcript: verse.textZh };
    expect(gradeStep(verse.id, 'full-recall', answer, MANDARIN_SYNC_KEYER)).toEqual(
      gradeStep(verse.id, 'full-recall', answer),
    );
  });

  it('B10 the explicit Mandarin keyer is the omitted-argument default (fill-blank)', () => {
    const answer = {
      kind: 'recall' as const,
      transcript: must(verse.chunks[0], 'chunk 0'),
      chunkPosition: 0,
    };
    expect(gradeStep(verse.id, 'fill-blank', answer, MANDARIN_SYNC_KEYER)).toEqual(
      gradeStep(verse.id, 'fill-blank', answer),
    );
  });
});

describe('lesson date parsing (daily-lesson)', () => {
  it('C5 a lesson date parses to local midnight, not UTC', () => {
    const d = parseLocalDate('2026-08-01');
    expect(d.getFullYear()).toBe(2026);
    expect(d.getMonth()).toBe(7);
    expect(d.getDate()).toBe(1);
  });
});

describe('step-index helpers (daily-lesson)', () => {
  it('D1 step indices are bounded non-negative integers', () => {
    expect(isValidStepIndex(0)).toBe(true);
    expect(isValidStepIndex(3)).toBe(true);
    expect(isValidStepIndex(-1)).toBe(false);
    expect(isValidStepIndex(999)).toBe(false); // past the plan ceiling
    expect(isValidStepIndex(1.5)).toBe(false); // fractional
    expect(isValidStepIndex('2')).toBe(false); // string
  });

  it('D2 parseStepIndex reads ?i= and rejects junk', () => {
    expect(parseStepIndex('2')).toBe(2); // numeric
    expect(parseStepIndex(['3'])).toBe(3); // array form
    expect(parseStepIndex(undefined)).toBeNull(); // absent
    expect(parseStepIndex('abc')).toBeNull(); // prose
    expect(parseStepIndex('-1')).toBeNull(); // negative
  });

  it('D3 firstIncompleteIndex finds the resume point', () => {
    const steps = (done: boolean[]): LessonStep[] =>
      done.map((completed, index) => ({ index, verseId: verse.id, stage: 'full-recall', completed }));
    expect(firstIncompleteIndex(steps([false, false]))).toBe(0); // nothing done
    expect(firstIncompleteIndex(steps([true, false, false]))).toBe(1); // one done
    expect(firstIncompleteIndex(steps([true, true]))).toBeNull(); // all done
  });
});

describe('session navigation (daily-lesson)', () => {
  // The origin of the bookmarked `?completed=1`.
  it('E1 free practice (no session) never links to ?completed=1', () => {
    const next = getNextStep([], 0);
    expect(next.href).toBe('/study/memory'); // Memory home sits in the Study tab's stack (MEM screens)
    expect(next.kind).toBe('done');
    expect(next.isLast).toBe(false); // a session-less step is not a last step
  });

  it('E2 the last step of a real session still asks to celebrate', () => {
    const items: SessionItem[] = [
      { verseId: verse.id, stage: 'chunk-order' },
      { verseId: verse.id, stage: 'fill-blank' },
    ];
    const next = getNextStep(items, 1);
    expect(next.href).toBe('/memory/complete'); // the lesson's end screen decides: complete, or N steps left
    expect(next.kind).toBe('done');
    expect(next.isLast).toBe(true);
  });

  it('E3 a mid-session step links to the following step', () => {
    const items: SessionItem[] = [
      { verseId: verse.id, stage: 'chunk-order' },
      { verseId: verse.id, stage: 'fill-blank' },
    ];
    const next = getNextStep(items, 0);
    expect(next.kind).toBe('next');
    expect(next.href.startsWith(`/memory/lesson/${verse.id}/fill-blank?`)).toBe(true);
    expect(next.href).toContain('i=1'); // carries the next index
    expect(next.isLast).toBe(false);
  });
});

describe('week strip: pre-signup days are not misses (daily-lesson)', () => {
  it('F6 a day before the signup day is a placeholder, the signup day is not', () => {
    // Noon local, so the instant is unambiguously inside the local day in every timezone this can
    // run in.
    const signup = new Date(2026, 8, 14, 12, 0, 0);
    const signupKey = toLocalDateString(signup);
    const dayBefore = new Date(2026, 8, 13, 12, 0, 0);
    const dayAfter = new Date(2026, 8, 15, 12, 0, 0);
    const createdAt = signup.toISOString();

    expect(isPreSignupDay(toLocalDateString(dayBefore), createdAt)).toBe(true); // day before
    expect(isPreSignupDay(signupKey, createdAt)).toBe(false); // signup day itself
    expect(isPreSignupDay(toLocalDateString(dayAfter), createdAt)).toBe(false); // day after
  });

  it('F7 a signup late in the local day still counts that whole local day', () => {
    // 23:30 local is already the NEXT UTC date east of ~UTC+0.5, which is exactly the case UTC
    // date math gets wrong: it would blank out a real day.
    const signup = new Date(2026, 8, 14, 23, 30, 0);
    const createdAt = signup.toISOString();
    expect(isPreSignupDay(toLocalDateString(signup), createdAt)).toBe(false); // signup day
    expect(isPreSignupDay(toLocalDateString(new Date(2026, 8, 13, 12, 0, 0)), createdAt)).toBe(true); // day before is still pre-signup
    // And the mirror case: 00:30 local, which is the PREVIOUS UTC date west of UTC.
    const early = new Date(2026, 8, 14, 0, 30, 0);
    expect(isPreSignupDay(toLocalDateString(early), early.toISOString())).toBe(false); // early signup day
  });

  it('F8 a missing or unparseable created_at never hides a miss', () => {
    const key = toLocalDateString(new Date(2026, 0, 1, 12, 0, 0));
    expect(isPreSignupDay(key, null)).toBe(false);
    expect(isPreSignupDay(key, undefined)).toBe(false);
    expect(isPreSignupDay(key, '')).toBe(false);
    expect(isPreSignupDay(key, 'not-a-date')).toBe(false);
  });

  it('F9 the comparison is calendar order across month and year rollovers', () => {
    const signup = new Date(2026, 0, 1, 12, 0, 0).toISOString();
    expect(isPreSignupDay('2025-12-31', signup)).toBe(true); // previous year
    expect(isPreSignupDay('2026-01-09', signup)).toBe(false); // single-digit day, later
    expect(isPreSignupDay('2025-09-14', signup)).toBe(true); // earlier month, zero-padded
  });
});
