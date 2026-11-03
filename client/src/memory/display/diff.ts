// What the Memory result screens draw, derived from the SAME alignment the grader scores with: the match
// percentage and the verdict are `compareRecital`'s own, and the per-character marks come from the grader's
// `align` over the keyer's per-character keys, so the picture can never disagree with the number beside it.
import type { ChineseScript, LibraryVerse, MemoryVerse } from '../types';
import type { VerseLanguage } from '../verseLanguage';
import { compareEnglishFullRecall, compareEnglishRecital, englishTokens, sameEnglishWord } from '../speech/english';
import { compareFullRecall } from '../speech/fullRecall';
import { MANDARIN_SYNC_KEYER, ZH_PUNCTUATION_CHAR, type SpeechKeyer } from '../speech/keyer';
import { align, compareRecital, dropWhitespaceTokens } from '../speech/pinyinDiff';

export type DiffOp =
  /** `heard !== char`: a sound-alike (in English, a one-letter slip), and it counts. */
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
      const said = heard.chars[op.t]!;
      // A sound-alike only when the said glyph really differs from the shown one, so counts and ops agree.
      const alike = exp.norm[op.e] !== heard.norm[op.t] && said !== char;
      counts.ok++;
      if (alike) counts.alike++;
      ops.push({ kind: 'match', char, heard: alike ? said : char });
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

/** True when `text` is nothing but edge characters, or one reference the grader would take whole. */
function isOnlyReference(text: string, verse: MemoryVerse, keyer: SpeechKeyer): boolean {
  if (trimEdges(text) === '') return true;
  const graded = compareFullRecall(text, verse.textZh, verse.referenceZh, keyer);
  return graded.bodyTranscript === '' && graded.referenceStatus !== 'missing';
}

/**
 * The reference(s) the grader took off `full` (its trimmed transcript), leaving `body` in one piece between
 * them. The body can also occur inside a title, so the cut is the occurrence whose left and right are each
 * nothing but a reference; an empty body is cut at the split where both halves are.
 */
function referenceAround(full: string, body: string, verse: MemoryVerse, keyer: SpeechKeyer): string {
  const split = (at: number): string[] => [full.slice(0, at), full.slice(at + body.length)];
  let best: string[] = [full];
  let bestFilled = 0;
  for (let at = full.indexOf(body); at >= 0; at = full.indexOf(body, at + 1)) {
    const parts = split(at);
    if (parts.every((part) => isOnlyReference(part, verse, keyer))) {
      // Two references around an empty body can be cut anywhere between them; keep the cut that separates them.
      const filled = parts.filter((part) => trimEdges(part) !== '').length;
      if (filled > bestFilled) {
        best = parts;
        bestFilled = filled;
      }
    }
    if (at >= full.length) break;
  }
  return best.map(trimEdges).filter(Boolean).join(' ');
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
    heardReference = referenceAround(transcript.trim(), graded.bodyTranscript, verse, keyer);
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
 * other non-punctuation character becomes `＿`, and punctuation and whitespace stay. In English every word shows its
 * first letter and the rest become `_` (`T________ i_ a_____`), punctuation and spaces kept.
 */
export function hintMask(text: string, chunks: readonly string[], language: VerseLanguage = 'zh'): string {
  if (language === 'en') {
    // A word with an apostrophe inside (God’s) is one word: only its first letter shows.
    return text.replace(/[\p{L}\p{M}\p{N}]+(?:['’‘ʼ][\p{L}\p{M}\p{N}]+)*/gu, (word) => {
      const [head = '', ...rest] = Array.from(word);
      return head + rest.map((ch) => (/['’‘ʼ]/.test(ch) ? ch : '_')).join('');
    });
  }
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

// ---------------------------------------------------------------------------------------------------------
// English
// ---------------------------------------------------------------------------------------------------------

/**
 * The English analogue of `displayDiff`: the word alignment the English grader scores with (`align` with
 * `sameEnglishWord`), drawn on the expected text as written. Each op's `char` is the expected word as shown; the
 * spaces and punctuation between words come back as `punct` ops in their places, so the non-`ins` ops spell out
 * `expected` exactly. A match whose words differ (a one-letter slip) carries the said word in `heard`; a sub carries
 * the said word; an ins is a said word with no counterpart. `matchPct` and `passed` are `compareEnglishRecital`'s.
 *
 * A number written in digits is several words to the grader (`10,000` -> ten thousand): its text is drawn on the
 * first of them, the others draw nothing.
 */
export function englishDisplayDiff(said: string, expected: string): DisplayDiff {
  const grade = compareEnglishRecital(said, expected);
  const exp = englishTokens(expected);
  const heard = englishTokens(said);

  const charAt = (e: number): string => {
    const tok = exp[e]!;
    return tok.first ? expected.slice(tok.start, tok.end) : '';
  };
  /** The text after expected word `e` up to the next run, when `e` ends its run. */
  const tailAt = (e: number): DiffOp[] => {
    const tok = exp[e]!;
    const next = exp[e + 1];
    if (next && next.start === tok.start) return [];
    const end = next ? next.start : expected.length;
    return end > tok.end ? [{ kind: 'punct', char: expected.slice(tok.end, end) }] : [];
  };
  const heardAt = (t: number): string => {
    const tok = heard[t]!;
    const sameRun = (heard[t - 1]?.start ?? -1) === tok.start || (heard[t + 1]?.start ?? -1) === tok.start;
    return sameRun ? tok.word : said.slice(tok.start, tok.end);
  };

  const counts = { ok: 0, alike: 0, wrong: 0, miss: 0, extra: 0 };
  const ops: DiffOp[] = [];
  const leadEnd = exp[0]?.start ?? expected.length;
  if (leadEnd > 0) ops.push({ kind: 'punct', char: expected.slice(0, leadEnd) });

  const aligned = align(
    exp.map((t) => t.word),
    heard.map((t) => t.word),
    sameEnglishWord,
  );
  for (const op of aligned) {
    if (op.kind === 'match') {
      const char = charAt(op.e);
      const slip = exp[op.e]!.word !== heard[op.t]!.word && char !== '';
      counts.ok++;
      if (slip) counts.alike++;
      ops.push({ kind: 'match', char, heard: slip ? heardAt(op.t) : char });
    } else if (op.kind === 'sub') {
      counts.wrong++;
      ops.push({ kind: 'sub', char: charAt(op.e), heard: heardAt(op.t) });
    } else if (op.kind === 'del') {
      counts.miss++;
      ops.push({ kind: 'del', char: charAt(op.e) });
    } else {
      counts.extra++;
      ops.push({ kind: 'ins', heard: heardAt(op.t) });
    }
    if (op.kind !== 'ins') ops.push(...tailAt(op.e));
  }

  return { ops, matchPct: grade.matchPct, passed: grade.passed, counts };
}

/** The display diff for a verse language: `englishDisplayDiff` in English, else `displayDiff`. */
export function displayDiffFor(
  language: VerseLanguage,
  said: string,
  expected: string,
  keyer: SpeechKeyer = MANDARIN_SYNC_KEYER,
  shownExpected?: string,
): DisplayDiff {
  return language === 'en' ? englishDisplayDiff(said, expected) : displayDiff(said, expected, keyer, shownExpected);
}

/**
 * The English full-recall result: the English grader's verdict, the body drawn against `textEn` word by word, and
 * the reference as the grader took it off the start or the end.
 */
export function englishRecallDisplay(transcript: string, verse: LibraryVerse): RecallDisplay {
  const graded = compareEnglishFullRecall(transcript, verse.textEn, verse.referenceEn);
  return {
    passed: graded.passed,
    body: englishDisplayDiff(graded.bodyTranscript, verse.textEn),
    bodyTranscript: graded.bodyTranscript,
    referenceStatus: graded.referenceStatus,
    heardReference: graded.heardReference,
  };
}

/** The full-recall result for a verse language: `englishRecallDisplay` in English, else `recallDisplay`. */
export function recallDisplayFor(
  language: VerseLanguage,
  transcript: string,
  verse: LibraryVerse,
  keyer: SpeechKeyer = MANDARIN_SYNC_KEYER,
  script: ChineseScript = 'simplified',
): RecallDisplay {
  return language === 'en' ? englishRecallDisplay(transcript, verse) : recallDisplay(transcript, verse, keyer, script);
}
