// Values only Home keeps on the device. A file of its own so the shared `storage/keys.ts` stays untouched.
// Owned by the orchestrator (R-4).
import { z } from 'zod';

import { TRANSLATION_IDS, type TranslationId } from '../reader/translations';
import type { StorageKey } from '../storage/storage';

/** The last verse of the day Home showed, so it can still show it when the chapter can't load later that day. */
export interface LastVerse {
  /** The local day it was the verse of the day for (`dayKey`, YYYY-MM-DD). */
  day: string;
  translation: TranslationId;
  bookNumber: number;
  chapter: number;
  verse: number;
  /** The verse text as the API returned it (alternate readings still marked). */
  text: string;
}

export const lastVerseKey: StorageKey<LastVerse | null> = {
  key: 'home.lastVerse',
  version: 1,
  schema: z
    .object({
      day: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
      translation: z.enum(TRANSLATION_IDS),
      bookNumber: z.number().int().min(1).max(66),
      chapter: z.number().int().min(1).max(150),
      verse: z.number().int().min(1).max(176),
      text: z.string().min(1).max(2000),
    })
    .nullable(),
  fallback: null,
};
