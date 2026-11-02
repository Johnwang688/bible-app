// Every value the app keeps on the device, with its schema. Owned by the orchestrator (R-0).
import { z } from 'zod';

import type { LanguagePreference } from '../i18n/types';
import { TRANSLATION_IDS, type TranslationId } from '../reader/translations';
import { HIGHLIGHT_IDS, type HighlightId } from '../theme/highlights';
import { PRESET_IDS, type AppearanceChoice } from '../theme/types';
import type { StorageKey } from './storage';

export const appearanceKey: StorageKey<AppearanceChoice> = {
  key: 'appearance',
  version: 1,
  schema: z.object({
    preset: z.enum(PRESET_IDS).nullable(),
    mode: z.enum(['system', 'light', 'dark']),
  }),
  fallback: { preset: null, mode: 'system' },
};

export const languageKey: StorageKey<LanguagePreference> = {
  key: 'language',
  version: 1,
  schema: z.enum(['system', 'en', 'zh-Hans']),
  fallback: 'system',
};

// ---- Reader (R-1) ----

const translationId = z.enum(TRANSLATION_IDS);

export interface ReaderPosition {
  bookNumber: number;
  chapter: number;
  translation: TranslationId;
}

const positionSchema = z.object({
  bookNumber: z.number().int().min(1).max(66),
  chapter: z.number().int().min(1).max(150),
  translation: translationId,
});

/** The last place read. `null` until the reader first opens a chapter. */
export const readerPositionKey: StorageKey<ReaderPosition | null> = {
  key: 'reader.position',
  version: 1,
  schema: positionSchema.nullable(),
  fallback: null,
};

/** Recent passages for the picker, most recent first, at most RECENT_LIMIT, one per book and chapter. */
export const RECENT_LIMIT = 5;
export const recentPassagesKey: StorageKey<ReaderPosition[]> = {
  key: 'reader.recent',
  version: 1,
  schema: z.array(positionSchema).max(RECENT_LIMIT),
  fallback: [],
};

/** Scripture sizes in px (reading settings → Text size). The default, 20, matches the design. */
export const TEXT_SIZES = [16, 18, 20, 22, 24, 28] as const;
export const DEFAULT_TEXT_SIZE_INDEX = 2;

export interface ReadingSettings {
  /** Index into TEXT_SIZES. */
  textSize: number;
  /** The second translation for parallel reading, or null when parallel reading is off. */
  parallel: TranslationId | null;
}

export const readingSettingsKey: StorageKey<ReadingSettings> = {
  key: 'reader.settings',
  version: 1,
  schema: z.object({
    textSize: z.number().int().min(0).max(TEXT_SIZES.length - 1),
    parallel: translationId.nullable(),
  }),
  fallback: { textSize: DEFAULT_TEXT_SIZE_INDEX, parallel: null },
};

// ---- Study items (R-2): highlights, notes and bookmarks, local first ----

/** A verse reference. Study items attach to references, so they show in every translation. */
export interface VerseRef {
  bookNumber: number;
  chapter: number;
  verse: number;
}

/** `"43:3:16"`: the key study items are stored under. */
export const refKey = (r: VerseRef): string => `${r.bookNumber}:${r.chapter}:${r.verse}`;

const refKeySchema = z.string().regex(/^([1-9]|[1-5]\d|6[0-6]):([1-9]\d{0,2}):([1-9]\d{0,2})$/);
export const NOTE_MAX_LENGTH = 5000;

export interface StudyItems {
  highlights: Record<string, { colour: HighlightId; updatedAt: string }>;
  notes: Record<string, { text: string; updatedAt: string }>;
  bookmarks: Record<string, { createdAt: string }>;
}

const studyItemsSchema = z.object({
  highlights: z.record(refKeySchema, z.object({ colour: z.enum(HIGHLIGHT_IDS), updatedAt: z.string() })),
  notes: z.record(refKeySchema, z.object({ text: z.string().min(1).max(NOTE_MAX_LENGTH), updatedAt: z.string() })),
  bookmarks: z.record(refKeySchema, z.object({ createdAt: z.string() })),
});

/** When a highlight saved before highlights had a time (version 1) says it was made. */
export const UNKNOWN_TIME = '1970-01-01T00:00:00.000Z';

export const studyItemsKey: StorageKey<StudyItems> = {
  key: 'study.items',
  // 2 (R-3): highlights carry the time they were set, for the Study list.
  version: 2,
  schema: studyItemsSchema,
  fallback: { highlights: {}, notes: {}, bookmarks: {} },
  migrate: (from, data) => {
    if (from !== 1 || !data || typeof data !== 'object') return undefined;
    const v1 = data as { highlights?: unknown };
    if (!v1.highlights || typeof v1.highlights !== 'object') return undefined;
    const highlights = Object.fromEntries(
      Object.entries(v1.highlights as Record<string, unknown>).map(([k, colour]) => [k, { colour, updatedAt: UNKNOWN_TIME }]),
    );
    return { ...(data as object), highlights };
  },
};

// ---- Reading progress (R-3): time read per day, the daily goal and the chapters explored ----

/** `"43:3"`: a chapter, in any translation. */
export const chapterKey = (bookNumber: number, chapter: number): string => `${bookNumber}:${chapter}`;
const chapterKeySchema = z.string().regex(/^([1-9]|[1-5]\d|6[0-6]):([1-9]\d{0,2})$/);
/** A local calendar day, `"2026-11-02"`. */
const dayKeySchema = z.string().regex(/^\d{4}-\d{2}-\d{2}$/);

export const DEFAULT_GOAL_MINUTES = 10;
export const MIN_GOAL_MINUTES = 5;
export const MAX_GOAL_MINUTES = 120;

export interface ChapterEvidence {
  /** The furthest verse the reader has had on screen. */
  furthestVerse: number;
  /** Engaged reading time on the chapter today. */
  engagedMs: number;
}

export interface ReadingProgress {
  /** The daily goal in minutes, a multiple of 5 from MIN_GOAL_MINUTES to MAX_GOAL_MINUTES. */
  goalMinutes: number;
  /** Engaged reading time per local day. */
  activeMs: Record<string, number>;
  /** The days the goal was met (kept even if the goal changes later), oldest first, no repeats. */
  goalMetDays: string[];
  /** Chapters credited as read (any translation), with the time first credited. */
  chaptersRead: Record<string, string>;
  /** Today's evidence per chapter; reset when the day changes. */
  evidence: { day: string; chapters: Record<string, ChapterEvidence> };
}

export const readingProgressKey: StorageKey<ReadingProgress> = {
  key: 'reading.progress',
  version: 1,
  schema: z.object({
    goalMinutes: z.number().int().min(MIN_GOAL_MINUTES).max(MAX_GOAL_MINUTES).multipleOf(5),
    activeMs: z.record(dayKeySchema, z.number().int().min(0)),
    goalMetDays: z.array(dayKeySchema),
    chaptersRead: z.record(chapterKeySchema, z.string()),
    evidence: z.object({
      day: z.string(),
      chapters: z.record(
        chapterKeySchema,
        z.object({ furthestVerse: z.number().int().min(0), engagedMs: z.number().int().min(0) }),
      ),
    }),
  }),
  fallback: { goalMinutes: DEFAULT_GOAL_MINUTES, activeMs: {}, goalMetDays: [], chaptersRead: {}, evidence: { day: '', chapters: {} } },
};
