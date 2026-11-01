// Chapter loading. The shown chapter is the query for the current position, keyed only by
// book, chapter and translation, so a late or failed request for another key can never show.
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { useEffect } from 'react';

import { queryKeys, useApi, type ApiClient } from '../api';
import type { BookInfo } from '../api/schemas';
import type { ReaderPosition } from '../storage/keys';
import { findBook } from './books';
import { nextPosition, prevPosition } from './navigation';
import type { TranslationId } from './translations';

export function chapterQueryOptions(api: ApiClient, book: BookInfo, chapter: number, translation: TranslationId) {
  return {
    queryKey: queryKeys.chapter(book.name, chapter, translation),
    queryFn: ({ signal }: { signal: AbortSignal }) => api.chapter(book.name, chapter, translation, { signal }),
    staleTime: Infinity,
  };
}

/** Options for a chapter that may not have a book yet. Never run while `enabled` is false. */
function optionsOrIdle(
  api: ApiClient,
  book: BookInfo | undefined,
  chapter: number,
  translation: TranslationId | undefined,
) {
  if (book && translation) return chapterQueryOptions(api, book, chapter, translation);
  return {
    queryKey: queryKeys.chapter('', chapter, translation),
    queryFn: () => Promise.reject(new Error('chapter query is not enabled')),
    staleTime: Infinity,
  };
}

export function useChapter(book: BookInfo | undefined, chapter: number, translation: TranslationId) {
  const api = useApi();
  return useQuery({ ...optionsOrIdle(api, book, chapter, translation), enabled: !!book });
}

/** Once the current chapter has loaded, warms the cache with the next and previous chapter. */
export function usePrefetchAdjacent(
  books: BookInfo[] | undefined,
  position: ReaderPosition,
  translations: readonly TranslationId[],
): void {
  const api = useApi();
  const queryClient = useQueryClient();
  const book = findBook(books, position.bookNumber);

  // Watches the current chapter's cache entry. `enabled: false`, so it never starts a request.
  const current = useQuery({ ...optionsOrIdle(api, book, position.chapter, translations[0]), enabled: false });
  const loaded = current.isSuccess && !!book;
  const translationsKey = translations.join('|');

  useEffect(() => {
    if (!loaded || !books) return;
    const here = { bookNumber: position.bookNumber, chapter: position.chapter };
    const ids = translationsKey ? (translationsKey.split('|') as TranslationId[]) : [];
    for (const target of [nextPosition(books, here), prevPosition(books, here)]) {
      const targetBook = target && findBook(books, target.bookNumber);
      if (!target || !targetBook) continue;
      for (const id of ids) {
        queryClient.prefetchQuery(chapterQueryOptions(api, targetBook, target.chapter, id)).catch(() => undefined);
      }
    }
  }, [loaded, books, position.bookNumber, position.chapter, translationsKey, api, queryClient]);
}
