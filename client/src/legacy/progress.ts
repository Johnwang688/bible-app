// The old app's reading progress, parsed. Not imported yet: its target (`reading.progress`) exists only on
// R-3's branch. After R-3 merges, a 'progress' part calls this and writes the result.
import { isChapterOf } from './books';
import { isFiniteNumber, isPlainObject, isRealDay, readJson, readRaw, stringArray } from './parse';
import type { LegacySource } from './source';

export interface LegacyProgress {
  goalMinutes: number;
  /** Real `YYYY-MM-DD` days the goal was met, de-duplicated, ascending. */
  goalMetDays: string[];
  /** Active learning time per day in ms (only the old "today"). */
  activeMs: Record<string, number>;
  /** `'book:chapter'` → when it counts as read. The old app kept no times, so every entry gets `now`. */
  chaptersRead: Record<string, string>;
}

const DEFAULT_GOAL = 10;

/** The old `normalizeDailyGoalMinutes`: parseInt, round to a step of 5, clamp to 5..120; default 10. */
function normalizeGoal(raw: string | null): number {
  const n = raw ? Number.parseInt(raw, 10) : NaN;
  if (!Number.isFinite(n)) return DEFAULT_GOAL;
  return Math.min(120, Math.max(5, Math.round(n / 5) * 5));
}

export function parseLegacyProgress(source: LegacySource, now: Date): LegacyProgress | null {
  const goalRaw = readRaw(source, 'bible-app-daily-goal-minutes');
  const progressRaw = readRaw(source, 'bible-app-reading-progress');
  const chaptersRaw = readRaw(source, 'bible-app-chapters-read');
  if (goalRaw === null && progressRaw === null && chaptersRaw === null) return null;

  const progress = readJson(source, 'bible-app-reading-progress');
  const goalMetDays: string[] = [];
  const activeMs: Record<string, number> = {};
  if (isPlainObject(progress)) {
    goalMetDays.push(...new Set(stringArray(progress.goalMetDays).filter(isRealDay)));
    goalMetDays.sort();
    const ms = progress.todayActiveLearningMs;
    if (isRealDay(progress.todayIso) && isFiniteNumber(ms) && Math.floor(ms) > 0) {
      activeMs[progress.todayIso] = Math.floor(ms);
    }
  }

  const chaptersRead: Record<string, string> = {};
  const stamp = now.toISOString();
  for (const key of stringArray(readJson(source, 'bible-app-chapters-read'))) {
    const m = /^(\d{1,2}):(\d{1,3})$/.exec(key);
    if (!m) continue;
    const book = Number(m[1]);
    const chapter = Number(m[2]);
    if (book >= 1 && book <= 66 && isChapterOf(book, chapter)) chaptersRead[`${book}:${chapter}`] = stamp;
  }

  return { goalMinutes: normalizeGoal(goalRaw), goalMetDays, activeMs, chaptersRead };
}
