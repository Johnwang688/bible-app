// Acceptance (orchestrator-owned): Original words data, ported from HG-3a's behaviours.
import * as fs from 'fs';
import * as path from 'path';

import { QueryClient } from '@tanstack/react-query';
import { act, render } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { ApiProvider } from '../../api/ApiProvider';
import { ApiError, type ApiClient } from '../../api/client';
import type { BookInfo, LexiconEntryOut, VerseWord, VerseWordsOut } from '../../api/schemas';
import { groupWordRows, languageOf, useLexicon, useVerseWords } from '../words';

const FIX = path.resolve(__dirname, '../../../../tests/golden/fixtures');
const body = (n: string) => JSON.parse(fs.readFileSync(path.join(FIX, `${n}.json`), 'utf8')).body;
const JOHN316: VerseWordsOut = body('words_john3_16');
const GEN11: VerseWordsOut = body('words_genesis1_1');
const G0025: LexiconEntryOut = body('lexicon_g0025');
const JOHN: BookInfo = { book_number: 43, name: 'John', name_zh: '約翰福音', name_zh_simplified: '约翰福音', testament: 'NT', total_chapters: 21 };

const w = (english_order: number, english: string | null, english_kind: string, original: string): VerseWord => ({
  english_order,
  english,
  english_kind,
  original,
  translit: original,
  language: 'greek',
  strongs: `G${english_order}`,
  lemma: original,
  gloss: original,
  grammar: 'g',
  parsing: 'p',
  parsing_code: 'c',
  footnote: null,
});

describe('groupWordRows', () => {
  it('keeps one row per aligned phrase in English order, with untranslated and elsewhere kinds', () => {
    const rows = groupWordRows(JOHN316.words);
    expect(rows[0]).toMatchObject({ english: 'For', kind: 'text' });
    expect(rows.map((x) => x.kind)).toContain('untranslated');
    expect(rows.map((x) => x.kind)).toContain('elsewhere');
    const orders = rows.map((x) => x.words[0]!.english_order);
    expect(orders).toEqual([...orders].sort((a, b) => a - b));
    expect(new Set(rows.map((x) => x.key)).size).toBe(rows.length);
  });

  it('joins a "continues" word to the previous row instead of giving it its own', () => {
    const rows = groupWordRows([w(2, 'loved', 'text', 'b'), w(1, 'God', 'text', 'a'), w(3, null, 'continues', 'c')]);
    expect(rows.map((x) => [x.english, x.words.map((y) => y.original)])).toEqual([
      ['God', ['a']],
      ['loved', ['b', 'c']],
    ]);
  });

  it('a leading "continues" word with nothing before it becomes its own row', () => {
    const rows = groupWordRows([w(1, null, 'continues', 'a'), w(2, 'x', 'text', 'b')]);
    expect(rows).toHaveLength(2);
  });

  it('handles an empty verse', () => {
    expect(groupWordRows([])).toEqual([]);
  });
});

describe('languageOf', () => {
  it('reads the language from the first word', () => {
    expect(languageOf(JOHN316.words)).toBe('greek');
    expect(languageOf(GEN11.words)).toBe('hebrew');
    expect(languageOf([{ ...w(1, 'x', 'text', 'a'), language: 'aramaic' }])).toBe('aramaic');
    expect(languageOf([])).toBeNull();
  });
});

describe('useVerseWords / useLexicon', () => {
  function setup(fail = new Set<string>()) {
    const calls: string[] = [];
    const api = {
      words: async (book: string, chapter: number, verse: number) => {
        const k = `${book} ${chapter}:${verse}`;
        calls.push(k);
        if (fail.has(k)) throw new ApiError({ kind: 'network', status: 0, path: '/words' });
        return k === 'John 3:16' ? JOHN316 : { ...JOHN316, verse, words: [] };
      },
      lexicon: async (strongs: string) => {
        calls.push(strongs);
        return G0025;
      },
    } as unknown as ApiClient;
    const qc = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
    const wrap = (n: ReactNode) => (
      <ApiProvider client={api} queryClient={qc}>
        {n}
      </ApiProvider>
    );
    return { calls, wrap, fail };
  }

  it('fetches a verse once and serves it from the cache when revisited', async () => {
    const h = setup();
    const seen: (number | undefined)[] = [];
    function P({ verse }: { verse: number | null }) {
      const q = useVerseWords(JOHN, 3, verse);
      seen.push(q.data?.words.length);
      return null;
    }
    const ui = await render(h.wrap(<P verse={16} />));
    await act(async () => {});
    await ui.rerender(h.wrap(<P verse={17} />));
    await act(async () => {});
    await ui.rerender(h.wrap(<P verse={16} />));
    expect(seen[seen.length - 1]).toBe(25);
    expect(h.calls.filter((c) => c === 'John 3:16')).toHaveLength(1);
  });

  it('makes no request without a verse or a book', async () => {
    const h = setup();
    function P() {
      useVerseWords(undefined, 3, 16);
      useVerseWords(JOHN, 3, null);
      useLexicon(null);
      return null;
    }
    await render(h.wrap(<P />));
    expect(h.calls).toEqual([]);
  });

  it('revisiting a verse that failed shows loading, not the old error, while it refetches (HG-3a F3)', async () => {
    const h = setup(new Set(['John 3:16']));
    const states: string[] = [];
    function P({ verse }: { verse: number }) {
      const q = useVerseWords(JOHN, 3, verse);
      states.push(q.status === 'error' && !q.isFetching ? 'error' : q.isFetching || q.isPending ? 'loading' : 'ok');
      return null;
    }
    const ui = await render(h.wrap(<P verse={16} />));
    await act(async () => {});
    expect(states[states.length - 1]).toBe('error');
    h.fail.clear();
    await ui.rerender(h.wrap(<P verse={17} />));
    await act(async () => {});
    const from = states.length;
    await ui.rerender(h.wrap(<P verse={16} />));
    expect(states[from]).toBe('loading');
    await act(async () => {});
    expect(states[states.length - 1]).toBe('ok');
  });

  it('loads a lexicon entry by Strong’s number', async () => {
    const h = setup();
    let gloss: string | null | undefined;
    function P() {
      gloss = useLexicon('G0025').data?.gloss;
      return null;
    }
    await render(h.wrap(<P />));
    await act(async () => {});
    expect(gloss).toBe(G0025.gloss);
  });
});
