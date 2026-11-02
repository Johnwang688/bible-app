// Verse search. The shown results are the query for the current (trimmed) query and translation, so a late
// response for an older query can never show under a newer one.
import { useQuery } from '@tanstack/react-query';
import { useEffect, useState } from 'react';

import { queryKeys, useApi } from '../api';
import type { TranslationId } from '../reader/translations';

/** The backend's maximum number of results per search. */
export const SEARCH_LIMIT = 50;

/** `value`, once it has stayed the same for `ms`. The first render returns the initial value at once. */
export function useDebouncedValue<T>(value: T, ms: number): T {
  // Wrapped in an object: React calls a function passed to useState or a setter, and T may be a function.
  const [debounced, setDebounced] = useState<{ value: T }>(() => ({ value }));
  useEffect(() => {
    const timer = setTimeout(() => setDebounced({ value }), ms);
    return () => clearTimeout(timer);
  }, [value, ms]);
  return debounced.value;
}

export function useVerseSearch(query: string, translation: TranslationId, opts?: { enabled?: boolean }) {
  const api = useApi();
  const trimmed = query.trim();
  return useQuery({
    queryKey: queryKeys.search(trimmed, translation, undefined, SEARCH_LIMIT),
    queryFn: ({ signal }) => api.search({ query: trimmed, translation, limit: SEARCH_LIMIT }, { signal }),
    enabled: trimmed.length > 0 && opts?.enabled !== false,
    staleTime: Infinity,
  });
}
