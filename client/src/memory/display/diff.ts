// What the Memory result screens draw, derived from the SAME alignment the grader scores with: the match
// percentage and the verdict are `compareRecital`'s own, and the per-character marks come from the grader's
// `align` over the keyer's per-character keys, so the picture can never disagree with the number beside it.
import type { ChineseScript, MemoryVerse } from '../types';
import { compareFullRecall } from '../speech/fullRecall';
import { MANDARIN_SYNC_KEYER, ZH_PUNCTUATION_CHAR, type SpeechKeyer } from '../speech/keyer';
import { align, compareRecital, dropWhitespaceTokens } from '../speech/pinyinDiff';

export type DiffOp =
  /** `heard !== char`: a sound-alike, and it counts. */
  | { kind: 'match'; char: string; heard: string }
  | { kind: 'sub'; char: string; heard: string }
  | { kind: 'del'; char: string }
  | { kind: 'ins'; heard: string }
  | { kind: 'punct'; char: string };

export interface DisplayDiff {
  ops: DiffOp[];
  matchPct: number;
  passed: boolean;
  /** `ok` includes `alike`. */
  counts: { ok: number; alike: number; wrong: number; miss: number; extra: number };
}

const isGap = (normalizedChar: string): boolean => ZH_PUNCTUATION_CHAR.test(normalizedChar) || /\s/.test(normalizedChar);

interface Side {
  /** The characters that reach the aligner, as given (before normalisation). */
  chars: string[];
  /** Their normalised forms. */
  norm: string[];
  /** One key per character: what the aligner compares. */
  keys: string[];
}

/** The grader's own preparation (see `diffHanzi`): normalise, strip punctuation, tokenise, drop whitespace tokens. */
function prepare(text: string, keyer: SpeechKeyer): Side {
  const original = Array.from(text);
  const normalized = Array.from(keyer.normalize(text));
  const kept: { orig: string; norm: string }[] = [];
  original.forEach((orig, i) => {
    const norm = normalized[i] ?? orig;
    if (!ZH_PUNCTUATION_CHAR.test(norm)) kept.push({ orig, norm });
  });
  const stripped = kept.map((k) => k.norm).join('');
  const tokens = keyer.tokens(stripped);
  const keyed = dropWhitespaceTokens(
    kept.map((k) => k.orig),
    tokens,
  );
  const norm = dropWhitespaceTokens(
    kept.map((k) => k.norm),
    tokens,
  ).chars;
  return { chars: keyed.chars, norm, keys: keyed.tokens };
}

/**
 * The grader's verdict and a drawable version of its alignment for `said` against `expected`.
 *
 * `char` on every op is the expected character as shown: from `shownExpected` (same length and positions
 * as `expected`, e.g. the Traditional chunk) when given, else `expected`. `heard` is the character as
 * said. A match whose two characters differ only in script (a Traditional answer to a Simplified verse)
 * is not a sound-alike, so its `heard` is the shown `char`. Expected-side punctuation and spaces come
 * back as `punct` ops in their places.
 */
export function displayDiff(
  said: string,
  expected: string,
  keyer: SpeechKeyer = MANDARIN_SYNC_KEYER,
  shownExpected?: string,
): DisplayDiff {
  const grade = compareRecital(said, expected, keyer);
  const exp = prepare(expected, keyer);
  const heard = prepare(said, keyer);

  // The expected string as shown, and which of its positions are punctuation/whitespace (classified on the
  // normalised string, as the grader does).
  const expectedChars = Array.from(expected);
  const expectedNorm = Array.from(keyer.normalize(expected));
  const shown = shownExpected === undefined ? expectedChars : Array.from(shownExpected);
  const shownAt = (i: number): string => shown[i] ?? expectedChars[i] ?? '';

  // For each aligned expected character, the shown glyph, and the punctuation that follows it.
  const glyphs: string[] = [];
  const tails: DiffOp[][] = [];
  const leading: DiffOp[] = [];
  expectedChars.forEach((orig, i) => {
    const norm = expectedNorm[i] ?? orig;
    if (isGap(norm)) {
      const punct: DiffOp = { kind: 'punct', char: shownAt(i) };
      (glyphs.length === 0 ? leading : tails[glyphs.length - 1]!).push(punct);
    } else {
      glyphs.push(shownAt(i));
      tails.push([]);
    }
  });
  // `exp.chars` counts only what the grader aligns; it must line up with `glyphs` (the keyer invariant).
  const glyphAt = (e: number): string => glyphs[e] ?? exp.chars[e] ?? '';

  const counts = { ok: 0, alike: 0, wrong: 0, miss: 0, extra: 0 };
  const ops: DiffOp[] = [...leading];
  for (const op of align(exp.keys, heard.keys)) {
    if (op.kind === 'match') {
      const char = glyphAt(op.e);
      const alike = exp.norm[op.e] !== heard.norm[op.t];
      counts.ok++;
      if (alike) counts.alike++;
      ops.push({ kind: 'match', char, heard: alike ? heard.chars[op.t]! : char });
    } else if (op.kind === 'sub') {
      counts.wrong++;
      ops.push({ kind: 'sub', char: glyphAt(op.e), heard: heard.chars[op.t]! });
    } else if (op.kind === 'del') {
      counts.miss++;
      ops.push({ kind: 'del', char: glyphAt(op.e) });
    } else {
      counts.extra++;
      ops.push({ kind: 'ins', heard: heard.chars[op.t]! });
    }
    if (op.kind !== 'ins') ops.push(...(tails[op.e] ?? []));
  }

  return { ops, matchPct: grade.matchPct, passed: grade.passed, counts };
}

export interface RecallDisplay {
  passed: boolean;
  body: DisplayDiff;
  bodyTranscript: string;
  referenceStatus: 'correct' | 'missing' | 'incorrect';
  /** The reference as heard (the text the grader took off the start or the end), trimmed; null when missing. */
  heardReference: string | null;
}

const isEdge = (ch: string): boolean => /[\s\p{P}]/u.test(ch) || ZH_PUNCTUATION_CHAR.test(ch);

function trimEdges(text: string): string {
  const chars = Array.from(text);
  let start = 0;
  let end = chars.length;
  while (start < end && isEdge(chars[start]!)) start++;
  while (end > start && isEdge(chars[end - 1]!)) end--;
  return chars.slice(start, end).join('');
}

/** Full-recall result: the grader's verdict, the body drawn against the verse, and the reference as heard. */
export function recallDisplay(
  transcript: string,
  verse: MemoryVerse,
  keyer: SpeechKeyer = MANDARIN_SYNC_KEYER,
  script: ChineseScript = 'simplified',
): RecallDisplay {
  const graded = compareFullRecall(transcript, verse.textZh, verse.referenceZh, keyer);
  const body = displayDiff(
    graded.bodyTranscript,
    verse.textZh,
    keyer,
    script === 'traditional' ? verse.textZhHant : undefined,
  );

  let heardReference: string | null = null;
  if (graded.referenceStatus !== 'missing') {
    // The grader only ever takes the reference off the trimmed transcript's start and/or end, leaving the
    // body in one piece between them, so what is left on either side of the body is the reference.
    const full = transcript.trim();
    const bodyAt = graded.bodyTranscript === '' ? -1 : full.indexOf(graded.bodyTranscript);
    const parts =
      bodyAt < 0
        ? [full]
        : [full.slice(0, bodyAt), full.slice(bodyAt + graded.bodyTranscript.length)];
    heardReference = parts.map(trimEdges).filter(Boolean).join(' ');
  }

  return {
    passed: graded.passed,
    body,
    bodyTranscript: graded.bodyTranscript,
    referenceStatus: graded.referenceStatus,
    heardReference,
  };
}

const BLANK = '＿';

/**
 * The hint text: each chunk (found in order in `text`) shows its first non-punctuation character, every
 * other non-punctuation character becomes `＿`, and punctuation and whitespace stay.
 */
export function hintMask(text: string, chunks: readonly string[]): string {
  const chars = Array.from(text);
  // Work in code-point indices: map each chunk to its code-point range in the text.
  const shown = new Set<number>();
  let searchFrom = 0; // a code-unit offset into `text`
  for (const chunk of chunks) {
    const at = text.indexOf(chunk, searchFrom);
    if (at < 0) continue;
    const start = Array.from(text.slice(0, at)).length;
    const length = Array.from(chunk).length;
    for (let i = start; i < start + length; i++) {
      if (!isGap(chars[i]!)) {
        shown.add(i);
        break;
      }
    }
    searchFrom = at + chunk.length;
  }
  return chars.map((ch, i) => (isGap(ch) || shown.has(i) ? ch : BLANK)).join('');
}
