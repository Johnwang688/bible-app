// The day's lesson and the streak, on the device. Ported from Little Lamb's Postgres functions
// `start_daily_lesson`, `complete_lesson_step` and `daily_lesson_streak`
// (supabase/migrations/0003_server_side_daily_completion.sql) and from daily-completion.ts.
// Pure: nothing here mutates its arguments.
import { MAX_LESSON_STEPS } from './lessonPlan';
import { toLocalDateString } from './localDate';
import { buildSession } from './session';
import type { ProgressMap, StageSlug } from './types';

export interface DailyLessonStep {
  verseId: string;
  stage: StageSlug;
  completedAt: string | null;
}

export interface DailyLessonRecord {
  /** YYYY-MM-DD, local. */
  date: string;
  /** Frozen when the day's lesson is first opened, at most MAX_LESSON_STEPS. */
  steps: DailyLessonStep[];
  /** Set when every step has `completedAt`. */
  completedAt: string | null;
}

/**
 * Open today's lesson. The plan is frozen for the day: a record for today's local date is
 * returned unchanged, even if progress has moved since, so a step never changes under the user's
 * feet and "every step done" means the same thing all day. Otherwise (no record, or yesterday's)
 * a new record is built from `buildSession`, truncated to `MAX_LESSON_STEPS`.
 */
export function startDailyLesson(
  existing: DailyLessonRecord | null,
  progress: ProgressMap,
  now: Date,
): DailyLessonRecord {
  const date = toLocalDateString(now);
  if (existing && existing.date === date) return existing;
  return {
    date,
    steps: buildSession(progress, now)
      .slice(0, MAX_LESSON_STEPS)
      .map((item) => ({ verseId: item.verseId, stage: item.stage, completedAt: null })),
    completedAt: null,
  };
}

/**
 * Tick a step off the plan. Only called for a step the trainer graded as passed.
 *
 * It records (`recorded: true`) only when `index` is in range and that step's `verseId` and
 * `stage` match: a stale step index from another day's plan, or a forged one, records nothing.
 * Recording an already-completed step is a no-op that still reports `recorded: true` and keeps
 * the first timestamp. `dayCompleted` is true when every step has a timestamp; the record's own
 * `completedAt` is set once, the first time that happens.
 */
export function completeLessonStep(
  lesson: DailyLessonRecord,
  index: number,
  verseId: string,
  stage: StageSlug,
  now: Date,
): { lesson: DailyLessonRecord; recorded: boolean; dayCompleted: boolean } {
  const step = Number.isInteger(index) && index >= 0 ? lesson.steps[index] : undefined;
  if (!step || step.verseId !== verseId || step.stage !== stage) {
    return { lesson, recorded: false, dayCompleted: false };
  }
  const stamp = now.toISOString();
  const steps = lesson.steps.map((s, i) => (i === index && s.completedAt === null ? { ...s, completedAt: stamp } : s));
  const dayCompleted = steps.every((s) => s.completedAt !== null);
  return {
    lesson: { ...lesson, steps, completedAt: dayCompleted ? (lesson.completedAt ?? stamp) : lesson.completedAt },
    recorded: true,
    dayCompleted,
  };
}

const DAY_MS = 86_400_000;

/** `YYYY-MM-DD` -> a UTC day number, so calendar arithmetic is immune to DST and to the zone. */
function dayNumber(date: string): number {
  const [y = 0, m = 1, d = 1] = date.split('-').map(Number);
  return Math.round(Date.UTC(y, m - 1, d) / DAY_MS);
}

/**
 * Consecutive completed local days ending at `asOf`. A streak survives until the day ends: if
 * `asOf` itself is not completed yet, the run ending yesterday still counts. Duplicates and order
 * in `completedDates` are harmless.
 */
export function dailyStreak(completedDates: readonly string[], asOf: string): number {
  const done = new Set(completedDates.map(dayNumber));
  const today = dayNumber(asOf);
  let day = done.has(today) ? today : today - 1;
  let streak = 0;
  while (done.has(day)) {
    streak += 1;
    day -= 1;
  }
  return streak;
}

/** The 7 days of the current week, Sunday to Saturday, in local time, as `YYYY-MM-DD`. */
export function currentWeekDates(today: Date = new Date()): string[] {
  const sunday = new Date(today.getFullYear(), today.getMonth(), today.getDate() - today.getDay());
  return Array.from({ length: 7 }, (_, i) =>
    toLocalDateString(new Date(sunday.getFullYear(), sunday.getMonth(), sunday.getDate() + i)),
  );
}

export type WeekDayState = 'done' | 'missed' | 'today' | 'future' | 'before-start';

/**
 * The week strip. `today` is `'done'` if completed, else `'today'`. A past day is `'done'` if
 * completed, else `'before-start'` when `startedOn` is set and the day is before it (a day before
 * the reader began is not a miss), else `'missed'`. A later day is `'future'`.
 */
export function weekStrip(
  completedDates: readonly string[],
  today: Date,
  startedOn: string | null,
): { date: string; state: WeekDayState }[] {
  const done = new Set(completedDates);
  const todayKey = toLocalDateString(today);
  return currentWeekDates(today).map((date) => {
    let state: WeekDayState;
    if (date === todayKey) state = done.has(date) ? 'done' : 'today';
    else if (date > todayKey) state = 'future';
    else if (done.has(date)) state = 'done';
    else if (startedOn !== null && date < startedOn) state = 'before-start';
    else state = 'missed';
    return { date, state };
  });
}
