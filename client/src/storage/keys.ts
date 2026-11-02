// Every value the app keeps on the device, with its schema. Owned by the orchestrator (R-0).
import { z } from 'zod';

import type { LanguagePreference } from '../i18n/types';
import { TRANSLATION_IDS, type TranslationId } from '../reader/translations';
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
