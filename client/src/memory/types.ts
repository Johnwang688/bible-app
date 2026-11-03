// Shared types for the Memory section (the Little Lamb merge). Owned by the orchestrator (team MEM).
// Ported from Little Lamb's src/lib/types.ts, progress-merge.ts and lesson-router.ts.

/** One verse of a memory library. `chunks` are the complete-thought phrases the trainers use. */
export interface MemoryVerse {
  /** The slug of the English reference, e.g. `john-3-16`. */
  id: string;
  /** 1-based order within the library: the order new verses are introduced in. */
  sortOrder: number;
  series: string;
  seriesEn: string;
  seriesZh: string;
  topicEn: string;
  topicZh: string;
  referenceEn: string;
  referenceZh: string;
  referenceZhHant: string;
  textZh: string;
  textZhHant: string;
  chunks: readonly string[];
  /** Same chunks in traditional script, position for position. */
  chunksHant: readonly string[];
}

/**
 * The stage ladder. Stages graduate monotonically:
 *   chunk_order -> fill_blank -> full_recall -> review
 * A verse with no progress row is brand new (it starts at chunk_order).
 * Once a verse reaches `review` it is in the spaced-review pool.
 */
export type LearnStage = 'chunk_order' | 'fill_blank' | 'full_recall' | 'review';

export const STAGE_RANK: Record<LearnStage, number> = {
  chunk_order: 0,
  fill_blank: 1,
  full_recall: 2,
  review: 3,
};

/** The trainer a lesson step opens. Verses at `review` are practised with full recall. */
export type StageSlug = 'chunk-order' | 'fill-blank' | 'full-recall';

/** Per-verse progress, kept on the device (local-first). */
export interface VerseProgress {
  stage: LearnStage;
  /** Graded outcomes. Total attempts is `successes + failures`. */
  successes: number;
  failures: number;
  /** 0..100. Moves only through `recordAttempt` (schedule.ts). */
  masteryScore: number;
  /** ISO instant. When this verse is next due for review; null = never scheduled. */
  nextDueAt: string | null;
  /** ISO instant. Written on every attempt; orders the not-yet-due fill draw. */
  lastReviewedAt: string | null;
  /** ISO instant. Non-null: the last verdict was a failure not yet made good. */
  lapsedAt: string | null;
}

/** Verse id -> progress. */
export type ProgressMap = Record<string, VerseProgress>;

/** One step of a day's session: a verse and the trainer to open. */
export interface SessionItem {
  verseId: string;
  stage: StageSlug;
}

/** What a trainer submits as its answer for grading. */
export type StepAnswer =
  | { kind: 'chunk-order'; order: number[] }
  | { kind: 'recall'; transcript: string; chunkPosition?: number };

export interface GradeResult {
  passed: boolean;
  matchPct: number;
  /** Set when the submission was malformed rather than merely wrong. */
  error?: string;
}

/** The Chinese script the library is shown in. Grading always runs on simplified text. */
export type ChineseScript = 'simplified' | 'traditional';
