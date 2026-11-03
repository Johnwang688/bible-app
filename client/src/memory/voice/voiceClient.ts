// The transcription client: uploads one recording to the Bible app's server and reports what came back as a
// typed `VoiceOutcome`. It never throws and settles exactly once; nothing is uploaded when the device is
// offline or the user is signed out.
//
// INVARIANT (cancel always wins): once the caller has aborted, the result is `cancelled` (and once the
// deadline has passed, `timeout`), whatever the token, the fetch or the body do afterwards.
// How the code keeps it:
// - The verdict is decided by the first of {the caller's abort, the deadline} and never changes after.
// - Every await races against that verdict, so a pending token, App Check token, fetch or body cannot hold the call
//   open.
// - Every return after the listener is attached goes through `settle()`, which reads the caller's
//   `signal.aborted` and the verdict synchronously and is the last thing before the return: no await follows
//   it, so an abort that lands between an await resuming and the return still turns the result into
//   `cancelled`.
import { SPEECH_QUERY_PARAM } from '../speech/types';
import {
  EMAIL_NOT_VERIFIED_DETAIL,
  MINUTE_LIMIT_MAX_RETRY_S,
  TRANSCRIBE_TIMEOUT_MS,
  type CheckVoice,
  type VoiceOutcome,
} from './types';

const DEFAULT_RETRY_AFTER_S = 60;
/** The longest a request waits for its App Check token; after that it goes without (the backend only monitors). */
export const APP_CHECK_WAIT_MS = 3_000;
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
const ERROR: VoiceOutcome = { kind: 'error' };

export const checkVoice: CheckVoice = async (audio, language, deps, signal) => {
  let early: VoiceOutcome | null;
  try {
    early = (deps.isOnline ?? deviceIsOnline)() ? null : { kind: 'offline' };
  } catch {
    early = ERROR;
  }
  // A caller who has already aborted gets `cancelled`, even offline: the invariant has no exceptions.
  if (signal?.aborted) return { kind: 'cancelled' };
  if (early) return early;

  const controller = new AbortController();
  let verdict: 'cancelled' | 'timeout' | null = null;
  let signalAbort!: () => void;
  const aborted = new Promise<typeof ABORTED>((resolve) => {
    signalAbort = () => resolve(ABORTED);
  });
  // The first abort decides the verdict; later ones change nothing.
  const abort = (reason: 'cancelled' | 'timeout') => {
    if (verdict !== null) return;
    verdict = reason;
    controller.abort();
    signalAbort();
  };
  // Whether an abort has been decided, reading the caller's signal too (synchronous).
  const decided = (): boolean => {
    if (verdict === null && signal?.aborted) abort('cancelled');
    return verdict !== null;
  };
  // The result as returned: a decided abort wins over anything else. Must be the last step before a return.
  const settle = (outcome: VoiceOutcome): VoiceOutcome => (decided() ? { kind: verdict! } : outcome);
  // Resolves with the value, or ABORTED as soon as an abort is decided.
  const race = <T>(pending: Promise<T>): Promise<T | typeof ABORTED> => Promise.race([aborted, pending]);

  const onCallerAbort = () => abort('cancelled');
  signal?.addEventListener('abort', onCallerAbort);
  const timer = setTimeout(() => abort('timeout'), deps.timeoutMs ?? TRANSCRIBE_TIMEOUT_MS);

  try {
    const token = await race(Promise.resolve().then(() => deps.getIdToken()));
    if (token === ABORTED || decided()) return settle(ERROR);
    if (token === null) return settle({ kind: 'signed-out' });

    // App Check is optional: a missing, empty, failing or slow token sends the request without the header.
    const appCheck = deps.getAppCheckToken ? await race(appCheckToken(deps.getAppCheckToken, aborted)) : null;
    if (appCheck === ABORTED || decided()) return settle(ERROR);
    const headers: Record<string, string> = { 'Content-Type': audio.type || DEFAULT_CONTENT_TYPE, Authorization: `Bearer ${token}` };
    if (appCheck !== null) headers['X-Firebase-AppCheck'] = appCheck;

    const res = await race(
      Promise.resolve().then(() =>
        (deps.fetch ?? fetch)(`${deps.baseUrl}/memory/transcribe?${SPEECH_QUERY_PARAM}=${encodeURIComponent(language)}`, {
          method: 'POST',
          headers,
          body: audio,
          signal: controller.signal,
        }),
      ),
    );
    if (res === ABORTED || decided()) return settle(ERROR);
    if (res.status === 403) {
      // Only the email-not-confirmed 403 is its own outcome; its detail is read like the body (raced, never thrown).
      const refused = await race(
        Promise.resolve()
          .then(() => res.json() as Promise<{ detail?: unknown } | null>)
          .catch(() => null),
      );
      if (refused === ABORTED || decided()) return settle(ERROR);
      return settle(refused?.detail === EMAIL_NOT_VERIFIED_DETAIL ? { kind: 'email-unverified' } : ERROR);
    }
    if (res.status < 200 || res.status >= 300) return settle(outcomeForStatus(res.status, res.headers?.get('Retry-After')));

    const body = await race(Promise.resolve().then(() => res.json() as Promise<{ text?: unknown } | null>));
    if (body === ABORTED || decided()) return settle(ERROR);
    return settle(typeof body?.text === 'string' ? { kind: 'text', text: body.text.trim() } : ERROR);
  } catch {
    return settle(ERROR);
  } finally {
    clearTimeout(timer);
    signal?.removeEventListener('abort', onCallerAbort);
  }
};

/**
 * The App Check token, or null when there is none, it fails, or it takes longer than APP_CHECK_WAIT_MS. Settles at
 * once when the request is aborted (the caller's race returns ABORTED then), so the wait's timer never outlives it.
 */
function appCheckToken(get: () => Promise<string | null>, aborted: Promise<unknown>): Promise<string | null> {
  let timer: ReturnType<typeof setTimeout> | undefined;
  const late = new Promise<null>((resolve) => {
    timer = setTimeout(() => resolve(null), APP_CHECK_WAIT_MS);
  });
  const got = Promise.resolve()
    .then(get)
    .then(
      (value) => (typeof value === 'string' && value !== '' ? value : null),
      () => null,
    );
  return Promise.race([got, late, aborted.then(() => null)]).finally(() => clearTimeout(timer));
}

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
