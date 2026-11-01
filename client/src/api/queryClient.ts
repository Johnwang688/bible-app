import { QueryClient } from '@tanstack/react-query';

import { ApiError, type EntityKind } from './client';

/** One key factory per client method. Keys are readonly tuples, stable for equal arguments. */
export const queryKeys = {
  translations: () => ['translations'] as const,
  books: () => ['books'] as const,
  chapter: (book: string, chapter: number, translation?: string) =>
    ['chapter', book, chapter, translation] as const,
  verse: (book: string, chapter: number, verse: number, translation?: string) =>
    ['verse', book, chapter, verse, translation] as const,
  verseRange: (book: string, chapter: number, start: number, end: number, translation?: string) =>
    ['verseRange', book, chapter, start, end, translation] as const,
  words: (book: string, chapter: number, verse: number) => ['words', book, chapter, verse] as const,
  lexicon: (strongs: string) => ['lexicon', strongs] as const,
  search: (query: string, translation?: string, book?: string, limit?: number) =>
    ['search', query, translation, book, limit] as const,
  commentary: (book: string, chapter: number, verse?: number, source?: string) =>
    ['commentary', book, chapter, verse, source] as const,
  commentarySources: () => ['commentarySources'] as const,
  entities: (kind: EntityKind) => ['entities', kind] as const,
  entity: (kind: EntityKind, slug: string) => ['entity', kind, slug] as const,
  health: () => ['health'] as const,
};

const MAX_RETRIES = 2;

/** Retry only transient failures (network, timeout, 5xx), at most twice. */
export function shouldRetry(failureCount: number, error: unknown): boolean {
  if (failureCount >= MAX_RETRIES) return false;
  if (!(error instanceof ApiError)) return false;
  if (error.kind === 'network' || error.kind === 'timeout') return true;
  return error.kind === 'http' && error.status >= 500;
}

export function createQueryClient(): QueryClient {
  return new QueryClient({
    defaultOptions: {
      queries: {
        retry: shouldRetry,
        staleTime: 5 * 60 * 1000,
        gcTime: 30 * 60 * 1000,
      },
    },
  });
}
