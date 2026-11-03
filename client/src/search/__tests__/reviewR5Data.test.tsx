// Regression tests from the Sol review of the R-5 data layer (round 1). F5 was a caught bug; F7–F9 kill
// mutants that survived the acceptance suite.
import { QueryClient } from '@tanstack/react-query';
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { ApiProvider } from '../../api/ApiProvider';
import type { ApiClient, RequestOptions, SearchRequest } from '../../api/client';
import type { SearchResult } from '../../api/schemas';
import { readerTargets } from '../../reader/target';
import { readerPositionKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { hasCjk, searchTranslation } from '../searchTranslation';
import { useOpenPassage } from '../useOpenPassage';
import { useDebouncedValue, useVerseSearch } from '../useVerseSearch';

afterEach(() => {
  readerTargets.clear();
  jest.useRealTimers();
});

test('F5: debounces a function value without calling it', async () => {
  jest.useFakeTimers();
  const first = jest.fn(() => 'first');
  const second = jest.fn(() => 'second');
  const view = await renderHook(({ value }: { value: () => string }) => useDebouncedValue(value, 250), {
    initialProps: { value: first },
  });
  expect(view.result.current).toBe(first);
  await view.rerender({ value: second });
  await act(async () => jest.advanceTimersByTime(250));
  expect(view.result.current).toBe(second);
  expect(first).not.toHaveBeenCalled();
  expect(second).not.toHaveBeenCalled();
});

test('F7: supplementary ideographs are Chinese; CJK punctuation, kana, hangul and full-width Latin are not', () => {
  expect(hasCjk('\u{20000}')).toBe(true);
  expect(searchTranslation('\u{20000}', 'WEB', 'CUV')).toBe('CUV');
  for (const q of ['，。', 'あ', '한', 'ＬＯＶＥ']) expect(hasCjk(q)).toBe(false);
});

test('F8: the search passes its signal, aborted on unmount', async () => {
  let signal: AbortSignal | undefined;
  const search = jest.fn((_req: SearchRequest, opts?: RequestOptions) => {
    signal = opts?.signal;
    return new Promise<SearchResult[]>(() => undefined);
  });
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const wrapper = ({ children }: { children: ReactNode }) => (
    <ApiProvider client={{ search } as unknown as ApiClient} queryClient={queryClient}>
      {children}
    </ApiProvider>
  );
  const view = await renderHook(() => useVerseSearch('love', 'BSB'), { wrapper });
  await waitFor(() => expect(search).toHaveBeenCalledTimes(1));
  expect(signal?.aborted).toBe(false);
  await view.unmount();
  expect(signal?.aborted).toBe(true);
  queryClient.clear();
});

test('F9: an opener kept from an earlier render uses the translation stored now', async () => {
  const storage = createStorage(memoryBackend());
  const navigate = jest.fn();
  storage.set(readerPositionKey, { bookNumber: 1, chapter: 1, translation: 'CUV-SIMP' });
  const view = await renderHook(() => useOpenPassage({ storage, navigate }));
  const kept = view.result.current;
  await act(async () => storage.set(readerPositionKey, { bookNumber: 1, chapter: 1, translation: 'WEB' }));
  await act(async () => kept({ bookNumber: 45, chapter: 8 }));
  expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 45, chapter: 8, translation: 'WEB' });
});
