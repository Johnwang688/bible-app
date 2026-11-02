import { checkVoice } from '../voice/voiceClient';
import type { VoiceClientDeps, VoiceOutcome } from '../voice/types';

function deferred<T>() {
  let resolve!: (value: T) => void;
  let reject!: (error: Error) => void;
  const promise = new Promise<T>((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
}
const audio = new Blob(['voice'], { type: 'audio/webm' });
const flush = async () => { for (let i = 0; i < 8; i++) await Promise.resolve(); };
const response = (status: number, retry: string | null = null) => ({
  status, headers: { get: () => retry }, json: async () => ({ text: ' 神 ' }),
}) as unknown as Response;
const deps = (fetcher: typeof fetch, extra: Partial<VoiceClientDeps> = {}): VoiceClientDeps => ({
  baseUrl: 'https://api.example', getIdToken: async () => 'token', isOnline: () => true, fetch: fetcher, ...extra,
});

afterEach(() => { jest.restoreAllMocks(); jest.useRealTimers(); });

it('returns error instead of rejecting when the online probe throws', async () => {
  // P2: the online probe runs outside every try/catch, violating the never-throws contract.
  const fetcher = jest.fn(async () => response(200));
  await expect(checkVoice(audio, 'mandarin', deps(fetcher, {
    isOnline: () => { throw new Error('online probe failed'); },
  }))).resolves.toEqual({ kind: 'error' });
  expect(fetcher).not.toHaveBeenCalled();
});

it('keeps a caller-first abort classified as cancelled when fetch rejects after the deadline', async () => {
  // P2: the timeout overwrites the first abort reason while the aborted fetch is still rejecting.
  jest.useFakeTimers();
  const caller = new AbortController();
  const fetcher = jest.fn((_url: RequestInfo | URL, init?: RequestInit) => new Promise<Response>((_, reject) => {
    init?.signal?.addEventListener('abort', () => {
      setTimeout(() => reject(new Error('aborted fetch')), 5);
    });
  }));
  const pending = checkVoice(audio, 'mandarin', deps(fetcher, { timeoutMs: 10 }), caller.signal);
  await flush();
  await jest.advanceTimersByTimeAsync(9);
  caller.abort();
  await jest.advanceTimersByTimeAsync(10);
  expect(await pending).toEqual({ kind: 'cancelled' });
});

it('does not return transcript text after cancellation during JSON delivery', async () => {
  // P2: a body that resolves after caller cancellation is returned as text without checking abort.
  const body = deferred<{ text: string }>();
  const caller = new AbortController();
  const fetcher = jest.fn(async () => ({ ...response(200), json: () => body.promise }) as Response);
  const pending = checkVoice(audio, 'mandarin', deps(fetcher), caller.signal);
  await flush();
  caller.abort();
  body.resolve({ text: '神' });
  expect(await pending).toEqual({ kind: 'cancelled' });
});

it('does not return transcript text after the timeout aborts JSON delivery', async () => {
  // P2: the deadline aborts the signal, but a subsequently resolved body still produces a gradeable text.
  jest.useFakeTimers();
  const body = deferred<{ text: string }>();
  const fetcher = jest.fn(async () => ({ ...response(200), json: () => body.promise }) as Response);
  const pending = checkVoice(audio, 'mandarin', deps(fetcher, { timeoutMs: 10 }));
  await flush();
  await jest.advanceTimersByTimeAsync(10);
  body.resolve({ text: '神' });
  expect(await pending).toEqual({ kind: 'timeout' });
});

it('settles caller cancellation while token retrieval is still pending', async () => {
  // P2: cancel is not observed until getIdToken settles, so the pending screen cannot leave promptly.
  const token = deferred<string | null>();
  const caller = new AbortController();
  const fetcher = jest.fn(async () => response(200));
  let settled: VoiceOutcome | undefined;
  const pending = checkVoice(audio, 'mandarin', deps(fetcher, { getIdToken: () => token.promise }), caller.signal)
    .then((outcome) => { settled = outcome; return outcome; });
  caller.abort();
  await flush();
  const atCancel = settled;
  token.resolve('token');
  await pending;
  expect(fetcher).not.toHaveBeenCalled();
  expect(atCancel).toEqual({ kind: 'cancelled' });
});

it.each([null, '', 'nonsense', '0', '-1', '1.5', 'Wed, 21 Oct 2015 07:28:00 GMT', '9007199254740992'])
('defaults malformed Retry-After %s to 60 seconds', async (retry) => {
  const fetcher = jest.fn(async () => response(429, retry));
  expect(await checkVoice(audio, 'mandarin', deps(fetcher))).toEqual({ kind: 'limit', retryAfterS: 60, window: 'minute' });
});

it.each([['1', 1, 'minute'], ['60', 60, 'minute'], ['61', 61, 'day'], [' 100 ', 100, 'day']] as const)
('classifies positive integer Retry-After %s', async (header, seconds, window) => {
  expect(await checkVoice(audio, 'mandarin', deps(jest.fn(async () => response(429, header)))))
    .toEqual({ kind: 'limit', retryAfterS: seconds, window });
});

it('does not upload offline, without a token or with a pre-aborted caller', async () => {
  const fetcher = jest.fn(async () => response(200));
  const getIdToken = jest.fn(async () => 'token');
  expect(await checkVoice(audio, 'mandarin', deps(fetcher, { isOnline: () => false, getIdToken }))).toEqual({ kind: 'offline' });
  expect(getIdToken).not.toHaveBeenCalled();
  expect(await checkVoice(audio, 'mandarin', deps(fetcher, { getIdToken: async () => null }))).toEqual({ kind: 'signed-out' });
  const caller = new AbortController();
  caller.abort();
  expect(await checkVoice(audio, 'mandarin', deps(fetcher), caller.signal)).toEqual({ kind: 'cancelled' });
  expect(fetcher).not.toHaveBeenCalled();
});

it.each([200, 401, 413, 429, 502, 503])('cleans the deadline and caller listener after HTTP %s', async (status) => {
  jest.useFakeTimers();
  const caller = new AbortController();
  const add = jest.spyOn(caller.signal, 'addEventListener');
  const remove = jest.spyOn(caller.signal, 'removeEventListener');
  await checkVoice(audio, 'mandarin', deps(jest.fn(async () => response(status))), caller.signal);
  expect(jest.getTimerCount()).toBe(0);
  expect(add).toHaveBeenCalledTimes(1);
  expect(remove).toHaveBeenCalledWith('abort', add.mock.calls[0]![1]);
});

it('cleans the deadline and listener after a timeout-first abort even if the caller also aborts', async () => {
  jest.useFakeTimers();
  const caller = new AbortController();
  const add = jest.spyOn(caller.signal, 'addEventListener');
  const remove = jest.spyOn(caller.signal, 'removeEventListener');
  const fetcher = jest.fn((_url: RequestInfo | URL, init?: RequestInit) => new Promise<Response>((_, reject) => {
    init?.signal?.addEventListener('abort', () => { caller.abort(); reject(new Error('aborted')); });
  }));
  const pending = checkVoice(audio, 'mandarin', deps(fetcher, { timeoutMs: 10 }), caller.signal);
  await jest.advanceTimersByTimeAsync(10);
  expect(await pending).toEqual({ kind: 'timeout' });
  expect(jest.getTimerCount()).toBe(0);
  expect(remove).toHaveBeenCalledWith('abort', add.mock.calls[0]![1]);
});