// Orchestrator-owned acceptance tests for the native (expo-audio) recorder adapter. Native recording cannot be run
// without an EAS build, so the adapter is tested against a fake of the expo-audio module surface it uses.
import {
  createNativeRecorder,
  nativeRecordingOptions,
  NATIVE_RECORDING_CONTENT_TYPE,
  type ExpoAudioApi,
  type NativeAudioRecorder,
  type NativePermission,
} from '../voice/nativeRecorder';
import { MAX_RECORDING_MS, RECORDING_BITS_PER_SECOND } from '../voice/types';

const flush = async () => { for (let i = 0; i < 12; i++) await Promise.resolve(); };

interface Deferred<T> { promise: Promise<T>; resolve(v: T): void; reject(e: unknown): void }
function deferred<T>(): Deferred<T> {
  let resolve!: (v: T) => void;
  let reject!: (e: unknown) => void;
  const promise = new Promise<T>((res, rej) => { resolve = res; reject = rej; });
  return { promise, resolve, reject };
}

const GRANTED: NativePermission = { status: 'granted', granted: true, canAskAgain: true };
const UNDETERMINED: NativePermission = { status: 'undetermined', granted: false, canAskAgain: true };
const BLOCKED: NativePermission = { status: 'denied', granted: false, canAskAgain: false };

class FakeRecorder implements NativeAudioRecorder {
  static instances: FakeRecorder[] = [];
  static prepare: (() => Promise<void>) | null = null;
  uri: string | null = null;
  recording = false;
  record = jest.fn(() => { this.recording = true; });
  stop = jest.fn(async () => { this.recording = false; this.uri = 'file:///cache/rec.m4a'; });
  release = jest.fn();
  prepareToRecordAsync = jest.fn(() => (FakeRecorder.prepare ? FakeRecorder.prepare() : Promise.resolve()));
  constructor(public options: Record<string, unknown>) { FakeRecorder.instances.push(this); }
}

function fakeAudio(over: { permission?: NativePermission; request?: () => Promise<NativePermission> } = {}) {
  const modes: { allowsRecording?: boolean; playsInSilentMode?: boolean }[] = [];
  const audio: ExpoAudioApi = {
    AudioModule: { AudioRecorder: FakeRecorder },
    getRecordingPermissionsAsync: jest.fn(async () => over.permission ?? GRANTED),
    requestRecordingPermissionsAsync: jest.fn(over.request ?? (async () => GRANTED)),
    setAudioModeAsync: jest.fn(async (mode) => { modes.push(mode); }),
  };
  return { audio, modes };
}

const blobOf = (type = 'audio/x-m4a') => new Blob(['aac-audio'], { type });

beforeEach(() => {
  FakeRecorder.instances = [];
  FakeRecorder.prepare = null;
});
afterEach(() => jest.useRealTimers());

describe('recording options', () => {
  it.each(['ios', 'android'] as const)('%s: AAC in .m4a, mono, 32 kbps', (platform) => {
    const o = nativeRecordingOptions(platform);
    expect(o.extension).toBe('.m4a');
    expect(o.numberOfChannels).toBe(1);
    expect(o.bitRate).toBe(RECORDING_BITS_PER_SECOND);
    if (platform === 'ios') expect(o.outputFormat).toBe('aac ');
    else {
      expect(o.outputFormat).toBe('mpeg4');
      expect(o.audioEncoder).toBe('aac');
    }
    // 32 kbps for the 30 s cap is ~120 KB, well under the server's 256 KB.
    expect((RECORDING_BITS_PER_SECOND / 8) * (MAX_RECORDING_MS / 1000)).toBeLessThan(256 * 1024);
  });
  it('the upload is typed audio/mp4 (the server takes audio/*; Whisper reads .mp4)', () => {
    expect(NATIVE_RECORDING_CONTENT_TYPE).toBe('audio/mp4');
  });
});

describe('permission (without prompting)', () => {
  it.each([
    [GRANTED, 'granted'],
    [UNDETERMINED, 'prompt'],
    [{ status: 'denied', granted: false, canAskAgain: true } as NativePermission, 'prompt'],
    [BLOCKED, 'denied'],
  ] as const)('%j -> %s', async (perm, expected) => {
    const { audio } = fakeAudio({ permission: perm });
    const rec = createNativeRecorder(audio, { platform: 'ios', readFile: async () => blobOf() });
    expect(rec.supported).toBe(true);
    expect(await rec.permission()).toBe(expected);
    expect(audio.requestRecordingPermissionsAsync).not.toHaveBeenCalled();
  });
  it('a failing query reads as prompt', async () => {
    const { audio } = fakeAudio();
    (audio.getRecordingPermissionsAsync as jest.Mock).mockRejectedValue(new Error('x'));
    const rec = createNativeRecorder(audio, { platform: 'ios', readFile: async () => blobOf() });
    expect(await rec.permission()).toBe('prompt');
  });
});

describe('start / stop', () => {
  it('asks for the microphone when needed; a refusal resolves denied and records nothing', async () => {
    const { audio } = fakeAudio({ permission: UNDETERMINED, request: async () => BLOCKED });
    const rec = createNativeRecorder(audio, { platform: 'android', readFile: async () => blobOf() });
    expect(await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() })).toBe('denied');
    expect(audio.requestRecordingPermissionsAsync).toHaveBeenCalledTimes(1);
    expect(FakeRecorder.instances.every((r) => r.record.mock.calls.length === 0)).toBe(true);
  });

  it('records with the options, in a recording audio mode, and stop returns an audio/mp4 recording', async () => {
    const { audio, modes } = fakeAudio();
    const readFile = jest.fn(async () => blobOf());
    const rec = createNativeRecorder(audio, { platform: 'ios', readFile });
    expect(await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() })).toBe('recording');
    const r = FakeRecorder.instances[0]!;
    expect(r.options).toEqual(nativeRecordingOptions('ios'));
    expect(r.prepareToRecordAsync).toHaveBeenCalledTimes(1);
    expect(r.record).toHaveBeenCalledTimes(1);
    expect(modes[0]).toMatchObject({ allowsRecording: true });
    const recording = await rec.stop();
    expect(recording).not.toBeNull();
    expect(recording!.blob.type).toBe('audio/mp4');
    expect(recording!.blob.size).toBeGreaterThan(0);
    expect(recording!.durationMs).toBeGreaterThanOrEqual(0);
    expect(readFile).toHaveBeenCalledWith('file:///cache/rec.m4a');
    expect(r.stop).toHaveBeenCalledTimes(1);
    expect(r.release).toHaveBeenCalledTimes(1);
    expect(modes[modes.length - 1]).toMatchObject({ allowsRecording: false });
    expect(await rec.stop()).toBeNull();
  });

  it('a recorder that cannot prepare resolves unsupported and is released', async () => {
    const { audio } = fakeAudio();
    FakeRecorder.prepare = () => Promise.reject(new Error('no mic'));
    const rec = createNativeRecorder(audio, { platform: 'ios', readFile: async () => blobOf() });
    expect(await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() })).toBe('unsupported');
    expect(FakeRecorder.instances[0]!.release).toHaveBeenCalledTimes(1);
    expect(FakeRecorder.instances[0]!.record).not.toHaveBeenCalled();
  });

  it('auto-stops at maxMs: onAutoStop gets the recording once; ticks report the elapsed time; no timers left', async () => {
    jest.useFakeTimers();
    const { audio } = fakeAudio();
    const rec = createNativeRecorder(audio, { platform: 'android', readFile: async () => blobOf() });
    const onAutoStop = jest.fn();
    const onTick = jest.fn();
    expect(await rec.start({ maxMs: 1000, onAutoStop, onTick })).toBe('recording');
    jest.advanceTimersByTime(600);
    expect(onTick).toHaveBeenCalled();
    jest.advanceTimersByTime(400);
    await flush();
    expect(onAutoStop).toHaveBeenCalledTimes(1);
    expect(onAutoStop.mock.calls[0]![0].blob.type).toBe('audio/mp4');
    expect(FakeRecorder.instances[0]!.release).toHaveBeenCalledTimes(1);
    expect(jest.getTimerCount()).toBe(0);
    expect(await rec.stop()).toBeNull();
  });
});

// INVARIANT (cancel always wins), as for the web recorder: after cancel() returns, or once a new start() has begun, no
// callback of the old session runs and nothing of it is returned; its native recorder is released exactly once.
describe('cancel always wins', () => {
  it('cancel while the permission prompt is open: start resolves denied, nothing records', async () => {
    const prompt = deferred<NativePermission>();
    const { audio } = fakeAudio({ permission: UNDETERMINED, request: () => prompt.promise });
    const rec = createNativeRecorder(audio, { platform: 'ios', readFile: async () => blobOf() });
    const started = rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() });
    await flush();
    rec.cancel();
    prompt.resolve(GRANTED);
    expect(await started).toBe('denied');
    await flush();
    expect(FakeRecorder.instances.every((r) => r.record.mock.calls.length === 0)).toBe(true);
    expect(FakeRecorder.instances.every((r) => r.release.mock.calls.length <= 1)).toBe(true);
  });

  it('cancel while preparing: start resolves denied, the recorder never records and is released once', async () => {
    const prep = deferred<void>();
    FakeRecorder.prepare = () => prep.promise;
    const { audio } = fakeAudio();
    const rec = createNativeRecorder(audio, { platform: 'ios', readFile: async () => blobOf() });
    const started = rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() });
    await flush();
    expect(FakeRecorder.instances).toHaveLength(1);
    rec.cancel();
    prep.resolve();
    expect(await started).toBe('denied');
    await flush();
    const r = FakeRecorder.instances[0]!;
    expect(r.record).not.toHaveBeenCalled();
    expect(r.release).toHaveBeenCalledTimes(1);
  });

  it('cancel while recording: no auto-stop, stop returns null, released once, no timers', async () => {
    jest.useFakeTimers();
    const { audio } = fakeAudio();
    const rec = createNativeRecorder(audio, { platform: 'ios', readFile: async () => blobOf() });
    const onAutoStop = jest.fn();
    const onTick = jest.fn();
    await rec.start({ maxMs: 1000, onAutoStop, onTick });
    rec.cancel();
    const ticks = onTick.mock.calls.length;
    jest.advanceTimersByTime(5000);
    await flush();
    expect(onAutoStop).not.toHaveBeenCalled();
    expect(onTick.mock.calls.length).toBe(ticks);
    expect(await rec.stop()).toBeNull();
    expect(FakeRecorder.instances[0]!.release).toHaveBeenCalledTimes(1);
    expect(jest.getTimerCount()).toBe(0);
  });

  it('cancel while stop is reading the file: stop resolves null', async () => {
    const file = deferred<Blob>();
    const { audio } = fakeAudio();
    const rec = createNativeRecorder(audio, { platform: 'ios', readFile: () => file.promise });
    await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() });
    const stopped = rec.stop();
    await flush();
    rec.cancel();
    file.resolve(blobOf());
    expect(await stopped).toBeNull();
    expect(FakeRecorder.instances[0]!.release).toHaveBeenCalledTimes(1);
  });

  it('cancel after the cap fired but before its file is read: onAutoStop never runs', async () => {
    jest.useFakeTimers();
    const file = deferred<Blob>();
    const { audio } = fakeAudio();
    const rec = createNativeRecorder(audio, { platform: 'android', readFile: () => file.promise });
    const onAutoStop = jest.fn();
    await rec.start({ maxMs: 1000, onAutoStop });
    jest.advanceTimersByTime(1000);
    await flush();
    rec.cancel();
    file.resolve(blobOf());
    await flush();
    expect(onAutoStop).not.toHaveBeenCalled();
    expect(FakeRecorder.instances[0]!.release).toHaveBeenCalledTimes(1);
  });

  it('a new start discards the old recording: its auto-stop never runs, it is released once', async () => {
    jest.useFakeTimers();
    const { audio } = fakeAudio();
    const rec = createNativeRecorder(audio, { platform: 'ios', readFile: async () => blobOf() });
    const first = jest.fn();
    await rec.start({ maxMs: 1000, onAutoStop: first });
    const second = jest.fn();
    expect(await rec.start({ maxMs: 1000, onAutoStop: second })).toBe('recording');
    jest.advanceTimersByTime(1000);
    await flush();
    expect(first).not.toHaveBeenCalled();
    expect(second).toHaveBeenCalledTimes(1);
    expect(FakeRecorder.instances[0]!.release).toHaveBeenCalledTimes(1);
    expect(FakeRecorder.instances[1]!.release).toHaveBeenCalledTimes(1);
  });

  it('cancel twice, or with nothing running, is a no-op', async () => {
    const { audio } = fakeAudio();
    const rec = createNativeRecorder(audio, { platform: 'ios', readFile: async () => blobOf() });
    rec.cancel();
    await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() });
    rec.cancel();
    rec.cancel();
    await flush();
    expect(FakeRecorder.instances[0]!.release).toHaveBeenCalledTimes(1);
  });
});
