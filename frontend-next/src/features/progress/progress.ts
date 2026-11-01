import type { ChapterReadEvidence, DailyVerse, ReadingProgress } from '@/features/reader/types';
import { STORAGE_KEYS } from '@/lib/storageKeys';

/** Morning / afternoon / evening from local clock (`getHours` uses the device timezone). */
export function timeOfDayGreeting(now: Date): string {
  const h = now.getHours();
  if (h >= 5 && h < 12) return 'Good morning';
  if (h >= 12 && h < 17) return 'Good afternoon';
  return 'Good evening';
}

export const LAST_POSITION_STORAGE_KEY = STORAGE_KEYS.LAST_POSITION;
export const RECENT_PASSAGES_STORAGE_KEY = STORAGE_KEYS.RECENT_PASSAGES;
export const HIGHLIGHTS_STORAGE_KEY = STORAGE_KEYS.HIGHLIGHTS;
export const BOOKMARKS_STORAGE_KEY = STORAGE_KEYS.BOOKMARKS;
export const NOTES_STORAGE_KEY = STORAGE_KEYS.NOTES;
export const READING_PROGRESS_STORAGE_KEY = STORAGE_KEYS.READING_PROGRESS;
export const CHAPTERS_READ_STORAGE_KEY = STORAGE_KEYS.CHAPTERS_READ;
export const DAILY_GOAL_MINUTES_STORAGE_KEY = STORAGE_KEYS.DAILY_GOAL;
export const DEFAULT_DAILY_GOAL_MINUTES = 10;
export const MIN_DAILY_GOAL_MINUTES = 5;
export const MAX_DAILY_GOAL_MINUTES = 120;
export const READER_SETTINGS_STORAGE_KEY = STORAGE_KEYS.READER_SETTINGS;
export const ONBOARDING_STORAGE_KEY = STORAGE_KEYS.ONBOARDING;

export const MAX_RECENT_PASSAGES = 8;
export const MIN_CHAPTER_PROGRESS_RATIO = 0.5;
export const MIN_CHAPTER_PROGRESS_VERSES = 3;
export const MIN_CHAPTER_READ_MS = 20_000;
export const MAX_CHAPTER_READ_MS = 75_000;
export const CHAPTER_READ_MS_PER_VERSE = 1_500;
export const MAX_ENGAGEMENT_GAP_MS = 15_000;
export const SCROLL_ACTIVE_HOLD_MS = 220;
export const ENGAGEMENT_COMMIT_MS = 240;
export const COMMENTARY_SYNC_THROTTLE_MS = 120;
export const DAILY_VERSE_POOL: DailyVerse[] = [
  { book: 'Psalms', chapter: 23, verse: 1, text: 'The LORD is my shepherd: I shall lack nothing.' },
  { book: 'Proverbs', chapter: 3, verse: 5, text: 'Trust in Yahweh with all your heart, and do not lean on your own understanding.' },
  { book: 'Isaiah', chapter: 41, verse: 10, text: "Don't be afraid, for I am with you. Don't be dismayed, for I am your God." },
  { book: 'Matthew', chapter: 11, verse: 28, text: 'Come to me, all you who labor and are heavily burdened, and I will give you rest.' },
  { book: 'John', chapter: 14, verse: 27, text: 'Peace I leave with you. My peace I give to you; not as the world gives, give I to you.' },
  { book: 'Romans', chapter: 8, verse: 28, text: 'We know that all things work together for good for those who love God, to those who are called according to his purpose.' },
  { book: '2 Corinthians', chapter: 5, verse: 7, text: 'For we walk by faith, not by sight.' },
  { book: 'Galatians', chapter: 6, verse: 9, text: "Let's not be weary in doing good, for we will reap in due season, if we don't give up." },
  { book: 'Philippians', chapter: 4, verse: 6, text: 'In nothing be anxious, but in everything, by prayer and petition with thanksgiving, let your requests be made known to God.' },
  { book: 'Hebrews', chapter: 11, verse: 1, text: 'Now faith is assurance of things hoped for, proof of things not seen.' },
  { book: '1 Peter', chapter: 5, verse: 7, text: 'Casting all your worries on him, because he cares for you.' },
  { book: 'Lamentations', chapter: 3, verse: 23, text: 'They are new every morning; great is your faithfulness.' },
];

export function computeTodayIso() {
  return new Date().toISOString().slice(0, 10);
}

export function selectDailyVerse(todayIso: string): DailyVerse {
  const seed = todayIso.replace(/-/g, '').split('').reduce((sum, digit) => sum + Number(digit), 0);
  return DAILY_VERSE_POOL[seed % DAILY_VERSE_POOL.length];
}

export function normalizeDailyGoalMinutes(raw: string | null): number {
  const n = raw ? Number.parseInt(raw, 10) : NaN;
  if (!Number.isFinite(n)) return DEFAULT_DAILY_GOAL_MINUTES;
  const stepped = Math.round(n / 5) * 5;
  return Math.min(MAX_DAILY_GOAL_MINUTES, Math.max(MIN_DAILY_GOAL_MINUTES, stepped));
}

export function normalizeReadingProgress(raw: unknown): ReadingProgress {
  const today = computeTodayIso();
  if (raw && typeof raw === 'object') {
    const o = raw as Record<string, unknown>;
    if (Array.isArray(o.goalMetDays) && typeof o.todayIso === 'string' && Array.isArray(o.todayChapters)) {
      const rawEvidence = o.todayChapterEvidence;
      const todayChapterEvidence: Record<string, ChapterReadEvidence> = {};
      if (rawEvidence && typeof rawEvidence === 'object') {
        Object.entries(rawEvidence as Record<string, unknown>).forEach(([key, value]) => {
          if (!value || typeof value !== 'object') return;
          const furthestVerse = Number((value as Record<string, unknown>).furthestVerse);
          const engagedMs = Number((value as Record<string, unknown>).engagedMs);
          todayChapterEvidence[key] = {
            furthestVerse: Number.isFinite(furthestVerse) ? Math.max(0, Math.floor(furthestVerse)) : 0,
            engagedMs: Number.isFinite(engagedMs) ? Math.max(0, Math.floor(engagedMs)) : 0,
          };
        });
      }
      const rawActive = o.todayActiveLearningMs;
      const legacyAiMs = o.todayAiEngagedMs;
      const spoke =
        typeof o.todaySpokeToAi === 'boolean'
          ? o.todaySpokeToAi
          : typeof legacyAiMs === 'number' && Number.isFinite(legacyAiMs) && legacyAiMs > 0;
      return {
        streak: typeof o.streak === 'number' && o.streak >= 0 ? o.streak : 0,
        goalMetDays: o.goalMetDays.filter((d): d is string => typeof d === 'string'),
        todayIso: o.todayIso,
        todayChapters: o.todayChapters.filter((k): k is string => typeof k === 'string'),
        todayChapterEvidence,
        todayActiveLearningMs:
          typeof rawActive === 'number' && Number.isFinite(rawActive) ? Math.max(0, Math.floor(rawActive)) : 0,
        todaySpokeToAi: spoke,
      };
    }
    const legacyDays = Array.isArray(o.days) ? o.days.filter((d): d is string => typeof d === 'string') : [];
    const legacyStreak = typeof o.streak === 'number' && o.streak >= 0 ? o.streak : 0;
    return {
      streak: legacyStreak,
      goalMetDays: legacyDays,
      todayIso: today,
      todayChapters: [],
      todayChapterEvidence: {},
      todayActiveLearningMs: 0,
      todaySpokeToAi: false,
    };
  }
  return {
    streak: 0,
    goalMetDays: [],
    todayIso: today,
    todayChapters: [],
    todayChapterEvidence: {},
    todayActiveLearningMs: 0,
    todaySpokeToAi: false,
  };
}

export function rollReadingProgressToToday(p: ReadingProgress): ReadingProgress {
  const today = computeTodayIso();
  if (p.todayIso === today) return p;
  return {
    ...p,
    todayIso: today,
    todayChapters: [],
    todayChapterEvidence: {},
    todayActiveLearningMs: 0,
    todaySpokeToAi: false,
  };
}

/** Consecutive days ending today (or yesterday if today not logged yet) where the daily minute goal was met. */
export function computeGoalStreak(goalMetDays: string[], today: string): number {
  const set = new Set(goalMetDays);
  let streak = 0;
  const cursor = new Date(`${today}T00:00:00`);
  if (!set.has(today)) {
    cursor.setDate(cursor.getDate() - 1);
  }
  for (;;) {
    const iso = cursor.toISOString().slice(0, 10);
    if (set.has(iso)) {
      streak += 1;
      cursor.setDate(cursor.getDate() - 1);
    } else {
      break;
    }
  }
  return streak;
}

export function syncGoalCompletion(progress: ReadingProgress, dailyGoalMinutes: number, today: string): ReadingProgress {
  const goalMs = dailyGoalMinutes * 60 * 1000;
  const activeMs = progress.todayIso === today ? (progress.todayActiveLearningMs ?? 0) : 0;
  const goalMet = progress.todayIso === today && activeMs >= goalMs;
  let goalMetDays = [...progress.goalMetDays];
  if (goalMet) {
    if (!goalMetDays.includes(today)) goalMetDays = [...goalMetDays, today];
  } else {
    goalMetDays = goalMetDays.filter(d => d !== today);
  }
  const streak = computeGoalStreak(goalMetDays, today);
  const unchanged =
    streak === progress.streak &&
    goalMetDays.length === progress.goalMetDays.length &&
    goalMetDays.every((d, i) => d === progress.goalMetDays[i]);
  if (unchanged) return progress;
  return { ...progress, goalMetDays, streak };
}

export function getChapterCreditThreshold(totalVerses: number) {
  const requiredVerse = Math.min(
    totalVerses,
    Math.max(MIN_CHAPTER_PROGRESS_VERSES, Math.ceil(totalVerses * MIN_CHAPTER_PROGRESS_RATIO)),
  );
  const requiredMs = Math.min(
    MAX_CHAPTER_READ_MS,
    Math.max(MIN_CHAPTER_READ_MS, totalVerses * CHAPTER_READ_MS_PER_VERSE),
  );
  return { requiredVerse, requiredMs };
}

export function chapterEvidenceQualifies(evidence: ChapterReadEvidence, totalVerses: number) {
  const { requiredVerse, requiredMs } = getChapterCreditThreshold(totalVerses);
  return evidence.furthestVerse >= requiredVerse && evidence.engagedMs >= requiredMs;
}
