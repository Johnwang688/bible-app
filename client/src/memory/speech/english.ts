// The English grader, beside the pinyin one: word-level, with the same alignment (`align`), the same score
// (matches / max(expected, said) * 100) and the same pass mark (PASS_THRESHOLD_PCT). Words are compared after
// normalising case, diacritics, apostrophes, punctuation and numbers (`2` = `two`), and a one-letter slip of a word
// of five letters or more counts (Savior / Saviour). Full recall needs the reference at the start or the end; book
// names come from the app's own English book catalogue.
//
// Pure module: no React, no native modules.
import { LEGACY_BOOKS } from '../../legacy/books';
import { align, PASS_THRESHOLD_PCT, type Op } from './pinyinDiff';

// ---------------------------------------------------------------------------------------------------------
// Words
// ---------------------------------------------------------------------------------------------------------

const ONES = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'] as const;
const TEENS = [
  'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen',
] as const;
const TENS = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'] as const;
const SCALES: readonly (readonly [number, string])[] = [
  [1_000_000_000, 'billion'],
  [1_000_000, 'million'],
  [1_000, 'thousand'],
];

/** A whole number as words, the way it is said: 2 -> two, 119 -> one hundred nineteen, 10000 -> ten thousand. */
export function numberWords(n: number): string[] {
  if (n < 10) return [ONES[n]!];
  if (n < 20) return [TEENS[n - 10]!];
  if (n < 100) return n % 10 === 0 ? [TENS[n / 10]!] : [TENS[Math.floor(n / 10)]!, ONES[n % 10]!];
  if (n < 1000) {
    const rest = n % 100;
    return [ONES[Math.floor(n / 100)]!, 'hundred', ...(rest === 0 ? [] : numberWords(rest))];
  }
  for (const [size, name] of SCALES) {
    if (n >= size) {
      const rest = n % size;
      return [...numberWords(Math.floor(n / size)), name, ...(rest === 0 ? [] : numberWords(rest))];
    }
  }
  return [String(n)];
}

/** Below this a digit string is read as a number; longer ones are read digit by digit. */
const MAX_NUMBER = 1_000_000_000_000;

/**
 * A run that is one or more words: digits grouped by thousands (`10,000`), or letters and digits with apostrophes
 * inside (`God’s`). Hyphens, dashes, slashes and every other mark fall between runs.
 */
const RUN = /\d{1,3}(?:,\d{3})+(?![\d\p{L}])|[\p{L}\p{M}\p{N}]+(?:['’‘ʼ][\p{L}\p{M}\p{N}]+)*/gu;

/** Lower case, diacritics off (NFKD), apostrophes and thousands commas out, anything else not a letter/digit out. */
function fold(raw: string): string {
  return raw
    .normalize('NFKD')
    .replace(/\p{M}/gu, '')
    .toLowerCase()
    .replace(/[^\p{L}\p{N}]/gu, '');
}

export interface EnglishToken {
  /** The normalised word the grader compares. */
  word: string;
  /** The run of the text it comes from (code-unit offsets). A number run gives several words, all with its span. */
  start: number;
  end: number;
  /** The first word of its run (the one a display draws the run's text on). */
  first: boolean;
}

/** The words of `text` as the grader reads them, each with the run of the text it came from. */
export function englishTokens(text: string): EnglishToken[] {
  const out: EnglishToken[] = [];
  for (const match of text.matchAll(RUN)) {
    const start = match.index ?? 0;
    const end = start + match[0].length;
    const folded = fold(match[0]);
    if (!folded) continue;
    let words: string[];
    if (/^\d+$/.test(folded)) {
      const n = Number(folded);
      words = n < MAX_NUMBER ? numberWords(n) : Array.from(folded, (d) => ONES[Number(d)]!);
    } else {
      words = [folded];
    }
    words.forEach((word, i) => out.push({ word, start, end, first: i === 0 }));
  }
  return out;
}

/** The words of `text` as the grader compares them: `God’s mercy, 2 or 3!` -> gods mercy two or three. */
export function englishWords(text: string): string[] {
  return englishTokens(text).map((t) => t.word);
}

/** Whether two strings are at most one insertion, deletion or substitution apart. */
function withinOneEdit(a: string, b: string): boolean {
  const x = Array.from(a);
  const y = Array.from(b);
  if (Math.abs(x.length - y.length) > 1) return false;
  let i = 0;
  let j = 0;
  let edits = 0;
  while (i < x.length && j < y.length) {
    if (x[i] === y[j]) {
      i++;
      j++;
      continue;
    }
    if (++edits > 1) return false;
    if (x.length > y.length) i++;
    else if (y.length > x.length) j++;
    else {
      i++;
      j++;
    }
  }
  return edits + (x.length - i) + (y.length - j) <= 1;
}

/** A slip only counts on words at least this long: short words (in / on) must be said exactly. */
export const SLIP_MIN_LETTERS = 5;

/** Equal, or a one-letter slip of a long word (Savior / Saviour). */
export function sameEnglishWord(expected: string, said: string): boolean {
  if (expected === said) return true;
  return (
    Array.from(expected).length >= SLIP_MIN_LETTERS &&
    Array.from(said).length >= SLIP_MIN_LETTERS &&
    withinOneEdit(expected, said)
  );
}

// ---------------------------------------------------------------------------------------------------------
// Recital
// ---------------------------------------------------------------------------------------------------------

export interface EnglishComparison {
  /** 0..100. */
  matchPct: number;
  /** matchPct >= PASS_THRESHOLD_PCT. */
  passed: boolean;
  expectedWords: string[];
  saidWords: string[];
  /** The alignment the score counts (a slip is a `match`). Empty when either side is. */
  ops: Op[];
}

/** Grade an English recital against the expected text, word by word. Either side empty -> 0%, not passed. */
export function compareEnglishRecital(said: string, expected: string): EnglishComparison {
  const expectedWords = englishWords(expected);
  const saidWords = englishWords(said);
  if (expectedWords.length === 0 || saidWords.length === 0) {
    return { matchPct: 0, passed: false, expectedWords, saidWords, ops: [] };
  }
  const ops = align(expectedWords, saidWords, sameEnglishWord);
  const matches = ops.filter((op) => op.kind === 'match').length;
  const matchPct = (matches / Math.max(expectedWords.length, saidWords.length)) * 100;
  return { matchPct, passed: matchPct >= PASS_THRESHOLD_PCT, expectedWords, saidWords, ops };
}

// ---------------------------------------------------------------------------------------------------------
// References
// ---------------------------------------------------------------------------------------------------------

/** A reference as the grader reads it: the catalogue's book name, the chapter, and the verses as a sorted set. */
export interface ParsedEnglishReference {
  book: string;
  chapter: number;
  /** Sorted, no repeats; empty when only a book and chapter were said. */
  verses: number[];
}

interface RefToken {
  /** Folded word, or the separator itself. */
  text: string;
  start: number;
  end: number;
  sep: boolean;
}

const REF_TOKEN = /[\p{L}\p{M}\p{N}]+(?:['’‘ʼ][\p{L}\p{M}\p{N}]+)*|[:,;.\-–—]/gu;

function refTokens(text: string): RefToken[] {
  const out: RefToken[] = [];
  for (const match of text.matchAll(REF_TOKEN)) {
    const start = match.index ?? 0;
    const raw = match[0];
    const sep = /^[:,;.\-–—]$/.test(raw);
    const folded = sep ? raw : fold(raw);
    if (folded) out.push({ text: folded, start, end: start + raw.length, sep });
  }
  return out;
}

/** How a numbered book's number may be said: `1 John`, `One John`, `First John`, `1st John`. */
const BOOK_NUMBERS: Readonly<Record<string, readonly string[]>> = {
  '1': ['1', 'one', 'first', '1st'],
  '2': ['2', 'two', 'second', '2nd'],
  '3': ['3', 'three', 'third', '3rd'],
};
/** Names said besides the catalogue's own. */
const EXTRA_NAMES: Readonly<Record<string, readonly string[]>> = {
  Psalms: ['psalm'],
  'Song of Solomon': ['song of songs'],
};

/** Every way a book may be said, as folded words, longest first; `book` is the catalogue's name. */
const BOOK_ALIASES: readonly { words: readonly string[]; book: string }[] = LEGACY_BOOKS.flatMap(({ name }) => {
  const forms = [name.toLowerCase(), ...(EXTRA_NAMES[name] ?? [])].map((form) => form.split(' '));
  return forms.flatMap(([head, ...rest]) =>
    (BOOK_NUMBERS[head!] ?? [head!]).map((h) => ({ words: [h, ...rest], book: name })),
  );
}).sort((a, b) => b.words.length - a.words.length);

const RANGE_WORDS = new Set(['to', 'through', 'thru']);
const RANGE_SEPS = new Set(['-', '–', '—']);
const VERSE_LABELS = new Set(['verse', 'verses']);
/** Punctuation that may sit between (and after) the parts of a spoken reference. */
const REF_MARKS = new Set([',', '.', ':', ';', '–', '—']);
const MAX_CHAPTER = 150;
const MAX_VERSE = 200;

class RefReader {
  constructor(private readonly toks: readonly RefToken[]) {}

  /** The folded word at `i`, or undefined for a separator or past the end. */
  word(i: number): string | undefined {
    const tok = this.toks[i];
    return tok && !tok.sep ? tok.text : undefined;
  }

  sep(i: number): string | undefined {
    const tok = this.toks[i];
    return tok?.sep ? tok.text : undefined;
  }

  book(i: number): { book: string; next: number } | null {
    for (const alias of BOOK_ALIASES) {
      if (alias.words.every((w, k) => this.word(i + k) === w)) return { book: alias.book, next: i + alias.words.length };
    }
    return null;
  }

  /** Below a hundred in words: `seven`, `sixteen`, `twenty`, `twenty one`, `twenty-one`. */
  private small(i: number): { value: number; next: number } | null {
    const w = this.word(i);
    if (w === undefined) return null;
    const tens = (TENS as readonly string[]).indexOf(w);
    if (tens >= 2) {
      const k = this.sep(i + 1) === '-' ? i + 2 : i + 1;
      const ones = (ONES as readonly string[]).indexOf(this.word(k) ?? '');
      return ones >= 1 ? { value: tens * 10 + ones, next: k + 1 } : { value: tens * 10, next: i + 1 };
    }
    const teen = (TEENS as readonly string[]).indexOf(w);
    if (teen >= 0) return { value: 10 + teen, next: i + 1 };
    const ones = (ONES as readonly string[]).indexOf(w);
    return ones >= 1 ? { value: ones, next: i + 1 } : null;
  }

  /**
   * One number: digits, or as few number words as make one (`one hundred nineteen`, but `four thirteen` is two
   * numbers: a word that cannot extend the number starts the next one).
   */
  number(i: number): { value: number; next: number } | null {
    const w = this.word(i);
    if (w === undefined) return null;
    if (/^\d+$/.test(w)) return { value: Number(w), next: i + 1 };
    let j = i;
    let total = 0;
    let any = false;
    const hundreds = (ONES as readonly string[]).indexOf(w);
    if (hundreds >= 1 && this.word(i + 1) === 'hundred') {
      total = hundreds * 100;
      j = i + 2;
      any = true;
      if (this.word(j) === 'and' && this.small(j + 1)) j++;
    }
    const rest = this.small(j);
    if (rest) {
      total += rest.value;
      j = rest.next;
      any = true;
    }
    return any ? { value: total, next: j } : null;
  }

  /** Past any `verse`/`verses` labels at `i` (`verse 7 and verse 8`, `verses 6 through verse 7`). */
  private labels(i: number): number {
    let j = i;
    while (VERSE_LABELS.has(this.word(j) ?? '')) j++;
    return j;
  }

  /** `6`, `6-7`, `6 to 7`, `6 through 7`, `6 to verse 7`. */
  private span(i: number): { verses: number[]; next: number } | null {
    const a = this.number(i);
    if (!a || a.value < 1 || a.value > MAX_VERSE) return null;
    const s = this.sep(a.next);
    const w = this.word(a.next);
    if ((s !== undefined && RANGE_SEPS.has(s)) || (w !== undefined && RANGE_WORDS.has(w))) {
      const b = this.number(this.labels(a.next + 1));
      if (b && b.value >= a.value && b.value <= MAX_VERSE) {
        return { verses: Array.from({ length: b.value - a.value + 1 }, (_, k) => a.value + k), next: b.next };
      }
    }
    return { verses: [a.value], next: a.next };
  }

  /**
   * Spans joined by `,` / `and`, each optionally labelled (`9, 11`, `9 and 11`, `6, and 7`, `verse 9 and verse 11`),
   * so the whole spoken list is the verse set. A separator (and label) not followed by a verse is left to the body.
   */
  private spans(i: number): { verses: number[]; next: number } | null {
    const first = this.span(i);
    if (!first) return null;
    const verses = [...first.verses];
    let next = first.next;
    for (;;) {
      let m = next;
      let joined = false;
      while (this.sep(m) === ',' || this.word(m) === 'and') {
        m++;
        joined = true;
      }
      if (!joined) break;
      const span = this.span(this.labels(m));
      if (!span) break;
      verses.push(...span.verses);
      next = span.next;
    }
    return { verses, next };
  }

  /** Past any punctuation said between the parts of a reference (`John, chapter fifteen, verse seven`). */
  private marks(i: number): number {
    let j = i;
    while (REF_MARKS.has(this.sep(j) ?? '')) j++;
    return j;
  }

  /**
   * A reference starting at token `i`: book, chapter, then the verses (optional), or null. Punctuation may sit
   * between the parts; `and` joins the chapter to a `verse` label (`chapter fifteen and verse seven`), but an
   * unlabelled `fifteen and seven` reads as chapter 15 with `and seven` left to the body.
   */
  reference(i: number): { ref: ParsedEnglishReference; next: number } | null {
    const book = this.book(i);
    if (!book) return null;
    let j = this.marks(book.next);
    if (this.word(j) === 'chapter') j = this.marks(j + 1);
    const chapter = this.number(j);
    if (!chapter || chapter.value < 1 || chapter.value > MAX_CHAPTER) return null;
    j = chapter.next;
    let k = j;
    for (;;) {
      const w = this.word(k);
      if (REF_MARKS.has(this.sep(k) ?? '') || (w !== undefined && VERSE_LABELS.has(w))) k++;
      else if (w === 'and' && VERSE_LABELS.has(this.word(this.marks(k + 1)) ?? '')) k++;
      else break;
    }
    const spans = this.spans(k);
    const verses = spans ? [...new Set(spans.verses)].sort((a, b) => a - b) : [];
    return { ref: { book: book.book, chapter: chapter.value, verses }, next: spans ? spans.next : j };
  }
}

const sameReference = (a: ParsedEnglishReference, b: ParsedEnglishReference): boolean =>
  a.book === b.book &&
  a.chapter === b.chapter &&
  a.verses.length === b.verses.length &&
  a.verses.every((v, i) => v === b.verses[i]);

/** Reads one whole reference (`Psalm 119:9,11`, `first Corinthians three sixteen`); null when `text` is anything else. */
export function parseEnglishReference(text: string): ParsedEnglishReference | null {
  const toks = refTokens(text);
  const reader = new RefReader(toks);
  const first = toks.findIndex((t) => !t.sep);
  if (first < 0) return null;
  const parsed = reader.reference(first);
  if (!parsed) return null;
  return toks.slice(parsed.next).every((t) => t.sep) ? parsed.ref : null;
}

export interface EnglishFullRecallComparison {
  passed: boolean;
  /** Body accuracy only; a long verse can never hide a missing/wrong reference. */
  body: EnglishComparison;
  bodyTranscript: string;
  referenceStatus: 'correct' | 'missing' | 'incorrect';
  /** The reference(s) as heard, as said (start, then end), joined by a space; null when none was. */
  heardReference: string | null;
}

const LEADING_MARKS = /^[\s\p{P}]+/u;

/**
 * Require the reference at the start or the end, then grade what remains as the body with `compareEnglishRecital`.
 * A known book with the wrong chapter or verses, or another known book, is `incorrect`; no reference at either edge
 * is `missing`. A reference alone never passes (its body is empty).
 */
export function compareEnglishFullRecall(
  transcript: string,
  expectedText: string,
  expectedReference: string,
): EnglishFullRecallComparison {
  const expected = parseEnglishReference(expectedReference);
  const toks = refTokens(transcript);
  const reader = new RefReader(toks);
  const refs: ParsedEnglishReference[] = [];
  const heard: string[] = [];

  let bodyStart = 0;
  let bodyEnd = transcript.length;
  let from = 0;

  const first = toks.findIndex((t) => !t.sep);
  const prefix = first >= 0 ? reader.reference(first) : null;
  if (prefix) {
    refs.push(prefix.ref);
    heard.push(transcript.slice(toks[first]!.start, toks[prefix.next - 1]!.end));
    bodyStart = toks[prefix.next]?.start ?? transcript.length;
    from = prefix.next;
  }

  let last = toks.length - 1;
  while (last >= from && toks[last]!.sep) last--;
  for (let k = from; k <= last; k++) {
    if (toks[k]!.sep) continue;
    const suffix = reader.reference(k);
    if (suffix && suffix.next > last) {
      refs.push(suffix.ref);
      heard.push(transcript.slice(toks[k]!.start, toks[suffix.next - 1]!.end));
      bodyEnd = toks[k]!.start;
      break;
    }
  }

  const bodyTranscript = transcript.slice(bodyStart, Math.max(bodyStart, bodyEnd)).replace(LEADING_MARKS, '').trim();
  const referenceStatus =
    refs.length === 0 ? 'missing' : expected && refs.every((r) => sameReference(r, expected)) ? 'correct' : 'incorrect';
  const body = compareEnglishRecital(bodyTranscript, expectedText);
  return {
    passed: referenceStatus === 'correct' && body.passed,
    body,
    bodyTranscript,
    referenceStatus,
    heardReference: heard.length > 0 ? heard.join(' ') : null,
  };
}

const ORDINALS: Readonly<Record<string, string>> = { '1': 'First', '2': 'Second', '3': 'Third' };

/**
 * Three ways to say an English reference, all of which the grader takes: `2 Timothy 3:16`,
 * `2 Timothy chapter 3, verse 16`, `Second Timothy three sixteen`. Null when `referenceEn` is not `Book c:v`.
 */
export function englishReferenceForms(referenceEn: string): string[] | null {
  const match = referenceEn.match(/^(.+?)\s+(\d+):(\d+(?:[-–]\d+)?(?:,\s*\d+(?:[-–]\d+)?)*)$/);
  if (!match) return null;
  const [, book, chapterRaw, versesRaw] = match;
  const spans = versesRaw!.split(',').map((span) => span.trim().split(/[-–]/).map(Number));
  const plural = spans.length > 1 || spans[0]!.length > 1;
  const words = (n: number) => numberWords(n).join(' ');
  const digits = spans.map((s) => s.join(' to ')).join(' and ');
  const said = spans.map((s) => s.map(words).join(' to ')).join(' and ');
  const spokenBook = book!.replace(/^([123]) /, (_, d: string) => `${ORDINALS[d]} `);
  return [
    referenceEn,
    `${book} chapter ${chapterRaw}, ${plural ? 'verses' : 'verse'} ${digits}`,
    `${spokenBook} ${words(Number(chapterRaw))} ${said}`,
  ];
}

export { PASS_THRESHOLD_PCT };
