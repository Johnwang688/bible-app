import type { BookInfo } from '@/features/reader/types';

export const SEARCH_SUGGESTION_LIMIT = 7;
export const BOOK_POPULARITY_SCORES: Record<string, number> = {
  John: 120,
  Psalms: 118,
  Genesis: 114,
  Romans: 110,
  Matthew: 108,
  Proverbs: 106,
  Isaiah: 102,
  Luke: 100,
  Acts: 98,
  Revelation: 96,
  '1 Corinthians': 94,
  Ephesians: 92,
  James: 90,
  Hebrews: 88,
  Philippians: 86,
  '1 John': 84,
  Exodus: 82,
  Mark: 80,
  Galatians: 78,
  Daniel: 76,
};

export function normalizeSearchText(value: string) {
  return value
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

export function compactSearchText(value: string) {
  return normalizeSearchText(value).replace(/\s+/g, '');
}

export function normalizeReferenceSpacing(value: string) {
  return value
    .replace(/([A-Za-z])(\d)/g, '$1 $2')
    .replace(/(\d)([A-Za-z])/g, '$1 $2')
    .replace(/\s+/g, ' ')
    .trim();
}

export function levenshteinDistance(a: string, b: string) {
  if (a === b) return 0;
  if (!a.length) return b.length;
  if (!b.length) return a.length;
  const prev = Array.from({ length: b.length + 1 }, (_, i) => i);
  const curr = new Array<number>(b.length + 1).fill(0);
  for (let i = 0; i < a.length; i += 1) {
    curr[0] = i + 1;
    for (let j = 0; j < b.length; j += 1) {
      const cost = a[i] === b[j] ? 0 : 1;
      curr[j + 1] = Math.min(
        curr[j] + 1,
        prev[j + 1] + 1,
        prev[j] + cost,
      );
    }
    for (let j = 0; j < prev.length; j += 1) prev[j] = curr[j];
  }
  return prev[b.length];
}

export function extractLooseReferenceParts(query: string) {
  const spaced = normalizeReferenceSpacing(query);
  if (!spaced) {
    return { bookPart: '', chapter: undefined, verseStart: undefined, verseEnd: undefined };
  }
  const match = spaced.match(/^(.+?)(?:\s+(\d+)(?::(\d+)(?:\s*[–-]\s*(\d+))?)?)?$/u);
  if (!match) {
    return { bookPart: spaced, chapter: undefined, verseStart: undefined, verseEnd: undefined };
  }
  const chapter = match[2] ? Number.parseInt(match[2], 10) : undefined;
  const verseStart = match[3] ? Number.parseInt(match[3], 10) : undefined;
  const verseEnd = match[4] ? Number.parseInt(match[4], 10) : undefined;
  return {
    bookPart: match[1]?.trim() ?? spaced,
    chapter: Number.isFinite(chapter) ? chapter : undefined,
    verseStart: Number.isFinite(verseStart) ? verseStart : undefined,
    verseEnd: Number.isFinite(verseEnd) ? verseEnd : undefined,
  };
}

export function getBookPopularityScore(book: BookInfo) {
  return BOOK_POPULARITY_SCORES[book.name] ?? Math.max(22, 70 - book.book_number);
}

export function scoreBookMatch(query: string, book: BookInfo) {
  const normalizedQuery = normalizeSearchText(query);
  const compactQuery = compactSearchText(query);
  if (!normalizedQuery || compactQuery.length < 2) return Number.NEGATIVE_INFINITY;

  const normalizedBook = normalizeSearchText(book.name);
  const compactBook = compactSearchText(book.name);
  let score = Number.NEGATIVE_INFINITY;

  if (compactBook === compactQuery) score = 560;
  if (compactBook.startsWith(compactQuery)) {
    score = Math.max(score, 500 - Math.max(0, compactBook.length - compactQuery.length) * 4);
  }

  const wordIndex = normalizedBook.indexOf(normalizedQuery);
  if (wordIndex >= 0) score = Math.max(score, 430 - wordIndex * 18);

  const compactIndex = compactBook.indexOf(compactQuery);
  if (compactIndex >= 0) score = Math.max(score, 390 - compactIndex * 14);

  const prefixSlice = compactBook.slice(
    0,
    Math.min(compactBook.length, Math.max(compactQuery.length, compactQuery.length + 2)),
  );
  const distance = Math.min(
    levenshteinDistance(compactQuery, compactBook),
    levenshteinDistance(compactQuery, prefixSlice),
  );
  const maxDistance = compactQuery.length <= 4 ? 1 : compactQuery.length <= 8 ? 2 : 3;
  if (distance <= maxDistance) {
    score = Math.max(
      score,
      350 - distance * 52 - Math.abs(compactBook.length - compactQuery.length) * 7,
    );
  }

  return score;
}

export function clampChapterForBook(book: BookInfo, chapter?: number) {
  if (!chapter || chapter < 1) return 1;
  return Math.min(book.total_chapters, chapter);
}

export function formatSearchSuggestionLabel(
  book: string,
  chapter: number,
  verseStart?: number,
  verseEnd?: number,
) {
  const verseLabel = verseStart == null
    ? ''
    : verseEnd != null && verseEnd !== verseStart
      ? `:${verseStart}-${verseEnd}`
      : `:${verseStart}`;
  return `${book} ${chapter}${verseLabel}`;
}
