// Test harness for the reader screen: a fake API backed by the golden fixtures (synthesised text
// where no fixture exists) and every provider the screen needs. Orchestrator-owned.
import * as fs from 'fs';
import * as path from 'path';

import { QueryClient } from '@tanstack/react-query';
import { render } from '@testing-library/react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApiProvider } from '../../api/ApiProvider';
import { ApiError, type ApiClient } from '../../api/client';
import type { BookInfo, ChapterOut } from '../../api/schemas';
import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { readerPositionKey, type ReaderPosition } from '../../storage/keys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { ReaderScreen } from '../components/ReaderScreen';

const FIXTURES = path.resolve(__dirname, '../../../../tests/golden/fixtures');
const fixture = (name: string) => JSON.parse(fs.readFileSync(path.join(FIXTURES, `${name}.json`), 'utf8')).body;

export const BOOKS: BookInfo[] = fixture('books');

const FIXTURE_CHAPTERS: Record<string, string> = {
  'John 3 WEB': 'chapter_john3_web',
  'John 3 ASV': 'chapter_john3_asv',
  'John 3 CUV': 'chapter_john3_cuv',
  'John 3 CUV-SIMP': 'chapter_john3_cuvsimp',
  'Genesis 1 WEB': 'chapter_genesis1_web',
};

/** Synthesised chapter text: `<Book> <chapter>:<verse> <translation>`. */
export const synthText = (book: string, chapter: number, verse: number, translation: string) =>
  `${book} ${chapter}:${verse} ${translation}`;

export interface FakeApiOptions {
  /** Verses to leave out, by "Book chapter translation", e.g. { 'John 4 CUV-SIMP': [2] }. */
  omit?: Record<string, number[]>;
  /** Requests that fail, by the same key. */
  fail?: Set<string>;
  /** Words requests that fail, by "Book chapter:verse". */
  failWords?: Set<string>;
}

const WORDS: Record<string, string> = { 'John 3:16': 'words_john3_16', 'Genesis 1:1': 'words_genesis1_1' };

export function fakeApi(opts: FakeApiOptions = {}) {
  const calls: string[] = [];
  const api = {
    books: async () => BOOKS,
    chapter: async (book: string, chapter: number, translation = 'BSB'): Promise<ChapterOut> => {
      const key = `${book} ${chapter} ${translation}`;
      calls.push(key);
      if (opts.fail?.has(key)) throw new ApiError({ kind: 'http', status: 503, path: `/chapters/${book}/${chapter}` });
      const b = BOOKS.find((x) => x.name === book)!;
      const fx = FIXTURE_CHAPTERS[key];
      const base: ChapterOut = fx
        ? fixture(fx)
        : {
            book,
            book_number: b.book_number,
            chapter,
            translation,
            total_verses: 3,
            verses: [1, 2, 3].map((v) => ({
              id: v,
              book,
              book_number: b.book_number,
              chapter,
              verse: v,
              text: synthText(book, chapter, v, translation),
              translation,
            })),
          };
      const omit = opts.omit?.[key] ?? [];
      return { ...base, verses: base.verses.filter((v) => !omit.includes(v.verse)) };
    },
    words: async (book: string, chapter: number, verse: number) => {
      const key = `${book} ${chapter}:${verse}`;
      calls.push(`words ${key}`);
      if (opts.failWords?.has(key)) throw new ApiError({ kind: 'network', status: 0, path: `/words/${key}` });
      const fx = WORDS[key];
      const b = BOOKS.find((x) => x.name === book)!;
      return fx ? fixture(fx) : { book, book_number: b.book_number, chapter, verse, translation: 'BSB', words: [] };
    },
    lexicon: async (strongs: string) => {
      calls.push(`lexicon ${strongs}`);
      if (strongs === 'G0025') return fixture('lexicon_g0025');
      return {
        strongs,
        language: strongs.startsWith('H') ? 'hebrew' : 'greek',
        lemma: `lemma-${strongs}`,
        translit: `translit-${strongs}`,
        gloss: `gloss-${strongs}`,
        definition: `definition-${strongs}`,
        occurrences: 3,
        verse_count: 2,
        references: [{ book: 'Genesis', book_number: 1, chapter: 2, verse: 4 }],
        source: 'STEP Bible brief lexicon (STEPBible.org, CC BY 4.0)',
      };
    },
  } as unknown as ApiClient;
  return { api, calls };
}

export const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
export const ZH: DeviceLocale = { languageTag: 'zh-CN', languageCode: 'zh', regionCode: 'CN' };

export interface RenderReaderOptions extends FakeApiOptions {
  storage?: Storage;
  position?: ReaderPosition;
  locales?: DeviceLocale[];
  /** The reading-time clock (R-3); real time when absent. */
  now?: () => number;
}

export async function renderReader(opts: RenderReaderOptions = {}) {
  const storage = opts.storage ?? createStorage(memoryBackend());
  if (opts.position) storage.set(readerPositionKey, opts.position);
  const { api, calls } = fakeApi(opts);
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const locales = opts.locales ?? [EN];
  const ui = await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <ApiProvider client={api} queryClient={queryClient}>
        <I18nProvider storage={storage} locales={locales}>
          <ThemeProvider storage={storage} systemScheme="light">
            <ReaderScreen storage={storage} locales={locales} now={opts.now} />
          </ThemeProvider>
        </I18nProvider>
      </ApiProvider>
    </SafeAreaProvider>,
  );
  return { ui, storage, calls, queryClient };
}
