// The feedback request (design/proposed/feedback.html): what it sends, the optional tokens, and how each answer maps
// to what the sheet shows. `send` never throws.
import {
  canSendFeedback,
  createFeedbackApi,
  FEEDBACK_COUNTER_FROM,
  FEEDBACK_DEFAULT_RETRY_MINUTES,
  FEEDBACK_MAX_LENGTH,
  FEEDBACK_TOKEN_TIMEOUT_MS,
  feedbackBody,
  feedbackLength,
  feedbackRemaining,
  retryAfterMinutes,
  showFeedbackCounter,
  type FeedbackInput,
} from '../api';

const CONTEXT = { appVersion: '0.1.0', platform: 'web' as const, language: 'en', preset: 'silver' };
const INPUT: FeedbackInput = { message: '  Highlights vanish in Graphite.  ', category: 'bug', context: CONTEXT };

interface Call {
  url: string;
  init: RequestInit;
}

function fakeFetch(respond: (call: Call) => Promise<Response> | Response) {
  const calls: Call[] = [];
  const fn = jest.fn(async (url: string, init?: RequestInit) => {
    const call = { url, init: init ?? {} };
    calls.push(call);
    return respond(call);
  });
  return { fn, calls };
}

const status = (code: number, headers: Record<string, string> = {}) =>
  new Response(code === 204 ? null : JSON.stringify({ ok: code < 300 }), { status: code, headers });

function headersOf(call: Call | undefined): Record<string, string> {
  return (call?.init.headers ?? {}) as Record<string, string>;
}

afterEach(() => {
  jest.useRealTimers();
});

describe('the limits', () => {
  it('counts the trimmed text', () => {
    expect(feedbackLength('  abc \n')).toBe(3);
    expect(feedbackRemaining('a'.repeat(FEEDBACK_MAX_LENGTH - 10))).toBe(10);
  });

  it('turns Send on only for some text within 2,000 characters', () => {
    expect(canSendFeedback('')).toBe(false);
    expect(canSendFeedback('   \n\t')).toBe(false);
    expect(canSendFeedback('x')).toBe(true);
    expect(canSendFeedback('x'.repeat(FEEDBACK_MAX_LENGTH))).toBe(true);
    expect(canSendFeedback('x'.repeat(FEEDBACK_MAX_LENGTH + 1))).toBe(false);
    // Trailing spaces past the limit do not count.
    expect(canSendFeedback('x'.repeat(FEEDBACK_MAX_LENGTH) + '   ')).toBe(true);
  });

  it('counts emoji as two, like the text field (never fewer than the server counts)', () => {
    expect(feedbackLength('😀')).toBe(2);
    expect(canSendFeedback('😀'.repeat(FEEDBACK_MAX_LENGTH / 2 + 1))).toBe(false);
  });

  it('shows the counter from 200 left, and while over', () => {
    expect(showFeedbackCounter('x'.repeat(FEEDBACK_MAX_LENGTH - FEEDBACK_COUNTER_FROM - 1))).toBe(false);
    expect(showFeedbackCounter('x'.repeat(FEEDBACK_MAX_LENGTH - FEEDBACK_COUNTER_FROM))).toBe(true);
    expect(showFeedbackCounter('x'.repeat(FEEDBACK_MAX_LENGTH + 50))).toBe(true);
  });
});

describe('retryAfterMinutes', () => {
  it('rounds seconds up to whole minutes, at least 1', () => {
    expect(retryAfterMinutes('1')).toBe(1);
    expect(retryAfterMinutes('60')).toBe(1);
    expect(retryAfterMinutes('61')).toBe(2);
    expect(retryAfterMinutes(' 420 ')).toBe(7);
  });

  it('reads an HTTP date', () => {
    const now = Date.parse('2026-11-03T10:00:00Z');
    expect(retryAfterMinutes('Tue, 03 Nov 2026 10:05:30 GMT', now)).toBe(6);
  });

  it('falls back to the window for a missing, past or odd value', () => {
    expect(retryAfterMinutes(null)).toBe(FEEDBACK_DEFAULT_RETRY_MINUTES);
    expect(retryAfterMinutes('0')).toBe(FEEDBACK_DEFAULT_RETRY_MINUTES);
    expect(retryAfterMinutes('-5')).toBe(FEEDBACK_DEFAULT_RETRY_MINUTES);
    expect(retryAfterMinutes('soon')).toBe(FEEDBACK_DEFAULT_RETRY_MINUTES);
  });
});

describe('the body', () => {
  it('sends the trimmed message, the topic and the context, nothing else', () => {
    expect(feedbackBody(INPUT)).toEqual({
      message: 'Highlights vanish in Graphite.',
      category: 'bug',
      appVersion: '0.1.0',
      platform: 'web',
      language: 'en',
      preset: 'silver',
    });
  });

  it('adds the screen only when there is one, and sends null for blanks', () => {
    const body = feedbackBody({ message: 'x', category: null, context: { ...CONTEXT, appVersion: '', screen: 'me' } });
    expect(body).toEqual({ message: 'x', category: null, appVersion: null, platform: 'web', language: 'en', preset: 'silver', screen: 'me' });
  });
});

describe('send', () => {
  it('posts JSON to /api/v1/feedback and resolves ok on 201', async () => {
    const { fn, calls } = fakeFetch(() => status(201));
    const api = createFeedbackApi({ baseUrl: 'https://api.example.com/', fetch: fn });
    await expect(api.send(INPUT)).resolves.toEqual({ ok: true });
    expect(calls).toHaveLength(1);
    const [call] = calls;
    expect(call?.url).toBe('https://api.example.com/api/v1/feedback');
    expect(call?.init.method).toBe('POST');
    expect(headersOf(call)['Content-Type']).toBe('application/json');
    expect(JSON.parse(String(call?.init.body))).toEqual(feedbackBody(INPUT));
  });

  it('sends no Authorization and asks for no App Check token when signed out', async () => {
    const { fn, calls } = fakeFetch(() => status(201));
    const appCheckToken = jest.fn(async () => 'ac');
    const api = createFeedbackApi({ baseUrl: 'https://x', fetch: fn, getIdToken: async () => null, appCheckToken });
    await api.send(INPUT);
    expect(headersOf(calls[0]).Authorization).toBeUndefined();
    expect(headersOf(calls[0])['X-Firebase-AppCheck']).toBeUndefined();
    expect(appCheckToken).not.toHaveBeenCalled();
  });

  it('sends the ID token and the App Check token when signed in', async () => {
    const { fn, calls } = fakeFetch(() => status(201));
    const api = createFeedbackApi({ baseUrl: 'https://x', fetch: fn, getIdToken: async () => 'id-1', appCheckToken: async () => 'ac-1' });
    await api.send(INPUT);
    expect(headersOf(calls[0]).Authorization).toBe('Bearer id-1');
    expect(headersOf(calls[0])['X-Firebase-AppCheck']).toBe('ac-1');
  });

  it('still sends, without the token, when getting a token fails', async () => {
    const { fn, calls } = fakeFetch(() => status(201));
    const api = createFeedbackApi({
      baseUrl: 'https://x',
      fetch: fn,
      getIdToken: async () => {
        throw new Error('refresh failed');
      },
    });
    await expect(api.send(INPUT)).resolves.toEqual({ ok: true });
    expect(headersOf(calls[0]).Authorization).toBeUndefined();
  });

  it('sends without an App Check header when App Check fails', async () => {
    const { fn, calls } = fakeFetch(() => status(201));
    const api = createFeedbackApi({
      baseUrl: 'https://x',
      fetch: fn,
      getIdToken: async () => 'id-1',
      appCheckToken: async () => {
        throw new Error('no app check');
      },
    });
    await api.send(INPUT);
    expect(headersOf(calls[0]).Authorization).toBe('Bearer id-1');
    expect(headersOf(calls[0])['X-Firebase-AppCheck']).toBeUndefined();
  });

  it('does not wait more than the token timeout for a hanging token', async () => {
    jest.useFakeTimers();
    const { fn, calls } = fakeFetch(() => status(201));
    const api = createFeedbackApi({ baseUrl: 'https://x', fetch: fn, getIdToken: () => new Promise<string | null>(() => {}) });
    const sent = api.send(INPUT);
    await jest.advanceTimersByTimeAsync(FEEDBACK_TOKEN_TIMEOUT_MS);
    await expect(sent).resolves.toEqual({ ok: true });
    expect(headersOf(calls[0]).Authorization).toBeUndefined();
  });

  it('never sends an empty or over-long message', async () => {
    const { fn } = fakeFetch(() => status(201));
    const api = createFeedbackApi({ baseUrl: 'https://x', fetch: fn });
    await expect(api.send({ ...INPUT, message: '   ' })).resolves.toEqual({ ok: false, reason: 'invalid' });
    await expect(api.send({ ...INPUT, message: 'x'.repeat(FEEDBACK_MAX_LENGTH + 1) })).resolves.toEqual({ ok: false, reason: 'invalid' });
    expect(fn).not.toHaveBeenCalled();
  });

  it('maps a failed request to offline', async () => {
    const { fn } = fakeFetch(() => Promise.reject(new TypeError('Network request failed')));
    const api = createFeedbackApi({ baseUrl: 'https://x', fetch: fn });
    await expect(api.send(INPUT)).resolves.toEqual({ ok: false, reason: 'offline' });
  });

  it('maps a timeout to failed (try again), and aborts the request', async () => {
    jest.useFakeTimers();
    let signal: AbortSignal | undefined;
    const { fn } = fakeFetch(
      (call) =>
        new Promise<Response>((_, reject) => {
          signal = call.init.signal ?? undefined;
          signal?.addEventListener('abort', () => reject(new Error('aborted')));
        }),
    );
    const api = createFeedbackApi({ baseUrl: 'https://x', fetch: fn, timeoutMs: 1000 });
    const sent = api.send(INPUT);
    await jest.advanceTimersByTimeAsync(1000);
    await expect(sent).resolves.toEqual({ ok: false, reason: 'failed' });
    expect(signal?.aborted).toBe(true);
  });

  it('maps 429 to rate-limited with the minutes to wait', async () => {
    const { fn } = fakeFetch(() => status(429, { 'Retry-After': '400' }));
    const api = createFeedbackApi({ baseUrl: 'https://x', fetch: fn });
    await expect(api.send(INPUT)).resolves.toEqual({ ok: false, reason: 'rate-limited', retryAfterMinutes: 7 });
  });

  it.each([400, 413, 415, 422])('maps %i to invalid', async (code) => {
    const { fn } = fakeFetch(() => status(code));
    const api = createFeedbackApi({ baseUrl: 'https://x', fetch: fn });
    await expect(api.send(INPUT)).resolves.toEqual({ ok: false, reason: 'invalid' });
  });

  it.each([401, 404, 500, 502, 503])('maps %i to failed', async (code) => {
    const { fn } = fakeFetch(() => status(code));
    const api = createFeedbackApi({ baseUrl: 'https://x', fetch: fn });
    await expect(api.send(INPUT)).resolves.toEqual({ ok: false, reason: 'failed' });
  });
});
