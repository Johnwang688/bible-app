// Sol S3 r3, parked 11-02 (5a step 5): Back must void a pending grade before navigation unmounts the screen. Passes with
// the voice-attempt machine (board 11-03, MEM).
import { act, fireEvent, screen } from '@testing-library/react-native';

import { memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import { toLocalDateString } from '../localDate';
import * as speech from '../speech/keyer';
import type { StageSlug } from '../types';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { CheckVoice, Recorder, RecorderStartOptions, VoiceOutcome } from '../voice/types';
import { NOW, renderMemory, SIGNED_IN } from './memoryHarness';

type VoiceStage = 'fill-blank' | 'full-recall';
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

beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => jest.restoreAllMocks());

describe('S3 round 3: Back', () => {
  // Finding: Back does not invalidate a pending answer until navigation actually unmounts the screen.
  it.each(stages.flatMap((stage) => (['server', 'keyer'] as const).map((phase) => [stage, phase] as const)))('%s ignores an answer landing after Back during the %s await', async (stage: VoiceStage, phase) => {
    const server = deferred<VoiceOutcome>();
    const keyer = deferred<speech.SpeechKeyer>();
    const load = jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValue(phase === 'keyer' ? keyer.promise : Promise.resolve(speech.MANDARIN_SYNC_KEYER));
    const { storage, onBack, text } = await setup(stage, phase === 'server' ? () => server.promise : undefined);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(load).toHaveBeenCalledTimes(phase === 'keyer' ? 1 : 0);
    await fireEvent.press(screen.getByTestId('memory-back'));
    expect(onBack).toHaveBeenCalledTimes(1);
    await act(async () => {
      server.resolve({ kind: 'text', text });
      keyer.resolve(speech.MANDARIN_SYNC_KEYER);
      await Promise.all([server.promise, keyer.promise]);
    });
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
    expect(screen.queryByTestId('memory-result')).toBeNull();
  });

});
