// Pure view logic for the Memory screens: stage labels, the library's grouping, the best streak and the past weeks.
// Nothing here reads storage or the clock; the screens pass those in.
import type { MemoryHistory } from '../storage/memoryKeys';
import { toLocalDateString } from './localDate';
import type { WeekDayState } from './dailyLesson';
import type { MemoryVerse, ProgressMap, VerseProgress } from './types';

const DAY_MS = 86_400_000;

/** `YYYY-MM-DD` -> a UTC day number, so calendar arithmetic is immune to DST and to the zone. */
function dayNumber(date: string): number {
  const [y = 0, m = 1, d = 1] = date.split('-').map(Number);
  return Math.round(Date.UTC(y, m - 1, d) / DAY_MS);
}

/** The longest run of consecutive completed days, ever. Duplicates and order do not matter. */
export function bestStreak(completedDates: readonly string[]): number {
  const days = [...new Set(completedDates.map(dayNumber))].sort((a, b) => a - b);
  let best = 0;
  let run = 0;
  let prev = Number.NaN;
  for (const day of days) {
    run = day === prev + 1 ? run + 1 : 1;
    if (run > best) best = run;
    prev = day;
  }
  return best;
}

/**
 * The `n` weeks before the current one, most recent first, each Sunday to Saturday. A day is `'done'` if completed,
 * `'before-start'` if it is before `startedOn`, else `'missed'` (every day of a past week is past).
 */
export function pastWeeks(
  history: MemoryHistory,
  today: Date,
  n: number,
): { start: string; days: { date: string; state: WeekDayState }[] }[] {
  const done = new Set(history.completedDates);
  const { startedOn } = history;
  return Array.from({ length: n }, (_, week) => {
    const sunday = new Date(today.getFullYear(), today.getMonth(), today.getDate() - today.getDay() - 7 * (week + 1));
    const days = Array.from({ length: 7 }, (_, i) => {
      const date = toLocalDateString(new Date(sunday.getFullYear(), sunday.getMonth(), sunday.getDate() + i));
      // Never started: every past day is before the start, not a miss (as the current week draws it).
      const state: WeekDayState = done.has(date) ? 'done' : startedOn === null || date < startedOn ? 'before-start' : 'missed';
      return { date, state };
    });
    return { start: days[0]!.date, days };
  });
}

/**
 * Local calendar days from today to the local date of the due instant, never below 0 (0 = due today or overdue).
 * Null when the verse has never been scheduled (or the value does not parse).
 */
export function daysUntilDue(nextDueAt: string | null, now: Date): number | null {
  if (nextDueAt === null) return null;
  const due = new Date(nextDueAt);
  if (Number.isNaN(due.getTime())) return null;
  return Math.max(0, dayNumber(toLocalDateString(due)) - dayNumber(toLocalDateString(now)));
}

export type StageName = 'new' | 'ordering' | 'fill-in' | 'recall' | 'reviewing';

/** A verse's stage as the library shows it, with how many of the 4 steps of the ladder it has climbed. */
export function stageView(row: VerseProgress | undefined): { stage: StageName; steps: 0 | 1 | 2 | 3 | 4 } {
  switch (row?.stage) {
    case undefined:
      return { stage: 'new', steps: 0 };
    case 'chunk_order':
      return { stage: 'ordering', steps: 1 };
    case 'fill_blank':
      return { stage: 'fill-in', steps: 2 };
    case 'full_recall':
      return { stage: 'recall', steps: 3 };
    case 'review':
      return { stage: 'reviewing', steps: 4 };
  }
}

/** Verses at `review`. */
export function learnedCount(progress: ProgressMap): number {
  return Object.values(progress).filter((row) => row.stage === 'review').length;
}

export interface LibraryTopic<V extends MemoryVerse = MemoryVerse> {
  topicEn: string;
  topicZh: string;
  verses: V[];
}

export interface LibraryGroup<V extends MemoryVerse = MemoryVerse> {
  series: string;
  seriesEn: string;
  seriesZh: string;
  topics: LibraryTopic<V>[];
}

/** The library as series, then topics, then verses, in the order the verses are given (library order). */
export function libraryGroups<V extends MemoryVerse>(verses: V[]): LibraryGroup<V>[] {
  const groups: LibraryGroup<V>[] = [];
  for (const verse of verses) {
    let group = groups[groups.length - 1];
    if (!group || group.series !== verse.series) {
      group = { series: verse.series, seriesEn: verse.seriesEn, seriesZh: verse.seriesZh, topics: [] };
      groups.push(group);
    }
    let topic = group.topics[group.topics.length - 1];
    if (!topic || topic.topicEn !== verse.topicEn) {
      topic = { topicEn: verse.topicEn, topicZh: verse.topicZh, verses: [] };
      group.topics.push(topic);
    }
    topic.verses.push(verse);
  }
  return groups;
}
