// Acceptance (orchestrator-owned, R-5b): the commentary view inside the verse sheet (Commentary.dc.html).
// Matthew Henry only; where no note covers the verse the view says so (John, 2026-11-01).
import { QueryClient } from '@tanstack/react-query';
import { fireEvent, render, screen, waitFor, within } from '@testing-library/react-native';
import * as fs from 'fs';
import * as path from 'path';
import { StyleSheet } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApiProvider } from '../../api/ApiProvider';
import { ApiError, type ApiClient, type CommentaryRequest } from '../../api/client';
import type { BookInfo, ChapterOut, CommentaryEntry } from '../../api/schemas';
import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import type { TranslationId } from '../../reader/translations';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { CommentaryView } from '../CommentaryView';

const fixture = (name: string) =>
  JSON.parse(fs.readFileSync(path.resolve(__dirname, `../../../../tests/golden/fixtures/${name}.json`), 'utf8')).body;
const BOOKS: BookInfo[] = fixture('books');
const JOHN = BOOKS[42]!;
const OBADIAH = BOOKS[30]!;
const JOHN3_MH: CommentaryEntry[] = fixture('commentary_john3_mh'); // 3:1–8 (8,159 characters) and 3:22–36 (743)
const OBADIAH_ALL: CommentaryEntry[] = fixture('commentary_obadiah1'); // MH 1–16, a summary, MH 17–21
const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
const ZH: DeviceLocale = { languageTag: 'zh-CN', languageCode: 'zh', regionCode: 'CN' };
const style = (el: { props: { style?: unknown } }) => StyleSheet.flatten(el.props.style as never) ?? {};

/** The backend's answer: entries of that source starting at or before the verse. */
function backend(rows: CommentaryEntry[]) {
  return (req: CommentaryRequest) =>
    rows.filter((e) => (!req.source || e.source === req.source) && (req.verse === undefined || e.verse_start <= req.verse));
}

async function renderView(opts: {
  book?: BookInfo;
  chapter?: ChapterOut;
  translation?: TranslationId;
  verse: number;
  rows?: CommentaryEntry[];
  fail?: () => boolean;
  locales?: DeviceLocale[];
}) {
  const calls: CommentaryRequest[] = [];
  const answer = backend(opts.rows ?? JOHN3_MH);
  const api = {
    commentary: async (req: CommentaryRequest) => {
      calls.push(req);
      if (opts.fail?.()) throw new ApiError({ kind: 'network', status: 0, path: '/commentary' });
      return answer(req);
    },
  } as unknown as ApiClient;
  const storage = createStorage(memoryBackend());
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const locales = opts.locales ?? [EN];
  const onBack = jest.fn();
  const onClose = jest.fn();
  await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <ApiProvider client={api} queryClient={queryClient}>
        <I18nProvider storage={storage} locales={locales}>
          <ThemeProvider storage={storage} systemScheme="light">
            <CommentaryView
              book={opts.book ?? JOHN}
              chapter={opts.chapter ?? fixture('chapter_john3_web')}
              translation={opts.translation ?? 'WEB'}
              verse={opts.verse}
              onBack={onBack}
              onClose={onClose}
            />
          </ThemeProvider>
        </I18nProvider>
      </ApiProvider>
    </SafeAreaProvider>,
  );
  return { calls, onBack, onClose };
}

describe('CommentaryView', () => {
  it('shows Matthew Henry’s note on the verse: its range, the verse pinned on top, a preview, the credit', async () => {
    const { calls } = await renderView({ verse: 3 });
    const view = await screen.findByTestId('commentary-view');
    expect(calls[0]).toEqual({ book: 'John', chapter: 3, verse: 3, source: 'matthew_henry' });
    expect(within(view).getByText('Commentary').props.accessibilityRole).toBe('header');
    expect(await within(view).findByTestId('commentary-range')).toHaveTextContent('John 3:1–8');
    const pinned = within(view).getByTestId('commentary-verse');
    expect(pinned).toHaveTextContent(/unless one is born anew/);
    expect(pinned).toHaveTextContent(/^3/);
    const body = within(view).getByTestId('commentary-entry-2640');
    expect(body).toHaveTextContent(/^Nicodemus was afraid/);
    expect(body).not.toHaveTextContent(/ye workers of iniquity/);
    expect(within(view).getByText('Matthew Henry’s Concise Commentary (public domain)')).toBeTruthy();
    // English everywhere in English: no 英文 badge.
    expect(within(view).queryByText('英文')).toBeNull();
  });

  it('Read all shows the whole note and then goes away', async () => {
    await renderView({ verse: 3 });
    const readAll = await screen.findByTestId('commentary-read-all');
    expect(readAll.props.accessibilityRole).toBe('button');
    expect(readAll.props.accessibilityLabel ?? 'Read all').toBe('Read all');
    expect(style(readAll).minHeight ?? style(readAll).height).toBeGreaterThanOrEqual(44);
    await fireEvent.press(readAll);
    expect(screen.getByTestId('commentary-entry-2640')).toHaveTextContent(/ye workers of iniquity\?”$/);
    expect(screen.queryByTestId('commentary-read-all')).toBeNull();
  });

  it('shows a short note whole, with no Read all', async () => {
    await renderView({ verse: 30 });
    expect(await screen.findByTestId('commentary-range')).toHaveTextContent('John 3:22–36');
    expect(screen.getByTestId('commentary-entry-2641')).toHaveTextContent(/^John was fully satisfied/);
    expect(screen.queryByTestId('commentary-read-all')).toBeNull();
  });

  it('says so where no note covers the verse, with the verse still pinned', async () => {
    await renderView({ verse: 16 });
    const empty = await screen.findByTestId('commentary-empty');
    expect(empty).toHaveTextContent(/No commentary on this verse yet/);
    expect(empty).toHaveTextContent(/Notes for more verses are on the way\./);
    expect(screen.getByTestId('commentary-range')).toHaveTextContent('John 3:16');
    expect(screen.getByTestId('commentary-verse')).toHaveTextContent(/For God so loved the world/);
    expect(screen.queryByTestId('commentary-read-all')).toBeNull();
    expect(screen.queryByText('Matthew Henry’s Concise Commentary (public domain)')).toBeNull();
  });

  it('uses only Matthew Henry, and a one-chapter book’s range', async () => {
    const { calls } = await renderView({ book: OBADIAH, chapter: fixture('chapter_obadiah1_web'), verse: 5, rows: OBADIAH_ALL });
    expect(await screen.findByTestId('commentary-range')).toHaveTextContent('Obadiah 1:1–16');
    expect(calls[0]!.source).toBe('matthew_henry');
    expect(screen.queryByText(/TITLE::/)).toBeNull();
  });

  it('shows a failure with Try again, which loads it', async () => {
    let down = true;
    const { calls } = await renderView({ verse: 3, fail: () => down });
    const error = await screen.findByTestId('commentary-error');
    expect(error).toHaveTextContent(/Couldn’t load the commentary\./);
    down = false;
    await fireEvent.press(screen.getByTestId('commentary-retry'));
    expect(await screen.findByTestId('commentary-entry-2640')).toBeTruthy();
    expect(calls).toHaveLength(2);
  });

  it('goes back to the verse and closes the sheet', async () => {
    const { onBack, onClose } = await renderView({ verse: 3 });
    await screen.findByTestId('commentary-view');
    const back = screen.getByTestId('commentary-back');
    expect(back.props.accessibilityLabel).toBe('Back to the verse');
    await fireEvent.press(back);
    expect(onBack).toHaveBeenCalledTimes(1);
    await fireEvent.press(screen.getByTestId('sheet-close'));
    expect(onClose).toHaveBeenCalledTimes(1);
  });

  it('in Chinese: Chinese chrome and book name, the CUV verse, the English note marked 英文', async () => {
    await renderView({ verse: 3, locales: [ZH], translation: 'CUV-SIMP', chapter: fixture('chapter_john3_cuvsimp') });
    const view = await screen.findByTestId('commentary-view');
    expect(within(view).getByText('注释')).toBeTruthy();
    expect(await within(view).findByTestId('commentary-range')).toHaveTextContent('约翰福音 3:1–8');
    expect(within(view).getByTestId('commentary-verse')).toHaveTextContent(/人若不重生/);
    expect(within(view).getByText('英文')).toBeTruthy();
    expect(within(view).getByText('马太·亨利《圣经简明注释》（公有领域），目前只有英文')).toBeTruthy();
    expect(within(view).getByTestId('commentary-read-all')).toHaveTextContent('阅读全文');
    expect(within(view).getByTestId('commentary-back').props.accessibilityLabel).toBe('返回经文');
  });

  it('in Chinese, the empty view has no 英文 badge', async () => {
    await renderView({ verse: 16, locales: [ZH], translation: 'CUV-SIMP', chapter: fixture('chapter_john3_cuvsimp') });
    expect(await screen.findByTestId('commentary-empty')).toHaveTextContent(/这节经文暂时还没有注释/);
    expect(screen.queryByText('英文')).toBeNull();
  });

  it('leaves the pinned verse out when this translation lacks it', async () => {
    const chapter: ChapterOut = fixture('chapter_john3_web');
    await renderView({ verse: 3, chapter: { ...chapter, verses: chapter.verses.filter((v) => v.verse !== 3) } });
    expect(await screen.findByTestId('commentary-entry-2640')).toBeTruthy();
    expect(screen.queryByTestId('commentary-verse')).toBeNull();
  });
});

describe('CommentaryView waits for nothing it does not need', () => {
  it('shows a loading line until the note arrives', async () => {
    let release: (() => void) | undefined;
    const api = {
      commentary: () => new Promise<CommentaryEntry[]>((resolve) => (release = () => resolve(JOHN3_MH.slice(0, 1)))),
    } as unknown as ApiClient;
    const storage = createStorage(memoryBackend());
    const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false } } });
    await render(
      <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
        <ApiProvider client={api} queryClient={queryClient}>
          <I18nProvider storage={storage} locales={[EN]}>
            <ThemeProvider storage={storage} systemScheme="light">
              <CommentaryView book={JOHN} chapter={fixture('chapter_john3_web')} translation="WEB" verse={3} onBack={() => {}} onClose={() => {}} />
            </ThemeProvider>
          </I18nProvider>
        </ApiProvider>
      </SafeAreaProvider>,
    );
    expect(await screen.findByTestId('commentary-loading')).toHaveTextContent('Loading…');
    release?.();
    await waitFor(() => expect(screen.queryByTestId('commentary-loading')).toBeNull());
    expect(screen.getByTestId('commentary-entry-2640')).toBeTruthy();
  });
});
