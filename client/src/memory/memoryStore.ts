// The Memory section's store: applies a graded step to the device's progress, as Little Lamb's
// trainers did on a graded verdict (`recordAttempt`, then on a pass `setStageAtLeast(nextStageAfter(stage))`),
// and ticks a passed step off the day's lesson. Reads and writes are synchronous, but a storage listener
// may call back in mid-write, so `submitStep` re-applies its changes to the stored value at each write.
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

/** The most completed dates the stored history keeps (the schema's cap). */
const MAX_COMPLETED_DATES = 1000;

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
      // Invariants:
      // - Validate, then write: every value this call would store is computed from the current
      //   stored values and parsed against its key's schema before the first `storage.set`, so a
      //   rejected value throws with nothing written.
      // - Each write re-reads its key and re-applies this call's delta (the attempt row, the lesson
      //   tick, the history addition) to the value as stored at that moment, never to a snapshot
      //   taken before an earlier write notified listeners.
      // - Re-entrant calls are safe: a listener that calls `submitStep` from inside one of these
      //   writes sees fully stored values, and its changes are kept by the writes that follow.
      //   Writes go progress, lesson, history: whether the day became completed is decided by the
      //   lesson write, and the history write follows from it.
      if (!getMemoryVerse(verseId)) {
        return { recorded: false, dayCompleted: false, streak: streak(now), progress: undefined };
      }
      const today = toLocalDateString(now);

      // Two writers, two jobs: the attempt moves the counters and the schedule, the promotion only
      // the stage, and only on a pass (and only as far as the successes have paid for).
      const applyAttempt = (map: ProgressMap): { map: ProgressMap; row: VerseProgress } => {
        let row = recordAttempt(map[verseId], passed, now, endOfLocalDay(now));
        if (passed) row = promoteStage(row, nextStageAfter(stage));
        return { map: { ...map, [verseId]: row }, row };
      };

      // Only a pass ticks a step, and only on the plan of today's local date: an index carried
      // over from yesterday's plan must not tick today's. `justCompleted` is whether this tick
      // turned an incomplete day into a completed one.
      const applyTick = (lesson: DailyLessonRecord | null) => {
        if (!passed || index === null || !lesson || lesson.date !== today) {
          return { lesson: null, recorded: false, dayCompleted: false, justCompleted: false };
        }
        const out = completeLessonStep(lesson, index, verseId, stage, now);
        if (!out.recorded) return { lesson: null, recorded: false, dayCompleted: out.dayCompleted, justCompleted: false };
        return {
          lesson: out.lesson,
          recorded: true,
          dayCompleted: out.dayCompleted,
          justCompleted: out.dayCompleted && lesson.completedAt === null,
        };
      };

      // The first attempt starts the history; a newly completed day is added once. `startedOn` is
      // the earlier of the stored date and this call's day (both YYYY-MM-DD, so a string compare
      // orders them): a nested submit that runs after midnight must not move it to the later day.
      // Stored history may hold duplicates, so they are dropped before the cap: no distinct day is
      // lost while there is room. Only the recent run matters to the streak, so the cap drops the
      // oldest. Null when nothing changes.
      const applyHistory = (history: MemoryHistory, justCompleted: boolean): MemoryHistory | null => {
        const startedOn =
          history.startedOn === null ? today : history.startedOn < today ? history.startedOn : today;
        const addDay = justCompleted && !history.completedDates.includes(today);
        if (startedOn === history.startedOn && !addDay) return null;
        const completedDates = addDay
          ? [...new Set([...history.completedDates, today])].sort().slice(-MAX_COMPLETED_DATES)
          : history.completedDates;
        return { startedOn, completedDates };
      };

      // Validate every candidate first.
      const progressCandidate = applyAttempt(storage.get(memoryProgressKey));
      const tickCandidate = applyTick(storage.get(memoryLessonKey));
      const historyCandidate = applyHistory(storage.get(memoryHistoryKey), tickCandidate.justCompleted);
      memoryProgressKey.schema.parse(progressCandidate.map);
      if (tickCandidate.lesson) memoryLessonKey.schema.parse(tickCandidate.lesson);
      if (historyCandidate) memoryHistoryKey.schema.parse(historyCandidate);

      // Then write, each key re-read and its delta re-applied at the moment of its write.
      const attempt = applyAttempt(storage.get(memoryProgressKey));
      storage.set(memoryProgressKey, attempt.map);
      const tick = applyTick(storage.get(memoryLessonKey));
      if (tick.lesson) storage.set(memoryLessonKey, tick.lesson);
      const history = applyHistory(storage.get(memoryHistoryKey), tick.justCompleted);
      if (history) storage.set(memoryHistoryKey, history);

      return { recorded: tick.recorded, dayCompleted: tick.dayCompleted, streak: streak(now), progress: attempt.row };
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
