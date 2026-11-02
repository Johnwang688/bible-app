// What the Memory section keeps on the device, with its schemas. Same pattern as `keys.ts`.
import { z } from 'zod';

import type { DailyLessonRecord } from '../memory/dailyLesson';
import { MAX_LESSON_STEPS } from '../memory/lessonPlan';
import type { ProgressMap } from '../memory/types';
import type { StorageKey } from './storage';

/** A verse id: the slug of its English reference. */
const verseId = z.string().max(64).regex(/^[a-z0-9]+(?:-[a-z0-9]+)*$/);

const isoInstant = z.iso.datetime();

/** `YYYY-MM-DD` that is a real calendar date (`2026-02-30` fails). */
const localDate = z
  .string()
  .regex(/^\d{4}-\d{2}-\d{2}$/)
  .refine((s) => {
    const [y = 0, m = 0, d = 0] = s.split('-').map(Number);
    const date = new Date(Date.UTC(y, m - 1, d));
    return date.getUTCFullYear() === y && date.getUTCMonth() === m - 1 && date.getUTCDate() === d;
  });

/** Per-verse memory progress: stage, counters, mastery and the review schedule. */
export const memoryProgressKey: StorageKey<ProgressMap> = {
  key: 'memory.progress',
  version: 1,
  schema: z.record(
    verseId,
    z.object({
      stage: z.enum(['chunk_order', 'fill_blank', 'full_recall', 'review']),
      successes: z.number().int().min(0),
      failures: z.number().int().min(0),
      masteryScore: z.number().int().min(0).max(100),
      nextDueAt: isoInstant.nullable(),
      lastReviewedAt: isoInstant.nullable(),
      lapsedAt: isoInstant.nullable(),
    }),
  ),
  fallback: {},
};

/** The day's frozen lesson plan and which steps are ticked. `null` until the first lesson opens. */
export const memoryLessonKey: StorageKey<DailyLessonRecord | null> = {
  key: 'memory.lesson',
  version: 1,
  schema: z
    .object({
      date: localDate,
      steps: z
        .array(
          z.object({
            verseId,
            stage: z.enum(['chunk-order', 'fill-blank', 'full-recall']),
            completedAt: isoInstant.nullable(),
          }),
        )
        .max(MAX_LESSON_STEPS),
      completedAt: isoInstant.nullable(),
    })
    .nullable(),
  fallback: null,
};

export interface MemoryHistory {
  /** The local date of the first recorded attempt; days before it are not misses. */
  startedOn: string | null;
  /** Local dates (ascending) on which the whole day's lesson was completed. */
  completedDates: string[];
}

/** The days the reader started and completed: the streak and the week strip read this. */
export const memoryHistoryKey: StorageKey<MemoryHistory> = {
  key: 'memory.history',
  version: 1,
  schema: z.object({
    startedOn: localDate.nullable(),
    completedDates: z.array(localDate).max(1000),
  }),
  fallback: { startedOn: null, completedDates: [] },
};

export interface MemorySettings {
  /** The spoken language the reader recites in. */
  speech: 'mandarin' | 'cantonese';
  /** The Chinese script the library is shown in. */
  script: 'simplified' | 'traditional';
  /** Voice answers on. Off: typing only, nothing is recorded or uploaded. */
  voice: boolean;
  /** The consent sheet was answered with Allow. */
  voiceConsent: boolean;
}

/** Memory settings: the speech language, the script and the voice choices. v2 added `voice` and `voiceConsent`. */
export const memorySettingsKey: StorageKey<MemorySettings> = {
  key: 'memory.settings',
  version: 2,
  schema: z.object({
    speech: z.enum(['mandarin', 'cantonese']),
    script: z.enum(['simplified', 'traditional']),
    voice: z.boolean(),
    voiceConsent: z.boolean(),
  }),
  fallback: { speech: 'mandarin', script: 'simplified', voice: true, voiceConsent: false },
  migrate: (from, data) =>
    from === 1 && data !== null && typeof data === 'object' ? { ...data, voice: true, voiceConsent: false } : undefined,
};
