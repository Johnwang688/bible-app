// Acceptance (orchestrator-owned, MEM screens): the voice layer. The web recorder (MediaRecorder, Opus mono
// 32 kbps, 30 s auto-stop), the transcription client's typed outcomes, the availability gate's order and the
// session memory of 503s and 429s. Implementers may not edit this file.
import { voiceGate, getVoiceSession, recordVoiceOutcome, resetVoiceSessionForTesting } from '../voice/availability';
import { createRecorder, createWebRecorder, type WebRecorderEnv } from '../voice/recorder';
import { MAX_RECORDING_MS, RECORDING_BITS_PER_SECOND, TRANSCRIBE_TIMEOUT_MS, type VoiceGateInput } from '../voice/types';
import { checkVoice } from '../voice/voiceClient';

// ---------------------------------------------------------------------------------------------------------
// A fake MediaRecorder and microphone.
// ---------------------------------------------------------------------------------------------------------
class FakeTrack {
  stopped = false;
  stop() {
    this.stopped = true;
  }
}

function fakeEnv(opts: { deny?: boolean; types?: string[] } = {}) {
  const track = new FakeTrack();
  const stream = { getTracks: () => [track], getAudioTracks: () => [track] } as unknown as MediaStream;
  const constraints: MediaStreamConstraints[] = [];
  const recorders: FakeRecorder[] = [];
  const supported = opts.types ?? ['audio/webm;codecs=opus', 'audio/webm'];

  class FakeRecorder {
    static isTypeSupported(type: string) {
      return supported.includes(type);
    }
    state: 'inactive' | 'recording' = 'inactive';
    ondataavailable: ((e: { data: Blob }) => void) | null = null;
    onstop: (() => void) | null = null;
    mimeType: string;
    constructor(
      public stream: MediaStream,
      public options: MediaRecorderOptions = {},
    ) {
      this.mimeType = options.mimeType ?? 'audio/webm';
      recorders.push(this);
    }
    start() {
      this.state = 'recording';
    }
    stop() {
      if (this.state === 'inactive') return;
      this.state = 'inactive';
      this.ondataavailable?.({ data: new Blob(['opus-bytes'], { type: this.mimeType }) });
      this.onstop?.();
    }
    addEventListener(type: string, fn: (e: never) => void) {
      if (type === 'dataavailable') this.ondataavailable = fn as never;
      if (type === 'stop') this.onstop = fn as never;
    }
  }

  const env: WebRecorderEnv = {
    getUserMedia: async (c: MediaStreamConstraints) => {
      constraints.push(c);
      if (opts.deny) throw Object.assign(new Error('denied'), { name: 'NotAllowedError' });
      return stream;
    },
    MediaRecorder: FakeRecorder as unknown as typeof MediaRecorder,
    queryPermission: async () => (opts.deny ? 'denied' : 'prompt'),
  };
  return { env, track, constraints, recorders };
}

const flush = () => new Promise((r) => jest.requireActual<typeof import('timers')>('timers').setImmediate(r));

describe('web recorder', () => {
  afterEach(() => jest.useRealTimers());

  it('records Opus, mono, at 32 kbps', async () => {
    const { env, constraints, recorders } = fakeEnv();
    const rec = createWebRecorder(env);
    expect(rec.supported).toBe(true);
    expect(await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() })).toBe('recording');
    const audio = constraints[0]?.audio as MediaTrackConstraints;
    expect(audio.channelCount).toBe(1);
    expect(recorders[0]?.options.mimeType).toBe('audio/webm;codecs=opus');
    expect(recorders[0]?.options.audioBitsPerSecond).toBe(RECORDING_BITS_PER_SECOND);
    const out = await rec.stop();
    expect(out?.blob.size).toBeGreaterThan(0);
    expect(out?.blob.type.startsWith('audio/')).toBe(true);
  });

  it('falls back to Ogg Opus when WebM Opus is not supported', async () => {
    const { env, recorders } = fakeEnv({ types: ['audio/ogg;codecs=opus'] });
    await createWebRecorder(env).start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() });
    expect(recorders[0]?.options.mimeType).toBe('audio/ogg;codecs=opus');
  });

  it('resolves denied (never throws) when the microphone is refused', async () => {
    const { env, recorders } = fakeEnv({ deny: true });
    const rec = createWebRecorder(env);
    expect(await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() })).toBe('denied');
    expect(recorders).toHaveLength(0);
    expect(await rec.permission()).toBe('denied');
  });

  it('stops and hands the recording over by itself at the cap, and releases the microphone', async () => {
    jest.useFakeTimers();
    const { env, track } = fakeEnv();
    const rec = createWebRecorder(env);
    const onAutoStop = jest.fn();
    const ticks: number[] = [];
    await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop, onTick: (ms) => ticks.push(ms) });
    jest.advanceTimersByTime(MAX_RECORDING_MS - 1);
    expect(onAutoStop).not.toHaveBeenCalled();
    jest.advanceTimersByTime(1);
    await jest.runOnlyPendingTimersAsync();
    expect(onAutoStop).toHaveBeenCalledTimes(1);
    expect(onAutoStop.mock.calls[0][0].blob.size).toBeGreaterThan(0);
    expect(track.stopped).toBe(true);
    expect(ticks.length).toBeGreaterThan(10);
  });

  it('cancel discards: no auto-stop later, nothing returned, the microphone released', async () => {
    jest.useFakeTimers();
    const { env, track } = fakeEnv();
    const rec = createWebRecorder(env);
    const onAutoStop = jest.fn();
    await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop });
    rec.cancel();
    jest.advanceTimersByTime(MAX_RECORDING_MS * 2);
    expect(onAutoStop).not.toHaveBeenCalled();
    expect(track.stopped).toBe(true);
    expect(await rec.stop()).toBeNull();
  });

  it('on native without the expo-audio module (the plain test platform) the recorder is the unsupported stub', async () => {
    const rec = createRecorder();
    expect(rec.supported).toBe(false);
    expect(await rec.permission()).toBe('unsupported');
    expect(await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() })).toBe('unsupported');
    expect(await rec.stop()).toBeNull();
  });
});

// ---------------------------------------------------------------------------------------------------------
// The transcription client.
// ---------------------------------------------------------------------------------------------------------
type FakeRes = { status: number; body?: unknown; headers?: Record<string, string> };
function fakeFetch(res: FakeRes | (() => Promise<never>)) {
  const calls: { url: string; init: RequestInit }[] = [];
  const fn = jest.fn(async (url: string, init: RequestInit) => {
    calls.push({ url, init });
    if (typeof res === 'function') return res();
    return {
      ok: res.status >= 200 && res.status < 300,
      status: res.status,
      headers: { get: (k: string) => res.headers?.[k] ?? res.headers?.[k.toLowerCase()] ?? null },
      json: async () => res.body,
      text: async () => JSON.stringify(res.body ?? ''),
    } as unknown as Response;
  });
  return { fn: fn as unknown as typeof fetch, calls };
}
const audio = () => new Blob(['x'], { type: 'audio/webm;codecs=opus' });
const deps = (f: typeof fetch, extra: object = {}) => ({
  baseUrl: 'https://api.example',
  getIdToken: async () => 'tok',
  fetch: f,
  isOnline: () => true,
  ...extra,
});

describe('checkVoice', () => {
  afterEach(() => jest.useRealTimers());

  it('posts the audio with the token and the language, and returns the trimmed text', async () => {
    const { fn, calls } = fakeFetch({ status: 200, body: { text: '  如此你的道路  ' } });
    expect(await checkVoice(audio(), 'cantonese', deps(fn))).toEqual({ kind: 'text', text: '如此你的道路' });
    expect(calls[0]?.url).toBe('https://api.example/memory/transcribe?lang=cantonese');
    expect(calls[0]?.init.method).toBe('POST');
    const headers = calls[0]?.init.headers as Record<string, string>;
    expect(headers.Authorization).toBe('Bearer tok');
    expect(headers['Content-Type']).toBe('audio/webm;codecs=opus');
  });

  it('signed out: nothing is uploaded', async () => {
    const { fn } = fakeFetch({ status: 200, body: { text: 'x' } });
    expect(await checkVoice(audio(), 'mandarin', deps(fn, { getIdToken: async () => null }))).toEqual({ kind: 'signed-out' });
    expect(fn).not.toHaveBeenCalled();
  });

  it('offline: nothing is uploaded', async () => {
    const { fn } = fakeFetch({ status: 200, body: { text: 'x' } });
    expect(await checkVoice(audio(), 'mandarin', deps(fn, { isOnline: () => false }))).toEqual({ kind: 'offline' });
    expect(fn).not.toHaveBeenCalled();
  });

  it.each([
    [{ status: 401 }, { kind: 'signed-out' }],
    [{ status: 413 }, { kind: 'too-long' }],
    [{ status: 429, headers: { 'Retry-After': '40' } }, { kind: 'limit', retryAfterS: 40, window: 'minute' }],
    [{ status: 429, headers: { 'Retry-After': '10800' } }, { kind: 'limit', retryAfterS: 10800, window: 'day' }],
    [{ status: 429 }, { kind: 'limit', retryAfterS: 60, window: 'minute' }],
    [{ status: 503 }, { kind: 'no-service' }],
    [{ status: 502 }, { kind: 'error' }],
    [{ status: 500 }, { kind: 'error' }],
  ])('maps %j', async (res, outcome) => {
    const { fn } = fakeFetch(res as FakeRes);
    expect(await checkVoice(audio(), 'mandarin', deps(fn))).toEqual(outcome);
  });

  it('a network failure while online is an error, not a verdict', async () => {
    const { fn } = fakeFetch(() => Promise.reject(new TypeError('Failed to fetch')));
    expect(await checkVoice(audio(), 'mandarin', deps(fn))).toEqual({ kind: 'error' });
  });

  it('gives up after 30 s (timed out) and aborts the request', async () => {
    jest.useFakeTimers();
    let seen: AbortSignal | undefined;
    const fn = jest.fn(
      (_url: string, init: RequestInit) =>
        new Promise<Response>((_, reject) => {
          seen = init.signal ?? undefined;
          init.signal?.addEventListener('abort', () => reject(Object.assign(new Error('aborted'), { name: 'AbortError' })));
        }),
    ) as unknown as typeof fetch;
    const pending = checkVoice(audio(), 'mandarin', deps(fn));
    await jest.advanceTimersByTimeAsync(TRANSCRIBE_TIMEOUT_MS);
    expect(await pending).toEqual({ kind: 'timeout' });
    expect(seen?.aborted).toBe(true);
  });

  it('the caller cancelling is "cancelled", not an error', async () => {
    const controller = new AbortController();
    const fn = jest.fn(
      (_url: string, init: RequestInit) =>
        new Promise<Response>((_, reject) => {
          init.signal?.addEventListener('abort', () => reject(Object.assign(new Error('aborted'), { name: 'AbortError' })));
        }),
    ) as unknown as typeof fetch;
    const pending = checkVoice(audio(), 'mandarin', deps(fn), controller.signal);
    await flush();
    controller.abort();
    expect(await pending).toEqual({ kind: 'cancelled' });
  });
});

// ---------------------------------------------------------------------------------------------------------
// The availability gate and the session memory.
// ---------------------------------------------------------------------------------------------------------
const READY: VoiceGateInput = {
  voiceOn: true,
  supported: true,
  signedIn: true,
  online: true,
  serviceDown: false,
  limitedUntil: null,
  now: 1_000_000,
  permission: 'prompt',
};

describe('voiceGate', () => {
  it('is ready only when every check passes (a prompt or granted permission both show the mic)', () => {
    expect(voiceGate(READY)).toEqual({ kind: 'ready' });
    expect(voiceGate({ ...READY, permission: 'granted' })).toEqual({ kind: 'ready' });
  });

  it('checks in order: voice off, unsupported, signed out, offline, no service, limit, denied', () => {
    const allBad: VoiceGateInput = {
      voiceOn: false,
      supported: false,
      signedIn: false,
      online: false,
      serviceDown: true,
      limitedUntil: READY.now + 5_000,
      now: READY.now,
      permission: 'denied',
    };
    const order = ['voice-off', 'unsupported', 'signed-out', 'offline', 'no-service', 'limit', 'denied'];
    const fixes: Partial<VoiceGateInput>[] = [
      { voiceOn: true },
      { supported: true },
      { signedIn: true },
      { online: true },
      { serviceDown: false },
      { limitedUntil: null },
      { permission: 'prompt' },
    ];
    let input = allBad;
    for (let i = 0; i < order.length; i++) {
      const gate = voiceGate(input);
      expect([i, gate.kind === 'notice' ? gate.notice : 'ready']).toEqual([i, order[i]]);
      input = { ...input, ...fixes[i] };
    }
    expect(voiceGate(input)).toEqual({ kind: 'ready' });
  });

  it('a limit gives the seconds left, rounded up, and lifts once it has passed', () => {
    expect(voiceGate({ ...READY, limitedUntil: READY.now + 39_200 })).toEqual({ kind: 'notice', notice: 'limit', retryAfterS: 40 });
    expect(voiceGate({ ...READY, limitedUntil: READY.now })).toEqual({ kind: 'ready' });
  });
});

describe('voice session memory', () => {
  beforeEach(() => resetVoiceSessionForTesting());

  it('remembers a 503 for the session and a 429 until its Retry-After passes', () => {
    expect(getVoiceSession()).toEqual({ serviceDown: false, limitedUntil: null });
    recordVoiceOutcome({ kind: 'no-service' }, 5_000);
    expect(getVoiceSession().serviceDown).toBe(true);
    recordVoiceOutcome({ kind: 'limit', retryAfterS: 40, window: 'minute' }, 5_000);
    expect(getVoiceSession().limitedUntil).toBe(45_000);
    recordVoiceOutcome({ kind: 'text', text: '如此' }, 6_000);
    expect(getVoiceSession()).toEqual({ serviceDown: true, limitedUntil: 45_000 });
  });
});
