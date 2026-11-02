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

describe('S3 round 5 probes', () => {
  // Check the shared latch when a typed action overlaps recording auto-stop.
  it.each(stages)('%s records once when typed Check races auto-stop', async (stage) => {
    const { storage, verse, text, autoStop } = await setup(stage);
    await prepareTyped(text);
    const check = screen.getByTestId('memory-type-check');
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await act(async () => { await fireEvent.press(check); autoStop(); });
    expect(storage.get(memoryProgressKey)[verse.id]!.successes).toBe(1);
  });

  // Probe: a hint used while the network is pending must still suppress recording after the keyer loads.
  it.each(stages)('%s keeps a hidden hint used during a pending server check', async (stage) => {
    const pending = deferred<VoiceOutcome>();
    const { storage, text } = await setup(stage, () => pending.promise);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    for (let i = 0; i < 3; i++) await fireEvent.press(screen.getByTestId('memory-hint'));
    await act(async () => { pending.resolve({ kind: 'text', text }); await pending.promise; });
    expect(storage.get(memoryProgressKey)).toEqual({});
    expect(screen.getByTestId('memory-result-title')).toHaveTextContent('Right, with a hint');
  });

  // Probe: a cancelled late error must not replace the state or notice of the next answer.
  it.each(stages)('%s preserves the new limit when a cancelled request fails late', async (stage) => {
    const old = deferred<VoiceOutcome>();
    let calls = 0;
    const { storage } = await setup(stage, async () => ++calls === 1 ? old.promise : { kind: 'limit', retryAfterS: 90, window: 'day' });
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    await act(async () => { old.resolve({ kind: 'error' }); await old.promise; });
    expect(screen.getByTestId('memory-notice-limit')).toBeTruthy();
    expect(screen.queryByTestId('memory-notice-error')).toBeNull();
    expect(storage.get(memoryProgressKey)).toEqual({});
  });

  // Probe: both queued reveal actions and stale placement taps must preserve every phrase exactly once.
  it('preserves the chunk partition across queued retry and reveal actions', async () => {
    const { verse, storage } = await setup('chunk-order');
    const invariant = () => {
      for (const phrase of verse.chunks) expect(screen.getAllByText(phrase, { exact: true })).toHaveLength(1);
    };
    const chip = screen.getByTestId('chunk-chip-0');
    await act(async () => { await fireEvent.press(chip); await fireEvent.press(chip); });
    invariant();
    await fireEvent.press(screen.getByTestId('chunk-slot-0'));
    invariant();
    for (const c of [1, 0, 2]) await fireEvent.press(screen.getByTestId('chunk-chip-' + c));
    await fireEvent.press(screen.getByTestId('chunk-check'));
    invariant();
    const retry = screen.getByTestId('chunk-retry-marked');
    const show = screen.getByTestId('chunk-show-order');
    await act(async () => { await fireEvent.press(retry); await fireEvent.press(show); });
    invariant();
    for (const c of [1, 0]) await fireEvent.press(screen.getByTestId('chunk-chip-' + c));
    await fireEvent.press(screen.getByTestId('chunk-check'));
    const showAgain = screen.getByTestId('chunk-show-order');
    await act(async () => { await fireEvent.press(showAgain); await fireEvent.press(showAgain); });
    invariant();
    const myself = screen.getByTestId('chunk-place-myself');
    await act(async () => { await fireEvent.press(myself); await fireEvent.press(myself); });
    invariant();
    for (const c of [0, 1]) await fireEvent.press(screen.getByTestId('chunk-chip-' + c));
    await fireEvent.press(screen.getByTestId('chunk-check'));
    invariant();
    expect(storage.get(memoryProgressKey)[verse.id]).toMatchObject({ successes: 1, failures: 2 });
  });

  // Check that a cancelled keyer settling after the next result cannot overwrite or record again.
  it.each(stages)('%s ignores the old keyer fallback after a new voice answer completes', async (stage) => {
    const old = deferred<speech.SpeechKeyer>();
    jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValueOnce(old.promise).mockResolvedValue(speech.MANDARIN_SYNC_KEYER);
    const { storage, verse } = await setup(stage);
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
    await fireEvent.press(screen.getByTestId('memory-mic'));
    await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    await act(async () => { old.resolve(speech.MANDARIN_SYNC_KEYER); await old.promise; });
    expect(storage.get(memoryProgressKey)[verse.id]!.successes).toBe(1);
    expect(screen.getByTestId('memory-result-title')).toHaveTextContent('Correct');
  });
});

// Finding: a server 401 notice stays latched after authentication changes from signed out to signed in.
it('restores the mic after signing in again following a server 401', async () => {
  const storage = createStorage(memoryBackend());
  storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
  const recorder: Recorder = {
    supported: true, permission: jest.fn(async () => 'granted' as const),
    start: jest.fn(async () => 'recording' as const),
    stop: jest.fn(async () => ({ blob: new Blob(['audio']), durationMs: 3000 })), cancel: jest.fn(),
  };
  const checkVoice = jest.fn<ReturnType<CheckVoice>, Parameters<CheckVoice>>(async () => ({ kind: 'signed-out' }));
  const signedIn = jest.fn();
  let signOut!: () => void;
  function Session({ onNavigate }: { onNavigate: (href: string) => void }) {
    const [fresh, setFresh] = useState(false);
    const [authenticated, setAuthenticated] = useState(true);
    signOut = () => setAuthenticated(false);
    return <MemoryAuthProvider value={{ signedIn: authenticated,
      getIdToken: async () => fresh ? 'fresh-token' : 'expired-token',
      signIn: () => { signedIn(); setFresh(true); setAuthenticated(true); },
    }}><LessonScreen verseId="joshua-1-8" stage="fill-blank" index={null} storage={storage}
      onNavigate={onNavigate} recorder={recorder} checkVoice={checkVoice} isOnline={() => true} random={() => 0.7}
    /></MemoryAuthProvider>;
  }
  await renderMemory(({ onNavigate }) => <Session onNavigate={onNavigate} />, { storage });
  await fireEvent.press(screen.getByTestId('memory-mic'));
  await fireEvent.press(screen.getByTestId('memory-mic-stop'));
  expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
  await act(async () => { signOut(); });
  await fireEvent.press(screen.getByTestId('memory-notice-sign-in'));
  expect(signedIn).toHaveBeenCalledTimes(1);
  expect(screen.queryByTestId('memory-notice-signed-out') !== null).toBe(false);
  expect(screen.getByTestId('memory-mic')).toBeTruthy();
});
