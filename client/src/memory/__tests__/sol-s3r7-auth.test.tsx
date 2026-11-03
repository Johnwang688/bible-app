import { act, fireEvent, screen } from '@testing-library/react-native';
import { useState } from 'react';

import { memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
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

// Round 7's five failing auth cases (outside token refresh, auth change during keyer loading) are parked
// outside the suite for the voice-attempt state-machine follow-up; these are the passing regression checks.
describe('S3 round 7 current results and discarded-result recovery', () => {
  // Check: an unchanged auth state accepts a slow token, a provider rerender, and a slow current transcript.
  it.each(['fill-blank', 'full-recall'] as const)('%s accepts a slow token and current transcript', async (stage) => {
    const token = deferred<string | null>();
    const pending = deferred<VoiceOutcome>();
    const s = await setup({ stage, check: async (_blob, _lang, deps) => {
      expect(await deps.getIdToken()).toBe('old-token');
      return pending.promise;
    } });
    s.getIdToken.mockReturnValueOnce(token.promise);
    await recordAndSend();
    expect(screen.getByTestId('memory-grading')).toBeTruthy();
    await s.replaceToken('old-token');
    await act(async () => { token.resolve('old-token'); await token.promise; });
    await act(async () => { pending.resolve({ kind: 'text', text: s.text }); await pending.promise; });
    expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
    expect(screen.getByTestId('memory-result')).toBeTruthy();
    expect(screen.queryByTestId('memory-grading')).toBeNull();
  });

  // Check: a null token in an unchanged signedIn state produces a notice and leaves typing usable.
  it('applies a current null-token signed-out result', async () => {
    const token = deferred<string | null>();
    const s = await setup({ check: async (_blob, _lang, deps) => {
      expect(await deps.getIdToken()).toBeNull();
      return { kind: 'signed-out' };
    } });
    s.getIdToken.mockReturnValueOnce(token.promise);
    await recordAndSend();
    await s.replaceToken(null);
    await act(async () => { token.resolve(null); await token.promise; });
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    expect(screen.queryByTestId('memory-grading')).toBeNull();
    await fireEvent.changeText(screen.getByTestId('memory-type-input'), s.text);
    await fireEvent.press(screen.getByTestId('memory-type-check'));
    expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
  });

  // Check: each outcome discarded across a signedIn edge returns to idle and permits another check.
  it.each<VoiceOutcome>([
    { kind: 'signed-out' }, { kind: 'text', text: 'ignored' }, { kind: 'offline' }, { kind: 'too-long' }, { kind: 'timeout' },
    { kind: 'error' }, { kind: 'no-service' }, { kind: 'limit', retryAfterS: 60, window: 'minute' },
  ])('recovers the mic and busy latch after discarding $kind', async (outcome) => {
    const pending = deferred<VoiceOutcome>();
    const s = await setup({ check: async (_blob, _lang, deps) => {
      await deps.getIdToken();
      return pending.promise;
    } });
    await recordAndSend();
    await s.recover();
    await act(async () => { pending.resolve(outcome); await pending.promise; });
    expect(screen.queryByTestId('memory-grading')).toBeNull();
    expect(screen.queryByTestId(`memory-notice-${outcome.kind}`)).toBeNull();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    expect(getVoiceSession()).toEqual({ serviceDown: false, limitedUntil: null });
    s.checkVoice.mockResolvedValueOnce({ kind: 'timeout' });
    await recordAndSend();
    expect(s.checkVoice).toHaveBeenCalledTimes(2);
    expect(screen.getByTestId('memory-notice-timeout')).toBeTruthy();
    expect(s.storage.get(memoryProgressKey)).toEqual({});
  });

  // Check: a token fetch resolving after Cancel cannot replace the second request's notice.
  it('preserves the second request when a cancelled token fetch resolves late', async () => {
    const token = deferred<string | null>();
    const s = await setup({ check: async (_blob, _lang, deps) => {
      await deps.getIdToken();
      return { kind: 'signed-out' };
    } });
    s.getIdToken.mockReturnValueOnce(token.promise);
    await recordAndSend();
    await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
    s.checkVoice.mockResolvedValueOnce({ kind: 'timeout' });
    await recordAndSend();
    await act(async () => { token.resolve('old-token'); await token.promise; });
    expect(screen.getByTestId('memory-notice-timeout')).toBeTruthy();
    expect(screen.queryByTestId('memory-notice-signed-out')).toBeNull();
    await fireEvent.press(screen.getByTestId('memory-notice-try-again'));
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    await s.ui.unmount();
  });
});

describe('S3 round 7 token and sign-in completion ordering', () => {
  // Check: a refresh unrelated to sign-in can finish while token acquisition is pending without dropping its result.
  it.each(['fill-blank', 'full-recall'] as const)('%s accepts the refreshed token returned by a slow current fetch', async (stage) => {
    const token = deferred<string | null>();
    const s = await setup({ stage });
    s.getIdToken.mockReturnValueOnce(token.promise);
    s.checkVoice.mockImplementationOnce(async (_blob, _lang, deps) => {
      expect(await deps.getIdToken()).toBe('new-token');
      return { kind: 'text', text: s.text };
    });
    await recordAndSend();
    await s.replaceToken('new-token');
    await act(async () => { token.resolve('new-token'); await token.promise; });
    expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
    expect(screen.getByTestId('memory-result')).toBeTruthy();
  });

  // Check: a current injected 401 without a token fetch still settles after its slow fallback returns null.
  it('applies a current 401 after a slow null-token fallback', async () => {
    const token = deferred<string | null>();
    const s = await setup();
    s.getIdToken.mockReturnValueOnce(token.promise);
    await recordAndSend();
    expect(screen.getByTestId('memory-grading')).toBeTruthy();
    await act(async () => { token.resolve(null); await token.promise; });
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    expect(screen.queryByTestId('memory-grading')).toBeNull();
    expect(s.storage.get(memoryProgressKey)).toEqual({});
  });

  // Check: a sign-in already resolved but still fetching its token cannot erase a newer notice's latch.
  it('keeps a newer 401 when the older sign-in token fetch resolves', async () => {
    const token = deferred<string | null>();
    const s = await setup({ signIn: async () => undefined });
    await recordAndSend();
    s.getIdToken.mockReturnValueOnce(token.promise);
    await fireEvent.press(screen.getByTestId('memory-notice-sign-in'));
    expect(s.getIdToken).toHaveBeenCalledTimes(2);
    await s.recover();
    await recordAndSend();
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    await act(async () => { token.resolve('new-token'); await token.promise; });
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    expect(screen.queryByTestId('memory-mic')).toBeNull();
    await s.remount();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
  });
});