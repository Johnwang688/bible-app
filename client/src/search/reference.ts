// Passage references for search: parseReference reads a whole query as one passage (or returns null);
// suggestPassages offers the books and chapters a partial query could mean. Pure functions, no UI.
// The old parser is frontend-next/src/lib/scriptureReference.ts; the fuzzy book scores come from ./match.
import type { BookInfo } from '../api/schemas';
import { bookAbbreviation } from '../i18n/bookAbbreviations';
import { normalizeSearchText, scoreBookMatch } from './match';
import type { PassageRef } from './types';

export type { PassageRef } from './types';

/** No chapter in the Bible has more verses than this (Psalm 119). */
const MAX_VERSE = 176;

/**
 * book, chapter, [verse[-end]] or [chapter-end] for a one-chapter book. Groups: 1 book, 2 chapter,
 * 3 verse, 4 verse end, 5 range end. The book is lazy so a leading "1" in "1 John" stays in the name.
 */
const TAIL = /^(.*?)\s*(\d+)(?:(?:\s*[:.]\s*|\s+)(\d+)(?:\s*[-~–—]\s*(\d+))?|\s*[-~–—]\s*(\d+))?$/u;

/** A book name in Chinese: Han characters, with optional single spaces between words. */
const CJK_BOOK = /^\p{Script=Han}+(?: \p{Script=Han}+)*$/u;

/** A book name in Latin letters and digits, with optional single spaces and one trailing dot ("1 Cor."). */
const LATIN_BOOK = /^[a-z0-9]+(?: [a-z0-9]+)*\.?$/;

/** Traditional short names (CUV), canon order. The Simplified ones come from bookAbbreviation. */
const TRAD_SHORT: readonly string[] = [
  '創', '出', '利', '民', '申', '書', '士', '得', '撒上', '撒下', '王上', '王下', '代上', '代下',
  '拉', '尼', '斯', '伯', '詩', '箴', '傳', '歌', '賽', '耶', '哀', '結', '但', '何', '珥', '摩',
  '俄', '拿', '彌', '鴻', '哈', '番', '該', '亞', '瑪', '太', '可', '路', '約', '徒', '羅', '林前',
  '林後', '加', '弗', '腓', '西', '帖前', '帖後', '提前', '提後', '多', '門', '來', '雅', '彼前',
  '彼後', '約壹', '約貳', '約參', '猶', '啟',
];

/** Simplified short names (the Traditional ones are in TRAD_SHORT) that bookAbbreviation does not cover. */
const EXTRA_ZH: readonly (readonly [string, number])[] = [
  ['约壹', 62],
  ['约贰', 63],
  ['约参', 64],
];

/** Roman numerals that stand for a numbered book when they start a Latin name ("ii kings"). */
const ROMAN: ReadonlyMap<string, string> = new Map([
  ['i', '1'],
  ['ii', '2'],
  ['iii', '3'],
]);

/**
 * Common Latin short names, by book number. Each is compacted (spaces removed) before lookup, so
 * "song of songs" becomes "songofsongs".
 */
const ALIASES: Readonly<Record<number, readonly string[]>> = {
  1: ['gn', 'gen', 'ge'],
  2: ['ex', 'exo', 'exod'],
  3: ['lv', 'lev'],
  4: ['nm', 'num'],
  5: ['dt', 'deut'],
  6: ['jos', 'josh'],
  7: ['jdg', 'judg'],
  8: ['ru'],
  9: ['1 sam', '1 sm'],
  10: ['2 sam', '2 sm'],
  11: ['1 kgs', '1 ki'],
  12: ['2 kgs', '2 ki'],
  13: ['1 chr', '1 ch'],
  14: ['2 chr', '2 ch'],
  15: ['ezr'],
  16: ['neh'],
  17: ['est', 'esth'],
  18: ['jb'],
  19: ['ps', 'pss', 'psa', 'psalm'],
  20: ['prv', 'prov', 'pr'],
  21: ['eccl', 'ecc', 'qoh'],
  22: ['sos', 'song', 'sg', 'song of songs', 'canticles'],
  23: ['is', 'isa'],
  24: ['jer'],
  25: ['lam'],
  26: ['ezek', 'ezk'],
  27: ['dn', 'dan'],
  28: ['hos'],
  29: ['jl', 'joel'],
  30: ['am', 'amos'],
  31: ['ob', 'obad'],
  32: ['jon', 'jnh'],
  33: ['mic'],
  34: ['na', 'nah'],
  35: ['hab', 'hb'],
  36: ['zep', 'zeph'],
  37: ['hag', 'hg'],
  38: ['zec', 'zech'],
  39: ['mal'],
  40: ['mt', 'matt'],
  41: ['mk', 'mrk', 'mar'],
  42: ['lk', 'luk'],
  43: ['jn', 'jhn'],
  44: ['ac', 'acts'],
  45: ['rm', 'rom'],
  46: ['1 cor', '1 co'],
  47: ['2 cor', '2 co'],
  48: ['gal'],
  49: ['eph'],
  50: ['phil', 'php'],
  51: ['col'],
  52: ['1 thess', '1 th'],
  53: ['2 thess', '2 th'],
  54: ['1 tim', '1 ti'],
  55: ['2 tim', '2 ti'],
  56: ['ti', 'tit'],
  57: ['phlm', 'phm'],
  58: ['heb'],
  59: ['jas', 'jm'],
  60: ['1 pet', '1 pt'],
  61: ['2 pet', '2 pt'],
  62: ['1 jn', '1 jhn'],
  63: ['2 jn', '2 jhn'],
  64: ['3 jn', '3 jhn'],
  65: ['jud', 'jude'],
  66: ['rev', 'rv'],
};

interface Hit {
  readonly bookNumber: number;
  /** Whether the name alone (no chapter) may stand for the book. */
  readonly bookOnly: boolean;
}

interface IndexedBook {
  readonly bookNumber: number;
  readonly totalChapters: number;
  readonly name: string;
  /** Compact Latin name, e.g. '1john', for prefix lookups. */
  readonly latinFull: string;
  /** Traditional and Simplified full names with whitespace removed. */
  readonly zhFull: readonly string[];
}

interface IndexData {
  readonly books: readonly IndexedBook[];
  readonly byNumber: ReadonlyMap<number, IndexedBook>;
  /** Keys map to null when two books claim the same key, which makes it unusable. */
  readonly latinExact: ReadonlyMap<string, Hit | null>;
  readonly zhExact: ReadonlyMap<string, Hit | null>;
}

/** Built once by buildBookIndex. Treat as opaque; use parseReference and suggestPassages. */
export interface BookIndex {
  readonly data: IndexData;
}

/**
 * The book part of a query after the one strict normalisation that both parseReference and
 * suggestPassages use. Chinese: Han words, whitespace removed. Latin: lowercase ASCII letters and
 * digits in words, a trailing dot dropped, a leading i/ii/iii turned into 1/2/3 when more words follow.
 */
type BookPart =
  | { readonly script: 'zh'; readonly key: string }
  | { readonly script: 'latin'; readonly key: string; readonly words: string };

interface Tail {
  readonly book: string;
  readonly chapter?: number | undefined;
  readonly verse?: number | undefined;
  readonly verseEnd?: number | undefined;
  readonly rangeEnd?: number | undefined;
}

/** Whitespace removed, so Chinese names match with or without spaces. */
function squash(text: string): string {
  return text.replace(/\s+/g, '');
}

/** A leading i/ii/iii turned into 1/2/3 when more words follow ("ii kings", but not "is"). */
function romanToDigit(tokens: string[]): string[] {
  const first = tokens[0];
  if (tokens.length > 1 && first !== undefined) {
    const numbered = ROMAN.get(first);
    if (numbered !== undefined) tokens[0] = numbered;
  }
  return tokens;
}

/** Latin tokens of a name from the book list or the alias table (index side only, never a query). */
function latinTokens(text: string): string[] {
  return romanToDigit(normalizeSearchText(text).split(' ').filter(Boolean));
}

/**
 * The strict normalisation of the book part of a query. Null when any character could not be part of
 * a book token, so nothing is dropped and the rest matched (no "John 爱", "jo-hn", "j.ohn").
 */
function bookPart(text: string): BookPart | null {
  if (CJK_BOOK.test(text)) return { script: 'zh', key: squash(text) };
  if (!LATIN_BOOK.test(text)) return null;
  const tokens = romanToDigit(text.replace(/\.$/, '').split(' '));
  return { script: 'latin', key: tokens.join(''), words: tokens.join(' ') };
}

/** Length in code points, so a character outside the BMP counts once. */
function charCount(text: string): number {
  return [...text].length;
}

function putHit(map: Map<string, Hit | null>, key: string, bookNumber: number, bookOnly: boolean): void {
  if (!key) return;
  const prev = map.get(key);
  if (prev === undefined) {
    map.set(key, { bookNumber, bookOnly });
  } else if (prev === null || prev.bookNumber !== bookNumber) {
    map.set(key, null);
  } else if (bookOnly && !prev.bookOnly) {
    map.set(key, { bookNumber, bookOnly });
  }
}

/**
 * Trim, NFKC (full-width digits and colons), lowercase, drop a leading bracket, then drop trailing
 * punctuation and closing brackets in any order. A 节 after a number goes too, so "3章16节。" reads as "3 16".
 */
function cleanQuery(query: string): string {
  let text = query.normalize('NFKC').trim().toLowerCase();
  text = text.replace(/^[(（[【]\s*/u, '');
  let previous = '';
  while (previous !== text) {
    previous = text;
    text = text.replace(/[\s.,;:。，；)）\]】]+$/u, '');
    text = text.replace(/(\d)\s*[节節]$/u, '$1');
  }
  text = text.replace(/(\d)\s*章\s*/gu, '$1 ');
  return text.replace(/\s+/g, ' ').trim();
}

function splitTail(text: string): Tail {
  const m = TAIL.exec(text);
  if (!m) return { book: text };
  return {
    book: m[1] ?? '',
    chapter: Number(m[2]),
    verse: m[3] === undefined ? undefined : Number(m[3]),
    verseEnd: m[4] === undefined ? undefined : Number(m[4]),
    rangeEnd: m[5] === undefined ? undefined : Number(m[5]),
  };
}

/** Builds the lookup maps once. Book names, codes, aliases, and Chinese names all go in. */
export function buildBookIndex(books: readonly BookInfo[]): BookIndex {
  const latinExact = new Map<string, Hit | null>();
  const zhExact = new Map<string, Hit | null>();
  const indexed: IndexedBook[] = [];

  for (const book of books) {
    const n = book.book_number;
    const latinFull = latinTokens(book.name).join('');
    const zhFull = [book.name_zh, book.name_zh_simplified]
      .filter((s): s is string => typeof s === 'string' && s.trim().length > 0)
      .map(squash);
    indexed.push({ bookNumber: n, totalChapters: book.total_chapters, name: book.name, latinFull, zhFull });

    putHit(latinExact, latinFull, n, true);
    const code = latinTokens(bookAbbreviation(n, 'en')).join('');
    putHit(latinExact, code, n, code.length >= 3);
    for (const z of zhFull) putHit(zhExact, z, n, true);
    putHit(zhExact, squash(bookAbbreviation(n, 'zh-Hans')), n, false);
    const trad = TRAD_SHORT[n - 1];
    if (trad) putHit(zhExact, trad, n, false);
  }
  // Aliases and extra short names only for books in the list: the index never resolves a missing book.
  const present = new Set(indexed.map((b) => b.bookNumber));
  for (const [key, names] of Object.entries(ALIASES)) {
    const n = Number(key);
    if (!present.has(n)) continue;
    for (const name of names) {
      const compact = latinTokens(name).join('');
      putHit(latinExact, compact, n, compact.length >= 3);
    }
  }
  for (const [name, n] of EXTRA_ZH) if (present.has(n)) putHit(zhExact, name, n, false);

  const byNumber = new Map(indexed.map((b) => [b.bookNumber, b] as const));
  return { data: { books: indexed, byNumber, latinExact, zhExact } };
}

/**
 * The book part of a strict query. Chinese must match a known name exactly. Latin must match a name or
 * alias exactly, or else a prefix that only one book has.
 */
function lookupStrict(part: BookPart, data: IndexData): Hit | null {
  if (part.script === 'zh') return data.zhExact.get(part.key) ?? null;
  const key = part.key;
  const exact = data.latinExact.get(key);
  if (exact !== undefined) return exact;
  if (key.length < 2) return null;
  const matches = data.books.filter((b) => b.latinFull.startsWith(key));
  const only = matches.length === 1 ? matches[0] : undefined;
  return only ? { bookNumber: only.bookNumber, bookOnly: key.length >= 3 } : null;
}

function span(bookNumber: number, chapter: number, start: number, end: number): PassageRef | null {
  if (start < 1 || end < start || end > MAX_VERSE) return null;
  return { bookNumber, chapter, start, end };
}

/** Strict reading of a chapter and verse for parseReference. */
function resolveStrict(book: IndexedBook, chapter: number, tail: Tail): PassageRef | null {
  const id = book.bookNumber;
  if (tail.rangeEnd !== undefined) {
    // "Jude 3-5": a dash after the number reads as verses, and only in a one-chapter book.
    if (book.totalChapters !== 1 || tail.verse !== undefined) return null;
    return span(id, 1, chapter, tail.rangeEnd);
  }
  if (tail.verse === undefined) {
    if (chapter < 1) return null;
    // "Jude 5": in a one-chapter book, a number above 1 is a verse of chapter 1.
    if (book.totalChapters === 1 && chapter > 1) return span(id, 1, chapter, chapter);
    if (chapter > book.totalChapters) return null;
    return { bookNumber: id, chapter };
  }
  if (chapter < 1 || chapter > book.totalChapters) return null;
  return span(id, chapter, tail.verse, tail.verseEnd ?? tail.verse);
}

/** Reads the whole query as one passage, or returns null if any part does not fit. */
export function parseReference(query: string, index: BookIndex): PassageRef | null {
  const text = cleanQuery(query);
  if (!text) return null;
  const tail = splitTail(text);
  const part = bookPart(tail.book);
  const hit = part ? lookupStrict(part, index.data) : null;
  const book = hit ? index.data.byNumber.get(hit.bookNumber) : undefined;
  if (!hit || !book) return null;
  if (tail.chapter === undefined) return hit.bookOnly ? { bookNumber: book.bookNumber } : null;
  return resolveStrict(book, tail.chapter, tail);
}

/**
 * Score of a book for a partial name. Higher is better; -Infinity means no match.
 * Chinese: an exact name or short name 560; else a full name (Simplified or Traditional) that starts
 * with the text, 450 plus 100 times the coverage (typed length / name length). Latin: an exact name,
 * code or alias 560; else the fuzzy scoreBookMatch on the strict words.
 */
function bookScore(part: BookPart, book: IndexedBook, data: IndexData): number {
  let best = Number.NEGATIVE_INFINITY;
  if (part.script === 'zh') {
    const hit = data.zhExact.get(part.key);
    if (hit && hit.bookNumber === book.bookNumber) best = 560;
    const typed = charCount(part.key);
    for (const name of book.zhFull) {
      if (name.startsWith(part.key)) best = Math.max(best, 450 + (100 * typed) / charCount(name));
    }
    return best;
  }
  const hit = data.latinExact.get(part.key);
  if (hit && hit.bookNumber === book.bookNumber) best = 560;
  return Math.max(best, scoreBookMatch(part.words, book.name));
}

/** The suggestion for one book at the typed chapter. Null when the chapter does not fit that book. */
function suggestionRef(book: IndexedBook, tail: Tail): PassageRef | null {
  const id = book.bookNumber;
  if (tail.chapter === undefined) return { bookNumber: id };
  const chapter = tail.chapter;
  if (tail.rangeEnd !== undefined) {
    return book.totalChapters === 1 ? span(id, 1, chapter, tail.rangeEnd) : null;
  }
  if (chapter < 1 || chapter > book.totalChapters) return null;
  if (tail.verse === undefined) return { bookNumber: id, chapter };
  return span(id, chapter, tail.verse, tail.verseEnd ?? tail.verse) ?? { bookNumber: id, chapter };
}

/**
 * Passages a partial query could mean, best first, at most `limit`. The exact reading comes first if
 * there is one. Each book appears at most once.
 */
export function suggestPassages(query: string, index: BookIndex, limit = 5): PassageRef[] {
  if (limit <= 0) return [];
  const text = cleanQuery(query);
  if (!text) return [];
  const tail = splitTail(text);
  const part = bookPart(tail.book);
  if (!part) return [];

  const out: PassageRef[] = [];
  const taken = new Set<number>();
  const exact = parseReference(query, index);
  if (exact) {
    out.push(exact);
    taken.add(exact.bookNumber);
  }

  const scored: { score: number; bookNumber: number; ref: PassageRef }[] = [];
  for (const book of index.data.books) {
    if (taken.has(book.bookNumber)) continue;
    const score = bookScore(part, book, index.data);
    if (!Number.isFinite(score)) continue;
    const ref = suggestionRef(book, tail);
    if (ref) scored.push({ score, bookNumber: book.bookNumber, ref });
  }
  scored.sort((a, b) => b.score - a.score || a.bookNumber - b.bookNumber);

  for (const { ref } of scored) {
    if (out.length >= limit) break;
    out.push(ref);
  }
  return out;
}
