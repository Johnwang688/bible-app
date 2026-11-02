// Acceptance (orchestrator-owned, MEM screens): the three trainers, the voice states, the step results and the
// lesson's end. Prototypes: `design/proposed/mem-chunk-order.html`, `mem-fill-blank.html`, `mem-full-recall.html`,
// `mem-result.html`; P2/P3 cards; REVIEW-3. Implementers may not edit this file.
import { act, fireEvent, screen, waitFor } from '@testing-library/react-native';

import { memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import type { DailyLessonRecord } from '../dailyLesson';
import { getMemoryVerse } from '../library';
import { toLocalDateString } from '../localDate';
import { nextHrefAfter, stepHref } from '../session';
import type { StageSlug } from '../types';
import { CompleteScreen } from '../ui/trainer/CompleteScreen';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { takeProgressSaved } from '../ui/savedToast';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { MicPermission, Recorder, RecorderStartOptions, VoiceOutcome } from '../voice/types';
import { NOW, renderMemory, SIGNED_IN, ZH } from './memoryHarness';

const cor = getMemoryVerse('2-corinthians-5-17')!;
const josh = getMemoryVerse('joshua-1-8')!;
const tim = getMemoryVerse('2-timothy-3-16')!;

const STEPS: { verseId: string; stage: StageSlug }[] = [
  { verseId: cor.id, stage: 'chunk-order' },
  { verseId: josh.id, stage: 'fill-blank' },
  { verseId: tim.id, stage: 'full-recall' },
  { verseId: 'galatians-2-20', stage: 'chunk-order' },
];

function seeded(done: boolean[] = [false, false, false, false]) {
  const storage = createStorage(memoryBackend());
  const lesson: DailyLessonRecord = {
    date: toLocalDateString(NOW),
    steps: STEPS.map((s, i) => ({ ...s, completedAt: done[i] ? NOW.toISOString() : null })),
    completedAt: null,
  };
  storage.set(memoryLessonKey, lesson);
  return storage;
}

function fakeRecorder(over: { start?: 'recording' | 'denied' | 'unsupported'; permission?: MicPermission } = {}) {
  let opts: RecorderStartOptions | null = null;
  const recorder: Recorder & { [k: string]: unknown } = {
    supported: true,
    permission: jest.fn(async () => over.permission ?? 'prompt'),
    start: jest.fn(async (o: RecorderStartOptions) => {
      opts = o;
      return over.start ?? 'recording';
    }),
    stop: jest.fn(async () => ({ blob: new Blob(['a'], { type: 'audio/webm' }), durationMs: 3000 })),
    cancel: jest.fn(),
  };
  return {
    recorder,
    tick: (ms: number) => act(() => opts?.onTick?.(ms)),
    autoStop: () => act(() => opts?.onAutoStop({ blob: new Blob(['a'], { type: 'audio/webm' }), durationMs: 30_000 })),
  };
}

const answer = (outcome: VoiceOutcome) => jest.fn(async () => outcome);

interface Over {
  verseId?: string;
  stage?: StageSlug;
  index?: number | null;
  recorder?: Recorder;
  checkVoice?: jest.Mock;
  random?: () => number;
  isOnline?: () => boolean;
}

async function lesson(over: Over = {}, opts: { storage?: Storage; auth?: typeof SIGNED_IN; locales?: (typeof ZH)[] } = {}) {
  const onBack = jest.fn();
  const r = await renderMemory(
    ({ storage, now, onNavigate }) => (
      <LessonScreen
        verseId={over.verseId ?? josh.id}
        stage={over.stage ?? 'fill-blank'}
        index={over.index === undefined ? 1 : over.index}
        storage={storage}
        now={now}
        onNavigate={onNavigate}
        onBack={onBack}
        recorder={over.recorder}
        checkVoice={over.checkVoice}
        voiceBaseUrl="https://api.example"
        isOnline={over.isOnline ?? (() => true)}
        random={over.random ?? (() => 0.7)}
      />
    ),
    { storage: opts.storage ?? seeded(), auth: opts.auth, locales: opts.locales },
  );
  return { ...r, onBack };
}

const typeAndCheck = async (text: string) => {
  fireEvent.changeText(screen.getByTestId('memory-type-input'), text);
  await act(async () => fireEvent.press(screen.getByTestId('memory-type-check')));
};

beforeEach(() => {
  resetVoiceSessionForTesting();
  takeProgressSaved();
});

// ---------------------------------------------------------------------------------------------------------
describe('chunk order', () => {
  const co = () => lesson({ verseId: cor.id, stage: 'chunk-order', index: 0 });

  it('Check is enabled only when every slot is filled; the right order passes and ticks the step', async () => {
    const { storage, onNavigate } = await co();
    expect(screen.getByTestId('memory-step')).toHaveTextContent('1 of 4');
    expect(screen.getByTestId('memory-skip')).toBeTruthy(); // Skip is offered before a wrong answer too
    expect(screen.getByTestId('chunk-check').props.accessibilityState).toMatchObject({ disabled: true });
    for (let p = 0; p < cor.chunks.length; p++) fireEvent.press(screen.getByTestId(`chunk-chip-${p}`));
    expect(screen.getByTestId('chunk-check').props.accessibilityState?.disabled ?? false).toBe(false);
    await act(async () => fireEvent.press(screen.getByTestId('chunk-check')));
    expect(screen.getByTestId('memory-result')).toHaveTextContent(/Correct/);
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).not.toBeNull();
    expect(storage.get(memoryProgressKey)[cor.id]!.successes).toBe(1);
    fireEvent.press(screen.getByTestId('memory-next'));
    expect(onNavigate).toHaveBeenCalledWith(nextHrefAfter(storage.get(memoryLessonKey), 0));
  });

  it('tapping a placed phrase sends it back', async () => {
    await co();
    fireEvent.press(screen.getByTestId('chunk-chip-1'));
    fireEvent.press(screen.getByTestId('chunk-slot-0'));
    expect(screen.getByTestId('chunk-chip-1')).toBeTruthy();
    expect(screen.getByTestId('chunk-slot-0')).not.toHaveTextContent(cor.chunks[1]!);
  });

  it('wrong: the right slots stay, only the marked ones go back; Show me the order; a fail is recorded', async () => {
    const { storage } = await co();
    fireEvent.press(screen.getByTestId('chunk-chip-1'));
    fireEvent.press(screen.getByTestId('chunk-chip-0'));
    fireEvent.press(screen.getByTestId('chunk-chip-2'));
    await act(async () => fireEvent.press(screen.getByTestId('chunk-check')));
    expect(screen.getByTestId('memory-result')).toHaveTextContent(/Not quite/);
    expect(storage.get(memoryProgressKey)[cor.id]!.failures).toBe(1);
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
    fireEvent.press(screen.getByTestId('chunk-retry-marked'));
    expect(screen.getByTestId('chunk-chip-0')).toBeTruthy();
    expect(screen.getByTestId('chunk-chip-1')).toBeTruthy();
    expect(screen.queryByTestId('chunk-chip-2')).toBeNull(); // still placed, correct
    expect(screen.getByTestId('chunk-slot-2')).toHaveTextContent(cor.chunks[2]!);
    // Show me the order, then place them myself.
    fireEvent.press(screen.getByTestId('chunk-chip-1'));
    fireEvent.press(screen.getByTestId('chunk-chip-0'));
    await act(async () => fireEvent.press(screen.getByTestId('chunk-check')));
    fireEvent.press(screen.getByTestId('chunk-show-order'));
    for (let p = 0; p < cor.chunks.length; p++) expect(screen.getByTestId(`chunk-slot-${p}`)).toHaveTextContent(cor.chunks[p]!);
    fireEvent.press(screen.getByTestId('chunk-place-myself'));
    fireEvent.press(screen.getByTestId('chunk-chip-0'));
    fireEvent.press(screen.getByTestId('chunk-chip-1'));
    await act(async () => fireEvent.press(screen.getByTestId('chunk-check')));
    expect(screen.getByTestId('memory-result')).toHaveTextContent(/Correct/);
  });

  it('Skip leaves the step for later and goes on', async () => {
    const { storage, onNavigate } = await co();
    fireEvent.press(screen.getByTestId('memory-skip'));
    expect(storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
    expect(onNavigate).toHaveBeenCalledWith(nextHrefAfter(storage.get(memoryLessonKey), 0));
  });

  it('shows Traditional phrases when the script is Traditional', async () => {
    const storage = seeded();
    storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), script: 'traditional' });
    await lesson({ verseId: cor.id, stage: 'chunk-order', index: 0 }, { storage });
    expect(screen.getByTestId('chunk-chip-0')).toHaveTextContent(cor.chunksHant[0]!);
  });
});

// ---------------------------------------------------------------------------------------------------------
describe('fill-in, typing', () => {
  // random 0.7 over Joshua 1:8's 5 phrases blanks phrase 3: 如此，你的道路就可以亨通
  it('blanks one phrase; typing it passes, ticks the step, and the result is a live region with focusable heading', async () => {
    const { storage } = await lesson();
    expect(screen.getByTestId('memory-blank').props.dataSet).toMatchObject({ position: 3 });
    await typeAndCheck(josh.chunks[3]!);
    const result = screen.getByTestId('memory-result');
    expect(result).toHaveTextContent(/Correct/);
    expect(result).toHaveTextContent(/100%/);
    expect(result.props['aria-live'] ?? result.props.accessibilityLiveRegion).toBe('polite');
    expect(screen.getByTestId('memory-result-title').props.accessibilityRole).toBe('header');
    expect(storage.get(memoryLessonKey)!.steps[1]!.completedAt).not.toBeNull();
  });

  it('fail: the grader-true %, the diff with the sound-alike note, Try again blanks a different phrase', async () => {
    const { storage } = await lesson();
    await typeAndCheck('如此你的道露能以通');
    const result = screen.getByTestId('memory-result');
    expect(result).toHaveTextContent(/Not quite/);
    expect(result).toHaveTextContent(/73%/);
    expect(screen.getByTestId('memory-diff')).toBeTruthy();
    expect(screen.getByTestId('memory-alike-note')).toHaveTextContent(/路 heard as 露/);
    expect(screen.getByText(/It stays in today’s lesson/)).toBeTruthy();
    expect(storage.get(memoryProgressKey)[josh.id]!.failures).toBe(1);
    fireEvent.press(screen.getByTestId('memory-try-again'));
    expect(screen.getByTestId('memory-blank').props.dataSet.position).not.toBe(3);
  });

  it('a short phrase says every character must be said', async () => {
    await lesson({ random: () => 0.99 }); // phrase 4: 凡事顺利
    expect(screen.getByTestId('memory-needs')).toHaveTextContent(/Short phrase: say every character/);
  });

  it('progressive hint: first character, then the whole phrase; a pass with a hint does not finish the step', async () => {
    const { storage } = await lesson();
    fireEvent.press(screen.getByTestId('memory-hint'));
    expect(screen.getByTestId('memory-hint-text')).toHaveTextContent('如＿，＿＿＿＿＿＿＿＿＿');
    fireEvent.press(screen.getByTestId('memory-hint'));
    expect(screen.getByTestId('memory-hint-text')).toHaveTextContent(josh.chunks[3]!);
    await typeAndCheck(josh.chunks[3]!);
    expect(screen.getByTestId('memory-result')).toHaveTextContent(/Right, with a hint/);
    expect(screen.queryByTestId('memory-next')).toBeNull();
    expect(screen.getByTestId('memory-hint-again')).toBeTruthy();
    expect(storage.get(memoryLessonKey)!.steps[1]!.completedAt).toBeNull();
    expect(storage.get(memoryProgressKey)[josh.id]).toBeUndefined();
  });

  it('Back keeps progress and notes "Progress saved" for Memory home', async () => {
    const { onBack } = await lesson();
    fireEvent.press(screen.getByTestId('memory-back'));
    expect(onBack).toHaveBeenCalled();
    expect(takeProgressSaved()).toEqual({ step: 2, total: 4 });
  });

  it('free practice: no step counter, nothing ticked, Next goes back to Memory', async () => {
    const { storage, onNavigate } = await lesson({ index: null });
    expect(screen.getByTestId('memory-step')).toHaveTextContent(/Practice/);
    await typeAndCheck(josh.chunks[3]!);
    expect(storage.get(memoryLessonKey)!.steps[1]!.completedAt).toBeNull();
    fireEvent.press(screen.getByTestId('memory-next'));
    expect(onNavigate).toHaveBeenCalledWith('/study/memory');
  });

  it('the last unfinished step goes to the end screen', async () => {
    const { onNavigate } = await lesson({}, { storage: seeded([true, false, true, true]) });
    await typeAndCheck(josh.chunks[3]!);
    fireEvent.press(screen.getByTestId('memory-next'));
    expect(onNavigate).toHaveBeenCalledWith('/memory/complete');
  });

  it('shows in Chinese', async () => {
    await lesson({}, { locales: [ZH] });
    expect(screen.getByText('改为输入')).toBeTruthy();
  });
});

// ---------------------------------------------------------------------------------------------------------
describe('voice states (fill-in)', () => {
  it('signed out (the default until R-6b): the notice stands in the mic’s place, typing is the main action', async () => {
    await lesson({ recorder: fakeRecorder().recorder });
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    expect(screen.queryByTestId('memory-mic')).toBeNull();
    expect(screen.getByTestId('memory-type-input')).toBeTruthy();
  });

  it('native (no recorder yet): typing only, with a note', async () => {
    await lesson({}, { auth: SIGNED_IN });
    expect(screen.getByTestId('memory-notice-unsupported')).toBeTruthy();
    expect(screen.queryByTestId('memory-mic')).toBeNull();
  });

  it('voice off: the notice, and Memory settings opens over the trainer', async () => {
    const storage = seeded();
    storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voice: false });
    await lesson({ recorder: fakeRecorder().recorder }, { storage, auth: SIGNED_IN });
    expect(screen.getByTestId('memory-notice-voice-off')).toBeTruthy();
    fireEvent.press(screen.getByTestId('memory-notice-settings'));
    expect(screen.getByTestId('memory-settings-sheet')).toBeTruthy();
    await act(async () => fireEvent.press(screen.getByTestId('memory-voice-switch')));
    expect(storage.get(memorySettingsKey).voice).toBe(true);
  });

  it('offline: the notice', async () => {
    await lesson({ recorder: fakeRecorder().recorder, isOnline: () => false }, { auth: SIGNED_IN });
    expect(screen.getByTestId('memory-notice-offline')).toBeTruthy();
  });

  it('first mic tap: the consent sheet; Type instead asks again next time; Allow records and is remembered', async () => {
    const { recorder } = fakeRecorder();
    const checkVoice = answer({ kind: 'text', text: josh.chunks[3]! });
    const { storage } = await lesson({ recorder, checkVoice }, { auth: SIGNED_IN });
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic')));
    const consent = screen.getByTestId('memory-consent-sheet');
    expect(consent).toHaveTextContent(/Bible app’s server/);
    expect(consent).toHaveTextContent(/OpenRouter/);
    fireEvent.press(screen.getByTestId('memory-consent-type'));
    expect(screen.queryByTestId('memory-consent-sheet')).toBeNull();
    expect(recorder.start).not.toHaveBeenCalled();
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic')));
    await act(async () => fireEvent.press(screen.getByTestId('memory-consent-allow')));
    expect(storage.get(memorySettingsKey).voiceConsent).toBe(true);
    expect(recorder.start).toHaveBeenCalledTimes(1);
    expect(screen.getByTestId('memory-rec-timer')).toHaveTextContent('0:00 / 0:30');
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic-stop')));
    await waitFor(() => expect(screen.getByTestId('memory-result')).toHaveTextContent(/Correct/));
    expect(checkVoice).toHaveBeenCalledWith(expect.any(Blob), 'mandarin', expect.objectContaining({ baseUrl: 'https://api.example' }), expect.anything());
    expect(storage.get(memoryLessonKey)!.steps[1]!.completedAt).not.toBeNull();
  });

  it('with consent given, the mic records at once; the timer announces 10 seconds left; it sends at 0:30 by itself', async () => {
    const storage = seeded();
    storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
    const rec = fakeRecorder();
    const checkVoice = answer({ kind: 'text', text: josh.chunks[3]! });
    await lesson({ recorder: rec.recorder, checkVoice }, { storage, auth: SIGNED_IN });
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic')));
    expect(screen.queryByTestId('memory-consent-sheet')).toBeNull();
    await rec.tick(20_000);
    expect(screen.getByTestId('memory-rec-timer')).toHaveTextContent('0:20 / 0:30');
    expect(screen.getByTestId('memory-rec-announce')).toHaveTextContent('10 seconds left');
    await rec.autoStop();
    await waitFor(() => expect(checkVoice).toHaveBeenCalledTimes(1));
  });

  it('Cancel while recording discards it: nothing is sent', async () => {
    const storage = seeded();
    storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
    const rec = fakeRecorder();
    const checkVoice = answer({ kind: 'text', text: 'x' });
    await lesson({ recorder: rec.recorder, checkVoice }, { storage, auth: SIGNED_IN });
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic')));
    fireEvent.press(screen.getByTestId('memory-mic-cancel'));
    expect(rec.recorder.cancel).toHaveBeenCalled();
    expect(checkVoice).not.toHaveBeenCalled();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
  });

  it('Cancel while checking stops waiting (the request is aborted) and returns to the mic', async () => {
    const storage = seeded();
    storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
    let signal: AbortSignal | undefined;
    const checkVoice = jest.fn(
      (_b: Blob, _l: string, _d: unknown, s?: AbortSignal) =>
        new Promise<VoiceOutcome>((resolve) => {
          signal = s;
          s?.addEventListener('abort', () => resolve({ kind: 'cancelled' }));
        }),
    );
    await lesson({ recorder: fakeRecorder().recorder, checkVoice }, { storage, auth: SIGNED_IN });
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic')));
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic-stop')));
    expect(screen.getByTestId('memory-grading')).toBeTruthy();
    await act(async () => fireEvent.press(screen.getByTestId('memory-grading-cancel')));
    expect(signal?.aborted).toBe(true);
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    expect(screen.queryByTestId('memory-result')).toBeNull();
  });

  it('microphone refused: the denied notice', async () => {
    const storage = seeded();
    storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
    await lesson({ recorder: fakeRecorder({ start: 'denied' }).recorder, checkVoice: answer({ kind: 'text', text: '' }) }, { storage, auth: SIGNED_IN });
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic')));
    expect(screen.getByTestId('memory-notice-denied')).toBeTruthy();
  });

  it.each([
    [{ kind: 'limit', retryAfterS: 10_800, window: 'day' } as VoiceOutcome, 'limit', /last 24 hours/],
    [{ kind: 'limit', retryAfterS: 40, window: 'minute' } as VoiceOutcome, 'limit', /40 s/],
    [{ kind: 'no-service' } as VoiceOutcome, 'no-service', /isn’t available right now/],
    [{ kind: 'too-long' } as VoiceOutcome, 'too-long', /too long to check/],
    [{ kind: 'timeout' } as VoiceOutcome, 'timeout', /took too long/],
    [{ kind: 'error' } as VoiceOutcome, 'error', /Couldn’t check that/],
    [{ kind: 'signed-out' } as VoiceOutcome, 'signed-out', /Sign in to use voice/],
  ])('outcome %j shows its notice, with typing', async (outcome, notice, copy) => {
    const storage = seeded();
    storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
    await lesson({ recorder: fakeRecorder().recorder, checkVoice: answer(outcome) }, { storage, auth: SIGNED_IN });
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic')));
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic-stop')));
    await waitFor(() => expect(screen.getByTestId(`memory-notice-${notice}`)).toHaveTextContent(copy));
    expect(screen.getByTestId('memory-type-input')).toBeTruthy();
  });

  it('a limit or a 503 seen once holds for the next trainer from the start', async () => {
    const storage = seeded();
    storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
    await lesson({ recorder: fakeRecorder().recorder, checkVoice: answer({ kind: 'no-service' }) }, { storage, auth: SIGNED_IN });
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic')));
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic-stop')));
    await waitFor(() => expect(screen.getByTestId('memory-notice-no-service')).toBeTruthy());
    screen.unmount();
    await lesson({ verseId: tim.id, stage: 'full-recall', index: 2, recorder: fakeRecorder().recorder }, { storage, auth: SIGNED_IN });
    expect(screen.getByTestId('memory-notice-no-service')).toBeTruthy();
    expect(screen.queryByTestId('memory-mic')).toBeNull();
  });

  it('a voice fail offers "Heard differently? Type it" without spending a check', async () => {
    const storage = seeded();
    storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
    const checkVoice = answer({ kind: 'text', text: '如此你的道露能以通' });
    await lesson({ recorder: fakeRecorder().recorder, checkVoice }, { storage, auth: SIGNED_IN });
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic')));
    await act(async () => fireEvent.press(screen.getByTestId('memory-mic-stop')));
    await waitFor(() => expect(screen.getByTestId('memory-result')).toHaveTextContent(/73%/));
    fireEvent.press(screen.getByTestId('memory-heard-differently'));
    expect(screen.getByTestId('memory-type-input').props.value).toBe('如此你的道露能以通');
    expect(checkVoice).toHaveBeenCalledTimes(1);
  });
});

// ---------------------------------------------------------------------------------------------------------
describe('full recall', () => {
  const fr = (over: Over = {}, opts = {}) => lesson({ verseId: tim.id, stage: 'full-recall', index: 2, ...over }, opts);

  it('typed with the reference passes; the reference card says how it was read', async () => {
    const { storage } = await fr();
    await typeAndCheck(`${tim.textZh}提后三章十六节`);
    expect(screen.getByTestId('memory-result')).toHaveTextContent(/Correct/);
    expect(screen.getByTestId('memory-ref-card')).toHaveTextContent(/提后三章十六节/);
    expect(screen.getByTestId('memory-ref-card')).toHaveTextContent(/提摩太后书 3:16/);
    expect(storage.get(memoryLessonKey)!.steps[2]!.completedAt).not.toBeNull();
  });

  it('without the reference: "No reference heard", a fail', async () => {
    await fr();
    await typeAndCheck(tim.textZh);
    expect(screen.getByTestId('memory-ref-card')).toHaveTextContent(/No reference heard/);
    expect(screen.getByTestId('memory-result')).toHaveTextContent(/Not quite/);
  });

  it('the wrong book: says which book it should be', async () => {
    await fr();
    await typeAndCheck('圣经都是神所默视的于教训使归规教导学义都有益的提摩太前书3:16');
    expect(screen.getByTestId('memory-result')).toHaveTextContent(/79%/);
    expect(screen.getByTestId('memory-ref-card')).toHaveTextContent(/提摩太后书/);
  });

  it('hint 1 shows the first character of each phrase; then the whole verse; the typing field is multiline', async () => {
    await fr();
    expect(screen.getByTestId('memory-type-input').props.multiline).toBe(true);
    fireEvent.press(screen.getByTestId('memory-hint'));
    expect(screen.getByTestId('memory-hint-text')).toHaveTextContent('圣＿＿＿＿＿＿＿＿，于＿＿、＿＿，使＿＿＿、＿＿＿＿＿，都＿＿＿＿。');
    fireEvent.press(screen.getByTestId('memory-hint'));
    expect(screen.getByTestId('memory-hint-text')).toHaveTextContent(tim.textZh);
    expect(screen.getByText(/a step only counts when you pass without one/)).toBeTruthy();
  });

  it('says how a reference may be spoken', async () => {
    await fr();
    expect(screen.getByTestId('memory-ref-help')).toHaveTextContent(/提后三章十六节/);
  });
});

// ---------------------------------------------------------------------------------------------------------
describe('unknown routes', () => {
  it('an unknown verse shows a way back, not a crash', async () => {
    await lesson({ verseId: 'not-a-verse' });
    expect(screen.getByTestId('memory-not-found')).toBeTruthy();
  });
});

// ---------------------------------------------------------------------------------------------------------
describe('the lesson’s end', () => {
  const end = (storage: Storage) =>
    renderMemory(({ storage: s, now, onNavigate }) => <CompleteScreen storage={s} now={now} onNavigate={onNavigate} />, { storage });

  it('one step left (skipped earlier): names it; Do it now opens it; no streak yet', async () => {
    const storage = seeded([false, true, true, true]);
    const { onNavigate } = await end(storage);
    expect(screen.getByTestId('memory-one-left')).toHaveTextContent(/3 of 4 done/);
    expect(screen.getByTestId('memory-one-left')).toHaveTextContent(/2 Corinthians 5:17/);
    fireEvent.press(screen.getByTestId('memory-do-now'));
    expect(onNavigate).toHaveBeenCalledWith(stepHref(STEPS, 0));
    expect(screen.queryByTestId('memory-complete')).toBeNull();
  });

  it('complete: the streak, the week, verses learned, the next reviews, back to Memory', async () => {
    const storage = seeded([true, true, true, true]);
    storage.set(memoryLessonKey, { ...storage.get(memoryLessonKey)!, completedAt: NOW.toISOString() });
    storage.set(memoryProgressKey, {
      [josh.id]: {
        stage: 'full_recall',
        successes: 2,
        failures: 0,
        masteryScore: 40,
        nextDueAt: new Date(2026, 10, 6, 23, 59).toISOString(),
        lastReviewedAt: NOW.toISOString(),
        lapsedAt: null,
      },
    });
    const { onNavigate } = await end(storage);
    const done = screen.getByTestId('memory-complete');
    expect(done).toHaveTextContent(/Lesson complete/);
    expect(screen.getByTestId('memory-complete-learned')).toHaveTextContent(/of 60/);
    expect(screen.getByTestId('memory-next-reviews')).toHaveTextContent(/Joshua 1:8 tomorrow/);
    expect(screen.getByTestId('memory-complete-title').props.accessibilityRole).toBe('header');
    fireEvent.press(screen.getByTestId('memory-back-to-memory'));
    expect(onNavigate).toHaveBeenCalledWith('/study/memory');
  });
});
