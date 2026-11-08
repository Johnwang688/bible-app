import { QueryClient } from '@tanstack/react-query';
import { act, fireEvent, render, screen, waitFor } from '@testing-library/react-native';
import { AccessibilityInfo, BackHandler, Platform, StyleSheet } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApiProvider } from '../../api/ApiProvider';
import type { CommentaryRequest } from '../../api/client';
import type { CommentaryEntry } from '../../api/schemas';
import { I18nProvider } from '../../i18n/I18nProvider';
import { ReaderScreen } from '../../reader/components/ReaderScreen';
import { BOOKS, EN, ZH, fakeApi } from '../../reader/__tests__/readerHarness';
import { readerTargets } from '../../reader/target';
import { readerPositionKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { ChapterSummaryView } from '../ChapterSummaryView';

const mockEscape = new Map<symbol, () => void>();
jest.mock('../../components/escapeStack', () => ({
  useEscapeKey: (handler: () => void, { enabled = true } = {}) => {
    const React = jest.requireActual('react') as typeof import('react');
    const key = React.useRef(Symbol());
    React.useLayoutEffect(() => {
      const id = key.current;
      if (enabled) mockEscape.set(id, handler);
      return () => { mockEscape.delete(id); };
    }, [handler, enabled]);
  },
}));

const CONTENT = 'TITLE::Life in the Son\n\nJesus speaks to Nicodemus.\n\nThemes: hidden-tag\nKey People: hidden-person\nKey Places: hidden-place\n\nKey Points:\n• God loves the world.\n• Believe in the Son.\n\nSupporting Verses: John 3:16-18 · John 3:36';
const ROW: CommentaryEntry = { id: 1, book_number: 43, chapter: 3, verse_start: 1, verse_end: null, source: 'summary', content: CONTENT };
type State = 'ready' | 'loading' | 'error' | 'empty';
let announce: jest.SpyInstance;
let hardwareBack: (() => boolean | null | undefined) | undefined;
const originalOS = Platform.OS;

beforeEach(() => {
  announce = jest.spyOn(AccessibilityInfo, 'announceForAccessibility').mockImplementation(() => {});
  announce.mockClear();
  readerTargets.clear();
  hardwareBack = undefined;
  jest.spyOn(BackHandler, 'addEventListener').mockImplementation((_, handler) => {
    hardwareBack = () => handler({} as never);
    return { remove: jest.fn() };
  });
});
afterEach(() => { jest.restoreAllMocks(); Platform.OS = originalOS; readerTargets.clear(); });

async function setup(state: State, opts: { entry?: 'tools' | 'fallback'; chinese?: boolean } = {}) {
  const storage = createStorage(memoryBackend());
  storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: opts.chinese ? 'CUV-SIMP' : 'WEB' });
  const { api } = fakeApi();
  let current = state;
  const requests: CommentaryRequest[] = [];
  api.commentary = jest.fn(async (request) => {
    requests.push(request);
    if (request.source !== 'summary') return [];
    if (current === 'loading') return new Promise<CommentaryEntry[]>(() => {});
    if (current === 'error') throw new Error('test failure');
    return current === 'empty' ? [] : [ROW];
  });
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const onBack = jest.fn(); const onClose = jest.fn(); const onOpenRange = jest.fn();
  const ui = await render(<SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
    <ApiProvider client={api} queryClient={queryClient}>
      <I18nProvider storage={storage} locales={[opts.chinese ? ZH : EN]}>
        <ThemeProvider storage={storage} systemScheme="light">
          {opts.entry ? <ReaderScreen storage={storage} /> : <ChapterSummaryView book={BOOKS[42]!} chapter={3} translation={opts.chinese ? 'CUV-SIMP' : 'WEB'} onBack={onBack} onClose={onClose} onOpenRange={onOpenRange} />}
        </ThemeProvider>
      </I18nProvider>
    </ApiProvider>
  </SafeAreaProvider>);
  if (opts.entry === 'tools') {
    await screen.findByTestId('verse-1');
    await fireEvent.press(screen.getByTestId('reader-tools-button'));
    await fireEvent.press(screen.getByTestId('chapter-summary-open'));
  } else if (opts.entry === 'fallback') {
    await screen.findByTestId('verse-16');
    await fireEvent.press(screen.getByTestId('verse-16-tools'));
    await fireEvent.press(screen.getByTestId('sheet-commentary'));
    await fireEvent.press(await screen.findByTestId('commentary-summary'));
  }
  await screen.findByTestId(state === 'ready' ? 'summary-content-title' : `summary-${state}`);
  return { ui, queryClient, requests, onBack, onClose, onOpenRange, recover: () => { current = 'ready'; } };
}

it('requests the chapter summary without a verse, hides tags and places the footnote after points', async () => {
  const { requests, onOpenRange } = await setup('ready');
  expect(requests).toEqual([{ book: 'John', chapter: 3, source: 'summary' }]);
  expect(screen.queryByText(/hidden-/)).toBeNull();
  const order = screen.getAllByTestId(/^summary-(content-title|points|footnote)$/).map((n) => n.props.testID);
  expect(order).toEqual(['summary-content-title', 'summary-points', 'summary-footnote']);
  expect(StyleSheet.flatten(screen.getByTestId('summary-footnote').props.style).fontSize).toBeGreaterThanOrEqual(13);
  expect(screen.getByTestId('summary-reference-0').props.accessibilityLabel).toBe('Read John 3:16–18, starting at verse 16');
  await fireEvent.press(screen.getByTestId('summary-reference-0'));
  expect(onOpenRange).toHaveBeenCalledWith({ bookNumber: 43, chapter: 3, start: 16, end: 18 });
});

it('announces loading once and leaves Close and Back available', async () => {
  const { onBack, onClose, queryClient } = await setup('loading');
  expect(announce).toHaveBeenCalledTimes(1);
  expect(announce).toHaveBeenCalledWith('Loading chapter summary…');
  await act(() => queryClient.setQueryData(['books'], [...BOOKS]));
  expect(announce).toHaveBeenCalledTimes(1);
  await fireEvent.press(screen.getByTestId('summary-back'));
  await fireEvent.press(screen.getByTestId('summary-close'));
  expect(onBack).toHaveBeenCalledTimes(1); expect(onClose).toHaveBeenCalledTimes(1);
});

it('announces failure and Retry loads the summary', async () => {
  const { recover } = await setup('error');
  expect(announce).toHaveBeenCalledWith('Couldn’t load the chapter summary.');
  recover();
  await fireEvent.press(screen.getByTestId('summary-retry'));
  await screen.findByTestId('summary-content-title');
  expect(announce).toHaveBeenCalledWith('Chapter summary loaded.');
});

it('announces missing content without a Retry', async () => {
  await setup('empty');
  expect(announce).toHaveBeenCalledWith('No summary is available for this chapter yet.');
  expect(screen.queryByTestId('summary-retry')).toBeNull();
});

it('uses Chinese chrome, badge, punctuation and whole-sentence reference labels', async () => {
  await setup('ready', { chinese: true });
  expect(screen.getByText('章节概要')).toBeTruthy();
  expect(screen.getByText('英文')).toBeTruthy();
  expect(screen.getByTestId('summary-footnote')).toHaveTextContent('AI 撰写的章节概要。 已对照圣经经文核查，仍可能有错误。');
  expect(screen.getByTestId('summary-reference-0').props.accessibilityLabel).toBe('阅读约翰福音 3:16–18，从第 16 节开始');
});

describe.each(['tools', 'fallback'] as const)('%s entry', (entry) => {
  it.each(['ready', 'loading', 'error', 'empty'] as const)('Back and Escape share the parent path in %s', async (state) => {
    await setup(state, { entry });
    const sheetID = entry === 'tools' ? 'chapter-tools-sheet' : 'verse-sheet';
    expect(screen.getAllByTestId(sheetID)).toHaveLength(1);
    await fireEvent.press(screen.getByTestId('summary-back'));
    expect(screen.queryByTestId('summary-view')).toBeNull();
    const parent = entry === 'tools' ? 'chapter-summary-open' : 'commentary-summary';
    await fireEvent.press(await screen.findByTestId(parent));
    await act(() => [...mockEscape.values()].at(-1)?.());
    expect(screen.queryByTestId('summary-view')).toBeNull();
    expect(await screen.findByTestId(parent)).toBeTruthy();
    await act(() => [...mockEscape.values()].at(-1)?.());
    if (entry === 'fallback') {
      expect(screen.getByTestId('sheet-actions')).toBeTruthy();
      await act(() => [...mockEscape.values()].at(-1)?.());
    }
    expect(screen.queryByTestId(sheetID)).toBeNull();
  });

  it.each(['ready', 'loading', 'error', 'empty'] as const)('Android back shares the same path in %s', async (state) => {
    Platform.OS = 'android';
    await setup(state, { entry });
    await act(async () => {
      if (entry === 'tools') await fireEvent(screen.getByTestId('chapter-tools-sheet-modal'), 'requestClose');
      else hardwareBack?.();
    });
    expect(screen.queryByTestId('summary-view')).toBeNull();
    expect(await screen.findByTestId(entry === 'tools' ? 'chapter-summary-open' : 'commentary-summary')).toBeTruthy();
  });

  it('a reference closes its sheet and selects the full range', async () => {
    await setup('ready', { entry });
    await fireEvent.press(screen.getByTestId('summary-reference-0'));
    await waitFor(() => expect(screen.queryByTestId('summary-view')).toBeNull());
    expect(screen.queryByTestId('verse-sheet')).toBeNull();
    expect(screen.queryByTestId('chapter-tools-sheet')).toBeNull();
    for (const verse of [16, 17, 18]) expect(screen.getByTestId(`verse-${verse}-tools`).props.accessibilityState?.selected).toBe(true);
    expect(announce).toHaveBeenCalledWith('Opened John 3:16–18 in the reader.');
  });
});
