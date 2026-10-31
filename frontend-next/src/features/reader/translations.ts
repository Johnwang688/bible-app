import type { BookInfo, Translation } from '@/features/reader/types';

/** Not offered in the translation picker (may still appear in stored history / API). */
export const TRANSLATION_PICKER_EXCLUDED_IDS = new Set(['KJV', 'BSB']);

export function filterTranslationsForPicker(list: Translation[]): Translation[] {
  return list.filter(t => !TRANSLATION_PICKER_EXCLUDED_IDS.has(t.id.toUpperCase()));
}

export function normalizeTranslationChoice(id: string): string {
  return TRANSLATION_PICKER_EXCLUDED_IDS.has(id.toUpperCase()) ? 'WEB' : id;
}

export function getChineseBookNameVariant(
  translationId: string,
  translationsById: Map<string, Translation>,
) {
  const upperId = translationId.toUpperCase();
  const language = translationsById.get(translationId)?.language;
  const upperName = translationsById.get(translationId)?.name.toUpperCase() ?? '';
  if (upperId.includes('SIMP') || upperName.includes('SIMPLIFIED')) return 'simplified';
  if (language === 'zh' || upperId === 'CUV' || upperId.includes('TRAD') || upperName.includes('TRADITIONAL')) {
    return 'traditional';
  }
  return null;
}

export function getTranslationDisplayId(translationId: string) {
  const upperId = translationId.toUpperCase();
  if (upperId === 'CUV' || upperId === 'CUV-TRAD' || upperId === 'CUV-SIMP') return 'CUV';
  return translationId;
}

/** Strips publication-year suffix from display where we prefer a shorter label (e.g. ASV). */
export function getTranslationDisplayName(translationId: string, name: string) {
  if (translationId.toUpperCase() !== 'ASV') return name;
  return name.replace(/\s*\(1901\)\s*$/i, '').replace(/\s+1901\s*$/i, '').trim();
}

export function getLocalizedBookName(
  book: Pick<BookInfo, 'name' | 'name_zh' | 'name_zh_simplified'> | null | undefined,
  translationId: string,
  translationsById: Map<string, Translation>,
) {
  if (!book) return '';
  const variant = getChineseBookNameVariant(translationId, translationsById);
  if (variant === 'simplified') return book.name_zh_simplified ?? book.name_zh ?? book.name;
  if (variant === 'traditional') return book.name_zh ?? book.name;
  return book.name;
}

export function getLocalizedBookNameFromRaw(
  rawBookName: string | null | undefined,
  translationId: string,
  booksByName: Map<string, BookInfo>,
  translationsById: Map<string, Translation>,
) {
  if (!rawBookName) return '';
  const book = booksByName.get(rawBookName.toLowerCase());
  return getLocalizedBookName(book ?? { name: rawBookName }, translationId, translationsById);
}
