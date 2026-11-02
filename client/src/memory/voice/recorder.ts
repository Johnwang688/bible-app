// The microphone recorder for the Memory trainers. Web: MediaRecorder (Opus, mono, 32 kbps). Everywhere
// else it is a stub that says it cannot record; the native adapter (`expo-audio`, not approved yet) fills
// the same `Recorder` interface later.
//
// INVARIANT (cancel always wins): after `cancel()` returns, or once a new `start()` has begun, no callback of
// the old session runs (`onTick`, `onAutoStop`) and nothing of it is returned (its `stop()` resolves null, its
// pending `start()` resolves 'denied'); its tracks are released exactly once.
// How the code keeps it:
// - One `Session` object per `start()`, with an id and a `cancelled` flag. It is `current` from the moment
//   `start()` is called until it has delivered, so a cancel at any point (the permission prompt, recording,
//   waiting for the final data, the microtasks after it) finds it. `discard()` sets `cancelled` and unsets
//   `current` first, synchronously.
// - Every asynchronous continuation (getUserMedia resolving, `dataavailable`, the tick, the cap, the wait for
//   the final data) checks `live(s)` when it resumes, and delivery is the last step: `live(s)`, then
//   `complete(s)` (synchronous), then the callback or the return, with no await in between.
import { Platform } from 'react-native';
import {
  RECORDING_BITS_PER_SECOND,
  type MicPermission,
  type Recorder,
  type RecorderStartOptions,
  type Recording,
} from './types';

/** The browser APIs the web recorder needs, injected so the tests can fake them. */
export interface WebRecorderEnv {
  getUserMedia(c: MediaStreamConstraints): Promise<MediaStream>;
  MediaRecorder: typeof MediaRecorder;
  /** The microphone permission without prompting; null when the browser cannot say. */
  queryPermission?(): Promise<PermissionState | null>;
}

const TICK_MS = 250;
/** Tried in this order; the first the browser can record wins. */
const MIME_TYPES = ['audio/webm;codecs=opus', 'audio/ogg;codecs=opus', 'audio/mp4'] as const;
const FALLBACK_MIME_TYPE = 'audio/webm';

/** One recording, from `start()` until it delivers or is discarded. */
interface Session {
  readonly id: number;
  /** Set synchronously by `discard`, before anything else; never cleared. */
  cancelled: boolean;
  /** `finishing`: stopped by the user or the cap, waiting for the final data. */
  phase: 'starting' | 'recording' | 'finishing' | 'done';
  stream: MediaStream | null;
  recorder: MediaRecorder | null;
  chunks: Blob[];
  mimeType: string;
  startedAt: number;
  tick: ReturnType<typeof setInterval> | undefined;
  cap: ReturnType<typeof setTimeout> | undefined;
  /** Settles once the recorder has emitted its last data and stopped. */
  stopped: Promise<void>;
  /** Settles when the session is discarded, so nothing waits on a browser event that no longer matters. */
  dropped: Promise<void>;
  drop(): void;
  released: boolean;
}

export function createWebRecorder(env: WebRecorderEnv): Recorder {
  // The one session that can still deliver or be cancelled: starting, recording, or finishing after a stop.
  let current: Session | null = null;
  let lastId = 0;

  /** Whether `s` may still deliver: it is the current session and it was not cancelled. */
  const live = (s: Session): boolean => current !== null && current.id === s.id && !s.cancelled;

  // Releases the session's tracks, exactly once. A session still at the prompt has no stream yet: its
  // continuation releases the stream when it arrives.
  const release = (s: Session) => {
    if (s.released || !s.stream) return;
    s.released = true;
    for (const track of s.stream.getTracks()) track.stop();
  };
  const clearTimers = (s: Session) => {
    clearInterval(s.tick);
    clearTimeout(s.cap);
    s.tick = undefined;
    s.cap = undefined;
  };
  const stopRecorder = (s: Session): boolean => {
    try {
      if (s.recorder && s.recorder.state !== 'inactive') {
        s.recorder.stop();
        return true;
      }
    } catch {
      // A recorder that cannot stop has nothing more to give.
    }
    return false;
  };

  // Ends the session without delivering: cancelled first, then the microphone is released at once.
  const discard = (s: Session) => {
    s.cancelled = true;
    if (current === s) current = null;
    s.phase = 'done';
    clearTimers(s);
    stopRecorder(s);
    release(s);
    s.drop();
  };

  // Ends a session that is about to deliver. Call only right after `live(s)`, right before the delivery.
  const complete = (s: Session) => {
    s.phase = 'done';
    current = null;
    clearTimers(s);
    release(s);
  };

  // Stops the recorder and waits for its final data; null if the session was discarded meanwhile. The
  // caller must check `live(s)` again after awaiting this, at the moment it delivers.
  const collect = async (s: Session): Promise<Recording | null> => {
    s.phase = 'finishing';
    const durationMs = Date.now() - s.startedAt;
    clearTimers(s);
    if (stopRecorder(s)) await Promise.race([s.stopped, s.dropped]);
    if (!live(s)) return null;
    return { blob: new Blob(s.chunks, { type: s.recorder?.mimeType || s.mimeType }), durationMs };
  };

  const autoStop = async (s: Session, onAutoStop: (recording: Recording) => void) => {
    const recording = await collect(s);
    if (!recording || !live(s)) return;
    complete(s);
    onAutoStop(recording);
  };

  const pickMimeType = (): string | undefined => {
    const supports = env.MediaRecorder.isTypeSupported?.bind(env.MediaRecorder);
    return supports ? MIME_TYPES.find((type) => supports(type)) : undefined;
  };

  return {
    supported: true,

    async permission(): Promise<MicPermission> {
      try {
        const state = (await env.queryPermission?.()) ?? null;
        return state === 'granted' || state === 'denied' ? state : 'prompt';
      } catch {
        return 'prompt';
      }
    },

    async start({ maxMs, onAutoStop, onTick }: RecorderStartOptions) {
      if (current) discard(current);
      let drop!: () => void;
      const dropped = new Promise<void>((resolve) => {
        drop = resolve;
      });
      const mimeType = pickMimeType();
      const s: Session = {
        id: ++lastId,
        cancelled: false,
        phase: 'starting',
        stream: null,
        recorder: null,
        chunks: [],
        mimeType: mimeType ?? FALLBACK_MIME_TYPE,
        startedAt: 0,
        tick: undefined,
        cap: undefined,
        stopped: dropped,
        dropped,
        drop,
        released: false,
      };
      current = s;

      try {
        s.stream = await env.getUserMedia({
          audio: { channelCount: 1, echoCancellation: true, noiseSuppression: true },
        });
      } catch {
        discard(s);
        return 'denied';
      }
      if (!live(s)) {
        // Cancelled (or restarted) while the prompt was open: nothing is recording.
        release(s);
        return 'denied';
      }

      try {
        const recorder = new env.MediaRecorder(s.stream, {
          ...(mimeType ? { mimeType } : {}),
          audioBitsPerSecond: RECORDING_BITS_PER_SECOND,
        });
        s.recorder = recorder;
        recorder.addEventListener('dataavailable', (event: BlobEvent) => {
          if (!s.cancelled && event.data && event.data.size > 0) s.chunks.push(event.data);
        });
        s.stopped = new Promise<void>((resolve) => recorder.addEventListener('stop', () => resolve()));
        recorder.start();
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

/** Everywhere that cannot record yet: says so, and every call is a no-op. */
function unsupportedRecorder(): Recorder {
  return {
    supported: false,
    permission: async () => 'unsupported',
    start: async () => 'unsupported',
    stop: async () => null,
    cancel: () => undefined,
  };
}

/**
 * The recorder for this platform. A browser with `getUserMedia` and `MediaRecorder` records; native (and
 * the jest platform) gets the stub until the `expo-audio` adapter is approved and fills this interface.
 */
export function createRecorder(): Recorder {
  const mediaDevices = typeof navigator === 'undefined' ? undefined : navigator.mediaDevices;
  const Ctor = (globalThis as { MediaRecorder?: typeof MediaRecorder }).MediaRecorder;
  if (Platform.OS !== 'web' || !mediaDevices?.getUserMedia || !Ctor) return unsupportedRecorder();
  return createWebRecorder({
    getUserMedia: (constraints) => mediaDevices.getUserMedia(constraints),
    MediaRecorder: Ctor,
    queryPermission: async () => {
      const status = await navigator.permissions?.query({ name: 'microphone' as PermissionName });
      return status?.state ?? null;
    },
  });
}
