// The transcription client: uploads one recording to the Bible app's server and reports what came back as a
// typed `VoiceOutcome`. It never throws and settles exactly once; nothing is uploaded when the device is
// offline or the user is signed out.
import { SPEECH_QUERY_PARAM } from '../speech/types';
import {
  MINUTE_LIMIT_MAX_RETRY_S,
  TRANSCRIBE_TIMEOUT_MS,
  type CheckVoice,
  type VoiceOutcome,
} from './types';

const DEFAULT_RETRY_AFTER_S = 60;
const DEFAULT_CONTENT_TYPE = 'audio/webm';

function deviceIsOnline(): boolean {
  return typeof navigator !== 'undefined' && typeof navigator.onLine === 'boolean' ? navigator.onLine : true;
}

/** The Retry-After header as whole seconds; anything but a positive integer reads as a minute. */
function retryAfterSeconds(header: string | null | undefined): number {
  const text = header?.trim() ?? '';
  const seconds = /^\d+$/.test(text) ? Number(text) : 0;
  return Number.isSafeInteger(seconds) && seconds > 0 ? seconds : DEFAULT_RETRY_AFTER_S;
}

const ABORTED = Symbol('aborted');

export const checkVoice: CheckVoice = async (audio, language, deps, signal) => {
  try {
    if (!(deps.isOnline ?? deviceIsOnline)()) return { kind: 'offline' };
  } catch {
    return { kind: 'error' };
  }
  if (signal?.aborted) return { kind: 'cancelled' };

  // The verdict is decided at the first abort (the caller's Cancel, or the deadline), and every await below
  // races against it, so the call settles once, at that moment, whatever the token, the fetch or the body do.
  const controller = new AbortController();
  let verdict: 'cancelled' | 'timeout' | null = null;
  let signalAbort!: () => void;
  const aborted = new Promise<typeof ABORTED>((resolve) => {
    signalAbort = () => resolve(ABORTED);
  });
  const abort = (reason: 'cancelled' | 'timeout') => {
    if (verdict !== null) return;
    verdict = reason;
    controller.abort();
    signalAbort();
  };
  // The verdict if an abort came first, else a plain failure (read through a function: the closures set it).
  const failure = (): VoiceOutcome => ({ kind: verdict ?? 'error' });
  // A result that lands after the first abort is dropped, even if it won the race by arriving at once.
  const race = <T>(pending: Promise<T>): Promise<T | typeof ABORTED> =>
    Promise.race([aborted, pending]).then((value) => (verdict !== null ? ABORTED : value));

  const onCallerAbort = () => abort('cancelled');
  signal?.addEventListener('abort', onCallerAbort);
  const timer = setTimeout(() => abort('timeout'), deps.timeoutMs ?? TRANSCRIBE_TIMEOUT_MS);

  try {
    const token = await race(Promise.resolve().then(() => deps.getIdToken()));
    if (token === ABORTED) return failure();
    if (token === null) return { kind: 'signed-out' };

    const res = await race(
      Promise.resolve().then(() =>
        (deps.fetch ?? fetch)(`${deps.baseUrl}/memory/transcribe?${SPEECH_QUERY_PARAM}=${encodeURIComponent(language)}`, {
          method: 'POST',
          headers: { 'Content-Type': audio.type || DEFAULT_CONTENT_TYPE, Authorization: `Bearer ${token}` },
          body: audio,
          signal: controller.signal,
        }),
      ),
    );
    if (res === ABORTED) return failure();
    if (res.status >= 200 && res.status < 300) {
      const body = await race(Promise.resolve(res.json()) as Promise<{ text?: unknown } | null>);
      if (body === ABORTED) return failure();
      return typeof body?.text === 'string' ? { kind: 'text', text: body.text.trim() } : { kind: 'error' };
    }
    return outcomeForStatus(res.status, res.headers?.get('Retry-After'));
  } catch {
    return failure();
  } finally {
    clearTimeout(timer);
    signal?.removeEventListener('abort', onCallerAbort);
  }
};

function outcomeForStatus(status: number, retryAfter: string | null | undefined): VoiceOutcome {
  switch (status) {
    case 401:
      return { kind: 'signed-out' };
    case 413:
      return { kind: 'too-long' };
    case 429: {
      const retryAfterS = retryAfterSeconds(retryAfter);
      return { kind: 'limit', retryAfterS, window: retryAfterS <= MINUTE_LIMIT_MAX_RETRY_S ? 'minute' : 'day' };
    }
    case 503:
      return { kind: 'no-service' };
    default:
      return { kind: 'error' };
  }
}
