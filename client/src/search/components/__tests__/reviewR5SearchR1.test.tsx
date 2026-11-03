// R-5 part 2, Sol review r1 (search): F1 pagination reset on returning to a query, F2 surrogate pairs in the
// excerpt, F3 names and the Chinese explanation during a pending search (fail on HEAD); F5 kills a route mutant.
// F4 not taken: the approved prototype shows No results under the passages.
import { QueryClient } from '@tanstack/react-query';
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import * as fs from 'fs';
import * as path from 'path';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import SearchRoute from '../../../app/search';
import { ApiProvider } from '../../../api/ApiProvider';
import type { ApiClient, SearchRequest } from '../../../api/client';
import type { BookInfo, EntityKind, SearchResult } from '../../../api/schemas';
import { I18nProvider } from '../../../i18n/I18nProvider';
import type { DeviceLocale } from '../../../i18n/types';
import { readerTargets } from '../../../reader/target';
import { readerPositionKey } from '../../../storage/keys';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import { excerptAround } from '../../excerpt';
import { SearchScreen } from '../SearchScreen';

const fixture = (name: string) =>
  JSON.parse(fs.readFileSync(path.resolve(__dirname,
    '../../../../../tests/golden/fixtures/' + name + '.json'), 'utf8')).body;

const BOOKS: BookInfo[] = fixture('books');
const EN: DeviceLocale =
  { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
const ZH: DeviceLocale =
  { languageTag: 'zh-CN', languageCode: 'zh', regionCode: 'CN' };

const many = (): SearchResult[] =>
  Array.from({ length: 23 }, (_, i) => ({
    relevance: 1,
    verse: {
      id: 43001001 + i,
      book: 'John',
      book_number: 43,
      chapter: 1,
      verse: i + 1,
      text: 'love grace ' + i,
      translation: 'BSB',
    },
  }));

const count = () =>
  screen.getAllByTestId(/^search-verse-\d+-\d+-\d+$/).length;

const type = async (q: string) => {
  await fireEvent.changeText(screen.getByTestId('search-input'), q);
};

const settle = async () => {
  await act(async () => { jest.advanceTimersByTime(300); });
};

async function setup(
  search: (req: SearchRequest) => Promise<SearchResult[]> = async () => [],
  locale = EN,
) {
  const storage = createStorage(memoryBackend());
  storage.set(readerPositionKey, {
    bookNumber: 1, chapter: 1, translation: 'BSB',
  });

  const api = {
    books: async () => BOOKS,
    search,
    entities: async (kind: EntityKind) => fixture('entities_' + kind),
  } as unknown as ApiClient;

  const queryClient = new QueryClient({
    defaultOptions: { queries: { retry: false, gcTime: Infinity } },
  });

  await render(
    <SafeAreaProvider initialMetrics={{
      frame: { x: 0, y: 0, width: 390, height: 844 },
      insets: { top: 47, left: 0, right: 0, bottom: 34 },
    }}>
      <ApiProvider client={api} queryClient={queryClient}>
        <I18nProvider storage={storage} locales={[locale]}>
          <ThemeProvider storage={storage} systemScheme="light">
            <SearchScreen storage={storage} locales={[locale]}
              navigate={jest.fn()} onBack={jest.fn()} />
          </ThemeProvider>
        </I18nProvider>
      </ApiProvider>
    </SafeAreaProvider>,
  );

  await act(async () => undefined);
}

afterEach(() => {
  readerTargets.clear();
  jest.useRealTimers();
});

it('F1 resets pagination on a new query and on returning to the old query', async () => {
  jest.useFakeTimers();
  await setup(async () => many());

  await type('love'); await settle();
  await screen.findByTestId('search-more');
  await fireEvent.press(screen.getByTestId('search-more'));
  expect(count()).toBe(20);

  await type('grace'); await settle();
  await screen.findByTestId('search-more');
  expect(count()).toBe(10);

  await type('love'); await settle();
  await screen.findByTestId('search-more');
  expect(count()).toBe(10);
});

it('F2 preserves a surrogate pair at the excerpt boundary', () => {
  const text =
    '\u4e00'.repeat(41) + '\u{1F600}' + '\u4e00'.repeat(19) + '\u5e73\u5b89';
  const out = excerptAround(text, ['\u5e73\u5b89']);
  expect(out).toContain('\u5e73\u5b89');
  expect(/[\uDC00-\uDFFF]/.test(out.charAt(1))).toBe(false);
});

it.each([
  [EN, 'joab', 'search-entity-person-joab'],
  [ZH, '\u4e9a\u4f2f\u62c9\u7f55', 'search-entities'],
] as const)(
  'F3 shows names or their explanation during pending search: %s',
  async (locale, query, id) => {
    jest.useFakeTimers();
    await setup(() => new Promise<SearchResult[]>(() => undefined), locale);
    await type(query); await settle();
    expect(screen.getByTestId('search-loading')).toBeTruthy();
    expect(await screen.findByTestId(id)).toBeTruthy();
  },
);

it('F5 the root search route renders SearchScreen', () => {
  expect(SearchRoute()?.type).toBe(SearchScreen);
});
