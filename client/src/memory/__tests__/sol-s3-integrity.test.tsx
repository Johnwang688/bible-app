import { act, fireEvent, screen } from '@testing-library/react-native';

import { memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { gradeStep } from '../grading';
import { getMemoryVerse } from '../library';
import { toLocalDateString } from '../localDate';
import { nextHrefAfter, stepHref } from '../session';
import type { StageSlug } from '../types';
import { CompleteScreen } from '../ui/trainer/CompleteScreen';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { takeProgressSaved } from '../ui/savedToast';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { Recorder, RecorderStartOptions, VoiceOutcome } from '../voice/types';
import { NOW, renderMemory, SIGNED_IN } from './memoryHarness';

const cor = getMemoryVerse('2-corinthians-5-17')!;
const josh = getMemoryVerse('joshua-1-8')!;
const tim = getMemoryVerse('2-timothy-3-16')!;
const steps: { verseId: string; stage: StageSlug }[] = [
  { verseId: cor.id, stage: 'chunk-order' },
  { verseId: josh.id, stage: 'fill-blank' },
  { verseId: tim.id, stage: 'full-recall' },
];

function seeded(done = [false, false, false]) {
  const storage = createStorage(memoryBackend());
  storage.set(memoryLessonKey, {
    date: toLocalDateString(NOW),
    steps: steps.map((s, i) => ({ ...s, completedAt: done[i] ? NOW.toISOString() : null })),
    completedAt: done.every(Boolean) ? NOW.toISOString() : null,
  });
  storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true, script: 'traditional' });
  return storage;
}

function recorder() {
  let options!: RecorderStartOptions;
  const rec: Recorder = {
    supported: true,
    permission: jest.fn(async () => 'granted' as const),
    start: jest.fn(async (o: RecorderStartOptions) => { options = o; return 'recording' as const; }),
    stop: jest.fn(async () => ({ blob: new Blob(['a']), durationMs: 3000 })),
    cancel: jest.fn(),
  };
  return { rec, autoStop: () => options.onAutoStop({ blob: new Blob(['a']), durationMs: 30_000 }) };
}

async function lesson(stage: StageSlug, index: number | null, opts: {
  storage?: ReturnType<typeof seeded>; random?: () => number;
  checkVoice?: (blob: Blob, language: 'mandarin' | 'cantonese', deps: unknown, signal?: AbortSignal) => Promise<VoiceOutcome>;
} = {}) {
  const verse = stage === 'chunk-order' ? cor : stage === 'fill-blank' ? josh : tim;
  const rec = recorder();
  const onBack = jest.fn();
  const checkVoice = jest.fn(opts.checkVoice ?? (async () => ({ kind: 'text', text: 'x' }) as VoiceOutcome));
  const result = await renderMemory(
    ({ storage, now, onNavigate }) => <LessonScreen
      verseId={verse.id} stage={stage} index={index} storage={storage} now={now}
      onNavigate={onNavigate} onBack={onBack} recorder={rec.rec} checkVoice={checkVoice}
      isOnline={() => true} random={opts.random ?? (() => 0.7)}
    />,
    { storage: opts.storage ?? seeded(), auth: SIGNED_IN },
  );
  return { ...result, ...rec, checkVoice, onBack, verse };
}

async function typeAnswer(text: string) {
  if (!screen.queryByTestId('memory-type-input')) await fireEvent.press(screen.getByTestId('memory-type-toggle'));
  await fireEvent.changeText(screen.getByTestId('memory-type-input'), text);
  await fireEvent.press(screen.getByTestId('memory-type-check'));
}

beforeEach(() => { resetVoiceSessionForTesting(); takeProgressSaved(); });

describe('S3 integrity checks', () => {
  it.each(['fill-blank', 'full-recall'] as const)('%s shows the grader verdict and percent in Traditional and does not tick a fail', async (stage) => {
    const { storage, verse } = await lesson(stage, stage === 'fill-blank' ? 1 : 2);
    const transcript = stage === 'fill-blank' ? '如此你的道露能以通' : tim.textZh;
    const answer = stage === 'fill-blank'
      ? { kind: 'recall', transcript, chunkPosition: 3 } as const
      : { kind: 'recall', transcript } as const;
    const grade = gradeStep(verse.id, stage, answer);
    await typeAnswer(transcript);
    expect(screen.getByTestId('memory-result-title')).toHaveTextContent(grade.passed ? /^Correct$/ : /^Not quite$/);
    expect(screen.getByTestId('memory-result-pct')).toHaveTextContent(Math.round(grade.matchPct) + '%');
    expect(screen.getByTestId('memory-diff').props.lang).toBe('zh-Hant');
    expect(storage.get(memoryProgressKey)[verse.id]!.failures).toBe(1);
    expect(storage.get(memoryLessonKey)!.steps.every((s) => s.completedAt === null)).toBe(true);
    const result = screen.getByTestId('memory-result');
    expect(result.props['aria-live']).toBe('polite');
    expect(result.props.accessibilityLiveRegion).toBe('polite');
    expect(screen.getByTestId('memory-result-title').props.accessibilityRole).toBe('header');
  });

  it.each([null, 0])('a full-recall pass with practice or mismatched index %s does not tick today', async (index) => {
    const { storage } = await lesson('full-recall', index);
    await typeAnswer(tim.textZh + tim.referenceZh);
    expect(storage.get(memoryProgressKey)[tim.id]!.successes).toBe(1);
    expect(storage.get(memoryLessonKey)!.steps.every((s) => s.completedAt === null)).toBe(true);
  });

  it.each(['fill-blank', 'full-recall'] as const)('%s ignores a double typed Check', async (stage) => {
    const { storage, verse } = await lesson(stage, stage === 'fill-blank' ? 1 : 2);
    await fireEvent.press(screen.getByTestId('memory-type-toggle'));
    await fireEvent.changeText(screen.getByTestId('memory-type-input'), stage === 'fill-blank' ? josh.chunks[3]! : tim.textZh + tim.referenceZh);
    const button = screen.getByTestId('memory-type-check');
    await act(async () => {
      await fireEvent.press(button);
      await fireEvent.press(button);
    });
    expect(storage.get(memoryProgressKey)[verse.id]!.successes).toBe(1);
  });

  it.each([0, 0.7, 0.999])('chunk pool is not already in order with random %s', async (r) => {
    await lesson('chunk-order', 0, { random: () => r });
    const ids = screen.getAllByTestId(/^chunk-chip-/).map((node) => node.props.testID);
    expect(ids).not.toEqual(cor.chunks.map((_, i) => 'chunk-chip-' + i));
    expect(screen.getByTestId('chunk-check')).toBeDisabled();
  });

  it('keeps each phrase exactly once through placement, retry, and a second check', async () => {
    const { storage, onNavigate } = await lesson('chunk-order', 0);
    for (const c of [1, 0, 2]) await fireEvent.press(screen.getByTestId('chunk-chip-' + c));
    await fireEvent.press(screen.getByTestId('chunk-check'));
    await fireEvent.press(screen.getByTestId('chunk-retry-marked'));
    expect(screen.getByTestId('chunk-slot-2')).toHaveTextContent(cor.chunksHant[2]!);
    expect(screen.queryByTestId('chunk-chip-2')).toBeNull();
    expect(screen.getByTestId('chunk-check')).toBeDisabled();
    for (const c of [0, 1]) await fireEvent.press(screen.getByTestId('chunk-chip-' + c));
    await fireEvent.press(screen.getByTestId('chunk-slot-1'));
    expect(screen.getByTestId('chunk-check')).toBeDisabled();
    await fireEvent.press(screen.getByTestId('chunk-chip-1'));
    const check = screen.getByTestId('chunk-check');
    await act(async () => { await fireEvent.press(check); await fireEvent.press(check); });
    expect(storage.get(memoryProgressKey)[cor.id]!.successes).toBe(1);
    expect(storage.get(memoryProgressKey)[cor.id]!.failures).toBe(1);
    expect(screen.queryAllByTestId(/^chunk-chip-/)).toHaveLength(0);
    for (let i = 0; i < cor.chunks.length; i++) {
      expect(screen.getByTestId('chunk-slot-' + i).props.accessibilityLabel).toMatch(/right/i);
    }
    await fireEvent.press(screen.getByTestId('memory-next'));
    expect(onNavigate).toHaveBeenCalledWith(nextHrefAfter(storage.get(memoryLessonKey), 0));
  });

  it('free-practice Back does not note progress and Next goes home', async () => {
    const { onBack, onNavigate } = await lesson('full-recall', null);
    await fireEvent.press(screen.getByTestId('memory-back'));
    expect(onBack).toHaveBeenCalledTimes(1);
    expect(takeProgressSaved()).toBeNull();
    await typeAnswer(tim.textZh + tim.referenceZh);
    await fireEvent.press(screen.getByTestId('memory-next'));
    expect(onNavigate).toHaveBeenCalledWith('/study/memory');
  });

  it('finished-lesson Back does not note progress', async () => {
    await lesson('full-recall', 2, { storage: seeded([true, true, true]) });
    await fireEvent.press(screen.getByTestId('memory-back'));
    expect(takeProgressSaved()).toBeNull();
  });

  it('Skip records nothing and the end screen offers the skipped step at its exact href', async () => {
    const storage = seeded([false, true, true]);
    const { onNavigate } = await lesson('chunk-order', 0, { storage });
    await fireEvent.press(screen.getByTestId('memory-skip'));
    expect(onNavigate).toHaveBeenCalledWith(nextHrefAfter(storage.get(memoryLessonKey), 0));
    expect(storage.get(memoryProgressKey)).toEqual({});
    await screen.unmount();
    const end = await renderMemory(({ now, onNavigate }) => <CompleteScreen storage={storage} now={now} onNavigate={onNavigate} />, { storage });
    expect(screen.queryByTestId('memory-complete')).toBeNull();
    expect(screen.getByTestId('memory-one-left')).toHaveTextContent(/2 of 3 done/);
    await fireEvent.press(screen.getByTestId('memory-do-now'));
    expect(end.onNavigate).toHaveBeenCalledWith(stepHref(steps, 0));
  });

  it.each(['cancel', 'unmount', 'new recording'] as const)('ignores a late network answer after %s', async (action) => {
    let resolve!: (outcome: VoiceOutcome) => void;
    const pending = new Promise<VoiceOutcome>((r) => { resolve = r; });
    const { storage } = await lesson('fill-blank', 1, { checkVoice: () => pending });
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    if (action === 'unmount') await screen.unmount();
    else {
      await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
      if (action === 'new recording') await fireEvent.press(screen.getByTestId('memory-mic'));
    }
    await act(async () => { resolve({ kind: 'text', text: josh.chunks[3]! }); await pending; });
    expect(storage.get(memoryProgressKey)).toEqual({});
    if (action !== 'unmount') expect(screen.queryByTestId('memory-result')).toBeNull();
  });

  it('unmount discards a recording and racing Stop with auto-stop sends only once', async () => {
    const first = await lesson('fill-blank', 1);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await screen.unmount();
    expect(first.rec.cancel).toHaveBeenCalledTimes(1);
    expect(first.checkVoice).not.toHaveBeenCalled();
    const second = await lesson('fill-blank', 1, { checkVoice: async () => ({ kind: 'text', text: josh.chunks[3]! }) });
    await fireEvent.press(screen.getByTestId('memory-mic'));
    const stop = screen.getByTestId('memory-mic-stop');
    await act(async () => { await fireEvent.press(stop); second.autoStop(); });
    expect(second.checkVoice).toHaveBeenCalledTimes(1);
    expect(second.storage.get(memoryProgressKey)[josh.id]!.successes).toBe(1);
  });
});
