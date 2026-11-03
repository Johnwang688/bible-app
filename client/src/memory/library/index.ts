// Verse access for the active memory library (the Navigators TMS). Ported from the verse access in
// Little Lamb's mock-lesson.ts, over `library/tms.ts`.
import type { MemoryVerse } from '../types';
import { TMS_VERSES } from './tms';

/** The slug of an English reference: `John 3:16` -> `john-3-16`. Stable; it is the verse id. */
export function slugifyReference(referenceEn: string): string {
  return referenceEn
    .toLowerCase()
    .replace(/[\s:]+/g, '-') // spaces and colons -> hyphens
    .replace(/[^a-z0-9-]/g, ''); // strip everything else
}

// Sorted once at module init: the order new verses are introduced in.
const verses: readonly MemoryVerse[] = [...TMS_VERSES].sort((a, b) => a.sortOrder - b.sortOrder);
const byId = new Map<string, MemoryVerse>(verses.map((v) => [v.id, v]));

/** Total verse count: the dashboard's progress bar. */
export const TOTAL_VERSES = verses.length;

/** Look up a verse by its id (the slug, e.g. `john-3-16`). */
export function getMemoryVerse(id: string): MemoryVerse | undefined {
  return byId.get(id);
}

/** All verses, sorted by `sortOrder`. Callers copy before mutating. */
export function getAllMemoryVerses(): MemoryVerse[] {
  return [...verses];
}
