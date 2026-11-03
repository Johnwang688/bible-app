// Fuzzy book-name matching for search. Pure functions, no UI. Ported from the old frontend's
// features/search/search.ts; the scores are unchanged so the acceptance tests pin the same ordering.

/** Lowercase, keep only ASCII letters/digits/whitespace, and collapse whitespace. */
export function normalizeSearchText(value: string): string {
  return value
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

/** Normalised text with all whitespace removed, e.g. '1 John' → '1john'. */
export function compactSearchText(value: string): string {
  return normalizeSearchText(value).replace(/\s+/g, '');
}

/** Edit distance between two strings (two-row dynamic programme). */
export function levenshteinDistance(a: string, b: string): number {
  if (a === b) return 0;
  if (!a.length) return b.length;
  if (!b.length) return a.length;
  const prev = Array.from({ length: b.length + 1 }, (_, i) => i);
  const curr = new Array<number>(b.length + 1).fill(0);
  for (let i = 0; i < a.length; i += 1) {
    curr[0] = i + 1;
    for (let j = 0; j < b.length; j += 1) {
      const cost = a[i] === b[j] ? 0 : 1;
      curr[j + 1] = Math.min(curr[j]! + 1, prev[j + 1]! + 1, prev[j]! + cost);
    }
    for (let j = 0; j < prev.length; j += 1) prev[j] = curr[j]!;
  }
  return prev[b.length]!;
}

/**
 * How well a query matches a book name. Higher is better; -Infinity means no match.
 * Queries shorter than two compacted characters never match.
 */
export function scoreBookMatch(query: string, bookName: string): number {
  const normalizedQuery = normalizeSearchText(query);
  const compactQuery = compactSearchText(query);
  if (!normalizedQuery || compactQuery.length < 2) return Number.NEGATIVE_INFINITY;

  const normalizedBook = normalizeSearchText(bookName);
  const compactBook = compactSearchText(bookName);
  let score = Number.NEGATIVE_INFINITY;

  if (compactBook === compactQuery) score = 560;
  if (compactBook.startsWith(compactQuery)) {
    score = Math.max(score, 500 - Math.max(0, compactBook.length - compactQuery.length) * 4);
  }

  // Character offset of the query inside the normalised (spaced) name, e.g. 'jo' in '1 john' is 2.
  const wordIndex = normalizedBook.indexOf(normalizedQuery);
  if (wordIndex >= 0) score = Math.max(score, 430 - wordIndex * 18);

  const compactIndex = compactBook.indexOf(compactQuery);
  if (compactIndex >= 0) score = Math.max(score, 390 - compactIndex * 14);

  // Fuzzy: compare against the whole name and against a prefix just longer than the query.
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
