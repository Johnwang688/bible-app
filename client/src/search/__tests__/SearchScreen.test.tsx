// Acceptance (orchestrator-owned, R-5 part 2): the search screen (design/proposed/r5-search.html, approved by John,
// with the fixes in r5/GO-AHEAD.md).
import { QueryClient } from '@tanstack/react-query';
import { act, fireEvent, render, renderHook, screen, waitFor, within } from '@testing-library/react-native';
import * as fs from 'fs';
import * as path from 'path';
import { Platform, StyleSheet } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApiProvider } from '../../api/ApiProvider';
import { ApiError, type ApiClient, type SearchRequest } from '../../api/client';
import type { BookInfo, EntityKind, SearchResult, SummaryEntityListItemOut } from '../../api/schemas';
import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { readerTargets } from '../../reader/target';
import { readerPositionKey, readingSettingsKey, recentPassagesKey, type ReaderPosition } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { SearchScreen } from '../components/SearchScreen';
import { excerptAround } from '../excerpt';
import { useScreenBack } from '../useScreenBack';

const fixture = (name: string) =>
  JSON.parse(fs.readFileSync(path.resolve(__dirname, `../../../../tests/golden/fixtures/${name}.json`), 'utf8')).body;
const BOOKS: BookInfo[] = fixture('books');
const LISTS: Record<EntityKind, SummaryEntityListItemOut[]> = {
  person: fixture('entities_person'),
  place: fixture('entities_place'),
  theme: fixture('entities_theme'),
};
const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
const ZH: DeviceLocale = { languageTag: 'zh-CN', languageCode: 'zh', regionCode: 'CN' };
const style = (el: { props: { style?: unknown } }) => StyleSheet.flatten(el.props.style as never) ?? {};

const row = (b: number, c: number, v: number, text: string, translation: string): SearchResult => ({
  verse: { id: b * 1_000_000 + c * 1000 + v, book: BOOKS[b - 1]!.name, book_number: b, chapter: c, verse: v, text, translation },
  relevance: 1,
});
const many = (n: number, translation = 'BSB') =>
  Array.from({ length: n }, (_, i) => row(43, 1 + Math.floor(i / 30), 1 + (i % 30), `love number ${i + 1}`, translation));

afterEach(() => {
  readerTargets.clear();
  jest.useRealTimers();
});

async function renderSearch(opts: {
  search?: (req: SearchRequest) => Promise<SearchResult[]>;
  position?: ReaderPosition;
  parallel?: 'CUV-SIMP' | 'CUV' | 'BSB' | 'WEB' | 'ASV' | null;
  recent?: ReaderPosition[];
  locales?: DeviceLocale[];
  entitiesDown?: boolean;
} = {}) {
  const calls: SearchRequest[] = [];
  const api = {
    books: async () => BOOKS,
    entities: async (kind: EntityKind) => {
      if (opts.entitiesDown) throw new ApiError({ kind: 'network', status: 0, path: '/summary-entities' });
      return LISTS[kind];
    },
    search: async (req: SearchRequest) => {
      calls.push(req);
      return (opts.search ?? (async () => []))(req);
    },
  } as unknown as ApiClient;
  const storage = createStorage(memoryBackend());
  storage.set(readerPositionKey, opts.position ?? { bookNumber: 1, chapter: 1, translation: 'BSB' });
  if (opts.parallel !== undefined) storage.set(readingSettingsKey, { textSize: 2, parallel: opts.parallel });
  if (opts.recent) storage.set(recentPassagesKey, opts.recent);
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const locales = opts.locales ?? [EN];
  const navigate = jest.fn();
  const onBack = jest.fn();
  const onOpenEntity = jest.fn();
  await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <ApiProvider client={api} queryClient={queryClient}>
        <I18nProvider storage={storage} locales={locales}>
          <ThemeProvider storage={storage} systemScheme="light">
            <SearchScreen storage={storage} locales={locales} navigate={navigate} onBack={onBack} onOpenEntity={onOpenEntity} />
          </ThemeProvider>
        </I18nProvider>
      </ApiProvider>
    </SafeAreaProvider>,
  );
  // The book list loads first.
  await act(async () => undefined);
  return { calls, storage, navigate, onBack, onOpenEntity };
}

async function type(text: string) {
  await fireEvent.changeText(screen.getByTestId('search-input'), text);
}

describe('the field', () => {
  it('is labelled, focused, with a placeholder, a back button and a clear button once typed in', async () => {
    const { onBack } = await renderSearch();
    expect(screen.getByTestId('screen-search')).toBeTruthy();
    const input = screen.getByTestId('search-input');
    expect(input.props.accessibilityLabel).toBe('Search the Bible');
    expect(input.props.placeholder).toBe('A reference or words');
    expect(input.props.autoFocus).toBe(true);
    expect(screen.queryByTestId('search-clear')).toBeNull();
    await type('love');
    const clear = screen.getByTestId('search-clear');
    expect(clear.props.accessibilityLabel).toBe('Clear');
    await fireEvent.press(clear);
    expect(screen.getByTestId('search-input').props.value).toBe('');
    await fireEvent.press(screen.getByTestId('search-back'));
    expect(onBack).toHaveBeenCalledTimes(1);
    expect(screen.getByTestId('search-back').props.accessibilityLabel).toBe('Back to the Bible');
  });
});

describe('the empty field', () => {
  it('lists recent passages, which open in their own translation', async () => {
    const recent: ReaderPosition[] = [
      { bookNumber: 43, chapter: 3, translation: 'WEB' },
      { bookNumber: 19, chapter: 23, translation: 'CUV-SIMP' },
    ];
    const { storage, navigate } = await renderSearch({ recent });
    const group = screen.getByTestId('search-recent');
    expect(within(group).getByText('Recent passages')).toBeTruthy();
    expect(screen.getByTestId('search-recent-0')).toHaveTextContent(/John 3/);
    expect(screen.getByTestId('search-recent-0')).toHaveTextContent(/WEB/);
    expect(screen.getByTestId('search-recent-1')).toHaveTextContent(/Psalms 23/);
    readerTargets.set({ bookNumber: 1, chapter: 1, start: 1, end: 1 });
    await fireEvent.press(screen.getByTestId('search-recent-1'));
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 19, chapter: 23, translation: 'CUV-SIMP' });
    expect(readerTargets.get()).toBeNull();
    expect(navigate).toHaveBeenCalledTimes(1);
  });

  it('clears the recent passages', async () => {
    const { storage } = await renderSearch({ recent: [{ bookNumber: 43, chapter: 3, translation: 'WEB' }] });
    const clear = screen.getByTestId('search-recent-clear');
    expect(clear.props.accessibilityLabel).toBe('Clear recent passages');
    await fireEvent.press(clear);
    expect(storage.get(recentPassagesKey)).toEqual([]);
    expect(screen.queryByTestId('search-recent')).toBeNull();
  });

  it('has no recent group when there are none, and examples that fill the field', async () => {
    const { calls } = await renderSearch();
    expect(screen.queryByTestId('search-recent')).toBeNull();
    expect(screen.getByTestId('search-examples')).toBeTruthy();
    await fireEvent.press(screen.getByTestId('search-example-1'));
    expect(screen.getByTestId('search-input').props.value).toBe('John 3:16');
    expect(screen.getByTestId('search-passage-0')).toHaveTextContent(/John 3:16/);
    expect(calls).toEqual([]);
  });
});

describe('references', () => {
  it('offers the exact passage first as Go to passage, opens it in context, and never searches words', async () => {
    jest.useFakeTimers();
    const { calls, storage, navigate } = await renderSearch({ position: { bookNumber: 1, chapter: 1, translation: 'WEB' } });
    await type('jn 3:16-18');
    await act(async () => jest.advanceTimersByTime(600));
    const first = screen.getByTestId('search-passage-0');
    expect(first).toHaveTextContent(/John 3:16–18/);
    expect(first).toHaveTextContent(/Go to passage/);
    expect(calls).toEqual([]);
    // A reference is not a name: no people, places or themes.
    expect(screen.queryByTestId('search-entities')).toBeNull();
    expect(screen.queryByTestId('search-verses')).toBeNull();
    await fireEvent.press(first);
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 43, chapter: 3, translation: 'WEB' });
    expect(readerTargets.get()).toEqual({ bookNumber: 43, chapter: 3, start: 16, end: 18 });
    expect(navigate).toHaveBeenCalledTimes(1);
  });

  it('offers each book a partial name could mean, as whole chapters', async () => {
    jest.useFakeTimers();
    const { calls } = await renderSearch();
    await type('jo 3');
    await act(async () => jest.advanceTimersByTime(600));
    const group = screen.getByTestId('search-passages');
    expect(within(group).getByText('Passages')).toBeTruthy();
    for (let i = 0; i < 5; i++) expect(screen.getByTestId(`search-passage-${i}`)).toHaveTextContent(/Whole chapter/);
    expect(screen.getByTestId('search-passage-0')).toHaveTextContent(/Job 3/);
    expect(calls).toEqual([]);
  });

  it('gives every row a sub-line: a verse that is not the exact reading says Verse', async () => {
    await renderSearch();
    await type('jo 3:16');
    expect(screen.getByTestId('search-passage-0')).toHaveTextContent(/Job 3:16/);
    expect(screen.getByTestId('search-passage-0')).toHaveTextContent(/Verse/);
    expect(screen.getByTestId('search-passage-0')).not.toHaveTextContent(/Go to passage/);
  });

  it('opens a chapter with no verse target', async () => {
    const { storage } = await renderSearch({ position: { bookNumber: 1, chapter: 1, translation: 'BSB' } });
    await type('Romans 8');
    await fireEvent.press(screen.getByTestId('search-passage-0'));
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 45, chapter: 8, translation: 'BSB' });
    expect(readerTargets.get()).toBeNull();
  });

  it('opens the exact passage on Enter', async () => {
    const { storage } = await renderSearch();
    await type('约 3:16');
    await fireEvent(screen.getByTestId('search-input'), 'submitEditing', { nativeEvent: { text: '约 3:16' } });
    expect(readerTargets.get()).toEqual({ bookNumber: 43, chapter: 3, start: 16, end: 16 });
    expect(storage.get(readerPositionKey)?.bookNumber).toBe(43);
  });

  it('shows a book on its own as From chapter 1, and still searches the word', async () => {
    jest.useFakeTimers();
    const { calls } = await renderSearch({ search: async () => [row(40, 4, 21, 'James and John his brother', 'BSB')] });
    await type('John');
    expect(screen.getByTestId('search-passage-0')).toHaveTextContent(/From chapter 1/);
    await act(async () => jest.advanceTimersByTime(300));
    await waitFor(() => expect(screen.getByTestId('search-verse-40-4-21')).toBeTruthy());
    expect(calls).toEqual([{ query: 'John', translation: 'BSB', limit: 50 }]);
  });
});

describe('words', () => {
  it('waits for typing to pause, then searches the reader’s translation', async () => {
    jest.useFakeTimers();
    const { calls } = await renderSearch({ position: { bookNumber: 43, chapter: 3, translation: 'WEB' }, search: async () => many(3, 'WEB') });
    await type('lo');
    await act(async () => jest.advanceTimersByTime(100));
    await type('love');
    await act(async () => jest.advanceTimersByTime(100));
    expect(calls).toEqual([]);
    await act(async () => jest.advanceTimersByTime(200));
    await waitFor(() => expect(calls).toEqual([{ query: 'love', translation: 'WEB', limit: 50 }]));
  });

  it('lists verses with the count, the reference and the words marked, ten at a time', async () => {
    jest.useFakeTimers();
    await renderSearch({ search: async () => many(23) });
    await type('love');
    await act(async () => jest.advanceTimersByTime(300));
    const group = await screen.findByTestId('search-verses');
    expect(within(group).getByText('23 verses in BSB')).toBeTruthy();
    expect(screen.getAllByTestId(/^search-verse-\d+-\d+-\d+$/)).toHaveLength(10);
    const card = screen.getByTestId('search-verse-43-1-1');
    expect(card).toHaveTextContent(/John 1:1/);
    expect(card.props.accessibilityRole).toBe('button');
    const mark = within(card).getByText('love');
    expect(style(mark).backgroundColor).toBeTruthy();
    // Ten more at a time, capped at what remains.
    expect(screen.getByTestId('search-more')).toHaveTextContent('Show 10 more');
    await fireEvent.press(screen.getByTestId('search-more'));
    expect(screen.getAllByTestId(/^search-verse-\d+-\d+-\d+$/)).toHaveLength(20);
    expect(screen.getByTestId('search-more')).toHaveTextContent('Show 3 more');
    await fireEvent.press(screen.getByTestId('search-more'));
    expect(screen.getAllByTestId(/^search-verse-\d+-\d+-\d+$/)).toHaveLength(23);
    expect(screen.queryByTestId('search-more')).toBeNull();
  });

  it('opens a verse in context', async () => {
    jest.useFakeTimers();
    const { storage, navigate } = await renderSearch({ search: async () => [row(62, 4, 8, 'God is love.', 'BSB')] });
    await type('love');
    await act(async () => jest.advanceTimersByTime(300));
    await fireEvent.press(await screen.findByTestId('search-verse-62-4-8'));
    expect(readerTargets.get()).toEqual({ bookNumber: 62, chapter: 4, start: 8, end: 8 });
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 62, chapter: 4, translation: 'BSB' });
    expect(navigate).toHaveBeenCalledTimes(1);
  });

  it('searches a Chinese query in a Chinese translation', async () => {
    jest.useFakeTimers();
    const { calls } = await renderSearch({ position: { bookNumber: 1, chapter: 1, translation: 'BSB' }, parallel: 'CUV', search: async () => [] });
    await type('神爱世人');
    await act(async () => jest.advanceTimersByTime(300));
    await waitFor(() => expect(calls).toEqual([{ query: '神爱世人', translation: 'CUV', limit: 50 }]));
  });

  it('says so when nothing matches', async () => {
    jest.useFakeTimers();
    await renderSearch({ search: async () => [] });
    await type('xyzzy');
    await act(async () => jest.advanceTimersByTime(300));
    const none = await screen.findByTestId('search-no-results');
    expect(none).toHaveTextContent(/No verses found for “xyzzy”/);
  });

  it('shows a loading state while searching', async () => {
    jest.useFakeTimers();
    await renderSearch({ search: () => new Promise(() => undefined) });
    await type('grace');
    await act(async () => jest.advanceTimersByTime(300));
    expect(await screen.findByTestId('search-loading')).toHaveTextContent(/Searching…/);
  });

  it('shows a failure with Try again, and keeps the passages', async () => {
    jest.useFakeTimers();
    let down = true;
    const { calls } = await renderSearch({
      search: async () => {
        if (down) throw new ApiError({ kind: 'network', status: 0, path: '/search' });
        return [row(43, 1, 1, 'In the beginning was the Word', 'BSB')];
      },
    });
    await type('John');
    await act(async () => jest.advanceTimersByTime(300));
    const error = await screen.findByTestId('search-error');
    expect(error).toHaveTextContent(/Can’t reach the server/);
    // Offline, nothing promises the passage opens now.
    expect(error).toHaveTextContent(/Passages open once the chapter loads/);
    expect(screen.getByTestId('search-input').props.editable).not.toBe(false);
    expect(screen.getByTestId('search-passage-0')).toBeTruthy();
    down = false;
    await fireEvent.press(screen.getByTestId('search-retry'));
    expect(await screen.findByTestId('search-verse-43-1-1')).toBeTruthy();
    expect(calls).toHaveLength(2);
  });
});

describe('the verse excerpt', () => {
  it('leaves a verse whose first match is near the start alone', () => {
    expect(excerptAround('God is love.', ['love'])).toBe('God is love.');
    expect(excerptAround('No match here', ['grace'])).toBe('No match here');
  });

  it('starts a long verse near its first match, at a word, after an ellipsis', () => {
    const text = `${'and the people went up '.repeat(8)}to love the Lord`;
    const out = excerptAround(text, ['LOVE']);
    expect(out.startsWith('…')).toBe(true);
    const at = out.toLowerCase().indexOf('love');
    expect(at).toBeGreaterThan(0);
    expect(at).toBeLessThanOrEqual(41);
    // It cuts at the start of a word.
    const kept = out.slice(1);
    const cut = text.length - kept.length;
    expect(text.slice(cut)).toBe(kept);
    expect(/\s/.test(text.charAt(cut - 1))).toBe(true);
  });

  it('cuts Chinese closer to the match', () => {
    const out = excerptAround(`${'一'.repeat(100)}平安${'二'.repeat(10)}`, ['平安']);
    expect(out.startsWith('…')).toBe(true);
    expect(out.indexOf('平安')).toBeLessThanOrEqual(21);
  });

  it('a result card shows the windowed excerpt, with the match visible', async () => {
    jest.useFakeTimers();
    const long = `${'and the people went up '.repeat(8)}to love the Lord`;
    await renderSearch({ search: async () => [row(19, 119, 1, long, 'BSB')] });
    await type('love');
    await act(async () => jest.advanceTimersByTime(300));
    const card = await screen.findByTestId('search-verse-19-119-1');
    expect(card).toHaveTextContent(/…/);
    expect(within(card).getByText('love')).toBeTruthy();
    expect(card.props.accessibilityHint).toBe('Opens it in the Bible');
  });
});

describe('people, places and themes', () => {
  it('come last, after the verses, and open their page', async () => {
    jest.useFakeTimers();
    const { onOpenEntity } = await renderSearch({ search: async () => many(3) });
    await type('joab');
    await act(async () => jest.advanceTimersByTime(300));
    await screen.findByTestId('search-verses');
    const group = await screen.findByTestId('search-entities');
    expect(within(group).getByText('People, places and themes')).toBeTruthy();
    const joab = screen.getByTestId('search-entity-person-joab');
    expect(joab).toHaveTextContent(/Joab/);
    expect(joab).toHaveTextContent(/Person/);
    // Last: after the verse results in the tree.
    const ids = screen.getAllByTestId(/^search-(verses|entities)$/).map((n) => n.props.testID);
    expect(ids).toEqual(['search-verses', 'search-entities']);
    await fireEvent.press(joab);
    expect(onOpenEntity).toHaveBeenCalledWith('/entities/person/joab');
  });

  it('up to three per kind, people then places then themes', async () => {
    jest.useFakeTimers();
    await renderSearch({ search: async () => [] });
    await type('jo');
    await act(async () => jest.advanceTimersByTime(300));
    await screen.findByTestId('search-no-results');
    await screen.findByTestId('search-entities');
    const rows = screen.getAllByTestId(/^search-entity-/).map((n) => n.props.testID as string);
    const kinds = rows.map((id) => id.split('-')[2]);
    expect(kinds).toEqual(['person', 'person', 'person', 'place', 'place', 'place', 'theme', 'theme', 'theme']);
    // The verse group says none, and the names still show.
    expect(screen.getByTestId('search-no-results')).toBeTruthy();
  });

  it('a Chinese query explains that the names are English', async () => {
    jest.useFakeTimers();
    await renderSearch({ search: async () => [] });
    await type('亚伯拉罕');
    await act(async () => jest.advanceTimersByTime(300));
    const group = await screen.findByTestId('search-entities');
    expect(group).toHaveTextContent('People, places and themes have English names only for now. Search for them in English.');
    expect(screen.queryAllByTestId(/^search-entity-/)).toHaveLength(0);
  });

  it('lists that failed to load show no group', async () => {
    jest.useFakeTimers();
    await renderSearch({ search: async () => many(1), entitiesDown: true });
    await type('joab');
    await act(async () => jest.advanceTimersByTime(300));
    await screen.findByTestId('search-verses');
    expect(screen.queryByTestId('search-entities')).toBeNull();
  });
});

describe('Chinese interface', () => {
  it('Chinese strings and book names, Chinese verse text', async () => {
    jest.useFakeTimers();
    await renderSearch({
      locales: [ZH],
      position: { bookNumber: 43, chapter: 3, translation: 'CUV-SIMP' },
      search: async () => [row(43, 14, 27, '我留下平安给你们', 'CUV-SIMP')],
    });
    expect(screen.getByTestId('search-input').props.placeholder).toBe('经文出处或关键词');
    await type('约 3');
    expect(screen.getByTestId('search-passage-0')).toHaveTextContent(/约翰福音 3/);
    expect(screen.getByTestId('search-passage-0')).toHaveTextContent(/前往经文/);
    await type('平安');
    await act(async () => jest.advanceTimersByTime(300));
    const card = await screen.findByTestId('search-verse-43-14-27');
    expect(card).toHaveTextContent(/约翰福音 14:27/);
    expect(within(screen.getByTestId('search-verses')).getByText('在和合本中找到 1 节')).toBeTruthy();
    const group = await screen.findByTestId('search-entities');
    expect(group).toHaveTextContent('人物、地点和主题目前只有英文名称，请用英文查找');
  });

  it('English names in the Chinese interface carry the 英文 badge', async () => {
    jest.useFakeTimers();
    await renderSearch({ locales: [ZH], search: async () => [] });
    await type('joab');
    await act(async () => jest.advanceTimersByTime(300));
    const group = await screen.findByTestId('search-entities');
    expect(within(group).getByText('人物、地点和主题')).toBeTruthy();
    expect(within(group).getByText('英文')).toBeTruthy();
    expect(screen.getByTestId('search-entity-person-joab')).toHaveTextContent(/人物/);
  });
});

describe('targets', () => {
  it('every control is at least 44 pt high', async () => {
    jest.useFakeTimers();
    await renderSearch({ recent: [{ bookNumber: 43, chapter: 3, translation: 'BSB' }], search: async () => many(12) });
    // Large text grows a control, so its height is a minimum, never fixed (the round back button excepted).
    const tall = (id: string) => {
      const s = style(screen.getByTestId(id));
      expect(Number(s.minHeight ?? 0)).toBeGreaterThanOrEqual(44);
      expect(s.height).toBeUndefined();
    };
    expect(Number(style(screen.getByTestId('search-back')).height)).toBeGreaterThanOrEqual(44);
    tall('search-recent-0');
    tall('search-recent-clear');
    tall('search-example-1');
    await type('love');
    tall('search-clear');
    await act(async () => jest.advanceTimersByTime(300));
    await screen.findByTestId('search-more');
    tall('search-more');
    tall('search-verse-43-1-1');
  });

  it('scrolling dismisses the keyboard, and taps in the list still land', async () => {
    await renderSearch();
    const list = screen.getByTestId('search-results');
    expect(list.props.keyboardDismissMode).toBe('on-drag');
    expect(list.props.keyboardShouldPersistTaps).toBe('handled');
  });
});

describe('review round 2 regression tests', () => {
  it('R2 ignores composing Escape without consuming it, then handles a normal Escape', async () => {
    const previous = Object.getOwnPropertyDescriptor(globalThis, 'document');
    const listeners = new Set<(event: KeyboardEvent) => void>();

    const add = jest.fn((type: string, fn: (e: KeyboardEvent) => void) => {
      if (type === 'keydown') listeners.add(fn);
    });
    const remove = jest.fn((type: string, fn: (e: KeyboardEvent) => void) => {
      if (type === 'keydown') listeners.delete(fn);
    });

    Object.defineProperty(globalThis, 'document', {
      configurable: true,
      value: { addEventListener: add, removeEventListener: remove },
    });

    const os = jest.replaceProperty(Platform, 'OS', 'web');
    const back = jest.fn();
    let ui: Awaited<ReturnType<typeof renderHook>> | undefined;

    try {
      ui = await renderHook(() => useScreenBack(back));
      expect(listeners.size).toBe(1);
      expect(add).toHaveBeenCalledWith('keydown', expect.any(Function), true);

      const composing = {
        key: 'Escape',
        repeat: false,
        isComposing: true,
        preventDefault: jest.fn(),
        stopImmediatePropagation: jest.fn(),
      };
      await act(async () => {
        for (const fn of listeners) {
          fn(composing as unknown as KeyboardEvent);
        }
      });

      expect(back).not.toHaveBeenCalled();
      expect(composing.preventDefault).not.toHaveBeenCalled();
      expect(composing.stopImmediatePropagation).not.toHaveBeenCalled();

      const normal = { ...composing, isComposing: false };
      await act(async () => {
        for (const fn of listeners) {
          fn(normal as unknown as KeyboardEvent);
        }
      });
      expect(back).toHaveBeenCalledTimes(1);
      expect(normal.preventDefault).toHaveBeenCalledTimes(1);
      expect(normal.stopImmediatePropagation).toHaveBeenCalledTimes(1);
    } finally {
      await ui?.unmount();
      expect(listeners.size).toBe(0);
      os.restore();
      if (previous) Object.defineProperty(globalThis, 'document', previous);
      else Reflect.deleteProperty(globalThis, 'document');
    }
  });
});
