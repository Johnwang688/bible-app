// Readers for the signed-out state the reader keeps in localStorage.
// Stored values can be stale, hand-edited or written by older builds, so each
// reader returns the exact type the app uses, drops invalid entries, keeps
// valid ones, and never throws.

import {
  BOOKMARKS_STORAGE_KEY,
  DAILY_GOAL_MINUTES_STORAGE_KEY,
  HIGHLIGHTS_STORAGE_KEY,
  LAST_POSITION_STORAGE_KEY,
  NOTES_STORAGE_KEY,
  READER_SETTINGS_STORAGE_KEY,
  READING_PROGRESS_STORAGE_KEY,
  RECENT_PASSAGES_STORAGE_KEY,
  normalizeDailyGoalMinutes,
  normalizeReadingProgress,
} from '@/features/progress/progress';
import { normalizeReaderSettings } from '@/features/reader/settings';
import type { ReaderSettings, ReadingProgress, SavedPassage, VerseNote } from '@/features/reader/types';
import { asStringArray, safelyParseJson } from '@/lib/json';

export interface StoredLastPosition {
  book: string;
  chapter: number;
  translation?: string;
}

function readRaw(key: string): string | null {
  try {
    return localStorage.getItem(key);
  } catch {
    return null;
  }
}

function readJson(key: string): unknown {
  return safelyParseJson<unknown>(readRaw(key), null);
}

function isPlainObject(value: unknown): value is Record<string, unknown> {
  return value !== null && typeof value === 'object' && !Array.isArray(value);
}

function isPositiveInteger(value: unknown): value is number {
  return typeof value === 'number' && Number.isInteger(value) && value > 0;
}

function isFiniteNumber(value: unknown): value is number {
  return typeof value === 'number' && Number.isFinite(value);
}

function isVerseNote(value: unknown): value is VerseNote {
  return (
    isPlainObject(value) &&
    typeof value.key === 'string' &&
    typeof value.book === 'string' &&
    isPositiveInteger(value.chapter) &&
    isPositiveInteger(value.verse) &&
    typeof value.text === 'string' &&
    isFiniteNumber(value.updatedAt)
  );
}

function isSavedPassage(value: unknown): value is SavedPassage {
  return (
    isPlainObject(value) &&
    typeof value.book === 'string' &&
    isPositiveInteger(value.chapter) &&
    typeof value.translation === 'string' &&
    isFiniteNumber(value.savedAt)
  );
}

export function readStoredHighlights(): string[] {
  return asStringArray(readJson(HIGHLIGHTS_STORAGE_KEY));
}

export function readStoredBookmarks(): string[] {
  return asStringArray(readJson(BOOKMARKS_STORAGE_KEY));
}

export function readStoredNotes(): Record<string, VerseNote> {
  const raw = readJson(NOTES_STORAGE_KEY);
  const notes: Record<string, VerseNote> = {};
  if (!isPlainObject(raw)) return notes;
  Object.entries(raw).forEach(([key, value]) => {
    if (!isVerseNote(value) || value.key !== key) return;
    notes[key] = {
      key: value.key,
      book: value.book,
      chapter: value.chapter,
      verse: value.verse,
      text: value.text,
      updatedAt: value.updatedAt,
    };
  });
  return notes;
}

export function readStoredRecentPassages(): SavedPassage[] {
  const raw = readJson(RECENT_PASSAGES_STORAGE_KEY);
  if (!Array.isArray(raw)) return [];
  return raw.filter(isSavedPassage).map(entry => ({
    book: entry.book,
    chapter: entry.chapter,
    translation: entry.translation,
    savedAt: entry.savedAt,
  }));
}

/** Returns null when nothing valid is stored, so the app opens its default passage. */
export function readStoredLastPosition(): StoredLastPosition | null {
  const raw = readJson(LAST_POSITION_STORAGE_KEY);
  if (!isPlainObject(raw) || typeof raw.book !== 'string' || !isPositiveInteger(raw.chapter)) return null;
  return typeof raw.translation === 'string'
    ? { book: raw.book, chapter: raw.chapter, translation: raw.translation }
    : { book: raw.book, chapter: raw.chapter };
}

export function readStoredReadingProgress(): ReadingProgress {
  return normalizeReadingProgress(readJson(READING_PROGRESS_STORAGE_KEY));
}

export function readStoredDailyGoalMinutes(): number {
  return normalizeDailyGoalMinutes(readRaw(DAILY_GOAL_MINUTES_STORAGE_KEY));
}

export function readStoredReaderSettings(): ReaderSettings {
  const raw = readJson(READER_SETTINGS_STORAGE_KEY);
  return normalizeReaderSettings(isPlainObject(raw) ? (raw as Partial<ReaderSettings>) : null);
}
