// Acceptance (orchestrator-owned): the PF-2 loader race tests, ported to the new reader, plus
// next/previous prefetch and instant prefetched turns. The old app's races came from one global
// "current load"; here the shown chapter is the query for the current position, so a late or failed
// older request must never show.
import { QueryClient } from '@tanstack/react-query';
import { act, render } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { Text } from 'react-native';

import { ApiProvider } from '../../api/ApiProvider';
import type { ApiClient } from '../../api/client';
import { ApiError } from '../../api/client';
import type { BookInfo, ChapterOut } from '../../api/schemas';
import { useChapter, usePrefetchAdjacent } from '../useChapter';
import type { TranslationId } from '../translations';

const JOHN: BookInfo = { book_number: 43, name: 'John', name_zh: '約翰福音', name_zh_simplified: '约翰福音', testament: 'NT', total_chapters: 21 };
const MATTHEW: BookInfo = { book_number: 40, name: 'Matthew', name_zh: '馬太福音', name_zh_simplified: '马太福音', testament: 'NT', total_chapters: 28 };
const MARK: BookInfo = { book_number: 41, name: 'Mark', name_zh: '馬可福音', name_zh_simplified: '马可福音', testament: 'NT', total_chapters: 16 };
const BOOKS = [MATTHEW, MARK, JOHN];

const chapterBody = (book: BookInfo, chapter: number, translation: string): ChapterOut => ({
  book: book.name,
  book_number: book.book_number,
  chapter,
  translation,
  total_verses: 1,
  verses: [{ id: 1, book: book.name, book_number: book.book_number, chapter, verse: 1, text: `${book.name} ${chapter} ${translation}`, translation }],
});

interface Pending {
  key: string;
  resolve: () => void;
  reject: (err: unknown) => void;
  signal?: AbortSignal;
}

/** A fake API whose chapter requests wait until the test settles them. */
function fakeApi() {
  const pending: Pending[] = [];
  const calls: string[] = [];
  const api = {
    chapter: (book: string, chapter: number, translation?: string, opts?: { signal?: AbortSignal }) =>
      new Promise<ChapterOut>((resolve, reject) => {
        const key = `${book} ${chapter} ${translation}`;
        calls.push(key);
        const b = BOOKS.find((x) => x.name === book)!;
        pending.push({ key, resolve: () => resolve(chapterBody(b, chapter, translation!)), reject, signal: opts?.signal });
      }),
  } as unknown as ApiClient;
  const find = (key: string) => {
    const p = [...pending].reverse().find((x) => x.key === key);
    if (!p) throw new Error(`no request for ${key}; calls: ${calls.join(', ')}`);
    return p;
  };
  return { api, calls, find };
}

interface Snapshot {
  text: string | null;
  loading: boolean;
  error: boolean;
}

function setup() {
  const { api, calls, find } = fakeApi();
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const renders: Snapshot[] = [];
  function Probe({ book, chapter, translation }: { book?: BookInfo; chapter: number; translation: TranslationId }) {
    const q = useChapter(book, chapter, translation);
    const snap = { text: q.data?.verses[0]?.text ?? null, loading: q.isPending && !!book, error: q.isError };
    renders.push(snap);
    return <Text testID="out">{JSON.stringify(snap)}</Text>;
  }
  const wrap = (node: ReactNode) => (
    <ApiProvider client={api} queryClient={queryClient}>
      {node}
    </ApiProvider>
  );
  const last = () => renders[renders.length - 1]!;
  return { calls, find, queryClient, renders, last, wrap, Probe };
}

const settle = async (fn: () => void) => {
  await act(async () => {
    fn();
  });
};

describe('PF-2 loader races, ported', () => {
  it('F1: no book yet (catalogue still loading) makes no request and shows no error', async () => {
    const h = setup();
    await render(h.wrap(<h.Probe chapter={3} translation="BSB" />));
    expect(h.calls).toEqual([]);
    expect(h.last()).toEqual({ text: null, loading: false, error: false });
  });

  it('F2: a late response for an older chapter never replaces the chapter now shown', async () => {
    const h = setup();
    const ui = await render(h.wrap(<h.Probe book={JOHN} chapter={1} translation="WEB" />));
    await ui.rerender(h.wrap(<h.Probe book={JOHN} chapter={3} translation="WEB" />));
    await settle(() => h.find('John 3 WEB').resolve());
    expect(h.last().text).toBe('John 3 WEB');
    await settle(() => h.find('John 1 WEB').resolve());
    expect(h.last().text).toBe('John 3 WEB');
  });

  it('F4: Next during a translation load leaves no endless spinner', async () => {
    const h = setup();
    const ui = await render(h.wrap(<h.Probe book={JOHN} chapter={3} translation="BSB" />));
    await ui.rerender(h.wrap(<h.Probe book={JOHN} chapter={4} translation="BSB" />));
    await settle(() => h.find('John 4 BSB').resolve());
    await settle(() => h.find('John 3 BSB').resolve());
    expect(h.last()).toEqual({ text: 'John 4 BSB', loading: false, error: false });
  });

  it('F5: an obsolete request failing does not change the chapter or show an error', async () => {
    const h = setup();
    const ui = await render(h.wrap(<h.Probe book={JOHN} chapter={3} translation="WEB" />));
    await ui.rerender(h.wrap(<h.Probe book={JOHN} chapter={4} translation="BSB" />));
    await settle(() => h.find('John 4 BSB').resolve());
    await settle(() => h.find('John 3 WEB').reject(new ApiError({ kind: 'network', status: 0, path: '/x' })));
    expect(h.last()).toEqual({ text: 'John 4 BSB', loading: false, error: false });
  });

  it('F6: Next recovers after the latest request failed', async () => {
    const h = setup();
    const ui = await render(h.wrap(<h.Probe book={JOHN} chapter={4} translation="WEB" />));
    await ui.rerender(h.wrap(<h.Probe book={JOHN} chapter={5} translation="WEB" />));
    await settle(() => h.find('John 5 WEB').reject(new ApiError({ kind: 'http', status: 503, path: '/x' })));
    expect(h.last().error).toBe(true);
    await ui.rerender(h.wrap(<h.Probe book={JOHN} chapter={6} translation="WEB" />));
    await settle(() => h.find('John 6 WEB').resolve());
    expect(h.last()).toEqual({ text: 'John 6 WEB', loading: false, error: false });
  });

  it('passes an AbortSignal so a superseded request can be cancelled', async () => {
    const h = setup();
    await render(h.wrap(<h.Probe book={JOHN} chapter={3} translation="WEB" />));
    expect(h.find('John 3 WEB').signal).toBeDefined();
  });

  // Verifier round 1 (GPT-6.1 Sol): the signal must really be aborted when superseded.
  it('aborts the request signal when the position moves on', async () => {
    const h = setup();
    const ui = await render(h.wrap(<h.Probe book={JOHN} chapter={3} translation="WEB" />));
    const obsolete = h.find('John 3 WEB').signal!;
    await ui.rerender(h.wrap(<h.Probe book={JOHN} chapter={4} translation="WEB" />));
    expect(obsolete.aborted).toBe(true);
  });

  it('keeps a loaded chapter cached: going back shows it with no new request and no spinner', async () => {
    const h = setup();
    const ui = await render(h.wrap(<h.Probe book={JOHN} chapter={3} translation="WEB" />));
    await settle(() => h.find('John 3 WEB').resolve());
    await ui.rerender(h.wrap(<h.Probe book={JOHN} chapter={4} translation="WEB" />));
    await settle(() => h.find('John 4 WEB').resolve());
    const before = h.calls.length;
    const from = h.renders.length;
    await ui.rerender(h.wrap(<h.Probe book={JOHN} chapter={3} translation="WEB" />));
    expect(h.renders.slice(from).every((r) => r.text === 'John 3 WEB' && !r.loading)).toBe(true);
    expect(h.calls.length).toBe(before);
  });
});

describe('prefetch', () => {
  function PrefetchProbe(props: { book?: BookInfo; chapter: number; translation: TranslationId; parallel?: TranslationId }) {
    const q = useChapter(props.book, props.chapter, props.translation);
    usePrefetchAdjacent(
      BOOKS,
      { bookNumber: props.book?.book_number ?? 0, chapter: props.chapter, translation: props.translation },
      props.parallel ? [props.translation, props.parallel] : [props.translation],
    );
    return <Text>{q.data?.verses[0]?.text ?? ''}</Text>;
  }

  it('prefetches the next and previous chapter once the current one has loaded', async () => {
    const h = setup();
    await render(h.wrap(<PrefetchProbe book={JOHN} chapter={3} translation="BSB" />));
    expect(h.calls).toEqual(['John 3 BSB']);
    await settle(() => h.find('John 3 BSB').resolve());
    expect([...h.calls].sort()).toEqual(['John 2 BSB', 'John 3 BSB', 'John 4 BSB']);
  });

  it('prefetches across a book boundary and for the parallel translation too', async () => {
    const h = setup();
    await render(h.wrap(<PrefetchProbe book={MATTHEW} chapter={28} translation="BSB" parallel="CUV-SIMP" />));
    await settle(() => {
      h.find('Matthew 28 BSB').resolve();
    });
    expect(h.calls).toEqual(expect.arrayContaining(['Mark 1 BSB', 'Matthew 27 BSB', 'Mark 1 CUV-SIMP', 'Matthew 27 CUV-SIMP']));
  });

  it('a prefetched chapter turn is instant: the first render after Next already has the text', async () => {
    const h = setup();
    const renders: string[] = [];
    function Turn({ chapter }: { chapter: number }) {
      const q = useChapter(JOHN, chapter, 'BSB');
      usePrefetchAdjacent(BOOKS, { bookNumber: 43, chapter, translation: 'BSB' }, ['BSB']);
      renders.push(q.isPending ? 'pending' : (q.data?.verses[0]?.text ?? ''));
      return null;
    }
    const ui = await render(h.wrap(<Turn chapter={3} />));
    await settle(() => h.find('John 3 BSB').resolve());
    await settle(() => {
      h.find('John 4 BSB').resolve();
      h.find('John 2 BSB').resolve();
    });
    const from = renders.length;
    await ui.rerender(h.wrap(<Turn chapter={4} />));
    expect(renders[from]).toBe('John 4 BSB');
    expect(renders.slice(from)).not.toContain('pending');
  });
});
