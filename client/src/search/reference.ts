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

/** Traditional short names (CUV), canon order. The Simplified ones come from bookAbbreviation. */
const TRAD_SHORT: readonly string[] = [
  '創', '出', '利', '民', '申', '書', '士', '得', '撒上', '撒下', '王上', '王下', '代上', '代下',
  '拉', '尼', '斯', '伯', '詩', '箴', '傳', '歌', '賽', '耶', '哀', '結', '但', '何', '珥', '摩',
  '俄', '拿', '彌', '鴻', '哈', '番', '該', '亞', '瑪', '太', '可', '路', '約', '徒', '羅', '林前',
  '林後', '加', '弗', '腓', '西', '帖前', '帖後', '提前', '提後', '多', '門', '來', '雅', '彼前',
  '彼後', '約壹', '約貳', '約參', '猶', '啟',
];

/** Roman numerals that stand for a numbered book when they start a Latin name ("ii kings"). */
const ROMAN: Readonly<Record<string, string>> = { i: '1', ii: '2', iii: '3' };

/** Short names the EN code list does not cover. */
const ALIASES: Readonly<Record<string, number>> = { jn: 43, mt: 40, mk: 41, lk: 42, phil: 50, phlm: 57 };

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

/** Latin tokens after normalising, with a leading i/ii/iii turned into 1/2/3. */
function latinTokens(text: string): string[] {
  const tokens = normalizeSearchText(text).split(' ').filter(Boolean);
  const first = tokens[0];
  if (tokens.length > 1 && first !== undefined) {
    const numbered = ROMAN[first];
    if (numbered !== undefined) tokens[0] = numbered;
  }
  return tokens;
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

/** Trim, NFKC (full-width digits and colons), lowercase, and drop wrapping brackets and trailing punctuation. */
function cleanQuery(query: string): string {
  let text = query.normalize('NFKC').trim().toLowerCase();
  text = text.replace(/^[(（[【]\s*/u, '').replace(/\s*[)）\]】]$/u, '');
  text = text.replace(/章/gu, ' ').replace(/[节節]$/u, '');
  text = text.replace(/[.,;:。，；]+$/u, '');
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
  for (const [alias, n] of Object.entries(ALIASES)) putHit(latinExact, alias, n, alias.length >= 3);

  const byNumber = new Map(indexed.map((b) => [b.bookNumber, b] as const));
  return { data: { books: indexed, byNumber, latinExact, zhExact } };
}

/** Exact name, code, or alias first; otherwise a prefix that only one book has. */
function lookupBook(text: string, data: IndexData): Hit | null {
  const zh = squash(text);
  if (zh) {
    const hit = data.zhExact.get(zh);
    if (hit !== undefined) return hit;
  }
  const key = latinTokens(text).join('');
  if (!key) return null;
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
  const hit = lookupBook(tail.book, index.data);
  if (!hit) return null;
  if (tail.chapter === undefined) return hit.bookOnly ? { bookNumber: hit.bookNumber } : null;
  const book = index.data.byNumber.get(hit.bookNumber);
  return book ? resolveStrict(book, tail.chapter, tail) : null;
}

/** Score of a book for a partial name. Higher is better; -Infinity means no match. */
function bookScore(text: string, book: IndexedBook, data: IndexData): number {
  let best = Number.NEGATIVE_INFINITY;
  const zh = squash(text);
  if (zh) {
    const hit = data.zhExact.get(zh);
    if (hit && hit.bookNumber === book.bookNumber) best = Math.max(best, 560);
    if (book.zhFull.some((name) => name.startsWith(zh))) best = Math.max(best, 450);
  }
  const tokens = latinTokens(text);
  if (tokens.length > 0) {
    const hit = data.latinExact.get(tokens.join(''));
    if (hit && hit.bookNumber === book.bookNumber) best = Math.max(best, 560);
    best = Math.max(best, scoreBookMatch(tokens.join(' '), book.name));
  }
  return best;
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
  if (!tail.book) return [];

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
    const score = bookScore(tail.book, book, index.data);
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
