import { act, fireEvent, screen } from '@testing-library/react-native';

import { memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import { toLocalDateString } from '../localDate';
import type { StageSlug } from '../types';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { CheckVoice, Recorder, RecorderStartOptions } from '../voice/types';
import { NOW, renderMemory, SIGNED_IN } from './memoryHarness';

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

describe('S3 round 4 counterexamples', () => {
  // Finding: queued Unplace then Check grades the old filled order, ticks the step, and hides the returned phrase.
  it('chunk Check does not pass after a queued unplace empties a slot', async () => {
    const { storage, verse } = await setup('chunk-order');
    for (let c = 0; c < verse.chunks.length; c++) await fireEvent.press(screen.getByTestId('chunk-chip-' + c));
    const slot = screen.getByTestId('chunk-slot-0');
    const check = screen.getByTestId('chunk-check');
    await act(async () => {
      await fireEvent.press(slot);
      await fireEvent.press(check);
    });
    expect({
      progress: storage.get(memoryProgressKey),
      completedAt: storage.get(memoryLessonKey)!.steps[0]!.completedAt,
      verdict: screen.queryByTestId('memory-result-title')?.props.children ?? null,
      phraseCounts: verse.chunks.map((phrase) => screen.queryAllByText(phrase, { exact: true }).length),
    }).toEqual({
      progress: {}, completedAt: null, verdict: null,
      phraseCounts: verse.chunks.map(() => 1),
    });
    expect(screen.getByTestId('chunk-check')).toBeDisabled();
  });

});
