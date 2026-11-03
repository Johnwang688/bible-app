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

const stages = ['fill-blank', 'full-recall'] as const;
type Stage = typeof stages[number];
function deferred<T>() {
  let resolve!: (value: T) => void;
  let reject!: (reason: Error) => void;
  const promise = new Promise<T>((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
}
const jwt = (sub: string, version: number) => `e30.${Buffer.from(JSON.stringify({ sub, version })).toString('base64url')}.sig`;

async function setup(stage: Stage, initialToken = 'token') {
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
  let token: string | null = initialToken;
  const getIdToken = jest.fn<Promise<string | null>, []>(async () => token);
  const checkVoice = jest.fn<ReturnType<CheckVoice>, Parameters<CheckVoice>>(async (_blob, _lang, deps) => {
    await deps.getIdToken();
    return { kind: 'text', text };
  });
  let update!: (change: Partial<{ signedIn: boolean; user: string; online: boolean; version: number; mount: number }>) => void;
  function Session({ onNavigate }: { onNavigate: (href: string) => void }) {
    const [view, setView] = useState({ signedIn: true, user: 'alice', online: true, version: 0, mount: 0 });
    update = (change) => setView((current) => ({ ...current, ...change }));
    return <MemoryAuthProvider value={{ signedIn: view.signedIn, user: view.user, getIdToken }}>
      <LessonScreen key={view.mount} verseId={verse.id} stage={stage} index={0} storage={storage} now={() => NOW}
        onNavigate={onNavigate} recorder={recorder} checkVoice={checkVoice}
        getAppCheckToken={async () => null} isOnline={() => view.online} random={() => 0.7} />
    </MemoryAuthProvider>;
  }
  const rendered = await renderMemory(({ onNavigate }) => <Session onNavigate={onNavigate} />, { storage });
  return { ...rendered, verse, text, recorder, starts, getIdToken, checkVoice,
    setToken: (next: string | null) => { token = next; },
    change: async (change: Parameters<typeof update>[0]) => { await act(async () => { update(change); }); },
  };
}
async function send() {
  await fireEvent.press(screen.getByTestId('memory-mic'));
  await fireEvent.press(screen.getByTestId('memory-mic-stop'));
}
function expectNothing(s: Awaited<ReturnType<typeof setup>>) {
  expect(s.storage.get(memoryProgressKey)).toEqual({});
  expect(s.storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
  expect(screen.queryByTestId('memory-result')).toBeNull();
}
async function release<T>(d: ReturnType<typeof deferred<T>>, value: T) {
  await act(async () => { d.resolve(value); await d.promise; });
}
beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => jest.restoreAllMocks());

// Check: a slow final token read must be voided by Cancel, navigation, unmount, or auth changes.
it.each(stages.flatMap((stage) => ['cancel', 'back', 'unmount', 'sign-out', 'user'].map((event) => [stage, event] as const)))('%s voids pending confirm on %s', async (stage, event) => {
  const pending = deferred<string | null>();
  const s = await setup(stage);
  s.getIdToken.mockResolvedValueOnce('token').mockResolvedValueOnce('token').mockReturnValueOnce(pending.promise);
  await send();
  expect(s.getIdToken).toHaveBeenCalledTimes(3);
  if (event === 'cancel') await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
  else if (event === 'back') await fireEvent.press(screen.getByTestId('memory-back'));
  else if (event === 'unmount') await s.ui.unmount();
  else await s.change(event === 'sign-out' ? { signedIn: false } : { user: 'bob' });
  if (event !== 'unmount') expect(screen.queryByTestId('memory-grading')).toBeNull();
  await release(pending, 'token');
  expect(s.storage.get(memoryProgressKey)).toEqual({});
  expect(s.storage.get(memoryLessonKey)!.steps[0]!.completedAt).toBeNull();
  if (event !== 'unmount') expect(screen.queryByTestId('memory-result')).toBeNull();
});

// Check: the old confirm cannot finish or unlock a newer voice attempt.
it.each(stages)('%s preserves a second answer when a cancelled confirm lands', async (stage) => {
  const old = deferred<string | null>();
  const next = deferred<string | null>();
  const s = await setup(stage);
  s.getIdToken.mockResolvedValueOnce('token').mockResolvedValueOnce('token').mockReturnValueOnce(old.promise)
    .mockResolvedValueOnce('token').mockResolvedValueOnce('token').mockReturnValueOnce(next.promise);
  await send();
  await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
  await send();
  expect(s.getIdToken).toHaveBeenCalledTimes(6);
  await release(old, 'token');
  expectNothing(s);
  expect(screen.getByTestId('memory-grading')).toBeTruthy();
  await release(next, 'token');
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
  expect(screen.getByTestId('memory-result')).toBeTruthy();
});

// Check: failed/null final reads drop only that answer and free the trainer's grading latch.
it.each(stages.flatMap((stage) => ['null', 'reject', 'different-token'].map((kind) => [stage, kind] as const)))('%s recovers after confirm returns %s', async (stage, kind) => {
  const pending = deferred<string | null>();
  const s = await setup(stage);
  s.getIdToken.mockResolvedValueOnce('token').mockResolvedValueOnce('token').mockReturnValueOnce(pending.promise);
  await send();
  if (kind === 'reject') await act(async () => { pending.reject(new Error('token service unavailable')); });
  else await release(pending, kind === 'null' ? null : 'another-token');
  expectNothing(s);
  expect(screen.queryByTestId('memory-notice-signed-out')).toBeNull();
  expect(screen.getByTestId('memory-mic')).toBeTruthy();
  await send();
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
});

// Check: a same-user JWT refresh and unrelated provider renders do not discard a current confirm.
it.each(stages)('%s accepts a slow confirm with a same-sub JWT refresh and unchanged-auth renders', async (stage) => {
  const pending = deferred<string | null>();
  const s = await setup(stage, jwt('alice', 1));
  s.getIdToken.mockResolvedValueOnce(jwt('alice', 1)).mockResolvedValueOnce(jwt('alice', 1)).mockReturnValueOnce(pending.promise);
  await send();
  await s.change({ online: false, version: 1 });
  await s.change({ online: true, version: 2 });
  s.setToken(jwt('alice', 2));
  await release(pending, jwt('alice', 2));
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
});

// Check: hint use while the final session read waits is included at grade time.
it.each(stages)('%s counts a hint during confirm', async (stage) => {
  const pending = deferred<string | null>();
  const s = await setup(stage);
  s.getIdToken.mockResolvedValueOnce('token').mockResolvedValueOnce('token').mockReturnValueOnce(pending.promise);
  await send();
  await fireEvent.press(screen.getByTestId('memory-hint'));
  await release(pending, 'token');
  expect(s.storage.get(memoryProgressKey)).toEqual({});
  expect(screen.getByTestId('memory-result-title')).toHaveTextContent('Right, with a hint');
});

// Check: cancelling at confirm frees the shared latch for typing before the old read finishes.
it.each(stages)('%s accepts typing while a cancelled confirm remains pending', async (stage) => {
  const pending = deferred<string | null>();
  const s = await setup(stage);
  s.getIdToken.mockResolvedValueOnce('token').mockResolvedValueOnce('token').mockReturnValueOnce(pending.promise);
  await send();
  await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
  await fireEvent.press(screen.getByTestId('memory-type-toggle'));
  await fireEvent.changeText(screen.getByTestId('memory-type-input'), s.text);
  await fireEvent.press(screen.getByTestId('memory-type-check'));
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
  await release(pending, 'token');
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
});

// Check: a new mounted panel owns its attempt even when an old final read is unresolved.
it.each(stages)('%s ignores a pre-remount confirm', async (stage) => {
  const pending = deferred<string | null>();
  const s = await setup(stage);
  s.getIdToken.mockResolvedValueOnce('token').mockResolvedValueOnce('token').mockReturnValueOnce(pending.promise);
  await send();
  await s.change({ mount: 1 });
  await send();
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
  await release(pending, 'token');
  expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
});

// Check: falling back after keyer failure still rechecks the token session.
it.each(stages)('%s confirms after the keyer rejects', async (stage) => {
  const keyer = deferred<speech.SpeechKeyer>();
  jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValueOnce(keyer.promise);
  const s = await setup(stage);
  await send();
  s.setToken('another-token');
  await act(async () => { keyer.reject(new Error('keyer unavailable')); });
  expectNothing(s);
  expect(screen.getByTestId('memory-mic')).toBeTruthy();
});
