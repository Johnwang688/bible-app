// English Memory (EN-1), voice: an English verse is transcribed as `english`, a Chinese one in the stored
// Mandarin/Cantonese preference; English grading never loads the speech keyer. Switching the interface language in
// the middle of a voice attempt (recording, or while it is being checked) ends that attempt: nothing is sent or
// recorded, no result shows, and the step comes back idle in the new language.
import { act, fireEvent, screen } from '@testing-library/react-native';

import { languageKey } from '../../storage/keys';
import { memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import * as speech from '../speech/keyer';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { CheckVoice, Recorder, RecorderStartOptions, VoiceOutcome } from '../voice/types';
import { EN, renderMemory, SIGNED_IN, ZH } from './memoryHarness';

type Stage = 'fill-blank' | 'full-recall';

function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((yes) => {
    resolve = yes;
  });
  return { promise, resolve };
}

const verse = getMemoryVerse('2-corinthians-5-17')!;
/** `random` 0.7 blanks this position in both languages (3 chunks each). */
const POSITION = Math.floor(0.7 * verse.chunksEn.length);

async function setup(stage: Stage, opts: { locale?: 'en' | 'zh'; speech?: 'mandarin' | 'cantonese'; check?: CheckVoice } = {}) {
  const storage = createStorage(memoryBackend());
  storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true, speech: opts.speech ?? 'mandarin' });
  const starts: RecorderStartOptions[] = [];
  const recorder: Recorder = {
    supported: true,
    permission: jest.fn(async () => 'granted' as const),
    start: jest.fn(async (options: RecorderStartOptions) => {
      starts.push(options);
      return 'recording' as const;
    }),
    stop: jest.fn(async () => ({ blob: new Blob(['audio']), durationMs: 3000 })),
    cancel: jest.fn(),
  };
  const checkVoice = jest.fn<ReturnType<CheckVoice>, Parameters<CheckVoice>>(
    opts.check ?? (async () => ({ kind: 'text', text: verse.chunksEn[POSITION]! })),
  );
  const rendered = await renderMemory(
    ({ now, onNavigate }) => (
      <LessonScreen
        verseId={verse.id}
        stage={stage}
        index={null}
        storage={storage}
        now={now}
        onNavigate={onNavigate}
        recorder={recorder}
        checkVoice={checkVoice}
        getAppCheckToken={async () => null}
        isOnline={() => true}
        random={() => 0.7}
      />
    ),
    { storage, locales: [opts.locale === 'zh' ? ZH : EN], auth: SIGNED_IN, verses: 'locale' },
  );
  return { ...rendered, storage, recorder, starts, checkVoice };
}

async function switchTo(storage: ReturnType<typeof createStorage>, language: 'en' | 'zh-Hans') {
  await act(async () => {
    storage.set(languageKey, language);
  });
}

const progress = (storage: ReturnType<typeof createStorage>) => storage.get(memoryProgressKey);

beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => jest.restoreAllMocks());

describe('the voice request language', () => {
  it.each<Stage>(['fill-blank', 'full-recall'])('%s: an English verse is sent as english', async (stage) => {
    const s = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(s.checkVoice).toHaveBeenCalledTimes(1);
    expect(s.checkVoice.mock.calls[0]![1]).toBe('english');
  });

  it.each(['mandarin', 'cantonese'] as const)('a Chinese verse is sent in the stored preference (%s)', async (pref) => {
    const s = await setup('fill-blank', { locale: 'zh', speech: pref, check: async () => ({ kind: 'text', text: verse.chunks[POSITION]! }) });
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(s.checkVoice.mock.calls[0]![1]).toBe(pref);
    expect(s.storage.get(memorySettingsKey).speech).toBe(pref);
  });

  it('English voice grading does not load the speech keyer, and records the pass', async () => {
    const load = jest.spyOn(speech, 'loadSpeechKeyer');
    const s = await setup('fill-blank');
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(screen.getByTestId('memory-result-pct')).toHaveTextContent('100%');
    expect(progress(s.storage)[verse.id]).toMatchObject({ successes: 1, failures: 0 });
    expect(load).not.toHaveBeenCalled();
  });

  it('a Chinese voice answer still loads the keyer for the stored preference', async () => {
    const load = jest.spyOn(speech, 'loadSpeechKeyer');
    await setup('fill-blank', { locale: 'zh', speech: 'cantonese', check: async () => ({ kind: 'text', text: verse.chunks[POSITION]! }) });
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(load).toHaveBeenCalledWith('cantonese');
  });

  it('English full recall by voice: the reference at the end passes', async () => {
    const s = await setup('full-recall', { check: async () => ({ kind: 'text', text: `${verse.textEn} ${verse.referenceEn}` }) });
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(screen.getByTestId('memory-result-pct')).toHaveTextContent('100%');
    expect(progress(s.storage)[verse.id]).toMatchObject({ successes: 1 });
  });
});

describe('switching the language mid-step ends the voice attempt', () => {
  it.each<Stage>(['fill-blank', 'full-recall'])('%s: while recording, nothing is sent or recorded', async (stage) => {
    const s = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    expect(screen.getByTestId('memory-mic-stop')).toBeTruthy();

    await switchTo(s.storage, 'zh-Hans');
    expect(s.recorder.cancel).toHaveBeenCalled();
    // The recorder's auto-stop, firing late with the old attempt's closure, sends nothing.
    await act(async () => {
      s.starts[0]!.onAutoStop({ blob: new Blob(['audio']), durationMs: 30_000 });
    });
    expect(s.checkVoice).not.toHaveBeenCalled();
    expect(screen.queryByTestId('memory-result')).toBeNull();
    expect(screen.queryByTestId('memory-mic-stop')).toBeNull();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    expect(progress(s.storage)).toEqual({});
    // The new step is the Chinese one.
    expect(screen.getByTestId('memory-trainer')).toHaveTextContent(verse.referenceZh, { exact: false });
  });

  it.each<Stage>(['fill-blank', 'full-recall'])('%s: while checking, the answer that lands later is void', async (stage) => {
    const answer = deferred<VoiceOutcome>();
    const said = stage === 'fill-blank' ? verse.chunksEn[POSITION]! : `${verse.referenceEn} ${verse.textEn}`;
    const s = await setup(stage, { check: () => answer.promise });
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(screen.getByTestId('memory-grading-spinner')).toBeTruthy();
    const signal = s.checkVoice.mock.calls[0]![3]!;

    await switchTo(s.storage, 'zh-Hans');
    expect(signal.aborted).toBe(true);
    await act(async () => {
      answer.resolve({ kind: 'text', text: said });
      await answer.promise;
    });
    expect(screen.queryByTestId('memory-result')).toBeNull();
    expect(screen.queryByTestId('memory-grading-spinner')).toBeNull();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    expect(progress(s.storage)).toEqual({});
  });

  it('switching back and answering in the new language grades in that language', async () => {
    const s = await setup('fill-blank', { locale: 'zh', check: async () => ({ kind: 'text', text: verse.chunksEn[POSITION]! }) });
    await switchTo(s.storage, 'en');
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(s.checkVoice.mock.calls[0]![1]).toBe('english');
    expect(screen.getByTestId('memory-result-pct')).toHaveTextContent('100%');
    expect(progress(s.storage)[verse.id]).toMatchObject({ successes: 1 });
  });
});
