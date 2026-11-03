import { createWebRecorder, type WebRecorderEnv } from '../voice/recorder';

const flush = async () => { for (let i = 0; i < 12; i++) await Promise.resolve(); };

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
  const env: WebRecorderEnv = {
    getUserMedia: async () => {
      const track = { stop: jest.fn() };
      tracks.push(track);
      return { getTracks: () => [track] } as unknown as MediaStream;
    },
    MediaRecorder: DelayedRecorder as unknown as typeof MediaRecorder,
  };
  return { env, tracks, recorders };
}

afterEach(() => jest.useRealTimers());

it.each(['cancel', 'restart'] as const)('suppresses queued auto-stop delivery after %s following final data', async (action) => {
  // P2: finish clears current before onAutoStop runs, leaving Cancel or a new start unable to discard the old take.
  jest.useFakeTimers();
  const browser = fakeBrowser();
  const recorder = createWebRecorder(browser.env);
  const onAutoStop = jest.fn();
  await recorder.start({ maxMs: 1000, onAutoStop });
  jest.advanceTimersByTime(1000);
  browser.recorders[0]!.finish();
  await Promise.resolve();
  await Promise.resolve();
  expect(onAutoStop).not.toHaveBeenCalled();
  if (action === 'cancel') recorder.cancel();
  else await recorder.start({ maxMs: 1000, onAutoStop: jest.fn() });
  await flush();
  recorder.cancel();
  expect(browser.tracks.every((track) => track.stop.mock.calls.length === 1)).toBe(true);
  expect(jest.getTimerCount()).toBe(0);
  expect(onAutoStop).not.toHaveBeenCalled();
});
