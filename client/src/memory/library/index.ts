// Verse access for the active memory library (the Navigators TMS). Ported from the verse access in
// Little Lamb's mock-lesson.ts, over `library/tms.ts` (the Chinese) and `library/tmsEnglish.ts` (the English).
import type { LibraryVerse } from '../types';
import { TMS_VERSES } from './tms';
import { TMS_ENGLISH, TMS_ENGLISH_TRANSLATION } from './tmsEnglish';

/** Which English translation the verses are in ('ESV', or 'BSB' until the ESV key is set): the notice reads it. */
export { TMS_ENGLISH_TRANSLATION };

/** The slug of an English reference: `John 3:16` -> `john-3-16`. Stable; it is the verse id. */
export function slugifyReference(referenceEn: string): string {
  return referenceEn
    .toLowerCase()
    .replace(/[\s:]+/g, '-') // spaces and colons -> hyphens
    .replace(/[^a-z0-9-]/g, ''); // strip everything else
}

// Merged and sorted once at module init: the order new verses are introduced in. A verse without its English row is
// a broken data file, so it fails here, at load, rather than on some later screen.
const verses: readonly LibraryVerse[] = [...TMS_VERSES]
  .sort((a, b) => a.sortOrder - b.sortOrder)
  .map((verse) => {
    const english = TMS_ENGLISH[verse.id];
    if (!english) throw new Error(`memory library: no English text for ${verse.id}`);
    return { ...verse, textEn: english.text, chunksEn: english.chunks };
  });
const byId = new Map<string, LibraryVerse>(verses.map((v) => [v.id, v]));

/** Total verse count: the dashboard's progress bar. */
export const TOTAL_VERSES = verses.length;

/** Look up a verse by its id (the slug, e.g. `john-3-16`). */
export function getMemoryVerse(id: string): LibraryVerse | undefined {
  return byId.get(id);
}

/** All verses, sorted by `sortOrder`. Callers copy before mutating. */
export function getAllMemoryVerses(): LibraryVerse[] {
  return [...verses];
}
