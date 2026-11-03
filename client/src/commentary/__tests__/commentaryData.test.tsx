// Acceptance (orchestrator-owned, R-5b): the commentary sheet's data layer. Matthew Henry only (John,
// 2026-11-01). An entry with no `verse_end` covers its first verse only (in the content DB it is always the
// last verse of a chapter or a one-verse note); the backend returns such entries for every later verse too,
// so the client filters.
import { QueryClient } from '@tanstack/react-query';
import { renderHook, waitFor } from '@testing-library/react-native';
import * as fs from 'fs';
import * as path from 'path';
import type { ReactNode } from 'react';

import { ApiProvider } from '../../api/ApiProvider';
import type { ApiClient, CommentaryRequest } from '../../api/client';
import type { BookInfo, CommentaryEntry } from '../../api/schemas';
import {
  COMMENTARY_SOURCE,
  commentaryParagraphs,
  commentaryPreview,
  coversVerse,
  entryRange,
  useVerseCommentary,
} from '../useVerseCommentary';

const BOOKS: BookInfo[] = JSON.parse(
  fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8'),
).body;
const GENESIS = BOOKS[0]!;
const JOHN = BOOKS[42]!;

const entry = (id: number, verse_start: number, verse_end: number | null, content = `entry ${id}`): CommentaryEntry => ({
  id,
  book_number: 1,
  chapter: 2,
  verse_start,
  verse_end,
  source: 'matthew_henry',
  content,
});

describe('coversVerse / entryRange', () => {
  it('covers its range, inclusive', () => {
    expect(coversVerse(entry(1, 4, 7), 4)).toBe(true);
    expect(coversVerse(entry(1, 4, 7), 7)).toBe(true);
    expect(coversVerse(entry(1, 4, 7), 8)).toBe(false);
    expect(coversVerse(entry(1, 4, 7), 3)).toBe(false);
    expect(entryRange(entry(1, 4, 7))).toEqual({ start: 4, end: 7 });
  });
  it('treats a missing end as a one-verse entry', () => {
    expect(coversVerse(entry(1, 15, null), 15)).toBe(true);
    expect(coversVerse(entry(1, 15, null), 16)).toBe(false);
    expect(entryRange(entry(1, 15, null))).toEqual({ start: 15, end: 15 });
  });
});

describe('commentaryParagraphs', () => {
  it('splits on line breaks and drops blank lines', () => {
    expect(commentaryParagraphs('One.\n\nTwo.\nThree.\n \n')).toEqual(['One.', 'Two.', 'Three.']);
    expect(commentaryParagraphs('  Only one.  ')).toEqual(['Only one.']);
    expect(commentaryParagraphs('')).toEqual([]);
  });
});

describe('commentaryPreview', () => {
  const sentence = (n: number) => `Sentence number ${n} is about here.`; // 34 characters
  const long = Array.from({ length: 60 }, (_, i) => sentence(i + 1)).join(' '); // about 2,100 characters

  it('keeps short text whole', () => {
    expect(commentaryPreview('A short note.')).toEqual({ preview: 'A short note.', truncated: false });
    // Up to 200 characters over the limit is not worth a "Read all".
    const nearly = 'x'.repeat(850);
    expect(commentaryPreview(nearly, 700)).toEqual({ preview: nearly, truncated: false });
  });

  it('cuts long text at the last sentence end within the limit', () => {
    const { preview, truncated } = commentaryPreview(long, 700);
    expect(truncated).toBe(true);
    expect(preview.length).toBeLessThanOrEqual(700);
    expect(preview.length).toBeGreaterThan(350);
    expect(preview.endsWith('here.')).toBe(true);
    expect(long.startsWith(preview)).toBe(true);
  });

  it('cuts at a space when no sentence ends late enough', () => {
    const words = Array.from({ length: 400 }, (_, i) => `word${i}`).join(' ');
    const { preview, truncated } = commentaryPreview(words, 700);
    expect(truncated).toBe(true);
    expect(preview.length).toBeLessThanOrEqual(700);
    expect(words.startsWith(preview)).toBe(true);
    expect(words.charAt(preview.length)).toBe(' ');
  });

  it('defaults to a 700-character limit', () => {
    expect(commentaryPreview(long)).toEqual(commentaryPreview(long, 700));
  });
});

describe('useVerseCommentary', () => {
  function harness(rows: CommentaryEntry[] | Error) {
    const calls: CommentaryRequest[] = [];
    const api = {
      commentary: async (req: CommentaryRequest) => {
        calls.push(req);
        if (rows instanceof Error) throw rows;
        return rows;
      },
    } as unknown as ApiClient;
    const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
    const wrapper = ({ children }: { children: ReactNode }) => (
      <ApiProvider client={api} queryClient={queryClient}>
        {children}
      </ApiProvider>
    );
    return { calls, wrapper };
  }

  it('asks for Matthew Henry on the verse and keeps only the entries that cover it, in order', async () => {
    // What the backend sends for Genesis 2:20: entries starting at or before the verse.
    const { calls, wrapper } = harness([entry(3, 20, 25, 'covers'), entry(1, 1, 3), entry(2, 15, null, 'one verse')]);
    const view = await renderHook(() => useVerseCommentary(GENESIS, 2, 20), { wrapper });
    await waitFor(() => expect(view.result.current.isSuccess).toBe(true));
    expect(calls).toEqual([{ book: 'Genesis', chapter: 2, verse: 20, source: 'matthew_henry' }]);
    expect(COMMENTARY_SOURCE).toBe('matthew_henry');
    expect(view.result.current.data?.map((e) => e.id)).toEqual([3]);
  });

  it('gives an empty list when no entry covers the verse', async () => {
    const { wrapper } = harness([entry(1, 1, 8)]);
    const view = await renderHook(() => useVerseCommentary(JOHN, 3, 16), { wrapper });
    await waitFor(() => expect(view.result.current.isSuccess).toBe(true));
    expect(view.result.current.data).toEqual([]);
  });

  it('sorts several covering entries by their first verse', async () => {
    const { wrapper } = harness([entry(9, 5, 9), entry(8, 1, 12)]);
    const view = await renderHook(() => useVerseCommentary(GENESIS, 2, 6), { wrapper });
    await waitFor(() => expect(view.result.current.isSuccess).toBe(true));
    expect(view.result.current.data?.map((e) => e.id)).toEqual([8, 9]);
  });

  it('waits for the book', async () => {
    const { calls, wrapper } = harness([]);
    const view = await renderHook(() => useVerseCommentary(undefined, 3, 16), { wrapper });
    expect(view.result.current.fetchStatus).toBe('idle');
    expect(calls).toEqual([]);
  });

  it('reports a failure', async () => {
    const { wrapper } = harness(new Error('down'));
    const view = await renderHook(() => useVerseCommentary(JOHN, 3, 16), { wrapper });
    await waitFor(() => expect(view.result.current.isError).toBe(true));
  });
});
