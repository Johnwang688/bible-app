import { act, fireEvent, screen, waitFor } from '@testing-library/react-native';

import { memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import { toLocalDateString } from '../localDate';
import type { StageSlug } from '../types';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { CheckVoice, Recorder, RecorderStartOptions, VoiceOutcome } from '../voice/types';
import { NOW, renderMemory, SIGNED_IN } from './memoryHarness';

const josh = getMemoryVerse('joshua-1-8')!;
const tim = getMemoryVerse('2-timothy-3-16')!;

async function setup(stage: StageSlug = 'fill-blank', outcome: VoiceOutcome = { kind: 'text', text: josh.chunks[3]! }) {
  const verse = stage === 'full-recall' ? tim : josh;
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
    stop: jest.fn(async () => ({ blob: new Blob(['a']), durationMs: 3000 })),
    cancel: jest.fn(),
  };
  const checkVoice = jest.fn<ReturnType<CheckVoice>, Parameters<CheckVoice>>(async () => outcome);
  const result = await renderMemory(
    ({ now, onNavigate }) => <LessonScreen
      verseId={verse.id} stage={stage} index={0} storage={storage} now={now}
      onNavigate={onNavigate} recorder={recorder} checkVoice={checkVoice}
      isOnline={() => true} random={() => 0.7}
    />,
    { storage, auth: SIGNED_IN },
  );
  return { ...result, recorder, checkVoice, options: () => options, verse };
}

beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => {
  jest.restoreAllMocks();
  jest.useRealTimers();
});

describe('S3 voice counterexamples', () => {
  // Finding: a long cooldown schedules one render at 60 s remaining, then never starts the countdown.
  it('restores the mic when a cooldown initially longer than one minute expires', async () => {
    jest.useFakeTimers();
    await setup('fill-blank', { kind: 'limit', retryAfterS: 120, window: 'day' });
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(screen.getByTestId('memory-notice-limit')).toBeTruthy();
    await act(async () => { await jest.advanceTimersByTimeAsync(60_100); });
    expect(screen.getByTestId('memory-notice-limit')).toBeTruthy();
    await act(async () => { await jest.advanceTimersByTimeAsync(61_000); });
    expect(screen.queryByTestId('memory-notice-limit')).toBeNull();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
  });

  // Finding: typed correction resets hint use and awards progress for the same hinted full-recall answer.
  it('keeps full-recall hint use when correcting a misheard reference by typing', async () => {
    const { storage, checkVoice } = await setup('full-recall', { kind: 'text', text: tim.textZh });
    await fireEvent.press(screen.getByTestId('memory-hint'));
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    await waitFor(() => expect(screen.getByTestId('memory-result')).toHaveTextContent(/Not quite/));
    expect(storage.get(memoryProgressKey)[tim.id]).toBeUndefined();
    await fireEvent.press(screen.getByTestId('memory-heard-differently'));
    await fireEvent.changeText(screen.getByTestId('memory-type-input'), tim.textZh + tim.referenceZh);
    await fireEvent.press(screen.getByTestId('memory-type-check'));
    expect(storage.get(memoryProgressKey)[tim.id]).toBeUndefined();
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
    expect(screen.getByTestId('memory-result')).toHaveTextContent(/Right, with a hint/);
    expect(checkVoice).toHaveBeenCalledTimes(1);
  });

});
