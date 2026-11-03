// Sol S3 r5, parked 11-02 (5a step 5): Skip must void a queued Check. Passes with the voice-attempt machine (board
// 11-03, MEM).
import { act, fireEvent, screen } from '@testing-library/react-native';
import { useState } from 'react';
import { MemoryAuthProvider } from '../voice/auth';

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
    steps: [{ verseId: verse.id, stage, completedAt: null }], completedAt: null,
  });
  storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
  let options!: RecorderStartOptions;
  const recorder: Recorder = {
    supported: true, permission: jest.fn(async () => 'granted' as const),
    start: jest.fn(async (o: RecorderStartOptions) => { options = o; return 'recording' as const; }),
    stop: jest.fn(async () => ({ blob: new Blob(['audio']), durationMs: 3000 })), cancel: jest.fn(),
  };
  const checkVoice = jest.fn(check ?? (async () => ({ kind: 'text' as const, text })));
  const result = await renderMemory(({ now, onNavigate }) => <LessonScreen
    verseId={verse.id} stage={stage} index={0} storage={storage} now={now} onNavigate={onNavigate}
    recorder={recorder} checkVoice={checkVoice} isOnline={() => true} random={() => 0.7}
  />, { storage, auth: SIGNED_IN });
  return { ...result, verse, text, recorder, checkVoice,
    autoStop: () => options.onAutoStop({ blob: new Blob(['audio']), durationMs: 30_000 }),
  };
}
async function prepareTyped(text: string) {
  await fireEvent.press(screen.getByTestId('memory-type-toggle'));
  await fireEvent.changeText(screen.getByTestId('memory-type-input'), text);
}
beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => jest.restoreAllMocks());

describe('S3 round 5 parked', () => {
  // Finding: Skip leaves a queued Check free to record a success and tick the skipped step.
  it('chunk Skip voids a queued Check before navigation unmounts', async () => {
    const { storage, verse, onNavigate } = await setup('chunk-order');
    for (let c = 0; c < verse.chunks.length; c++) await fireEvent.press(screen.getByTestId('chunk-chip-' + c));
    const skip = screen.getByTestId('memory-skip');
    const check = screen.getByTestId('chunk-check');
    await act(async () => { await fireEvent.press(skip); await fireEvent.press(check); });
    expect(onNavigate).toHaveBeenCalledTimes(1);
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
    expect(screen.queryByTestId('memory-result')).toBeNull();
  });
});
