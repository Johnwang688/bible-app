// Acceptance (orchestrator-owned, R-5 part 2): Study → Explore (design/proposed/r5-explore.html, approved by
// John, with the fixes in r5/GO-AHEAD.md).
import { QueryClient } from '@tanstack/react-query';
import { act, fireEvent, render, screen, within } from '@testing-library/react-native';
import * as fs from 'fs';
import * as path from 'path';
import { StyleSheet, Text } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApiProvider } from '../../api/ApiProvider';
import { ApiError, type ApiClient } from '../../api/client';
import type { BookInfo, EntityKind, SummaryEntityListItemOut } from '../../api/schemas';
import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { readerPositionKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { StudyScreen } from '../../study/components/StudyScreen';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { ExploreView } from '../components/ExploreView';
import { filterEntityList } from '../data';

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
const tall = (id: string) => {
  const s = style(screen.getByTestId(id));
  expect(Number(s.minHeight ?? 0)).toBeGreaterThanOrEqual(44);
  expect(s.height).toBeUndefined();
};

async function renderExplore(o: { locales?: DeviceLocale[]; list?: (kind: EntityKind) => Promise<SummaryEntityListItemOut[]>; study?: boolean } = {}) {
  const calls: EntityKind[] = [];
  const api = {
    books: async () => BOOKS,
    entities: async (kind: EntityKind) => {
      calls.push(kind);
      return (o.list ?? (async (k: EntityKind) => LISTS[k]))(kind);
    },
  } as unknown as ApiClient;
  const storage = createStorage(memoryBackend());
  storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'WEB' });
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const locales = o.locales ?? [EN];
  const onOpen = jest.fn();
  await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <ApiProvider client={api} queryClient={queryClient}>
        <I18nProvider storage={storage} locales={locales}>
          <ThemeProvider storage={storage} systemScheme="light">
            {o.study ? (
              <StudyScreen storage={storage} locales={locales} now={() => new Date(2026, 10, 2, 12)} />
            ) : (
              <ExploreView header={<Text>HEADER</Text>} bottomInset={120} onOpen={onOpen} />
            )}
          </ThemeProvider>
        </I18nProvider>
      </ApiProvider>
    </SafeAreaProvider>,
  );
  await act(async () => undefined);
  return { calls, onOpen };
}

const find = async (q: string) => fireEvent.changeText(screen.getByTestId('explore-find'), q);

describe('Explore', () => {
  it('is the third Study segment, a 44 pt tab', async () => {
    await renderExplore({ study: true });
    const tab = screen.getByTestId('study-tab-explore');
    expect(tab).toHaveTextContent('Explore');
    expect(tab.props.accessibilityRole).toBe('tab');
    tall('study-tab-explore');
    tall('study-tab-saved');
    expect(screen.queryByTestId('explore-find')).toBeNull();
    await fireEvent.press(tab);
    expect(screen.getByTestId('study-tab-explore').props.accessibilityState).toMatchObject({ selected: true });
    expect(screen.getByTestId('explore-find')).toBeTruthy();
    expect(screen.getByTestId('screen-study')).toHaveTextContent(/Study/);
  });

  it('shows the header, the find field that states the rule, and a card per kind with its count', async () => {
    const { onOpen } = await renderExplore();
    expect(screen.getByText('HEADER')).toBeTruthy();
    const field = screen.getByTestId('explore-find');
    expect(field.props.placeholder).toBe('Find a person, place or theme');
    expect(field.props.accessibilityLabel).toBe('Find a person, place or theme');
    expect(field.props.accessibilityHint).toBe('Names match when they, or a word in them, start with what you type.');
    const people = screen.getByTestId('explore-card-person');
    expect(people).toHaveTextContent(/People/);
    expect(people).toHaveTextContent(/467/);
    expect(people).toHaveTextContent(/Who’s who, with overviews and timelines/);
    expect(people.props.accessibilityRole).toBe('button');
    expect(screen.getByTestId('explore-card-place')).toHaveTextContent(/91/);
    expect(screen.getByTestId('explore-card-theme')).toHaveTextContent(/2,989/);
    tall('explore-card-person');
    await fireEvent.press(screen.getByTestId('explore-card-theme'));
    expect(onOpen).toHaveBeenCalledWith('/entities/theme');
  });

  it('finds across the three kinds, three each, with See all N opening the filtered list', async () => {
    const { onOpen } = await renderExplore();
    await find('jo');
    expect(screen.queryByTestId('explore-card-person')).toBeNull();
    const kinds = screen.getAllByTestId(/^explore-group-/).map((n) => n.props.testID);
    expect(kinds).toEqual(['explore-group-person', 'explore-group-place', 'explore-group-theme']);
    const people = screen.getByTestId('explore-group-person');
    expect(within(people).getAllByTestId(/^explore-result-person-/)).toHaveLength(3);
    expect(screen.getByTestId('explore-result-person-job')).toHaveTextContent('Job');
    const seeAll = screen.getByTestId('explore-see-all-person');
    expect(seeAll).toHaveTextContent(`See all ${filterEntityList(LISTS.person, 'jo').length}`);
    expect(seeAll.props.accessibilityRole).toBe('button');
    tall('explore-see-all-person');
    tall('explore-result-person-job');
    await fireEvent.press(seeAll);
    expect(onOpen).toHaveBeenLastCalledWith('/entities/person?q=jo');
    await fireEvent.press(screen.getByTestId('explore-result-place-joppa'));
    expect(onOpen).toHaveBeenLastCalledWith('/entities/place/joppa');
  });

  it('a kind with no match has no group; one letter keeps the cards', async () => {
    await renderExplore();
    await find('joab');
    expect(screen.getByTestId('explore-group-person')).toBeTruthy();
    expect(screen.queryByTestId('explore-group-place')).toBeNull();
    await find('j');
    expect(screen.getByTestId('explore-card-person')).toBeTruthy();
    expect(screen.queryByTestId('explore-group-person')).toBeNull();
  });

  it('says so when nothing matches, stating the rule; a Chinese query explains the names are English', async () => {
    await renderExplore();
    await find('xyz');
    const none = screen.getByTestId('explore-no-match');
    expect(none).toHaveTextContent(/Nothing matches “xyz”\./);
    expect(none).toHaveTextContent(/start with what you type/);
    await find('亚伯拉罕');
    expect(screen.getByTestId('explore-no-match')).toHaveTextContent('People, places and themes have English names only for now. Search for them in English.');
    await fireEvent.press(screen.getByTestId('explore-find-clear'));
    expect(screen.getByTestId('explore-find').props.value).toBe('');
    expect(screen.getByTestId('explore-card-person')).toBeTruthy();
  });

  it('loading', async () => {
    await renderExplore({ list: () => new Promise(() => undefined) });
    expect(screen.getByTestId('explore-loading')).toHaveTextContent('Loading…');
  });

  it('a failure replaces the cards with Try again and disables the field', async () => {
    let down = true;
    const { calls } = await renderExplore({
      list: async (k) => {
        if (down && k === 'place') throw new ApiError({ kind: 'network', status: 0, path: '/summary-entities/list/place' });
        return LISTS[k];
      },
    });
    expect(screen.getByTestId('explore-error')).toHaveTextContent(/Couldn’t load the lists/);
    expect(screen.queryByTestId('explore-card-person')).toBeNull();
    expect(screen.getByTestId('explore-find').props.editable).toBe(false);
    tall('explore-retry');
    down = false;
    await fireEvent.press(screen.getByTestId('explore-retry'));
    await act(async () => undefined);
    expect(screen.getByTestId('explore-card-place')).toHaveTextContent(/91/);
    expect(screen.getByTestId('explore-find').props.editable).not.toBe(false);
    expect(calls.filter((k) => k === 'place')).toHaveLength(2);
  });

  it('Chinese: Chinese labels; each card and group carries 英文', async () => {
    await renderExplore({ locales: [ZH] });
    expect(screen.getByTestId('explore-find').props.placeholder).toBe('查找人物、地点或主题');
    for (const k of ['person', 'place', 'theme'] as const) {
      expect(within(screen.getByTestId(`explore-card-${k}`)).getByText('英文')).toBeTruthy();
    }
    expect(screen.getByTestId('explore-card-person')).toHaveTextContent(/人物/);
    await find('jo');
    expect(within(screen.getByTestId('explore-group-person')).getByText('英文')).toBeTruthy();
    expect(screen.getByTestId('explore-see-all-person')).toHaveTextContent(`查看全部 ${filterEntityList(LISTS.person, 'jo').length} 个`);
    await find('亚伯拉罕');
    expect(screen.getByTestId('explore-no-match')).toHaveTextContent('人物、地点和主题目前只有英文名称，请用英文查找');
  });
});
