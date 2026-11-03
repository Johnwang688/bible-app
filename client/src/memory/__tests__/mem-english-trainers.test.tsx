// English Memory (EN-1): the trainers follow the app language. In English each trainer shows the English text,
// chunks and reference with the translation notice; in 中文 the same step shows the Chinese and no notice. Progress
// is per verse id, shared by both. English chunk order uses the English chunk count, fill-in hides and grades an
// English chunk, and full recall takes the English reference at either edge.
import { act, cleanup, fireEvent, screen, within } from '@testing-library/react-native';

import { languageKey } from '../../storage/keys';
import { memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import type { StageSlug } from '../types';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { Recorder } from '../voice/types';
import { EN, renderMemory, ZH } from './memoryHarness';

const recorder: Recorder = {
  supported: false,
  permission: async () => 'unsupported',
  start: async () => 'unsupported',
  stop: async () => null,
  cancel: () => undefined,
};

/** A practice step (no lesson), its verses following the interface language. */
async function step(verseId: string, stage: StageSlug, opts: { locale?: 'en' | 'zh'; storage?: Storage; random?: () => number } = {}) {
  const storage = opts.storage ?? createStorage(memoryBackend());
  const rendered = await renderMemory(
    ({ now, onNavigate }) => (
      <LessonScreen
        verseId={verseId}
        stage={stage}
        index={null}
        storage={storage}
        now={now}
        onNavigate={onNavigate}
        recorder={recorder}
        checkVoice={async () => ({ kind: 'error' })}
        getAppCheckToken={async () => null}
        isOnline={() => true}
        random={opts.random ?? (() => 0.7)}
      />
    ),
    { storage, locales: [opts.locale === 'zh' ? ZH : EN], verses: 'locale' },
  );
  return { ...rendered, storage };
}

const trainer = () => screen.getByTestId('memory-trainer');
const notices = () => screen.queryAllByTestId('memory-scripture-notice');

async function typeAnswer(text: string) {
  // Voice can't record here, so typing is already open (the notice stands in the mic's place).
  const toggle = screen.queryByTestId('memory-type-toggle');
  if (toggle) await fireEvent.press(toggle);
  await fireEvent.changeText(screen.getByTestId('memory-type-input'), text);
  await fireEvent.press(screen.getByTestId('memory-type-check'));
}

async function solveChunkOrder(n: number) {
  for (let c = 0; c < n; c++) await fireEvent.press(screen.getByTestId(`chunk-chip-${c}`));
  await fireEvent.press(screen.getByTestId('chunk-check'));
}

beforeEach(() => resetVoiceSessionForTesting());

describe('the trainers follow the app language', () => {
  const verse = getMemoryVerse('galatians-2-20')!;

  it('chunk order: English chunks, reference and notice in English; the Chinese and no notice in 中文', async () => {
    await step(verse.id, 'chunk-order');
    verse.chunksEn.forEach((chunk, c) => expect(screen.getByTestId(`chunk-chip-${c}`)).toHaveTextContent(chunk));
    expect(screen.queryByTestId(`chunk-chip-${verse.chunksEn.length}`)).toBeNull();
    expect(trainer()).toHaveTextContent(verse.referenceEn, { exact: false });
    expect(trainer()).not.toHaveTextContent(verse.referenceZh, { exact: false });
    expect(notices()).toHaveLength(1);
    await cleanup();

    await step(verse.id, 'chunk-order', { locale: 'zh' });
    verse.chunks.forEach((chunk, c) => expect(screen.getByTestId(`chunk-chip-${c}`)).toHaveTextContent(chunk));
    expect(screen.queryByTestId(`chunk-chip-${verse.chunks.length}`)).toBeNull();
    expect(trainer()).toHaveTextContent(verse.referenceZh, { exact: false });
    expect(trainer()).not.toHaveTextContent(verse.referenceEn, { exact: false });
    expect(notices()).toHaveLength(0);
  });

  it('fill-in: the English verse with an English chunk blanked; the Chinese verse in 中文', async () => {
    await step(verse.id, 'fill-blank');
    const position = Math.floor(0.7 * verse.chunksEn.length);
    expect(screen.getByTestId('memory-blank')).toBeTruthy();
    verse.chunksEn.forEach((chunk, i) => {
      if (i === position) expect(trainer()).not.toHaveTextContent(chunk, { exact: false });
      else expect(trainer()).toHaveTextContent(chunk, { exact: false });
    });
    expect(trainer()).toHaveTextContent(verse.referenceEn, { exact: false });
    expect(notices()).toHaveLength(1);
    await cleanup();

    await step(verse.id, 'fill-blank', { locale: 'zh' });
    const zhPosition = Math.floor(0.7 * verse.chunks.length);
    verse.chunks.forEach((chunk, i) => {
      if (i !== zhPosition) expect(trainer()).toHaveTextContent(chunk, { exact: false });
    });
    expect(trainer()).not.toHaveTextContent(verse.chunksEn[0]!, { exact: false });
    expect(notices()).toHaveLength(0);
  });

  it('full recall: the English topic, reference forms and hint text; the Chinese in 中文', async () => {
    await step(verse.id, 'full-recall');
    expect(trainer()).toHaveTextContent(verse.topicEn, { exact: false });
    expect(trainer()).not.toHaveTextContent(verse.topicZh, { exact: false });
    expect(screen.getByTestId('memory-ref-help')).toHaveTextContent(verse.referenceEn, { exact: false });
    expect(notices()).toHaveLength(1);
    await fireEvent.press(screen.getByTestId('memory-hint'));
    // Each word's first letter: "I have been crucified" -> "I h___ b___ c________".
    expect(screen.getByTestId('memory-hint-text')).toHaveTextContent(/^I h___ b___ c________ w___ C_____,/);
    await fireEvent.press(screen.getByTestId('memory-hint'));
    expect(screen.getByTestId('memory-hint-text')).toHaveTextContent(verse.textEn);
    await cleanup();

    await step(verse.id, 'full-recall', { locale: 'zh' });
    expect(trainer()).toHaveTextContent(verse.topicZh, { exact: false });
    expect(trainer()).not.toHaveTextContent(verse.topicEn, { exact: false });
    expect(screen.getByTestId('memory-ref-help')).toHaveTextContent(verse.referenceZh, { exact: false });
    await fireEvent.press(screen.getByTestId('memory-hint'));
    await fireEvent.press(screen.getByTestId('memory-hint'));
    expect(screen.getByTestId('memory-hint-text')).toHaveTextContent(verse.textZh);
    expect(notices()).toHaveLength(0);
  });

  it('progress recorded in English is the same row in Chinese', async () => {
    const storage = createStorage(memoryBackend());
    const { storage: s } = await step(verse.id, 'chunk-order', { storage });
    await solveChunkOrder(verse.chunksEn.length);
    expect(screen.getByTestId('memory-result-title')).toBeTruthy();
    expect(s.get(memoryProgressKey)[verse.id]).toMatchObject({ successes: 1, failures: 0 });

    // Switch the interface to 中文 mid-session: the step remounts in Chinese, and a pass there adds to the same row.
    await act(async () => {
      storage.set(languageKey, 'zh-Hans');
    });
    verse.chunks.forEach((chunk, c) => expect(screen.getByTestId(`chunk-chip-${c}`)).toHaveTextContent(chunk));
    await solveChunkOrder(verse.chunks.length);
    expect(Object.keys(s.get(memoryProgressKey))).toEqual([verse.id]);
    expect(s.get(memoryProgressKey)[verse.id]).toMatchObject({ successes: 2, failures: 0 });
  });

  it('any change of the language preference renews the step, even one that keeps the verse language', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(languageKey, 'en');
    await step(verse.id, 'chunk-order', { storage });
    for (let i = 0; i < verse.chunksEn.length; i++) await fireEvent.press(screen.getByTestId(`chunk-chip-${i}`));
    const check = screen.getByTestId('chunk-check');
    // `system` resolves to English here (the harness's English locales): the verses stay English, the step is left.
    await act(async () => {
      storage.set(languageKey, 'system');
      await fireEvent.press(check);
    });
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(screen.queryByTestId('memory-result-title')).toBeNull();
    expect(screen.getByTestId('chunk-chip-0')).toHaveTextContent(verse.chunksEn[0]!);
  });
});

describe('English grading in the trainers', () => {
  it('chunk order solves with the English chunk count (6 phrases, where the Chinese has 4)', async () => {
    const verse = getMemoryVerse('galatians-2-20')!;
    expect(verse.chunksEn.length).not.toBe(verse.chunks.length);
    const { storage } = await step(verse.id, 'chunk-order');
    await solveChunkOrder(verse.chunksEn.length);
    expect(screen.getByTestId('memory-result-pct')).toHaveTextContent(`${verse.chunksEn.length} / ${verse.chunksEn.length}`);
    expect(storage.get(memoryProgressKey)[verse.id]).toMatchObject({ successes: 1 });
  });

  it('fill-in grades the hidden English chunk', async () => {
    const verse = getMemoryVerse('2-corinthians-5-17')!;
    const position = Math.floor(0.7 * verse.chunksEn.length);
    const { storage } = await step(verse.id, 'fill-blank');
    await typeAnswer(verse.chunksEn[position]!.toLowerCase().replace(/[!,.]/g, ''));
    expect(screen.getByTestId('memory-result-pct')).toHaveTextContent('100%');
    expect(storage.get(memoryProgressKey)[verse.id]).toMatchObject({ successes: 1, failures: 0 });
    // The diff draws the chunk as written, inside the verse.
    expect(screen.getByTestId('memory-diff')).toHaveTextContent(verse.chunksEn[position]!);
  });

  it('fill-in fails another chunk said in place of the hidden one', async () => {
    const verse = getMemoryVerse('2-corinthians-5-17')!;
    const { storage } = await step(verse.id, 'fill-blank');
    await typeAnswer(verse.chunksEn[0]!);
    expect(screen.getByTestId('memory-result-title')).toBeTruthy();
    expect(storage.get(memoryProgressKey)[verse.id]).toMatchObject({ successes: 0, failures: 1 });
  });

  it.each([
    ['at the start', (v: { referenceEn: string; textEn: string }) => `${v.referenceEn} ${v.textEn}`],
    ['at the end', (v: { referenceEn: string; textEn: string }) => `${v.textEn} ${v.referenceEn}`],
  ])('full recall accepts the English reference %s', async (_, said) => {
    const verse = getMemoryVerse('philippians-4-6-7')!;
    const { storage } = await step(verse.id, 'full-recall');
    await typeAnswer(said(verse));
    expect(screen.getByTestId('memory-result-pct')).toHaveTextContent('100%');
    expect(within(screen.getByTestId('memory-ref-card')).getByText(new RegExp(verse.referenceEn))).toBeTruthy();
    expect(storage.get(memoryProgressKey)[verse.id]).toMatchObject({ successes: 1, failures: 0 });
  });

  it('full recall without the reference fails and says so', async () => {
    const verse = getMemoryVerse('philippians-4-6-7')!;
    const { storage } = await step(verse.id, 'full-recall');
    await typeAnswer(verse.textEn);
    expect(screen.getByTestId('memory-result-detail')).toHaveTextContent('Reference missing', { exact: false });
    expect(storage.get(memoryProgressKey)[verse.id]).toMatchObject({ successes: 0, failures: 1 });
  });

  it('full recall with the wrong verse names the right chapter and verse', async () => {
    const verse = getMemoryVerse('philippians-4-6-7')!;
    await step(verse.id, 'full-recall');
    await typeAnswer(`Philippians 4:8 ${verse.textEn}`);
    expect(screen.getByTestId('memory-ref-card')).toHaveTextContent('Heard Philippians 4:8. The chapter and verse should be 4:6-7.', { exact: false });
  });
});
