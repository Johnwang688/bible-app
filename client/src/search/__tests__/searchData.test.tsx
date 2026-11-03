// Acceptance (orchestrator-owned, R-5a): search's data layer. Which translation a query searches, the
// debounce, the verse-search query, and opening a passage (with or without verses) in the reader.
import { QueryClient } from '@tanstack/react-query';
import { act, renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { ApiProvider } from '../../api/ApiProvider';
import type { ApiClient, SearchRequest } from '../../api/client';
import type { SearchResult } from '../../api/schemas';
import { readerTargets } from '../../reader/target';
import { readerPositionKey, recentPassagesKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { hasCjk, searchTranslation } from '../searchTranslation';
import { SEARCH_LIMIT, useDebouncedValue, useVerseSearch } from '../useVerseSearch';
import { useOpenPassage } from '../useOpenPassage';

afterEach(() => readerTargets.clear());

const result = (book: string, book_number: number, chapter: number, verse: number, text: string, translation: string): SearchResult => ({
  verse: { id: book_number * 1_000_000 + chapter * 1000 + verse, book, book_number, chapter, verse, text, translation },
  relevance: 1,
});

function harness(search: (req: SearchRequest) => Promise<SearchResult[]>) {
  const calls: SearchRequest[] = [];
  const api = {
    search: async (req: SearchRequest) => {
      calls.push(req);
      return search(req);
    },
  } as unknown as ApiClient;
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const wrapper = ({ children }: { children: ReactNode }) => (
    <ApiProvider client={api} queryClient={queryClient}>
      {children}
    </ApiProvider>
  );
  return { calls, wrapper, queryClient };
}

describe('hasCjk', () => {
  it('spots Chinese characters anywhere in the query', () => {
    expect(hasCjk('神爱世人')).toBe(true);
    expect(hasCjk('约翰 3')).toBe(true);
    expect(hasCjk('love 爱')).toBe(true);
    expect(hasCjk('love')).toBe(false);
    expect(hasCjk('３')).toBe(false);
    expect(hasCjk('')).toBe(false);
  });
});

describe('searchTranslation', () => {
  it('searches English words in the reader’s English translation', () => {
    expect(searchTranslation('love', 'BSB', null)).toBe('BSB');
    expect(searchTranslation('love', 'WEB', 'CUV-SIMP')).toBe('WEB');
  });
  it('uses the parallel translation when it is the one in the query’s language', () => {
    expect(searchTranslation('love', 'CUV-SIMP', 'ASV')).toBe('ASV');
    expect(searchTranslation('神爱世人', 'BSB', 'CUV')).toBe('CUV');
  });
  it('falls back to BSB for English and CUV-SIMP for Chinese', () => {
    expect(searchTranslation('love', 'CUV-SIMP', null)).toBe('BSB');
    expect(searchTranslation('love', 'CUV', 'CUV-SIMP')).toBe('BSB');
    expect(searchTranslation('神爱世人', 'BSB', null)).toBe('CUV-SIMP');
    expect(searchTranslation('神爱世人', 'WEB', 'ASV')).toBe('CUV-SIMP');
  });
  it('keeps the reader’s Chinese translation for Chinese', () => {
    expect(searchTranslation('神爱世人', 'CUV', null)).toBe('CUV');
    expect(searchTranslation('神爱世人', 'CUV-SIMP', 'BSB')).toBe('CUV-SIMP');
  });
});

describe('useDebouncedValue', () => {
  beforeEach(() => jest.useFakeTimers());
  afterEach(() => jest.useRealTimers());

  it('passes a value on after it has been still for the delay', async () => {
    const view = await renderHook(({ v }: { v: string }) => useDebouncedValue(v, 250), { initialProps: { v: 'a' } });
    expect(view.result.current).toBe('a');
    await view.rerender({ v: 'ab' });
    await act(async () => jest.advanceTimersByTime(200));
    expect(view.result.current).toBe('a');
    await view.rerender({ v: 'abc' });
    await act(async () => jest.advanceTimersByTime(200));
    expect(view.result.current).toBe('a');
    await act(async () => jest.advanceTimersByTime(60));
    expect(view.result.current).toBe('abc');
  });
});

describe('useVerseSearch', () => {
  it('searches the trimmed query in the given translation, up to SEARCH_LIMIT verses', async () => {
    const { calls, wrapper } = harness(async () => [result('John', 43, 3, 16, 'For God so loved the world', 'BSB')]);
    const view = await renderHook(() => useVerseSearch('  loved  ', 'BSB'), { wrapper });
    await waitFor(() => expect(view.result.current.isSuccess).toBe(true));
    expect(calls).toEqual([{ query: 'loved', translation: 'BSB', limit: SEARCH_LIMIT }]);
    expect(SEARCH_LIMIT).toBe(50);
    expect(view.result.current.data?.[0]?.verse.verse).toBe(16);
  });

  it('does not search an empty query, or when disabled', async () => {
    const { calls, wrapper } = harness(async () => []);
    const empty = await renderHook(() => useVerseSearch('   ', 'BSB'), { wrapper });
    const off = await renderHook(() => useVerseSearch('love', 'BSB', { enabled: false }), { wrapper });
    await act(async () => undefined);
    expect(calls).toEqual([]);
    expect(empty.result.current.fetchStatus).toBe('idle');
    expect(off.result.current.fetchStatus).toBe('idle');
  });

  it('never shows one query’s results for another', async () => {
    let release: (() => void) | undefined;
    const { wrapper } = harness(
      (req) =>
        new Promise((resolve) => {
          const rows = [result('John', 43, 3, 16, req.query, req.translation ?? 'BSB')];
          if (req.query === 'slow') release = () => resolve(rows);
          else resolve(rows);
        }),
    );
    const view = await renderHook(({ q }: { q: string }) => useVerseSearch(q, 'BSB'), { wrapper, initialProps: { q: 'slow' } });
    await view.rerender({ q: 'fast' });
    await waitFor(() => expect(view.result.current.data?.[0]?.verse.text).toBe('fast'));
    await act(async () => release?.());
    expect(view.result.current.data?.[0]?.verse.text).toBe('fast');
  });

  it('keys by query and translation, so a cached search is not repeated', async () => {
    const { calls, wrapper } = harness(async (req) => [result('John', 43, 3, 16, req.query, req.translation ?? '')]);
    const a = await renderHook(() => useVerseSearch('love', 'BSB'), { wrapper });
    await waitFor(() => expect(a.result.current.isSuccess).toBe(true));
    const b = await renderHook(() => useVerseSearch('love', 'BSB'), { wrapper });
    await waitFor(() => expect(b.result.current.isSuccess).toBe(true));
    const c = await renderHook(() => useVerseSearch('love', 'WEB'), { wrapper });
    await waitFor(() => expect(c.result.current.isSuccess).toBe(true));
    expect(calls.map((r) => r.translation)).toEqual(['BSB', 'WEB']);
  });
});

describe('useOpenPassage', () => {
  const setup = async () => {
    const storage = createStorage(memoryBackend());
    storage.set(readerPositionKey, { bookNumber: 1, chapter: 1, translation: 'CUV-SIMP' });
    const navigate = jest.fn();
    const view = await renderHook(() => useOpenPassage({ storage, navigate }));
    return { storage, navigate, open: () => view.result.current };
  };

  it('opens verses in context: the chapter, a target, then the Bible tab', async () => {
    const { storage, navigate, open } = await setup();
    await act(async () => open()({ bookNumber: 43, chapter: 3, start: 16, end: 18 }));
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 43, chapter: 3, translation: 'CUV-SIMP' });
    expect(readerTargets.get()).toEqual({ bookNumber: 43, chapter: 3, start: 16, end: 18 });
    expect(navigate).toHaveBeenCalledTimes(1);
    expect(storage.get(recentPassagesKey)[0]).toEqual({ bookNumber: 43, chapter: 3, translation: 'CUV-SIMP' });
  });

  it('opens one verse when only the start is given', async () => {
    const { open } = await setup();
    await act(async () => open()({ bookNumber: 43, chapter: 3, start: 16 }));
    expect(readerTargets.get()).toEqual({ bookNumber: 43, chapter: 3, start: 16, end: 16 });
  });

  it('opens a chapter with no target, and drops a stale one', async () => {
    const { storage, navigate, open } = await setup();
    readerTargets.set({ bookNumber: 19, chapter: 23, start: 1, end: 1 });
    await act(async () => open()({ bookNumber: 45, chapter: 8 }));
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 45, chapter: 8, translation: 'CUV-SIMP' });
    expect(readerTargets.get()).toBeNull();
    expect(navigate).toHaveBeenCalledTimes(1);
  });

  it('opens a book at chapter 1', async () => {
    const { storage, open } = await setup();
    await act(async () => open()({ bookNumber: 66 }));
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 66, chapter: 1, translation: 'CUV-SIMP' });
    expect(readerTargets.get()).toBeNull();
  });
});
