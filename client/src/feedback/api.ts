// The "Send feedback" request (design/proposed/feedback.html): POST /api/v1/feedback on the backend, which stores the
// message in Firestore. No UI here. `send` never throws: it resolves with what happened, so the sheet can keep the text
// and show the matching message. The ID token is optional (anyone may send) and is never logged.

export const FEEDBACK_MAX_LENGTH = 2000;
/** The counter shows once this many characters (or fewer) are left. */
export const FEEDBACK_COUNTER_FROM = 200;
export const FEEDBACK_REQUEST_TIMEOUT_MS = 15_000;
/** How long the send waits for an ID or App Check token before it goes without one. */
export const FEEDBACK_TOKEN_TIMEOUT_MS = 3_000;
/** Used when a 429 carries no usable Retry-After (the server's window is 10 minutes). */
export const FEEDBACK_DEFAULT_RETRY_MINUTES = 10;

export const FEEDBACK_CATEGORIES = ['bug', 'idea', 'other'] as const;
export type FeedbackCategory = (typeof FEEDBACK_CATEGORIES)[number];
export type FeedbackPlatform = 'web' | 'ios' | 'android' | 'other';

/** What is attached to every message (the sheet lists it in one line). */
export interface FeedbackContext {
  appVersion: string;
  platform: FeedbackPlatform;
  /** The app language in use, e.g. 'en' or 'zh-Hans'. */
  language: string;
  /** The look's preset id, e.g. 'silver'. */
  preset: string;
  screen?: string;
}

export interface FeedbackInput {
  message: string;
  category: FeedbackCategory | null;
  context: FeedbackContext;
}

export type FeedbackFailure = 'offline' | 'failed' | 'rate-limited' | 'invalid';

export type FeedbackResult =
  | { ok: true }
  | { ok: false; reason: 'rate-limited'; retryAfterMinutes: number }
  | { ok: false; reason: Exclude<FeedbackFailure, 'rate-limited'> };

export interface FeedbackApiOptions {
  /** The backend base URL (api/config.ts `getApiBaseUrl`). */
  baseUrl: string;
  fetch?: (url: string, init?: RequestInit) => Promise<Response>;
  timeoutMs?: number;
  /** The signed-in account's Firebase ID token, or null when signed out. A rejection sends no token. */
  getIdToken?: () => Promise<string | null>;
  /**
   * The App Check token, asked for only when an ID token is sent (the backend checks App Check only after the ID
   * token). Defaults to `getAppCheckTokenForRequest` from ../auth/appCheck, loaded only then.
   */
  appCheckToken?: () => Promise<string | null>;
}

export interface FeedbackApi {
  send(input: FeedbackInput): Promise<FeedbackResult>;
}

/** The length the counter and the limit use: UTF-16 units of the trimmed text (never fewer than the server counts). */
export function feedbackLength(text: string): number {
  return text.trim().length;
}

/** Characters left (negative when over the limit). */
export function feedbackRemaining(text: string): number {
  return FEEDBACK_MAX_LENGTH - feedbackLength(text);
}

/** Whether the counter shows: from FEEDBACK_COUNTER_FROM left, and while over the limit. */
export function showFeedbackCounter(text: string): boolean {
  return feedbackRemaining(text) <= FEEDBACK_COUNTER_FROM;
}

/** Send is on: some text that is not only spaces, within the limit. */
export function canSendFeedback(text: string): boolean {
  const length = feedbackLength(text);
  return length > 0 && length <= FEEDBACK_MAX_LENGTH;
}

/** Minutes to show for a 429's Retry-After (seconds, or an HTTP date), rounded up, at least 1. */
export function retryAfterMinutes(header: string | null, now: number = Date.now()): number {
  if (header) {
    const trimmed = header.trim();
    let seconds = /^\d+$/.test(trimmed) ? Number(trimmed) : NaN;
    if (Number.isNaN(seconds)) {
      const at = Date.parse(trimmed);
      if (!Number.isNaN(at)) seconds = (at - now) / 1000;
    }
    if (Number.isFinite(seconds) && seconds > 0) return Math.max(1, Math.ceil(seconds / 60));
  }
  return FEEDBACK_DEFAULT_RETRY_MINUTES;
}

/** A token, or null; never rejects and waits at most FEEDBACK_TOKEN_TIMEOUT_MS. */
async function boundedToken(source: (() => Promise<string | null>) | undefined): Promise<string | null> {
  if (!source) return null;
  let timer: ReturnType<typeof setTimeout> | undefined;
  const timeout = new Promise<null>((resolve) => {
    timer = setTimeout(() => resolve(null), FEEDBACK_TOKEN_TIMEOUT_MS);
  });
  const token = (async () => {
    try {
      const value = await source();
      return typeof value === 'string' && value.trim() !== '' ? value : null;
    } catch {
      return null;
    }
  })();
  try {
    return await Promise.race([token, timeout]);
  } finally {
    clearTimeout(timer);
  }
}

function defaultAppCheckToken(): Promise<string | null> {
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  const appCheck = require('../auth/appCheck') as Partial<typeof import('../auth/appCheck')>;
  const source = appCheck.getAppCheckTokenForRequest ?? appCheck.getAppCheckToken;
  return source ? source() : Promise.resolve(null);
}

/** The JSON body, with only what the sheet says is sent. */
export function feedbackBody(input: FeedbackInput): Record<string, string | null> {
  const { context } = input;
  const body: Record<string, string | null> = {
    message: input.message.trim(),
    category: input.category,
    appVersion: context.appVersion || null,
    platform: context.platform,
    language: context.language || null,
    preset: context.preset || null,
  };
  if (context.screen) body.screen = context.screen;
  return body;
}

export function createFeedbackApi(opts: FeedbackApiOptions): FeedbackApi {
  const baseUrl = opts.baseUrl.replace(/\/+$/, '');
  const timeoutMs = opts.timeoutMs ?? FEEDBACK_REQUEST_TIMEOUT_MS;

  return {
    async send(input) {
      if (!canSendFeedback(input.message)) return { ok: false, reason: 'invalid' };
      const headers: Record<string, string> = { 'Content-Type': 'application/json', Accept: 'application/json' };
      const idToken = await boundedToken(opts.getIdToken);
      if (idToken) {
        headers.Authorization = `Bearer ${idToken}`;
        const appCheck = await boundedToken(opts.appCheckToken ?? defaultAppCheckToken);
        if (appCheck) headers['X-Firebase-AppCheck'] = appCheck;
      }

      const doFetch = opts.fetch ?? globalThis.fetch;
      const controller = new AbortController();
      let timedOut = false;
      const timer = setTimeout(() => {
        timedOut = true;
        controller.abort();
      }, timeoutMs);
      let res: Response;
      try {
        res = await doFetch(`${baseUrl}/api/v1/feedback`, {
          method: 'POST',
          headers,
          body: JSON.stringify(feedbackBody(input)),
          signal: controller.signal,
        });
      } catch {
        // A request that never got an answer: offline (or the server unreachable); a timeout is "try again".
        return { ok: false, reason: timedOut ? 'failed' : 'offline' };
      } finally {
        clearTimeout(timer);
      }

      if (res.status === 201 || res.status === 200) return { ok: true };
      if (res.status === 429) {
        return { ok: false, reason: 'rate-limited', retryAfterMinutes: retryAfterMinutes(res.headers.get('Retry-After')) };
      }
      if (res.status === 400 || res.status === 413 || res.status === 415 || res.status === 422) {
        return { ok: false, reason: 'invalid' };
      }
      return { ok: false, reason: 'failed' };
    },
  };
}
