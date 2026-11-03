// S1-fix2 (implementer-hard): cancel always wins, in the web recorder and in the transcription client.
// Interleavings beyond the reviewer's: cancel from inside the callbacks, stop-then-cancel at every microtask,
// aborts from inside getIdToken / fetch / json, and an abort and the deadline in the same tick.
import { createWebRecorder, type WebRecorderEnv } from '../voice/recorder';
import { checkVoice } from '../voice/voiceClient';
import type { Recording, VoiceClientDeps, VoiceOutcome } from '../voice/types';

const tick = () => Promise.resolve();
const flush = async () => { for (let i = 0; i < 24; i++) await tick(); };
const yields = async (k: number) => { for (let i = 0; i < k; i++) await tick(); };

function deferred<T>() {
  let resolve!: (value: T) => void;
  let reject!: (error: Error) => void;
  const promise = new Promise<T>((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
}

function fakeBrowser() {
  const tracks: { stop: jest.Mock }[] = [];
  const recorders: DelayedRecorder[] = [];
  class DelayedRecorder {
    static isTypeSupported(type: string) { return type === 'audio/webm;codecs=opus'; }
    state: 'inactive' | 'recording' = 'inactive';
    mimeType = 'audio/webm;codecs=opus';
    private data?: (event: { data: Blob }) => void;
    private stopped?: () => void;
    constructor() { recorders.push(this); }
    addEventListener(type: string, listener: (event: never) => void) {
      if (type === 'dataavailable') this.data = listener as (event: { data: Blob }) => void;
      if (type === 'stop') this.stopped = listener as () => void;
    }
    start() { this.state = 'recording'; }
    stop() { this.state = 'inactive'; }
    finish() { this.data?.({ data: new Blob(['voice'], { type: this.mimeType }) }); this.stopped?.(); }
  }
  const newStream = () => {
    const track = { stop: jest.fn() };
    tracks.push(track);
    return { getTracks: () => [track] } as unknown as MediaStream;
  };
  const env: WebRecorderEnv = {
    getUserMedia: async () => newStream(),
    MediaRecorder: DelayedRecorder as unknown as typeof MediaRecorder,
  };
  return { env, tracks, recorders, newStream };
}
const eachReleasedOnce = (tracks: { stop: jest.Mock }[]) => tracks.every((t) => t.stop.mock.calls.length === 1);

afterEach(() => { jest.restoreAllMocks(); jest.useRealTimers(); });

describe('recorder: after cancel() returns, no callback of that session runs and nothing is returned', () => {
  it('cancel from inside onTick: no more ticks, no auto-stop, tracks released once, no timers', async () => {
    jest.useFakeTimers();
    const browser = fakeBrowser();
    const recorder = createWebRecorder(browser.env);
    const onAutoStop = jest.fn();
    const onTick = jest.fn(() => recorder.cancel());
    await recorder.start({ maxMs: 1000, onAutoStop, onTick });
    jest.advanceTimersByTime(2000);
    browser.recorders[0]!.finish();
    await flush();
    expect(onTick).toHaveBeenCalledTimes(1);
    expect(onAutoStop).not.toHaveBeenCalled();
    expect(await recorder.stop()).toBeNull();
    expect(eachReleasedOnce(browser.tracks)).toBe(true);
    expect(jest.getTimerCount()).toBe(0);
  });

  it('cancel from inside onAutoStop is a harmless no-op: delivered once, tracks released once', async () => {
    jest.useFakeTimers();
    const browser = fakeBrowser();
    const recorder = createWebRecorder(browser.env);
    const onAutoStop = jest.fn(() => recorder.cancel());
    await recorder.start({ maxMs: 1000, onAutoStop });
    jest.advanceTimersByTime(1000);
    browser.recorders[0]!.finish();
    await flush();
    recorder.cancel();
    expect(onAutoStop).toHaveBeenCalledTimes(1);
    expect(eachReleasedOnce(browser.tracks)).toBe(true);
    expect(jest.getTimerCount()).toBe(0);
  });

  it('a start from inside onAutoStop records a new take that a later cancel discards', async () => {
    jest.useFakeTimers();
    const browser = fakeBrowser();
    const recorder = createWebRecorder(browser.env);
    const second = jest.fn();
    let restarted: Promise<string> | undefined;
    const first = jest.fn(() => { restarted = recorder.start({ maxMs: 1000, onAutoStop: second }); });
    await recorder.start({ maxMs: 1000, onAutoStop: first });
    jest.advanceTimersByTime(1000);
    browser.recorders[0]!.finish();
    await flush();
    expect(await restarted).toBe('recording');
    recorder.cancel();
    jest.advanceTimersByTime(1000);
    browser.recorders[1]!.finish();
    await flush();
    expect(first).toHaveBeenCalledTimes(1);
    expect(second).not.toHaveBeenCalled();
    expect(eachReleasedOnce(browser.tracks)).toBe(true);
    expect(jest.getTimerCount()).toBe(0);
  });

  it.each([0, 1, 2, 3, 4, 5, 6, 7, 8])('auto-stop: a cancel %i microtasks after the final data never follows a delivery', async (k) => {
    jest.useFakeTimers();
    const browser = fakeBrowser();
    const recorder = createWebRecorder(browser.env);
    let cancelCalled = false;
    const delivered: boolean[] = [];
    await recorder.start({ maxMs: 1000, onAutoStop: () => delivered.push(cancelCalled) });
    jest.advanceTimersByTime(1000);
    browser.recorders[0]!.finish();
    await yields(k);
    cancelCalled = true;
    recorder.cancel();
    await flush();
    // Delivered at most once, and only before the cancel.
    expect(delivered.length).toBeLessThanOrEqual(1);
    expect(delivered.every((afterCancel) => !afterCancel)).toBe(true);
    expect(eachReleasedOnce(browser.tracks)).toBe(true);
    expect(jest.getTimerCount()).toBe(0);
  });

  it.each([0, 1, 2, 3, 4, 5, 6, 7, 8])('stop(): a cancel %i microtasks after the final data never lets the take through unless stop() had already resolved', async (k) => {
    const browser = fakeBrowser();
    const recorder = createWebRecorder(browser.env);
    await recorder.start({ maxMs: 60_000, onAutoStop: jest.fn() });
    const stopped = recorder.stop();
    browser.recorders[0]!.finish();
    await yields(k);
    // Exact, not lagged: a delivering stop() releases the tracks in the same synchronous step as its return,
    // and only a cancel releases them otherwise. So released-before-cancel means already returned.
    const seen = browser.tracks[0]!.stop.mock.calls.length > 0;
    recorder.cancel();
    const result: Recording | null = await stopped;
    if (!seen) expect(result).toBeNull();
    expect(eachReleasedOnce(browser.tracks)).toBe(true);
  });

  it('stop() then cancel() before the final data: null, and the late data changes nothing', async () => {
    const browser = fakeBrowser();
    const recorder = createWebRecorder(browser.env);
    const onAutoStop = jest.fn();
    await recorder.start({ maxMs: 60_000, onAutoStop });
    const stopped = recorder.stop();
    recorder.cancel();
    expect(browser.tracks[0]!.stop).toHaveBeenCalledTimes(1);
    browser.recorders[0]!.finish();
    expect(await stopped).toBeNull();
    expect(await recorder.stop()).toBeNull();
    expect(onAutoStop).not.toHaveBeenCalled();
    expect(eachReleasedOnce(browser.tracks)).toBe(true);
  });

  it('stop() then a new start() before the final data: the old stop resolves null', async () => {
    const browser = fakeBrowser();
    const recorder = createWebRecorder(browser.env);
    await recorder.start({ maxMs: 60_000, onAutoStop: jest.fn() });
    const stopped = recorder.stop();
    const restarted = recorder.start({ maxMs: 60_000, onAutoStop: jest.fn() });
    browser.recorders[0]!.finish();
    expect(await stopped).toBeNull();
    expect(await restarted).toBe('recording');
    recorder.cancel();
    expect(eachReleasedOnce(browser.tracks)).toBe(true);
  });

  it('a cancel during the prompt, then the prompt is refused: denied, nothing constructed, a fresh start works', async () => {
    const browser = fakeBrowser();
    const prompt = deferred<MediaStream>();
    browser.env.getUserMedia = jest.fn().mockReturnValueOnce(prompt.promise).mockImplementation(async () => browser.newStream());
    const recorder = createWebRecorder(browser.env);
    const started = recorder.start({ maxMs: 60_000, onAutoStop: jest.fn() });
    recorder.cancel();
    prompt.reject(new Error('NotAllowedError'));
    expect(await started).toBe('denied');
    expect(browser.recorders).toHaveLength(0);
    expect(await recorder.start({ maxMs: 60_000, onAutoStop: jest.fn() })).toBe('recording');
    const stopped = recorder.stop();
    browser.recorders[0]!.finish();
    expect((await stopped)?.blob.size).toBeGreaterThan(0);
    expect(eachReleasedOnce(browser.tracks)).toBe(true);
  });

  it('a recorder that cannot be constructed releases the stream once and leaves nothing current', async () => {
    const browser = fakeBrowser();
    class Broken { static isTypeSupported() { return false; } constructor() { throw new Error('no codec'); } }
    browser.env.MediaRecorder = Broken as unknown as typeof MediaRecorder;
    const recorder = createWebRecorder(browser.env);
    expect(await recorder.start({ maxMs: 60_000, onAutoStop: jest.fn() })).toBe('unsupported');
    recorder.cancel();
    expect(await recorder.stop()).toBeNull();
    expect(eachReleasedOnce(browser.tracks)).toBe(true);
  });
});

// ---------------------------------------------------------------------------------------------------------

const audio = new Blob(['voice'], { type: 'audio/webm' });
const ok = (json: () => Promise<unknown>, status = 200) =>
  ({ status, headers: { get: () => null }, json }) as unknown as Response;
const deps = (extra: Partial<VoiceClientDeps>): VoiceClientDeps => ({
  baseUrl: 'https://api.example',
  getIdToken: async () => 'token',
  isOnline: () => true,
  fetch: jest.fn(async () => ok(async () => ({ text: '神' }))),
  ...extra,
});

describe('voice client: after the caller aborts, the result is cancelled', () => {
  it('abort from inside getIdToken (which still returns a token): cancelled, nothing uploaded', async () => {
    const caller = new AbortController();
    const fetcher = jest.fn(async () => ok(async () => ({ text: '神' })));
    const result = await checkVoice(audio, 'mandarin', deps({
      fetch: fetcher, getIdToken: async () => { caller.abort(); return 'token'; },
    }), caller.signal);
    expect(result).toEqual({ kind: 'cancelled' });
    expect(fetcher).not.toHaveBeenCalled();
  });

  it('abort from inside getIdToken that resolves null: cancelled, not signed-out', async () => {
    const caller = new AbortController();
    const result = await checkVoice(audio, 'mandarin', deps({
      getIdToken: async () => { caller.abort(); return null; },
    }), caller.signal);
    expect(result).toEqual({ kind: 'cancelled' });
  });

  it('abort from inside fetch (which still answers 200): cancelled, the body is never read', async () => {
    const caller = new AbortController();
    const json = jest.fn(async () => ({ text: '神' }));
    const result = await checkVoice(audio, 'mandarin', deps({
      fetch: jest.fn(async () => { caller.abort(); return ok(json); }),
    }), caller.signal);
    expect(result).toEqual({ kind: 'cancelled' });
    expect(json).not.toHaveBeenCalled();
  });

  it('abort from inside fetch that answers 429: cancelled, not limit', async () => {
    const caller = new AbortController();
    const result = await checkVoice(audio, 'mandarin', deps({
      fetch: jest.fn(async () => { caller.abort(); return ok(async () => null, 429); }),
    }), caller.signal);
    expect(result).toEqual({ kind: 'cancelled' });
  });

  it('abort from inside json (which still returns text): cancelled', async () => {
    const caller = new AbortController();
    const result = await checkVoice(audio, 'mandarin', deps({
      fetch: jest.fn(async () => ok(async () => { caller.abort(); return { text: '神' }; })),
    }), caller.signal);
    expect(result).toEqual({ kind: 'cancelled' });
  });

  it('abort from inside a json that throws synchronously: cancelled, not error, and no throw', async () => {
    const caller = new AbortController();
    const result = await checkVoice(audio, 'mandarin', deps({
      fetch: jest.fn(async () => ok(() => { caller.abort(); throw new Error('bad body'); })),
    }), caller.signal);
    expect(result).toEqual({ kind: 'cancelled' });
  });

  it('abort from inside isOnline: cancelled, nothing uploaded', async () => {
    const caller = new AbortController();
    const fetcher = jest.fn(async () => ok(async () => ({ text: '神' })));
    const result = await checkVoice(audio, 'mandarin', deps({
      fetch: fetcher, isOnline: () => { caller.abort(); return true; },
    }), caller.signal);
    expect(result).toEqual({ kind: 'cancelled' });
    expect(fetcher).not.toHaveBeenCalled();
  });

  it('a caller already aborted while offline gets cancelled (the abort wins over everything)', async () => {
    const caller = new AbortController();
    caller.abort();
    expect(await checkVoice(audio, 'mandarin', deps({ isOnline: () => false }), caller.signal)).toEqual({ kind: 'cancelled' });
  });

  it.each([0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 12])('a caller abort %i microtasks after the body arrives never returns text unless already resolved', async (k) => {
    const body = deferred<{ text: string }>();
    const caller = new AbortController();
    const json = jest.fn(() => body.promise);
    const remove = jest.spyOn(caller.signal, 'removeEventListener');
    const pending = checkVoice(audio, 'mandarin', deps({ fetch: jest.fn(async () => ok(json)) }), caller.signal);
    await flush();
    expect(json).toHaveBeenCalledTimes(1);
    body.resolve({ text: '神' });
    await yields(k);
    // Exact, not lagged: the client's finally removes the listener in the same synchronous step as its return.
    const seen = remove.mock.calls.length > 0;
    caller.abort();
    const result: VoiceOutcome = await pending;
    if (!seen) expect(result).toEqual({ kind: 'cancelled' });
  });

  it.each([0, 1, 2, 3, 4, 5, 6])('a caller abort %i microtasks after a 503 arrives never returns no-service unless already resolved', async (k) => {
    const res = deferred<Response>();
    const caller = new AbortController();
    const remove = jest.spyOn(caller.signal, 'removeEventListener');
    const pending = checkVoice(audio, 'mandarin', deps({ fetch: jest.fn(() => res.promise) }), caller.signal);
    await flush();
    res.resolve(ok(async () => null, 503));
    await yields(k);
    // Exact, not lagged: the client's finally removes the listener in the same synchronous step as its return.
    const seen = remove.mock.calls.length > 0;
    caller.abort();
    const result = await pending;
    if (!seen) expect(result).toEqual({ kind: 'cancelled' });
  });

  it('the deadline and a caller abort in the same tick, deadline first: timeout', async () => {
    jest.useFakeTimers();
    const caller = new AbortController();
    const pending = checkVoice(audio, 'mandarin', deps({ fetch: jest.fn(() => new Promise<Response>(() => undefined)), timeoutMs: 10 }), caller.signal);
    // Registered after checkVoice's own deadline timer, so it fires right after it in the same advance.
    setTimeout(() => caller.abort(), 10);
    await jest.advanceTimersByTimeAsync(10);
    expect(await pending).toEqual({ kind: 'timeout' });
    expect(jest.getTimerCount()).toBe(0);
  });

  it('the deadline and a caller abort in the same tick, abort first: cancelled', async () => {
    jest.useFakeTimers();
    const caller = new AbortController();
    setTimeout(() => caller.abort(), 10);
    const pending = checkVoice(audio, 'mandarin', deps({ fetch: jest.fn(() => new Promise<Response>(() => undefined)), timeoutMs: 10 }), caller.signal);
    await jest.advanceTimersByTimeAsync(10);
    expect(await pending).toEqual({ kind: 'cancelled' });
    expect(jest.getTimerCount()).toBe(0);
  });

  it('the deadline passing while the body is pending, then a caller abort: still timeout (the verdict is immutable)', async () => {
    jest.useFakeTimers();
    const body = deferred<{ text: string }>();
    const caller = new AbortController();
    const pending = checkVoice(audio, 'mandarin', deps({ fetch: jest.fn(async () => ok(() => body.promise)), timeoutMs: 10 }), caller.signal);
    await jest.advanceTimersByTimeAsync(10);
    caller.abort();
    body.resolve({ text: '神' });
    expect(await pending).toEqual({ kind: 'timeout' });
  });
});
