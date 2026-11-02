// Reading progress as the screens show it: today's time against the goal, the streak, this week and the
// chapters explored. Derived from storage on every change; `now` decides what "today" is.
import { useMemo } from 'react';

import { chapterKey, readingProgressKey, type ReadingProgress } from '../storage/keys';
import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import { bestStreak, currentStreak, dayKey, todayMs, weekOf, type WeekDay } from './model';

export interface ReadingProgressView {
  progress: ReadingProgress;
  today: string;
  todayMs: number;
  goalMinutes: number;
  /** Whole minutes read today, never above the goal (the bar is full at the goal). */
  goalProgressMinutes: number;
  goalMet: boolean;
  streak: number;
  best: number;
  week: WeekDay[];
  /** Chapters credited as read, any translation. */
  exploredCount: number;
  isRead(bookNumber: number, chapter: number): boolean;
}

export function useReadingProgress(opts?: { storage?: Storage; now?: () => Date }): ReadingProgressView {
  const storage = useMemo(() => opts?.storage ?? getStorage(), [opts?.storage]);
  const [progress] = useStoredValue(storage, readingProgressKey);
  const today = dayKey((opts?.now ?? (() => new Date()))());
  return useMemo(() => {
    const ms = todayMs(progress, today);
    const goalMs = progress.goalMinutes * 60_000;
    return {
      progress,
      today,
      todayMs: ms,
      goalMinutes: progress.goalMinutes,
      goalProgressMinutes: Math.min(progress.goalMinutes, Math.floor(ms / 60_000)),
      goalMet: ms >= goalMs || progress.goalMetDays.includes(today),
      streak: currentStreak(progress.goalMetDays, today),
      best: bestStreak(progress.goalMetDays),
      week: weekOf(progress.goalMetDays, today),
      exploredCount: Object.keys(progress.chaptersRead).length,
      isRead: (bookNumber, chapter) => chapterKey(bookNumber, chapter) in progress.chaptersRead,
    };
  }, [progress, today]);
}
