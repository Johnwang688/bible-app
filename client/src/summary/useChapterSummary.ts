import { useQuery } from '@tanstack/react-query';

import { useApi } from '../api';
import type { BookInfo } from '../api/schemas';

export function useChapterSummary(book: BookInfo, chapter: number) {
  const api = useApi();
  return useQuery({
    queryKey: ['chapterSummary', book.name, chapter],
    queryFn: ({ signal }) => api.commentary({ book: book.name, chapter, source: 'summary' }, { signal }),
    staleTime: Infinity,
  });
}
