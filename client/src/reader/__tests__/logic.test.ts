// Acceptance (orchestrator-owned): the reader's pure logic.
import * as fs from 'fs';
import * as path from 'path';

import type { BookInfo, VerseOut } from '../../api/schemas';
import { alignVerses } from '../align';
import { splitAlternateReadings } from '../alternateReadings';
import { bookName, bookNameForLocale, findBook } from '../books';
import { clampPosition, nextPosition, prevPosition } from '../navigation';

const BOOKS: BookInfo[] = JSON.parse(
  fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8'),
).body;

const verse = (n: number, text = `v${n}`, translation = 'BSB'): VerseOut => ({
  id: n,
  book: 'John',
  book_number: 43,
  chapter: 3,
  verse: n,
  text,
  translation,
});

describe('navigation', () => {
  it('moves within a book', () => {
    expect(nextPosition(BOOKS, { bookNumber: 43, chapter: 3 })).toEqual({ bookNumber: 43, chapter: 4 });
    expect(prevPosition(BOOKS, { bookNumber: 43, chapter: 3 })).toEqual({ bookNumber: 43, chapter: 2 });
  });

  it('crosses book boundaries both ways', () => {
    expect(nextPosition(BOOKS, { bookNumber: 40, chapter: 28 })).toEqual({ bookNumber: 41, chapter: 1 });
    expect(prevPosition(BOOKS, { bookNumber: 41, chapter: 1 })).toEqual({ bookNumber: 40, chapter: 28 });
    expect(nextPosition(BOOKS, { bookNumber: 31, chapter: 1 })).toEqual({ bookNumber: 32, chapter: 1 });
  });

  it('stops at Genesis 1 and Revelation 22', () => {
    expect(prevPosition(BOOKS, { bookNumber: 1, chapter: 1 })).toBeNull();
    expect(nextPosition(BOOKS, { bookNumber: 66, chapter: 22 })).toBeNull();
  });

  it('never throws before the book list loads (PF-2 F1)', () => {
    expect(nextPosition(undefined, { bookNumber: 43, chapter: 3 })).toBeNull();
    expect(prevPosition([], { bookNumber: 43, chapter: 3 })).toBeNull();
    expect(clampPosition(undefined, { bookNumber: 43, chapter: 3 })).toEqual({ bookNumber: 43, chapter: 3 });
  });

  it('clamps a stored position the book cannot have', () => {
    expect(clampPosition(BOOKS, { bookNumber: 31, chapter: 9 })).toEqual({ bookNumber: 31, chapter: 1 });
    expect(clampPosition(BOOKS, { bookNumber: 99, chapter: 2 })).toEqual({ bookNumber: 1, chapter: 1 });
    expect(clampPosition(BOOKS, { bookNumber: 19, chapter: 150 })).toEqual({ bookNumber: 19, chapter: 150 });
  });
});

describe('alignVerses', () => {
  it('pairs verses by number', () => {
    const rows = alignVerses([verse(1), verse(2)], [verse(1, 'a', 'CUV'), verse(2, 'b', 'CUV')]);
    expect(rows.map((r) => [r.verse, r.primary?.text, r.secondary?.text])).toEqual([
      [1, 'v1', 'a'],
      [2, 'v2', 'b'],
    ]);
  });

  it('leaves a gap on the side that lacks a verse, never shifting the rest', () => {
    const rows = alignVerses([verse(1), verse(2), verse(3), verse(4)], [verse(1, 'a'), verse(3, 'c'), verse(4, 'd')]);
    expect(rows.map((r) => [r.verse, r.primary?.text ?? null, r.secondary?.text ?? null])).toEqual([
      [1, 'v1', 'a'],
      [2, 'v2', null],
      [3, 'v3', 'c'],
      [4, 'v4', 'd'],
    ]);
  });

  it('keeps verses only the second translation has, in verse order', () => {
    const rows = alignVerses([verse(1), verse(3)], [verse(2, 'b'), verse(1, 'a'), verse(3, 'c')]);
    expect(rows.map((r) => [r.verse, r.primary?.text ?? null, r.secondary?.text ?? null])).toEqual([
      [1, 'v1', 'a'],
      [2, null, 'b'],
      [3, 'v3', 'c'],
    ]);
  });

  it('works with no second translation', () => {
    expect(alignVerses([verse(1)], []).map((r) => [r.verse, r.secondary])).toEqual([[1, null]]);
  });
});

describe('splitAlternateReadings', () => {
  it('marks CUV 〔或作〕 notes so they can be drawn smaller', () => {
    expect(splitAlternateReadings('叫一切信他的都得永生〔或作：叫一切信的人在他里面得永生〕。」')).toEqual([
      { text: '叫一切信他的都得永生', note: false },
      { text: '〔或作：叫一切信的人在他里面得永生〕', note: true },
      { text: '。」', note: false },
    ]);
  });

  it('handles several notes, a note at the start, and plain text', () => {
    expect(splitAlternateReadings('〔甲〕乙〔丙〕')).toEqual([
      { text: '〔甲〕', note: true },
      { text: '乙', note: false },
      { text: '〔丙〕', note: true },
    ]);
    expect(splitAlternateReadings('For God so loved the world')).toEqual([{ text: 'For God so loved the world', note: false }]);
    expect(splitAlternateReadings('')).toEqual([]);
  });

  it('leaves an unclosed bracket as plain text', () => {
    expect(splitAlternateReadings('甲〔乙')).toEqual([{ text: '甲〔乙', note: false }]);
  });
});

describe('book names', () => {
  const john = findBook(BOOKS, 43)!;
  it('follow the translation in the reader', () => {
    expect(bookName(john, 'BSB')).toBe('John');
    expect(bookName(john, 'CUV-SIMP')).toBe('约翰福音');
    expect(bookName(john, 'CUV')).toBe('約翰福音');
  });

  it('follow the interface language elsewhere', () => {
    expect(bookNameForLocale(john, 'en')).toBe('John');
    expect(bookNameForLocale(john, 'zh-Hans')).toBe('约翰福音');
  });

  it('fall back to the English name when a Chinese name is missing', () => {
    const bare: BookInfo = { ...john, name_zh: null, name_zh_simplified: undefined };
    expect(bookName(bare, 'CUV')).toBe('John');
    expect(bookNameForLocale(bare, 'zh-Hans')).toBe('John');
  });

  it('finds books by number', () => {
    expect(findBook(BOOKS, 1)?.name).toBe('Genesis');
    expect(findBook(BOOKS, 67)).toBeUndefined();
    expect(findBook(undefined, 1)).toBeUndefined();
  });
});
