// Sol S3 r4, parked 11-02 (5a step 5): a recording Cancel queued with auto-stop must void the grade. Passes with the
// voice-attempt machine (board 11-03, MEM).
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

function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((r) => { resolve = r; });
  return { promise, resolve };
}

async function setup(stage: StageSlug) {
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
  const checkVoice = jest.fn<ReturnType<CheckVoice>, Parameters<CheckVoice>>(async () => ({ kind: 'text', text }));
  const result = await renderMemory(
    ({ now, onNavigate }) => <LessonScreen
      verseId={verse.id} stage={stage} index={0} storage={storage} now={now}
      onNavigate={onNavigate} recorder={recorder} checkVoice={checkVoice}
      isOnline={() => true} random={() => 0.7}
    />,
    { storage, auth: SIGNED_IN },
  );
  return { ...result, verse, text, recorder, checkVoice,
    autoStop: () => options.onAutoStop({ blob: new Blob(['audio']), durationMs: 30_000 }),
  };
}

beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => jest.restoreAllMocks());

describe('S3 round 4: queued Cancel', () => {
  // Finding: recording Cancel queued with auto-stop leaves the trainer's pending grade live in both trainers.
  it.each(['fill-blank', 'full-recall'] as const)('%s queued recording Cancel voids an auto-stopped grade', async (stage) => {
    const keyer = deferred<speech.SpeechKeyer>();
    const load = jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValue(keyer.promise);
    const { storage, autoStop } = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    const cancel = screen.getByTestId('memory-mic-cancel');
    await act(async () => {
      autoStop();
      await Promise.resolve();
      await fireEvent.press(cancel);
    });
    expect(load).toHaveBeenCalledTimes(1);
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    await act(async () => { keyer.resolve(speech.MANDARIN_SYNC_KEYER); await keyer.promise; });
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
    expect(screen.queryByTestId('memory-result')).toBeNull();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
  });
});
