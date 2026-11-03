/**
 * The phonetic key both sides of every recital comparison are scored on.
 *
 * One abstraction, two languages: Mandarin toneless pinyin and Cantonese
 * toneless jyutping. The same keyer must run on the same expected text on every
 * path, or a correct recital lands on the error screen after the step was
 * already posted — see `SpeechKeyer` below and the client/server symmetry test.
 *
 * TABLE BACKEND. Readings come from the generated tables in `data/mandarin.ts`
 * and `data/cantonese.ts` (toneless reading -> the simplified characters read
 * that way), inverted once, lazily, into a char -> reading map. A character has
 * exactly ONE reading, so context-dependent polyphones are fixed (了 = le,
 * 的 = de, 长 = chang, 行 = xing …). Both sides of a comparison use the same
 * table, so a correct recital always matches itself. A code point absent from
 * the table is its own token, which keeps the 1:1 code-point invariant.
 *
 * Pure module: no React, no native modules, no network.
 *
 * Punctuation regexes live here, not in pinyinDiff, so pinyinDiff can import
 * the default keyer without a cycle.
 */

import { CANTONESE_READINGS } from './data/cantonese';
import { MANDARIN_READINGS } from './data/mandarin';
import { loadSimplifiedNormalizer, type NormalizeFn } from './normalize';
import {
  DEFAULT_SPEECH_LANGUAGE,
  SpeechKeyerUnavailableError,
  type SpeechLanguage,
} from './types';

export const ZH_PUNCTUATION = /[，。？！；：""''、…—《》〈〉【】「」『』·～·︒]/g;
export const ZH_PUNCTUATION_CHAR = /[，。？！；：""''、…—《》〈〉【】「」『』·～·︒]/;

export function stripZhPunctuation(text: string): string {
  return text.replace(ZH_PUNCTUATION, '');
}

/**
 * A language's phonetic key.
 *
 * INVARIANT (load-bearing, asserted at construction by `assertKeyerInvariant`
 * and by the speech-language tests): both `normalize` and `tokens` are 1:1 on
 * code points.
 *   Array.from(normalize(s)).length === Array.from(s).length
 *   tokens(stripped).length === Array.from(stripped).length, all non-empty
 *   normalize preserves each code point's punctuation and whitespace class
 * `diffHanzi` indexes token positions straight into character arrays; a single
 * dropped or added token shifts every later index and silently repaints the
 * whole diff while still returning a plausible-looking matchPct.
 */
export interface SpeechKeyer {
  language: SpeechLanguage;
  /** Traditional → simplified (identity for `MANDARIN_SYNC_KEYER`). */
  normalize: NormalizeFn;
  /** One non-empty token per code point of an already-stripped string. */
  tokens: (stripped: string) => string[];
  /** normalize, THEN strip, THEN tokenise — `diffHanzi` uses the same order. */
  key: (text: string) => string;
}

/**
 * Variant characters read like the character a recital actually means. OpenCC
 * converts 瞭 -> 了 only inside phrases (明瞭), so the character-level T2S table
 * leaves a traditional 顯明瞭 as 瞭 (liao); in a 和合本 recital it only ever
 * stands for 了. SCRIPT_OVERRIDES cannot carry it (the seed must stay untouched by
 * the override map), so the keyers alias the reading instead.
 */
const READING_ALIASES: readonly (readonly [string, string])[] = [['瞭', '了']];

const readingMaps = new Map<SpeechLanguage, Map<string, string>>();

/** Invert a readings table (reading -> characters) into char -> reading, once. */
function readingMap(language: SpeechLanguage): Map<string, string> {
  const hit = readingMaps.get(language);
  if (hit) return hit;
  const table = language === 'cantonese' ? CANTONESE_READINGS : MANDARIN_READINGS;
  const map = new Map<string, string>();
  for (const reading of Object.keys(table)) {
    for (const ch of Array.from(table[reading] ?? '')) {
      // A character listed under two readings keeps the first.
      if (!map.has(ch)) map.set(ch, reading);
    }
  }
  for (const [variant, base] of READING_ALIASES) {
    const reading = map.get(base);
    if (reading !== undefined) map.set(variant, reading);
  }
  readingMaps.set(language, map);
  return map;
}

/**
 * One token per code point: its reading if the table has one, otherwise the
 * code point itself (punctuation, Latin, digits, whitespace and unmapped glyphs
 * pass through verbatim: '神abc爱' -> ['shen','a','b','c','ai'], a space stays
 * ' '). It never emits an empty token, so no `.filter(Boolean)` is needed; one
 * would only mask a violation.
 */
function tokensFor(language: SpeechLanguage): (stripped: string) => string[] {
  return (stripped) => {
    const map = readingMap(language);
    return Array.from(stripped, (ch) => map.get(ch) ?? ch);
  };
}

const mandarinTokens = tokensFor('mandarin');
const cantoneseTokens = tokensFor('cantonese');

function makeKey(normalize: NormalizeFn, tokens: (s: string) => string[]) {
  return (text: string) => tokens(stripZhPunctuation(normalize(text))).join(' ');
}

const identityNormalize: NormalizeFn = (text) => text;

/**
 * Mandarin tokens with IDENTITY normalisation (no traditional → simplified).
 * The default argument everywhere a keyer is optional, and the fallback
 * `loadSpeechKeyer('mandarin')` returns if the normalising keyer cannot be
 * built. Synchronous and dependency-free at runtime, so it can never fail.
 */
export const MANDARIN_SYNC_KEYER: SpeechKeyer = {
  language: 'mandarin',
  normalize: identityNormalize,
  tokens: mandarinTokens,
  key: makeKey(identityNormalize, mandarinTokens),
};

/**
 * Fixtures that exercise every way the 1:1 invariant has been observed to
 * break: Latin runs, digits, whitespace, a surrogate pair, an unmapped glyph,
 * and Cantonese-colloquial characters (which have no place in 和合本 text but
 * do appear in Whisper output).
 */
export const PROBE_FIXTURES: readonly string[] = [
  '神abc爱',
  '第3天',
  '我 爱 神',
  '🐑羊',
  '□神',
  '嘅係唔佢',
  '「神」，爱。',
];

/**
 * The ONE place the 1:1 invariant is asserted at runtime. Never inside
 * `diffHanzi`: in the trainers that runs only after the step has already been
 * posted.
 *
 * Code-point COUNT is not the whole contract. `diffHanzi` classifies each
 * expected code point (punctuation / whitespace / content) on the NORMALISED
 * string — that is what indexes the status array — while rendering the glyph
 * from the ORIGINAL. A normalisation that turned a content character into
 * punctuation, or the reverse, would keep the count and still render a status
 * against the wrong glyph, so the class is asserted per code point too.
 */
export function assertKeyerInvariant(keyer: SpeechKeyer): void {
  for (const fixture of PROBE_FIXTURES) {
    const normalized = keyer.normalize(fixture);
    if (Array.from(normalized).length !== Array.from(fixture).length) {
      throw new SpeechKeyerUnavailableError(
        `${keyer.language}: normalize changed the code-point count of ${JSON.stringify(fixture)}`,
      );
    }
    const sourceChars = Array.from(fixture);
    const normalizedChars = Array.from(normalized);
    for (let i = 0; i < sourceChars.length; i++) {
      if (ZH_PUNCTUATION_CHAR.test(sourceChars[i]!) !== ZH_PUNCTUATION_CHAR.test(normalizedChars[i]!)) {
        throw new SpeechKeyerUnavailableError(
          `${keyer.language}: normalize changed the punctuation class at ${i} of ${JSON.stringify(fixture)}`,
        );
      }
      if (/\s/.test(sourceChars[i]!) !== /\s/.test(normalizedChars[i]!)) {
        throw new SpeechKeyerUnavailableError(
          `${keyer.language}: normalize changed the whitespace class at ${i} of ${JSON.stringify(fixture)}`,
        );
      }
    }
    const stripped = stripZhPunctuation(normalized);
    const tokens = keyer.tokens(stripped);
    const chars = Array.from(stripped);
    if (tokens.length !== chars.length) {
      throw new SpeechKeyerUnavailableError(
        `${keyer.language}: ${tokens.length} tokens for ${chars.length} chars in ${JSON.stringify(fixture)}`,
      );
    }
    if (tokens.some((t) => !t)) {
      throw new SpeechKeyerUnavailableError(
        `${keyer.language}: empty token in ${JSON.stringify(fixture)}`,
      );
    }
  }
}

const loaders = new Map<SpeechLanguage, Promise<SpeechKeyer>>();
const loaded = new Map<SpeechLanguage, SpeechKeyer>();

async function buildMandarin(): Promise<SpeechKeyer> {
  // Mandarin CANNOT reject: a perfect recital must not be discarded because the
  // keyer failed to build. The worst case is the un-normalised comparator.
  //
  // Returning MANDARIN_SYNC_KEYER *is* the "degraded" signal `loadSpeechKeyer`
  // reads — it drops the memo on that identity so the next call retries. A
  // successful build below must therefore always be a fresh object.
  let normalize: NormalizeFn;
  try {
    normalize = await loadSimplifiedNormalizer();
  } catch (err) {
    console.error('[speech] normaliser unavailable, grading without it:', err);
    return MANDARIN_SYNC_KEYER;
  }
  const keyer: SpeechKeyer = {
    language: 'mandarin',
    normalize,
    tokens: mandarinTokens,
    key: makeKey(normalize, mandarinTokens),
  };
  try {
    assertKeyerInvariant(keyer);
  } catch (err) {
    console.error('[speech] mandarin keyer probe failed, grading without the normaliser:', err);
    return MANDARIN_SYNC_KEYER;
  }
  return keyer;
}

async function buildCantonese(): Promise<SpeechKeyer> {
  let normalize: NormalizeFn;
  try {
    normalize = await loadSimplifiedNormalizer();
  } catch (err) {
    throw new SpeechKeyerUnavailableError('cantonese keyer failed to load', { cause: err });
  }
  const keyer: SpeechKeyer = {
    language: 'cantonese',
    normalize,
    tokens: cantoneseTokens,
    key: makeKey(normalize, cantoneseTokens),
  };
  assertKeyerInvariant(keyer);
  return keyer;
}

/**
 * Load the keyer for `language`. Memoized per language; anything that is not a
 * successfully constructed keyer deletes the memo, so a later attempt retries.
 *
 * That covers both failure shapes. Only Cantonese can REJECT (with
 * `SpeechKeyerUnavailableError`); Mandarin instead RESOLVES with the degraded
 * `MANDARIN_SYNC_KEYER`, and memoizing that would pin the whole session to the
 * un-normalised comparator on one transient failure. `buildMandarin` returns
 * that shared object ONLY on the degraded path — a successful build always
 * constructs a fresh one — so identity is the sentinel.
 *
 * Concurrent callers share one in-flight Promise. Callers must await this
 * BEFORE spending ASR quota, and must treat a rejection as "no verdict, with a
 * visible notice" — never as a failed recital.
 */
export function loadSpeechKeyer(
  language: SpeechLanguage = DEFAULT_SPEECH_LANGUAGE,
): Promise<SpeechKeyer> {
  const existing = loaders.get(language);
  if (existing) return existing;
  const promise = (language === 'cantonese' ? buildCantonese() : buildMandarin())
    .then((keyer) => {
      if (keyer === MANDARIN_SYNC_KEYER) {
        // Degraded, not loaded: hand it back for this attempt (Mandarin must
        // never reject) but leave nothing memoized. `loaders.set` below runs
        // synchronously, before this callback, so the delete always lands.
        loaders.delete(language);
        return keyer;
      }
      loaded.set(language, keyer);
      return keyer;
    })
    .catch((err) => {
      loaders.delete(language);
      throw err;
    });
  loaders.set(language, promise);
  return promise;
}

/** The keyer for `language` if it has already been loaded, otherwise null. */
export function getLoadedSpeechKeyer(language: SpeechLanguage): SpeechKeyer | null {
  return loaded.get(language) ?? null;
}
