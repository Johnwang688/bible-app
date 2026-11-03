// Acceptance (orchestrator-owned, R-5a): the old frontend's fuzzy book matching
// (frontend-next/src/features/search/search.ts), ported. It ranks passage suggestions.
import { compactSearchText, levenshteinDistance, normalizeSearchText, scoreBookMatch } from '../match';

describe('normalizeSearchText / compactSearchText', () => {
  it('lower-cases, drops punctuation and collapses spaces', () => {
    expect(normalizeSearchText('  Song of  Solomon! ')).toBe('song of solomon');
    expect(normalizeSearchText('1 John')).toBe('1 john');
    expect(compactSearchText('1 John')).toBe('1john');
    expect(compactSearchText('Song of Solomon')).toBe('songofsolomon');
  });
});

describe('levenshteinDistance', () => {
  it('counts single-character edits', () => {
    expect(levenshteinDistance('kitten', 'sitting')).toBe(3);
    expect(levenshteinDistance('', 'abc')).toBe(3);
    expect(levenshteinDistance('abc', '')).toBe(3);
    expect(levenshteinDistance('john', 'john')).toBe(0);
    expect(levenshteinDistance('genisis', 'genesis')).toBe(1);
  });
});

describe('scoreBookMatch', () => {
  it('needs at least two letters', () => {
    expect(scoreBookMatch('j', 'John')).toBe(Number.NEGATIVE_INFINITY);
    expect(scoreBookMatch('', 'John')).toBe(Number.NEGATIVE_INFINITY);
  });
  it('ranks an exact name, then a prefix, then a word inside the name', () => {
    expect(scoreBookMatch('john', 'John')).toBe(560);
    expect(scoreBookMatch('jo', 'Job')).toBe(496);
    expect(scoreBookMatch('jo', 'Joshua')).toBe(484);
    expect(scoreBookMatch('jo', '1 John')).toBe(394);
    expect(scoreBookMatch('john', 'John')).toBeGreaterThan(scoreBookMatch('john', '1 John'));
  });
  it('forgives small typos, scaled by length', () => {
    expect(scoreBookMatch('genisis', 'Genesis')).toBe(298);
    expect(scoreBookMatch('jhon', 'John')).toBe(Number.NEGATIVE_INFINITY);
    expect(scoreBookMatch('xyz', 'John')).toBe(Number.NEGATIVE_INFINITY);
  });
});
