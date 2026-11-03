/**
 * Integrity checks for the active verse library: its shape, its references and slugs, its chunks,
 * its gloss-free simplified text, and its traditional-script companions.
 * Ported from Little Lamb's tests/library.ts (ids L1..L6, L8, L10 kept).
 */
import { getAllMemoryVerses, slugifyReference, TOTAL_VERSES } from '../library';
import { TMS_LIBRARY_ID } from '../library/tms';
import type { MemoryVerse } from '../types';

/** Punctuation the chunk-reconstruction check ignores. */
const PUNCTUATION = /[，。？！；：、“”‘’…—《》〈〉【】「」『』·～]/g;

/** Code-point length: the traditional companions must match the simplified text character for character. */
const cpLength = (s: string): number => [...s].length;

const verses: MemoryVerse[] = getAllMemoryVerses();

describe('library shape (library)', () => {
  it('L1 active library is the Navigators TMS with 60 verses', () => {
    expect(TMS_LIBRARY_ID).toBe('navigators_tms');
    expect(verses).toHaveLength(60);
    expect(TOTAL_VERSES).toBe(60);
  });

  it('L2 sort_order is 1..60 with no gaps', () => {
    expect(verses.map((v) => v.sortOrder)).toEqual(Array.from({ length: 60 }, (_, i) => i + 1));
  });

  it('L3 five series of twelve verses each, six topics per series, two verses per topic', () => {
    const bySeries = new Map<string, Map<string, number>>();
    for (const v of verses) {
      expect(v.series).toBeTruthy();
      expect(v.topicEn).toBeTruthy();
      const topics = bySeries.get(v.series) ?? new Map<string, number>();
      topics.set(v.topicEn, (topics.get(v.topicEn) ?? 0) + 1);
      bySeries.set(v.series, topics);
    }
    expect(bySeries.size).toBe(5);
    for (const [series, topics] of bySeries) {
      const count = [...topics.values()].reduce((a, b) => a + b, 0);
      expect(count).toBe(12);
      expect(topics.size).toBe(6);
      for (const [topic, n] of topics) {
        expect({ series, topic, n }).toEqual({ series, topic, n: 2 });
      }
    }
  });

  it('L4 references and slugs are unique', () => {
    const refs = new Set<string>();
    const slugs = new Set<string>();
    for (const v of verses) {
      expect(refs.has(v.referenceEn)).toBe(false);
      refs.add(v.referenceEn);
      const slug = slugifyReference(v.referenceEn);
      expect(slug).toBeTruthy();
      expect(slugs.has(slug)).toBe(false);
      slugs.add(slug);
      expect(v.id).toBe(slug); // the verse id is the slug of its English reference
    }
  });
});

describe('chunk integrity (library)', () => {
  it('L5 chunks reconstruct the verse text exactly (punctuation aside)', () => {
    for (const v of verses) {
      const joined = v.chunks.join('').replace(PUNCTUATION, '');
      const full = v.textZh.replace(PUNCTUATION, '');
      expect({ ref: v.referenceEn, joined }).toEqual({ ref: v.referenceEn, joined: full });
    }
  });

  it('L6 every verse has at least two chunks, each non-empty', () => {
    for (const v of verses) {
      expect(v.chunks.length).toBeGreaterThanOrEqual(2);
      v.chunks.forEach((c) => {
        expect(c.length).toBeGreaterThan(0);
      });
    }
  });

  it('L8 text is simplified Chinese with no editorial glosses', () => {
    for (const v of verses) {
      expect(/[（(][^）)]*[）)]/.test(v.textZh)).toBe(false); // no gloss
      expect(/[〔〕]/.test(v.textZh)).toBe(false); // no bracket markers
    }
  });
});

describe('traditional-script companions (library)', () => {
  it('L10 every verse and chunk has a traditional form of the same length', () => {
    for (const v of verses) {
      expect(cpLength(v.textZhHant)).toBe(cpLength(v.textZh));
      expect(cpLength(v.referenceZhHant)).toBe(cpLength(v.referenceZh));
      expect(v.chunksHant).toHaveLength(v.chunks.length);
      v.chunks.forEach((c, i) => {
        expect(cpLength(v.chunksHant[i] ?? '')).toBe(cpLength(c));
      });
    }
  });
});
