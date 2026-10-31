// Acceptance test for SM-1 (Surprise me): the pure chapter picker. Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

const mod = { exports: {} };
vm.runInNewContext(ts.transpileModule(
  fs.readFileSync('src/features/progress/surprise.ts', 'utf8'),
  { compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 } },
).outputText, { module: mod, exports: mod.exports, require });
const { chapterReadKey, SURPRISE_UNREAD_WEIGHT } = mod.exports;
// The module runs in another vm realm; copy each pick into this realm so strict deep-equal compares values only.
const pickSurpriseChapter = (...args) => ({ ...mod.exports.pickSurpriseChapter(...args) });

const COUNTS = [50, 40, 27, 36, 34, 24, 21, 4, 31, 24, 22, 25, 29, 36, 10, 13, 10, 42, 150, 31, 12, 8, 66, 52, 5, 48, 12, 14, 3, 9, 1, 4, 7, 3, 3, 3, 2, 14, 4, 28, 16, 24, 21, 28, 16, 16, 13, 6, 6, 4, 4, 5, 3, 6, 4, 3, 1, 13, 5, 5, 3, 5, 1, 1, 1, 22];
const BIBLE = COUNTS.map((total_chapters, i) => ({ book_number: i + 1, total_chapters }));
const allKeys = books => books.flatMap(b => Array.from({ length: b.total_chapters }, (_, i) => chapterReadKey(b.book_number, i + 1)));

/** Returns the given values in order; fails the test if the picker asks for more. */
const script = (...values) => () => {
  assert.ok(values.length > 0, 'picker drew more random numbers than the spec allows');
  return values.shift();
};
/** Deterministic pseudo-random source for the statistical checks. */
function lcg(seed) {
  let s = seed >>> 0;
  return () => ((s = (Math.imul(s, 1664525) + 1013904223) >>> 0) / 2 ** 32);
}

test('chapterReadKey is "book:chapter", translation-agnostic', () => {
  assert.equal(chapterReadKey(43, 3), '43:3');
  assert.equal(SURPRISE_UNREAD_WEIGHT, 0.9);
});

test('unread branch: the only unread chapter is chosen (draws: branch, book, chapter)', () => {
  const read = new Set(allKeys(BIBLE).filter(k => k !== '43:3'));
  const pick = pickSurpriseChapter(BIBLE, read, { book_number: 1, chapter: 1 }, script(0.5, 0.0, 0.0));
  assert.deepEqual(pick, { book_number: 43, chapter: 3 });
});

test('unread branch picks a book first, so a one-chapter book is as likely as a long one', () => {
  const books = [{ book_number: 1, total_chapters: 50 }, { book_number: 2, total_chapters: 1 }];
  assert.deepEqual(pickSurpriseChapter(books, new Set(), null, script(0.1, 0.99, 0.0)), { book_number: 2, chapter: 1 });
  assert.deepEqual(pickSurpriseChapter(books, new Set(), null, script(0.1, 0.0, 0.5)), { book_number: 1, chapter: 26 });
  const rnd = lcg(7);
  let second = 0;
  for (let i = 0; i < 4000; i++) if (pickSurpriseChapter(books, new Set(), null, rnd).book_number === 2) second++;
  // 0.9 × 1/2 + 0.1 × 1/51 ≈ 0.452
  assert.ok(second / 4000 > 0.42 && second / 4000 < 0.49, `book 2 share ${second / 4000}`);
});

test('unread chapters within a book are taken in canonical order', () => {
  const books = [{ book_number: 5, total_chapters: 4 }];
  const read = new Set(['5:2']);
  // unread = [1, 3, 4]; floor(0.5 × 3) = 1 → chapter 3
  assert.deepEqual(pickSurpriseChapter(books, read, null, script(0.0, 0.0, 0.5)), { book_number: 5, chapter: 3 });
});

test('any-chapter branch (draw ≥ 0.9): uniform over every chapter in canonical order (draws: branch, chapter)', () => {
  const books = [{ book_number: 1, total_chapters: 3 }];
  assert.deepEqual(pickSurpriseChapter(books, new Set(), null, script(0.95, 0.5)), { book_number: 1, chapter: 2 });
  const two = [{ book_number: 1, total_chapters: 2 }, { book_number: 2, total_chapters: 2 }];
  assert.deepEqual(pickSurpriseChapter(two, new Set(), null, script(0.9, 0.75)), { book_number: 2, chapter: 2 });
});

test('everything read: falls back to any chapter, using the next draw', () => {
  const books = [{ book_number: 1, total_chapters: 3 }];
  const read = new Set(allKeys(books));
  // pool excludes the current chapter 1 → [2, 3]; floor(0.99 × 2) = 1 → chapter 3
  assert.deepEqual(pickSurpriseChapter(books, read, { book_number: 1, chapter: 1 }, script(0.2, 0.99)), { book_number: 1, chapter: 3 });
});

test('never returns the current chapter', () => {
  const books = [{ book_number: 1, total_chapters: 1 }, { book_number: 2, total_chapters: 1 }];
  const rnd = lcg(11);
  for (let i = 0; i < 500; i++) {
    assert.deepEqual(pickSurpriseChapter(books, new Set(), { book_number: 1, chapter: 1 }, rnd), { book_number: 2, chapter: 1 });
    assert.deepEqual(pickSurpriseChapter(books, new Set(['2:1']), { book_number: 1, chapter: 1 }, rnd), { book_number: 2, chapter: 1 });
  }
});

test('a single-chapter Bible with that chapter current returns it rather than failing', () => {
  const books = [{ book_number: 1, total_chapters: 1 }];
  assert.deepEqual(pickSurpriseChapter(books, new Set(), { book_number: 1, chapter: 1 }, lcg(1)), { book_number: 1, chapter: 1 });
});

test('weighting: with one chapter unread it is chosen about 90% of the time', () => {
  const read = new Set(allKeys(BIBLE).filter(k => k !== '31:1'));
  const rnd = lcg(42);
  let hits = 0;
  for (let i = 0; i < 4000; i++) {
    const p = pickSurpriseChapter(BIBLE, read, null, rnd);
    assert.ok(p.chapter >= 1 && p.chapter <= COUNTS[p.book_number - 1]);
    if (p.book_number === 31 && p.chapter === 1) hits++;
  }
  assert.ok(hits / 4000 > 0.88 && hits / 4000 < 0.92, `unread share ${hits / 4000}`);
});

test('read keys for chapters outside the catalog are ignored', () => {
  const books = [{ book_number: 1, total_chapters: 2 }];
  assert.deepEqual(pickSurpriseChapter(books, new Set(['99:1', '1:7', '1:1']), null, script(0.0, 0.0, 0.0)), { book_number: 1, chapter: 2 });
});
