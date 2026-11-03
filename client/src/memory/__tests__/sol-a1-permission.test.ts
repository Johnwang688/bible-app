import {
  createNativeRecorder,
  type ExpoAudioApi,
  type NativeAudioRecorder,
  type NativePermission,
} from '../voice/nativeRecorder';
import { MAX_RECORDING_MS } from '../voice/types';

const GRANTED: NativePermission = { status: 'granted', granted: true, canAskAgain: true };
const PROMPT: NativePermission = { status: 'undetermined', granted: false, canAskAgain: true };
const flush = async () => { for (let i = 0; i < 16; i++) await Promise.resolve(); };
function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((yes) => { resolve = yes; });
  return { promise, resolve };
}

it.each(['cancel', 'restart'] as const)('%s during permission query never opens the discarded session permission prompt', async (action) => {
  // P2: ensurePermission requests microphone access after cancellation because its query continuation has no live check.
  const query = deferred<NativePermission>();
  const made: NativeAudioRecorder[] = [];
  class FakeRecorder implements NativeAudioRecorder {
    uri = 'file:///recording.m4a';
    prepareToRecordAsync = jest.fn(async () => undefined);
    record = jest.fn();
    stop = jest.fn(async () => undefined);
    release = jest.fn();
    constructor() { made.push(this); }
  }
  const request = jest.fn(async () => GRANTED);
  const audio: ExpoAudioApi = {
    AudioModule: { AudioRecorder: FakeRecorder },
    getRecordingPermissionsAsync: jest.fn().mockReturnValueOnce(query.promise).mockResolvedValue(GRANTED),
    requestRecordingPermissionsAsync: request,
    setAudioModeAsync: jest.fn(async () => undefined),
  };
  const recorder = createNativeRecorder(audio, { platform: 'ios', readFile: async () => new Blob(['aac']) });
  const onAutoStop = jest.fn();
  const first = recorder.start({ maxMs: MAX_RECORDING_MS, onAutoStop });
  await flush();
  if (action === 'cancel') recorder.cancel();
  else expect(await recorder.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() })).toBe('recording');
  query.resolve(PROMPT);
  expect(await first).toBe('denied');
  await flush();
  recorder.cancel();
  expect(onAutoStop).not.toHaveBeenCalled();
  expect(made).toHaveLength(action === 'restart' ? 1 : 0);
  for (const native of made) expect(native.release).toHaveBeenCalledTimes(1);
  expect(request).not.toHaveBeenCalled();
});
