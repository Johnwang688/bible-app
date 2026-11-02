// Acceptance (orchestrator-owned): "Surprise me", the pure chapter picker. Ported from the old app's SM-1
// acceptance and review tests (frontend-next/review-tests/surprise.test.cjs, sm1-order-review.test.cjs).
// The order of random() draws is part of the contract: draw 1 chooses the branch, then one or two more choose
// the chapter.
import { CHAPTER_COUNTS, chapterKey } from '../../storage/keys';
import { pickSurpriseChapter, SURPRISE_UNREAD_WEIGHT, type SurpriseBook } from '../surprise';

const BIBLE: SurpriseBook[] = CHAPTER_COUNTS.map((total_chapters, i) => ({ book_number: i + 1, total_chapters }));
const allKeys = (books: readonly SurpriseBook[]) =>
  books.flatMap((b) => Array.from({ length: b.total_chapters }, (_, i) => chapterKey(b.book_number, i + 1)));

/** Returns the given values in order; fails the test if the picker asks for more. */
const script = (...values: number[]) => () => {
  if (values.length === 0) throw new Error('picker drew more random numbers than the spec allows');
  return values.shift()!;
};
/** Deterministic pseudo-random source for the statistical checks. */
function lcg(seed: number) {
  let s = seed >>> 0;
  return () => (s = (Math.imul(s, 1664525) + 1013904223) >>> 0) / 2 ** 32;
}

it('weights unread chapters at 0.9', () => {
  expect(SURPRISE_UNREAD_WEIGHT).toBe(0.9);
});

it('unread branch: the only unread chapter is chosen (draws: branch, book, chapter)', () => {
  const read = new Set(allKeys(BIBLE).filter((k) => k !== '43:3'));
  expect(pickSurpriseChapter(BIBLE, read, { bookNumber: 1, chapter: 1 }, script(0.5, 0.0, 0.0))).toEqual({
    bookNumber: 43,
    chapter: 3,
  });
});

it('unread branch picks a book first, so a one-chapter book is as likely as a long one', () => {
  const books = [
    { book_number: 1, total_chapters: 50 },
    { book_number: 2, total_chapters: 1 },
  ];
  expect(pickSurpriseChapter(books, new Set(), null, script(0.1, 0.99, 0.0))).toEqual({ bookNumber: 2, chapter: 1 });
  expect(pickSurpriseChapter(books, new Set(), null, script(0.1, 0.0, 0.5))).toEqual({ bookNumber: 1, chapter: 26 });
  const rnd = lcg(7);
  let second = 0;
  for (let i = 0; i < 4000; i++) if (pickSurpriseChapter(books, new Set(), null, rnd)!.bookNumber === 2) second++;
  // 0.9 × 1/2 + 0.1 × 1/51 ≈ 0.452
  expect(second / 4000).toBeGreaterThan(0.42);
  expect(second / 4000).toBeLessThan(0.49);
});

it('unread chapters within a book are taken in canonical order', () => {
  const books = [{ book_number: 5, total_chapters: 4 }];
  // unread = [1, 3, 4]; floor(0.5 × 3) = 1 → chapter 3
  expect(pickSurpriseChapter(books, new Set(['5:2']), null, script(0.0, 0.0, 0.5))).toEqual({ bookNumber: 5, chapter: 3 });
});

it('any-chapter branch (draw ≥ 0.9): uniform over every chapter in canonical order (draws: branch, chapter)', () => {
  expect(pickSurpriseChapter([{ book_number: 1, total_chapters: 3 }], new Set(), null, script(0.95, 0.5))).toEqual({
    bookNumber: 1,
    chapter: 2,
  });
  const two = [
    { book_number: 1, total_chapters: 2 },
    { book_number: 2, total_chapters: 2 },
  ];
  expect(pickSurpriseChapter(two, new Set(), null, script(0.9, 0.75))).toEqual({ bookNumber: 2, chapter: 2 });
});

it('everything read: falls back to any chapter, using the next draw', () => {
  const books = [{ book_number: 1, total_chapters: 3 }];
  // pool excludes the current chapter 1 → [2, 3]; floor(0.99 × 2) = 1 → chapter 3
  expect(pickSurpriseChapter(books, new Set(allKeys(books)), { bookNumber: 1, chapter: 1 }, script(0.2, 0.99))).toEqual({
    bookNumber: 1,
    chapter: 3,
  });
});

it('never returns the current chapter', () => {
  const books = [
    { book_number: 1, total_chapters: 1 },
    { book_number: 2, total_chapters: 1 },
  ];
  const rnd = lcg(11);
  for (let i = 0; i < 500; i++) {
    expect(pickSurpriseChapter(books, new Set(), { bookNumber: 1, chapter: 1 }, rnd)).toEqual({ bookNumber: 2, chapter: 1 });
    expect(pickSurpriseChapter(books, new Set(['2:1']), { bookNumber: 1, chapter: 1 }, rnd)).toEqual({ bookNumber: 2, chapter: 1 });
  }
});

it('a single-chapter Bible with that chapter current returns it rather than failing', () => {
  const books = [{ book_number: 1, total_chapters: 1 }];
  expect(pickSurpriseChapter(books, new Set(), { bookNumber: 1, chapter: 1 }, lcg(1))).toEqual({ bookNumber: 1, chapter: 1 });
});

it('weighting: with one chapter unread it is chosen about 90% of the time', () => {
  const read = new Set(allKeys(BIBLE).filter((k) => k !== '31:1'));
  const rnd = lcg(42);
  let hits = 0;
  for (let i = 0; i < 4000; i++) {
    const p = pickSurpriseChapter(BIBLE, read, null, rnd)!;
    expect(p.chapter).toBeGreaterThanOrEqual(1);
    expect(p.chapter).toBeLessThanOrEqual(CHAPTER_COUNTS[p.bookNumber - 1]!);
    if (p.bookNumber === 31 && p.chapter === 1) hits++;
  }
  expect(hits / 4000).toBeGreaterThan(0.88);
  expect(hits / 4000).toBeLessThan(0.92);
});

it('read keys for chapters outside the catalogue are ignored', () => {
  const books = [{ book_number: 1, total_chapters: 2 }];
  expect(pickSurpriseChapter(books, new Set(['99:1', '1:7', '1:1']), null, script(0.0, 0.0, 0.0))).toEqual({
    bookNumber: 1,
    chapter: 2,
  });
});

it('both branches keep the catalogue order they were given (SM-1 review F3)', () => {
  const books = [
    { book_number: 43, total_chapters: 1 },
    { book_number: 1, total_chapters: 1 },
  ];
  for (const draws of [
    [0.1, 0, 0],
    [0.95, 0],
  ]) {
    expect(pickSurpriseChapter(books, new Set(), null, script(...draws))).toEqual({ bookNumber: 43, chapter: 1 });
  }
});

it('an empty catalogue (books not loaded) returns null instead of throwing (SM-1 review F1)', () => {
  expect(pickSurpriseChapter([], new Set(), null, lcg(3))).toBeNull();
  expect(pickSurpriseChapter([], new Set(), { bookNumber: 43, chapter: 3 }, lcg(3))).toBeNull();
});

it('returns a fresh object, never the `current` argument itself', () => {
  const current = { bookNumber: 1, chapter: 1 };
  const pick = pickSurpriseChapter([{ book_number: 1, total_chapters: 1 }], new Set(), current, lcg(1));
  expect(pick).toEqual(current);
  expect(pick).not.toBe(current);
});
