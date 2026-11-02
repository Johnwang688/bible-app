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

export const checkVoice: CheckVoice = async (audio, language, deps, signal) => {
  if (!(deps.isOnline ?? deviceIsOnline)()) return { kind: 'offline' };

  let token: string | null;
  try {
    token = await deps.getIdToken();
  } catch {
    return { kind: 'error' };
  }
  if (token === null) return { kind: 'signed-out' };
  if (signal?.aborted) return { kind: 'cancelled' };

  const controller = new AbortController();
  let timedOut = false;
  const onCallerAbort = () => controller.abort();
  signal?.addEventListener('abort', onCallerAbort);
  const timer = setTimeout(() => {
    timedOut = true;
    controller.abort();
  }, deps.timeoutMs ?? TRANSCRIBE_TIMEOUT_MS);

  try {
    const res = await (deps.fetch ?? fetch)(
      `${deps.baseUrl}/memory/transcribe?${SPEECH_QUERY_PARAM}=${encodeURIComponent(language)}`,
      {
        method: 'POST',
        headers: { 'Content-Type': audio.type || DEFAULT_CONTENT_TYPE, Authorization: `Bearer ${token}` },
        body: audio,
        signal: controller.signal,
      },
    );
    if (res.status >= 200 && res.status < 300) {
      const body = (await res.json()) as { text?: unknown } | null;
      return typeof body?.text === 'string' ? { kind: 'text', text: body.text.trim() } : { kind: 'error' };
    }
    return outcomeForStatus(res.status, res.headers?.get('Retry-After'));
  } catch {
    if (timedOut) return { kind: 'timeout' };
    if (signal?.aborted) return { kind: 'cancelled' };
    return { kind: 'error' };
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
