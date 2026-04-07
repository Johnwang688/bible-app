'use client';

import type { CSSProperties, Dispatch, SetStateAction } from 'react';
import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import AiSidebar, {
  AI_PERSONALITY_STORAGE_KEY,
  MAX_MESSAGE_CHARS,
  PERSONALITIES,
  restorePersonalityId,
  type AIActionParams,
} from './AiSidebar';
import AuthPanel from './AuthPanel';
import {
  type AccountProfile,
  type AuthSession,
  type SyncedReadingProgress,
  type SyncedStudyItem,
  type SyncedUserSettings,
  getProfile,
  getReadingProgress,
  getStudyItems,
  getUserSettings,
  persistAuthSession,
  putReadingProgress,
  putStudyItems,
  putUserSettings,
  refreshSession,
  restoreAuthSession,
  signIn,
  signOut,
  signUp,
} from '@/lib/account';
import { parseReferenceLabel, sortBookNamesForMatching } from '@/lib/scriptureReference';

// ── Types ──────────────────────────────────────────────────────────────────────
interface BookInfo {
  book_number: number;
  name: string;
  testament: 'OT' | 'NT';
  total_chapters: number;
}
interface Translation { id: string; name: string; }
interface VerseData   { verse: number; text: string; }
interface ChapterData { book: string; chapter: number; translation: string; verses: VerseData[]; }
interface CommentaryEntry { verse_start: number; verse_end: number | null; content: string; }
interface CommentarySource { id: string; name: string; }
interface ThemeDef { id: string; name: string; swatches: string[]; }
interface SearchResult { verse: { book: string; chapter: number; verse: number; text: string; translation: string; }; relevance: number | null; }
interface SearchSuggestion {
  id: string;
  label: string;
  hint: string;
  book: string;
  chapter: number;
  verseStart?: number;
  verseEnd?: number;
  translation?: string;
  score: number;
  source: 'direct' | 'recent' | 'popular' | 'typo';
}
interface SavedPassage { book: string; chapter: number; translation: string; savedAt: number; }
interface VerseNote { key: string; book: string; chapter: number; verse: number; text: string; updatedAt: number; }
interface DailyVerse {
  book: string;
  chapter: number;
  verse: number;
  text: string;
}
interface ChapterReadEvidence {
  furthestVerse: number;
  engagedMs: number;
}
interface ReadingProgress {
  streak: number;
  goalMetDays: string[];
  todayIso: string;
  todayChapters: string[];
  todayChapterEvidence: Record<string, ChapterReadEvidence>;
}
const READER_FONT_PX_OPTIONS = ['8', '10', '12', '14', '16', '18', '20', '22', '24', '26', '28', '30'] as const;
type ReaderFontPx = (typeof READER_FONT_PX_OPTIONS)[number];
const READER_LINE_HEIGHT_OPTIONS = ['1.5', '2', '2.5'] as const;
type ReaderLineHeightOption = (typeof READER_LINE_HEIGHT_OPTIONS)[number];
const READER_FONT_IDS = ['georgia', 'charter', 'palatino', 'garamond', 'times', 'sans'] as const;
type ReaderFontId = (typeof READER_FONT_IDS)[number];
const HIGHLIGHT_COLOR_IDS = ['yellow', 'amber', 'green', 'blue', 'pink', 'lavender', 'mint'] as const;
type ReaderHighlightColorId = (typeof HIGHLIGHT_COLOR_IDS)[number];
const READING_MODE_IDS = ['single', 'book'] as const;
type ReaderReadingMode = (typeof READING_MODE_IDS)[number];

const READER_HIGHLIGHT_PRESETS: Record<
  ReaderHighlightColorId,
  { light: string; dark: string; darkText: string }
> = {
  yellow: { light: '#ffe066', dark: '#c9a800', darkText: '#fff' },
  amber: { light: '#ffcc80', dark: '#b07d00', darkText: '#fff' },
  green: { light: '#b8e6b8', dark: '#2e7d32', darkText: '#fff' },
  blue: { light: '#a8c8ff', dark: '#1565c0', darkText: '#fff' },
  pink: { light: '#ffc1e0', dark: '#ad1457', darkText: '#fff' },
  lavender: { light: '#d4c4ff', dark: '#5e35b1', darkText: '#fff' },
  mint: { light: '#a8ede4', dark: '#00897b', darkText: '#fff' },
};

function applyReaderHighlightVars(id: ReaderHighlightColorId) {
  if (typeof document === 'undefined') return;
  const p = READER_HIGHLIGHT_PRESETS[id];
  const root = document.documentElement;
  root.style.setProperty('--reader-highlight-bg', p.light);
  root.style.setProperty('--reader-highlight-bg-dark', p.dark);
  root.style.setProperty('--reader-highlight-fg-dark', p.darkText);
}

const LEGACY_READER_FONT: Record<string, ReaderFontPx> = {
  comfortable: '16',
  large: '18',
  xlarge: '24',
};
const LEGACY_READER_LINE_HEIGHT: Record<string, ReaderLineHeightOption> = {
  relaxed: '1.5',
  airy: '2',
  '1': '1.5',
  '1.15': '1.5',
  '1.25': '1.5',
};

interface ReaderSettings {
  fontScale: ReaderFontPx;
  lineHeight: ReaderLineHeightOption;
  readerFont: ReaderFontId;
  highlightColor: ReaderHighlightColorId;
  readingMode: ReaderReadingMode;
  reducedMotion: boolean;
  pageFlipEnabled: boolean;
  highContrast: boolean;
  defaultPanel: SidePanelMode;
  sidePanelPosition: SidePanelPosition;
}
type SidePanelMode = 'none' | 'commentary' | 'ai' | 'study';
type SidePanelPosition = 'left' | 'right';

// ── Constants ──────────────────────────────────────────────────────────────────
const THEMES: ThemeDef[] = [
  { id: 'default',   name: 'Default',         swatches: ['#faf7f0', '#efdfcb', '#6d4c31', '#221d16'] },
  { id: 'dark',      name: 'Dark',            swatches: ['#16130f', '#342618', '#c9956a', '#ede8df'] },
  { id: 'dynamic',   name: 'Dynamic',         swatches: ['#FBDED8', '#FBF8D8', '#E1F8D8', '#E1F8F2', '#E1DEF2', '#FBDEF2'] },
  { id: 'pink',      name: 'Pastel Pink',     swatches: ['#ffe4eb', '#ffd4e0', '#c01848', '#14060c'] },
  { id: 'blue',      name: 'Pastel Blue',     swatches: ['#d9e7f5', '#cddff2', '#185088', '#040a14'] },
  { id: 'green',     name: 'Pastel Green',    swatches: ['#e1f9e1', '#cbf5cb', '#0c5c0c', '#030c04'] },
  { id: 'yellow',    name: 'Pastel Yellow',   swatches: ['#faf8e4', '#fff2c4', '#886000', '#181400'] },
  { id: 'purple',    name: 'Pastel Purple',   swatches: ['#e8e1f1', '#dacfe9', '#5c2888', '#0c0418'] },
  { id: 'orange',    name: 'Pastel Orange',   swatches: ['#fcefe3', '#ffe1cc', '#a84018', '#140802'] },
  { id: 'gold',      name: 'Gold & Silver',   swatches: ['#c9a84c', '#b89030', '#5c3e08', '#5a6068'] },
  { id: 'midnight',  name: 'Midnight Blue',   swatches: ['#003366', '#002b55', '#4d9fe0', '#f5f5f5'] },
  { id: 'rebecca',   name: 'Indigo',          swatches: ['#3c3c8c', '#2e2e72', '#9fa8ff', '#f5f5f5'] },
  { id: 'galaxy',    name: 'Galaxy',          swatches: ['#301058', '#9a90b0', '#e8c478', '#f4f0ff'] },
  { id: 'parchment', name: 'Parchment Gold',  swatches: ['#f5e7a1', '#edd878', '#5a4200', '#3a3a3a'] },
  { id: 'teal',      name: 'Deep Teal',       swatches: ['#0f4c5c', '#0a3848', '#5ee8f0', '#d9f3f4'] },
  { id: 'forest',    name: 'Forest Rose',     swatches: ['#283618', '#1e2a12', '#FFB5A7', '#ffd6cc'] },
  { id: 'magenta',   name: 'Magenta Aqua',    swatches: ['#4A1942', '#5c2254', '#48cae4', '#90E0EF'] },
  { id: 'emerald',   name: 'Emerald Gold',    swatches: ['#0B3D2E', '#144d3a', '#f0c040', '#F4D35E'] },
  { id: 'canyon',    name: 'Canyon Mint',     swatches: ['#4C1D06', '#5e2608', '#8ee8cc', '#B8F2E6'] },
  { id: 'neonrose',  name: 'Pink',            swatches: ['#000000', '#F77FBE', '#FF71CD', '#FF71CD'] },
];

const LEGACY_THEME_ID_MAP: Record<string, string> = {
  'Galaxy Metallic': 'galaxy',
  'galaxy metallic': 'galaxy',
};
const THEME_GRID_PREVIEW_COUNT = 5;
const LAST_POSITION_STORAGE_KEY = 'bible-app-last-position';
const RECENT_PASSAGES_STORAGE_KEY = 'bible-app-recent-passages';
const HIGHLIGHTS_STORAGE_KEY = 'bible-app-highlights';
const BOOKMARKS_STORAGE_KEY = 'bible-app-bookmarks';
const NOTES_STORAGE_KEY = 'bible-app-notes';
const READING_PROGRESS_STORAGE_KEY = 'bible-app-reading-progress';
const DAILY_GOAL_CHAPTERS_STORAGE_KEY = 'bible-app-daily-goal-chapters';
const DEFAULT_DAILY_GOAL_CHAPTERS = 3;
const READER_SETTINGS_STORAGE_KEY = 'bible-app-reader-settings';
const ONBOARDING_STORAGE_KEY = 'bible-app-onboarding-complete';
const MAX_RECENT_PASSAGES = 8;
const MIN_CHAPTER_PROGRESS_RATIO = 0.5;
const MIN_CHAPTER_PROGRESS_VERSES = 3;
const MIN_CHAPTER_READ_MS = 20_000;
const MAX_CHAPTER_READ_MS = 75_000;
const CHAPTER_READ_MS_PER_VERSE = 1_500;
const MAX_ENGAGEMENT_GAP_MS = 15_000;
const SCROLL_ACTIVE_HOLD_MS = 220;
const ENGAGEMENT_COMMIT_MS = 240;
const COMMENTARY_SYNC_THROTTLE_MS = 120;
const DAILY_VERSE_POOL: DailyVerse[] = [
  { book: 'Psalms', chapter: 23, verse: 1, text: 'The LORD is my shepherd: I shall lack nothing.' },
  { book: 'Proverbs', chapter: 3, verse: 5, text: 'Trust in Yahweh with all your heart, and do not lean on your own understanding.' },
  { book: 'Isaiah', chapter: 41, verse: 10, text: 'Don’t be afraid, for I am with you. Don’t be dismayed, for I am your God.' },
  { book: 'Matthew', chapter: 11, verse: 28, text: 'Come to me, all you who labor and are heavily burdened, and I will give you rest.' },
  { book: 'John', chapter: 14, verse: 27, text: 'Peace I leave with you. My peace I give to you; not as the world gives, give I to you.' },
  { book: 'Romans', chapter: 8, verse: 28, text: 'We know that all things work together for good for those who love God, to those who are called according to his purpose.' },
  { book: '2 Corinthians', chapter: 5, verse: 7, text: 'For we walk by faith, not by sight.' },
  { book: 'Galatians', chapter: 6, verse: 9, text: 'Let’s not be weary in doing good, for we will reap in due season, if we don’t give up.' },
  { book: 'Philippians', chapter: 4, verse: 6, text: 'In nothing be anxious, but in everything, by prayer and petition with thanksgiving, let your requests be made known to God.' },
  { book: 'Hebrews', chapter: 11, verse: 1, text: 'Now faith is assurance of things hoped for, proof of things not seen.' },
  { book: '1 Peter', chapter: 5, verse: 7, text: 'Casting all your worries on him, because he cares for you.' },
  { book: 'Lamentations', chapter: 3, verse: 23, text: 'They are new every morning; great is your faithfulness.' },
];
const DEFAULT_READER_SETTINGS: ReaderSettings = {
  fontScale: '20',
  lineHeight: '2',
  readerFont: 'georgia',
  highlightColor: 'yellow',
  readingMode: 'single',
  reducedMotion: false,
  pageFlipEnabled: true,
  highContrast: false,
  defaultPanel: 'none',
  sidePanelPosition: 'right',
};

function normalizeThemeId(rawTheme: string | null | undefined) {
  if (!rawTheme) return 'default';
  const mappedTheme = LEGACY_THEME_ID_MAP[rawTheme] ?? rawTheme;
  return THEMES.some(theme => theme.id === mappedTheme) ? mappedTheme : 'default';
}

/** When collapsed, show the first N themes; if the active theme is not among them, swap it in so selection stays visible. */
function themesForCollapsedPicker(currentThemeId: string, previewCount: number): ThemeDef[] {
  const preview = THEMES.slice(0, previewCount);
  if (preview.some(t => t.id === currentThemeId)) return preview;
  const current = THEMES.find(t => t.id === currentThemeId);
  if (!current) return preview;
  const rest = THEMES.filter(t => t.id !== currentThemeId).slice(0, previewCount - 1);
  return [current, ...rest];
}

function safelyParseJson<T>(raw: string | null, fallback: T): T {
  if (!raw) return fallback;
  try {
    return JSON.parse(raw) as T;
  } catch {
    return fallback;
  }
}

function verseStorageKey(book: string, chapter: number, verse: number) {
  return `${book}::${chapter}::${verse}`.toLowerCase();
}

function formatVerseGroupRef(book: string, chapter: number, verses: number[]): string {
  if (verses.length === 0) return '';
  const sorted = [...verses].sort((a, b) => a - b);
  const parts: string[] = [];
  let start = sorted[0];
  let end = sorted[0];
  for (let i = 1; i <= sorted.length; i++) {
    if (i < sorted.length && sorted[i] === end + 1) {
      end = sorted[i];
    } else {
      if (end === start) parts.push(`${start}`);
      else if (end === start + 1) parts.push(`${start}, ${end}`);
      else parts.push(`${start}\u2013${end}`);
      if (i < sorted.length) { start = sorted[i]; end = sorted[i]; }
    }
  }
  return `${book} ${chapter}:${parts.join(', ')}`;
}

function chapterStorageKey(book: string, chapter: number, translation: string) {
  return `${book}::${chapter}::${translation}`.toLowerCase();
}

function normalizeReaderSettings(raw: Partial<ReaderSettings> | null | undefined): ReaderSettings {
  const rawFont = raw?.fontScale;
  let fontScale: ReaderFontPx = DEFAULT_READER_SETTINGS.fontScale;
  if (typeof rawFont === 'string') {
    if ((READER_FONT_PX_OPTIONS as readonly string[]).includes(rawFont)) fontScale = rawFont as ReaderFontPx;
    else if (rawFont in LEGACY_READER_FONT) fontScale = LEGACY_READER_FONT[rawFont];
  }
  const rawLh = raw?.lineHeight;
  let lineHeight: ReaderLineHeightOption = DEFAULT_READER_SETTINGS.lineHeight;
  if (typeof rawLh === 'string') {
    if ((READER_LINE_HEIGHT_OPTIONS as readonly string[]).includes(rawLh)) lineHeight = rawLh as ReaderLineHeightOption;
    else if (rawLh in LEGACY_READER_LINE_HEIGHT) lineHeight = LEGACY_READER_LINE_HEIGHT[rawLh];
  }
  const rawRf = raw?.readerFont;
  let readerFont: ReaderFontId = DEFAULT_READER_SETTINGS.readerFont;
  if (typeof rawRf === 'string' && (READER_FONT_IDS as readonly string[]).includes(rawRf)) {
    readerFont = rawRf as ReaderFontId;
  }
  const rawHc = raw?.highlightColor;
  let highlightColor: ReaderHighlightColorId = DEFAULT_READER_SETTINGS.highlightColor;
  if (typeof rawHc === 'string' && (HIGHLIGHT_COLOR_IDS as readonly string[]).includes(rawHc)) {
    highlightColor = rawHc as ReaderHighlightColorId;
  }
  const rawReadingMode = raw?.readingMode;
  let readingMode: ReaderReadingMode = DEFAULT_READER_SETTINGS.readingMode;
  if (typeof rawReadingMode === 'string' && (READING_MODE_IDS as readonly string[]).includes(rawReadingMode)) {
    readingMode = rawReadingMode as ReaderReadingMode;
  }
  return {
    fontScale,
    lineHeight,
    readerFont,
    highlightColor,
    readingMode,
    reducedMotion: Boolean(raw?.reducedMotion),
    pageFlipEnabled: raw?.pageFlipEnabled ?? true,
    highContrast: Boolean(raw?.highContrast),
    defaultPanel:
      raw?.defaultPanel === 'ai' || raw?.defaultPanel === 'commentary' || raw?.defaultPanel === 'study'
        ? raw.defaultPanel
        : 'none',
    sidePanelPosition: raw?.sidePanelPosition === 'left' ? 'left' : 'right',
  };
}

function computeTodayIso() {
  return new Date().toISOString().slice(0, 10);
}

function selectDailyVerse(todayIso: string): DailyVerse {
  const seed = todayIso.replace(/-/g, '').split('').reduce((sum, digit) => sum + Number(digit), 0);
  return DAILY_VERSE_POOL[seed % DAILY_VERSE_POOL.length];
}

function normalizeDailyGoalChapters(raw: string | null): number {
  const n = raw ? Number.parseInt(raw, 10) : NaN;
  if (!Number.isFinite(n)) return DEFAULT_DAILY_GOAL_CHAPTERS;
  return Math.min(25, Math.max(1, Math.floor(n)));
}

function normalizeReadingProgress(raw: unknown): ReadingProgress {
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
      return {
        streak: typeof o.streak === 'number' && o.streak >= 0 ? o.streak : 0,
        goalMetDays: o.goalMetDays.filter((d): d is string => typeof d === 'string'),
        todayIso: o.todayIso,
        todayChapters: o.todayChapters.filter((k): k is string => typeof k === 'string'),
        todayChapterEvidence,
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
    };
  }
  return { streak: 0, goalMetDays: [], todayIso: today, todayChapters: [], todayChapterEvidence: {} };
}

function rollReadingProgressToToday(p: ReadingProgress): ReadingProgress {
  const today = computeTodayIso();
  if (p.todayIso === today) return p;
  return { ...p, todayIso: today, todayChapters: [], todayChapterEvidence: {} };
}

/** Consecutive days ending today (or yesterday if today not logged yet) where the daily chapter goal was met. */
function computeGoalStreak(goalMetDays: string[], today: string): number {
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

function syncGoalCompletion(progress: ReadingProgress, dailyGoalChapters: number, today: string): ReadingProgress {
  const goalMet = progress.todayIso === today && progress.todayChapters.length >= dailyGoalChapters;
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

function getChapterCreditThreshold(totalVerses: number) {
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

function chapterEvidenceQualifies(evidence: ChapterReadEvidence, totalVerses: number) {
  const { requiredVerse, requiredMs } = getChapterCreditThreshold(totalVerses);
  return evidence.furthestVerse >= requiredVerse && evidence.engagedMs >= requiredMs;
}

function getThemeCardStyle(theme: ThemeDef): CSSProperties {
  const [bg, border, accent, text] = theme.id === 'dynamic'
    ? [DYNAMIC_PREVIEW_BG, DYNAMIC_PREVIEW_BORDER, DYNAMIC_PREVIEW_ACCENT, '#221d16']
    : theme.swatches;
  return {
    '--theme-card-bg': bg,
    '--theme-card-border': border,
    '--theme-card-hover': accent,
    '--theme-card-accent': accent,
    '--theme-card-text': text,
  } as CSSProperties;
}

function splitVersesForBookMode(verses: VerseData[]) {
  const midpoint = Math.ceil(verses.length / 2);
  return [verses.slice(0, midpoint), verses.slice(midpoint)];
}

const DYNAMIC_BASE_THEME    = 'default';
const DYNAMIC_COLORS        = ['#FF0000', '#FFFF00', '#00FF00', '#00FFFF', '#0000FF', '#FF00FF'];
const DYNAMIC_FADE_MS       = 3000;
const DYNAMIC_CYCLE_MS      = DYNAMIC_FADE_MS * 2;
const DYNAMIC_PREVIEW_BG    = '#f7f7f7';
const DYNAMIC_PREVIEW_BORDER = '#ddd2c3';
const DYNAMIC_PREVIEW_ACCENT = '#d8cce8';
const SEARCH_SUGGESTION_LIMIT = 7;
const BOOK_POPULARITY_SCORES: Record<string, number> = {
  John: 120,
  Psalms: 118,
  Genesis: 114,
  Romans: 110,
  Matthew: 108,
  Proverbs: 106,
  Isaiah: 102,
  Luke: 100,
  Acts: 98,
  Revelation: 96,
  '1 Corinthians': 94,
  Ephesians: 92,
  James: 90,
  Hebrews: 88,
  Philippians: 86,
  '1 John': 84,
  Exodus: 82,
  Mark: 80,
  Galatians: 78,
  Daniel: 76,
};

// ── Helpers ────────────────────────────────────────────────────────────────────
function hexToRgb(hex: string) {
  const n = parseInt(hex.replace('#', ''), 16);
  return { r: (n >> 16) & 255, g: (n >> 8) & 255, b: n & 255 };
}

function normalizeSearchText(value: string) {
  return value
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

function compactSearchText(value: string) {
  return normalizeSearchText(value).replace(/\s+/g, '');
}

function normalizeReferenceSpacing(value: string) {
  return value
    .replace(/([A-Za-z])(\d)/g, '$1 $2')
    .replace(/(\d)([A-Za-z])/g, '$1 $2')
    .replace(/\s+/g, ' ')
    .trim();
}

function levenshteinDistance(a: string, b: string) {
  if (a === b) return 0;
  if (!a.length) return b.length;
  if (!b.length) return a.length;
  const prev = Array.from({ length: b.length + 1 }, (_, i) => i);
  const curr = new Array<number>(b.length + 1).fill(0);
  for (let i = 0; i < a.length; i += 1) {
    curr[0] = i + 1;
    for (let j = 0; j < b.length; j += 1) {
      const cost = a[i] === b[j] ? 0 : 1;
      curr[j + 1] = Math.min(
        curr[j] + 1,
        prev[j + 1] + 1,
        prev[j] + cost,
      );
    }
    for (let j = 0; j < prev.length; j += 1) prev[j] = curr[j];
  }
  return prev[b.length];
}

function extractLooseReferenceParts(query: string) {
  const spaced = normalizeReferenceSpacing(query);
  if (!spaced) {
    return { bookPart: '', chapter: undefined, verseStart: undefined, verseEnd: undefined };
  }
  const match = spaced.match(/^(.+?)(?:\s+(\d+)(?::(\d+)(?:\s*[–-]\s*(\d+))?)?)?$/u);
  if (!match) {
    return { bookPart: spaced, chapter: undefined, verseStart: undefined, verseEnd: undefined };
  }
  const chapter = match[2] ? Number.parseInt(match[2], 10) : undefined;
  const verseStart = match[3] ? Number.parseInt(match[3], 10) : undefined;
  const verseEnd = match[4] ? Number.parseInt(match[4], 10) : undefined;
  return {
    bookPart: match[1]?.trim() ?? spaced,
    chapter: Number.isFinite(chapter) ? chapter : undefined,
    verseStart: Number.isFinite(verseStart) ? verseStart : undefined,
    verseEnd: Number.isFinite(verseEnd) ? verseEnd : undefined,
  };
}

function getBookPopularityScore(book: BookInfo) {
  return BOOK_POPULARITY_SCORES[book.name] ?? Math.max(22, 70 - book.book_number);
}

function scoreBookMatch(query: string, book: BookInfo) {
  const normalizedQuery = normalizeSearchText(query);
  const compactQuery = compactSearchText(query);
  if (!normalizedQuery || compactQuery.length < 2) return Number.NEGATIVE_INFINITY;

  const normalizedBook = normalizeSearchText(book.name);
  const compactBook = compactSearchText(book.name);
  let score = Number.NEGATIVE_INFINITY;

  if (compactBook === compactQuery) score = 560;
  if (compactBook.startsWith(compactQuery)) {
    score = Math.max(score, 500 - Math.max(0, compactBook.length - compactQuery.length) * 4);
  }

  const wordIndex = normalizedBook.indexOf(normalizedQuery);
  if (wordIndex >= 0) score = Math.max(score, 430 - wordIndex * 18);

  const compactIndex = compactBook.indexOf(compactQuery);
  if (compactIndex >= 0) score = Math.max(score, 390 - compactIndex * 14);

  const prefixSlice = compactBook.slice(
    0,
    Math.min(compactBook.length, Math.max(compactQuery.length, compactQuery.length + 2)),
  );
  const distance = Math.min(
    levenshteinDistance(compactQuery, compactBook),
    levenshteinDistance(compactQuery, prefixSlice),
  );
  const maxDistance = compactQuery.length <= 4 ? 1 : compactQuery.length <= 8 ? 2 : 3;
  if (distance <= maxDistance) {
    score = Math.max(
      score,
      350 - distance * 52 - Math.abs(compactBook.length - compactQuery.length) * 7,
    );
  }

  return score;
}

function clampChapterForBook(book: BookInfo, chapter?: number) {
  if (!chapter || chapter < 1) return 1;
  return Math.min(book.total_chapters, chapter);
}

function formatSearchSuggestionLabel(
  book: string,
  chapter: number,
  verseStart?: number,
  verseEnd?: number,
) {
  const verseLabel = verseStart == null
    ? ''
    : verseEnd != null && verseEnd !== verseStart
      ? `:${verseStart}-${verseEnd}`
      : `:${verseStart}`;
  return `${book} ${chapter}${verseLabel}`;
}

function parseSummaryContent(content: string) {
  const result = {
    title: '', summary: '',
    themes: [] as string[], people: [] as string[],
    points: [] as string[], verses: [] as string[],
  };
  const titleMatch = content.match(/^TITLE::(.+)/m);
  if (titleMatch) result.title = titleMatch[1].trim();
  let rest = content.replace(/^TITLE::.+\n?/, '').trim();
  const themesMatch = rest.match(/^Themes:\s*(.+)$/m);
  if (themesMatch) result.themes = themesMatch[1].split(' · ').map(s => s.trim()).filter(Boolean);
  const peopleMatch = rest.match(/^Key People:\s*(.+)$/m);
  if (peopleMatch) result.people = peopleMatch[1].split(' · ').map(s => s.trim()).filter(Boolean);
  const versesMatch = rest.match(/^Supporting Verses:\s*(.+)$/m);
  if (versesMatch) result.verses = versesMatch[1].split(' · ').map(s => s.trim()).filter(Boolean);
  const pointsMatch = rest.match(/^Key Points:\n([\s\S]+?)(?=\n\n[A-Z]|$)/m);
  if (pointsMatch) {
    result.points = pointsMatch[1].split('\n').map(l => l.replace(/^• /, '').trim()).filter(Boolean);
  }
  const sectionStart = rest.search(/^(Themes:|Key People:|Key Points:|Supporting Verses:)/m);
  result.summary = (sectionStart > 0 ? rest.slice(0, sectionStart) : rest).trim();
  return result;
}

function closestVerseLine(node: Node | null): HTMLElement | null {
  let n: Node | null = node;
  if (n?.nodeType === Node.TEXT_NODE) n = n.parentElement;
  const el = n as Element | null;
  return el?.closest?.('.verse-line[data-verse]') ?? null;
}

function buildExplainVersePrompt(refLabel: string | undefined, selectedText: string): string {
  const intro = 'Explain what this passage means.\n\n';
  const refLine = refLabel ? `Reference: ${refLabel}\n\n` : '';
  const normalized = selectedText.replace(/\s+/g, ' ').trim();
  const quoted = `“${normalized}”`;
  let full = intro + refLine + quoted;
  if (full.length <= MAX_MESSAGE_CHARS) return full;
  const overhead = intro.length + refLine.length + 4;
  const budget = MAX_MESSAGE_CHARS - overhead;
  const inner =
    normalized.length > budget ? `${normalized.slice(0, Math.max(0, budget - 1))}…` : normalized;
  return intro + refLine + `“${inner}”`;
}

// ── Main Component ─────────────────────────────────────────────────────────────
export default function BibleApp() {
  // ── Bible data ───
  const [books, setBooks]             = useState<BookInfo[]>([]);
  const [translations, setTranslations] = useState<Translation[]>([]);
  const [currentBook, setCurrentBook] = useState<BookInfo | null>(null);
  const [chapter, setChapter]         = useState(1);
  const [translation, setTranslation] = useState('WEB');

  // ── Chapter display ───
  const [chapterData, setChapterData]   = useState<ChapterData | null>(null);
  const [chapterLoading, setChapterLoading] = useState(true);
  const [chapterError, setChapterError] = useState(false);
  const [animClass, setAnimClass]       = useState('');

  // ── Commentary ───
  const [commentaryEntries, setCommentaryEntries] = useState<CommentaryEntry[]>([]);
  const [commentaryLoading, setCommentaryLoading] = useState(false);
  const [commentaryError, setCommentaryError]     = useState(false);
  const [commentarySource, setCommentarySource]   = useState('matthew_henry');
  const [commentarySourceNames, setCommentarySourceNames] = useState<Record<string, string>>({
    matthew_henry: 'Matthew Henry Commentary',
    summary: 'Chapter Summaries',
  });
  const [commentarySources, setCommentarySources] = useState<CommentarySource[]>([]);
  const [commentarySourceMenuOpen, setCommentarySourceMenuOpen] = useState(false);
  const [personalityId, setPersonalityId] = useState<string>('jessica');
  const [agentMenuOpen, setAgentMenuOpen] = useState(false);
  const [syncedVerseStart, setSyncedVerseStart]   = useState<number | null>(null);
  /** Verses to tint after jumping from the AI sidebar (cleared after a few seconds or on manual navigation). */
  const [aiNavHighlight, setAiNavHighlight]       = useState<{ start: number; end: number } | null>(null);

  // ── UI state ───
  const [sidePanelMode, setSidePanelMode]   = useState<SidePanelMode>('none');
  const [sidePaneWidth, setSidePaneWidth]   = useState('38%');
  const [isPaneTransitioning, setIsPaneTransitioning] = useState(true);
  const [expandedBook, setExpandedBook]     = useState<number | null>(null);
  const [bookPopupOpen, setBookPopupOpen]   = useState(false);
  const [versionPanelLeft, setVersionPanelLeft] = useState(20);
  const [versionPopupOpen, setVersionPopupOpen] = useState(false);
  const [settingsOpen, setSettingsOpen]     = useState(false);
  const [themePickerExpanded, setThemePickerExpanded] = useState(false);
  const [searchOpen, setSearchOpen]         = useState(false);
  const [chromeVisible, setChromeVisible]   = useState(true);
  /** Landing view: bottom taskbar only; taskbar actions enter the reader (and optional sidebar). */
  const [homeScreenActive, setHomeScreenActive] = useState(true);
  const [readerAskBubble, setReaderAskBubble] = useState<{ top: number; left: number } | null>(null);
  const [aiComposerSeed, setAiComposerSeed] = useState<{ id: number; text: string } | undefined>();
  const [selectedVerse, setSelectedVerse]   = useState<number | null>(null);
  const [selectedVerseGroup, setSelectedVerseGroup] = useState<number[]>([]);
  const [versePopupPos, setVersePopupPos]   = useState<{ top: number; left: number } | null>(null);
  const [searchQuery, setSearchQuery]       = useState('');
  const [searchResults, setSearchResults]   = useState<SearchResult[]>([]);
  const [searchLoading, setSearchLoading]   = useState(false);
  const [searchError, setSearchError]       = useState<string | null>(null);
  const [recentPassages, setRecentPassages] = useState<SavedPassage[]>([]);
  const [highlightedVerses, setHighlightedVerses] = useState<string[]>([]);
  const [bookmarkedVerses, setBookmarkedVerses] = useState<string[]>([]);
  const [verseNotes, setVerseNotes]         = useState<Record<string, VerseNote>>({});
  const [readingProgress, setReadingProgress] = useState<ReadingProgress>(() => normalizeReadingProgress(null));
  const [dailyGoalChapters, setDailyGoalChapters] = useState(DEFAULT_DAILY_GOAL_CHAPTERS);
  const [readingGoalEditing, setReadingGoalEditing] = useState(false);
  const [readerSettings, setReaderSettings] = useState<ReaderSettings>(DEFAULT_READER_SETTINGS);
  const [showOnboarding, setShowOnboarding] = useState(false);
  const [currentNoteDraft, setCurrentNoteDraft] = useState('');
  const [showVerseNoteEditor, setShowVerseNoteEditor] = useState(false);
  const [authSession, setAuthSession]       = useState<AuthSession | null>(null);
  const [accountProfile, setAccountProfile] = useState<AccountProfile | null>(null);
  const [authMode, setAuthMode]             = useState<'signin' | 'signup'>('signin');
  const [authBusy, setAuthBusy]             = useState(false);
  const [authError, setAuthError]           = useState<string | null>(null);

  // ── Theme ───
  const [currentTheme, setCurrentTheme] = useState('default');

  // ── DOM Refs ───
  const biblePaneRef  = useRef<HTMLDivElement>(null);
  const contentAreaRef = useRef<HTMLDivElement>(null);
  const sideScrollRef = useRef<HTMLDivElement>(null);
  const sidePaneRef   = useRef<HTMLElement>(null);
  const dividerRef    = useRef<HTMLDivElement>(null);
  const dynTintRef    = useRef<HTMLDivElement>(null);
  const versionBtnRef = useRef<HTMLButtonElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);
  const commentarySourceMenuRef = useRef<HTMLDivElement>(null);
  const agentMenuRef = useRef<HTMLDivElement>(null);
  const cometCanvasRef = useRef<HTMLCanvasElement>(null);
  const readerPassagesRef = useRef<HTMLDivElement>(null);
  const readerSelectionPayloadRef = useRef<{ text: string; refLabel?: string } | null>(null);
  const readerSelectionRafRef = useRef<number | null>(null);

  // ── Stable refs for use in callbacks without stale closures ───
  const booksRef               = useRef<BookInfo[]>([]);
  const currentBookRef         = useRef<BookInfo | null>(null);
  const chapterRef             = useRef(1);
  const translationRef         = useRef('WEB');
  const sidePanelModeRef       = useRef<SidePanelMode>('none');
  const sidePanelPositionRef   = useRef<SidePanelPosition>('right');
  const commentarySourceRef    = useRef('matthew_henry');
  const commentarySourceNamesRef = useRef<Record<string, string>>({
    matthew_henry: 'Matthew Henry Commentary',
    summary: 'Chapter Summaries',
  });
  const currentThemeRef = useRef('default');
  const readerSettingsRef = useRef<ReaderSettings>(DEFAULT_READER_SETTINGS);

  // ── Imperative refs ───
  const commentaryCache     = useRef<Record<string, CommentaryEntry[]>>({});
  const lastScrollYRef      = useRef(0);
  const commSyncRafRef      = useRef<number | null>(null);
  const isDraggingRef       = useRef(false);
  const dragStartXRef       = useRef(0);
  const dragStartWidthRef   = useRef(0);
  const dynTimerRef         = useRef<ReturnType<typeof setTimeout> | null>(null);
  const dynRafRef           = useRef<number | null>(null);
  const cometRafRef         = useRef<number | null>(null);
  const dynIndexRef         = useRef(0);
  const touchStartXRef      = useRef<number | null>(null);
  const touchStartYRef      = useRef(0);
  const touchGestureModeRef = useRef<'chapter' | 'side-toggle'>('chapter');
  const lastSidePanelModeRef = useRef<Exclude<SidePanelMode, 'none'>>('commentary');
  const searchRequestIdRef  = useRef(0);
  const pendingAiNavRef = useRef<{ start: number; end: number } | null>(null);
  const pendingFlipDataRef  = useRef<{ data: ChapterData; direction: 'next' | 'prev' } | null>(null);
  const exitAnimDoneRef     = useRef(false);
  const syncReadyRef        = useRef(false);
  const hydratingAccountRef = useRef(false);
  const accountBootstrapRef = useRef(false);
  const chapterEngagementRef = useRef<{ key: string; lastInteractionAt: number | null }>({
    key: '',
    lastInteractionAt: null,
  });
  const visibleVersesRef = useRef<Set<number>>(new Set());
  const topVisibleVerseRef = useRef(1);
  const verseObserverRef = useRef<IntersectionObserver | null>(null);
  const engagementTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const pendingEngagementRef = useRef<{
    bookName: string;
    currentChapter: number;
    currentTranslation: string;
    furthestVerse: number;
    totalVerses: number;
  } | null>(null);
  const lastEngagementCommitAtRef = useRef(0);
  const commentarySyncTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const lastCommentarySyncAtRef = useRef(0);
  const scrollActiveTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const scrollEffectsDowngradedRef = useRef(false);
  const chromeVisibleRef = useRef(true);
  const commentarySyncIdleTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  // Keep stable refs in sync
  useEffect(() => { booksRef.current = books; },                             [books]);
  useEffect(() => { currentBookRef.current = currentBook; },                 [currentBook]);
  useEffect(() => { chapterRef.current = chapter; },                         [chapter]);
  useEffect(() => { translationRef.current = translation; },                 [translation]);
  useEffect(() => { sidePanelModeRef.current = sidePanelMode; },             [sidePanelMode]);
  useEffect(() => {
    if (sidePanelMode !== 'none') lastSidePanelModeRef.current = sidePanelMode;
  }, [sidePanelMode]);
  useEffect(() => { sidePanelPositionRef.current = readerSettings.sidePanelPosition; }, [readerSettings.sidePanelPosition]);
  useEffect(() => { commentarySourceRef.current = commentarySource; },       [commentarySource]);
  useEffect(() => { commentarySourceNamesRef.current = commentarySourceNames; }, [commentarySourceNames]);
  useEffect(() => { currentThemeRef.current = currentTheme; },               [currentTheme]);
  useEffect(() => { readerSettingsRef.current = readerSettings; },           [readerSettings]);
  useEffect(() => { chromeVisibleRef.current = chromeVisible; },             [chromeVisible]);

  useEffect(() => {
    setPersonalityId(restorePersonalityId());
  }, []);

  useEffect(() => {
    if (!settingsOpen) setThemePickerExpanded(false);
  }, [settingsOpen]);

  useEffect(() => {
    const noteKey = currentBook && selectedVerse != null
      ? verseStorageKey(currentBook.name, chapter, selectedVerse)
      : null;
    if (!noteKey) {
      setCurrentNoteDraft('');
      setShowVerseNoteEditor(false);
      return;
    }
    setCurrentNoteDraft(verseNotes[noteKey]?.text ?? '');
  }, [chapter, currentBook, selectedVerse, verseNotes]);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.localStorage.setItem(HIGHLIGHTS_STORAGE_KEY, JSON.stringify(highlightedVerses));
  }, [highlightedVerses]);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.localStorage.setItem(BOOKMARKS_STORAGE_KEY, JSON.stringify(bookmarkedVerses));
  }, [bookmarkedVerses]);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.localStorage.setItem(NOTES_STORAGE_KEY, JSON.stringify(verseNotes));
  }, [verseNotes]);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.localStorage.setItem(RECENT_PASSAGES_STORAGE_KEY, JSON.stringify(recentPassages));
  }, [recentPassages]);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.localStorage.setItem(READING_PROGRESS_STORAGE_KEY, JSON.stringify(readingProgress));
  }, [readingProgress]);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.localStorage.setItem(DAILY_GOAL_CHAPTERS_STORAGE_KEY, String(dailyGoalChapters));
  }, [dailyGoalChapters]);

  useEffect(() => {
    setReadingProgress(prev => {
      const today = computeTodayIso();
      return syncGoalCompletion(prev, dailyGoalChapters, today);
    });
  }, [dailyGoalChapters]);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.localStorage.setItem(READER_SETTINGS_STORAGE_KEY, JSON.stringify(readerSettings));
    document.documentElement.dataset.readerScale = readerSettings.fontScale;
    document.documentElement.dataset.readerLineHeight = readerSettings.lineHeight;
    document.documentElement.dataset.readerFont = readerSettings.readerFont;
    applyReaderHighlightVars(readerSettings.highlightColor);
    if (readerSettings.reducedMotion) document.documentElement.setAttribute('data-reduced-motion', '1');
    else document.documentElement.removeAttribute('data-reduced-motion');
    if (readerSettings.highContrast) document.documentElement.setAttribute('data-high-contrast', '1');
    else document.documentElement.removeAttribute('data-high-contrast');
  }, [readerSettings]);

  useEffect(() => {
    const handlePointerDown = (event: MouseEvent) => {
      if (!commentarySourceMenuRef.current?.contains(event.target as Node)) {
        setCommentarySourceMenuOpen(false);
      }
      if (!agentMenuRef.current?.contains(event.target as Node)) {
        setAgentMenuOpen(false);
      }
    };
    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'Escape') {
        setCommentarySourceMenuOpen(false);
        setAgentMenuOpen(false);
      }
    };
    document.addEventListener('mousedown', handlePointerDown);
    document.addEventListener('keydown', handleKeyDown);
    return () => {
      document.removeEventListener('mousedown', handlePointerDown);
      document.removeEventListener('keydown', handleKeyDown);
    };
  }, []);

  // ── Derived ───────────────────────────────────────────────────────────────────
  const isFirstChapter = useCallback(() => {
    const b = currentBookRef.current;
    return b?.book_number === 1 && chapterRef.current === 1;
  }, []);

  const isLastChapter = useCallback(() => {
    const b = currentBookRef.current;
    return !!b && b.book_number === 66 && chapterRef.current === b.total_chapters;
  }, []);

  // ── Commentary loading ─────────────────────────────────────────────────────────
  const loadCommentaryData = useCallback(async (
    book: BookInfo, ch: number, source: string,
  ) => {
    const key = `${book.book_number}:${ch}:${source}`;
    if (commentaryCache.current[key]) {
      setCommentaryEntries(commentaryCache.current[key]);
      setCommentaryLoading(false);
      setCommentaryError(false);
      return;
    }
    setCommentaryLoading(true);
    setCommentaryError(false);
    try {
      const entries: CommentaryEntry[] = await fetch(
        `/api/v1/commentary?book=${encodeURIComponent(book.name)}&chapter=${ch}&source=${encodeURIComponent(source)}`
      ).then(r => { if (!r.ok) throw new Error(); return r.json(); });
      commentaryCache.current[key] = entries;
      setCommentaryEntries(entries);
      setCommentaryLoading(false);
    } catch {
      setCommentaryEntries([]);
      setCommentaryError(true);
      setCommentaryLoading(false);
    }
  }, []);

  // ── Chapter loading ────────────────────────────────────────────────────────────
  const loadChapter = useCallback(async (
    book: BookInfo, ch: number, trans: string, direction: 'next' | 'prev' | null = null,
    opts?: { fromAiNavigate?: boolean },
  ) => {
    if (!opts?.fromAiNavigate) {
      pendingAiNavRef.current = null;
      setAiNavHighlight(null);
    }

    const useFlip = direction != null
      && readerSettingsRef.current.pageFlipEnabled
      && !readerSettingsRef.current.reducedMotion;

    setChapterError(false);

    if (useFlip) {
      exitAnimDoneRef.current = false;
      pendingFlipDataRef.current = null;
      // Start exit animation immediately; keep old chapterData visible
      setAnimClass(direction === 'next' ? 'page-flip-exit-next' : 'page-flip-exit-prev');
    } else {
      setChapterLoading(true);
      setChapterData(null);
      setAnimClass('');
    }

    try {
      const data: ChapterData = await fetch(
        `/api/v1/chapters/${encodeURIComponent(book.name)}/${ch}?translation=${encodeURIComponent(trans)}`
      ).then(r => { if (!r.ok) throw new Error(); return r.json(); });

      if (useFlip) {
        if (exitAnimDoneRef.current) {
          // Exit animation already finished — show new content immediately
          setChapterData(data);
          setChapterLoading(false);
          setAnimClass(direction === 'next' ? 'page-flip-enter-next' : 'page-flip-enter-prev');
          if (biblePaneRef.current) biblePaneRef.current.scrollTop = 0;
          setChromeVisible(true);
          if (sidePanelModeRef.current === 'commentary') {
            loadCommentaryData(book, ch, commentarySourceRef.current);
          }
        } else {
          // Exit animation still running — hand off to onAnimationEnd
          pendingFlipDataRef.current = { data, direction };
        }
      } else {
        setChapterData(data);
        setChapterLoading(false);
        if (biblePaneRef.current) biblePaneRef.current.scrollTop = 0;
        setChromeVisible(true);
        if (sidePanelModeRef.current === 'commentary') {
          loadCommentaryData(book, ch, commentarySourceRef.current);
        }
      }
    } catch {
      pendingAiNavRef.current = null;
      pendingFlipDataRef.current = null;
      setChapterError(true);
      setChapterLoading(false);
      setAnimClass('');
    }
  }, [loadCommentaryData]);

  // ── Navigation ─────────────────────────────────────────────────────────────────
  const goPrev = useCallback(() => {
    const book = currentBookRef.current;
    const books = booksRef.current;
    if (!book || isFirstChapter()) return;
    if (chapterRef.current > 1) {
      const ch = chapterRef.current - 1;
      setChapter(ch);
      loadChapter(book, ch, translationRef.current, 'prev');
    } else {
      const prevBook = books.find(b => b.book_number === book.book_number - 1);
      if (!prevBook) return;
      setCurrentBook(prevBook);
      setChapter(prevBook.total_chapters);
      loadChapter(prevBook, prevBook.total_chapters, translationRef.current, 'prev');
    }
  }, [isFirstChapter, loadChapter]);

  const goNext = useCallback(() => {
    const book = currentBookRef.current;
    const books = booksRef.current;
    if (!book || isLastChapter()) return;
    if (chapterRef.current < book.total_chapters) {
      const ch = chapterRef.current + 1;
      setChapter(ch);
      loadChapter(book, ch, translationRef.current, 'next');
    } else {
      const nextBook = books.find(b => b.book_number === book.book_number + 1);
      if (!nextBook) return;
      setCurrentBook(nextBook);
      setChapter(1);
      loadChapter(nextBook, 1, translationRef.current, 'next');
    }
  }, [isLastChapter, loadChapter]);

  const pickChapter = useCallback((bookNumber: number, ch: number) => {
    const book = booksRef.current.find(b => b.book_number === bookNumber);
    if (!book) return;
    setCurrentBook(book);
    setChapter(ch);
    setExpandedBook(null);
    setBookPopupOpen(false);
    setSearchOpen(false);
    loadChapter(book, ch, translationRef.current);
  }, [loadChapter]);

  const pickTranslation = useCallback((id: string) => {
    setTranslation(id);
    setVersionPopupOpen(false);
    setSearchOpen(false);
    const book = currentBookRef.current;
    if (book) loadChapter(book, chapterRef.current, id);
  }, [loadChapter]);

  const navigateToPassage = useCallback((
    bookName: string | null | undefined,
    nextChapter: number,
    nextTranslation?: string,
    verseNumber?: number,
  ) => {
    if (bookName == null || bookName === '') return false;
    const needle = bookName.toLowerCase();
    const targetBook = booksRef.current.find(book => book.name?.toLowerCase() === needle);
    if (!targetBook) return false;
    if (verseNumber != null) {
      pendingAiNavRef.current = { start: verseNumber, end: verseNumber };
    } else {
      pendingAiNavRef.current = null;
      setAiNavHighlight(null);
    }
    const chosenTranslation = nextTranslation ?? translationRef.current;
    setCurrentBook(targetBook);
    setChapter(nextChapter);
    setTranslation(chosenTranslation);
    setBookPopupOpen(false);
    setVersionPopupOpen(false);
    setSearchOpen(false);
    loadChapter(targetBook, nextChapter, chosenTranslation, null, { fromAiNavigate: verseNumber != null });
    return true;
  }, [loadChapter]);

  const toggleStoredVerse = useCallback((storageKey: string, setter: Dispatch<SetStateAction<string[]>>) => {
    setter(prev => prev.includes(storageKey) ? prev.filter(item => item !== storageKey) : [...prev, storageKey]);
  }, []);

  // ── Side panel ────────────────────────────────────────────────────────────────
  const openSidePanel = useCallback((mode: Exclude<SidePanelMode, 'none'>) => {
    lastSidePanelModeRef.current = mode;
    setSidePanelMode(mode);
    if (mode === 'commentary') {
      const book = currentBookRef.current;
      if (book) loadCommentaryData(book, chapterRef.current, commentarySourceRef.current);
    }
  }, [loadCommentaryData]);

  const closeSidePanel = useCallback(() => {
    setSidePanelMode('none');
    setSyncedVerseStart(null);
    setCommentaryEntries([]);
  }, []);

  const toggleCommentary = useCallback(() => {
    sidePanelModeRef.current === 'commentary' ? closeSidePanel() : openSidePanel('commentary');
  }, [closeSidePanel, openSidePanel]);

  const toggleAiPanel = useCallback(() => {
    sidePanelModeRef.current === 'ai' ? closeSidePanel() : openSidePanel('ai');
  }, [closeSidePanel, openSidePanel]);

  const toggleStudyPanel = useCallback(() => {
    sidePanelModeRef.current === 'study' ? closeSidePanel() : openSidePanel('study');
  }, [closeSidePanel, openSidePanel]);

  const openReaderFromHome = useCallback((panel: SidePanelMode) => {
    setHomeScreenActive(false);
    if (panel === 'none') {
      closeSidePanel();
    } else {
      openSidePanel(panel);
    }
  }, [closeSidePanel, openSidePanel]);

  const goToHome = useCallback(() => {
    setHomeScreenActive(true);
    setSettingsOpen(false);
    closeSidePanel();
  }, [closeSidePanel]);

  const reopenLastSidePanel = useCallback(() => {
    const preferredDefault = readerSettingsRef.current.defaultPanel;
    const preferred =
      preferredDefault === 'none' ? lastSidePanelModeRef.current : preferredDefault;
    openSidePanel(preferred);
  }, [openSidePanel]);

  const toggleReaderFocus = useCallback(() => {
    if (sidePanelModeRef.current === 'none') {
      reopenLastSidePanel();
      return;
    }
    closeSidePanel();
  }, [closeSidePanel, reopenLastSidePanel]);

  const bibleBooksForAi = useMemo(
    () => books.map(b => ({ name: b.name, total_chapters: b.total_chapters })),
    [books],
  );
  const booksByNumber = useMemo(
    () => new Map(books.map(book => [book.book_number, book])),
    [books],
  );
  const bookNamesSorted = useMemo(
    () => sortBookNamesForMatching(books.map(book => book.name)),
    [books],
  );
  const parsedNavigation = useMemo(() => {
    const trimmed = searchQuery.trim();
    if (!trimmed) return null;
    const exact = parseReferenceLabel(trimmed, bookNamesSorted);
    if (exact) return exact;
    return parseReferenceLabel(normalizeReferenceSpacing(trimmed), bookNamesSorted);
  }, [bookNamesSorted, searchQuery]);
  const looseNavigationParts = useMemo(
    () => extractLooseReferenceParts(searchQuery),
    [searchQuery],
  );
  const searchSuggestions = useMemo(() => {
    const trimmed = searchQuery.trim();
    const suggestions: SearchSuggestion[] = [];
    const seenDestinations = new Set<string>();
    const addSuggestion = (suggestion: SearchSuggestion | null) => {
      if (!suggestion) return;
      const destinationKey = [
        suggestion.book.toLowerCase(),
        suggestion.chapter,
        suggestion.verseStart ?? '',
        suggestion.translation ?? '',
      ].join('::');
      if (seenDestinations.has(destinationKey)) return;
      seenDestinations.add(destinationKey);
      suggestions.push(suggestion);
    };

    if (!trimmed) {
      recentPassages.slice(0, 4).forEach((entry, index) => {
        addSuggestion({
          id: `recent-${chapterStorageKey(entry.book, entry.chapter, entry.translation)}`,
          label: formatSearchSuggestionLabel(entry.book, entry.chapter),
          hint: `Recent passage • ${entry.translation}`,
          book: entry.book,
          chapter: entry.chapter,
          translation: entry.translation,
          score: 860 - index * 24,
          source: 'recent',
        });
      });
      [...books]
        .sort((a, b) => getBookPopularityScore(b) - getBookPopularityScore(a))
        .slice(0, SEARCH_SUGGESTION_LIMIT)
        .forEach((book, index) => {
          addSuggestion({
            id: `popular-${book.book_number}`,
            label: formatSearchSuggestionLabel(book.name, 1),
            hint: index === 0 ? 'Popular book' : 'Popular suggestion',
            book: book.name,
            chapter: 1,
            score: 620 - index * 20 + getBookPopularityScore(book),
            source: 'popular',
          });
        });
      return suggestions
        .sort((a, b) => b.score - a.score)
        .slice(0, SEARCH_SUGGESTION_LIMIT);
    }

    if (parsedNavigation) {
      addSuggestion({
        id: `direct-${parsedNavigation.book}-${parsedNavigation.chapter}-${parsedNavigation.verse_start ?? ''}-${parsedNavigation.verse_end ?? ''}`.toLowerCase(),
        label: formatSearchSuggestionLabel(
          parsedNavigation.book,
          parsedNavigation.chapter,
          parsedNavigation.verse_start,
          parsedNavigation.verse_end,
        ),
        hint: 'Go to passage',
        book: parsedNavigation.book,
        chapter: parsedNavigation.chapter,
        verseStart: parsedNavigation.verse_start,
        verseEnd: parsedNavigation.verse_end,
        score: 1200,
        source: 'direct',
      });
    }

    const bookPart = looseNavigationParts.bookPart || trimmed;
    const compactQuery = compactSearchText(bookPart);
    const wantsSpecificPassage = looseNavigationParts.chapter != null || looseNavigationParts.verseStart != null;

    books
      .map(book => {
        const matchScore = scoreBookMatch(bookPart, book);
        if (!Number.isFinite(matchScore)) return null;
        const popularityScore = getBookPopularityScore(book);
        return {
          book,
          totalScore: matchScore + popularityScore,
        };
      })
      .filter((entry): entry is { book: BookInfo; totalScore: number } => !!entry && entry.totalScore > 250)
      .sort((a, b) => b.totalScore - a.totalScore)
      .slice(0, SEARCH_SUGGESTION_LIMIT)
      .forEach((entry, index) => {
        const chapter = wantsSpecificPassage ? clampChapterForBook(entry.book, looseNavigationParts.chapter) : 1;
        const exactish =
          compactQuery.length > 0 &&
          (compactSearchText(entry.book.name) === compactQuery
            || compactSearchText(entry.book.name).startsWith(compactQuery)
            || normalizeSearchText(entry.book.name).includes(normalizeSearchText(bookPart)));
        addSuggestion({
          id: `book-${entry.book.book_number}-${chapter}-${looseNavigationParts.verseStart ?? ''}-${looseNavigationParts.verseEnd ?? ''}`.toLowerCase(),
          label: formatSearchSuggestionLabel(
            entry.book.name,
            chapter,
            wantsSpecificPassage ? looseNavigationParts.verseStart : undefined,
            wantsSpecificPassage ? looseNavigationParts.verseEnd : undefined,
          ),
          hint: exactish
            ? index === 0
              ? 'Popular match'
              : 'Suggested book'
            : `Did you mean ${entry.book.name}?`,
          book: entry.book.name,
          chapter,
          verseStart: wantsSpecificPassage ? looseNavigationParts.verseStart : undefined,
          verseEnd: wantsSpecificPassage ? looseNavigationParts.verseEnd : undefined,
          score: entry.totalScore - index * 6,
          source: exactish ? 'popular' : 'typo',
        });
      });

    recentPassages.forEach((entry, index) => {
      const book = books.find(candidate => candidate.name.toLowerCase() === entry.book.toLowerCase());
      const label = formatSearchSuggestionLabel(entry.book, entry.chapter);
      const labelMatch = normalizeSearchText(label).includes(normalizeSearchText(trimmed));
      const bookScore = book ? scoreBookMatch(bookPart, book) : Number.NEGATIVE_INFINITY;
      const totalScore = Math.max(bookScore, labelMatch ? 320 : Number.NEGATIVE_INFINITY);
      if (!Number.isFinite(totalScore) || totalScore < 260) return;
      addSuggestion({
        id: `recent-match-${chapterStorageKey(entry.book, entry.chapter, entry.translation)}`,
        label,
        hint: `Recent passage • ${entry.translation}`,
        book: entry.book,
        chapter: entry.chapter,
        translation: entry.translation,
        score: totalScore + 44 - index * 5,
        source: 'recent',
      });
    });

    return suggestions
      .sort((a, b) => b.score - a.score)
      .slice(0, SEARCH_SUGGESTION_LIMIT);
  }, [bookNamesSorted, books, looseNavigationParts, parsedNavigation, recentPassages, searchQuery]);
  const topSearchSuggestion = searchSuggestions[0] ?? null;
  const searchLooksLikeNavigation = useMemo(() => {
    const trimmed = searchQuery.trim();
    if (!trimmed) return false;
    if (parsedNavigation) return true;
    if (!topSearchSuggestion) return false;
    if (looseNavigationParts.chapter != null || looseNavigationParts.verseStart != null) return true;
    const words = normalizeSearchText(looseNavigationParts.bookPart || trimmed).split(' ').filter(Boolean);
    return words.length <= 2 && topSearchSuggestion.score >= 320;
  }, [looseNavigationParts, parsedNavigation, searchQuery, topSearchSuggestion]);

  const handleAiNavigate = useCallback((params: AIActionParams) => {
    if (!params.book || !params.chapter) return;
    const targetBook = booksRef.current.find(
      book => book.name.toLowerCase() === params.book?.toLowerCase(),
    );
    if (!targetBook) return;
    const vs = params.verse_start;
    if (vs != null) {
      const ve = params.verse_end ?? vs;
      pendingAiNavRef.current = { start: vs, end: Math.max(vs, ve) };
    } else {
      pendingAiNavRef.current = null;
      setAiNavHighlight(null);
    }
    setCurrentBook(targetBook);
    setChapter(params.chapter);
    loadChapter(targetBook, params.chapter, translationRef.current, null, { fromAiNavigate: true });
  }, [loadChapter]);

  const handleAiOpenCommentary = useCallback((source?: string) => {
    const nextSource = source?.trim() || commentarySourceRef.current;
    commentarySourceRef.current = nextSource;
    setCommentarySource(nextSource);
    const book = currentBookRef.current;
    setSidePanelMode('commentary');
    if (book) loadCommentaryData(book, chapterRef.current, nextSource);
  }, [loadCommentaryData]);

  const clearReaderAskBubble = useCallback(() => {
    readerSelectionPayloadRef.current = null;
    setReaderAskBubble(null);
  }, []);

  const syncReaderTextSelection = useCallback(() => {
    const root = readerPassagesRef.current;
    if (!root) {
      clearReaderAskBubble();
      return;
    }
    const sel = window.getSelection();
    if (!sel || sel.rangeCount === 0 || sel.isCollapsed) {
      clearReaderAskBubble();
      return;
    }
    const range = sel.getRangeAt(0);
    const anchor = range.commonAncestorContainer;
    const anchorEl =
      anchor.nodeType === Node.TEXT_NODE ? anchor.parentElement : (anchor as Element);
    if (!anchorEl || !root.contains(anchorEl)) {
      clearReaderAskBubble();
      return;
    }
    const raw = sel.toString().replace(/\u00a0/g, ' ').trim();
    if (raw.length < 2) {
      clearReaderAskBubble();
      return;
    }
    const rect = range.getBoundingClientRect();
    if (rect.width < 2 && rect.height < 2) {
      clearReaderAskBubble();
      return;
    }
    const startLine = closestVerseLine(range.startContainer);
    const endLine = closestVerseLine(range.endContainer);
    let refLabel: string | undefined;
    if (chapterData && startLine?.dataset.verse && endLine?.dataset.verse) {
      const v1 = Number(startLine.dataset.verse);
      const v2 = Number(endLine.dataset.verse);
      if (Number.isFinite(v1) && Number.isFinite(v2)) {
        const lo = Math.min(v1, v2);
        const hi = Math.max(v1, v2);
        refLabel =
          hi > lo
            ? `${chapterData.book} ${chapterData.chapter}:${lo}–${hi}`
            : `${chapterData.book} ${chapterData.chapter}:${lo}`;
      }
    }
    readerSelectionPayloadRef.current = { text: raw, refLabel };
    setReaderAskBubble({ top: rect.top, left: rect.left + rect.width / 2 });
  }, [chapterData, clearReaderAskBubble]);

  const scheduleReaderSelectionSync = useCallback(() => {
    if (readerSelectionRafRef.current != null) cancelAnimationFrame(readerSelectionRafRef.current);
    readerSelectionRafRef.current = requestAnimationFrame(() => {
      readerSelectionRafRef.current = null;
      syncReaderTextSelection();
    });
  }, [syncReaderTextSelection]);

  useEffect(() => {
    document.addEventListener('selectionchange', scheduleReaderSelectionSync);
    return () => {
      document.removeEventListener('selectionchange', scheduleReaderSelectionSync);
      if (readerSelectionRafRef.current != null) cancelAnimationFrame(readerSelectionRafRef.current);
    };
  }, [scheduleReaderSelectionSync]);

  useEffect(() => {
    const pane = biblePaneRef.current;
    if (!pane) return;
    const onScroll = () => clearReaderAskBubble();
    pane.addEventListener('scroll', onScroll, { passive: true });
    return () => pane.removeEventListener('scroll', onScroll);
  }, [clearReaderAskBubble]);

  useEffect(() => {
    clearReaderAskBubble();
  }, [chapterData?.book, chapterData?.chapter, translation, clearReaderAskBubble]);

  useEffect(() => {
    setSelectedVerse(null);
    setSelectedVerseGroup([]);
    setVersePopupPos(null);
  }, [chapterData?.book, chapterData?.chapter, translation]);

  useEffect(() => {
    if (sidePanelMode !== 'commentary' || !currentBook) return;
    loadCommentaryData(currentBook, chapter, commentarySource);
  }, [chapter, commentarySource, currentBook, loadCommentaryData, sidePanelMode]);

  const handleAskFromReaderSelection = useCallback(() => {
    const payload = readerSelectionPayloadRef.current;
    if (!payload?.text) return;
    openSidePanel('ai');
    setAiComposerSeed({ id: Date.now(), text: buildExplainVersePrompt(payload.refLabel, payload.text) });
    clearReaderAskBubble();
    window.getSelection()?.removeAllRanges();
  }, [openSidePanel, clearReaderAskBubble]);

  const currentAgentName = PERSONALITIES.find(p => p.id === personalityId)?.name ?? 'Jessica';
  const selectedVerseKey = currentBook && selectedVerse != null
    ? verseStorageKey(currentBook.name, chapter, selectedVerse)
    : null;
  const selectedVerseData = selectedVerse != null
    ? chapterData?.verses.find(verse => verse.verse === selectedVerse) ?? null
    : null;
  const selectedVerseNote = selectedVerseKey ? verseNotes[selectedVerseKey] : undefined;
  const todayIso = computeTodayIso();
  const chaptersToday = readingProgress.todayIso === todayIso ? readingProgress.todayChapters.length : 0;
  const todayGoalDone = chaptersToday >= dailyGoalChapters;
  const dailyVerse = selectDailyVerse(todayIso);
  const readingRhythmTitle = todayGoalDone
    ? "Today\u2019s goal is done."
    : dailyGoalChapters === 1
      ? 'Read 1 chapter today.'
      : `Read ${chaptersToday} of ${dailyGoalChapters} chapters today.`;
  const savedVerseCount = highlightedVerses.length + bookmarkedVerses.length + Object.keys(verseNotes).length;

  const persistRecentPassage = useCallback((bookName: string, currentChapter: number, currentTranslation: string) => {
    const nextEntry: SavedPassage = {
      book: bookName,
      chapter: currentChapter,
      translation: currentTranslation,
      savedAt: Date.now(),
    };
    setRecentPassages(prev => {
      const filtered = prev.filter(entry => chapterStorageKey(entry.book, entry.chapter, entry.translation) !== chapterStorageKey(bookName, currentChapter, currentTranslation));
      return [nextEntry, ...filtered].slice(0, MAX_RECENT_PASSAGES);
    });
  }, []);

  const recordChapterEngagement = useCallback((bookName: string, currentChapter: number, currentTranslation: string, furthestVerse: number, totalVerses: number) => {
    const today = computeTodayIso();
    const chKey = chapterStorageKey(bookName, currentChapter, currentTranslation);
    const now = Date.now();
    const priorSession = chapterEngagementRef.current;
    const sameSession = priorSession.key === chKey;
    const engagedDelta = sameSession && priorSession.lastInteractionAt != null
      ? Math.min(MAX_ENGAGEMENT_GAP_MS, Math.max(0, now - priorSession.lastInteractionAt))
      : 0;
    chapterEngagementRef.current = { key: chKey, lastInteractionAt: now };
    setReadingProgress(prev => {
      let nextProgress = prev;
      if (nextProgress.todayIso !== today) {
        nextProgress = {
          ...nextProgress,
          todayIso: today,
          todayChapters: [],
          todayChapterEvidence: {},
        };
      }
      const priorEvidence = nextProgress.todayChapterEvidence[chKey] ?? { furthestVerse: 0, engagedMs: 0 };
      const nextEvidence: ChapterReadEvidence = {
        furthestVerse: Math.max(priorEvidence.furthestVerse, furthestVerse),
        engagedMs: priorEvidence.engagedMs + engagedDelta,
      };
      const alreadyCounted = nextProgress.todayChapters.includes(chKey);
      const shouldCount = alreadyCounted || chapterEvidenceQualifies(nextEvidence, totalVerses);
      const todayChapters = shouldCount && !alreadyCounted
        ? [...nextProgress.todayChapters, chKey]
        : nextProgress.todayChapters;
      const evidenceUnchanged =
        priorEvidence.furthestVerse === nextEvidence.furthestVerse &&
        priorEvidence.engagedMs === nextEvidence.engagedMs;
      if (evidenceUnchanged && todayChapters === nextProgress.todayChapters) {
        return syncGoalCompletion(nextProgress, dailyGoalChapters, today);
      }
      return syncGoalCompletion({
        ...nextProgress,
        todayChapters,
        todayChapterEvidence: {
          ...nextProgress.todayChapterEvidence,
          [chKey]: nextEvidence,
        },
      }, dailyGoalChapters, today);
    });
  }, [dailyGoalChapters]);

  const computeTopVisibleVerseFromDom = useCallback((): number => {
    const pane = biblePaneRef.current;
    if (!pane) return 1;
    const paneRect = pane.getBoundingClientRect();
    const verses = pane.querySelectorAll<HTMLElement>('.verse-line[data-verse]');
    for (const el of verses) {
      const rect = el.getBoundingClientRect();
      if (rect.bottom > paneRect.top + 12) return Number(el.dataset.verse);
    }
    return 1;
  }, []);

  const updateTopVisibleVerse = useCallback((fallbackVerse?: number) => {
    if (visibleVersesRef.current.size > 0) {
      topVisibleVerseRef.current = Math.min(...visibleVersesRef.current);
      return topVisibleVerseRef.current;
    }
    if (fallbackVerse != null) {
      topVisibleVerseRef.current = fallbackVerse;
      return fallbackVerse;
    }
    const nextVerse = computeTopVisibleVerseFromDom();
    topVisibleVerseRef.current = nextVerse;
    return nextVerse;
  }, [computeTopVisibleVerseFromDom]);

  const getTopVisibleVerse = useCallback((): number => {
    return topVisibleVerseRef.current || updateTopVisibleVerse();
  }, [updateTopVisibleVerse]);

  const flushPendingEngagement = useCallback(() => {
    if (engagementTimerRef.current) {
      clearTimeout(engagementTimerRef.current);
      engagementTimerRef.current = null;
    }
    const pending = pendingEngagementRef.current;
    if (!pending) return;
    pendingEngagementRef.current = null;
    lastEngagementCommitAtRef.current = Date.now();
    recordChapterEngagement(
      pending.bookName,
      pending.currentChapter,
      pending.currentTranslation,
      pending.furthestVerse,
      pending.totalVerses,
    );
  }, [recordChapterEngagement]);

  const scheduleReadingProgressCommit = useCallback((
    bookName: string,
    currentChapter: number,
    currentTranslation: string,
    furthestVerse: number,
    totalVerses: number,
  ) => {
    const existing = pendingEngagementRef.current;
    if (
      existing &&
      existing.bookName === bookName &&
      existing.currentChapter === currentChapter &&
      existing.currentTranslation === currentTranslation
    ) {
      existing.furthestVerse = Math.max(existing.furthestVerse, furthestVerse);
      existing.totalVerses = totalVerses;
    } else {
      pendingEngagementRef.current = {
        bookName,
        currentChapter,
        currentTranslation,
        furthestVerse,
        totalVerses,
      };
    }

    const now = Date.now();
    const elapsed = now - lastEngagementCommitAtRef.current;
    if (elapsed >= ENGAGEMENT_COMMIT_MS) {
      flushPendingEngagement();
      return;
    }
    if (engagementTimerRef.current) return;
    engagementTimerRef.current = setTimeout(
      flushPendingEngagement,
      Math.max(40, ENGAGEMENT_COMMIT_MS - elapsed),
    );
  }, [flushPendingEngagement]);

  const markScrollActive = useCallback(() => {
    if (typeof document === 'undefined') return;
    if (!scrollEffectsDowngradedRef.current) {
      document.documentElement.setAttribute('data-scroll-active', '1');
      scrollEffectsDowngradedRef.current = true;
    }
    if (scrollActiveTimerRef.current) clearTimeout(scrollActiveTimerRef.current);
    scrollActiveTimerRef.current = setTimeout(() => {
      document.documentElement.removeAttribute('data-scroll-active');
      scrollEffectsDowngradedRef.current = false;
      scrollActiveTimerRef.current = null;
    }, SCROLL_ACTIVE_HOLD_MS);
  }, []);

  useEffect(() => {
    if (typeof window === 'undefined' || !currentBook) return;
    window.localStorage.setItem(LAST_POSITION_STORAGE_KEY, JSON.stringify({
      book: currentBook.name,
      chapter,
      translation,
    }));
    persistRecentPassage(currentBook.name, chapter, translation);
  }, [chapter, currentBook, persistRecentPassage, translation]);

  useEffect(() => {
    if (!currentBook) return;
    chapterEngagementRef.current = {
      key: chapterStorageKey(currentBook.name, chapter, translation),
      lastInteractionAt: Date.now(),
    };
  }, [chapter, currentBook, translation]);

  const applySearchSuggestion = useCallback((
    suggestion: SearchSuggestion,
    options?: { closePanel?: boolean },
  ) => {
    searchRequestIdRef.current += 1;
    setSearchLoading(false);
    const moved = navigateToPassage(
      suggestion.book,
      suggestion.chapter,
      suggestion.translation,
      suggestion.verseStart,
    );
    setSearchResults([]);
    setSearchError(moved ? null : 'Could not navigate to that passage.');
    if (moved) {
      setSearchQuery(suggestion.label);
      if (options?.closePanel ?? true) setSearchOpen(false);
    }
  }, [navigateToPassage]);

  const runPhraseSearch = useCallback(async (
    query: string,
    options?: { showEmptyError?: boolean },
  ) => {
    const trimmed = query.trim();
    if (!trimmed) {
      searchRequestIdRef.current += 1;
      setSearchResults([]);
      setSearchError(null);
      setSearchLoading(false);
      return;
    }
    const requestId = ++searchRequestIdRef.current;
    setSearchLoading(true);
    setSearchError(null);
    try {
      const response = await fetch('/api/v1/search', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query: trimmed, translation, limit: 12 }),
      });
      if (!response.ok) throw new Error('Search is unavailable right now.');
      const results = await response.json() as SearchResult[];
      if (requestId !== searchRequestIdRef.current) return;
      setSearchResults(results);
      if (!results.length) {
        setSearchError(
          options?.showEmptyError
            ? 'No matching verses found. Try a shorter phrase or a passage reference.'
            : null,
        );
      }
    } catch (error) {
      if (requestId !== searchRequestIdRef.current) return;
      setSearchResults([]);
      setSearchError(error instanceof Error ? error.message : 'Search is unavailable right now.');
    } finally {
      if (requestId === searchRequestIdRef.current) setSearchLoading(false);
    }
  }, [translation]);

  const runSearch = useCallback(async () => {
    const trimmed = searchQuery.trim();
    if (!trimmed) {
      searchRequestIdRef.current += 1;
      setSearchResults([]);
      setSearchError(null);
      setSearchLoading(false);
      return;
    }
    if (searchLooksLikeNavigation && topSearchSuggestion) {
      applySearchSuggestion(topSearchSuggestion);
      return;
    }
    await runPhraseSearch(trimmed, { showEmptyError: true });
  }, [applySearchSuggestion, runPhraseSearch, searchLooksLikeNavigation, searchQuery, topSearchSuggestion]);

  const closeVerseStudyPopup = useCallback(() => {
    setSelectedVerse(null);
    setSelectedVerseGroup([]);
    setVersePopupPos(null);
    setShowVerseNoteEditor(false);
  }, []);

  const toggleVerseHighlight = useCallback(() => {
    if (!selectedVerseKey || !currentBook) return;
    const isCurrentlyHighlighted = highlightedVerses.includes(selectedVerseKey);
    const groupKeys = selectedVerseGroup.map(v => verseStorageKey(currentBook.name, chapter, v));
    setHighlightedVerses(prev =>
      isCurrentlyHighlighted
        ? prev.filter(k => !groupKeys.includes(k))
        : [...new Set([...prev, ...groupKeys])]
    );
    if (!isCurrentlyHighlighted) setShowVerseNoteEditor(true);
  }, [chapter, currentBook, highlightedVerses, selectedVerseGroup, selectedVerseKey]);

  const toggleVerseBookmark = useCallback(() => {
    if (!selectedVerseKey) return;
    toggleStoredVerse(selectedVerseKey, setBookmarkedVerses);
  }, [selectedVerseKey, toggleStoredVerse]);

  const saveVerseNote = useCallback(() => {
    if (!selectedVerseKey || !currentBook || selectedVerse == null) return;
    const text = currentNoteDraft.trim();
    setVerseNotes(prev => {
      if (!text) {
        const next = { ...prev };
        delete next[selectedVerseKey];
        return next;
      }
      return {
        ...prev,
        [selectedVerseKey]: {
          key: selectedVerseKey,
          book: currentBook.name,
          chapter,
          verse: selectedVerse,
          text,
          updatedAt: Date.now(),
        },
      };
    });
    closeVerseStudyPopup();
  }, [chapter, closeVerseStudyPopup, currentBook, currentNoteDraft, selectedVerse, selectedVerseKey]);

  const copySelectedVerse = useCallback(async () => {
    if (!currentBook || !chapterData) return;
    const sorted = [...selectedVerseGroup].sort((a, b) => a - b);
    const lines = sorted
      .map(vn => chapterData.verses.find(v => v.verse === vn))
      .filter(Boolean)
      .map(v => v!.text);
    const ref = formatVerseGroupRef(currentBook.name, chapter, sorted);
    const text = `${ref} (${translation})\n${lines.join(' ')}`;
    try {
      if (navigator.share) {
        await navigator.share({ title: ref, text });
      } else if (navigator.clipboard?.writeText) {
        await navigator.clipboard.writeText(text);
      }
    } catch {
      /* ignore */
    }
  }, [chapter, chapterData, currentBook, selectedVerseGroup, translation]);

  const buildSyncedStudyItems = useCallback((): SyncedStudyItem[] => {
    if (!books.length) return [];
    const notesEntries = Object.values(verseNotes).map(note => {
      const book = books.find(entry => entry.name.toLowerCase() === note.book.toLowerCase());
      return book ? {
        translation,
        book_number: book.book_number,
        chapter: note.chapter,
        verse_start: note.verse,
        verse_end: note.verse,
        kind: 'note' as const,
        note: note.text,
      } : null;
    }).filter(Boolean) as SyncedStudyItem[];

    const highlights = highlightedVerses.map(key => {
      const [bookName, chapterRaw, verseRaw] = key.split('::');
      const book = books.find(entry => entry.name.toLowerCase() === bookName.toLowerCase());
      return book ? {
        translation,
        book_number: book.book_number,
        chapter: Number(chapterRaw),
        verse_start: Number(verseRaw),
        verse_end: Number(verseRaw),
        kind: 'highlight' as const,
        color: '#FFEB3B',
      } : null;
    }).filter(Boolean) as SyncedStudyItem[];

    const bookmarks = bookmarkedVerses.map(key => {
      const [bookName, chapterRaw, verseRaw] = key.split('::');
      const book = books.find(entry => entry.name.toLowerCase() === bookName.toLowerCase());
      return book ? {
        translation,
        book_number: book.book_number,
        chapter: Number(chapterRaw),
        verse_start: Number(verseRaw),
        verse_end: Number(verseRaw),
        kind: 'bookmark' as const,
      } : null;
    }).filter(Boolean) as SyncedStudyItem[];

    return [...highlights, ...bookmarks, ...notesEntries];
  }, [bookmarkedVerses, books, highlightedVerses, translation, verseNotes]);

  const buildSyncedReadingProgress = useCallback((): SyncedReadingProgress[] => {
    if (!currentBook) return [];
    const chKey = chapterStorageKey(currentBook.name, chapter, translation);
    const today = computeTodayIso();
    const furthestTrackedVerse = readingProgress.todayIso === today
      ? readingProgress.todayChapterEvidence[chKey]?.furthestVerse ?? 0
      : 0;
    return [{
      translation,
      book_number: currentBook.book_number,
      chapter,
      last_verse: Math.max(selectedVerse ?? 0, furthestTrackedVerse, 1),
    }];
  }, [chapter, currentBook, readingProgress.todayChapterEvidence, readingProgress.todayIso, selectedVerse, translation]);

  const buildSyncedUserSettings = useCallback((): SyncedUserSettings => ({
    theme: currentTheme,
    font_scale: readerSettings.fontScale,
    line_height: readerSettings.lineHeight,
    reduced_motion: readerSettings.reducedMotion,
    page_flip_enabled: readerSettings.pageFlipEnabled,
    high_contrast: readerSettings.highContrast,
    default_panel: readerSettings.defaultPanel,
    side_panel_position: readerSettings.sidePanelPosition,
    reader_font: readerSettings.readerFont,
    highlight_color: readerSettings.highlightColor,
    reading_mode: readerSettings.readingMode,
    recent_passages: recentPassages.map(entry => ({
      book: entry.book,
      chapter: entry.chapter,
      translation: entry.translation,
      saved_at: entry.savedAt,
    })),
  }), [currentTheme, readerSettings, recentPassages]);

  const applyRemoteAccountState = useCallback((
    items: SyncedStudyItem[],
    progressItems: SyncedReadingProgress[],
    settings: SyncedUserSettings,
  ) => {
    hydratingAccountRef.current = true;
    const nextHighlights: string[] = [];
    const nextBookmarks: string[] = [];
    const nextNotes: Record<string, VerseNote> = {};
    items.forEach(item => {
      const book = booksByNumber.get(item.book_number);
      if (!book) return;
      const key = verseStorageKey(book.name, item.chapter, item.verse_start);
      if (item.kind === 'highlight') nextHighlights.push(key);
      if (item.kind === 'bookmark') nextBookmarks.push(key);
      if (item.kind === 'note' && item.note) {
        nextNotes[key] = {
          key,
          book: book.name,
          chapter: item.chapter,
          verse: item.verse_start,
          text: item.note,
          updatedAt: Date.now(),
        };
      }
    });
    setHighlightedVerses(nextHighlights);
    setBookmarkedVerses(nextBookmarks);
    setVerseNotes(nextNotes);
    setRecentPassages(settings.recent_passages.map(item => ({
      book: item.book,
      chapter: item.chapter,
      translation: item.translation,
      savedAt: item.saved_at,
    })));
    setReaderSettings(normalizeReaderSettings({
      fontScale: settings.font_scale,
      lineHeight: settings.line_height,
      readerFont: settings.reader_font,
      highlightColor: settings.highlight_color,
      readingMode: settings.reading_mode,
      reducedMotion: settings.reduced_motion,
      pageFlipEnabled: settings.page_flip_enabled,
      highContrast: settings.high_contrast,
      defaultPanel: settings.default_panel,
      sidePanelPosition: settings.side_panel_position,
    }));
    if (progressItems.length > 0) {
      const latest = progressItems[0];
      const book = booksByNumber.get(latest.book_number);
      if (book) {
        setCurrentBook(book);
        setChapter(latest.chapter);
        setTranslation(latest.translation);
        void loadChapter(book, latest.chapter, latest.translation);
      }
    }
    queueMicrotask(() => {
      hydratingAccountRef.current = false;
      syncReadyRef.current = true;
    });
  }, [booksByNumber, loadChapter]);

  const syncAccountState = useCallback(async (session: AuthSession) => {
    if (!books.length) return;
    const [profile, items, progressItems, settings] = await Promise.all([
      getProfile(session),
      getStudyItems(session),
      getReadingProgress(session),
      getUserSettings(session),
    ]);
    setAccountProfile(profile);
    const hasLocalStudyState =
      highlightedVerses.length > 0 ||
      bookmarkedVerses.length > 0 ||
      Object.keys(verseNotes).length > 0 ||
      recentPassages.length > 0;
    const remoteHasStudyState = items.length > 0 || progressItems.length > 0;
    if (!remoteHasStudyState && hasLocalStudyState) {
      await Promise.all([
        putStudyItems(session, buildSyncedStudyItems()),
        putReadingProgress(session, buildSyncedReadingProgress()),
        putUserSettings(session, buildSyncedUserSettings()),
      ]);
      const [freshItems, freshProgress, freshSettings] = await Promise.all([
        getStudyItems(session),
        getReadingProgress(session),
        getUserSettings(session),
      ]);
      applyRemoteAccountState(freshItems, freshProgress, freshSettings);
      return;
    }
    applyRemoteAccountState(items, progressItems, settings);
  }, [
    applyRemoteAccountState,
    bookmarkedVerses.length,
    books.length,
    buildSyncedReadingProgress,
    buildSyncedStudyItems,
    buildSyncedUserSettings,
    getStudyItems,
    highlightedVerses.length,
    recentPassages.length,
    verseNotes,
  ]);

  const handleAuthSignIn = useCallback(async (email: string, password: string) => {
    setAuthBusy(true);
    setAuthError(null);
    try {
      const session = await signIn(email, password);
      accountBootstrapRef.current = true;
      persistAuthSession(session);
      setAuthSession(session);
      await syncAccountState(session);
    } catch (error) {
      setAuthError(error instanceof Error ? error.message : 'Could not sign in.');
    } finally {
      setAuthBusy(false);
    }
  }, [syncAccountState]);

  const handleAuthSignUp = useCallback(async (email: string, password: string, displayName: string) => {
    setAuthBusy(true);
    setAuthError(null);
    try {
      const session = await signUp(email, password, displayName);
      accountBootstrapRef.current = true;
      persistAuthSession(session);
      setAuthSession(session);
      await syncAccountState(session);
    } catch (error) {
      setAuthError(error instanceof Error ? error.message : 'Could not create the account.');
    } finally {
      setAuthBusy(false);
    }
  }, [syncAccountState]);

  const handleAuthSignOut = useCallback(async () => {
    if (!authSession) return;
    setAuthBusy(true);
    setAuthError(null);
    try {
      await signOut(authSession);
    } catch {
      /* ignore sign-out transport issues and clear local session */
    } finally {
      persistAuthSession(null);
      setAuthSession(null);
      setAccountProfile(null);
      accountBootstrapRef.current = false;
      syncReadyRef.current = false;
      hydratingAccountRef.current = false;
      setAuthBusy(false);
    }
  }, [authSession]);

  // ── Commentary sync ───────────────────────────────────────────────────────────
  const scrollVerseIntoView = useCallback((verseNumber: number) => {
    const pane = biblePaneRef.current;
    if (!pane) return;
    const target = pane.querySelector<HTMLElement>(`.verse-line[data-verse="${verseNumber}"]`);
    if (!target) return;
    const paneRect = pane.getBoundingClientRect();
    const targetRect = target.getBoundingClientRect();
    const top = pane.scrollTop + (targetRect.top - paneRect.top) - 28;
    pane.scrollTo({ top: Math.max(0, top), behavior: 'smooth' });
  }, []);

  const syncCommentaryToVerse = useCallback((verseNumber: number, entries: CommentaryEntry[]) => {
    if (!entries.length) return;
    let synced = entries[0];
    for (const e of entries) {
      const start = Number(e.verse_start);
      const end   = e.verse_end == null ? start : Number(e.verse_end);
      if (verseNumber >= start && verseNumber <= end) { synced = e; break; }
      if (start <= verseNumber) synced = e;
    }
    setSyncedVerseStart(synced.verse_start);
  }, []);

  const requestCommentarySync = useCallback((entries: CommentaryEntry[]) => {
    if (sidePanelModeRef.current !== 'commentary') return;
    const now = performance.now();
    if (commentarySyncTimerRef.current) return;
    const schedule = () => {
      if (commSyncRafRef.current) return;
      commSyncRafRef.current = requestAnimationFrame(() => {
        commSyncRafRef.current = null;
        lastCommentarySyncAtRef.current = performance.now();
        syncCommentaryToVerse(getTopVisibleVerse(), entries);
      });
    };
    if (now - lastCommentarySyncAtRef.current >= COMMENTARY_SYNC_THROTTLE_MS) {
      schedule();
      return;
    }
    commentarySyncTimerRef.current = setTimeout(() => {
      commentarySyncTimerRef.current = null;
      schedule();
    }, Math.max(16, COMMENTARY_SYNC_THROTTLE_MS - (now - lastCommentarySyncAtRef.current)));
  }, [syncCommentaryToVerse, getTopVisibleVerse]);

  const scheduleCommentarySyncAfterScroll = useCallback((entries: CommentaryEntry[]) => {
    if (sidePanelModeRef.current !== 'commentary') return;
    if (commentarySyncIdleTimerRef.current) clearTimeout(commentarySyncIdleTimerRef.current);
    commentarySyncIdleTimerRef.current = setTimeout(() => {
      commentarySyncIdleTimerRef.current = null;
      requestCommentarySync(entries);
    }, COMMENTARY_SYNC_THROTTLE_MS);
  }, [requestCommentarySync]);

  // Stable ref so scroll handler can always access latest entries
  const commentaryEntriesRef = useRef<CommentaryEntry[]>([]);
  useEffect(() => { commentaryEntriesRef.current = commentaryEntries; }, [commentaryEntries]);

  // Scroll synced entry into view when syncedVerseStart changes
  useEffect(() => {
    if (syncedVerseStart === null || !sideScrollRef.current) return;
    const container = sideScrollRef.current;
    const synced = container.querySelector<HTMLElement>('.commentary-entry.synced');
    if (!synced) return;
    const containerRect = synced.parentElement?.getBoundingClientRect() ?? container.getBoundingClientRect();
    const entryRect = synced.getBoundingClientRect();
    const headerEl = sidePaneRef.current?.querySelector<HTMLElement>('.side-header');
    const headerH  = headerEl?.offsetHeight ?? 0;
    const viewportTop    = container.scrollTop + headerH;
    const viewportBottom = container.scrollTop + container.clientHeight - 32;
    const entryTop    = container.scrollTop + (entryRect.top - containerRect.top);
    const entryBottom = entryTop + entryRect.height;
    if (entryTop < viewportTop || entryBottom > viewportBottom) {
      container.scrollTo({ top: Math.max(0, entryTop - 18), behavior: 'smooth' });
    }
  }, [syncedVerseStart]);

  // Trigger initial sync when commentary loads
  useEffect(() => {
    if (commentaryEntries.length && sidePanelMode === 'commentary') {
      if (sideScrollRef.current) sideScrollRef.current.scrollTop = 0;
      requestCommentarySync(commentaryEntries);
    }
  }, [commentaryEntries, sidePanelMode, requestCommentarySync]);

  useEffect(() => {
    const pane = biblePaneRef.current;
    const passages = readerPassagesRef.current;
    visibleVersesRef.current.clear();
    topVisibleVerseRef.current = chapterData?.verses[0]?.verse ?? 1;
    if (!pane || !passages || !chapterData) return;

    const verseEls = passages.querySelectorAll<HTMLElement>('.verse-line[data-verse]');
    if (!verseEls.length) return;

    if (typeof window.IntersectionObserver !== 'function') {
      topVisibleVerseRef.current = computeTopVisibleVerseFromDom();
      return;
    }

    const observer = new window.IntersectionObserver((entries) => {
      for (const entry of entries) {
        const verse = Number((entry.target as HTMLElement).dataset.verse);
        if (!Number.isFinite(verse)) continue;
        if (entry.isIntersecting) visibleVersesRef.current.add(verse);
        else visibleVersesRef.current.delete(verse);
      }
      updateTopVisibleVerse(chapterData.verses[0]?.verse ?? 1);
    }, {
      root: pane,
      threshold: 0,
      rootMargin: '-12px 0px -68% 0px',
    });

    verseObserverRef.current = observer;
    verseEls.forEach(el => observer.observe(el));
    topVisibleVerseRef.current = computeTopVisibleVerseFromDom();

    return () => {
      observer.disconnect();
      if (verseObserverRef.current === observer) verseObserverRef.current = null;
      visibleVersesRef.current.clear();
    };
  }, [
    chapterData?.book,
    chapterData?.chapter,
    chapterData?.verses,
    computeTopVisibleVerseFromDom,
    readerSettings.readingMode,
    updateTopVisibleVerse,
  ]);

  useEffect(() => {
    const pending = pendingAiNavRef.current;
    if (!chapterData || !pending) return;
    pendingAiNavRef.current = null;
    const maxV = chapterData.verses.length
      ? Math.max(...chapterData.verses.map(v => v.verse))
      : 1;
    const start = Math.min(Math.max(1, pending.start), maxV);
    const end = Math.min(Math.max(start, pending.end), maxV);
    const rafId = requestAnimationFrame(() => {
      scrollVerseIntoView(start);
      setAiNavHighlight({ start, end });
    });
    return () => cancelAnimationFrame(rafId);
  }, [chapterData, scrollVerseIntoView]);

  useEffect(() => {
    if (!aiNavHighlight) return;
    const t = window.setTimeout(() => setAiNavHighlight(null), 4200);
    return () => clearTimeout(t);
  }, [aiNavHighlight]);

  useEffect(() => {
    return () => {
      flushPendingEngagement();
    };
  }, [flushPendingEngagement]);

  useEffect(() => {
    return () => {
      if (commentarySyncTimerRef.current) clearTimeout(commentarySyncTimerRef.current);
      if (commentarySyncIdleTimerRef.current) clearTimeout(commentarySyncIdleTimerRef.current);
      if (engagementTimerRef.current) clearTimeout(engagementTimerRef.current);
      if (scrollActiveTimerRef.current) clearTimeout(scrollActiveTimerRef.current);
      if (typeof document !== 'undefined') document.documentElement.removeAttribute('data-scroll-active');
    };
  }, []);

  useEffect(() => {
    flushPendingEngagement();
    pendingEngagementRef.current = null;
    lastEngagementCommitAtRef.current = 0;
    if (engagementTimerRef.current) {
      clearTimeout(engagementTimerRef.current);
      engagementTimerRef.current = null;
    }
  }, [chapterData?.book, chapterData?.chapter, translation, flushPendingEngagement]);

  // ── Scroll handler ────────────────────────────────────────────────────────────
  useEffect(() => {
    const pane = biblePaneRef.current;
    if (!pane || !currentBook || !chapterData) return;
    const onScroll = () => {
      markScrollActive();
      const y = pane.scrollTop;
      const delta = y - lastScrollYRef.current;
      let nextChromeVisible = chromeVisibleRef.current;
      if (delta > 6 && y > 80) nextChromeVisible = false;
      else if (delta < -6 || y < 10) nextChromeVisible = true;
      if (nextChromeVisible !== chromeVisibleRef.current) {
        chromeVisibleRef.current = nextChromeVisible;
        setChromeVisible(nextChromeVisible);
      }
      lastScrollYRef.current = y;
      const topVerse = updateTopVisibleVerse(chapterData.verses[0]?.verse ?? 1);
      scheduleReadingProgressCommit(
        currentBook.name,
        chapter,
        translation,
        topVerse,
        chapterData.verses.length,
      );
      scheduleCommentarySyncAfterScroll(commentaryEntriesRef.current);
    };
    pane.addEventListener('scroll', onScroll, { passive: true });
    return () => pane.removeEventListener('scroll', onScroll);
  }, [
    chapter,
    chapterData,
    currentBook,
    markScrollActive,
    scheduleCommentarySyncAfterScroll,
    scheduleReadingProgressCommit,
    translation,
    updateTopVisibleVerse,
  ]);

  // ── Touch swipe + trackpad two-finger swipe ───────────────────────────────────
  useEffect(() => {
    const pane = biblePaneRef.current;
    const contentArea = contentAreaRef.current;
    if (!pane || !contentArea) return;

    const isHorizontalGesture = (dx: number, dy: number) =>
      Math.abs(dx) > 60 && Math.abs(dx) > Math.abs(dy) * 1.5;

    const isSideEdgeStart = (clientX: number) => {
      const edgeThreshold = 48;
      return sidePanelPositionRef.current === 'left'
        ? clientX <= edgeThreshold
        : clientX >= window.innerWidth - edgeThreshold;
    };

    // ── Single-finger touch (mobile) ──────────────────────────────────────────
    const onStart = (e: TouchEvent) => {
      touchStartXRef.current = e.touches[0].clientX;
      touchStartYRef.current = e.touches[0].clientY;
      touchGestureModeRef.current = isSideEdgeStart(e.touches[0].clientX) ? 'side-toggle' : 'chapter';
    };
    const onEnd = (e: TouchEvent) => {
      if (touchStartXRef.current === null) return;
      const dx = e.changedTouches[0].clientX - touchStartXRef.current;
      const dy = e.changedTouches[0].clientY - touchStartYRef.current;
      if (!isHorizontalGesture(dx, dy)) {
        touchStartXRef.current = null;
        touchGestureModeRef.current = 'chapter';
        return;
      }
      if (touchGestureModeRef.current === 'side-toggle') {
        toggleReaderFocus();
      } else {
        // swipe left → previous chapter, swipe right → next chapter
        dx < 0 ? goNext() : goPrev();
      }
      touchStartXRef.current = null;
      touchGestureModeRef.current = 'chapter';
    };

    // ── Two-finger trackpad horizontal swipe (desktop) ────────────────────────
    let wheelAccX = 0;
    let wheelLocked = false;
    let wheelResetTimer: ReturnType<typeof setTimeout> | null = null;

    const onWheel = (e: WheelEvent) => {
      // Only handle dominant horizontal movement (two-finger horizontal swipe)
      if (Math.abs(e.deltaX) <= Math.abs(e.deltaY)) return;
      if (e.ctrlKey || e.metaKey || e.altKey) return;
      e.preventDefault();
      if (wheelLocked) return;

      wheelAccX += e.deltaX;

      if (wheelResetTimer) clearTimeout(wheelResetTimer);
      wheelResetTimer = setTimeout(() => { wheelAccX = 0; }, 1200);

      if (Math.abs(wheelAccX) > 120) {
        wheelLocked = true;
        wheelAccX = 0;
        toggleReaderFocus();
        wheelResetTimer = setTimeout(() => { wheelAccX = 0; wheelLocked = false; }, 2000);
      }
    };

    pane.addEventListener('touchstart', onStart, { passive: true });
    pane.addEventListener('touchend', onEnd, { passive: true });
    contentArea.addEventListener('wheel', onWheel, { passive: false });
    return () => {
      pane.removeEventListener('touchstart', onStart);
      pane.removeEventListener('touchend', onEnd);
      contentArea.removeEventListener('wheel', onWheel);
      if (wheelResetTimer) clearTimeout(wheelResetTimer);
    };
  }, [goNext, goPrev, toggleReaderFocus]);

  // ── Keyboard ──────────────────────────────────────────────────────────────────
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        setBookPopupOpen(false);
        setVersionPopupOpen(false);
        setSettingsOpen(false);
        setSearchOpen(false);
      }
      if (e.key === 'ArrowRight') goNext();
      if (e.key === 'ArrowLeft')  goPrev();
    };
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [goNext, goPrev]);

  useEffect(() => {
    if (!searchOpen) return;
    const id = window.requestAnimationFrame(() => searchInputRef.current?.focus());
    return () => cancelAnimationFrame(id);
  }, [searchOpen]);

  useEffect(() => {
    if (!searchOpen) return;
    const trimmed = searchQuery.trim();
    if (!trimmed || searchLooksLikeNavigation || trimmed.length < 3) {
      searchRequestIdRef.current += 1;
      setSearchLoading(false);
      setSearchResults([]);
      setSearchError(null);
      return;
    }
    const timeoutId = window.setTimeout(() => {
      void runPhraseSearch(trimmed, { showEmptyError: false });
    }, 220);
    return () => window.clearTimeout(timeoutId);
  }, [runPhraseSearch, searchLooksLikeNavigation, searchOpen, searchQuery]);

  // ── Draggable divider ─────────────────────────────────────────────────────────
  useEffect(() => {
    const divider = dividerRef.current;
    if (!divider) return;

    const beginDrag = (clientX: number) => {
      if (sidePanelModeRef.current === 'none') return;
      isDraggingRef.current   = true;
      dragStartXRef.current   = clientX;
      dragStartWidthRef.current = sidePaneRef.current?.offsetWidth ?? 0;
      setIsPaneTransitioning(false);
      divider.classList.add('dragging');
      document.body.classList.add('no-select');
    };
    const updateDrag = (clientX: number) => {
      if (!isDraggingRef.current) return;
      const delta    = clientX - dragStartXRef.current;
      const minWidth = Math.min(220, Math.max(160, Math.floor(window.innerWidth * 0.34)));
      const maxWidth = Math.max(minWidth + 20, Math.floor(window.innerWidth * 0.72));
      const direction = sidePanelPositionRef.current === 'right' ? -1 : 1;
      const next      = Math.max(minWidth, Math.min(maxWidth, dragStartWidthRef.current + (delta * direction)));
      setSidePaneWidth(`${next}px`);
    };
    const endDrag = () => {
      if (!isDraggingRef.current) return;
      isDraggingRef.current = false;
      divider.classList.remove('dragging');
      setIsPaneTransitioning(true);
      document.body.classList.remove('no-select');
    };

    const onMouseDown  = (e: MouseEvent)  => { e.preventDefault(); beginDrag(e.clientX); };
    const onMouseMove  = (e: MouseEvent)  => updateDrag(e.clientX);
    const onTouchStart = (e: TouchEvent)  => beginDrag(e.touches[0].clientX);
    const onTouchMove  = (e: TouchEvent)  => updateDrag(e.touches[0].clientX);

    divider.addEventListener('mousedown', onMouseDown);
    divider.addEventListener('touchstart', onTouchStart, { passive: true });
    document.addEventListener('mousemove', onMouseMove);
    document.addEventListener('touchmove', onTouchMove, { passive: true });
    document.addEventListener('mouseup', endDrag);
    document.addEventListener('touchend', endDrag);
    return () => {
      divider.removeEventListener('mousedown', onMouseDown);
      divider.removeEventListener('touchstart', onTouchStart);
      document.removeEventListener('mousemove', onMouseMove);
      document.removeEventListener('touchmove', onTouchMove);
      document.removeEventListener('mouseup', endDrag);
      document.removeEventListener('touchend', endDrag);
    };
  }, []);

  // ── Galaxy comet animation ────────────────────────────────────────────────────
  useEffect(() => {
    const canvas = cometCanvasRef.current;
    if (!canvas) return;

    const isGalaxyTheme = currentTheme === 'galaxy';
    const isPinkTheme = currentTheme === 'pink';

    if ((!isGalaxyTheme && !isPinkTheme) || readerSettings.reducedMotion) {
      if (cometRafRef.current !== null) {
        cancelAnimationFrame(cometRafRef.current);
        cometRafRef.current = null;
      }
      const ctx = canvas.getContext('2d');
      if (ctx) ctx.clearRect(0, 0, canvas.width, canvas.height);
      return;
    }

    const TOPBAR_H  = 56;
    const TASKBAR_H = 64;
    const GUTTER_W  = 52;

    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    let zones = getZones(window.innerWidth, window.innerHeight);
    let lastDrawAt = 0;

    function resize() {
      if (!canvas) return;
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
      zones = getZones(canvas.width, canvas.height);
    }
    resize();
    window.addEventListener('resize', resize);

    interface CometParticle {
      x: number; y: number;
      vx: number; vy: number;
      tail: Array<[number, number]>;
      maxTail: number;
      alpha: number;
      size: number;
      dead: boolean;
      respawnIn: number;
    }

    interface HeartParticle {
      x: number; y: number;
      vx: number; vy: number;
      tail: Array<[number, number]>;
      maxTail: number;
      alpha: number;
      size: number;
      dead: boolean;
      respawnIn: number;
      wobble: number;
      wobbleSpeed: number;
    }

    function getZones(w: number, h: number) {
      return [
        { x: 0,          y: 0,                    w,          h: TOPBAR_H,                          horizontal: true  },
        { x: 0,          y: h - TASKBAR_H,         w,          h: TASKBAR_H,                         horizontal: true  },
        { x: 0,          y: TOPBAR_H,              w: GUTTER_W, h: h - TOPBAR_H - TASKBAR_H,         horizontal: false },
        { x: w - GUTTER_W, y: TOPBAR_H,            w: GUTTER_W, h: h - TOPBAR_H - TASKBAR_H,        horizontal: false },
      ];
    }

    function spawnComet(w: number, h: number): CometParticle {
      const zones   = getZones(w, h);
      const weights = [3, 3, 1, 1];
      let r = Math.random() * 8;
      let zoneIdx = 0;
      for (let i = 0; i < weights.length; i++) {
        r -= weights[i];
        if (r <= 0) { zoneIdx = i; break; }
      }
      const zone  = zones[zoneIdx];
      const speed = 1.2 + Math.random() * 2.2;
      let x: number, y: number, vx: number, vy: number;

      if (zone.horizontal) {
        const fromLeft = Math.random() < 0.5;
        x  = fromLeft ? zone.x - 5 : zone.x + zone.w + 5;
        y  = zone.y + zone.h * 0.15 + Math.random() * zone.h * 0.7;
        vx = fromLeft ? speed : -speed;
        vy = (Math.random() - 0.5) * speed * 0.3;
      } else {
        const fromTop = Math.random() < 0.5;
        x  = zone.x + zone.w * 0.1 + Math.random() * zone.w * 0.8;
        y  = fromTop ? zone.y - 5 : zone.y + zone.h + 5;
        vx = (Math.random() - 0.5) * speed * 0.3;
        vy = fromTop ? speed : -speed;
      }

      return { x, y, vx, vy, tail: [], maxTail: Math.floor(20 + Math.random() * 25),
               alpha: 0.65 + Math.random() * 0.35, size: 1.2 + Math.random() * 1.4,
               dead: false, respawnIn: 0 };
    }

    function spawnHeart(w: number, h: number): HeartParticle {
      const zones   = getZones(w, h);
      const weights = [3, 3, 1, 1];
      let r = Math.random() * 8;
      let zoneIdx = 0;
      for (let i = 0; i < weights.length; i++) {
        r -= weights[i];
        if (r <= 0) { zoneIdx = i; break; }
      }
      const zone = zones[zoneIdx];
      const speed = 0.25 + Math.random() * 0.5;
      let x: number, y: number, vx: number, vy: number;

      if (zone.horizontal) {
        const fromLeft = Math.random() < 0.5;
        x  = fromLeft ? zone.x - 12 : zone.x + zone.w + 12;
        y  = zone.y + zone.h * 0.18 + Math.random() * zone.h * 0.64;
        vx = fromLeft ? speed : -speed;
        vy = (Math.random() - 0.5) * speed * 0.18;
      } else {
        const fromTop = Math.random() < 0.5;
        x  = zone.x + zone.w * 0.16 + Math.random() * zone.w * 0.68;
        y  = fromTop ? zone.y - 12 : zone.y + zone.h + 12;
        vx = (Math.random() - 0.5) * speed * 0.2;
        vy = fromTop ? speed : -speed;
      }

      return {
        x,
        y,
        vx,
        vy,
        tail: [],
        maxTail: Math.floor(5 + Math.random() * 5),
        alpha: 0.5 + Math.random() * 0.22,
        size: 10 + Math.random() * 8,
        dead: false,
        respawnIn: 0,
        wobble: Math.random() * Math.PI * 2,
        wobbleSpeed: 0.01 + Math.random() * 0.012,
      };
    }

    function drawHeart(
      ctx: CanvasRenderingContext2D,
      x: number,
      y: number,
      size: number,
      fillStyle: string,
    ) {
      ctx.beginPath();
      ctx.moveTo(x, y + size * 0.28);
      ctx.bezierCurveTo(x - size * 0.62, y - size * 0.22, x - size * 1.02, y + size * 0.5, x, y + size);
      ctx.bezierCurveTo(x + size * 1.02, y + size * 0.5, x + size * 0.62, y - size * 0.22, x, y + size * 0.28);
      ctx.closePath();
      ctx.fillStyle = fillStyle;
      ctx.fill();
    }

    // ── Nebula orbs — large soft blobs that drift slowly through allowed zones ──
    interface NebulaOrb {
      x: number; y: number;
      vx: number; vy: number;
      radius: number;
      r: number; g: number; b: number;
      baseAlpha: number;
      phase: number;       // breathing phase offset
      phaseSpeed: number;  // breathing speed
    }

    const NEBULA_COLORS: [number, number, number][] = [
      [155, 60, 255],  // violet
      [255, 195, 55],  // gold
      [60,  95, 240],  // indigo
      [255, 80, 185],  // magenta
      [55, 230, 215],  // teal
      [255, 140, 40],  // amber
    ];

    function spawnOrb(w: number, h: number): NebulaOrb {
      const zones = getZones(w, h);
      const zone  = zones[Math.floor(Math.random() * zones.length)];
      const [r, g, b] = NEBULA_COLORS[Math.floor(Math.random() * NEBULA_COLORS.length)];
      const speed = 0.06 + Math.random() * 0.16;
      const angle = Math.random() * Math.PI * 2;
      return {
        x: zone.x + Math.random() * zone.w,
        y: zone.y + Math.random() * zone.h,
        vx: Math.cos(angle) * speed,
        vy: Math.sin(angle) * speed,
        radius: 70 + Math.random() * 110,
        r, g, b,
        baseAlpha: 0.055 + Math.random() * 0.065,
        phase: Math.random() * Math.PI * 2,
        phaseSpeed: 0.008 + Math.random() * 0.012,
      };
    }

    const ORB_COUNT = 4;
    const orbs: NebulaOrb[] = isGalaxyTheme
      ? Array.from({ length: ORB_COUNT }, () => spawnOrb(canvas.width, canvas.height))
      : [];

    const COMET_COUNT = 8;
    const comets: CometParticle[] = isGalaxyTheme
      ? Array.from({ length: COMET_COUNT }, () => {
          const c = spawnComet(canvas.width, canvas.height);
          // stagger initial positions so they don't all start at zone edges
          const advance = Math.floor(Math.random() * 80);
          for (let f = 0; f < advance; f++) {
            c.tail.push([c.x, c.y]);
            if (c.tail.length > c.maxTail) c.tail.shift();
            c.x += c.vx; c.y += c.vy;
          }
          return c;
        })
      : [];

    const HEART_COUNT = 10;
    const hearts: HeartParticle[] = isPinkTheme
      ? Array.from({ length: HEART_COUNT }, () => {
          const heart = spawnHeart(canvas.width, canvas.height);
          const advance = Math.floor(Math.random() * 55);
          for (let f = 0; f < advance; f++) {
            heart.tail.push([heart.x, heart.y]);
            if (heart.tail.length > heart.maxTail) heart.tail.shift();
            heart.wobble += heart.wobbleSpeed;
            heart.x += heart.vx + Math.sin(heart.wobble) * 0.16;
            heart.y += heart.vy + Math.cos(heart.wobble * 0.8) * 0.08;
          }
          return heart;
        })
      : [];

    function draw(now: number) {
      if (!canvas) return;
      const w = canvas.width;
      const h = canvas.height;
      const scrollActive = scrollEffectsDowngradedRef.current;

      if (scrollActive && now - lastDrawAt < 32) {
        cometRafRef.current = requestAnimationFrame(draw);
        return;
      }
      lastDrawAt = now;

      ctx!.clearRect(0, 0, w, h);

      ctx!.save();
      ctx!.beginPath();
      for (const z of zones) ctx!.rect(z.x, z.y, z.w, z.h);
      ctx!.clip();

      // ── Nebula orbs (drawn first, behind comets) ─────────────────────────────
      if (isGalaxyTheme) {
        const orbLimit = scrollActive ? Math.min(2, orbs.length) : orbs.length;
        for (let i = 0; i < orbLimit; i++) {
        const o = orbs[i];
        o.phase += o.phaseSpeed;
        const breathe = 0.65 + 0.35 * Math.sin(o.phase);
        const a = o.baseAlpha * breathe;

        const grd = ctx!.createRadialGradient(o.x, o.y, 0, o.x, o.y, o.radius);
        grd.addColorStop(0,    `rgba(${o.r}, ${o.g}, ${o.b}, ${(a * 1.6).toFixed(3)})`);
        grd.addColorStop(0.45, `rgba(${o.r}, ${o.g}, ${o.b}, ${(a * 0.8).toFixed(3)})`);
        grd.addColorStop(1,    `rgba(${o.r}, ${o.g}, ${o.b}, 0)`);
        ctx!.beginPath();
        ctx!.arc(o.x, o.y, o.radius, 0, Math.PI * 2);
        ctx!.fillStyle = grd;
        ctx!.fill();

        o.x += o.vx;
        o.y += o.vy;

        // Gently nudge velocity to keep orbs in their zone
        const inAnyZone = zones.some(z =>
          o.x >= z.x && o.x <= z.x + z.w && o.y >= z.y && o.y <= z.y + z.h,
        );
        if (!inAnyZone) {
          // Drift back toward nearest zone center
          const nearest = zones.reduce((best, z) => {
            const cx = z.x + z.w / 2, cy = z.y + z.h / 2;
            const d2 = (o.x - cx) ** 2 + (o.y - cy) ** 2;
            return d2 < best.d2 ? { d2, cx, cy } : best;
          }, { d2: Infinity, cx: 0, cy: 0 });
          o.vx += (nearest.cx - o.x) * 0.0002;
            o.vy += (nearest.cy - o.y) * 0.0002;
          }
        }

        const cometLimit = scrollActive ? Math.max(3, Math.ceil(comets.length * 0.5)) : comets.length;
        for (let i = 0; i < cometLimit; i++) {
          const c = comets[i];

          if (c.dead) {
            c.respawnIn--;
            if (c.respawnIn <= 0) comets[i] = spawnComet(w, h);
            continue;
          }

          c.tail.push([c.x, c.y]);
          if (c.tail.length > c.maxTail) c.tail.shift();

        // tail: fading, tapering line segments from base → head
          for (let j = 1; j < c.tail.length; j++) {
            const t  = j / c.tail.length; // 0 = oldest, 1 = near-head
            const [px, py] = c.tail[j - 1];
            const [cx, cy] = c.tail[j];
            ctx!.beginPath();
            ctx!.moveTo(px, py);
            ctx!.lineTo(cx, cy);
            ctx!.strokeStyle = `rgba(255, 210, 60, ${c.alpha * t * 0.85})`;
            ctx!.lineWidth   = Math.max(0.3, c.size * t * 1.4);
            ctx!.lineCap     = 'round';
            ctx!.stroke();
          }

        // outer glow
          const grd = ctx!.createRadialGradient(c.x, c.y, 0, c.x, c.y, c.size * 5);
          grd.addColorStop(0,    `rgba(255, 248, 180, ${c.alpha})`);
          grd.addColorStop(0.35, `rgba(255, 210, 60,  ${c.alpha * 0.6})`);
          grd.addColorStop(0.7,  `rgba(200, 150, 0,   ${c.alpha * 0.2})`);
          grd.addColorStop(1,    'rgba(180, 120, 0, 0)');
          ctx!.beginPath();
          ctx!.arc(c.x, c.y, c.size * 5, 0, Math.PI * 2);
          ctx!.fillStyle = grd;
          ctx!.fill();

        // bright core
          ctx!.beginPath();
          ctx!.arc(c.x, c.y, c.size, 0, Math.PI * 2);
          ctx!.fillStyle = `rgba(255, 255, 230, ${c.alpha})`;
          ctx!.fill();

          c.x += c.vx;
          c.y += c.vy;

          const BUFFER = 80;
          const alive  = zones.some(z =>
            c.x >= z.x - BUFFER && c.x <= z.x + z.w + BUFFER &&
            c.y >= z.y - BUFFER && c.y <= z.y + z.h + BUFFER,
          );
          if (!alive) { c.dead = true; c.respawnIn = Math.floor(20 + Math.random() * 60); }
        }
      }

      if (isPinkTheme) {
        const heartLimit = scrollActive ? Math.max(4, Math.ceil(hearts.length * 0.5)) : hearts.length;
        for (let i = 0; i < heartLimit; i++) {
          const heart = hearts[i];

          if (heart.dead) {
            heart.respawnIn--;
            if (heart.respawnIn <= 0) hearts[i] = spawnHeart(w, h);
            continue;
          }

          const glow = ctx!.createRadialGradient(
            heart.x,
            heart.y + heart.size * 0.45,
            0,
            heart.x,
            heart.y + heart.size * 0.45,
            heart.size * 2.3,
          );
          glow.addColorStop(0, `rgba(255, 228, 240, ${heart.alpha * 0.55})`);
          glow.addColorStop(0.45, `rgba(255, 170, 205, ${heart.alpha * 0.24})`);
          glow.addColorStop(1, 'rgba(255, 150, 195, 0)');
          ctx!.beginPath();
          ctx!.arc(heart.x, heart.y + heart.size * 0.45, heart.size * 2.3, 0, Math.PI * 2);
          ctx!.fillStyle = glow;
          ctx!.fill();

          drawHeart(ctx!, heart.x, heart.y, heart.size, `rgba(255, 188, 216, ${heart.alpha})`);
          drawHeart(ctx!, heart.x, heart.y, heart.size * 0.62, `rgba(255, 238, 244, ${heart.alpha * 0.72})`);

          heart.wobble += heart.wobbleSpeed;
          heart.x += heart.vx + Math.sin(heart.wobble) * 0.16;
          heart.y += heart.vy + Math.cos(heart.wobble * 0.8) * 0.08;

          const BUFFER = 54;
          const alive = zones.some(z =>
            heart.x >= z.x - BUFFER && heart.x <= z.x + z.w + BUFFER &&
            heart.y >= z.y - BUFFER && heart.y <= z.y + z.h + BUFFER,
          );
          if (!alive) {
            heart.dead = true;
            heart.respawnIn = Math.floor(16 + Math.random() * 44);
          }
        }
      }

      ctx!.restore();
      cometRafRef.current = requestAnimationFrame(draw);
    }

    cometRafRef.current = requestAnimationFrame(draw);

    return () => {
      if (cometRafRef.current !== null) {
        cancelAnimationFrame(cometRafRef.current);
        cometRafRef.current = null;
      }
      window.removeEventListener('resize', resize);
      if (ctx) ctx.clearRect(0, 0, canvas.width, canvas.height);
    };
  }, [currentTheme, readerSettings.reducedMotion]);

  // ── Theme management ──────────────────────────────────────────────────────────
  const stopDynamicTheme = useCallback(() => {
    if (dynTimerRef.current) { clearTimeout(dynTimerRef.current); dynTimerRef.current = null; }
    if (dynRafRef.current)   { cancelAnimationFrame(dynRafRef.current); dynRafRef.current = null; }
    if (dynTintRef.current)  dynTintRef.current.style.backgroundColor = 'transparent';
    document.documentElement.removeAttribute('data-dynamic-wave');
  }, []);

  const runDynamicRgbStrip = useCallback(() => {
    if (currentThemeRef.current !== 'dynamic' || readerSettings.reducedMotion) return;
    const nextHex = DYNAMIC_COLORS[dynIndexRef.current % DYNAMIC_COLORS.length];
    dynIndexRef.current++;
    const { r, g, b } = hexToRgb(nextHex);
    const t0 = performance.now();
    const frame = (now: number) => {
      if (currentThemeRef.current !== 'dynamic') return;
      const u = Math.min((now - t0) / DYNAMIC_CYCLE_MS, 1);
      const a = u <= 0.5 ? u * 2 : (1 - u) * 2;
      if (dynTintRef.current) dynTintRef.current.style.backgroundColor = `rgba(${r},${g},${b},${a})`;
      if (u < 1) {
        dynRafRef.current = requestAnimationFrame(frame);
      } else {
        dynRafRef.current = null;
        if (dynTintRef.current) dynTintRef.current.style.backgroundColor = 'transparent';
        dynTimerRef.current = setTimeout(runDynamicRgbStrip, 0);
      }
    };
    dynRafRef.current = requestAnimationFrame(frame);
  }, []);

  const startDynamicTheme = useCallback(() => {
    if (readerSettings.reducedMotion) {
      document.documentElement.removeAttribute('data-dynamic-wave');
      document.documentElement.setAttribute('data-theme', DYNAMIC_BASE_THEME);
      return;
    }
    dynIndexRef.current = 0;
    document.documentElement.setAttribute('data-theme', DYNAMIC_BASE_THEME);
    dynTimerRef.current = setTimeout(runDynamicRgbStrip, 0);
  }, [readerSettings.reducedMotion, runDynamicRgbStrip]);

  const applyTheme = useCallback((id: string) => {
    if (id !== 'dynamic') stopDynamicTheme();
    setCurrentTheme(id);
    localStorage.setItem('theme', id);
    if (id === 'dynamic') {
      document.documentElement.setAttribute('data-dynamic-wave', '1');
      startDynamicTheme();
    } else {
      document.documentElement.removeAttribute('data-dynamic-wave');
      document.documentElement.setAttribute('data-theme', id);
    }
  }, [stopDynamicTheme, startDynamicTheme]);

  // ── Init ──────────────────────────────────────────────────────────────────────
  useEffect(() => {
    // Read theme from localStorage (inline script already applied it to the DOM)
    const saved = normalizeThemeId(localStorage.getItem('theme'));
    const storedSession = restoreAuthSession();
    const storedLastPosition = safelyParseJson<{ book?: string; chapter?: number; translation?: string } | null>(
      localStorage.getItem(LAST_POSITION_STORAGE_KEY),
      null,
    );
    const storedHighlights = safelyParseJson<string[]>(localStorage.getItem(HIGHLIGHTS_STORAGE_KEY), []);
    const storedBookmarks = safelyParseJson<string[]>(localStorage.getItem(BOOKMARKS_STORAGE_KEY), []);
    const storedNotes = safelyParseJson<Record<string, VerseNote>>(localStorage.getItem(NOTES_STORAGE_KEY), {});
    const storedRecent = safelyParseJson<SavedPassage[]>(localStorage.getItem(RECENT_PASSAGES_STORAGE_KEY), []);
    const storedProgress = normalizeReadingProgress(
      safelyParseJson<unknown>(localStorage.getItem(READING_PROGRESS_STORAGE_KEY), null),
    );
    const storedDailyGoal = normalizeDailyGoalChapters(localStorage.getItem(DAILY_GOAL_CHAPTERS_STORAGE_KEY));
    const storedReaderSettings = normalizeReaderSettings(
      safelyParseJson<Partial<ReaderSettings> | null>(localStorage.getItem(READER_SETTINGS_STORAGE_KEY), null),
    );
    setCurrentTheme(saved);
    localStorage.setItem('theme', saved);
    setAuthSession(storedSession);
    setHighlightedVerses(storedHighlights);
    setBookmarkedVerses(storedBookmarks);
    setVerseNotes(storedNotes);
    setRecentPassages(storedRecent);
    setReadingProgress(rollReadingProgressToToday(storedProgress));
    setDailyGoalChapters(storedDailyGoal);
    setReaderSettings(storedReaderSettings);
    setShowOnboarding(localStorage.getItem(ONBOARDING_STORAGE_KEY) !== '1');
    if (saved === 'dynamic' && !storedReaderSettings.reducedMotion) startDynamicTheme();
    else {
      document.documentElement.removeAttribute('data-dynamic-wave');
      document.documentElement.setAttribute('data-theme', saved === 'dynamic' ? DYNAMIC_BASE_THEME : saved);
    }

    async function init() {
      try {
        const [booksData, translationsData, sourcesData] = await Promise.all([
          fetch('/api/v1/books').then(r => r.json()) as Promise<BookInfo[]>,
          fetch('/api/v1/translations').then(r => r.json()).catch(() => [{ id: 'WEB', name: 'World English Bible' }]) as Promise<Translation[]>,
          fetch('/api/v1/commentary/sources').then(r => r.json()).catch(() => []) as Promise<CommentarySource[]>,
        ]);
        setBooks(booksData);
        setTranslations(translationsData);
        if (sourcesData.length) {
          setCommentarySources(sourcesData);
          setCommentarySourceNames(prev => {
            const next = { ...prev };
            sourcesData.forEach(s => { next[s.id] = s.name; });
            return next;
          });
        }
        const initialTranslation = storedLastPosition?.translation ?? 'WEB';
        const initialBook = booksData.find(b => b.name.toLowerCase() === storedLastPosition?.book?.toLowerCase())
          ?? booksData.find(b => b.book_number === 1)
          ?? booksData[0]
          ?? null;
        const initialChapter = storedLastPosition?.chapter && storedLastPosition.chapter > 0
          ? storedLastPosition.chapter
          : 1;
        setTranslation(initialTranslation);
        setCurrentBook(initialBook);
        if (initialBook) {
          loadChapter(initialBook, Math.min(initialChapter, initialBook.total_chapters), initialTranslation);
          if (storedReaderSettings.defaultPanel !== 'none') {
            setSidePanelMode(storedReaderSettings.defaultPanel);
          }
        } else {
          setChapterLoading(false);
          setChapterError(true);
        }
      } catch {
        setChapterLoading(false);
        setChapterError(true);
      }
    }
    init();
    return () => stopDynamicTheme();
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    if (!authSession || books.length === 0 || accountBootstrapRef.current) return;
    accountBootstrapRef.current = true;
    let cancelled = false;
    (async () => {
      try {
        const refreshed = await refreshSession(authSession);
        if (cancelled) return;
        persistAuthSession(refreshed);
        setAuthSession(refreshed);
        await syncAccountState(refreshed);
      } catch {
        if (cancelled) return;
        persistAuthSession(null);
        setAuthSession(null);
        setAccountProfile(null);
        accountBootstrapRef.current = false;
      }
    })();
    return () => {
      cancelled = true;
    };
  }, [authSession, books.length, syncAccountState]);

  useEffect(() => {
    if (!authSession || !syncReadyRef.current || hydratingAccountRef.current || books.length === 0) return;
    const timer = window.setTimeout(() => {
      void putStudyItems(authSession, buildSyncedStudyItems()).catch(() => {
        /* ignore background sync errors */
      });
    }, 600);
    return () => clearTimeout(timer);
  }, [
    authSession,
    books.length,
    buildSyncedStudyItems,
    bookmarkedVerses,
    highlightedVerses,
    verseNotes,
  ]);

  useEffect(() => {
    if (!authSession || !syncReadyRef.current || hydratingAccountRef.current || books.length === 0) return;
    const timer = window.setTimeout(() => {
      void putReadingProgress(authSession, buildSyncedReadingProgress()).catch(() => {
        /* ignore background sync errors */
      });
    }, 600);
    return () => clearTimeout(timer);
  }, [authSession, books.length, buildSyncedReadingProgress, chapter, currentBook, selectedVerse, translation]);

  useEffect(() => {
    if (!authSession || !syncReadyRef.current || hydratingAccountRef.current) return;
    const timer = window.setTimeout(() => {
      void putUserSettings(authSession, buildSyncedUserSettings()).catch(() => {
        /* ignore background sync errors */
      });
    }, 600);
    return () => clearTimeout(timer);
  }, [authSession, buildSyncedUserSettings, currentTheme, readerSettings, recentPassages]);

  // ── Version popup positioning ─────────────────────────────────────────────────
  const openVersionPopup = useCallback(() => {
    setSearchOpen(false);
    const rect = versionBtnRef.current?.getBoundingClientRect();
    setVersionPanelLeft(Math.max(12, rect?.left ?? 20));
    setVersionPopupOpen(true);
  }, []);

  // ── Render helpers ────────────────────────────────────────────────────────────
  const renderChapterContent = () => {
    if (chapterLoading) {
      return (
        <div className="state-msg">
          <span className="spinner" />
          <div>Loading chapter...</div>
        </div>
      );
    }
    if (chapterError || !chapterData) {
      return <div className="state-msg">Could not load this chapter.</div>;
    }
    const isBookMode = readerSettings.readingMode === 'book';
    const [leftPageVerses, rightPageVerses] = splitVersesForBookMode(chapterData.verses);
    const renderVerse = (v: VerseData) => {
      const inAiNav =
        aiNavHighlight != null && v.verse >= aiNavHighlight.start && v.verse <= aiNavHighlight.end;
      const verseKey = verseStorageKey(chapterData.book, chapterData.chapter, v.verse);
      const isHighlighted = highlightedVerses.includes(verseKey);
      const isBookmarked = bookmarkedVerses.includes(verseKey);
      const hasNote = Boolean(verseNotes[verseKey]);
      return (
        <span
          key={v.verse}
          className={`verse-line${inAiNav ? ' verse-line--ai-nav' : ''}${selectedVerseGroup.includes(v.verse) ? ' verse-line--selected' : ''}${isHighlighted ? ' verse-line--highlighted' : ''}${isBookmarked ? ' verse-line--bookmarked' : ''}${hasNote ? ' verse-line--noted' : ''}`}
          data-verse={v.verse}
          onClick={(e) => {
            topVisibleVerseRef.current = v.verse;
            recordChapterEngagement(chapterData.book, chapterData.chapter, translation, v.verse, chapterData.verses.length);
            if (selectedVerse !== null && v.verse !== selectedVerse) {
              setSelectedVerseGroup(prev =>
                prev.includes(v.verse)
                  ? prev.filter(n => n !== v.verse)
                  : [...prev, v.verse].sort((a, b) => a - b)
              );
              return;
            }
            const isDeselecting = selectedVerse === v.verse;
            if (isDeselecting) {
              setSelectedVerse(null);
              setSelectedVerseGroup([]);
              setVersePopupPos(null);
            } else {
              const rect = (e.currentTarget as HTMLElement).getBoundingClientRect();
              const popupWidth = 268;
              const margin = 14;
              let left = rect.right + margin;
              if (left + popupWidth > window.innerWidth - 8) {
                left = Math.max(8, rect.left - popupWidth - margin);
              }
              const top = Math.min(rect.top, window.innerHeight - 60);
              setSelectedVerse(v.verse);
              setSelectedVerseGroup([v.verse]);
              setVersePopupPos({ top, left });
            }
            setShowVerseNoteEditor(false);
          }}
        >
          <sup className="vnum">{v.verse}</sup>{v.text}{' '}
        </span>
      );
    };
    return (
      <>
      <div
        className={`reader-page-transition${isBookMode ? ' reader-page-transition--book' : ''}${animClass ? ` ${animClass}` : ''}`}
        onAnimationEnd={() => {
          if (animClass.includes('exit')) {
            exitAnimDoneRef.current = true;
            const pending = pendingFlipDataRef.current;
            if (pending) {
              pendingFlipDataRef.current = null;
              setChapterData(pending.data);
              setAnimClass(pending.direction === 'next' ? 'page-flip-enter-next' : 'page-flip-enter-prev');
              if (biblePaneRef.current) biblePaneRef.current.scrollTop = 0;
              setChromeVisible(true);
              if (sidePanelModeRef.current === 'commentary') {
                loadCommentaryData(currentBookRef.current!, chapterRef.current, commentarySourceRef.current);
              }
            } else {
              // Data not ready yet — show loading spinner until it arrives
              setAnimClass('');
              setChapterLoading(true);
            }
          } else {
            setAnimClass('');
          }
        }}
      >
        {false && (
          <section className="reader-dashboard">
          <div className="reader-dashboard-card">
            <div className="reader-dashboard-label">Study rhythm</div>
            <div className="reader-dashboard-title">{readingRhythmTitle}</div>
            <div className="reader-dashboard-metrics">
              <span className="reader-pill">{readingProgress.streak} day streak</span>
              <span className="reader-pill">{recentPassages.length} recent passages</span>
              <span className="reader-pill">{savedVerseCount} saved study items</span>
            </div>
          </div>
          <div className="reader-dashboard-card">
            <div className="reader-dashboard-label">Current context</div>
            <div className="reader-dashboard-metrics">
              <span className="reader-pill">{translation}</span>
              <span className="reader-pill">{commentarySourceNames[commentarySource] ?? commentarySource}</span>
              <span className="reader-pill">{sidePanelMode === 'none' ? 'Reader focus' : `Open: ${sidePanelMode === 'ai' ? 'AI' : 'Commentary'}`}</span>
            </div>
            {recentPassages.length > 0 && (
              <div className="reader-recent-row">
                {recentPassages.slice(0, 3).map(entry => (
                  <button
                    key={`${entry.book}-${entry.chapter}-${entry.translation}`}
                    className="reader-recent-btn"
                    type="button"
                    onClick={() => navigateToPassage(entry.book, entry.chapter, entry.translation)}
                  >
                    {entry.book} {entry.chapter}
                  </button>
                ))}
              </div>
            )}
          </div>
          </section>
        )}
        {false && showOnboarding && (
          <section className="reader-onboarding">
            <div className="reader-dashboard-label">Welcome</div>
            <div className="reader-dashboard-title">Read, open commentary, or ask AI from the same workspace.</div>
            <p className="reader-onboarding-copy">
              Tap any verse to highlight it, bookmark it, or add a note. Use Search to jump straight to a passage or find a phrase.
            </p>
            <div className="reader-onboarding-actions">
              <button
                className="reader-onboarding-btn"
                type="button"
                onClick={() => {
                  setShowOnboarding(false);
                  localStorage.setItem(ONBOARDING_STORAGE_KEY, '1');
                }}
              >
                Start reading
              </button>
              <button
                className="reader-onboarding-btn secondary"
                type="button"
                onClick={() => {
                  openSidePanel('ai');
                  setShowOnboarding(false);
                  localStorage.setItem(ONBOARDING_STORAGE_KEY, '1');
                }}
              >
                Show me AI
              </button>
            </div>
          </section>
        )}
        <div className="reader-book">{chapterData.book}</div>
        <div className="reader-chapter">{chapterData.chapter}</div>
        {isBookMode ? (
          <div className="reader-book-spread" ref={readerPassagesRef}>
            <section className="reader-book-page reader-book-page--left" aria-label="Left page">
              <div className="reader-passages reader-passages--book">
                {leftPageVerses.map(renderVerse)}
              </div>
            </section>
            <section className="reader-book-page reader-book-page--right" aria-label="Right page">
              <div className="reader-passages reader-passages--book">
                {rightPageVerses.map(renderVerse)}
              </div>
            </section>
          </div>
        ) : (
          <div className="reader-passages" ref={readerPassagesRef}>
          {chapterData.verses.map(v => {
            const inAiNav =
              aiNavHighlight != null && v.verse >= aiNavHighlight.start && v.verse <= aiNavHighlight.end;
            const verseKey = verseStorageKey(chapterData.book, chapterData.chapter, v.verse);
            const isHighlighted = highlightedVerses.includes(verseKey);
            const isBookmarked = bookmarkedVerses.includes(verseKey);
            const hasNote = Boolean(verseNotes[verseKey]);
            return (
              <span
                key={v.verse}
                className={`verse-line${inAiNav ? ' verse-line--ai-nav' : ''}${selectedVerseGroup.includes(v.verse) ? ' verse-line--selected' : ''}${isHighlighted ? ' verse-line--highlighted' : ''}${isBookmarked ? ' verse-line--bookmarked' : ''}${hasNote ? ' verse-line--noted' : ''}`}
                data-verse={v.verse}
                onClick={(e) => {
                  topVisibleVerseRef.current = v.verse;
                  recordChapterEngagement(chapterData.book, chapterData.chapter, translation, v.verse, chapterData.verses.length);
                  // Popup open + clicking a different verse → add/remove from group
                  if (selectedVerse !== null && v.verse !== selectedVerse) {
                    setSelectedVerseGroup(prev =>
                      prev.includes(v.verse)
                        ? prev.filter(n => n !== v.verse)
                        : [...prev, v.verse].sort((a, b) => a - b)
                    );
                    return;
                  }
                  // Clicking anchor verse again → close popup
                  const isDeselecting = selectedVerse === v.verse;
                  if (isDeselecting) {
                    setSelectedVerse(null);
                    setSelectedVerseGroup([]);
                    setVersePopupPos(null);
                  } else {
                    const rect = (e.currentTarget as HTMLElement).getBoundingClientRect();
                    const popupWidth = 268;
                    const margin = 14;
                    let left = rect.right + margin;
                    if (left + popupWidth > window.innerWidth - 8) {
                      left = Math.max(8, rect.left - popupWidth - margin);
                    }
                    const top = Math.min(rect.top, window.innerHeight - 60);
                    setSelectedVerse(v.verse);
                    setSelectedVerseGroup([v.verse]);
                    setVersePopupPos({ top, left });
                  }
                  setShowVerseNoteEditor(false);
                }}
              >
                <sup className="vnum">{v.verse}</sup>{v.text}{' '}
              </span>
            );
          })}
          </div>
        )}
        <div className="reader-chapter-next-row">
          <button
            className="reader-next-chapter-btn"
            type="button"
            aria-label="Next chapter"
            disabled={!currentBook || !!isLastChapter()}
            onClick={goNext}
          >
            Next Chapter
          </button>
        </div>
      </div>
      {selectedVerseData && currentBook && versePopupPos && (
        <section
          className="verse-study-card verse-study-popup"
          style={{ top: versePopupPos.top, left: versePopupPos.left }}
        >
          <div className="verse-study-header">
            <div>
              <div className="reader-dashboard-label">
                {selectedVerseGroup.length > 1 ? `${selectedVerseGroup.length} verses` : 'Selected verse'}
              </div>
              <div className="verse-study-title">
                {formatVerseGroupRef(currentBook.name, chapter, selectedVerseGroup)}
              </div>
            </div>
            <button className="verse-study-close" type="button" aria-label="Close" onClick={closeVerseStudyPopup}>
              <svg viewBox="0 0 24 24" aria-hidden="true">
                <path d="M6 6l12 12M18 6 6 18" />
              </svg>
            </button>
          </div>
          <div className="verse-study-actions">
            <div className="verse-highlight-row">
              <button className={`verse-action-btn${selectedVerseHighlighted ? ' active' : ''}`} type="button" onClick={toggleVerseHighlight}>
                <span className="verse-action-icon verse-action-icon--fill" aria-hidden="true">
                  <svg viewBox="0 0 24 24">
                    <path d="M19 21 12 16.89 5 21V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16Z" />
                  </svg>
                </span>
                Highlight
              </button>
              <div className="verse-color-strip" role="group" aria-label="Highlight color">
                {(['yellow', 'amber', 'green', 'blue', 'pink'] as const).map(colorId => (
                  <button
                    key={colorId}
                    type="button"
                    aria-label={colorId}
                    className={`verse-color-dot${readerSettings.highlightColor === colorId ? ' active' : ''}`}
                    style={{ background: READER_HIGHLIGHT_PRESETS[colorId].light }}
                    onClick={() => setReaderSettings(prev => ({ ...prev, highlightColor: colorId }))}
                  />
                ))}
              </div>
            </div>
            <button className="verse-action-btn" type="button" onClick={copySelectedVerse}>
              <span className="verse-action-icon" aria-hidden="true">
                <svg viewBox="0 0 24 24">
                  <path d="M4 12v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8" />
                  <path d="m16 6-4-4-4 4" />
                  <path d="M12 2v15" />
                </svg>
              </span>
              Share
            </button>
            <button className="verse-action-btn" type="button" onClick={() => openSidePanel('commentary')}>
              <span className="verse-action-icon" aria-hidden="true">
                <svg viewBox="0 0 24 24">
                  <path d="M6 7.5h9" /><path d="M6 11h12" /><path d="M6 14.5h8" />
                  <path d="M5 4.5h14a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H12l-4.5 3v-3H5a2 2 0 0 1-2-2v-8a2 2 0 0 1 2-2Z" />
                </svg>
              </span>
              Commentary
            </button>
            <button
              className="verse-action-btn"
              type="button"
              onClick={() => {
                openSidePanel('ai');
                const sorted = [...selectedVerseGroup].sort((a, b) => a - b);
                const verseTexts = sorted
                  .map(vn => chapterData?.verses.find(v => v.verse === vn))
                  .filter(Boolean)
                  .map(v => v!.text)
                  .join(' ');
                const ref = formatVerseGroupRef(currentBook.name, chapter, sorted);
                setAiComposerSeed({ id: Date.now(), text: buildExplainVersePrompt(ref, verseTexts) });
              }}
            >
              <span className="verse-action-icon verse-action-icon--taskbar" aria-hidden="true">
                <svg viewBox="0 0 24 24">
                  <path d="M12 3.5 13.9 8l4.6 1.9-4.6 1.9-1.9 4.7-1.9-4.7L5.5 9.9 10.1 8 12 3.5Z" className="icon-solid" />
                  <path d="M18 14.5 18.9 16.6 21 17.5l-2.1.9-.9 2.1-.9-2.1-2.1-.9 2.1-.9.9-2.1Z" className="icon-solid" />
                  <path d="M6.5 15.5 7.2 17l1.5.7-1.5.7-.7 1.6-.7-1.6-1.6-.7 1.6-.7.7-1.5Z" className="icon-solid" />
                </svg>
              </span>
              Ask AI
            </button>
          </div>
          {(showVerseNoteEditor || selectedVerseHighlighted || selectedVerseNote) && (
            <div className="verse-note-editor">
              <textarea
                className="verse-note-input"
                value={currentNoteDraft}
                rows={3}
                placeholder="Add a note (optional)..."
                onChange={event => setCurrentNoteDraft(event.target.value)}
              />
              <div className="verse-note-actions">
                <button className="verse-action-btn active" type="button" onClick={saveVerseNote}>Save</button>
                {selectedVerseNote && (
                  <button className="verse-action-btn" type="button" onClick={() => { setCurrentNoteDraft(''); setVerseNotes(prev => { const next = { ...prev }; if (selectedVerseKey) delete next[selectedVerseKey]; return next; }); }}>
                    Remove note
                  </button>
                )}
              </div>
            </div>
          )}
        </section>
      )}
    </>
    );
  };

  const renderCommentaryContent = () => {
    if (commentaryLoading) {
      return (
        <div className="state-msg">
          <span className="spinner" />
          <div>Loading commentary...</div>
        </div>
      );
    }
    if (commentaryError) return <div className="state-msg">Commentary unavailable.</div>;
    if (!commentaryEntries.length) return <div className="state-msg">No commentary for this chapter.</div>;

    if (commentarySource === 'summary') {
      return commentaryEntries.map((entry, i) => {
        const start = Number(entry.verse_start);
        const end   = entry.verse_end == null ? start : Number(entry.verse_end);
        const p     = parseSummaryContent(entry.content);
        const isSynced = syncedVerseStart === entry.verse_start;
        return (
          <section
            key={i}
            className={`commentary-entry${isSynced ? ' synced' : ''}`}
            data-verse-start={start}
            data-verse-end={end}
          >
            {p.title  && <div className="summary-chapter-title">{p.title}</div>}
            {p.summary && <div className="summary-text">{p.summary}</div>}
            {p.themes.length > 0 && (
              <div className="summary-section">
                <div className="summary-section-label">Themes</div>
                <div className="summary-tags">{p.themes.map((t, j) => <span key={j} className="summary-tag">{t}</span>)}</div>
              </div>
            )}
            {p.people.length > 0 && (
              <div className="summary-section">
                <div className="summary-section-label">Key People</div>
                <div className="summary-tags">{p.people.map((t, j) => <span key={j} className="summary-tag">{t}</span>)}</div>
              </div>
            )}
            {p.points.length > 0 && (
              <div className="summary-section">
                <div className="summary-section-label">Key Points</div>
                <ul className="summary-points">{p.points.map((pt, j) => <li key={j}>{pt}</li>)}</ul>
              </div>
            )}
            {p.verses.length > 0 && (
              <div className="summary-section">
                <div className="summary-section-label">Supporting Verses</div>
                <div className="summary-tags">{p.verses.map((v, j) => <span key={j} className="summary-tag">{v}</span>)}</div>
              </div>
            )}
          </section>
        );
      });
    }

    // Standard (Matthew Henry style) commentary
    return commentaryEntries.map((entry, i) => {
      const start   = Number(entry.verse_start);
      const end     = entry.verse_end == null ? start : Number(entry.verse_end);
      const label   = end > start ? `Verses ${start}–${end}` : `Verse ${start}`;
      const isSynced = syncedVerseStart === entry.verse_start;
      return (
        <section
          key={i}
          className={`commentary-entry${isSynced ? ' synced' : ''}`}
          data-verse-start={start}
          data-verse-end={end}
        >
          <div className="commentary-label">{label}</div>
          <div className="commentary-text">{entry.content}</div>
        </section>
      );
    });
  };

  const sidePanelTitle = () => {
    if (sidePanelMode === 'commentary')  return commentarySourceNames[commentarySource] ?? commentarySource;
    if (sidePanelMode === 'study') return 'My Stuff';
    return 'Bible Companion';
  };
  const sidePanelContext = currentBook ? `${currentBook.name} ${chapter} • ${translation}` : '';
  const navLabel = currentBook ? `${currentBook.name} ${chapter}` : 'Select Book';

  const sideOpen = sidePanelMode !== 'none';
  const sidePaneOnRight = readerSettings.sidePanelPosition === 'right';
  const selectedVerseHighlighted = selectedVerseKey ? highlightedVerses.includes(selectedVerseKey) : false;
  const selectedVerseBookmarked = selectedVerseKey ? bookmarkedVerses.includes(selectedVerseKey) : false;
  const availableCommentarySources = commentarySources.length > 0
    ? commentarySources
    : [
        { id: 'matthew_henry', name: 'Matthew Henry Commentary' },
        { id: 'summary', name: 'Chapter Summaries' },
      ];

  const renderStudyContent = () => {
    const highlightEntries = [...highlightedVerses]
      .map(key => {
        const [book, chStr, vStr] = key.split('::');
        const ch = Number(chStr);
        const verse = Number(vStr);
        const verseText = (() => {
          if (currentBook?.name.toLowerCase() === book && chapter === ch) {
            return chapterData?.verses.find(v => v.verse === verse)?.text ?? '';
          }
          return '';
        })();
        return { key, book, chapter: ch, verse, verseText };
      })
      .sort((a, b) => a.book.localeCompare(b.book) || a.chapter - b.chapter || a.verse - b.verse);

    type SavedEntry = {
      key: string;
      book: string;
      chapter: number;
      verse: number;
      verseText: string;
      noteText: string;
    };

    const savedByKey = new Map<string, SavedEntry>();

    for (const entry of highlightEntries) {
      savedByKey.set(entry.key, {
        key: entry.key,
        book: entry.book,
        chapter: entry.chapter,
        verse: entry.verse,
        verseText: entry.verseText,
        noteText: '',
      });
    }
    for (const note of Object.values(verseNotes)) {
      const existing = savedByKey.get(note.key);
      if (existing) {
        existing.noteText = note.text;
        if (!existing.verseText) {
          const [b, chStr, vStr] = note.key.split('::');
          const ch = Number(chStr);
          const v = Number(vStr);
          if (currentBook?.name.toLowerCase() === b && chapter === ch) {
            existing.verseText = chapterData?.verses.find(x => x.verse === v)?.text ?? '';
          }
        }
      } else {
        const [b, chStr, vStr] = note.key.split('::');
        const ch = Number(chStr);
        const v = Number(vStr);
        const verseText = (() => {
          if (currentBook?.name.toLowerCase() === b && chapter === ch) {
            return chapterData?.verses.find(x => x.verse === v)?.text ?? '';
          }
          return '';
        })();
        savedByKey.set(note.key, {
          key: note.key,
          book: b,
          chapter: ch,
          verse: v,
          verseText,
          noteText: note.text,
        });
      }
    }

    const savedEntries = [...savedByKey.values()].sort(
      (a, b) => a.book.localeCompare(b.book) || a.chapter - b.chapter || a.verse - b.verse,
    );

    // Capitalize first letter of book name (keys are lowercase)
    const displayBook = (raw: string) =>
      books.find(b => b.name.toLowerCase() === raw.toLowerCase())?.name ?? raw;

    return (
      <div className="study-panel-content">
        <section className="mystuff-section mystuff-account-section">
          <div className="mystuff-section-label">Account</div>
          {!accountProfile && (
            <>
              <div className="reader-dashboard-title">Guest study mode</div>
              <p className="reader-onboarding-copy">
                Highlights, notes, bookmarks, streak, and recent passages stay on this device until you sign in.
              </p>
            </>
          )}
          <AuthPanel
            isBusy={authBusy}
            error={authError}
            mode={authMode}
            profile={accountProfile ? { email: accountProfile.email, display_name: accountProfile.display_name } : null}
            onModeChange={setAuthMode}
            onSignIn={handleAuthSignIn}
            onSignUp={handleAuthSignUp}
            onSignOut={handleAuthSignOut}
          />
        </section>

        {/* Reading rhythm */}
        <section className="reader-dashboard">
          <div className="reader-dashboard-card">
            <div className="reader-goal-header">
              <div className="reader-dashboard-label">Reading rhythm</div>
              <button
                type="button"
                className="reader-goal-edit-btn"
                onClick={() => setReadingGoalEditing(v => !v)}
              >
                {readingGoalEditing ? 'Done' : 'Edit goal'}
              </button>
            </div>
            <div className="reader-dashboard-title">{readingRhythmTitle}</div>
            {readingGoalEditing && (
              <div className="reader-goal-panel">
                <span className="reader-goal-panel-label">Chapters per day</span>
                <div className="reader-goal-stepper">
                  <button
                    type="button"
                    className="reader-goal-step"
                    aria-label="Decrease daily chapter goal"
                    onClick={() => setDailyGoalChapters(g => Math.max(1, g - 1))}
                  >
                    −
                  </button>
                  <span className="reader-goal-stepper-value" aria-live="polite">
                    {dailyGoalChapters}
                  </span>
                  <button
                    type="button"
                    className="reader-goal-step"
                    aria-label="Increase daily chapter goal"
                    onClick={() => setDailyGoalChapters(g => Math.min(25, g + 1))}
                  >
                    +
                  </button>
                </div>
              </div>
            )}
            <div className="reader-dashboard-metrics">
              <span className="reader-pill">{readingProgress.streak} day streak</span>
              <span className="reader-pill">{recentPassages.length} recent</span>
            </div>
          </div>
        </section>

        {/* Saved (highlights + notes) */}
        <section className="mystuff-section">
          <div className="mystuff-section-label">Saved ({savedEntries.length})</div>
          {savedEntries.length === 0 ? (
            <div className="mystuff-empty">Nothing saved yet. Tap a verse and choose Highlight or Note.</div>
          ) : (
            savedEntries.map(entry => (
              <div
                key={entry.key}
                className="mystuff-item"
                role="button"
                tabIndex={0}
                onClick={() => { navigateToPassage(displayBook(entry.book), entry.chapter, translation, entry.verse); closeSidePanel(); }}
                onKeyDown={e => e.key === 'Enter' && navigateToPassage(displayBook(entry.book), entry.chapter, translation, entry.verse)}
              >
                <span className="mystuff-item-ref">{displayBook(entry.book)} {entry.chapter}:{entry.verse}</span>
                {entry.verseText && <span className="mystuff-item-text">{entry.verseText}</span>}
                {entry.noteText && <span className="mystuff-item-note">{entry.noteText}</span>}
              </div>
            ))
          )}
        </section>

        {/* Study plans */}
        <section className="mystuff-section">
          <div className="mystuff-section-label">Study plans</div>
          <div className="mystuff-empty">Bible study plans coming soon.</div>
        </section>
      </div>
    );
  };

  // ── JSX ───────────────────────────────────────────────────────────────────────
  return (
    <>
      {/* Wave background */}
      <div id="wave-bg" aria-hidden="true">
        <svg className="wave-svg wv-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
          <path fill="var(--muted)" d="M0,100 C180,30 540,190 720,100 C900,30 1260,190 1440,100 L1440,320 L0,320 Z"/>
        </svg>
        <svg className="wave-svg wv-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
          <path fill="var(--muted)" d="M0,130 C200,55 520,210 720,130 C920,55 1240,210 1440,130 L1440,320 L0,320 Z"/>
        </svg>
        <svg className="wave-svg wv-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
          <path fill="var(--muted)" d="M0,90 C160,15 560,175 720,90 C880,5 1280,175 1440,90 L1440,320 L0,320 Z"/>
        </svg>
      </div>

      {homeScreenActive && (
        <div className="home-screen" role="region" aria-label="Home">
          <div className="home-screen-inner">
            <header className="home-screen-header">
              <h1 className="home-screen-title">Welcome</h1>
            </header>
            <section className="home-screen-card reader-dashboard-card" aria-labelledby="home-streak-heading">
              <h2 id="home-streak-heading" className="reader-dashboard-label">Your streak</h2>
              <p className="reader-dashboard-title">{readingProgress.streak} day streak</p>
              <p className="home-screen-card-caption">{readingRhythmTitle}</p>
              <div className="reader-dashboard-metrics">
                <span className="reader-pill">
                  {chaptersToday} of {dailyGoalChapters} {dailyGoalChapters === 1 ? 'chapter' : 'chapters'} today
                </span>
              </div>
            </section>
            <section className="home-screen-card reader-dashboard-card" aria-labelledby="home-continue-heading">
              <h2 id="home-continue-heading" className="reader-dashboard-label">Continue where you left off</h2>
              {chapterLoading && !chapterData ? (
                <div className="home-continue-loading">
                  <span className="spinner" aria-hidden="true" />
                  <span>Loading your place…</span>
                </div>
              ) : currentBook ? (
                <button
                  type="button"
                  className="home-continue-btn"
                  onClick={() => openReaderFromHome('none')}
                >
                  <span className="home-continue-ref">{currentBook.name} {chapter}</span>
                  <span className="home-continue-meta">{translation}</span>
                </button>
              ) : (
                <p className="home-continue-empty">Open the reader and pick a book to start.</p>
              )}
            </section>
            <section className="home-screen-card reader-dashboard-card" aria-labelledby="home-daily-verse-heading">
              <h2 id="home-daily-verse-heading" className="reader-dashboard-label">Verse of the day</h2>
              <p className="home-daily-verse-text">{dailyVerse.text}</p>
              <button
                type="button"
                className="home-daily-verse-ref"
                onClick={() => {
                  const didNavigate = navigateToPassage(dailyVerse.book, dailyVerse.chapter, translation, dailyVerse.verse);
                  if (didNavigate) openReaderFromHome('none');
                }}
              >
                {dailyVerse.book} {dailyVerse.chapter}:{dailyVerse.verse}
              </button>
            </section>
          </div>
        </div>
      )}

      {/* Topbar */}
      {!homeScreenActive && (
      <nav className={`topbar${chromeVisible ? '' : ' chrome-hide-top'}`}>
        <div className="nav-left">
          <button
            className={`nav-btn${bookPopupOpen ? ' active' : ''}`}
            type="button"
            onClick={e => { e.stopPropagation(); setSearchOpen(false); setVersionPopupOpen(false); setBookPopupOpen(v => !v); }}
          >
            <span className="nav-btn-label">{navLabel}</span>
            <span className="chevron" aria-hidden="true" />
          </button>
          <button
            ref={versionBtnRef}
            className={`nav-btn${versionPopupOpen ? ' active' : ''}`}
            type="button"
            onClick={e => { e.stopPropagation(); setBookPopupOpen(false); versionPopupOpen ? setVersionPopupOpen(false) : openVersionPopup(); }}
          >
            <span className="nav-btn-label">{translation}</span>
            <span className="chevron" aria-hidden="true" />
          </button>
        </div>
        <div className="nav-right">
          <span className="topbar-tooltip-wrap" data-tooltip="Search">
            <button
              className={`nav-btn nav-btn-icon-only${searchOpen ? ' active' : ''}`}
              type="button"
              aria-label="Open search"
              aria-expanded={searchOpen}
              aria-controls="nav-search-panel"
              onClick={e => {
                e.stopPropagation();
                setBookPopupOpen(false);
                setVersionPopupOpen(false);
                setSearchOpen(v => !v);
              }}
            >
              <svg className="nav-search-icon" viewBox="0 0 24 24" width={20} height={20} aria-hidden="true">
                <circle cx="11" cy="11" r="7" fill="none" stroke="currentColor" strokeWidth="2" />
                <path d="M20 20 16.5 16.5" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" />
              </svg>
            </button>
          </span>
          <span className="topbar-tooltip-wrap" data-tooltip="Account">
            <button
              className={`nav-btn nav-btn-icon-only${sidePanelMode === 'study' ? ' active' : ''}`}
              type="button"
              aria-label="My stuff"
              aria-expanded={sidePanelMode === 'study'}
              onClick={e => {
                e.stopPropagation();
                setBookPopupOpen(false);
                setVersionPopupOpen(false);
                setSearchOpen(false);
                toggleStudyPanel();
              }}
            >
              <svg className="nav-search-icon" viewBox="0 0 24 24" width={20} height={20} aria-hidden="true">
                <circle cx="12" cy="9" r="3.25" />
                <path d="M5 20.5v-.35c0-3.2 2.85-5.65 7-5.65s7 2.45 7 5.65v.35" />
              </svg>
            </button>
          </span>
        </div>
      </nav>
      )}

      {/* Book popup */}
      {!homeScreenActive && (
      <div
        className={`popup-overlay${bookPopupOpen ? ' open' : ''}`}
        onClick={e => { if (e.target === e.currentTarget) setBookPopupOpen(false); }}
      >
        <div className="book-panel">
          {books.length === 0 ? (
            <div className="state-msg"><span className="spinner" /><div>Loading...</div></div>
          ) : (
            <>
              {(['OT', 'NT'] as const).map(testament => (
                <div key={testament}>
                  <div className="testament-label">{testament === 'OT' ? 'Old Testament' : 'New Testament'}</div>
                  {books.filter(b => b.testament === testament).map(book => (
                    <div key={book.book_number} className="book-row">
                      <button
                        className={`book-btn${expandedBook === book.book_number ? ' expanded' : ''}`}
                        type="button"
                        onClick={() => setExpandedBook(v => v === book.book_number ? null : book.book_number)}
                      >
                        <span>{book.name}</span>
                        <span className="expand-arrow" aria-hidden="true" />
                      </button>
                      <div className={`chapter-picker${expandedBook === book.book_number ? ' open' : ''}`}>
                        {Array.from({ length: book.total_chapters }, (_, i) => i + 1).map(ch => (
                          <button
                            key={ch}
                            className={`ch-btn${currentBook?.book_number === book.book_number && chapter === ch ? ' current' : ''}`}
                            type="button"
                            onClick={e => { e.stopPropagation(); pickChapter(book.book_number, ch); }}
                          >
                            {ch}
                          </button>
                        ))}
                      </div>
                    </div>
                  ))}
                </div>
              ))}
            </>
          )}
        </div>
      </div>
      )}

      {/* Version popup */}
      {!homeScreenActive && (
      <div
        className={`popup-overlay${versionPopupOpen ? ' open' : ''}`}
        onClick={e => { if (e.target === e.currentTarget) setVersionPopupOpen(false); }}
      >
        <div className="version-panel" style={{ left: `${versionPanelLeft}px` }}>
          <div className="version-header">Translation</div>
          {translations.map(t => (
            <button
              key={t.id}
              className={`version-item${t.id === translation ? ' selected' : ''}`}
              type="button"
              onClick={() => pickTranslation(t.id)}
            >
              <span className="v-abbr">{t.id}</span>
              <span className="v-name">{t.name}</span>
              {t.id === translation && <span className="v-check">✓</span>}
            </button>
          ))}
        </div>
      </div>
      )}

      {!homeScreenActive && (
      <div
        className={`popup-overlay${searchOpen ? ' open' : ''}`}
        onClick={e => { if (e.target === e.currentTarget) setSearchOpen(false); }}
      >
        <div className="search-panel search-dropdown-panel" id="nav-search-panel">
          <form
            className="search-form"
            onSubmit={event => {
              event.preventDefault();
              void runSearch();
            }}
          >
            <input
              ref={searchInputRef}
              className="search-input"
              type="search"
              value={searchQuery}
              placeholder="John 3, Romans 8:28, or a phrase…"
              onChange={event => setSearchQuery(event.target.value)}
              autoComplete="off"
            />
            <button
              className="search-submit search-submit-icon-only"
              type="submit"
              disabled={searchLoading}
              aria-label={searchLoading ? 'Searching' : 'Search'}
            >
              {searchLoading ? (
                <span className="spinner search-submit-spinner" aria-hidden />
              ) : (
                <svg className="search-submit-icon" viewBox="0 0 24 24" width={20} height={20} aria-hidden="true">
                  <circle cx="11" cy="11" r="7" fill="none" stroke="currentColor" strokeWidth="2" />
                  <path d="M20 20 16.5 16.5" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" />
                </svg>
              )}
            </button>
          </form>
          {searchSuggestions.length > 0 && (
            <div className="search-section search-section--compact">
              <div className="search-section-title">
                {searchQuery.trim() ? 'Suggestions' : 'Popular & recent'}
              </div>
              <div className="search-suggestion-list" role="listbox" aria-label="Search suggestions">
                {searchSuggestions.map(suggestion => (
                  <button
                    key={suggestion.id}
                    className="search-suggestion"
                    type="button"
                    onClick={() => applySearchSuggestion(suggestion)}
                  >
                    <div className="search-suggestion-top">
                      <span className={`search-suggestion-badge search-suggestion-badge--${suggestion.source}`}>
                        {suggestion.source === 'typo'
                          ? 'Typo match'
                          : suggestion.source === 'recent'
                            ? 'Recent'
                            : suggestion.source === 'direct'
                              ? 'Go to'
                              : 'Popular'}
                      </span>
                      <span className="search-suggestion-arrow" aria-hidden="true">&gt;</span>
                    </div>
                    <div className="search-suggestion-title">{suggestion.label}</div>
                    <div className="search-suggestion-subtitle">{suggestion.hint}</div>
                  </button>
                ))}
              </div>
            </div>
          )}
          {!searchQuery.trim() && recentPassages.length > 0 && searchSuggestions.length === 0 && (
            <div className="search-section search-section--compact">
              <div className="search-chip-row" aria-label="Recent passages">
                {recentPassages.slice(0, 6).map(entry => (
                  <button
                    key={`${entry.book}-${entry.chapter}-${entry.translation}`}
                    className="search-chip"
                    type="button"
                    onClick={() => navigateToPassage(entry.book, entry.chapter, entry.translation)}
                  >
                    {entry.book} {entry.chapter}
                  </button>
                ))}
              </div>
            </div>
          )}
          {searchError && <div className="search-empty">{searchError}</div>}
          {searchResults.length > 0 && (
            <div className="search-results">
              {searchResults.map(result => (
                <button
                  key={`${result.verse.book}-${result.verse.chapter}-${result.verse.verse}-${result.verse.translation}`}
                  className="search-result"
                  type="button"
                  onClick={() => {
                    navigateToPassage(result.verse.book, result.verse.chapter, result.verse.translation, result.verse.verse);
                    setSearchOpen(false);
                  }}
                >
                  <div className="search-result-ref">
                    {result.verse.book} {result.verse.chapter}:{result.verse.verse} ({result.verse.translation})
                  </div>
                  <div className="search-result-text">{result.verse.text}</div>
                </button>
              ))}
            </div>
          )}
        </div>
      </div>
      )}

      {/* Content shell */}
      <div className={`content-shell${chromeVisible ? '' : ' chrome-hidden'}${homeScreenActive ? ' home-screen-behind' : ''}`}>
        {/* Smoke overlay */}
        <div id="smoke-overlay" aria-hidden="true">
          {([ ['300px','300px','var(--muted)','5%','4%','35px','18px','30s','0s'],
              ['220px','220px','var(--accent)','42%','2%','-25px','22px','22s','-8s'],
              ['260px','260px','var(--muted)','72%','6%','20px','14px','27s','-4s'],
              ['280px','280px','var(--accent)','18%','28%','-40px','-16px','34s','-12s'],
              ['200px','200px','var(--muted)','55%','25%','30px','-20px','25s','-2s'],
              ['320px','320px','var(--accent)','80%','32%','-28px','10px','38s','-18s'],
              ['260px','260px','var(--muted)','8%','54%','45px','-12px','28s','-6s'],
              ['190px','190px','var(--accent)','38%','58%','-22px','18px','21s','-14s'],
              ['290px','290px','var(--muted)','65%','50%','25px','-8px','33s','-9s'],
              ['240px','240px','var(--accent)','22%','76%','-38px','-22px','26s','-3s'],
              ['310px','310px','var(--muted)','58%','80%','32px','-18px','36s','-16s'],
              ['180px','180px','var(--accent)','85%','72%','-18px','24px','23s','-22s'],
          ] as [string,string,string,string,string,string,string,string,string][]).map(([w,h,bg,l,t,dx,dy,dur,del], i) => (
            <div key={i} className="smoke-wisp" style={{
              width: w, height: h, background: bg, left: l, top: t,
              ['--dx' as string]: dx, ['--dy' as string]: dy,
              animationDuration: dur, animationDelay: del,
            } as React.CSSProperties} />
          ))}
        </div>

        {/* Dynamic theme wave */}
        <div id="dynamic-wave" aria-hidden="true">
          <div className="dynamic-wave-tint" ref={dynTintRef} />
        </div>

        {/* Galaxy sparkles */}
        <div className="galaxy-sparkles" aria-hidden="true" />
        <div className="pink-hearts" aria-hidden="true" />
        <div className="emerald-leaves" aria-hidden="true" />

        {/* Main content area */}
        <div
          ref={contentAreaRef}
          className={`content-area${sidePaneOnRight ? ' side-pane-right' : ''}`}
        >
          <button
            type="button"
            className={`side-edge-toggle${sidePaneOnRight ? ' side-edge-toggle-right' : ' side-edge-toggle-left'}${sideOpen ? ' open' : ''}`}
            aria-label={sideOpen ? 'Return to full-screen reader' : 'Open side panel'}
            aria-expanded={sideOpen}
            onClick={toggleReaderFocus}
          >
            <span className="side-edge-toggle-text">
              {sideOpen ? 'Full reader' : 'Open panel'}
            </span>
          </button>
          {/* Side pane */}
          <aside
            ref={sidePaneRef}
            className={`side-pane${sideOpen ? ' open' : ''}${isPaneTransitioning ? ' transitioning' : ''}`}
            style={{ '--side-width': sidePaneWidth } as React.CSSProperties}
          >
            <div className="side-header">
              {sidePanelMode === 'ai' ? (
                <>
                  <div className="side-header-row">
                    <span className="side-eyebrow">AI assistant</span>
                    <span className="side-subtitle side-subtitle-inline">{sidePanelContext}</span>
                  </div>
                  <div
                    ref={agentMenuRef}
                    className={`commentary-source-row visible${agentMenuOpen ? ' open' : ''}`}
                  >
                    <button
                      className="commentary-source-select"
                      type="button"
                      aria-haspopup="listbox"
                      aria-expanded={agentMenuOpen}
                      onClick={() => setAgentMenuOpen(v => !v)}
                    >
                      <span className="commentary-source-select-label">
                        {PERSONALITIES.find(p => p.id === personalityId)?.name ?? 'Jessica'}
                      </span>
                      <span className="commentary-source-chevron" aria-hidden="true" />
                    </button>
                    <div className="commentary-source-menu" role="listbox" aria-label="AI assistant">
                      {PERSONALITIES.map(p => (
                        <button
                          key={p.id}
                          className={`commentary-source-option${p.id === personalityId ? ' selected' : ''}`}
                          type="button"
                          role="option"
                          aria-selected={p.id === personalityId}
                          onClick={() => {
                            setPersonalityId(p.id);
                            try {
                              window.localStorage.setItem(AI_PERSONALITY_STORAGE_KEY, p.id);
                            } catch {
                              /* ignore */
                            }
                            setAgentMenuOpen(false);
                          }}
                        >
                          <span>{p.name}</span>
                          {p.id === personalityId && <span className="commentary-source-check">✓</span>}
                        </button>
                      ))}
                    </div>
                  </div>
                </>
              ) : (
                <>
                  {sidePanelMode === 'commentary' && (
                    <span className="side-eyebrow">Commentary</span>
                  )}
                  <div className="side-title">{sidePanelTitle()}</div>
                  <div className="side-subtitle">{sidePanelContext}</div>
                </>
              )}
              {sidePanelMode === 'commentary' && (
                <div
                  ref={commentarySourceMenuRef}
                  className={`commentary-source-row visible${commentarySourceMenuOpen ? ' open' : ''}`}
                >
                  <button
                    className="commentary-source-select"
                    type="button"
                    aria-haspopup="listbox"
                    aria-expanded={commentarySourceMenuOpen}
                    onClick={() => setCommentarySourceMenuOpen(v => !v)}
                  >
                    <span className="commentary-source-select-label">
                      {commentarySourceNames[commentarySource] ?? commentarySource}
                    </span>
                    <span className="commentary-source-chevron" aria-hidden="true" />
                  </button>
                  <div className="commentary-source-menu" role="listbox" aria-label="Commentary source">
                    {availableCommentarySources.map(source => (
                      <button
                        key={source.id}
                        className={`commentary-source-option${source.id === commentarySource ? ' selected' : ''}`}
                        type="button"
                        role="option"
                        aria-selected={source.id === commentarySource}
                        onClick={() => {
                          setCommentarySource(source.id);
                          setCommentarySourceMenuOpen(false);
                          const book = currentBookRef.current;
                          if (book) loadCommentaryData(book, chapterRef.current, source.id);
                        }}
                      >
                        <span>{source.name}</span>
                        {source.id === commentarySource && <span className="commentary-source-check">✓</span>}
                      </button>
                    ))}
                  </div>
                </div>
              )}
            </div>
            <div className="side-scroll" ref={sideScrollRef}>
              {sidePanelMode === 'commentary' && renderCommentaryContent()}
              {sidePanelMode === 'study' && renderStudyContent()}
              {sidePanelMode === 'ai' && (
                <AiSidebar
                  currentBookName={currentBook?.name ?? null}
                  chapter={chapter}
                  translation={translation}
                  personalityId={personalityId}
                  bibleBooks={bibleBooksForAi}
                  onNavigate={handleAiNavigate}
                  onOpenCommentary={handleAiOpenCommentary}
                  composerSeed={aiComposerSeed}
                />
              )}
            </div>
          </aside>

          {/* Draggable divider */}
          <div
            ref={dividerRef}
            className={`pane-divider${sideOpen ? ' visible' : ''}`}
          />

          {/* Bible pane */}
          <main className="bible-pane" ref={biblePaneRef}>
            <div className={`reader-wrap${readerSettings.readingMode === 'book' ? ' reader-wrap--book' : ''}${!sideOpen ? ' reader-wrap--full' : ''}`}>
              {renderChapterContent()}
            </div>
          </main>
        </div>
      </div>

      {readerAskBubble && chapterData && !homeScreenActive && (
        <button
          type="button"
          className="reader-selection-ask-btn"
          style={{
            position: 'fixed',
            top: readerAskBubble.top - 6,
            left: readerAskBubble.left,
            zIndex: 80,
          }}
          aria-label={`Ask ${currentAgentName} to explain the selected passage`}
          onClick={handleAskFromReaderSelection}
        >
          Ask {currentAgentName}
        </button>
      )}

      {/* Chapter nav buttons */}
      <div className={`ch-nav ch-nav-prev${chromeVisible ? '' : ' chrome-hide-bottom'}${homeScreenActive ? ' home-screen-behind' : ''}${sideOpen && !sidePaneOnRight ? ' side-pane-open' : ''}`}>
        <button
          className="ch-nav-btn"
          type="button"
          aria-label="Previous chapter"
          disabled={!currentBook || !!isFirstChapter()}
          onClick={goPrev}
        >
          ‹
        </button>
      </div>
      <div className={`ch-nav ch-nav-next${chromeVisible ? '' : ' chrome-hide-bottom'}${homeScreenActive ? ' home-screen-behind' : ''}${sideOpen && sidePaneOnRight ? ' side-pane-open' : ''}`}>
        <button
          className="ch-nav-btn"
          type="button"
          aria-label="Next chapter"
          disabled={!currentBook || !!isLastChapter()}
          onClick={goNext}
        >
          ›
        </button>
      </div>

      {/* Taskbar */}
      <div className={`taskbar${chromeVisible ? '' : ' chrome-hide-bottom'}`}>
        <button
          className="taskbar-btn taskbar-btn-settings"
          type="button"
          aria-label="Settings"
          onClick={() => {
            setHomeScreenActive(false);
            setSettingsOpen(true);
          }}
        >
          <span className="taskbar-icon" aria-hidden="true">
            <svg viewBox="0 0 24 24">
              <circle cx="12" cy="12" r="3" />
              <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1Z" />
            </svg>
          </span>
        </button>

        <span
          className="taskbar-tooltip-wrap"
          data-tooltip="Home"
        >
          <button
            className={`taskbar-btn${homeScreenActive ? ' active' : ''}`}
            type="button"
            aria-label="Home"
            onClick={goToHome}
          >
            <span className="taskbar-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24">
                <path d="M10.5 3.5 3 9.5V20a1.5 1.5 0 0 0 1.5 1.5H9V14h6v7.5h4.5A1.5 1.5 0 0 0 21 20V9.5L13.5 3.5a2 2 0 0 0-3 0Z" />
              </svg>
            </span>
          </button>
        </span>

        <span
          className="taskbar-tooltip-wrap"
          data-tooltip="Bible"
        >
          <button
            className={`taskbar-btn is-primary${!homeScreenActive && sidePanelMode === 'none' ? ' active' : ''}`}
            type="button"
            aria-label="Bible reader"
            onClick={() => (homeScreenActive ? openReaderFromHome('none') : closeSidePanel())}
          >
            <span className="taskbar-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24">
                <path d="M6.5 5.5h8a3 3 0 0 1 3 3v10h-8a3 3 0 0 0-3 3Z" />
                <path d="M17.5 18.5h-8a3 3 0 0 0-3 3V8.5a3 3 0 0 1 3-3h8Z" />
                <path d="M10 8.5v7" /><path d="M8.2 12h3.6" />
              </svg>
            </span>
          </button>
        </span>

        <span
          className="taskbar-tooltip-wrap"
          data-tooltip="Commentary"
        >
          <button
            className={`taskbar-btn${!homeScreenActive && sidePanelMode === 'commentary' ? ' active' : ''}`}
            type="button"
            aria-label="Commentary"
            onClick={() => (homeScreenActive ? openReaderFromHome('commentary') : toggleCommentary())}
          >
            <span className="taskbar-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24">
                <path d="M6 7.5h9" /><path d="M6 11h12" /><path d="M6 14.5h8" />
                <path d="M5 4.5h14a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H12l-4.5 3v-3H5a2 2 0 0 1-2-2v-8a2 2 0 0 1 2-2Z" />
              </svg>
            </span>
          </button>
        </span>

        <span
          className="taskbar-tooltip-wrap"
          data-tooltip="AI"
        >
          <button
            className={`taskbar-btn${!homeScreenActive && sidePanelMode === 'ai' ? ' active' : ''}`}
            type="button"
            aria-label="AI assistant"
            onClick={() => (homeScreenActive ? openReaderFromHome('ai') : toggleAiPanel())}
          >
            <span className="taskbar-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24">
                <path d="M12 3.5 13.9 8l4.6 1.9-4.6 1.9-1.9 4.7-1.9-4.7L5.5 9.9 10.1 8 12 3.5Z" className="icon-solid" />
                <path d="M18 14.5 18.9 16.6 21 17.5l-2.1.9-.9 2.1-.9-2.1-2.1-.9 2.1-.9.9-2.1Z" className="icon-solid" />
                <path d="M6.5 15.5 7.2 17l1.5.7-1.5.7-.7 1.6-.7-1.6-1.6-.7 1.6-.7.7-1.5Z" className="icon-solid" />
              </svg>
            </span>
          </button>
        </span>
      </div>

      {/* Settings panel */}
      <div
        className={`settings-overlay${settingsOpen ? ' open' : ''}`}
        onClick={e => { if (e.target === e.currentTarget) setSettingsOpen(false); }}
      >
        <div className="settings-panel">
          <div className="settings-header">
            <span className="settings-title">Settings</span>
            <button className="settings-close" type="button" aria-label="Close settings" onClick={() => setSettingsOpen(false)}>✕</button>
          </div>
          <div className="settings-body">
            <div className="settings-section-label">Appearance</div>
            <div className="theme-grid">
              {(themePickerExpanded ? THEMES : themesForCollapsedPicker(currentTheme, THEME_GRID_PREVIEW_COUNT)).map(theme => (
                <div
                  key={theme.id}
                  className={`theme-card${currentTheme === theme.id ? ' selected' : ''}`}
                  style={getThemeCardStyle(theme)}
                  role="button"
                  tabIndex={0}
                  onClick={() => applyTheme(theme.id)}
                  onKeyDown={e => e.key === 'Enter' && applyTheme(theme.id)}
                >
                  <div className="theme-swatches">
                    {theme.swatches.map((color, i) => (
                      <span key={i} style={{ background: color }} />
                    ))}
                  </div>
                  <div className="theme-name">{theme.name}</div>
                  <span className="theme-check" aria-hidden="true">✓</span>
                </div>
              ))}
            </div>
            {THEMES.length > THEME_GRID_PREVIEW_COUNT && (
              <button
                type="button"
                className="settings-theme-expand"
                onClick={() => setThemePickerExpanded(exp => !exp)}
              >
                {themePickerExpanded ? 'See less' : 'See more'}
              </button>
            )}
            <div className="settings-section-label">Reading</div>
            <div className="settings-controls">
              <label className="settings-field">
                <span>Text size</span>
                <select
                  value={readerSettings.fontScale}
                  onChange={event => setReaderSettings(prev => ({ ...prev, fontScale: event.target.value as ReaderFontPx }))}
                >
                  {READER_FONT_PX_OPTIONS.map(px => (
                    <option key={px} value={px}>{px}px</option>
                  ))}
                </select>
              </label>
              <label className="settings-field">
                <span>Reading font</span>
                <select
                  value={readerSettings.readerFont}
                  onChange={event => setReaderSettings(prev => ({
                    ...prev,
                    readerFont: event.target.value as ReaderFontId,
                  }))}
                >
                  <option value="georgia">Georgia (default)</option>
                  <option value="charter">Charter</option>
                  <option value="palatino">Palatino</option>
                  <option value="garamond">Garamond style</option>
                  <option value="times">Times New Roman</option>
                  <option value="sans">Sans (UI)</option>
                </select>
              </label>
              <label className="settings-field">
                <span>Reading mode</span>
                <select
                  value={readerSettings.readingMode}
                  onChange={event => setReaderSettings(prev => ({
                    ...prev,
                    readingMode: event.target.value as ReaderReadingMode,
                  }))}
                >
                  <option value="single">Single column</option>
                  <option value="book">Double collumn</option>
                </select>
              </label>
              <label className="settings-field">
                <span>Line spacing</span>
                <select
                  value={readerSettings.lineHeight}
                  onChange={event => setReaderSettings(prev => ({ ...prev, lineHeight: event.target.value as ReaderLineHeightOption }))}
                >
                  {READER_LINE_HEIGHT_OPTIONS.map(opt => (
                    <option key={opt} value={opt}>
                      {opt === '2' ? '2.0' : opt}
                    </option>
                  ))}
                </select>
              </label>
              <label className="settings-field">
                <span>Side panel position</span>
                <select
                  value={readerSettings.sidePanelPosition}
                  onChange={event => setReaderSettings(prev => ({ ...prev, sidePanelPosition: event.target.value as SidePanelPosition }))}
                >
                  <option value="left">Left side</option>
                  <option value="right">Right side</option>
                </select>
              </label>
              <label className="settings-toggle">
                <input
                  type="checkbox"
                  checked={readerSettings.reducedMotion}
                  onChange={event => setReaderSettings(prev => ({ ...prev, reducedMotion: event.target.checked }))}
                />
                <span>Reduce motion</span>
              </label>
              <label className="settings-toggle">
                <input
                  type="checkbox"
                  checked={readerSettings.pageFlipEnabled}
                  onChange={event => setReaderSettings(prev => ({ ...prev, pageFlipEnabled: event.target.checked }))}
                />
                <span>Page flip animation</span>
              </label>
              <label className="settings-toggle">
                <input
                  type="checkbox"
                  checked={readerSettings.highContrast}
                  onChange={event => setReaderSettings(prev => ({ ...prev, highContrast: event.target.checked }))}
                />
                <span>High contrast</span>
              </label>
            </div>
          </div>
        </div>
      </div>

      {/* Galaxy comet canvas — fixed overlay, clips to toolbar/gutter zones only */}
      <canvas
        ref={cometCanvasRef}
        className="theme-comet-canvas"
        aria-hidden="true"
        style={{
          position: 'fixed',
          inset: 0,
          width: '100%',
          height: '100%',
          pointerEvents: 'none',
          zIndex: homeScreenActive ? 30 : 110,
          display: currentTheme === 'galaxy' || currentTheme === 'pink' ? 'block' : 'none',
        }}
      />
    </>
  );
}
