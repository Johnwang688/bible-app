// Sol S3 r7, parked 11-02 (5a step 5): an outside token refresh with signedIn unchanged must not let an old-token 401 or
// transcript apply, and an auth change while the keyer loads must record nothing. Passes with the voice-attempt machine
// (board 11-03, MEM). The other 16 r7 checks are in sol-s3r7-auth.test.tsx.
import { act, fireEvent, screen } from '@testing-library/react-native';
import { useState } from 'react';

import { memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import * as speech from '../speech/keyer';
import type { StageSlug } from '../types';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { MemoryAuthProvider } from '../voice/auth';
import { getVoiceSession, resetVoiceSessionForTesting } from '../voice/availability';
import type { CheckVoice, Recorder, VoiceOutcome } from '../voice/types';
import { renderMemory } from './memoryHarness';

function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((yes) => { resolve = yes; });
  return { promise, resolve };
}

// Based on round 6's setup; token replacement can also publish a new provider value without changing signedIn.
async function setup(opts: { check?: CheckVoice; stage?: StageSlug; signIn?: () => void } = {}) {
  const storage = createStorage(memoryBackend());
  storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), voiceConsent: true });
  const stage = opts.stage ?? 'fill-blank';
  const verse = getMemoryVerse(stage === 'full-recall' ? '2-timothy-3-16' : 'joshua-1-8')!;
  const text = stage === 'full-recall' ? verse.textZh + verse.referenceZh : verse.chunks[3]!;
  const recorder: Recorder = {
    supported: true,
    permission: jest.fn(async () => 'granted' as const),
    start: jest.fn(async () => 'recording' as const),
    stop: jest.fn(async () => ({ blob: new Blob(['audio']), durationMs: 3000 })),
    cancel: jest.fn(),
  };
  const checkVoice = jest.fn<ReturnType<CheckVoice>, Parameters<CheckVoice>>(opts.check ?? (async () => ({ kind: 'signed-out' })));
  let token: string | null = 'old-token';
  const getIdToken = jest.fn<Promise<string | null>, []>(async () => token);
  const signIn = jest.fn(opts.signIn ?? (() => undefined));
  let setAuth!: (signedIn: boolean) => void;
  let setOnline!: (online: boolean) => void;
  let publish!: () => void;
  let remount!: () => void;
  function Session({ onNavigate }: { onNavigate: (href: string) => void }) {
    const [signedIn, updateAuth] = useState(true);
    const [online, updateOnline] = useState(true);
    const [key, updateKey] = useState(0);
    const [, updateVersion] = useState(0);
    setAuth = updateAuth;
    setOnline = updateOnline;
    publish = () => updateVersion((v) => v + 1);
    remount = () => updateKey((k) => k + 1);
    return <MemoryAuthProvider value={{ signedIn, getIdToken, signIn }}>
      <LessonScreen key={key} verseId={verse.id} stage={stage} index={null} storage={storage}
        onNavigate={onNavigate} recorder={recorder} checkVoice={checkVoice} isOnline={() => online} random={() => 0.7} />
    </MemoryAuthProvider>;
  }
  const result = await renderMemory(({ onNavigate }) => <Session onNavigate={onNavigate} />, { storage });
  const changeAuth = async (signedIn: boolean) => { await act(async () => { setAuth(signedIn); }); };
  const replaceToken = async (next: string | null) => { await act(async () => { token = next; publish(); }); };
  const recover = async () => {
    await changeAuth(false);
    await replaceToken('new-token');
    await changeAuth(true);
  };
  return { ...result, recorder, checkVoice, getIdToken, signIn, verse, text, changeAuth, replaceToken, recover,
    remount: async () => { await act(async () => { remount(); }); },
    online: async (value: boolean) => { await act(async () => { setOnline(value); }); },
  };
}

async function recordAndSend() {
  await fireEvent.press(screen.getByTestId('memory-mic'));
  await fireEvent.press(screen.getByTestId('memory-mic-stop'));
}

beforeEach(() => resetVoiceSessionForTesting());
afterEach(() => jest.restoreAllMocks());

describe('S3 round 7 auth counterexamples', () => {
  // Finding: a 401 for the pre-refresh token blocks the mic after the provider already supplies a fresh token.
  it('ignores an old-token 401 after token refresh with signedIn unchanged', async () => {
    const pending = deferred<VoiceOutcome>();
    let sentToken: string | null = null;
    const s = await setup({ check: async (_blob, _lang, deps) => {
      sentToken = await deps.getIdToken();
      return pending.promise;
    } });
    await recordAndSend();
    expect(sentToken).toBe('old-token');
    await s.replaceToken('new-token');
    expect(await s.getIdToken()).toBe('new-token');
    await act(async () => { pending.resolve({ kind: 'signed-out' }); await pending.promise; });
    expect(screen.queryByTestId('memory-notice-signed-out')).toBeNull();
    expect(screen.queryByTestId('memory-grading')).toBeNull();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    await recordAndSend();
    expect(s.checkVoice).toHaveBeenCalledTimes(2);
  });

  // Finding: replacing the signed-in session's token without a signedIn edge lets the old transcript write progress.
  it.each(['fill-blank', 'full-recall'] as const)('%s discards the old transcript after external token replacement', async (stage) => {
    const pending = deferred<VoiceOutcome>();
    let sentToken: string | null = null;
    const s = await setup({ stage, check: async (_blob, _lang, deps) => {
      sentToken = await deps.getIdToken();
      return pending.promise;
    } });
    await recordAndSend();
    expect(sentToken).toBe('old-token');
    await s.replaceToken('new-token');
    expect(await s.getIdToken()).toBe('new-token');
    await act(async () => { pending.resolve({ kind: 'text', text: s.text }); await pending.promise; });
    expect(s.storage.get(memoryProgressKey)).toEqual({});
    expect(screen.queryByTestId('memory-result')).toBeNull();
    expect(screen.queryByTestId('memory-grading')).toBeNull();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
  });

  // Finding: the auth guard ends before async grading, so a sign-out/new sign-in while the keyer loads still records.
  it.each(['fill-blank', 'full-recall'] as const)('%s discards a transcript when auth changes during keyer loading', async (stage) => {
    const keyer = deferred<speech.SpeechKeyer>();
    const load = jest.spyOn(speech, 'loadSpeechKeyer').mockReturnValueOnce(keyer.promise);
    const s = await setup({ stage });
    s.checkVoice.mockImplementationOnce(async (_blob, _lang, deps) => {
      expect(await deps.getIdToken()).toBe('old-token');
      return { kind: 'text', text: s.text };
    });
    await recordAndSend();
    expect(load).toHaveBeenCalledTimes(1);
    expect(screen.getByTestId('memory-grading')).toBeTruthy();
    expect(s.storage.get(memoryProgressKey)).toEqual({});
    await s.recover();
    await act(async () => { keyer.resolve(speech.MANDARIN_SYNC_KEYER); await keyer.promise; });
    expect(s.storage.get(memoryProgressKey)).toEqual({});
    expect(screen.queryByTestId('memory-result')).toBeNull();
    expect(screen.queryByTestId('memory-grading')).toBeNull();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
  });
});
