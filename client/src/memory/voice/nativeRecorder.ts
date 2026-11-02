// The native (iOS / Android) microphone recorder for the Memory trainers, on expo-audio: AAC in an .m4a (MPEG-4)
// file, mono, 32 kbps, uploaded as `audio/mp4`. It fills the same `Recorder` contract as the web recorder.
// expo-audio is injected (`ExpoAudioApi`, a structural subset of the module) so that this file never loads the
// native module itself: `createRecorder()` requires it lazily and guarded, and the tests pass a fake.
//
// INVARIANT (cancel always wins): after `cancel()` returns, or once a new `start()` has begun, no callback of
// the old session runs (`onTick`, `onAutoStop`) and nothing of it is returned (its `stop()` resolves null, its
// pending `start()` resolves 'denied'); its native recorder is released exactly once (if it was made).
// How the code keeps it:
// - One `Session` object per `start()`, with an id and a `cancelled` flag. It is `current` from the moment
//   `start()` is called until it has delivered, so a cancel at any point (the permission query and prompt,
//   setting the audio mode, preparing, recording, stopping, reading the file) finds it. `discard()` sets
//   `cancelled` and unsets `current` first, synchronously, then releases the native recorder.
// - Every asynchronous continuation (the permission query and request, `setAudioModeAsync`,
//   `prepareToRecordAsync`, `recorder.stop`, `readFile`, the tick, the cap) checks `live(s)` when it resumes,
//   before anything with a visible effect: the permission prompt is only opened after a `live(s)` check that
//   follows the query, so a discarded session never prompts. A recorder made before a cancel was released by
//   the cancel; `record()` is only called after a `live(s)` check with no await in between, so a discarded
//   session never records.
// - Delivery is the last step: `live(s)`, then `complete(s)` (synchronous), then the callback or the return,
//   with no await in between.
import {
  RECORDING_BITS_PER_SECOND,
  type MicPermission,
  type Recorder,
  type RecorderStartOptions,
  type Recording,
} from './types';

/** What expo-audio's permission functions resolve (the fields this adapter reads). */
export type NativePermission = {
  status: 'granted' | 'denied' | 'undetermined';
  granted: boolean;
  canAskAgain: boolean;
};

/** The part of expo-audio's `AudioRecorder` this adapter uses. */
export interface NativeAudioRecorder {
  /** The recording's file, once stopped. */
  uri: string | null;
  prepareToRecordAsync(): Promise<void>;
  record(): void;
  stop(): Promise<void>;
  /** Frees the native object (stopping it first if it is still recording). */
  release(): void;
}

/** The part of the `expo-audio` module this adapter uses, injected so the tests can fake it. */
export interface ExpoAudioApi {
  AudioModule: { AudioRecorder: new (options: Record<string, unknown>) => NativeAudioRecorder };
  getRecordingPermissionsAsync(): Promise<NativePermission>;
  requestRecordingPermissionsAsync(): Promise<NativePermission>;
  setAudioModeAsync(mode: { allowsRecording?: boolean; playsInSilentMode?: boolean }): Promise<void>;
}

export interface NativeRecorderDeps {
  platform: 'ios' | 'android';
  /** Reads the recorded file (a `file://` uri) into a Blob. */
  readFile(uri: string): Promise<Blob>;
}

/** The upload's content type: the server takes `audio/*` and names the file from it; Whisper reads .mp4. */
export const NATIVE_RECORDING_CONTENT_TYPE = 'audio/mp4';

const TICK_MS = 250;
/** Speech needs no more; with mono at 32 kbps the 30 s cap is ~120 KB, under the server's 256 KB. */
const SAMPLE_RATE = 22_050;
/** `AudioQuality.MEDIUM` (RecordingConstants): the encoder quality on iOS; the size is set by the bit rate. */
const IOS_AUDIO_QUALITY = 64;
/** `IOSOutputFormat.MPEG4AAC` (RecordingConstants). */
const IOS_OUTPUT_FORMAT_AAC = 'aac ';

/**
 * The options passed to `new AudioModule.AudioRecorder(...)`, already flattened for the platform the way
 * expo-audio's `createRecordingOptions` does it (common fields, then the platform's own on top).
 */
export function nativeRecordingOptions(platform: 'ios' | 'android'): Record<string, unknown> {
  const common = {
    extension: '.m4a',
    sampleRate: SAMPLE_RATE,
    numberOfChannels: 1,
    bitRate: RECORDING_BITS_PER_SECOND,
    isMeteringEnabled: false,
  };
  return platform === 'ios'
    ? { ...common, outputFormat: IOS_OUTPUT_FORMAT_AAC, audioQuality: IOS_AUDIO_QUALITY }
    : { ...common, outputFormat: 'mpeg4', audioEncoder: 'aac' };
}

/** One recording, from `start()` until it delivers or is discarded. */
interface Session {
  readonly id: number;
  /** Set synchronously by `discard`, before anything else; never cleared. */
  cancelled: boolean;
  /** `finishing`: stopped by the user or the cap, waiting for the file. */
  phase: 'starting' | 'recording' | 'finishing' | 'done';
  recorder: NativeAudioRecorder | null;
  released: boolean;
  /** The recording audio mode was asked for, so it must be set back. */
  modeSet: boolean;
  modeRestored: boolean;
  startedAt: number;
  tick: ReturnType<typeof setInterval> | undefined;
  cap: ReturnType<typeof setTimeout> | undefined;
}

export function createNativeRecorder(audio: ExpoAudioApi, deps: NativeRecorderDeps): Recorder {
  // The one session that can still deliver or be cancelled: starting, recording, or finishing after a stop.
  let current: Session | null = null;
  let lastId = 0;

  /** Whether `s` may still deliver: it is the current session and it was not cancelled. */
  const live = (s: Session): boolean => current !== null && current.id === s.id && !s.cancelled;

  // Releases the session's native recorder, exactly once. A session that has not made one yet has nothing
  // to release; one made later by its continuation is released there.
  const release = (s: Session) => {
    if (s.released || !s.recorder) return;
    s.released = true;
    try {
      s.recorder.release();
    } catch {
      // Already freed natively: nothing more to do.
    }
  };
  const clearTimers = (s: Session) => {
    clearInterval(s.tick);
    clearTimeout(s.cap);
    s.tick = undefined;
    s.cap = undefined;
  };
  // Leaves the recording audio mode (on iOS, playback goes back to the speaker). Its errors do not matter.
  const restoreMode = (s: Session) => {
    if (!s.modeSet || s.modeRestored) return;
    s.modeRestored = true;
    try {
      audio.setAudioModeAsync({ allowsRecording: false }).catch(() => undefined);
    } catch {
      // A mode that cannot be set back changes nothing for the recording.
    }
  };

  // Ends the session without delivering: cancelled first, then the recorder is released at once (the native
  // release stops a recording that is still running).
  const discard = (s: Session) => {
    s.cancelled = true;
    if (current === s) current = null;
    s.phase = 'done';
    clearTimers(s);
    release(s);
    restoreMode(s);
  };

  // Ends a session that is about to deliver. Call only right after `live(s)`, right before the delivery.
  const complete = (s: Session) => {
    s.phase = 'done';
    current = null;
    clearTimers(s);
    release(s);
    restoreMode(s);
  };

  // Stops the recorder and reads its file; null if the session was discarded meanwhile or there is no file
  // (then the session is discarded here). The caller must check `live(s)` again at the moment it delivers.
  const collect = async (s: Session): Promise<Recording | null> => {
    s.phase = 'finishing';
    const durationMs = Date.now() - s.startedAt;
    clearTimers(s);
    const recorder = s.recorder;
    if (!recorder) return null;
    let blob: Blob;
    try {
      await recorder.stop();
      if (!live(s)) return null;
      const uri = recorder.uri;
      if (!uri) {
        discard(s);
        return null;
      }
      blob = await deps.readFile(uri);
    } catch {
      if (live(s)) discard(s);
      return null;
    }
    if (!live(s)) return null;
    if (blob.type !== NATIVE_RECORDING_CONTENT_TYPE) blob = new Blob([blob], { type: NATIVE_RECORDING_CONTENT_TYPE });
    return { blob, durationMs };
  };

  const autoStop = async (s: Session, onAutoStop: (recording: Recording) => void) => {
    const recording = await collect(s);
    if (!recording || !live(s)) return;
    complete(s);
    onAutoStop(recording);
  };

  /**
   * Whether the microphone may be used, prompting if it has not been decided. A throw reads as no. A session
   * discarded while the query was pending never opens the prompt (it reads as no; the caller checks `live(s)`).
   */
  const ensurePermission = async (s: Session): Promise<boolean> => {
    try {
      const known = await audio.getRecordingPermissionsAsync();
      if (known.granted) return true;
      if (!live(s)) return false;
      return (await audio.requestRecordingPermissionsAsync()).granted;
    } catch {
      return false;
    }
  };

  return {
    supported: true,

    async permission(): Promise<MicPermission> {
      try {
        const p = await audio.getRecordingPermissionsAsync();
        if (p.granted) return 'granted';
        return p.status === 'denied' && !p.canAskAgain ? 'denied' : 'prompt';
      } catch {
        return 'prompt';
      }
    },

    async start({ maxMs, onAutoStop, onTick }: RecorderStartOptions) {
      if (current) discard(current);
      const s: Session = {
        id: ++lastId,
        cancelled: false,
        phase: 'starting',
        recorder: null,
        released: false,
        modeSet: false,
        modeRestored: false,
        startedAt: 0,
        tick: undefined,
        cap: undefined,
      };
      current = s;

      const granted = await ensurePermission(s);
      if (!live(s)) return 'denied'; // Cancelled (or restarted) while the prompt was open: nothing was made.
      if (!granted) {
        discard(s);
        return 'denied';
      }

      let ready = true;
      s.modeSet = true;
      try {
        await audio.setAudioModeAsync({ allowsRecording: true, playsInSilentMode: true });
      } catch {
        ready = false;
      }
      if (!live(s)) return 'denied';
      if (!ready) {
        discard(s);
        return 'unsupported';
      }

      try {
        s.recorder = new audio.AudioModule.AudioRecorder(nativeRecordingOptions(deps.platform));
      } catch {
        discard(s);
        return 'unsupported';
      }

      try {
        await s.recorder.prepareToRecordAsync();
      } catch {
        ready = false;
      }
      if (!live(s)) {
        // Cancelled (or restarted) while preparing: the discard released the recorder; it never records.
        release(s);
        return 'denied';
      }
      if (!ready) {
        discard(s);
        return 'unsupported';
      }

      try {
        s.recorder.record();
      } catch {
        discard(s);
        return 'unsupported';
      }

      s.phase = 'recording';
      s.startedAt = Date.now();
      s.tick = setInterval(() => {
        if (live(s) && s.phase === 'recording') onTick?.(Date.now() - s.startedAt);
      }, TICK_MS);
      s.cap = setTimeout(() => {
        if (live(s) && s.phase === 'recording') void autoStop(s, onAutoStop);
      }, maxMs);
      return 'recording';
    },

    async stop() {
      const s = current;
      if (!s || !live(s) || s.phase !== 'recording') return null;
      const recording = await collect(s);
      if (!recording || !live(s)) return null;
      complete(s);
      return recording;
    },

    cancel() {
      if (current) discard(current);
    },
  };
}
