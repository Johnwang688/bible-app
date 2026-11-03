import { act, fireEvent, screen } from '@testing-library/react-native';
import { useState } from 'react';

import { memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import { toLocalDateString } from '../localDate';
import * as speech from '../speech/keyer';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { MemoryAuthProvider } from '../voice/auth';
import { resetVoiceSessionForTesting } from '../voice/availability';
import type { CheckVoice, Recorder, RecorderStartOptions } from '../voice/types';
import { NOW, renderMemory } from './memoryHarness';

type Stage = 'fill-blank' | 'full-recall';
const stages: Stage[] = ['fill-blank', 'full-recall'];
function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((yes) => { resolve = yes; });
  return { promise, resolve };
}
const jwt = (sub: string, version: number) => `e30.${Buffer.from(JSON.stringify({ sub, version })).toString('base64url')}.sig`;

async function setup(stage: Stage = 'fill-blank', opts: { check?: CheckVoice; token?: string } = {}) {
  const storage = createStorage(memoryBackend());
  const verse = getMemoryVerse(stage === 'fill-blank' ? 'joshua-1-8' : '2-timothy-3-16')!;
  const text = stage === 'fill-blank' ? verse.chunks[3]! : verse.textZh + verse.referenceZh;
  storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
  storage.set(memoryLessonKey, { date: toLocalDateString(NOW), steps: [{ verseId: verse.id, stage, completedAt: null }], completedAt: null });
  const starts: RecorderStartOptions[] = [];
  const recorder: Recorder = {
    supported: true,
    permission: jest.fn(async () => 'granted' as const),
    start: jest.fn(async (options: RecorderStartOptions) => { starts.push(options); return 'recording' as const; }),
    stop: jest.fn(async () => ({ blob: new Blob(['audio']), durationMs: 3000 })),
    cancel: jest.fn(),
  };
  let token: string | null = opts.token ?? 'old-token';
  const getIdToken = jest.fn<Promise<string | null>, []>(async () => token);
  const checkVoice = jest.fn<ReturnType<CheckVoice>, Parameters<CheckVoice>>(opts.check ?? (async (_blob, _lang, deps) => {
    await deps.getIdToken();
    return { kind: 'text', text };
  }));
  let update!: (change: Partial<{ signedIn: boolean; user: string; online: boolean; version: number }>) => void;
  function Session({ onNavigate }: { onNavigate: (href: string) => void }) {
    const [view, setView] = useState({ signedIn: true, user: 'alice', online: true, version: 0 });
    update = (change) => setView((current) => ({ ...current, ...change }));
    return <MemoryAuthProvider value={{ signedIn: view.signedIn, user: view.user, getIdToken }}>
      <LessonScreen verseId={verse.id} stage={stage} index={0} storage={storage} now={() => NOW}
        onNavigate={onNavigate} recorder={recorder} checkVoice={checkVoice}
        getAppCheckToken={async () => null} isOnline={() => view.online} random={() => 0.7} />
    </MemoryAuthProvider>;
  }
  const rendered = await renderMemory(({ onNavigate }) => <Session onNavigate={onNavigate} />, { storage });
  return { ...rendered, verse, text, recorder, starts, getIdToken, checkVoice,
    change: async (change: Parameters<typeof update>[0]) => { await act(async () => { update(change); }); },
    replaceToken: async (next: string | null) => { token = next; await act(async () => { update({ version: 1 }); }); },
  };
}
async function send() {
  await fireEvent.press(screen.getByTestId('memory-mic'));
  await fireEvent.press(screen.getByTestId('memory-mic-stop'));
}
async function settleKeyer(keyer: ReturnType<typeof deferred<speech.SpeechKeyer>>) {
  await act(async () => { keyer.resolve(speech.MANDARIN_SYNC_KEYER); await keyer.promise; });
}
beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => { jest.restoreAllMocks(); jest.useRealTimers(); });

// Finding: a typed Check begun after the lesson has left creates a live ticket and displays a result.
it.each(stages)('%s ignores queued typed Check after Back', async (stage) => {
  const s = await setup(stage);
  await fireEvent.press(screen.getByTestId('memory-type-toggle'));
  await fireEvent.changeText(screen.getByTestId('memory-type-input'), s.text);
  const check = screen.getByTestId('memory-type-check');
  await act(async () => {
    await fireEvent.press(screen.getByTestId('memory-back'));
    await fireEvent.press(check);
  });
  expect(s.onNavigate).toHaveBeenCalledTimes(1);
  expect(s.storage.get(memoryProgressKey)).toEqual({});
  expect(s.storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
  expect(screen.queryByTestId('memory-result')).toBeNull();
});

// Finding: replacing the token during keyer loading escapes the landing-only session check.
it.each(stages.flatMap((stage) => (['opaque', 'JWT'] as const).map((kind) => [stage, kind] as const)))('%s discards a transcript if its token session changes during keyer loading (%s)', async (stage, kind) => {
  const keyer = deferred<speech.SpeechKeyer>();
  const load = jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValueOnce(keyer.promise);
  const s = await setup(stage, { token: kind === 'JWT' ? jwt('alice', 1) : 'old-token' });
  await send();
  expect(load).toHaveBeenCalledTimes(1);
  expect(s.getIdToken).toHaveBeenCalledTimes(2);
  await s.replaceToken(kind === 'JWT' ? jwt('bob', 1) : 'new-token');
  await settleKeyer(keyer);
  expect(s.storage.get(memoryProgressKey)).toEqual({});
  expect(s.storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
  expect(screen.queryByTestId('memory-result')).toBeNull();
  expect(screen.getByTestId('memory-mic')).toBeTruthy();
});

// Finding: a token read after the completed HTTP request can keep sending alive forever after auth aborts it.
it('sign-out during a hung landing token read restores the mic for the next session', async () => {
  const tokenRead = deferred<string | null>();
  const s = await setup();
  s.getIdToken.mockResolvedValueOnce('old-token').mockReturnValueOnce(tokenRead.promise);
  await send();
  expect(s.getIdToken).toHaveBeenCalledTimes(2);
  expect(screen.getByTestId('memory-grading')).toBeTruthy();
  await s.change({ signedIn: false });
  await s.replaceToken('new-token');
  await s.change({ signedIn: true });
  const state = { grading: screen.queryByTestId('memory-grading') !== null, mic: screen.queryByTestId('memory-mic') !== null };
  await act(async () => { tokenRead.resolve('old-token'); await tokenRead.promise; });
  expect(s.storage.get(memoryProgressKey)).toEqual({});
  expect(state).toEqual({ grading: false, mic: true });
  await send();
  expect(s.checkVoice).toHaveBeenCalledTimes(2);
});

it.each(stages)('%s accepts a Firebase refresh with the same sub before landing', async (stage) => {
  const outcome = deferred<Awaited<ReturnType<CheckVoice>>>();
  const s = await setup(stage, { token: jwt('alice', 1), check: async (_blob, _lang, deps) => {
    await deps.getIdToken();
    return outcome.promise;
  } });
  await send();
  await s.replaceToken(jwt('alice', 2));
  await act(async () => { outcome.resolve({ kind: 'text', text: s.text }); await outcome.promise; });
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
  expect(screen.getByTestId('memory-result')).toBeTruthy();
});

it.each(stages)('%s keeps its current grade through unchanged-auth and online re-renders', async (stage) => {
  const keyer = deferred<speech.SpeechKeyer>();
  jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValueOnce(keyer.promise);
  const s = await setup(stage);
  await send();
  await s.change({ online: false, version: 1 });
  await s.change({ online: true, version: 2 });
  await settleKeyer(keyer);
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
});

it.each(stages)('%s counts hints opened while the keyer is pending', async (stage) => {
  const keyer = deferred<speech.SpeechKeyer>();
  jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValueOnce(keyer.promise);
  const s = await setup(stage);
  await send();
  await fireEvent.press(screen.getByTestId('memory-hint'));
  await settleKeyer(keyer);
  expect(s.storage.get(memoryProgressKey)).toEqual({});
  expect(screen.getByTestId('memory-result-title')).toHaveTextContent('Right, with a hint');
});

it.each(['memory-back', 'unmount', 'auth'] as const)('cancels an active recorder on %s', async (event) => {
  const s = await setup();
  await fireEvent.press(screen.getByTestId('memory-mic'));
  if (event === 'unmount') await s.ui.unmount();
  else if (event === 'auth') await s.change({ user: 'bob' });
  else await fireEvent.press(screen.getByTestId(event));
  expect(s.recorder.cancel).toHaveBeenCalledTimes(1);
});


it('accepts a slow landing token read when the same session remains current', async () => {
  const tokenRead = deferred<string | null>();
  const s = await setup();
  s.getIdToken.mockResolvedValueOnce('old-token').mockReturnValueOnce(tokenRead.promise);
  await send();
  expect(screen.getByTestId('memory-grading')).toBeTruthy();
  await s.change({ version: 1 });
  await act(async () => { tokenRead.resolve('old-token'); await tokenRead.promise; });
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
});

it('drops a null landing token without a notice and accepts the next answer', async () => {
  const s = await setup();
  s.getIdToken.mockResolvedValueOnce('old-token').mockResolvedValueOnce(null);
  await send();
  expect(s.storage.get(memoryProgressKey)).toEqual({});
  expect(screen.queryByTestId('memory-notice-signed-out')).toBeNull();
  expect(screen.getByTestId('memory-mic')).toBeTruthy();
  await send();
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
});

it('a current null request token shows signed-out and never grades', async () => {
  const s = await setup('fill-blank', { check: async (_blob, _lang, deps) => {
    await deps.getIdToken();
    return { kind: 'signed-out' };
  } });
  s.getIdToken.mockResolvedValue(null);
  await send();
  expect(s.storage.get(memoryProgressKey)).toEqual({});
  expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
  expect(screen.queryByTestId('memory-grading')).toBeNull();
});