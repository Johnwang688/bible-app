import { act, fireEvent, render, screen, waitFor } from '@testing-library/react-native';
import { QueryClient } from '@tanstack/react-query';
import { createRef } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApiProvider } from '../../api/ApiProvider';
import { I18nProvider } from '../../i18n/I18nProvider';
import { createT } from '../../i18n/translate';
import { ReaderScreen } from '../../reader/components/ReaderScreen';
import { firstVisibleVerse } from '../../reader/components/scrollToVerse';
import { fakeApi, EN } from '../../reader/__tests__/readerHarness';
import { readerPositionKey, type ReaderPosition } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { barStacked, ReadAloudBar } from '../components/ReadAloudBar';
import { voiceLanguageLabel } from '../components/VoiceSpeedSheet';
import { memoryPrefs, ReadAloudController, type ReadAloudStatus } from '../controller';
import type { ReadAloud } from '../useReadAloud';
import { FakeEngine, VOICES, voice } from './fakeEngine';

const chapter = { key: '43:3:BSB', translation: 'BSB' as const, verses: [{ verse: 1, text: 'In the beginning.' }], nextKey: '43:4:BSB' };

describe('samples', () => {
  it('tracks the sample, ignores stale callbacks, stops explicitly and stays paused', async () => {
    const engine = new FakeEngine();
    const c = new ReadAloudController({ engine });
    expect(c.getState().sampleVoiceId).toBeNull();
    await c.start(chapter);
    c.sample('samantha', 'Sample.');
    expect(c.getState()).toMatchObject({ status: 'paused', sampleVoiceId: 'samantha' });
    const old = engine.current!;
    c.sample('daniel', 'New sample.');
    old.opts.onDone();
    old.opts.onError(new Error('late'));
    expect(c.getState().sampleVoiceId).toBe('daniel');
    engine.finish();
    expect(c.getState()).toMatchObject({ status: 'paused', sampleVoiceId: null });
    c.sample('samantha', 'Sample.');
    engine.fail('failed');
    expect(c.getState()).toMatchObject({ status: 'paused', sampleVoiceId: null });
    c.sample('daniel', 'Sample.');
    c.stopSample();
    expect(engine.current).toBeNull();
    expect(c.getState()).toMatchObject({ status: 'paused', sampleVoiceId: null });
    c.sample('daniel', 'Sample.');
    c.stop();
    expect(c.getState()).toMatchObject({ status: 'idle', sampleVoiceId: null });
    c.dispose();
  });
});

it('stacks using only the available bar width and Latin/CJK label estimates', () => {
  expect(barStacked(374, '')).toBe(false);
  expect(barStacked(400, 'Reading BSB')).toBe(false);
  expect(barStacked(400, '正'.repeat(12))).toBe(true);
  expect(barStacked(400, 'a'.repeat(20))).toBe(false);
  expect(barStacked(400, 'a'.repeat(21))).toBe(true);
});

it.each(['Reading BSB', 'Paused · BSB', '正在朗读和合本', '已暂停 · 和合本'])('keeps %s in one row in a 358px bar', (label) => {
  expect(barStacked(358, label)).toBe(false);
});

it('stacks a long translation name in a 358px bar', () => {
  expect(barStacked(358, 'Reading CUV (Traditional)')).toBe(true);
});

it('finds the first number at or below the top line, with a top-of-chapter exception', () => {
  const verses = [{ verse: 1, y: 80 }, { verse: 2, y: 150 }, { verse: 4, y: 240 }];
  expect(firstVisibleVerse(verses, 4, 100)).toBe(1);
  expect(firstVisibleVerse(verses, 50, 100)).toBe(2);
  expect(firstVisibleVerse(verses, 51, 100)).toBe(4);
  expect(firstVisibleVerse(verses, 140, 0)).toBe(2);
  expect(firstVisibleVerse(verses, 500, 100)).toBe(4);
  expect(firstVisibleVerse([], 0, 100)).toBeUndefined();
});

it.each([
  ['en_US', 'English (US)', '英语（美国）'], ['en-GB', 'English (UK)', '英语（英国）'], ['en-AU', 'English', '英语'],
  ['zh-CN', 'Chinese (Mainland China)', '中文（中国大陆）'], ['cmn-TW', 'Chinese (Taiwan)', '中文（台湾）'],
  ['yue-HK', 'Cantonese (Hong Kong)', '粤语（香港）'], ['zh', 'Chinese', '中文'],
])('labels %s in both interface languages', (lang, en, zh) => {
  expect(voiceLanguageLabel(voice('v', lang), createT('en'))).toBe(en);
  expect(voiceLanguageLabel(voice('v', lang), createT('zh-Hans'))).toBe(zh);
});

async function renderBar(status: ReadAloudStatus, hidden = false) {
  const storage = createStorage(memoryBackend());
  const c = new ReadAloudController({ engine: new FakeEngine(), prefs: memoryPrefs() });
  const read = { ...c.getState(), status, verse: status === 'advancing' ? null : 16, translation: 'BSB', total: 36, position: 16,
    prev: jest.fn(), next: jest.fn(), toggle: jest.fn(), resume: jest.fn(), playNextChapter: jest.fn() } as unknown as ReadAloud;
  return render(<I18nProvider storage={storage} locales={[EN]}><ThemeProvider storage={storage} systemScheme="light">
    <ReadAloudBar read={read} translation="BSB" endTitle="End of John 3" nextTitle="John 4" hidden={hidden} insets={{ bottom: 0 }}
      onStop={jest.fn()} onOpenVoice={jest.fn()} onBack={jest.fn()} onPlayNext={jest.fn()} onHeight={jest.fn()} toggleRef={createRef()} speedRef={createRef()} />
  </ThemeProvider></I18nProvider>);
}

it.each([
  ['playing', 'Reading BSB'], ['paused', 'Paused · BSB'], ['preparing', 'Starting…'], ['advancing', 'Starting…'], ['error', 'Couldn’t read verse 16'],
] as const)('labels the %s bar', async (status, expected) => {
  await renderBar(status);
  expect(screen.getByTestId('read-aloud-status')).toHaveTextContent(expected);
  if (status === 'error') expect(screen.getByTestId('read-aloud-toggle').props.accessibilityLabel).toBe('Play');
});

it.each(['idle', 'no-voice'] as const)('has no bar while %s', async (status) => {
  await renderBar(status);
  expect(screen.queryByTestId('read-aloud-bar')).toBeNull();
});

async function reader(position: ReaderPosition, engine = new FakeEngine()) {
  const storage = createStorage(memoryBackend());
  storage.set(readerPositionKey, position);
  const { api } = fakeApi();
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const view = await render(<SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 0, bottom: 0, left: 0, right: 0 } }}>
    <ApiProvider client={api} queryClient={queryClient}><I18nProvider storage={storage} locales={[EN]}><ThemeProvider storage={storage} systemScheme="light">
      <ReaderScreen storage={storage} speechEngine={engine} />
    </ThemeProvider></I18nProvider></ApiProvider>
  </SafeAreaProvider>);
  await screen.findByTestId('verse-1');
  await fireEvent.press(screen.getByTestId('reader-tools-button'));
  await fireEvent.press(screen.getByTestId('read-aloud-start'));
  return { engine, view };
}

it('offers the next BOOK at a book end and plays its verse 1', async () => {
  const { engine } = await reader({ bookNumber: 40, chapter: 28, translation: 'BSB' });
  await waitFor(() => expect(engine.current).not.toBeNull());
  await act(async () => engine.finishAll());
  expect(screen.getByTestId('read-aloud-play-next')).toHaveTextContent('Play Mark 1');
  await fireEvent.press(screen.getByTestId('read-aloud-play-next'));
  await waitFor(() => expect(engine.current?.text).toBe('Mark 1:1 BSB'));
});

it('only offers Done at Revelation 22 and a hand turn drops the end card', async () => {
  const { engine } = await reader({ bookNumber: 66, chapter: 22, translation: 'BSB' });
  await waitFor(() => expect(engine.current).not.toBeNull());
  await act(async () => engine.finishAll());
  expect(screen.getByTestId('read-aloud-status')).toHaveTextContent('End of Revelation 22');
  expect(screen.queryByTestId('read-aloud-play-next')).toBeNull();
  expect(screen.queryByText('Keep listening?')).toBeNull();
  await fireEvent.press(screen.getByTestId('reader-prev'));
  expect(screen.queryByTestId('read-aloud-bar')).toBeNull();
});

it('never speaks Chinese with an English voice and checks again after a voice is installed', async () => {
  const { engine } = await reader({ bookNumber: 43, chapter: 3, translation: 'CUV-SIMP' }, new FakeEngine([VOICES.samantha]));
  await screen.findByTestId('no-voice-sheet');
  expect(engine.texts).toEqual([]);
  await fireEvent.press(screen.getByTestId('read-aloud-check'));
  await waitFor(() => expect(screen.getByTestId('read-aloud-no-voice-still')).toHaveTextContent('Still no Chinese voice'));
  engine.voices.push(VOICES.tingting);
  await fireEvent.press(screen.getByTestId('read-aloud-check'));
  await waitFor(() => expect(engine.current?.opts.voiceId).toBe('tingting'));
  expect(screen.queryByTestId('no-voice-sheet')).toBeNull();
});
