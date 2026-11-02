// Orchestrator-owned: createRecorder() on native (the jest platform) uses expo-audio when its native module loads,
// and falls back to the typing-only stub when it doesn't (an old build without the module). expo-audio is mocked:
// native recording itself needs an EAS build.
import { MAX_RECORDING_MS } from '../voice/types';

afterEach(() => {
  jest.resetModules();
  jest.dontMock('expo-audio');
});

it('native: createRecorder records through expo-audio', async () => {
  const record = jest.fn();
  jest.doMock('expo-audio', () => ({
    AudioModule: {
      AudioRecorder: class {
        uri: string | null = null;
        record = record;
        stop = async () => { this.uri = 'file:///r.m4a'; };
        release = jest.fn();
        prepareToRecordAsync = async () => undefined;
      },
    },
    getRecordingPermissionsAsync: async () => ({ status: 'granted', granted: true, canAskAgain: true }),
    requestRecordingPermissionsAsync: async () => ({ status: 'granted', granted: true, canAskAgain: true }),
    setAudioModeAsync: async () => undefined,
  }));
  // eslint-disable-next-line @typescript-eslint/no-require-imports -- jest.doMock needs a require after it
  const { createRecorder } = require('../voice/recorder') as typeof import('../voice/recorder');
  const rec = createRecorder();
  expect(rec.supported).toBe(true);
  expect(await rec.permission()).toBe('granted');
  expect(await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() })).toBe('recording');
  expect(record).toHaveBeenCalledTimes(1);
  rec.cancel();
});

it('native without the expo-audio module: the unsupported stub', async () => {
  jest.doMock('expo-audio', () => { throw new Error('Cannot find native module ExpoAudio'); });
  // eslint-disable-next-line @typescript-eslint/no-require-imports -- jest.doMock needs a require after it
  const { createRecorder } = require('../voice/recorder') as typeof import('../voice/recorder');
  const rec = createRecorder();
  expect(rec.supported).toBe(false);
  expect(await rec.permission()).toBe('unsupported');
  expect(await rec.start({ maxMs: MAX_RECORDING_MS, onAutoStop: jest.fn() })).toBe('unsupported');
});
