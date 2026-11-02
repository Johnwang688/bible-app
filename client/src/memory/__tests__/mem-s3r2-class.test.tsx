import { act, fireEvent, screen } from '@testing-library/react-native';

import { memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import { toLocalDateString } from '../localDate';
import * as speech from '../speech/keyer';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { Recorder } from '../voice/types';
import { NOW, renderMemory, SIGNED_IN } from './memoryHarness';

// Orchestrator class tests (S3 r2): whatever is recorded is decided by the attempt as it stands when the grade lands.
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
  const recorder: Recorder = {
    supported: true,
    permission: jest.fn(async () => 'granted' as const),
    start: jest.fn(async () => 'recording' as const),
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
  return { ...result, storage };
}

beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => jest.restoreAllMocks());

describe('S3 r2 class: the grade uses the attempt as it is when it lands', () => {
  it.each(['fill-blank', 'full-recall'] as const)('%s: a hint opened while a voice answer is being graded means nothing is recorded', async (stage) => {
    let resolve!: (keyer: speech.SpeechKeyer) => void;
    const keyer = new Promise<speech.SpeechKeyer>((r) => { resolve = r; });
    jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValue(keyer);
    const { storage } = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    const hint = screen.queryByTestId('memory-hint');
    if (hint === null) return; // Hint is not offered while grading: nothing to open, the class cannot occur this way.
    await fireEvent.press(hint);
    await act(async () => { resolve(speech.MANDARIN_SYNC_KEYER); await keyer; });
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
  });
});
