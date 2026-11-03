import { createWebRecorder, type WebRecorderEnv } from '../voice/recorder';

const flush = async () => { for (let i = 0; i < 8; i++) await Promise.resolve(); };
function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((yes) => { resolve = yes; });
  return { promise, resolve };
}
function fakeBrowser() {
  const tracks: { stop: jest.Mock }[] = [];
  const recorders: DelayedRecorder[] = [];
  const streams: MediaStream[] = [];
  class DelayedRecorder {
    static isTypeSupported(type: string) { return type === 'audio/webm;codecs=opus'; }
    state: 'inactive' | 'recording' = 'inactive';
    mimeType = 'audio/webm;codecs=opus';
    private data?: (event: { data: Blob }) => void;
    private stopped?: () => void;
    constructor(public stream: MediaStream) { recorders.push(this); }
    addEventListener(type: string, listener: (event: never) => void) {
      if (type === 'dataavailable') this.data = listener as (event: { data: Blob }) => void;
      if (type === 'stop') this.stopped = listener as () => void;
    }
    start() { this.state = 'recording'; }
    // Browsers become inactive synchronously and queue dataavailable/stop on a later task.
    stop() { this.state = 'inactive'; }
    finish() { this.data?.({ data: new Blob(['recording'], { type: this.mimeType }) }); this.stopped?.(); }
  }
  const newStream = () => {
    const track = { stop: jest.fn() };
    tracks.push(track);
    const stream = { getTracks: () => [track] } as unknown as MediaStream;
    streams.push(stream);
    return stream;
  };
  const env: WebRecorderEnv = {
    getUserMedia: async () => newStream(), MediaRecorder: DelayedRecorder as unknown as typeof MediaRecorder,
  };
  return { env, tracks, streams, recorders, newStream };
}

afterEach(() => jest.useRealTimers());

it('suppresses auto-stop delivery when cancelled before the browser stop event', async () => {
  // P1: the cap detaches active before final data arrives, so cancel cannot suppress the upload callback.
  jest.useFakeTimers();
  const browser = fakeBrowser();
  const recorder = createWebRecorder(browser.env);
  const onAutoStop = jest.fn();
  await recorder.start({ maxMs: 1000, onAutoStop });
  jest.advanceTimersByTime(1000);
  recorder.cancel();
  browser.recorders[0]!.finish();
  await flush();
  expect(onAutoStop).not.toHaveBeenCalled();
});

it('releases the microphone when cancelled while auto-stop is waiting for final data', async () => {
  // P1: cancel cannot find the detached stream and leaves its microphone open until the stop event.
  jest.useFakeTimers();
  const browser = fakeBrowser();
  const recorder = createWebRecorder(browser.env);
  await recorder.start({ maxMs: 1000, onAutoStop: jest.fn() });
  jest.advanceTimersByTime(1000);
  recorder.cancel();
  const releasedAtCancel = browser.tracks[0]!.stop.mock.calls.length > 0;
  browser.recorders[0]!.finish();
  await flush();
  expect(releasedAtCancel).toBe(true);
});

it('drops a manually stopped recording if cancel arrives before the final browser data', async () => {
  // P1: a stop promise returns discarded audio even when the user cancels before it settles.
  const browser = fakeBrowser();
  const recorder = createWebRecorder(browser.env);
  await recorder.start({ maxMs: 1000, onAutoStop: jest.fn() });
  const stopped = recorder.stop();
  recorder.cancel();
  browser.recorders[0]!.finish();
  expect(await stopped).toBeNull();
});

it('does not deliver an old auto-stopped recording after a new start', async () => {
  // P1: restarting during the browser stop task still allows the previous take to auto-submit.
  jest.useFakeTimers();
  const browser = fakeBrowser();
  const recorder = createWebRecorder(browser.env);
  const oldAutoStop = jest.fn();
  await recorder.start({ maxMs: 1000, onAutoStop: oldAutoStop });
  jest.advanceTimersByTime(1000);
  await recorder.start({ maxMs: 1000, onAutoStop: jest.fn() });
  browser.recorders[0]!.finish();
  await flush();
  recorder.cancel();
  browser.recorders[1]!.finish();
  await flush();
  expect(oldAutoStop).not.toHaveBeenCalled();
});

it('cancels an unresolved permission request without constructing a recorder or leaking the stream', async () => {
  const browser = fakeBrowser();
  const permission = deferred<MediaStream>();
  browser.env.getUserMedia = () => permission.promise;
  const recorder = createWebRecorder(browser.env);
  const onAutoStop = jest.fn();
  const started = recorder.start({ maxMs: 1000, onAutoStop });
  recorder.cancel();
  permission.resolve(browser.newStream());
  expect(await started).toBe('denied');
  expect(browser.tracks[0]!.stop).toHaveBeenCalled();
  expect(browser.recorders).toHaveLength(0);
  expect(onAutoStop).not.toHaveBeenCalled();
});

it('overlapping permission prompts start only the newest recorder and release both streams', async () => {
  const browser = fakeBrowser();
  const first = deferred<MediaStream>();
  const second = deferred<MediaStream>();
  browser.env.getUserMedia = jest.fn().mockReturnValueOnce(first.promise).mockReturnValueOnce(second.promise);
  const recorder = createWebRecorder(browser.env);
  const oldStart = recorder.start({ maxMs: 1000, onAutoStop: jest.fn() });
  const newStart = recorder.start({ maxMs: 1000, onAutoStop: jest.fn() });
  second.resolve(browser.newStream());
  expect(await newStart).toBe('recording');
  first.resolve(browser.newStream());
  expect(await oldStart).toBe('denied');
  expect(browser.recorders).toHaveLength(1);
  expect(browser.tracks[1]!.stop).toHaveBeenCalled();
  recorder.cancel();
  expect(browser.tracks[0]!.stop).toHaveBeenCalled();
  browser.recorders[0]!.finish();
  await flush();
});

it('manual stop suppresses the cap, releases tracks and resolves only once', async () => {
  jest.useFakeTimers();
  const browser = fakeBrowser();
  const recorder = createWebRecorder(browser.env);
  const onAutoStop = jest.fn();
  const onTick = jest.fn();
  await recorder.start({ maxMs: 1000, onAutoStop, onTick });
  jest.advanceTimersByTime(500);
  const stopped = recorder.stop();
  expect(await recorder.stop()).toBeNull();
  browser.recorders[0]!.finish();
  expect((await stopped)?.durationMs).toBe(500);
  jest.advanceTimersByTime(2000);
  expect(onAutoStop).not.toHaveBeenCalled();
  expect(onTick).toHaveBeenCalledTimes(2);
  expect(browser.tracks[0]!.stop).toHaveBeenCalled();
  expect(jest.getTimerCount()).toBe(0);
});