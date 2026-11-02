// Acceptance (orchestrator-owned, R-5 part 2): the people, places and themes lists and an entity's page
// (design/proposed/r5-entities.html, approved by John, with the fixes in r5/GO-AHEAD.md).
import { QueryClient } from '@tanstack/react-query';
import { act, fireEvent, render, screen, within } from '@testing-library/react-native';
import * as fs from 'fs';
import * as path from 'path';
import { StyleSheet } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApiProvider } from '../../api/ApiProvider';
import { ApiError, type ApiClient } from '../../api/client';
import type { BookInfo, EntityKind, SummaryEntityListItemOut, SummaryEntityPageOut } from '../../api/schemas';
import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { readerTargets } from '../../reader/target';
import { readerPositionKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { EntityListScreen } from '../components/EntityListScreen';
import { EntityPageScreen } from '../components/EntityPageScreen';
import { groupReferencesByBook } from '../data';

const fixture = (name: string) =>
  JSON.parse(fs.readFileSync(path.resolve(__dirname, `../../../../tests/golden/fixtures/${name}.json`), 'utf8')).body;
const BOOKS: BookInfo[] = fixture('books');
const LISTS: Record<EntityKind, SummaryEntityListItemOut[]> = {
  person: fixture('entities_person'),
  place: fixture('entities_place'),
  theme: fixture('entities_theme'),
};
const GOD: SummaryEntityPageOut = fixture('entity_person_god');
const COVENANT: SummaryEntityPageOut = fixture('entity_theme_covenant');
const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
const ZH: DeviceLocale = { languageTag: 'zh-CN', languageCode: 'zh', regionCode: 'CN' };
const style = (el: { props: { style?: unknown } }) => StyleSheet.flatten(el.props.style as never) ?? {};
const chaptersOf = (page: SummaryEntityPageOut) => groupReferencesByBook(page.references).reduce((n, g) => n + g.chapters.length, 0);

/** A person with `n` timeline events, each with one development. */
const withEvents = (n: number): SummaryEntityPageOut => ({
  ...GOD,
  slug: 'many',
  label: 'Many',
  timeline: {
    events: Array.from({ length: n }, (_, i) => ({ era: `Genesis ${i + 1}`, title: `Event ${i + 1}`, summary: `Summary ${i + 1}`, developments: [`Step ${i + 1} (Genesis ${i + 1}:1)`] })),
  },
});

afterEach(() => readerTargets.clear());

function makeApi(opts: { list?: (kind: EntityKind) => Promise<SummaryEntityListItemOut[]>; page?: (kind: EntityKind, slug: string) => Promise<SummaryEntityPageOut> }) {
  const calls = { list: 0, page: 0 };
  const api = {
    books: async () => BOOKS,
    entities: async (kind: EntityKind) => {
      calls.list++;
      return (opts.list ?? (async (k: EntityKind) => LISTS[k]))(kind);
    },
    entity: async (kind: EntityKind, slug: string) => {
      calls.page++;
      return (opts.page ?? (async () => GOD))(kind, slug);
    },
  } as unknown as ApiClient;
  return { api, calls };
}

async function mount(node: (storage: ReturnType<typeof createStorage>) => React.ReactNode, api: ApiClient, locales: DeviceLocale[] = [EN]) {
  const storage = createStorage(memoryBackend());
  storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'WEB' });
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <ApiProvider client={api} queryClient={queryClient}>
        <I18nProvider storage={storage} locales={locales}>
          <ThemeProvider storage={storage} systemScheme="light">
            {node(storage)}
          </ThemeProvider>
        </I18nProvider>
      </ApiProvider>
    </SafeAreaProvider>,
  );
  await act(async () => undefined);
  return storage;
}

async function renderList(kind: EntityKind | null, o: { initialFilter?: string; locales?: DeviceLocale[]; list?: (kind: EntityKind) => Promise<SummaryEntityListItemOut[]> } = {}) {
  const { api, calls } = makeApi({ list: o.list });
  const onBack = jest.fn();
  const onOpenEntity = jest.fn();
  await mount(() => <EntityListScreen kind={kind} initialFilter={o.initialFilter} onBack={onBack} onOpenEntity={onOpenEntity} />, api, o.locales);
  return { calls, onBack, onOpenEntity };
}

async function renderPage(kind: EntityKind | null, slug: string, o: { locales?: DeviceLocale[]; page?: (kind: EntityKind, slug: string) => Promise<SummaryEntityPageOut> } = {}) {
  const { api, calls } = makeApi({ page: o.page });
  const onBack = jest.fn();
  const navigate = jest.fn();
  let storage!: ReturnType<typeof createStorage>;
  await mount((s) => {
    storage = s;
    return <EntityPageScreen kind={kind} slug={slug} storage={s} navigate={navigate} onBack={onBack} />;
  }, api, o.locales);
  return { calls, onBack, navigate, storage };
}

const tall = (id: string) => {
  const s = style(screen.getByTestId(id));
  expect(Number(s.minHeight ?? 0)).toBeGreaterThanOrEqual(44);
  expect(s.height).toBeUndefined();
};

describe('the people list', () => {
  it('has Back, the title and count, a filter that states the rule, and A–Z sections', async () => {
    const { onBack } = await renderList('person');
    expect(screen.getByTestId('screen-entity-list')).toBeTruthy();
    expect(screen.getByTestId('entity-list-title')).toHaveTextContent('People');
    expect(screen.getByTestId('entity-list-count')).toHaveTextContent('467 people');
    const filter = screen.getByTestId('entity-filter');
    expect(filter.props.placeholder).toBe('Find a person');
    expect(filter.props.accessibilityLabel).toBe('Find a person');
    expect(filter.props.accessibilityHint).toBe('Names match when they, or a word in them, start with what you type.');
    expect(screen.getByTestId('entity-section-A')).toBeTruthy();
    expect(screen.getByTestId('entity-section-A').props.accessibilityRole).toBe('header');
    expect(screen.getByTestId('entity-row-aaron')).toHaveTextContent(/Aaron/);
    tall('entity-row-aaron');
    await fireEvent.press(screen.getByTestId('entity-back'));
    expect(onBack).toHaveBeenCalledTimes(1);
    expect(screen.getByTestId('entity-back').props.accessibilityLabel).toBe('Back');
  });

  it('has an A–Z jump bar of 44 pt letters, only the letters in use', async () => {
    await renderList('person');
    const bar = screen.getByTestId('entity-jump');
    const letters = within(bar).getAllByTestId(/^entity-jump-[A-Z#]$/).map((n) => (n.props.testID as string).slice(-1));
    const used = [...new Set(LISTS.person.map((p) => p.label.charAt(0).toUpperCase()))].filter((c) => c >= 'A' && c <= 'Z').sort();
    expect(letters).toEqual(used);
    const m = screen.getByTestId('entity-jump-M');
    expect(m.props.accessibilityLabel).toBe('Jump to M');
    const s = style(m);
    expect(Number(s.minHeight)).toBeGreaterThanOrEqual(44);
    expect(Number(s.minWidth)).toBeGreaterThanOrEqual(44);
    await fireEvent.press(m);
  });

  it('filters at once by the one rule, with the count, no sections and no jump bar', async () => {
    const { onOpenEntity } = await renderList('person');
    await fireEvent.changeText(screen.getByTestId('entity-filter'), 'mark');
    expect(screen.getByTestId('entity-row-john-mark')).toBeTruthy();
    expect(screen.getByTestId('entity-list-count')).toHaveTextContent(/^\d+ match(es)?$/);
    expect(screen.queryByTestId('entity-section-J')).toBeNull();
    expect(screen.queryByTestId('entity-jump')).toBeNull();
    await fireEvent.press(screen.getByTestId('entity-row-john-mark'));
    expect(onOpenEntity).toHaveBeenCalledWith('/entities/person/john-mark');
    await fireEvent.press(screen.getByTestId('entity-filter-clear'));
    expect(screen.getByTestId('entity-filter').props.value).toBe('');
    expect(screen.getByTestId('entity-list-count')).toHaveTextContent('467 people');
  });

  it('opens already filtered (from Explore’s See all)', async () => {
    await renderList('person', { initialFilter: 'jo' });
    expect(screen.getByTestId('entity-filter').props.value).toBe('jo');
    expect(screen.getByTestId('entity-list-count')).toHaveTextContent('17 matches');
    expect(screen.getByTestId('entity-row-joab')).toBeTruthy();
  });

  it('says so when nothing matches, and explains a Chinese query', async () => {
    await renderList('person');
    await fireEvent.changeText(screen.getByTestId('entity-filter'), 'xyz');
    const none = screen.getByTestId('entity-no-match');
    expect(none).toHaveTextContent(/Nothing matches “xyz”\./);
    expect(none).toHaveTextContent(/start with what you type/);
    await fireEvent.changeText(screen.getByTestId('entity-filter'), '亚伯拉罕');
    expect(screen.getByTestId('entity-no-match')).toHaveTextContent('People, places and themes have English names only for now. Search for them in English.');
  });
});

describe('the places and themes lists', () => {
  it('places browse A–Z without a jump bar', async () => {
    await renderList('place');
    expect(screen.getByTestId('entity-list-title')).toHaveTextContent('Places');
    expect(screen.getByTestId('entity-list-count')).toHaveTextContent('91 places');
    expect(screen.getByTestId('entity-filter').props.placeholder).toBe('Find a place');
    expect(screen.getByTestId('entity-section-A')).toBeTruthy();
    expect(screen.getByTestId('entity-row-achaia')).toBeTruthy();
    expect(screen.queryByTestId('entity-jump')).toBeNull();
  });

  it('themes are search-first: a prompt until something is typed', async () => {
    await renderList('theme');
    expect(screen.getByTestId('entity-list-count')).toHaveTextContent('2,989 themes');
    expect(screen.getByTestId('entity-themes-prompt')).toHaveTextContent('Type a word to find among 2,989 themes.');
    expect(screen.queryAllByTestId(/^entity-row-/)).toHaveLength(0);
    await fireEvent.changeText(screen.getByTestId('entity-filter'), 'covenant pro');
    expect(screen.queryByTestId('entity-themes-prompt')).toBeNull();
    expect(screen.getByTestId('entity-row-covenant-promise')).toBeTruthy();
  });
});

describe('list states', () => {
  it('loading', async () => {
    await renderList('person', { list: () => new Promise(() => undefined) });
    expect(screen.getByTestId('entity-list-loading')).toHaveTextContent('Loading…');
  });

  it('a failure offers Try again and disables the filter', async () => {
    let down = true;
    const { calls } = await renderList('place', {
      list: async (k) => {
        if (down) throw new ApiError({ kind: 'network', status: 0, path: '/summary-entities/list/place' });
        return LISTS[k];
      },
    });
    const error = screen.getByTestId('entity-list-error');
    expect(error).toHaveTextContent(/Couldn’t load the list/);
    expect(screen.getByTestId('entity-filter').props.editable).toBe(false);
    down = false;
    await fireEvent.press(screen.getByTestId('entity-list-retry'));
    await act(async () => undefined);
    expect(screen.getByTestId('entity-row-achaia')).toBeTruthy();
    expect(screen.getByTestId('entity-filter').props.editable).not.toBe(false);
    expect(calls.list).toBe(2);
  });

  it('an unknown kind is not found', async () => {
    await renderList(null);
    expect(screen.getByTestId('entity-not-found')).toHaveTextContent(/This page isn’t here/);
  });

  it('Chinese: Chinese labels, English names with the 英文 badge', async () => {
    await renderList('person', { locales: [ZH] });
    expect(screen.getByTestId('entity-list-title')).toHaveTextContent('人物');
    expect(screen.getByTestId('entity-list-count')).toHaveTextContent('467 位人物');
    expect(screen.getByTestId('entity-filter').props.placeholder).toBe('查找人物');
    expect(screen.getAllByText('英文').length).toBeGreaterThan(0);
    await fireEvent.changeText(screen.getByTestId('entity-filter'), '亚伯拉罕');
    expect(screen.getByTestId('entity-no-match')).toHaveTextContent('人物、地点和主题目前只有英文名称，请用英文查找');
  });
});

describe('a person’s page', () => {
  it('shows the kind, the name, how many chapters, and the overview with Read more and Show less', async () => {
    const { onBack } = await renderPage('person', 'god');
    expect(screen.getByTestId('screen-entity')).toBeTruthy();
    expect(screen.getByTestId('entity-kind')).toHaveTextContent('Person');
    const title = screen.getByTestId('entity-title');
    expect(title).toHaveTextContent('God');
    expect(title.props.accessibilityRole).toBe('header');
    expect(screen.getByTestId('entity-appears')).toHaveTextContent(`Appears in ${chaptersOf(GOD)} chapters`);
    const text = screen.getByTestId('entity-overview-text');
    expect(text.props.numberOfLines).toBe(3);
    const toggle = screen.getByTestId('entity-overview-toggle');
    expect(toggle).toHaveTextContent('Read more');
    tall('entity-overview-toggle');
    await fireEvent.press(toggle);
    expect(screen.getByTestId('entity-overview-text').props.numberOfLines ?? 0).toBe(0);
    expect(screen.getByTestId('entity-overview-toggle')).toHaveTextContent('Show less');
    await fireEvent.press(screen.getByTestId('entity-overview-toggle'));
    expect(screen.getByTestId('entity-overview-text').props.numberOfLines).toBe(3);
    await fireEvent.press(screen.getByTestId('entity-back'));
    expect(onBack).toHaveBeenCalledTimes(1);
  });

  it('the timeline: the header row expands; each reference is its own 44 pt row that opens in context', async () => {
    const { storage, navigate } = await renderPage('person', 'god');
    const first = screen.getByTestId('entity-event-0');
    expect(first.props.accessibilityRole).toBe('button');
    expect(first.props.accessibilityState).toMatchObject({ expanded: true });
    expect(first).toHaveTextContent(/Creator of the Universe/);
    // The reference rows sit outside the header button.
    expect(within(first).queryByTestId('entity-dev-0-0')).toBeNull();
    const dev = screen.getByTestId('entity-dev-0-0');
    expect(dev.props.accessibilityRole).toBe('button');
    expect(dev).toHaveTextContent(/God creates the heavens and the earth/);
    expect(dev).toHaveTextContent(/Genesis 1:1/);
    tall('entity-dev-0-0');
    await fireEvent.press(dev);
    expect(readerTargets.get()).toEqual({ bookNumber: 1, chapter: 1, start: 1, end: 1 });
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 1, chapter: 1, translation: 'WEB' });
    expect(navigate).toHaveBeenCalledTimes(1);
    // A closed event opens on its header.
    const second = screen.getByTestId('entity-event-1');
    expect(second.props.accessibilityState).toMatchObject({ expanded: false });
    expect(screen.queryByTestId('entity-dev-1-0')).toBeNull();
    tall('entity-event-1');
    await fireEvent.press(second);
    expect(screen.getByTestId('entity-event-1').props.accessibilityState).toMatchObject({ expanded: true });
    expect(screen.getByTestId('entity-dev-1-0')).toHaveTextContent(/I AM WHO I AM/);
    await fireEvent.press(screen.getByTestId('entity-event-0'));
    expect(screen.queryByTestId('entity-dev-0-0')).toBeNull();
  });

  it('labels eras in the interface language', async () => {
    await renderPage('person', 'god', { locales: [ZH] });
    expect(screen.getByTestId('entity-era-2').props.accessibilityLabel).toBe('时间：出埃及记 20 / 利未记 19');
  });

  it('five events, then Show N more events, ten at a time', async () => {
    await renderPage('person', 'many', { page: async () => withEvents(23) });
    expect(screen.getAllByTestId(/^entity-event-\d+$/)).toHaveLength(5);
    const more = screen.getByTestId('entity-more-events');
    expect(more).toHaveTextContent('Show 10 more events');
    expect(more.props.accessibilityRole).toBe('button');
    tall('entity-more-events');
    await fireEvent.press(more);
    expect(screen.getAllByTestId(/^entity-event-\d+$/)).toHaveLength(15);
    await fireEvent.press(screen.getByTestId('entity-more-events'));
    expect(screen.getAllByTestId(/^entity-event-\d+$/)).toHaveLength(23);
    expect(screen.queryByTestId('entity-more-events')).toBeNull();
  });

  it('the fixture’s seven events show five, then Show 2 more events', async () => {
    await renderPage('person', 'god');
    expect(screen.getByTestId('entity-more-events')).toHaveTextContent('Show 2 more events');
  });

  it('chapters by book in canon order, as 44 pt chips with localised labels, opening the chapter', async () => {
    const { storage, navigate } = await renderPage('person', 'god');
    const groups = groupReferencesByBook(GOD.references);
    const g0 = groups[0]!;
    expect(screen.getByTestId(`entity-book-${g0.bookNumber}`)).toHaveTextContent(/Genesis/);
    const chip = screen.getByTestId(`entity-chapter-${g0.bookNumber}-${g0.chapters[0]}`);
    expect(chip.props.accessibilityLabel).toBe(`Genesis chapter ${g0.chapters[0]}`);
    tall(`entity-chapter-${g0.bookNumber}-${g0.chapters[0]}`);
    readerTargets.set({ bookNumber: 9, chapter: 9, start: 9, end: 9 });
    await fireEvent.press(chip);
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: g0.bookNumber, chapter: g0.chapters[0], translation: 'WEB' });
    expect(readerTargets.get()).toBeNull();
    expect(navigate).toHaveBeenCalledTimes(1);
    expect(screen.getAllByTestId(/^entity-chapter-\d+-\d+$/)).toHaveLength(chaptersOf(GOD));
  });

  it('Chinese: Chinese labels and book names; the English text carries the 英文 badge', async () => {
    await renderPage('person', 'god', { locales: [ZH] });
    expect(screen.getByTestId('entity-kind')).toHaveTextContent('人物');
    expect(screen.getByTestId('entity-appears')).toHaveTextContent(`出现在 ${chaptersOf(GOD)} 章中`);
    expect(screen.getByTestId('entity-book-1')).toHaveTextContent('创世记');
    expect(screen.getByTestId('entity-chapter-1-1').props.accessibilityLabel).toBe('创世记第 1 章');
    expect(screen.getByTestId('entity-overview-toggle')).toHaveTextContent('展开全文');
    expect(screen.getAllByText('英文').length).toBeGreaterThan(0);
  });
});

describe('a theme’s page', () => {
  it('is the note and the chapters (no overview, no timeline)', async () => {
    await renderPage('theme', 'covenant-promise', { page: async () => COVENANT });
    expect(screen.getByTestId('entity-kind')).toHaveTextContent('Theme');
    expect(screen.getByTestId('entity-theme-note')).toHaveTextContent('Chapters whose summary names this theme. Tap one to read it.');
    expect(screen.queryByTestId('entity-overview-text')).toBeNull();
    expect(screen.queryByTestId('entity-timeline')).toBeNull();
    expect(screen.getAllByTestId(/^entity-chapter-\d+-\d+$/)).toHaveLength(chaptersOf(COVENANT));
  });

  it('one chapter says Appears in 1 chapter', async () => {
    await renderPage('theme', 'x', { page: async () => ({ ...COVENANT, references: [COVENANT.references[0]!] }) });
    expect(screen.getByTestId('entity-appears')).toHaveTextContent('Appears in 1 chapter');
  });
});

describe('page states', () => {
  it('loading', async () => {
    await renderPage('person', 'god', { page: () => new Promise(() => undefined) });
    expect(screen.getByTestId('entity-loading')).toHaveTextContent('Loading…');
  });

  it('a page the server does not know: not found, with only Back', async () => {
    await renderPage('person', 'nobody', {
      page: async () => {
        throw new ApiError({ kind: 'http', status: 404, path: '/summary-entities/person/nobody' });
      },
    });
    const none = screen.getByTestId('entity-not-found');
    expect(none).toHaveTextContent(/This page isn’t here/);
    expect(none).toHaveTextContent(/The link may be out of date\./);
    expect(none).not.toHaveTextContent(/renamed/);
    expect(screen.queryByTestId('entity-retry')).toBeNull();
    expect(screen.getByTestId('entity-back')).toBeTruthy();
  });

  it('an unknown kind is not found without asking the server', async () => {
    const { calls } = await renderPage(null, 'god');
    expect(screen.getByTestId('entity-not-found')).toBeTruthy();
    expect(calls.page).toBe(0);
  });

  it('a failed load offers Try again', async () => {
    let down = true;
    const { calls } = await renderPage('person', 'god', {
      page: async () => {
        if (down) throw new ApiError({ kind: 'network', status: 0, path: '/summary-entities/person/god' });
        return GOD;
      },
    });
    expect(screen.getByTestId('entity-error')).toHaveTextContent(/Couldn’t load this page/);
    tall('entity-retry');
    down = false;
    await fireEvent.press(screen.getByTestId('entity-retry'));
    await act(async () => undefined);
    expect(screen.getByTestId('entity-title')).toHaveTextContent('God');
    expect(calls.page).toBe(2);
  });
});
