// The Memory section's store: applies a graded step to the device's progress, as Little Lamb's
// trainers did on a graded verdict (`recordAttempt`, then on a pass `setStageAtLeast(nextStageAfter(stage))`),
// and ticks a passed step off the day's lesson. Synchronous reads and writes, so two calls cannot interleave.
import {
  memoryHistoryKey,
  memoryLessonKey,
  memoryProgressKey,
  type MemoryHistory,
} from '../storage/memoryKeys';
import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import { completeLessonStep, dailyStreak, startDailyLesson, type DailyLessonRecord } from './dailyLesson';
import { getMemoryVerse } from './library';
import { endOfLocalDay, toLocalDateString } from './localDate';
import { promoteStage, recordAttempt } from './schedule';
import { nextStageAfter } from './stages';
import type { ProgressMap, StageSlug, VerseProgress } from './types';

export interface SubmitStepInput {
  /** The step's position in today's lesson, or null for free practice. */
  index: number | null;
  verseId: string;
  stage: StageSlug;
  /** The trainer's verdict. */
  passed: boolean;
  now?: Date;
}

export interface SubmitStepResult {
  /** Whether a lesson step was ticked (or was already ticked). */
  recorded: boolean;
  dayCompleted: boolean;
  streak: number;
  /** The verse's row after the attempt; undefined for a verse that is not in the library. */
  progress: VerseProgress | undefined;
}

export interface MemoryStore {
  progress(): ProgressMap;
  /** Today's lesson: opens (and stores) a new plan when the stored one is from another day. */
  todayLesson(now?: Date): DailyLessonRecord;
  submitStep(input: SubmitStepInput): SubmitStepResult;
  streak(now?: Date): number;
}

export function createMemoryStore(storage: Storage): MemoryStore {
  const streak = (now: Date): number =>
    dailyStreak(storage.get(memoryHistoryKey).completedDates, toLocalDateString(now));

  return {
    progress: () => storage.get(memoryProgressKey),

    todayLesson(now = new Date()) {
      const stored = storage.get(memoryLessonKey);
      const lesson = startDailyLesson(stored, storage.get(memoryProgressKey), now);
      if (lesson !== stored) storage.set(memoryLessonKey, lesson);
      return lesson;
    },

    submitStep({ index, verseId, stage, passed, now = new Date() }) {
      if (!getMemoryVerse(verseId)) {
        return { recorded: false, dayCompleted: false, streak: streak(now), progress: undefined };
      }

      // Two writers, two jobs: the attempt moves the counters and the schedule, the promotion only
      // the stage, and only on a pass (and only as far as the successes have paid for).
      const map = storage.get(memoryProgressKey);
      let row = recordAttempt(map[verseId], passed, now, endOfLocalDay(now));
      if (passed) row = promoteStage(row, nextStageAfter(stage));
      storage.set(memoryProgressKey, { ...map, [verseId]: row });

      const today = toLocalDateString(now);
      const history = storage.get(memoryHistoryKey);
      let completedDates = history.completedDates;
      let startedOn = history.startedOn;
      if (startedOn === null) startedOn = today;

      // Only a pass ticks a step, and only on the plan of today's local date: an index carried
      // over from yesterday's plan must not tick today's.
      let recorded = false;
      let dayCompleted = false;
      const stored = storage.get(memoryLessonKey);
      if (passed && index !== null && stored && stored.date === today) {
        const out = completeLessonStep(stored, index, verseId, stage, now);
        recorded = out.recorded;
        dayCompleted = out.dayCompleted;
        if (out.recorded) {
          storage.set(memoryLessonKey, out.lesson);
          if (out.dayCompleted && stored.completedAt === null && !completedDates.includes(today)) {
            completedDates = [...completedDates, today].sort();
          }
        }
      }

      if (startedOn !== history.startedOn || completedDates !== history.completedDates) {
        storage.set(memoryHistoryKey, { startedOn, completedDates });
      }
      return { recorded, dayCompleted, streak: streak(now), progress: row };
    },

    streak,
  };
}

/** The stored progress map as React state. */
export function useMemoryProgress(storage: Storage = getStorage()): [ProgressMap, (value: ProgressMap) => void] {
  return useStoredValue(storage, memoryProgressKey);
}

/** The stored start date and completed days as React state. */
export function useMemoryHistory(storage: Storage = getStorage()): [MemoryHistory, (value: MemoryHistory) => void] {
  return useStoredValue(storage, memoryHistoryKey);
}
