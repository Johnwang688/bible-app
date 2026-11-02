import { act, fireEvent, screen, waitFor } from '@testing-library/react-native';

import { memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import { toLocalDateString } from '../localDate';
import * as speech from '../speech/keyer';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { Recorder, RecorderStartOptions } from '../voice/types';
import { NOW, renderMemory, SIGNED_IN } from './memoryHarness';

type Stage = 'fill-blank' | 'full-recall';

async function setup(stage: Stage) {
  const verse = getMemoryVerse(stage === 'fill-blank' ? 'joshua-1-8' : '2-timothy-3-16')!;
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
  const checkVoice = jest.fn(async () => ({ kind: 'text' as const, text }));
  const result = await renderMemory(
    ({ now, onNavigate }) => <LessonScreen
      verseId={verse.id} stage={stage} index={0} storage={storage} now={now}
      onNavigate={onNavigate} recorder={recorder} checkVoice={checkVoice}
      isOnline={() => true} random={() => 0.7}
    />,
    { storage, auth: SIGNED_IN },
  );
  return { ...result, verse, recorder, checkVoice,
    autoStop: () => options.onAutoStop({ blob: new Blob(['audio']), durationMs: 30_000 }),
  };
}

beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => jest.restoreAllMocks());

describe('S3 round 2 voice counterexamples', () => {
  // Finding: auto-stop retains the pre-recording hint state and awards a hinted answer.
  it.each(['fill-blank', 'full-recall'] as const)('%s auto-stop does not record an answer after a hint opened during recording', async (stage) => {
    const { storage, autoStop } = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-hint'));
    expect(screen.getByTestId('memory-hint-text')).toBeTruthy();
    await act(async () => { autoStop(); });
    await waitFor(() => expect(screen.getByTestId('memory-result')).toBeTruthy());
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
    expect(screen.getByTestId('memory-result-title')).toHaveTextContent('Right, with a hint');
  });

  // Finding: cancelling while the speech keyer loads does not invalidate the trainer's pending grade.
  it.each(['fill-blank', 'full-recall'] as const)('%s ignores an answer cancelled while its speech keyer loads', async (stage) => {
    let resolve!: (keyer: speech.SpeechKeyer) => void;
    const keyer = new Promise<speech.SpeechKeyer>((r) => { resolve = r; });
    const load = jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValue(keyer);
    const { storage } = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(load).toHaveBeenCalledTimes(1);
    await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    await act(async () => { resolve(speech.MANDARIN_SYNC_KEYER); await keyer; });
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
    expect(screen.queryByTestId('memory-result')).toBeNull();
  });
});
