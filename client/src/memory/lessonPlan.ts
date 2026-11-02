// The local parts of Little Lamb's lesson-plan.ts: the step shape and the step-index helpers.
// Dropped (they belonged to the server round trip): isPlausibleLessonDate, parseDayEnd,
// toLessonSteps, StepSubmission, StepResult and LessonPlan.
import type { StageSlug } from './types';

/** The most steps a day's plan can hold (the ceiling `startDailyLesson` truncates to). */
export const MAX_LESSON_STEPS = 20;

/** One step of the frozen plan, as the UI navigates it. */
export interface LessonStep {
  index: number;
  verseId: string; // slug (e.g. 'john-3-16')
  stage: StageSlug;
  completed: boolean;
}

/**
 * Parse `YYYY-MM-DD` as local midnight. `new Date('2026-08-01')` is parsed as
 * UTC by spec and would land on the previous day west of Greenwich; the day
 * planner keys off local day parity, so it has to be local midnight here.
 */
export function parseLocalDate(value: string): Date {
  const [y = 0, m = 1, d = 1] = value.split('-').map(Number);
  return new Date(y, m - 1, d);
}

/** A step index must be a small non-negative integer. */
export function isValidStepIndex(value: unknown): value is number {
  return typeof value === 'number' && Number.isInteger(value) && value >= 0 && value < MAX_LESSON_STEPS;
}

/**
 * Parse the `?i=` step index off a lesson route. Returns null when absent or
 * junk.
 */
export function parseStepIndex(raw: string | string[] | undefined): number | null {
  if (raw === undefined) return null;
  const value = Array.isArray(raw) ? raw[0] : raw;
  if (value === undefined) return null;
  const parsed = Number.parseInt(value, 10);
  return Number.isInteger(parsed) && parsed >= 0 ? parsed : null;
}

/** Index of the first step still outstanding, or null when the plan is done. */
export function firstIncompleteIndex(steps: LessonStep[]): number | null {
  const found = steps.findIndex((s) => !s.completed);
  return found === -1 ? null : found;
}
