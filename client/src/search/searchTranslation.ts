// Which translation a search runs in. The backend indexes one translation per call, and its index is per
// language, so a Chinese query must search a Chinese translation and an English query an English one.
import { isChineseTranslation, type TranslationId } from '../reader/translations';

/** True when `s` contains a CJK Unified Ideograph (BMP blocks and the supplementary ideograph planes). */
const CJK = /[㐀-鿿豈-﫿\u{20000}-\u{3FFFF}]/u;

export function hasCjk(s: string): boolean {
  return CJK.test(s);
}

/**
 * The translation to search: the first of `first` and `second` in the query's language. Falls back to
 * CUV-SIMP for Chinese and BSB for English when neither is.
 */
export function searchTranslation(query: string, first: TranslationId, second: TranslationId | null): TranslationId {
  const wantChinese = hasCjk(query);
  const candidates = [first, second].filter((t): t is TranslationId => t !== null);
  const match = candidates.find((t) => isChineseTranslation(t) === wantChinese);
  if (match) return match;
  return wantChinese ? 'CUV-SIMP' : 'BSB';
}
