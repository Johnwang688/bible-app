// The microphone recorder for the Memory trainers. Web: MediaRecorder (Opus, mono, 32 kbps). Everywhere
// else it is a stub that says it cannot record; the native adapter (`expo-audio`, not approved yet) fills
// the same `Recorder` interface later.
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

/** One recording, from `start` until its data is delivered, dropped or cancelled. */
interface Session {
  stream: MediaStream;
  recorder: MediaRecorder;
  chunks: Blob[];
  startedAt: number;
  tick: ReturnType<typeof setInterval>;
  cap: ReturnType<typeof setTimeout>;
  /** Settles once the recorder has emitted its last data and stopped. */
  stopped: Promise<void>;
  /** Settles when the session is cancelled, so nothing waits on a browser event that no longer matters. */
  dropped: Promise<void>;
  drop(): void;
  mimeType: string;
  /** `finishing`: stopped by the user or the cap, waiting for the final data. */
  phase: 'recording' | 'finishing';
  cancelled: boolean;
  released: boolean;
}

export function createWebRecorder(env: WebRecorderEnv): Recorder {
  // The one session that can still deliver or be cancelled: recording, or finishing after a stop.
  let current: Session | null = null;
  // Bumped by every start and every cancel, so a start that is still waiting on the microphone prompt
  // can tell it was overtaken and release the stream it was handed.
  let generation = 0;

  const releaseStream = (stream: MediaStream) => {
    for (const track of stream.getTracks()) track.stop();
  };
  // Every end of a session releases its tracks, exactly once.
  const release = (s: Session) => {
    if (s.released) return;
    s.released = true;
    releaseStream(s.stream);
  };
  const clearTimers = (s: Session) => {
    clearInterval(s.tick);
    clearTimeout(s.cap);
  };
  const stopRecorder = (s: Session): boolean => {
    try {
      if (s.recorder.state !== 'inactive') {
        s.recorder.stop();
        return true;
      }
    } catch {
      // A recorder that cannot stop has nothing more to give.
    }
    return false;
  };

  // Drops the session: nothing it recorded is delivered, and the microphone is released at once.
  const discard = (s: Session) => {
    s.cancelled = true;
    clearTimers(s);
    stopRecorder(s);
    release(s);
    s.drop();
    if (current === s) current = null;
  };

  // Stops the session and returns its recording once the last data is in; null if it was cancelled meanwhile.
  const finish = async (s: Session): Promise<Recording | null> => {
    s.phase = 'finishing';
    const durationMs = Date.now() - s.startedAt;
    clearTimers(s);
    if (stopRecorder(s)) await Promise.race([s.stopped, s.dropped]);
    if (s.cancelled) return null;
    release(s);
    if (current === s) current = null;
    return { blob: new Blob(s.chunks, { type: s.recorder.mimeType || s.mimeType }), durationMs };
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
      const mine = ++generation;

      let stream: MediaStream;
      try {
        stream = await env.getUserMedia({
          audio: { channelCount: 1, echoCancellation: true, noiseSuppression: true },
        });
      } catch {
        return 'denied';
      }
      if (mine !== generation) {
        // Cancelled (or restarted) while the prompt was open: nothing is recording.
        releaseStream(stream);
        return 'denied';
      }

      let recorder: MediaRecorder;
      const chunks: Blob[] = [];
      let stopped: Promise<void>;
      const mimeType = pickMimeType();
      try {
        recorder = new env.MediaRecorder(stream, {
          ...(mimeType ? { mimeType } : {}),
          audioBitsPerSecond: RECORDING_BITS_PER_SECOND,
        });
        recorder.addEventListener('dataavailable', (event: BlobEvent) => {
          if (event.data && event.data.size > 0) chunks.push(event.data);
        });
        stopped = new Promise<void>((resolve) => recorder.addEventListener('stop', () => resolve()));
        recorder.start();
      } catch {
        releaseStream(stream);
        return 'unsupported';
      }

      let drop!: () => void;
      const dropped = new Promise<void>((resolve) => {
        drop = resolve;
      });
      const startedAt = Date.now();
      const s: Session = {
        stream,
        recorder,
        chunks,
        startedAt,
        stopped,
        dropped,
        drop,
        mimeType: mimeType ?? FALLBACK_MIME_TYPE,
        phase: 'recording',
        cancelled: false,
        released: false,
        tick: setInterval(() => onTick?.(Date.now() - startedAt), TICK_MS),
        cap: setTimeout(() => {
          if (current !== s || s.phase !== 'recording') return;
          void finish(s).then((recording) => {
            // Delivered only if this session was not cancelled or replaced while the final data arrived.
            if (recording && !s.cancelled) onAutoStop(recording);
          });
        }, maxMs),
      };
      current = s;
      return 'recording';
    },

    async stop() {
      const s = current;
      if (!s || s.phase !== 'recording') return null;
      return finish(s);
    },

    cancel() {
      generation++;
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
