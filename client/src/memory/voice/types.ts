// The voice-answer contracts for the Memory trainers (team MEM, orchestrator-owned). The recorder, the
// transcription client and the availability gate implement these; the screens use only these types.
import type { TranscribeLanguage } from '../speech/types';

/** Recording stops and sends by itself at 30 s (the server takes at most 256 KB; 32 kbps is ~120 KB). */
export const MAX_RECORDING_MS = 30_000;
/** Mono, 32 kbps (Opus on the web, AAC on iOS / Android). */
export const RECORDING_BITS_PER_SECOND = 32_000;
/** The client gives up waiting for a transcription after 30 s (the "timed out" state). */
export const TRANSCRIBE_TIMEOUT_MS = 30_000;
/** The server's 403 detail for a signed-in account whose email isn't confirmed (app/memory/transcribe.py). */
export const EMAIL_NOT_VERIFIED_DETAIL = 'email_not_verified';
/** A 429 whose Retry-After is at most this many seconds is the per-minute limit; longer is the rolling 24 h one. */
export const MINUTE_LIMIT_MAX_RETRY_S = 60;

export type MicPermission = 'granted' | 'denied' | 'prompt' | 'unsupported';

export interface Recording {
  blob: Blob;
  durationMs: number;
}

export interface RecorderStartOptions {
  /** Auto-stop after this long (MAX_RECORDING_MS); the recording is then handed to `onAutoStop`. */
  maxMs: number;
  onAutoStop(recording: Recording): void;
  /** Called about every 250 ms with the elapsed time, for the timer and the "10 seconds left" announcement. */
  onTick?(elapsedMs: number): void;
}

/**
 * One microphone recorder. Web: MediaRecorder (Opus mono 32 kbps). iOS / Android: expo-audio (AAC mono 32 kbps,
 * uploaded as audio/mp4). Where neither can record: a stub (`supported: false`).
 */
export interface Recorder {
  /** Whether this platform can record at all. */
  readonly supported: boolean;
  /** The current permission, without prompting. */
  permission(): Promise<MicPermission>;
  /** Prompts for the microphone if needed, then starts. Never throws: a refusal resolves 'denied'. */
  start(options: RecorderStartOptions): Promise<'recording' | 'denied' | 'unsupported'>;
  /** Stops and returns the recording (null when nothing was recording). */
  stop(): Promise<Recording | null>;
  /** Stops and discards: nothing is returned or sent. */
  cancel(): void;
}

/** What one transcription request came back as. Only `text` is graded. */
export type VoiceOutcome =
  | { kind: 'text'; text: string }
  /** 401, or no ID token (then nothing is uploaded). */
  | { kind: 'signed-out' }
  /**
   * 403 with the detail EMAIL_NOT_VERIFIED_DETAIL: signed in, but the account's email isn't confirmed yet (confirmed
   * on Me). Nothing was transcribed or charged. Not a sign-out: the session stays as it is. Any other 403 is `error`.
   */
  | { kind: 'email-unverified' }
  /** 413. */
  | { kind: 'too-long' }
  /** 429. `window` is 'minute' when Retry-After <= MINUTE_LIMIT_MAX_RETRY_S, else 'day' (rolling 24 h). */
  | { kind: 'limit'; retryAfterS: number; window: 'minute' | 'day' }
  /** 503: the service isn't set up. */
  | { kind: 'no-service' }
  /** 502 or any other failure (including a network error while the device says it is online). */
  | { kind: 'error' }
  /** No answer within TRANSCRIBE_TIMEOUT_MS. */
  | { kind: 'timeout' }
  /** The device is offline: nothing is uploaded. */
  | { kind: 'offline' }
  /** The caller aborted (grading Cancel). */
  | { kind: 'cancelled' };

export interface VoiceClientDeps {
  /** The API base, no trailing slash (`getApiBaseUrl()`). */
  baseUrl: string;
  /** Firebase ID token; null = signed out. */
  getIdToken(): Promise<string | null>;
  /**
   * The App Check token, sent as `X-Firebase-AppCheck` when non-empty. Optional: waited for at most
   * APP_CHECK_WAIT_MS (voiceClient.ts), and a null, a failure or a timeout sends the request without it.
   */
  getAppCheckToken?(): Promise<string | null>;
  fetch?: typeof fetch;
  /** Defaults to `navigator.onLine` where it exists, else true. */
  isOnline?(): boolean;
  /** Defaults to TRANSCRIBE_TIMEOUT_MS. */
  timeoutMs?: number;
}

export type CheckVoice = (
  audio: Blob,
  /** `english` for an English verse, else the stored Mandarin/Cantonese preference. */
  language: TranscribeLanguage,
  deps: VoiceClientDeps,
  signal?: AbortSignal,
) => Promise<VoiceOutcome>;

/** A notice that stands in the mic's place; typing is then the main action. */
export type VoiceNotice =
  | 'voice-off'
  /** This device or browser cannot record: typing only, with a note. */
  | 'unsupported'
  | 'signed-out'
  | 'offline'
  | 'no-service'
  | 'limit'
  | 'denied';

/** Everything the gate looks at, in the order it looks (REVIEW-2 major 2). */
export interface VoiceGateInput {
  voiceOn: boolean;
  supported: boolean;
  signedIn: boolean;
  online: boolean;
  /** A 503 was seen earlier this app session. */
  serviceDown: boolean;
  /** Epoch ms until which a 429 holds, or null. */
  limitedUntil: number | null;
  now: number;
  permission: MicPermission;
}

export type VoiceGate =
  | { kind: 'ready' }
  | { kind: 'notice'; notice: VoiceNotice; /** For 'limit': whole seconds left, rounded up. */ retryAfterS?: number };

/** What the app remembers about the voice service for this app session (shared by every trainer). */
export interface VoiceSessionState {
  serviceDown: boolean;
  limitedUntil: number | null;
}
