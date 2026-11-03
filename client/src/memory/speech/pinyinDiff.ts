import {
  MANDARIN_SYNC_KEYER,
  stripZhPunctuation,
  ZH_PUNCTUATION_CHAR,
  type SpeechKeyer,
} from './keyer';

/**
 * The comparator is language-parameterised through a `SpeechKeyer`. The keyer
 * IDENTITY is what must match between client and server: both sides key the
 * same expected text with the same keyer, or a correct recital shows the user a
 * pass and is then failed by the server's re-grade. Omitting the argument gives
 * `MANDARIN_SYNC_KEYER`, which is byte-for-byte the pre-Cantonese behaviour.
 */

export interface DiffToken {
  token: string;
  status: 'match' | 'extra' | 'missing';
}

export interface HanziDiffChar {
  char: string;
  // 'correct'  — expected char user got right
  // 'wrong'    — expected char user mis-said or skipped
  // 'extra'    — transcribed char with no expected counterpart (user said an extra word)
  // 'skip'     — punctuation / whitespace, render neutral
  status: 'correct' | 'wrong' | 'extra' | 'skip';
}

export interface PinyinComparison {
  matchPct: number;           // 0..100
  passed: boolean;             // matchPct >= PASS_THRESHOLD_PCT
  transcribedPinyin: string;   // space-separated toneless pinyin of transcribed text
  expectedTokens: string[];
  transcribedTokens: string[];
  diffTokens: DiffToken[];     // ordered, suitable for rendering
}

export const PASS_THRESHOLD_PCT = 80;

/**
 * Convert a hanzi string to a space-separated toneless pinyin string.
 * Punctuation is stripped first so it doesn't produce empty tokens.
 */
export function hanziToTonelessPinyin(hanzi: string): string {
  return MANDARIN_SYNC_KEYER.key(hanzi);
}

const splitKey = (key: string): string[] => key.split(/\s+/).filter(Boolean);

// ── Alignment ────────────────────────────────────────────────────────────────

export type Op =
  | { kind: 'match'; e: number; t: number }
  | { kind: 'sub';   e: number; t: number }
  | { kind: 'del';   e: number }
  | { kind: 'ins';   t: number };

/**
 * Needleman–Wunsch alignment of two token sequences. Scoring: match=+1,
 * substitution/deletion/insertion=0. Returns ops in left-to-right order.
 *
 * This is what lets a stray "umm" or a skipped character stay locally
 * scoped — surrounding tokens still match instead of cascading red.
 *
 * Tie-break preference in backtrack: match > sub > del/ins. Preferring sub
 * over a del+ins pair keeps the natural "you said the wrong word here"
 * read in the common single-mistake case.
 */
export function align(expected: string[], transcribed: string[]): Op[] {
  const m = expected.length;
  const n = transcribed.length;
  const dp: number[][] = Array.from({ length: m + 1 }, () => new Array(n + 1).fill(0));
  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      const matchBonus = expected[i - 1] === transcribed[j - 1] ? 1 : 0;
      dp[i]![j] = Math.max(
        dp[i - 1]![j - 1]! + matchBonus,
        dp[i - 1]![j]!,
        dp[i]![j - 1]!,
      );
    }
  }

  const ops: Op[] = [];
  let i = m;
  let j = n;
  while (i > 0 && j > 0) {
    const isMatch = expected[i - 1] === transcribed[j - 1];
    const diag = dp[i - 1]![j - 1]! + (isMatch ? 1 : 0);
    const up = dp[i - 1]![j]!;
    const left = dp[i]![j - 1]!;
    if (isMatch && diag >= up && diag >= left) {
      ops.push({ kind: 'match', e: i - 1, t: j - 1 });
      i--; j--;
    } else if (!isMatch && diag >= up && diag >= left) {
      ops.push({ kind: 'sub', e: i - 1, t: j - 1 });
      i--; j--;
    } else if (up >= left) {
      ops.push({ kind: 'del', e: i - 1 });
      i--;
    } else {
      ops.push({ kind: 'ins', t: j - 1 });
      j--;
    }
  }
  while (i > 0) { ops.push({ kind: 'del', e: i - 1 }); i--; }
  while (j > 0) { ops.push({ kind: 'ins', t: j - 1 }); j--; }
  ops.reverse();
  return ops;
}

/**
 * Compare a transcribed hanzi string against a pre-computed toneless-pinyin
 * expected string (as stored in expected_pinyin on SeedChunk / MockChunk).
 *
 * Uses Needleman–Wunsch alignment so local insertions/deletions don't cascade.
 *   - matchPct = (#match) / max(expected.length, transcribed.length) * 100.
 *     Extras and missing both shrink the score by hitting the denominator.
 *   - Edge case: either side empty → 0% (avoid false-positive on silence).
 */
export function comparePinyin(
  transcribedHanzi: string,
  expectedTonelessPinyin: string,
): PinyinComparison {
  const transcribedPinyin = hanziToTonelessPinyin(transcribedHanzi);
  return compareTokens(
    splitKey(expectedTonelessPinyin),
    splitKey(transcribedPinyin),
    transcribedPinyin,
  );
}

/**
 * The one expected-side source. Keys BOTH sides from raw hanzi with the same
 * keyer, so Mandarin and Cantonese share exactly one code path and the
 * precomputed Mandarin `expected_pinyin` column never enters grading.
 *
 * With the keyer omitted this is byte-identical to
 * `comparePinyin(t, hanziToTonelessPinyin(e))` — asserted over the whole seed
 * by tests/speech-language.ts S11.
 */
export function compareRecital(
  transcribedHanzi: string,
  expectedHanzi: string,
  keyer: SpeechKeyer = MANDARIN_SYNC_KEYER,
): PinyinComparison {
  const transcribedPinyin = keyer.key(transcribedHanzi);
  return compareTokens(
    splitKey(keyer.key(expectedHanzi)),
    splitKey(transcribedPinyin),
    transcribedPinyin,
  );
}

function compareTokens(
  expectedTokens: string[],
  transcribedTokens: string[],
  transcribedPinyin: string,
): PinyinComparison {
  if (expectedTokens.length === 0 || transcribedTokens.length === 0) {
    const diffTokens: DiffToken[] = [
      ...expectedTokens.map((t) => ({ token: t, status: 'missing' as const })),
      ...transcribedTokens.map((t) => ({ token: t, status: 'extra' as const })),
    ];
    return {
      matchPct: 0,
      passed: false,
      transcribedPinyin,
      expectedTokens,
      transcribedTokens,
      diffTokens,
    };
  }

  const ops = align(expectedTokens, transcribedTokens);

  const diffTokens: DiffToken[] = [];
  let matchCount = 0;
  for (const op of ops) {
    if (op.kind === 'match') {
      matchCount++;
      diffTokens.push({ token: expectedTokens[op.e]!, status: 'match' });
    } else if (op.kind === 'sub') {
      diffTokens.push({ token: expectedTokens[op.e]!, status: 'missing' });
      diffTokens.push({ token: transcribedTokens[op.t]!, status: 'extra' });
    } else if (op.kind === 'del') {
      diffTokens.push({ token: expectedTokens[op.e]!, status: 'missing' });
    } else {
      diffTokens.push({ token: transcribedTokens[op.t]!, status: 'extra' });
    }
  }

  const maxLen = Math.max(expectedTokens.length, transcribedTokens.length);
  const matchPct = (matchCount / maxLen) * 100;
  const passed = matchPct >= PASS_THRESHOLD_PCT;

  return {
    matchPct,
    passed,
    transcribedPinyin,
    expectedTokens,
    transcribedTokens,
    diffTokens,
  };
}

/**
 * Per-character hanzi diff for display. Uses the same alignment as
 * `comparePinyin` so a single inserted or skipped char stays localised.
 *
 * Walks the expected verse char-by-char preserving punctuation. Inserts
 * 'extra' entries between expected chars at the position where the user
 * said a word that wasn't in the verse (so the score change is visible).
 *
 * Both inputs are normalised by the keyer FIRST and every char/token/status
 * array is derived from the normalised strings, so a traditional transcript
 * aligns against the simplified verse and its extras render as simplified
 * glyphs. The rendered expected glyphs are the ORIGINAL `expectedHanzi` — safe
 * because the keyer's normalise is 1:1 on code points AND preserves each code
 * point's punctuation/whitespace class (`assertKeyerInvariant`); every
 * CLASSIFICATION here is made on the normalised string, the one that indexes
 * the status array.
 *
 * Whitespace tokens are dropped from both aligned arrays, because
 * `compareRecital` drops them too: it keys through `join(' ')` and splits on
 * /\s+/, so a space never reaches its aligner. Keeping them here would align a
 * different pair of sequences and let the rendered diff disagree with the
 * `matchPct` shown beside it.
 *
 * This function never throws and carries no invariant assertion: it runs during
 * the landing page's server render (VerifyCard) and, in the trainers, only
 * after the step has already been posted. The invariant is enforced once, at
 * keyer construction (`assertKeyerInvariant`).
 */
export function diffHanzi(
  transcribedHanzi: string,
  expectedHanzi: string,
  keyer: SpeechKeyer = MANDARIN_SYNC_KEYER,
): HanziDiffChar[] {
  const expectedText = keyer.normalize(expectedHanzi);
  const transcribedText = keyer.normalize(transcribedHanzi);

  const expectedStripped = stripZhPunctuation(expectedText);
  const transcribedStripped = stripZhPunctuation(transcribedText);

  const expected = dropWhitespaceTokens(
    Array.from(expectedStripped),
    keyer.tokens(expectedStripped),
  );
  const transcribed = dropWhitespaceTokens(
    Array.from(transcribedStripped),
    keyer.tokens(transcribedStripped),
  );

  const expectedChars = expected.chars;
  const transcribedChars = transcribed.chars;

  const ops = align(expected.tokens, transcribed.tokens);

  // Per-expected-position status, and a sidecar map of extras keyed by the
  // expected position they precede in the rendered output (anchor = the
  // expected index that comes right after the extra). Trailing extras
  // anchor at expectedChars.length.
  const expectedStatus = new Array<'correct' | 'wrong'>(expectedChars.length);
  const extrasBefore = new Map<number, string[]>();
  const pushExtra = (anchor: number, ch: string) => {
    const arr = extrasBefore.get(anchor) ?? [];
    arr.push(ch);
    extrasBefore.set(anchor, arr);
  };

  let nextExpected = 0;
  for (const op of ops) {
    if (op.kind === 'match') {
      expectedStatus[op.e] = 'correct';
      nextExpected = op.e + 1;
    } else if (op.kind === 'sub') {
      expectedStatus[op.e] = 'wrong';
      nextExpected = op.e + 1;
      // Show what the user actually said right after the wrong char.
      pushExtra(nextExpected, transcribedChars[op.t]!);
    } else if (op.kind === 'del') {
      expectedStatus[op.e] = 'wrong';
      nextExpected = op.e + 1;
    } else {
      pushExtra(nextExpected, transcribedChars[op.t]!);
    }
  }

  const out: HanziDiffChar[] = [];
  const flushExtras = (idx: number) => {
    const extras = extrasBefore.get(idx);
    if (!extras) return;
    for (const c of extras) out.push({ char: c, status: 'extra' });
  };

  // Walk the NORMALISED expected string — the one `expectedStatus` is indexed
  // from — and render the ORIGINAL glyph at the same code-point offset. The
  // keyer's normalise is 1:1 and class-preserving, so the two walk in step; the
  // `?? normalizedCh` is belt-and-braces for a keyer that broke that contract
  // after construction.
  const originalChars = Array.from(expectedHanzi);
  let nonPunctIdx = 0;
  Array.from(expectedText).forEach((normalizedCh, i) => {
    const ch = originalChars[i] ?? normalizedCh;
    if (ZH_PUNCTUATION_CHAR.test(normalizedCh) || /\s/.test(normalizedCh)) {
      out.push({ char: ch, status: 'skip' });
      return;
    }
    flushExtras(nonPunctIdx);
    out.push({ char: ch, status: expectedStatus[nonPunctIdx] ?? 'wrong' });
    nonPunctIdx++;
  });
  flushExtras(expectedChars.length);

  return out;
}

/**
 * Keep only the positions whose token survives `compareRecital`'s
 * `join(' ')` / split-on-/\s+/ round trip, dropping the matching characters so
 * token index and char index stay aligned. Per the keyer invariant a token is
 * whitespace exactly when its code point is, so this drops whole positions, not
 * halves of one.
 */
export function dropWhitespaceTokens(
  chars: string[],
  tokens: string[],
): { chars: string[]; tokens: string[] } {
  const outChars: string[] = [];
  const outTokens: string[] = [];
  for (let i = 0; i < tokens.length; i++) {
    const token = tokens[i];
    if (!token || !token.trim()) continue;
    outChars.push(chars[i] ?? '');
    outTokens.push(token);
  }
  return { chars: outChars, tokens: outTokens };
}
