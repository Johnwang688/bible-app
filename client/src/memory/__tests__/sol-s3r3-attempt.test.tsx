import { act, fireEvent, screen } from '@testing-library/react-native';

import { memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import { toLocalDateString } from '../localDate';
import * as speech from '../speech/keyer';
import type { StageSlug } from '../types';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { CheckVoice, Recorder, RecorderStartOptions } from '../voice/types';
import { NOW, renderMemory, SIGNED_IN } from './memoryHarness';

const stages = ['fill-blank', 'full-recall'] as const;

function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((r) => { resolve = r; });
  return { promise, resolve };
}

async function setup(stage: StageSlug, check?: CheckVoice) {
  const verse = getMemoryVerse(stage === 'chunk-order' ? '2-corinthians-5-17' : stage === 'fill-blank' ? 'joshua-1-8' : '2-timothy-3-16')!;
  const text = stage === 'fill-blank' ? verse.chunks[3]! : verse.textZh + verse.referenceZh;
  const storage = createStorage(memoryBackend());
  storage.set(memoryLessonKey, {
    date: toLocalDateString(NOW),
    steps: [{ verseId: verse.id, stage, completedAt: null }],
    completedAt: null,
  });
  storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
  let options!: RecorderStartOptions;
  const recorder: Recorder = {
    supported: true,
    permission: jest.fn(async () => 'granted' as const),
    start: jest.fn(async (o: RecorderStartOptions) => { options = o; return 'recording' as const; }),
    stop: jest.fn(async () => ({ blob: new Blob(['audio']), durationMs: 3000 })),
    cancel: jest.fn(),
  };
  const onBack = jest.fn();
  const checkVoice = jest.fn(check ?? (async () => ({ kind: 'text' as const, text })));
  const result = await renderMemory(
    ({ now, onNavigate }) => <LessonScreen
      verseId={verse.id} stage={stage} index={0} storage={storage} now={now}
      onNavigate={onNavigate} onBack={onBack} recorder={recorder} checkVoice={checkVoice}
      isOnline={() => true} random={() => 0.7}
    />,
    { storage, auth: SIGNED_IN },
  );
  return { ...result, verse, text, recorder, onBack, checkVoice,
    autoStop: () => options.onAutoStop({ blob: new Blob(['audio']), durationMs: 30_000 }),
  };
}

async function typeAnswer(text: string) {
  if (!screen.queryByTestId('memory-type-input')) await fireEvent.press(screen.getByTestId('memory-type-toggle'));
  await fireEvent.changeText(screen.getByTestId('memory-type-input'), text);
  await fireEvent.press(screen.getByTestId('memory-type-check'));
}

beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => jest.restoreAllMocks());

describe('S3 round 3 attempt boundaries', () => {
  it.each(stages)('%s Cancel frees the latch while the old keyer is still pending', async (stage) => {
    const old = deferred<speech.SpeechKeyer>();
    jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValueOnce(old.promise).mockResolvedValue(speech.MANDARIN_SYNC_KEYER);
    const { storage, verse, text } = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
    await typeAnswer(text);
    expect(storage.get(memoryProgressKey)[verse.id]!.successes).toBe(1);
    await act(async () => { old.resolve(speech.MANDARIN_SYNC_KEYER); await old.promise; });
    expect(storage.get(memoryProgressKey)[verse.id]!.successes).toBe(1);
  });

  it.each(stages)('%s new voice answer survives the cancelled answer settling first', async (stage) => {
    const old = deferred<speech.SpeechKeyer>();
    const next = deferred<speech.SpeechKeyer>();
    jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValueOnce(old.promise).mockReturnValueOnce(next.promise);
    const { storage, verse } = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    await act(async () => { old.resolve(speech.MANDARIN_SYNC_KEYER); await old.promise; });
    expect(screen.getByTestId('memory-grading')).toBeTruthy();
    expect(storage.get(memoryProgressKey)).toEqual({});
    await act(async () => { next.resolve(speech.MANDARIN_SYNC_KEYER); await next.promise; });
    expect(storage.get(memoryProgressKey)[verse.id]!.successes).toBe(1);
  });

  it.each(stages)('%s clears hint use for Again without the hint', async (stage) => {
    const { storage, verse, text } = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-hint'));
    await fireEvent.press(screen.getByTestId('memory-hint'));
    await fireEvent.press(screen.getByTestId('memory-hint'));
    await typeAnswer(text);
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(screen.getByTestId('memory-result-title')).toHaveTextContent('Right, with a hint');
    await fireEvent.press(screen.getByTestId('memory-hint-again'));
    await typeAnswer(text);
    expect(storage.get(memoryProgressKey)[verse.id]!.successes).toBe(1);
  });

  it.each(stages)('%s unmount voids a grade waiting on its keyer', async (stage) => {
    const keyer = deferred<speech.SpeechKeyer>();
    jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValue(keyer.promise);
    const { storage } = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    await screen.unmount();
    await act(async () => { keyer.resolve(speech.MANDARIN_SYNC_KEYER); await keyer.promise; });
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
  });

  // Finding: two queued taps on one chip can put the same phrase into two slots.
  it('chunk order keeps a phrase unique through two queued taps', async () => {
    const { verse } = await setup('chunk-order');
    const chip = screen.getByTestId('chunk-chip-0');
    await act(async () => { await fireEvent.press(chip); await fireEvent.press(chip); });
    const occupied = screen.getAllByTestId(/^chunk-slot-/).filter((s) => s.props.accessibilityRole === 'button');
    expect(occupied).toHaveLength(1);
    expect(screen.getAllByTestId(/^chunk-chip-/)).toHaveLength(verse.chunks.length - 1);
  });
});
