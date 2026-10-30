import type { MutableRefObject } from 'react';
import type { ChapterQuizVisitState } from '@/features/reader/types';

/** Minimum visible time on a chapter before quiz; scales 20s–60s by verse count. */
export const CHAPTER_QUIZ_MIN_DWELL_MS = 20_000;
export const CHAPTER_QUIZ_MAX_DWELL_MS = 60_000;
export const CHAPTER_QUIZ_DWELL_VERSE_FLOOR = 30;
export const CHAPTER_QUIZ_DWELL_VERSE_CEIL = 150;

export function computeChapterQuizRequiredDwellMs(verseCount: number): number {
  if (verseCount <= CHAPTER_QUIZ_DWELL_VERSE_FLOOR) return CHAPTER_QUIZ_MIN_DWELL_MS;
  if (verseCount >= CHAPTER_QUIZ_DWELL_VERSE_CEIL) return CHAPTER_QUIZ_MAX_DWELL_MS;
  const t =
    (verseCount - CHAPTER_QUIZ_DWELL_VERSE_FLOOR) /
    (CHAPTER_QUIZ_DWELL_VERSE_CEIL - CHAPTER_QUIZ_DWELL_VERSE_FLOOR);
  return Math.round(CHAPTER_QUIZ_MIN_DWELL_MS + t * (CHAPTER_QUIZ_MAX_DWELL_MS - CHAPTER_QUIZ_MIN_DWELL_MS));
}

export function getChapterQuizVisibleMs(visitRef: MutableRefObject<ChapterQuizVisitState>): number {
  const v = visitRef.current;
  let ms = v.visibleAccumMs;
  if (v.visibleStartedAt != null) ms += Date.now() - v.visibleStartedAt;
  return ms;
}
