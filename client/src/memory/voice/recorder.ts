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

interface Active {
  stream: MediaStream;
  recorder: MediaRecorder;
  chunks: Blob[];
  startedAt: number;
  tick: ReturnType<typeof setInterval>;
  cap: ReturnType<typeof setTimeout>;
  /** Settles once the recorder has emitted its last data and stopped. */
  stopped: Promise<void>;
  mimeType: string;
}

export function createWebRecorder(env: WebRecorderEnv): Recorder {
  let active: Active | null = null;
  // Bumped by every start and every cancel, so a start that is still waiting on the microphone prompt
  // can tell it was overtaken and release the stream it was handed.
  let generation = 0;

  const release = (stream: MediaStream) => {
    for (const track of stream.getTracks()) track.stop();
  };

  // Ends the recording `a` (already detached from `active`): clears both timers, stops the recorder,
  // releases the microphone, and resolves once the data is complete.
  // `discard` (cancel) releases the microphone at once, since the data is dropped; otherwise it is released
  // after the recorder's last data has arrived.
  const end = async (a: Active, discard = false): Promise<void> => {
    clearInterval(a.tick);
    clearTimeout(a.cap);
    try {
      if (a.recorder.state !== 'inactive') {
        a.recorder.stop();
        if (discard) release(a.stream);
        else await a.stopped;
      }
    } catch {
      // A recorder that cannot stop has nothing more to give; the stream is released below.
    } finally {
      release(a.stream);
    }
  };

  const toRecording = (a: Active): Recording => ({
    blob: new Blob(a.chunks, { type: a.recorder.mimeType || a.mimeType }),
    durationMs: Date.now() - a.startedAt,
  });

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
      if (active) {
        const previous = active;
        active = null;
        void end(previous, true);
      }
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
        release(stream);
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
        release(stream);
        return 'unsupported';
      }

      const startedAt = Date.now();
      const a: Active = {
        stream,
        recorder,
        chunks,
        startedAt,
        stopped,
        mimeType: mimeType ?? FALLBACK_MIME_TYPE,
        tick: setInterval(() => onTick?.(Date.now() - startedAt), TICK_MS),
        cap: setTimeout(() => {
          if (active !== a) return;
          active = null;
          const durationMs = Date.now() - a.startedAt;
          void end(a).then(() => onAutoStop({ ...toRecording(a), durationMs }));
        }, maxMs),
      };
      active = a;
      return 'recording';
    },

    async stop() {
      const a = active;
      if (!a) return null;
      active = null;
      const durationMs = Date.now() - a.startedAt;
      await end(a);
      return { ...toRecording(a), durationMs };
    },

    cancel() {
      generation++;
      const a = active;
      if (!a) return;
      active = null;
      void end(a, true);
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
