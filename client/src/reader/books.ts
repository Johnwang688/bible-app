// The book catalogue: lookup, localised names and the query that loads it.
import { useQuery } from '@tanstack/react-query';

import { queryKeys, useApi } from '../api';
import type { BookInfo } from '../api/schemas';
import type { AppLocale } from '../i18n/types';
import { isChineseTranslation, type TranslationId } from './translations';

export function findBook(books: BookInfo[] | undefined, bookNumber: number): BookInfo | undefined {
  return books?.find((b) => b.book_number === bookNumber);
}

/** The name in the reader's translation: CUV traditional, CUV-SIMP simplified, others English. */
export function bookName(book: BookInfo, translation: TranslationId): string {
  if (isChineseTranslation(translation)) {
    const zh = translation === 'CUV' ? book.name_zh : book.name_zh_simplified;
    return zh || book.name;
  }
  return book.name;
}

/** The name in the interface language (there is no Traditional interface). */
export function bookNameForLocale(book: BookInfo, locale: AppLocale): string {
  return locale === 'zh-Hans' ? book.name_zh_simplified || book.name : book.name;
}

export function useBooks() {
  const api = useApi();
  return useQuery({
    queryKey: queryKeys.books(),
    queryFn: ({ signal }) => api.books({ signal }),
    staleTime: Infinity, // content never changes within a build
  });
}
