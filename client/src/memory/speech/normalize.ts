/**
 * Traditional → simplified normalisation for TRANSCRIPTS, backed by the
 * generated `data/t2s.ts` table (OpenCC's one-to-one character mappings).
 *
 * Why the grading path needs this at all: Whisper leans traditional for
 * Cantonese, and a phonetic table keyed on simplified characters reads the two
 * scripts differently (里/裡, 听/聽, 儿/兒, 种/種, 着/著, 于/於, 还/還 …). A
 * traditional transcript of a recital would otherwise mis-grade.
 *
 * The table was generated from OpenCC's Hong Kong variant ('hk'), which is the
 * measured choice: it drove the corpus mismatch to zero across three
 * traditional renderings and changed none of the already-simplified seed
 * strings, so it is safe to apply unconditionally to a transcript whose script
 * is unknown, which is exactly the Whisper case. (A Taiwan table would rewrite
 * 么 → 幺 and mis-key 什么, so it must never be swapped in.)
 *
 * The result must preserve code-point count — `SpeechKeyer`'s 1:1 token/char
 * invariant is what keeps `diffHanzi`'s index walk aligned. Here that holds by
 * construction: the table maps one code point to one code point and the
 * conversion is applied code point by code point.
 */

import { T2S } from './data/t2s';

export type NormalizeFn = (text: string) => string;

/**
 * Two characters OpenCC deliberately leaves alone, because both are legal
 * simplified characters in their own right (著作, 慰藉). In a 和合本 recital
 * they only ever stand for 着 / 借 — 因信…活着, 借着祷告 — and Whisper emits the
 * traditional-leaning forms often enough to matter. Safe only because the seed
 * contains neither 著 nor 藉 (nor 瞭 nor 幺); the speech-language tests assert
 * that, so the EXPECTED side can never be touched by this map.
 */
export const SCRIPT_OVERRIDES: Readonly<Record<string, string>> = {
  '著': '着',
  '藉': '借',
};

const CACHE_LIMIT = 4000;
const cache = new Map<string, string>();

function convert(text: string): string {
  let out = '';
  for (const ch of text) {
    const simplified = T2S[ch] ?? ch;
    out += SCRIPT_OVERRIDES[simplified] ?? simplified;
  }
  return out;
}

/** Traditional → simplified, 1:1 on code points. Synchronous; memoised. */
export function toSimplified(text: string): string {
  if (!text) return text;
  const hit = cache.get(text);
  if (hit !== undefined) return hit;
  const out = convert(text);
  if (cache.size >= CACHE_LIMIT) cache.clear();
  cache.set(text, out);
  return out;
}

let normalizer: NormalizeFn | null = null;

/**
 * Resolve the traditional → simplified normaliser. Async to keep the API
 * stable should a real library replace the table later.
 */
export function loadSimplifiedNormalizer(): Promise<NormalizeFn> {
  normalizer = toSimplified;
  return Promise.resolve(normalizer);
}

/** The normaliser if it has already been loaded, otherwise null. */
export function getSimplifiedNormalizer(): NormalizeFn | null {
  return normalizer;
}
