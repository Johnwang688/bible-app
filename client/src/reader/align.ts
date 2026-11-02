// Pairs two translations' verses by verse number for parallel reading.
import type { VerseOut } from '../api/schemas';

export interface ParallelRow {
  verse: number;
  primary: VerseOut | null;
  secondary: VerseOut | null;
}

/** The union of verse numbers, ascending. A side without a verse gets null; nothing shifts. */
export function alignVerses(primary: VerseOut[], secondary: VerseOut[]): ParallelRow[] {
  const rows = new Map<number, ParallelRow>();
  const row = (verse: number): ParallelRow => {
    let r = rows.get(verse);
    if (!r) rows.set(verse, (r = { verse, primary: null, secondary: null }));
    return r;
  };
  for (const v of primary) row(v.verse).primary = v;
  for (const v of secondary) row(v.verse).secondary = v;
  return [...rows.values()].sort((a, b) => a.verse - b.verse);
}
