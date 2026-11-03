// The daily reading goal, as pure rules over the stored reading progress.
// setDailyGoal is a read-modify-write: it reads the latest stored value on every call and never caches it.
import { DEFAULT_GOAL_MINUTES, MAX_GOAL_MINUTES, MIN_GOAL_MINUTES, readingProgressKey } from '../storage/keys';
import type { Storage } from '../storage/storage';

export const GOAL_STEP = 5;
export const GOAL_CHOICES = [5, 10, 15, 20, 30, 45, 60] as const;

/** Rounds to the nearest multiple of GOAL_STEP and clamps to the allowed range. Non-finite input gives the default. */
export function clampGoal(minutes: number): number {
  if (!Number.isFinite(minutes)) return DEFAULT_GOAL_MINUTES;
  const rounded = Math.round(minutes / GOAL_STEP) * GOAL_STEP;
  return Math.min(MAX_GOAL_MINUTES, Math.max(MIN_GOAL_MINUTES, rounded));
}

export function stepGoal(current: number, direction: 1 | -1): number {
  return clampGoal(current + direction * GOAL_STEP);
}

/**
 * Stores the clamped goal. If today's reading already meets the new goal, today is added to `goalMetDays`.
 * Days are never removed. Writes only when something changed.
 */
export function setDailyGoal(storage: Storage, minutes: number, today: string): void {
  const latest = storage.get(readingProgressKey);
  const goalMinutes = clampGoal(minutes);
  const metToday = (latest.activeMs[today] ?? 0) >= goalMinutes * 60_000;
  const addToday = metToday && !latest.goalMetDays.includes(today);
  if (goalMinutes === latest.goalMinutes && !addToday) return;

  const goalMetDays = addToday ? [...latest.goalMetDays, today].sort() : latest.goalMetDays;
  storage.set(readingProgressKey, { ...latest, goalMinutes, goalMetDays: [...goalMetDays] });
}
