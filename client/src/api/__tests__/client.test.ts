// Acceptance (orchestrator-owned): API client behaviour beyond the golden responses.
import { ApiError, createApiClient } from '../client';
import { queryKeys, shouldRetry } from '../queryClient';

const chapterBody = {
  book: 'Song of Solomon',
  book_number: 22,
  chapter: 1,
  translation: 'BSB',
  verses: [{ id: 1, book: 'Song of Solomon', book_number: 22, chapter: 1, verse: 1, text: 'x', translation: 'BSB' }],
  total_verses: 1,
};

const ok = (body: unknown) =>
  jest.fn(async (_url: string, _init?: RequestInit) => new Response(JSON.stringify(body), { status: 200 }));

describe('createApiClient', () => {
  it('encodes path segments and drops a trailing slash on the base URL', async () => {
    const fetchFn = ok(chapterBody);
    const api = createApiClient({ baseUrl: 'https://api.example.test/', fetch: fetchFn as unknown as typeof fetch });
    await api.chapter('Song of Solomon', 1);
    expect(fetchFn.mock.calls[0]![0]).toBe('https://api.example.test/api/v1/chapters/Song%20of%20Solomon/1');
  });

  it('omits an undefined translation so the backend default applies', async () => {
    const fetchFn = ok(chapterBody);
    const api = createApiClient({ baseUrl: 'https://api.example.test', fetch: fetchFn as unknown as typeof fetch });
    await api.chapter('John', 3);
    expect(new URL(fetchFn.mock.calls[0]![0]).search).toBe('');
  });

  it('sends the bearer token when one is available, and nothing when it is null', async () => {
    const fetchFn = ok(chapterBody);
    const withToken = createApiClient({
      baseUrl: 'https://api.example.test',
      fetch: fetchFn as unknown as typeof fetch,
      getAuthToken: async () => 'tok-123',
    });
    await withToken.chapter('John', 3);
    expect(new Headers(fetchFn.mock.calls[0]![1]?.headers).get('authorization')).toBe('Bearer tok-123');

    const noToken = createApiClient({
      baseUrl: 'https://api.example.test',
      fetch: fetchFn as unknown as typeof fetch,
      getAuthToken: async () => null,
    });
    await noToken.chapter('John', 3);
    expect(new Headers(fetchFn.mock.calls[1]![1]?.headers).get('authorization')).toBeNull();
  });

  it('reports a network failure as kind "network"', async () => {
    const api = createApiClient({
      baseUrl: 'https://api.example.test',
      fetch: (async () => {
        throw new TypeError('Failed to fetch');
      }) as unknown as typeof fetch,
    });
    const err = await api.books().catch((e: unknown) => e);
    expect(err).toBeInstanceOf(ApiError);
    expect((err as ApiError).kind).toBe('network');
    expect((err as ApiError).status).toBe(0);
  });

  it('reports a response that fails its schema as kind "invalid"', async () => {
    const api = createApiClient({
      baseUrl: 'https://api.example.test',
      fetch: ok([{ book_number: 'one' }]) as unknown as typeof fetch,
    });
    const err = await api.books().catch((e: unknown) => e);
    expect(err).toBeInstanceOf(ApiError);
    expect((err as ApiError).kind).toBe('invalid');
  });

  it('reports a non-JSON success body as kind "invalid"', async () => {
    const api = createApiClient({
      baseUrl: 'https://api.example.test',
      fetch: (async () => new Response('<html>', { status: 200 })) as unknown as typeof fetch,
    });
    await expect(api.books()).rejects.toMatchObject({ kind: 'invalid' });
  });

  it('keeps the HTTP status and body of an error response', async () => {
    const api = createApiClient({
      baseUrl: 'https://api.example.test',
      fetch: (async () => new Response('{"detail":"nope"}', { status: 503 })) as unknown as typeof fetch,
    });
    await expect(api.books()).rejects.toMatchObject({ kind: 'http', status: 503, body: { detail: 'nope' } });
  });

  it('times out as kind "timeout"', async () => {
    jest.useFakeTimers();
    try {
      const api = createApiClient({
        baseUrl: 'https://api.example.test',
        timeoutMs: 1000,
        fetch: ((_url: string, init?: RequestInit) =>
          new Promise((_resolve, reject) => {
            init?.signal?.addEventListener('abort', () => reject(new DOMException('Aborted', 'AbortError')));
          })) as unknown as typeof fetch,
      });
      const p = api.books().catch((e: unknown) => e);
      await jest.advanceTimersByTimeAsync(1001);
      const err = await p;
      expect(err).toBeInstanceOf(ApiError);
      expect((err as ApiError).kind).toBe('timeout');
    } finally {
      jest.useRealTimers();
    }
  });

  it('passes cancellation through: an aborted caller signal rejects as kind "aborted"', async () => {
    const controller = new AbortController();
    const api = createApiClient({
      baseUrl: 'https://api.example.test',
      fetch: ((_url: string, init?: RequestInit) =>
        new Promise((_resolve, reject) => {
          init?.signal?.addEventListener('abort', () => reject(new DOMException('Aborted', 'AbortError')));
        })) as unknown as typeof fetch,
    });
    const p = api.chapter('John', 3, 'BSB', { signal: controller.signal }).catch((e: unknown) => e);
    controller.abort();
    const err = await p;
    expect(err).toBeInstanceOf(ApiError);
    expect((err as ApiError).kind).toBe('aborted');
  });
});

describe('query helpers', () => {
  it('builds distinct, stable keys per chapter and translation', () => {
    expect(queryKeys.chapter('John', 3, 'BSB')).toEqual(queryKeys.chapter('John', 3, 'BSB'));
    expect(queryKeys.chapter('John', 3, 'BSB')).not.toEqual(queryKeys.chapter('John', 3, 'CUV'));
    expect(queryKeys.chapter('John', 3, 'BSB')).not.toEqual(queryKeys.chapter('John', 4, 'BSB'));
  });

  it('retries network failures, timeouts and 5xx a few times, never 4xx, invalid or aborted', () => {
    const e = (kind: ApiError['kind'], status = 0) => new ApiError({ kind, status, path: '/x' });
    expect(shouldRetry(0, e('network'))).toBe(true);
    expect(shouldRetry(0, e('timeout'))).toBe(true);
    expect(shouldRetry(0, e('http', 503))).toBe(true);
    expect(shouldRetry(2, e('network'))).toBe(false);
    expect(shouldRetry(0, e('http', 404))).toBe(false);
    expect(shouldRetry(0, e('invalid'))).toBe(false);
    expect(shouldRetry(0, e('aborted'))).toBe(false);
  });
});
