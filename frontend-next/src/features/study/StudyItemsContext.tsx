'use client';

import { createContext, useContext, useEffect, useMemo, useRef, useState } from 'react';
import type { Dispatch, ReactNode, SetStateAction } from 'react';
import type { ReadingProgress, SavedPassage, VerseNote } from '@/features/reader/types';
import {
  BOOKMARKS_STORAGE_KEY,
  CHAPTERS_READ_STORAGE_KEY,
  DAILY_GOAL_MINUTES_STORAGE_KEY,
  DEFAULT_DAILY_GOAL_MINUTES,
  HIGHLIGHTS_STORAGE_KEY,
  NOTES_STORAGE_KEY,
  READING_PROGRESS_STORAGE_KEY,
  RECENT_PASSAGES_STORAGE_KEY,
  normalizeReadingProgress,
  rollReadingProgressToToday,
} from '@/features/progress/progress';
import {
  readStoredBookmarks,
  readStoredChaptersRead,
  readStoredDailyGoalMinutes,
  readStoredHighlights,
  readStoredNotes,
  readStoredReadingProgress,
  readStoredRecentPassages,
} from '@/lib/localState';

interface StudyItemsContextValue {
  recentPassages: SavedPassage[];
  setRecentPassages: Dispatch<SetStateAction<SavedPassage[]>>;
  highlightedVerses: string[];
  setHighlightedVerses: Dispatch<SetStateAction<string[]>>;
  bookmarkedVerses: string[];
  setBookmarkedVerses: Dispatch<SetStateAction<string[]>>;
  verseNotes: Record<string, VerseNote>;
  setVerseNotes: Dispatch<SetStateAction<Record<string, VerseNote>>>;
  readingProgress: ReadingProgress;
  setReadingProgress: Dispatch<SetStateAction<ReadingProgress>>;
  dailyGoalMinutes: number;
  setDailyGoalMinutes: Dispatch<SetStateAction<number>>;
  /** All-time record of chapters read, as `chapterReadKey` strings (no translation). */
  chaptersRead: ReadonlySet<string>;
  /** Callers must return the previous set when nothing is new, so nothing is written. */
  setChaptersRead: Dispatch<SetStateAction<ReadonlySet<string>>>;
}

const StudyItemsContext = createContext<StudyItemsContextValue | null>(null);

export function StudyItemsProvider({ children }: { children: ReactNode }) {
  const [recentPassages, setRecentPassages] = useState<SavedPassage[]>([]);
  const [highlightedVerses, setHighlightedVerses] = useState<string[]>([]);
  const [bookmarkedVerses, setBookmarkedVerses] = useState<string[]>([]);
  const [verseNotes, setVerseNotes]         = useState<Record<string, VerseNote>>({});
  const [readingProgress, setReadingProgress] = useState<ReadingProgress>(() => normalizeReadingProgress(null));
  const [dailyGoalMinutes, setDailyGoalMinutes] = useState(DEFAULT_DAILY_GOAL_MINUTES);
  const [chaptersRead, setChaptersRead] = useState<ReadonlySet<string>>(() => new Set());
  /** The set that was loaded from storage; the save effect skips it so only real additions are written. */
  const loadedChaptersReadRef = useRef<ReadonlySet<string> | null>(null);
  /** Set once the stored values have been read; saves are skipped until then. */
  const loadedRef = useRef(false);

  // The save effects are declared before the load effect on purpose: on the mount commit they run first,
  // still see loadedRef false, and so cannot overwrite the stored values with the defaults before they are read.
  useEffect(() => {
    if (typeof window === 'undefined' || !loadedRef.current) return;
    window.localStorage.setItem(HIGHLIGHTS_STORAGE_KEY, JSON.stringify(highlightedVerses));
  }, [highlightedVerses]);

  useEffect(() => {
    if (typeof window === 'undefined' || !loadedRef.current) return;
    window.localStorage.setItem(BOOKMARKS_STORAGE_KEY, JSON.stringify(bookmarkedVerses));
  }, [bookmarkedVerses]);

  useEffect(() => {
    if (typeof window === 'undefined' || !loadedRef.current) return;
    window.localStorage.setItem(NOTES_STORAGE_KEY, JSON.stringify(verseNotes));
  }, [verseNotes]);

  useEffect(() => {
    if (typeof window === 'undefined' || !loadedRef.current) return;
    window.localStorage.setItem(RECENT_PASSAGES_STORAGE_KEY, JSON.stringify(recentPassages));
  }, [recentPassages]);

  useEffect(() => {
    if (typeof window === 'undefined' || !loadedRef.current) return;
    window.localStorage.setItem(READING_PROGRESS_STORAGE_KEY, JSON.stringify(readingProgress));
  }, [readingProgress]);

  useEffect(() => {
    if (typeof window === 'undefined' || !loadedRef.current) return;
    window.localStorage.setItem(DAILY_GOAL_MINUTES_STORAGE_KEY, String(dailyGoalMinutes));
  }, [dailyGoalMinutes]);

  useEffect(() => {
    if (typeof window === 'undefined' || !loadedRef.current) return;
    if (chaptersRead === loadedChaptersReadRef.current) return;
    try {
      window.localStorage.setItem(CHAPTERS_READ_STORAGE_KEY, JSON.stringify([...chaptersRead]));
    } catch {
      /* Storage full or blocked: the record lives on for this session. */
    }
  }, [chaptersRead]);

  useEffect(() => {
    loadedRef.current = true;
    setHighlightedVerses(readStoredHighlights());
    setBookmarkedVerses(readStoredBookmarks());
    setVerseNotes(readStoredNotes());
    setRecentPassages(readStoredRecentPassages());
    setReadingProgress(rollReadingProgressToToday(readStoredReadingProgress()));
    setDailyGoalMinutes(readStoredDailyGoalMinutes());
    const loadedChaptersRead = readStoredChaptersRead();
    loadedChaptersReadRef.current = loadedChaptersRead;
    setChaptersRead(loadedChaptersRead);
    // Strict Mode unmounts and remounts effects on first mount without re-rendering. Clearing the flag here
    // stops the save effects from writing default state over storage before this effect reads it again.
    return () => { loadedRef.current = false; };
  }, []);

  const value = useMemo(
    () => ({
      recentPassages, setRecentPassages,
      highlightedVerses, setHighlightedVerses,
      bookmarkedVerses, setBookmarkedVerses,
      verseNotes, setVerseNotes,
      readingProgress, setReadingProgress,
      dailyGoalMinutes, setDailyGoalMinutes,
      chaptersRead, setChaptersRead,
    }),
    [recentPassages, highlightedVerses, bookmarkedVerses, verseNotes, readingProgress, dailyGoalMinutes, chaptersRead],
  );
  return <StudyItemsContext.Provider value={value}>{children}</StudyItemsContext.Provider>;
}

export function useStudyItems(): StudyItemsContextValue {
  const ctx = useContext(StudyItemsContext);
  if (!ctx) throw new Error('useStudyItems must be used within a StudyItemsProvider');
  return ctx;
}
