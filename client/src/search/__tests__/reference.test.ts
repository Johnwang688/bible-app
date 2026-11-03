// Acceptance (orchestrator-owned, R-5a): the reference parser. Ported from the old frontend's
// `parseReferenceLabel` (frontend-next/src/lib/scriptureReference.ts, which had no tests of its own) and
// extended to abbreviations, joined forms ("jn3"), spaces as separators ("jn 3 16"), and Chinese names.
import * as fs from 'fs';
import * as path from 'path';

import type { BookInfo } from '../../api/schemas';
import { buildBookIndex, parseReference, suggestPassages, type PassageRef } from '../reference';

const BOOKS: BookInfo[] = JSON.parse(
  fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8'),
).body;
const index = buildBookIndex(BOOKS);
const p = (q: string) => parseReference(q, index);
const ref = (bookNumber: number, chapter?: number, start?: number, end?: number): PassageRef => {
  const r: PassageRef = { bookNumber };
  if (chapter !== undefined) r.chapter = chapter;
  if (start !== undefined) r.start = start;
  if (end !== undefined) r.end = end;
  return r;
};

describe('parseReference: the old parser’s behaviour', () => {
  it('parses full names with chapter, verse and range', () => {
    expect(p('Genesis 1')).toEqual(ref(1, 1));
    expect(p('Genesis 1:6')).toEqual(ref(1, 1, 6, 6));
    expect(p('Genesis 1:6-7')).toEqual(ref(1, 1, 6, 7));
    expect(p('Genesis 1:6–7')).toEqual(ref(1, 1, 6, 7)); // en dash
    expect(p('Genesis 1:6 - 7')).toEqual(ref(1, 1, 6, 7));
  });
  it('is case-insensitive and ignores surrounding space', () => {
    expect(p('  john 3:16  ')).toEqual(ref(43, 3, 16, 16));
    expect(p('JOHN 3:16')).toEqual(ref(43, 3, 16, 16));
  });
  it('handles numbered and multi-word books', () => {
    expect(p('1 John 4:8')).toEqual(ref(62, 4, 8, 8));
    expect(p('2 Corinthians 5:17')).toEqual(ref(47, 5, 17, 17));
    expect(p('Song of Solomon 2:4')).toEqual(ref(22, 2, 4, 4));
  });
  it('strips trailing punctuation and wrapping parentheses', () => {
    expect(p('John 3:16.')).toEqual(ref(43, 3, 16, 16));
    expect(p('Romans 8:28;')).toEqual(ref(45, 8, 28, 28));
    expect(p('(John 3:16)')).toEqual(ref(43, 3, 16, 16));
  });
  it('rejects text that is not a whole reference', () => {
    expect(p('')).toBeNull();
    expect(p('   ')).toBeNull();
    expect(p('love one another')).toBeNull();
    expect(p('John 3:16 is great')).toBeNull();
    expect(p('see John 3:16')).toBeNull();
    expect(p('John 0')).toBeNull();
    expect(p('John 3:0')).toBeNull();
  });
});

describe('parseReference: abbreviations and joined forms', () => {
  it('takes common abbreviations', () => {
    expect(p('jn 3:16')).toEqual(ref(43, 3, 16, 16));
    expect(p('jhn 3:16')).toEqual(ref(43, 3, 16, 16));
    expect(p('gen 1')).toEqual(ref(1, 1));
    expect(p('ex 20')).toEqual(ref(2, 20));
    expect(p('ps 23')).toEqual(ref(19, 23));
    expect(p('psalm 23')).toEqual(ref(19, 23));
    expect(p('prov 3:5-6')).toEqual(ref(20, 3, 5, 6));
    expect(p('isa 53')).toEqual(ref(23, 53));
    expect(p('mt 5:3')).toEqual(ref(40, 5, 3, 3));
    expect(p('mk 1')).toEqual(ref(41, 1));
    expect(p('lk 2:11')).toEqual(ref(42, 2, 11, 11));
    expect(p('rom 8:28')).toEqual(ref(45, 8, 28, 28));
    expect(p('phil 4:13')).toEqual(ref(50, 4, 13, 13));
    expect(p('phlm 1')).toEqual(ref(57, 1));
    expect(p('heb 11:1')).toEqual(ref(58, 11, 1, 1));
    expect(p('rev 21')).toEqual(ref(66, 21));
    expect(p('song 2')).toEqual(ref(22, 2));
  });
  it('takes the three-letter codes the coverage map uses', () => {
    expect(p('Sng 2')).toEqual(ref(22, 2));
    expect(p('Ezk 37')).toEqual(ref(26, 37));
    expect(p('Mrk 4')).toEqual(ref(41, 4));
    expect(p('Php 2:5')).toEqual(ref(50, 2, 5, 5));
  });
  it('takes numbered books written together or apart', () => {
    expect(p('1jn 1:9')).toEqual(ref(62, 1, 9, 9));
    expect(p('1 jn 1:9')).toEqual(ref(62, 1, 9, 9));
    expect(p('1john 1')).toEqual(ref(62, 1));
    expect(p('1 cor 13')).toEqual(ref(46, 13));
    expect(p('1co 13')).toEqual(ref(46, 13));
    expect(p('2 tim 3:16')).toEqual(ref(55, 3, 16, 16));
    expect(p('ii kings 2')).toEqual(ref(12, 2));
  });
  it('joins the book and the chapter without a space', () => {
    expect(p('jn3')).toEqual(ref(43, 3));
    expect(p('jn3:16')).toEqual(ref(43, 3, 16, 16));
    expect(p('john3:16')).toEqual(ref(43, 3, 16, 16));
    expect(p('1jn3')).toEqual(ref(62, 3));
  });
  it('takes a space or a full stop between chapter and verse', () => {
    expect(p('jn 3 16')).toEqual(ref(43, 3, 16, 16));
    expect(p('jn 3 16-18')).toEqual(ref(43, 3, 16, 18));
    expect(p('jn 3.16')).toEqual(ref(43, 3, 16, 16));
  });
  it('takes an unambiguous prefix of a book name', () => {
    expect(p('genes 1')).toEqual(ref(1, 1));
    expect(p('revel 1')).toEqual(ref(66, 1));
    expect(p('deut 6:4')).toEqual(ref(5, 6, 4, 4));
  });
  it('refuses an ambiguous prefix', () => {
    // Joshua, Job, Joel, John, Jonah.
    expect(p('jo 3')).toBeNull();
    // Philippians, Philemon.
    expect(p('ph 1')).toBeNull();
  });
});

describe('parseReference: a book on its own', () => {
  it('gives the book without a chapter for a name or a long enough abbreviation', () => {
    expect(p('John')).toEqual(ref(43));
    expect(p('psalms')).toEqual(ref(19));
    expect(p('1 corinthians')).toEqual(ref(46));
    expect(p('rev')).toEqual(ref(66));
    expect(p('genes')).toEqual(ref(1));
    expect(p('约翰福音')).toEqual(ref(43));
  });
  it('needs a chapter for two-letter and one-character abbreviations', () => {
    expect(p('jn')).toBeNull();
    expect(p('ps')).toBeNull();
    expect(p('约')).toBeNull();
    expect(p('创')).toBeNull();
  });
});

describe('parseReference: Chinese', () => {
  it('takes Simplified and Traditional names, with or without a space', () => {
    expect(p('约翰福音 3:16')).toEqual(ref(43, 3, 16, 16));
    expect(p('约翰福音3:16')).toEqual(ref(43, 3, 16, 16));
    expect(p('約翰福音 3')).toEqual(ref(43, 3));
    expect(p('创世记 1')).toEqual(ref(1, 1));
    expect(p('創世記 1:1')).toEqual(ref(1, 1, 1, 1));
    expect(p('诗篇 23')).toEqual(ref(19, 23));
    expect(p('约翰壹书 4:8')).toEqual(ref(62, 4, 8, 8));
  });
  it('takes full-width digits and colon, and the 章 / 节 forms', () => {
    expect(p('约翰福音３：１６')).toEqual(ref(43, 3, 16, 16));
    expect(p('约翰福音3章')).toEqual(ref(43, 3));
    expect(p('约翰福音3章16节')).toEqual(ref(43, 3, 16, 16));
    expect(p('約翰福音3章16節')).toEqual(ref(43, 3, 16, 16));
    expect(p('约翰福音3:16～18')).toEqual(ref(43, 3, 16, 18));
  });
  it('takes the short CUV names before a chapter', () => {
    expect(p('约 3:16')).toEqual(ref(43, 3, 16, 16));
    expect(p('约3:16')).toEqual(ref(43, 3, 16, 16));
    expect(p('创 1')).toEqual(ref(1, 1));
    expect(p('林前 13')).toEqual(ref(46, 13));
    expect(p('約壹 4:8')).toEqual(ref(62, 4, 8, 8));
    expect(p('约一 4:8')).toEqual(ref(62, 4, 8, 8));
    expect(p('詩 23')).toEqual(ref(19, 23));
  });
  it('rejects Chinese words that are not a reference', () => {
    expect(p('神爱世人')).toBeNull();
    expect(p('约翰福音 第三章')).toBeNull(); // Chinese numerals are not supported
  });
});

describe('parseReference: limits', () => {
  it('rejects a chapter past the end of the book', () => {
    expect(p('John 22')).toBeNull();
    expect(p('Psalm 151')).toBeNull();
    expect(p('Psalm 150')).toEqual(ref(19, 150));
  });
  it('rejects a backwards range and an absurd verse', () => {
    expect(p('John 3:18-16')).toBeNull();
    expect(p('John 3:999')).toBeNull();
    expect(p('Psalm 119:176')).toEqual(ref(19, 119, 176, 176));
  });
  it('reads one number after a one-chapter book as a verse', () => {
    expect(p('Jude 5')).toEqual(ref(65, 1, 5, 5));
    expect(p('Jude 3-5')).toEqual(ref(65, 1, 3, 5));
    expect(p('Jude 1')).toEqual(ref(65, 1));
    expect(p('Jude 1:5')).toEqual(ref(65, 1, 5, 5));
    expect(p('Jude 2:1')).toBeNull();
    expect(p('Obadiah 4')).toEqual(ref(31, 1, 4, 4));
  });
  it('does not support cross-chapter ranges or verse lists', () => {
    expect(p('John 3:16-4:2')).toBeNull();
    expect(p('John 3:16,18')).toBeNull();
  });
});

describe('suggestPassages', () => {
  const s = (q: string, limit?: number) => suggestPassages(q, index, limit);
  it('is empty for an empty query', () => {
    expect(s('')).toEqual([]);
    expect(s('  ')).toEqual([]);
  });
  it('puts the exact reference first, once', () => {
    const out = s('john 3:16');
    expect(out[0]).toEqual(ref(43, 3, 16, 16));
    expect(out.filter((r) => r.bookNumber === 43 && r.chapter === 3 && r.start === 16)).toHaveLength(1);
  });
  it('offers every book a partial name could mean, with the typed chapter', () => {
    const out = s('jo 3');
    expect(out).toHaveLength(5);
    expect(new Set(out.map((r) => r.bookNumber))).toEqual(new Set([6, 18, 29, 43, 32]));
    for (const r of out) expect(r.chapter).toBe(3);
    // The closest name first: "jo" is most of "Job".
    expect(out[0]!.bookNumber).toBe(18);
  });
  it('honours the limit and leaves out books too short for the chapter', () => {
    expect(s('jo 3', 2)).toHaveLength(2);
    // Joel and Jonah have 3 and 4 chapters; Joshua, Job and John have more.
    const out = s('jo 10');
    expect(out.map((r) => r.bookNumber).sort((a, b) => a - b)).toEqual([6, 18, 43]);
  });
  it('carries typed verses', () => {
    const out = s('jo 3:16');
    expect(out.find((r) => r.bookNumber === 43)).toEqual(ref(43, 3, 16, 16));
  });
  it('forgives a small typo', () => {
    expect(s('genisis 1')[0]).toEqual(ref(1, 1));
    expect(s('jon 3').map((r) => r.bookNumber)).toEqual(expect.arrayContaining([32, 43]));
  });
  it('offers books without a chapter for a name being typed', () => {
    const out = s('phil');
    expect(out[0]).toEqual(ref(50));
    expect(out).toContainEqual(ref(57));
  });
  it('matches the start of a Chinese name', () => {
    const out = s('约翰 3');
    expect(out).toContainEqual(ref(43, 3));
    expect(out).toContainEqual(ref(62, 3));
    // 2 John and 3 John have one chapter.
    expect(out.find((r) => r.bookNumber === 63 || r.bookNumber === 64)).toBeUndefined();
  });
  it('suggests nothing for plain words', () => {
    expect(s('love one another')).toEqual([]);
    expect(s('神爱世人')).toEqual([]);
  });
});
