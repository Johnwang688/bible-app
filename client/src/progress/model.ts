// Reading progress, as pure functions: when a chapter counts as read, the streak, the week row and the
// coverage map. The rules for crediting a chapter and for the streak are ported from the old app
// (frontend-next/src/features/progress/progress.ts), with one fix: days are local calendar days, not UTC.
import type { BookInfo } from '../api/schemas';
import { chapterKey, type ChapterEvidence, type ReadingProgress } from '../storage/keys';

/** A chapter counts once the reader has seen at least half of it (at least 3 verses)… */
export const MIN_CHAPTER_PROGRESS_RATIO = 0.5;
export const MIN_CHAPTER_PROGRESS_VERSES = 3;
/** …and spent 1.5 s per verse on it, at least 20 s and at most 75 s. */
export const MIN_CHAPTER_READ_MS = 20_000;
export const MAX_CHAPTER_READ_MS = 75_000;
export const CHAPTER_READ_MS_PER_VERSE = 1_500;

/** Every chapter in the Bible (the "N of 1,189" count). */
export const TOTAL_CHAPTERS = 1189;

/** The local calendar day of `date`, `"2026-11-02"`. */
export function dayKey(date: Date): string {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const d = String(date.getDate()).padStart(2, '0');
  return `${y}-${m}-${d}`;
}

/** The day `n` days after `day` (negative goes back), by the calendar, so DST changes do not matter. */
export function addDays(day: string, n: number): string {
  const [y, m, d] = day.split('-').map(Number) as [number, number, number];
  return dayKey(new Date(y, m - 1, d + n));
}

export function creditThreshold(totalVerses: number): { requiredVerse: number; requiredMs: number } {
  const requiredVerse = Math.min(
    totalVerses,
    Math.max(MIN_CHAPTER_PROGRESS_VERSES, Math.ceil(totalVerses * MIN_CHAPTER_PROGRESS_RATIO)),
  );
  const requiredMs = Math.min(MAX_CHAPTER_READ_MS, Math.max(MIN_CHAPTER_READ_MS, totalVerses * CHAPTER_READ_MS_PER_VERSE));
  return { requiredVerse, requiredMs };
}

export function qualifies(evidence: ChapterEvidence, totalVerses: number): boolean {
  const { requiredVerse, requiredMs } = creditThreshold(totalVerses);
  return evidence.furthestVerse >= requiredVerse && evidence.engagedMs >= requiredMs;
}

/**
 * Consecutive goal-met days ending today, or ending yesterday while today's goal is not met yet (so the
 * streak does not read 0 all morning).
 */
export function currentStreak(goalMetDays: readonly string[], today: string): number {
  const met = new Set(goalMetDays);
  let day = met.has(today) ? today : addDays(today, -1);
  let n = 0;
  while (met.has(day)) {
    n += 1;
    day = addDays(day, -1);
  }
  return n;
}

/** The longest run of consecutive goal-met days ever. */
export function bestStreak(goalMetDays: readonly string[]): number {
  const days = [...new Set(goalMetDays)].sort();
  let best = 0;
  let run = 0;
  let prev: string | null = null;
  for (const day of days) {
    run = prev !== null && addDays(prev, 1) === day ? run + 1 : 1;
    best = Math.max(best, run);
    prev = day;
  }
  return best;
}

export interface WeekDay {
  day: string;
  /** 0 = Monday … 6 = Sunday. */
  weekday: number;
  met: boolean;
  isToday: boolean;
  /** After today: nothing to show yet. */
  future: boolean;
}

/** Monday to Sunday of the week that holds `today`. */
export function weekOf(goalMetDays: readonly string[], today: string): WeekDay[] {
  const met = new Set(goalMetDays);
  const [y, m, d] = today.split('-').map(Number) as [number, number, number];
  const mondayOffset = (new Date(y, m - 1, d).getDay() + 6) % 7;
  return Array.from({ length: 7 }, (_, weekday) => {
    const day = addDays(today, weekday - mondayOffset);
    return { day, weekday, met: met.has(day), isToday: day === today, future: day > today };
  });
}

/** How much of a book is read, for the coverage map: 0 none … 4 every chapter. */
export type CoverageLevel = 0 | 1 | 2 | 3 | 4;

export function coverageLevel(read: number, total: number): CoverageLevel {
  if (read <= 0 || total <= 0) return 0;
  if (read >= total) return 4;
  const share = read / total;
  return share < 1 / 3 ? 1 : share < 2 / 3 ? 2 : 3;
}

export interface BookCoverage {
  bookNumber: number;
  read: number;
  total: number;
  level: CoverageLevel;
}

/** One entry per book, in canon order, counting only chapters the book has. */
export function coverage(chaptersRead: ReadingProgress['chaptersRead'], books: readonly BookInfo[]): BookCoverage[] {
  return [...books]
    .sort((a, b) => a.book_number - b.book_number)
    .map((b) => {
      let read = 0;
      for (let c = 1; c <= b.total_chapters; c++) if (chapterKey(b.book_number, c) in chaptersRead) read += 1;
      return { bookNumber: b.book_number, read, total: b.total_chapters, level: coverageLevel(read, b.total_chapters) };
    });
}

/** Today's engaged time, or 0 when nothing was read today. */
export function todayMs(progress: ReadingProgress, today: string): number {
  return progress.activeMs[today] ?? 0;
}
