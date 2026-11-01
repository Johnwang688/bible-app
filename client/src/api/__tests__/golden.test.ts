// Acceptance (orchestrator-owned): the API client against the backend's golden responses
// (tests/golden/fixtures, recorded from app.main:app). The backend is the contract.
import * as fs from 'fs';
import * as path from 'path';

import { ApiError, createApiClient, type ApiClient } from '../client';

const FIXTURES = path.resolve(__dirname, '../../../../tests/golden/fixtures');
const BASE = 'https://api.example.test';

interface Fixture {
  status: number;
  body: unknown;
  request: {
    name: string;
    method: 'GET' | 'POST';
    path: string;
    params?: Record<string, string | number>;
    json?: Record<string, unknown>;
  };
}

/** Maps a recorded request to the client call that should produce it. */
function callFor(api: ApiClient, req: Fixture['request']): Promise<unknown> | null {
  const seg = req.path.replace(/^\/api\/v1\//, '').split('/').map(decodeURIComponent);
  const p = req.params ?? {};
  const tr = p.translation as string | undefined;
  switch (seg[0]) {
    case 'translations':
      return api.translations();
    case 'books':
      return api.books();
    case 'chapters':
      return api.chapter(seg[1]!, Number(seg[2]), tr);
    case 'verses':
      return seg.length === 4
        ? api.verse(seg[1]!, Number(seg[2]), Number(seg[3]), tr)
        : api.verseRange(seg[1]!, Number(seg[2]), Number(seg[3]), Number(seg[4]), tr);
    case 'words':
      return api.words(seg[1]!, Number(seg[2]), Number(seg[3]));
    case 'lexicon':
      return api.lexicon(seg[1]!);
    case 'search':
      return api.search(req.json as { query: string; translation?: string; book?: string; limit?: number });
    case 'commentary':
      if (seg[1] === 'sources') return api.commentarySources();
      return api.commentary({
        book: String(p.book),
        chapter: Number(p.chapter),
        ...(p.verse !== undefined ? { verse: Number(p.verse) } : {}),
        ...(p.source !== undefined ? { source: String(p.source) } : {}),
      });
    case 'summary-entities':
      return seg[1] === 'list'
        ? api.entities(seg[2] as 'theme' | 'person' | 'place')
        : api.entity(seg[1] as 'theme' | 'person' | 'place', seg[2]!);
    default:
      return null; // AI and guided-chapter endpoints are not in the R-0 client.
  }
}

const fixtures: Fixture[] = fs
  .readdirSync(FIXTURES)
  .filter((f) => f.endsWith('.json'))
  .map((f) => JSON.parse(fs.readFileSync(path.join(FIXTURES, f), 'utf8')));

function mockFetch(fx: Fixture) {
  return jest.fn(async (_url: string, _init?: RequestInit) => {
    return new Response(JSON.stringify(fx.body), {
      status: fx.status,
      headers: { 'Content-Type': 'application/json' },
    });
  });
}

describe('golden contract', () => {
  const covered = fixtures.filter((fx) => !fx.request.path.includes('/ai/'));

  it('covers every non-AI golden fixture', () => {
    expect(covered.length).toBeGreaterThanOrEqual(45);
  });

  // The 'bad kind' entity fixture is a request the typed client cannot make (kind is a union).
  it.each(covered.filter((fx) => fx.request.name !== 'entity_bad_kind').map((fx) => [fx.request.name, fx]))(
    '%s',
    async (_name, fx) => {
      const fetchFn = mockFetch(fx);
      const api = createApiClient({ baseUrl: BASE, fetch: fetchFn as unknown as typeof fetch });
      const call = callFor(api, fx.request);
      expect(call).not.toBeNull();

      if (fx.status >= 200 && fx.status < 300) {
        await expect(call).resolves.toEqual(fx.body);
      } else {
        const err = await (call as Promise<unknown>).catch((e: unknown) => e);
        expect(err).toBeInstanceOf(ApiError);
        expect((err as ApiError).kind).toBe('http');
        expect((err as ApiError).status).toBe(fx.status);
      }

      expect(fetchFn).toHaveBeenCalledTimes(1);
      const [url, init] = fetchFn.mock.calls[0]!;
      const u = new URL(url);
      expect(u.origin).toBe(BASE);
      expect(decodeURIComponent(u.pathname)).toBe(decodeURIComponent(fx.request.path));
      const params = Object.fromEntries(u.searchParams.entries());
      const expected = Object.fromEntries(Object.entries(fx.request.params ?? {}).map(([k, v]) => [k, String(v)]));
      expect(params).toEqual(expected);
      expect((init?.method ?? 'GET').toUpperCase()).toBe(fx.request.method);
      if (fx.request.json) {
        expect(JSON.parse(String(init?.body))).toEqual(fx.request.json);
        expect(new Headers(init?.headers).get('content-type')).toMatch(/application\/json/);
      }
    },
  );
});
