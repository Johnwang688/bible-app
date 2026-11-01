// Verifier round 1 (GPT-6.1 Sol): regression tests. Orchestrator-owned; do not edit.
import { createApiClient } from '../client';

describe('timeout and cancellation cover the whole request', () => {
  it.each(['timeout', 'aborted'] as const)('%s settles while the auth token is still pending', async (kind) => {
    jest.useFakeTimers();
    try {
      const caller = new AbortController();
      let observed: unknown;
      const api = createApiClient({
        baseUrl: 'https://api.example.test',
        timeoutMs: 10,
        getAuthToken: () => new Promise<string | null>(() => {}),
        fetch: (async () => new Response('[]')) as typeof fetch,
      });
      void api.books({ signal: caller.signal }).catch((error: unknown) => {
        observed = error;
      });
      if (kind === 'aborted') caller.abort();
      await jest.advanceTimersByTimeAsync(11);
      expect(observed).toMatchObject({ kind, status: 0 });
      expect(jest.getTimerCount()).toBe(0);
    } finally {
      jest.clearAllTimers();
      jest.useRealTimers();
    }
  });
});

describe('error bodies', () => {
  it('keeps an empty non-JSON HTTP error body as ""', async () => {
    const api = createApiClient({
      baseUrl: 'https://api.example.test',
      fetch: (async () => new Response('', { status: 503 })) as typeof fetch,
    });
    await expect(api.books()).rejects.toMatchObject({ kind: 'http', status: 503, body: '' });
  });
});

describe('timer cleanup', () => {
  const cases: [string, () => Promise<Response>][] = [
    ['success', async () => new Response('[]')],
    ['http error', async () => new Response('{"detail":"x"}', { status: 404 })],
    ['invalid body', async () => new Response('<html>')],
    [
      'network error',
      async () => {
        throw new TypeError('Failed to fetch');
      },
    ],
  ];
  it.each(cases)('clears its timeout after %s', async (_name, fetchImpl) => {
    jest.useFakeTimers();
    try {
      const api = createApiClient({ baseUrl: 'https://api.example.test', fetch: fetchImpl as unknown as typeof fetch });
      await api.books().catch(() => undefined);
      expect(jest.getTimerCount()).toBe(0);
    } finally {
      jest.clearAllTimers();
      jest.useRealTimers();
    }
  });
});
