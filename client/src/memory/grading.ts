/**
 * Grading for a single lesson step. The trainers grade locally — they need the
 * per-character diff to show what went wrong — and this module's verdict is the
 * one that decides whether the day advances.
 *
 * Every path calls the same pure comparators (`compareRecital` plus a
 * `SpeechKeyer`, chunk position equality), so a genuine pass here always matches
 * the pass the user just saw — provided the caller threads through the SAME
 * keyer the trainer graded with. The expected side is keyed at runtime from the
 * verse's simplified text. English (`language` 'en') grades the English chunks
 * and text word by word (`speech/english.ts`); the keyer is not used there.
 *
 * Pure module: no React, no native modules.
 */

import { getMemoryVerse } from './library';
import { compareEnglishFullRecall, compareEnglishRecital } from './speech/english';
import { compareFullRecall } from './speech/fullRecall';
import { MANDARIN_SYNC_KEYER, type SpeechKeyer } from './speech/keyer';
import { compareRecital, PASS_THRESHOLD_PCT } from './speech/pinyinDiff';
import type { GradeResult, LibraryVerse, StageSlug, StepAnswer } from './types';
import type { VerseLanguage } from './verseLanguage';

const REJECT = (error: string): GradeResult => ({ passed: false, matchPct: 0, error });

/** Longest transcript we'll grade — the longest verse is well under this. */
const MAX_TRANSCRIPT_CHARS = 2_000;

/**
 * Grade `answer` for `verseId` at `stage`. Returns `passed: false` for both a
 * wrong answer and an unusable submission; the caller only records the step
 * when `passed` is true, so the distinction matters for the message, not the
 * outcome.
 */
export function gradeStep(
  verseId: string,
  stage: StageSlug,
  answer: unknown,
  keyer: SpeechKeyer = MANDARIN_SYNC_KEYER,
  language: VerseLanguage = 'zh',
): GradeResult {
  const verse = getMemoryVerse(verseId);
  if (!verse) return REJECT(`unknown verse ${verseId}`);
  if (!answer || typeof answer !== 'object') return REJECT('missing answer');

  const a = answer as StepAnswer;

  switch (stage) {
    case 'chunk-order':
      // Language-blind by construction: a permutation check has no phonetics.
      return gradeChunkOrder(verse, a, language);
    case 'fill-blank':
      return gradeFillBlank(verse, a, keyer, language);
    case 'full-recall':
      return gradeFullRecall(verse, a, keyer, language);
    default:
      return REJECT(`unknown stage ${String(stage)}`);
  }
}

/**
 * The submitted order is the canonical position of each chunk as the user left
 * it, top to bottom. A correct solve is the identity permutation.
 */
function gradeChunkOrder(verse: LibraryVerse, answer: StepAnswer, language: VerseLanguage): GradeResult {
  if (answer.kind !== 'chunk-order') return REJECT('expected a chunk-order answer');
  const { order } = answer;
  const count = language === 'en' ? verse.chunksEn.length : verse.chunks.length;
  if (!Array.isArray(order) || order.length !== count) {
    return REJECT('order must list every chunk exactly once');
  }
  const correct = order.every((pos, idx) => pos === idx);
  return { passed: correct, matchPct: correct ? 100 : 0 };
}

/** One hidden chunk, recited aloud. Graded against that chunk's reading (or, in English, its words). */
function gradeFillBlank(verse: LibraryVerse, answer: StepAnswer, keyer: SpeechKeyer, language: VerseLanguage): GradeResult {
  if (answer.kind !== 'recall') return REJECT('expected a recall answer');
  const { chunkPosition } = answer;
  const chunks = language === 'en' ? verse.chunksEn : verse.chunks;
  if (
    typeof chunkPosition !== 'number' ||
    !Number.isInteger(chunkPosition) ||
    chunkPosition < 0 ||
    chunkPosition >= chunks.length
  ) {
    return REJECT('chunkPosition is outside the verse');
  }
  // A chunk's position is its index in `verse.chunks` (`verse.chunksEn` in English).
  const chunk = chunks[chunkPosition];
  if (chunk === undefined) return REJECT('chunkPosition is outside the verse');
  return gradeTranscript(answer.transcript, chunk, keyer, language);
}

/** The whole verse, with its reference at the beginning or end. */
function gradeFullRecall(verse: LibraryVerse, answer: StepAnswer, keyer: SpeechKeyer, language: VerseLanguage): GradeResult {
  if (answer.kind !== 'recall') return REJECT('expected a recall answer');
  const transcript = answer.transcript;
  if (typeof transcript !== 'string') return REJECT('transcript must be a string');
  const trimmed = transcript.trim();
  if (!trimmed) return { passed: false, matchPct: 0 };
  if (trimmed.length > MAX_TRANSCRIPT_CHARS) return REJECT('transcript is too long');
  const result =
    language === 'en'
      ? compareEnglishFullRecall(trimmed, verse.textEn, verse.referenceEn)
      : compareFullRecall(trimmed, verse.textZh, verse.referenceZh, keyer);
  return { passed: result.passed, matchPct: result.body.matchPct };
}

function gradeTranscript(
  transcript: unknown,
  expected: string,
  keyer: SpeechKeyer,
  language: VerseLanguage,
): GradeResult {
  if (typeof transcript !== 'string') return REJECT('transcript must be a string');
  const trimmed = transcript.trim();
  if (!trimmed) return { passed: false, matchPct: 0 };
  if (trimmed.length > MAX_TRANSCRIPT_CHARS) return REJECT('transcript is too long');

  const result = language === 'en' ? compareEnglishRecital(trimmed, expected) : compareRecital(trimmed, expected, keyer);
  return { passed: result.passed, matchPct: result.matchPct };
}

export { PASS_THRESHOLD_PCT };
