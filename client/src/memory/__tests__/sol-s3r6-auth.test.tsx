import { act, fireEvent, screen } from '@testing-library/react-native';
import { useState } from 'react';

import { memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { getMemoryVerse } from '../library';
import type { StageSlug } from '../types';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { MemoryAuthProvider } from '../voice/auth';
import { recordVoiceOutcome, resetVoiceSessionForTesting } from '../voice/availability';
import type { CheckVoice, Recorder, VoiceOutcome } from '../voice/types';
import { renderMemory } from './memoryHarness';

function deferred<T>() {
  let resolve!: (value: T) => void;
  let reject!: (reason: Error) => void;
  const promise = new Promise<T>((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
}

async function setup(opts: { signIn?: () => void; check?: CheckVoice; stage?: StageSlug } = {}) {
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
  let setAuth!: (signedIn: boolean) => void;
  let remount!: () => void;
  let setOnline!: (online: boolean) => void;
  let fresh = false;
  const getIdToken = jest.fn(async () => fresh ? 'fresh-token' : 'expired-token');
  const signIn = jest.fn(opts.signIn ?? (() => undefined));
  function Session({ onNavigate }: { onNavigate: (href: string) => void }) {
    const [signedIn, updateAuth] = useState(true);
    const [key, updateKey] = useState(0);
    const [online, updateOnline] = useState(true);
    setAuth = updateAuth;
    setOnline = updateOnline;
    remount = () => updateKey((k) => k + 1);
    return <MemoryAuthProvider value={{ signedIn, getIdToken, signIn }}>
      <LessonScreen key={key} verseId={verse.id} stage={stage} index={null} storage={storage}
        onNavigate={onNavigate} recorder={recorder} checkVoice={checkVoice} isOnline={() => online} random={() => 0.7} />
    </MemoryAuthProvider>;
  }
  const result = await renderMemory(({ onNavigate }) => <Session onNavigate={onNavigate} />, { storage });
  const changeAuth = async (signedIn: boolean) => {
    await act(async () => { setAuth(signedIn); });
  };
  const recover = async () => {
    await changeAuth(false);
    fresh = true;
    await changeAuth(true);
  };
  return { ...result, recorder, checkVoice, getIdToken, signIn, verse, text, changeAuth, recover, refreshToken: () => { fresh = true; },
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

describe('S3 round 6 signed-out latch counterexamples', () => {
  // Finding: a resolved sign-in with an unchanged expired session hides the server 401 notice.
  it('keeps the 401 notice when sign-in resolves without authenticating', async () => {
    const s = await setup({ signIn: async () => undefined });
    await recordAndSend();
    expect(await s.getIdToken()).toBe('expired-token');
    await fireEvent.press(screen.getByTestId('memory-notice-sign-in'));
    expect(s.signIn).toHaveBeenCalledTimes(1);
    expect(await s.getIdToken()).toBe('expired-token');
    expect(screen.queryByTestId('memory-mic')).toBeNull();
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
  });

  // Finding: an older sign-in completion erases a second 401 received after external recovery.
  it('does not let a stale sign-in completion clear a newer 401', async () => {
    const pending = deferred<void>();
    const s = await setup({ signIn: () => pending.promise });
    await recordAndSend();
    await fireEvent.press(screen.getByTestId('memory-notice-sign-in'));
    await s.recover();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    await recordAndSend();
    expect(s.checkVoice).toHaveBeenCalledTimes(2);
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    await act(async () => { pending.resolve(); await pending.promise; });
    expect(screen.queryByTestId('memory-mic')).toBeNull();
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
  });

  // Finding: a request using the expired token can re-latch the notice after external sign-in completes.
  it('ignores an old-token 401 landing after external sign-in', async () => {
    const pending = deferred<VoiceOutcome>();
    let token: string | null = null;
    const s = await setup({ check: async (_blob, _lang, deps) => {
      token = await deps.getIdToken();
      return pending.promise;
    } });
    await recordAndSend();
    expect(token).toBe('expired-token');
    expect(screen.getByTestId('memory-grading')).toBeTruthy();
    expect(screen.queryByTestId('memory-mic')).toBeNull();
    await s.recover();
    expect(await s.getIdToken()).toBe('fresh-token');
    await act(async () => { pending.resolve({ kind: 'signed-out' }); await pending.promise; });
    expect(screen.queryByTestId('memory-notice-signed-out')).toBeNull();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
  });

  // Finding: an old-token answer still records progress after sign-out and a new sign-in.
  it.each(['fill-blank', 'full-recall'] as const)('%s discards an old-token transcript after external sign-in', async (stage) => {
    const pending = deferred<VoiceOutcome>();
    let token: string | null = null;
    const s = await setup({ stage, check: async (_blob, _lang, deps) => {
      token = await deps.getIdToken();
      return pending.promise;
    } });
    await recordAndSend();
    expect(token).toBe('expired-token');
    expect(screen.queryByTestId('memory-mic')).toBeNull();
    await s.recover();
    expect(await s.getIdToken()).toBe('fresh-token');
    await act(async () => { pending.resolve({ kind: 'text', text: s.text }); await pending.promise; });
    expect(s.storage.get(memoryProgressKey)).toEqual({});
    expect(screen.queryByTestId('memory-result')).toBeNull();
  });
});

describe('S3 round 6 clean paths and regressions', () => {
  // Check: a late successful sign-in restores the mic only after it settles.
  it('recovers after a delayed successful notice sign-in', async () => {
    const pending = deferred<void>();
    const s = await setup({ signIn: () => pending.promise });
    await recordAndSend();
    await fireEvent.press(screen.getByTestId('memory-notice-sign-in'));
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    s.refreshToken();
    await act(async () => { pending.resolve(); await pending.promise; });
    expect(await s.getIdToken()).toBe('fresh-token');
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
  });

  // Check: a rejected notice sign-in leaves the server 401 notice visible.
  it('preserves the 401 notice when sign-in rejects', async () => {
    const pending = deferred<void>();
    const s = await setup({ signIn: () => pending.promise });
    await recordAndSend();
    await fireEvent.press(screen.getByTestId('memory-notice-sign-in'));
    await act(async () => { pending.reject(new Error('Sign-in cancelled')); await pending.promise.catch(() => undefined); });
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    expect(screen.queryByTestId('memory-mic')).toBeNull();
    expect(s.storage.get(memoryProgressKey)).toEqual({});
  });

  // Check: the signed-out gate still hides the mic if a sign-in resolves while auth remains false.
  it('keeps the notice when sign-in resolves but signedIn remains false', async () => {
    const s = await setup({ signIn: async () => undefined });
    await recordAndSend();
    await s.changeAuth(false);
    await fireEvent.press(screen.getByTestId('memory-notice-sign-in'));
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    expect(screen.queryByTestId('memory-mic')).toBeNull();
  });

  // Check: external sign-in, remount, and another 401 each have the expected independent state.
  it('recovers externally and on remount, and shows a second 401', async () => {
    const s = await setup();
    await recordAndSend();
    await s.recover();
    expect(s.signIn).not.toHaveBeenCalled();
    await recordAndSend();
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    await s.remount();
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    await recordAndSend();
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    expect(s.checkVoice).toHaveBeenCalledTimes(3);
  });

  // Check: neither an auth transition nor an old sign-in completion clears another local error.
  it.each(['too-long', 'timeout', 'error', 'unsupported'] as const)('preserves %s across sign-in paths', async (notice) => {
    const pending = deferred<void>();
    const s = await setup({ signIn: () => pending.promise });
    await recordAndSend();
    await fireEvent.press(screen.getByTestId('memory-notice-sign-in'));
    await s.recover();
    if (notice === 'unsupported') jest.mocked(s.recorder.start).mockResolvedValueOnce('unsupported');
    else s.checkVoice.mockResolvedValueOnce({ kind: notice });
    await fireEvent.press(screen.getByTestId('memory-mic'));
    if (notice !== 'unsupported') await fireEvent.press(screen.getByTestId('memory-mic-stop'));
    expect(screen.getByTestId(`memory-notice-${notice}`)).toBeTruthy();
    await s.recover();
    await act(async () => { pending.resolve(); await pending.promise; });
    expect(screen.getByTestId(`memory-notice-${notice}`)).toBeTruthy();
    expect(screen.queryByTestId('memory-mic')).toBeNull();
  });

  // Check: offline gating survives auth recovery and returns to the mic when online.
  it('keeps the offline notice across sign-in until the network recovers', async () => {
    const s = await setup();
    await s.online(false);
    await s.recover();
    expect(screen.getByTestId('memory-notice-offline')).toBeTruthy();
    await s.online(true);
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
  });

  // Check: simultaneous gates keep their specified precedence after clearing the signed-out latch.
  it('preserves voice, recorder, auth, network, 503 and 429 gate order', async () => {
    const s = await setup();
    await recordAndSend();
    await s.recover();
    await act(async () => {
      recordVoiceOutcome({ kind: 'no-service' }, Date.now());
      recordVoiceOutcome({ kind: 'limit', retryAfterS: 60, window: 'minute' }, Date.now());
      s.storage.set(memorySettingsKey, { ...s.storage.get(memorySettingsKey), voice: false });
    });
    jest.replaceProperty(s.recorder, 'supported', false);
    await s.online(false);
    await s.changeAuth(false);
    expect(screen.getByTestId('memory-notice-voice-off')).toBeTruthy();
    await act(async () => { s.storage.set(memorySettingsKey, { ...s.storage.get(memorySettingsKey), voice: true }); });
    expect(screen.getByTestId('memory-notice-unsupported')).toBeTruthy();
    jest.replaceProperty(s.recorder, 'supported', true);
    await s.online(true);
    expect(screen.getByTestId('memory-notice-signed-out')).toBeTruthy();
    await s.online(false);
    await s.changeAuth(true);
    expect(screen.getByTestId('memory-notice-offline')).toBeTruthy();
    await s.online(true);
    expect(screen.getByTestId('memory-notice-no-service')).toBeTruthy();
    await act(async () => {
      resetVoiceSessionForTesting();
      recordVoiceOutcome({ kind: 'limit', retryAfterS: 60, window: 'minute' }, Date.now());
    });
    expect(screen.getByTestId('memory-notice-limit')).toBeTruthy();
  });

  // Check: grading hides the mic, Cancel aborts the old request, and typing still records once.
  it.each(['fill-blank', 'full-recall'] as const)('%s supports Cancel and typing through auth recovery', async (stage) => {
    const pending = deferred<VoiceOutcome>();
    let signal: AbortSignal | undefined;
    const s = await setup({ stage, check: (_blob, _lang, _deps, requestSignal) => {
      signal = requestSignal;
      return pending.promise;
    } });
    await recordAndSend();
    await s.recover();
    expect(screen.getByTestId('memory-grading')).toBeTruthy();
    expect(screen.queryByTestId('memory-mic')).toBeNull();
    await fireEvent.press(screen.getByTestId('memory-grading-cancel'));
    expect(signal?.aborted).toBe(true);
    await act(async () => { pending.resolve({ kind: 'signed-out' }); await pending.promise; });
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    await fireEvent.press(screen.getByTestId('memory-type-toggle'));
    await fireEvent.changeText(screen.getByTestId('memory-type-input'), s.text);
    await fireEvent.press(screen.getByTestId('memory-type-check'));
    expect(s.storage.get(memoryProgressKey)[s.verse.id]?.successes).toBe(1);
    expect(screen.getByTestId('memory-result')).toBeTruthy();
  });

  // Check: unmount aborts a pending request and prevents its late 401 from affecting a fresh panel.
  it('ignores a pending request after unmount and remount', async () => {
    const pending = deferred<VoiceOutcome>();
    let signal: AbortSignal | undefined;
    const s = await setup({ check: (_blob, _lang, _deps, requestSignal) => {
      signal = requestSignal;
      return pending.promise;
    } });
    await recordAndSend();
    await s.remount();
    expect(signal?.aborted).toBe(true);
    await act(async () => { pending.resolve({ kind: 'signed-out' }); await pending.promise; });
    expect(screen.getByTestId('memory-mic')).toBeTruthy();
    expect(s.storage.get(memoryProgressKey)).toEqual({});
    await s.ui.unmount();
  });
});
