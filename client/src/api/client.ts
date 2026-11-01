// Typed client for the FastAPI backend. One fetch per call; retries belong to TanStack Query.
import type { z } from 'zod';

import {
  BooksSchema,
  ChapterOutSchema,
  CommentaryEntriesSchema,
  CommentarySourcesSchema,
  HealthSchema,
  LexiconEntryOutSchema,
  SearchResultsSchema,
  SummaryEntityListSchema,
  SummaryEntityPageOutSchema,
  TranslationsSchema,
  VerseOutSchema,
  VersesSchema,
  VerseWordsOutSchema,
  type BookInfo,
  type ChapterOut,
  type CommentaryEntry,
  type CommentarySource,
  type EntityKind,
  type Health,
  type LexiconEntryOut,
  type SearchResult,
  type SummaryEntityListItemOut,
  type SummaryEntityPageOut,
  type Translation,
  type VerseOut,
  type VerseWordsOut,
} from './schemas';

export type { EntityKind } from './schemas';

export type ApiErrorKind = 'http' | 'network' | 'timeout' | 'invalid' | 'aborted';

export class ApiError extends Error {
  readonly kind: ApiErrorKind;
  /** HTTP status; 0 unless `kind` is 'http'. */
  readonly status: number;
  readonly path: string;
  readonly body?: unknown;

  constructor(init: {
    kind: ApiErrorKind;
    status: number;
    path: string;
    body?: unknown;
    message?: string;
    cause?: unknown;
  }) {
    super(
      init.message ??
        (init.kind === 'http'
          ? `Request to ${init.path} failed with status ${init.status}`
          : `Request to ${init.path} failed (${init.kind})`),
      init.cause === undefined ? undefined : { cause: init.cause },
    );
    this.name = 'ApiError';
    this.kind = init.kind;
    this.status = init.kind === 'http' ? init.status : 0;
    this.path = init.path;
    if (init.body !== undefined) this.body = init.body;
  }
}

export interface ApiClientOptions {
  baseUrl: string;
  fetch?: typeof fetch;
  getAuthToken?: () => Promise<string | null>;
  /** Per-request timeout in milliseconds. Default 15000. */
  timeoutMs?: number;
}

export interface RequestOptions {
  signal?: AbortSignal;
}

export interface SearchRequest {
  query: string;
  translation?: string;
  book?: string;
  limit?: number;
}

export interface CommentaryRequest {
  book: string;
  chapter: number;
  verse?: number;
  source?: string;
}

export interface ApiClient {
  translations(opts?: RequestOptions): Promise<Translation[]>;
  books(opts?: RequestOptions): Promise<BookInfo[]>;
  chapter(book: string, chapter: number, translation?: string, opts?: RequestOptions): Promise<ChapterOut>;
  verse(
    book: string,
    chapter: number,
    verse: number,
    translation?: string,
    opts?: RequestOptions,
  ): Promise<VerseOut>;
  verseRange(
    book: string,
    chapter: number,
    start: number,
    end: number,
    translation?: string,
    opts?: RequestOptions,
  ): Promise<VerseOut[]>;
  words(book: string, chapter: number, verse: number, opts?: RequestOptions): Promise<VerseWordsOut>;
  lexicon(strongs: string, opts?: RequestOptions): Promise<LexiconEntryOut>;
  search(req: SearchRequest, opts?: RequestOptions): Promise<SearchResult[]>;
  commentary(req: CommentaryRequest, opts?: RequestOptions): Promise<CommentaryEntry[]>;
  commentarySources(opts?: RequestOptions): Promise<CommentarySource[]>;
  entities(kind: EntityKind, opts?: RequestOptions): Promise<SummaryEntityListItemOut[]>;
  entity(kind: EntityKind, slug: string, opts?: RequestOptions): Promise<SummaryEntityPageOut>;
  health(opts?: RequestOptions): Promise<Health>;
}

const DEFAULT_TIMEOUT_MS = 15000;

type QueryValue = string | number | undefined;

function seg(value: string | number): string {
  return encodeURIComponent(String(value));
}

/** Builds `?a=1&b=2` from the defined values, in the given order ('' if none). */
function query(params: [string, QueryValue][]): string {
  const parts: string[] = [];
  for (const [key, value] of params) {
    if (value !== undefined) parts.push(`${encodeURIComponent(key)}=${encodeURIComponent(String(value))}`);
  }
  return parts.length ? `?${parts.join('&')}` : '';
}

function parseJson(text: string): { ok: true; value: unknown } | { ok: false } {
  try {
    return { ok: true, value: JSON.parse(text) };
  } catch {
    return { ok: false };
  }
}

export function createApiClient(opts: ApiClientOptions): ApiClient {
  const baseUrl = opts.baseUrl.replace(/\/+$/, '');
  const timeoutMs = opts.timeoutMs ?? DEFAULT_TIMEOUT_MS;
  const { getAuthToken } = opts;

  async function request<S extends z.ZodType>(
    method: 'GET' | 'POST',
    path: string,
    schema: S,
    reqOpts?: RequestOptions,
    json?: unknown,
  ): Promise<z.output<S>> {
    const callerSignal = reqOpts?.signal;
    const controller = new AbortController();
    let timedOut = false;

    const onCallerAbort = () => controller.abort();
    if (callerSignal?.aborted) controller.abort();
    else callerSignal?.addEventListener('abort', onCallerAbort, { once: true });

    const timer = setTimeout(() => {
      timedOut = true;
      controller.abort();
    }, timeoutMs);

    /** Maps a thrown fetch/body-read error to an ApiError. */
    const transportError = (cause: unknown): ApiError => {
      const kind: ApiErrorKind = callerSignal?.aborted ? 'aborted' : timedOut ? 'timeout' : 'network';
      return new ApiError({ kind, status: 0, path, cause });
    };

    try {
      if (callerSignal?.aborted) throw transportError(callerSignal.reason);

      const headers: Record<string, string> = { Accept: 'application/json' };
      if (json !== undefined) headers['Content-Type'] = 'application/json';

      // Rejects as soon as our controller aborts (timeout or caller abort), so a pending token,
      // fetch that ignores its signal, or slow body read cannot outlive the deadline.
      const abortSignal = controller.signal;
      const aborted = new Promise<never>((_, reject) => {
        const onAbort = () => reject(abortSignal.reason ?? new Error('aborted'));
        if (abortSignal.aborted) onAbort();
        else abortSignal.addEventListener('abort', onAbort, { once: true });
      });
      aborted.catch(() => undefined);

      const work = (async () => {
        const token = getAuthToken ? await getAuthToken() : null;
        if (token) headers.Authorization = `Bearer ${token}`;

        const fetchFn = opts.fetch ?? globalThis.fetch;
        const init: RequestInit = { method, headers, signal: controller.signal };
        if (json !== undefined) init.body = JSON.stringify(json);
        const res = await fetchFn(baseUrl + path, init);
        return { response: res, text: await res.text() };
      })();

      let text: string;
      let response: Response;
      try {
        ({ response, text } = await Promise.race([work, aborted]));
      } catch (cause) {
        throw transportError(cause);
      }

      if (!response.ok) {
        const parsed = parseJson(text);
        const body = parsed.ok ? parsed.value : text;
        throw new ApiError({ kind: 'http', status: response.status, path, body });
      }

      const parsed = parseJson(text);
      if (!parsed.ok) {
        throw new ApiError({ kind: 'invalid', status: 0, path, message: `Response from ${path} is not JSON` });
      }
      const result = schema.safeParse(parsed.value);
      if (!result.success) {
        throw new ApiError({
          kind: 'invalid',
          status: 0,
          path,
          message: `Response from ${path} does not match the expected schema`,
          cause: result.error,
        });
      }
      return result.data;
    } finally {
      clearTimeout(timer);
      callerSignal?.removeEventListener('abort', onCallerAbort);
    }
  }

  const API = '/api/v1';

  return {
    translations: (o) => request('GET', `${API}/translations`, TranslationsSchema, o),
    books: (o) => request('GET', `${API}/books`, BooksSchema, o),
    chapter: (book, chapter, translation, o) =>
      request(
        'GET',
        `${API}/chapters/${seg(book)}/${seg(chapter)}${query([['translation', translation]])}`,
        ChapterOutSchema,
        o,
      ),
    verse: (book, chapter, verse, translation, o) =>
      request(
        'GET',
        `${API}/verses/${seg(book)}/${seg(chapter)}/${seg(verse)}${query([['translation', translation]])}`,
        VerseOutSchema,
        o,
      ),
    verseRange: (book, chapter, start, end, translation, o) =>
      request(
        'GET',
        `${API}/verses/${seg(book)}/${seg(chapter)}/${seg(start)}/${seg(end)}${query([['translation', translation]])}`,
        VersesSchema,
        o,
      ),
    words: (book, chapter, verse, o) =>
      request('GET', `${API}/words/${seg(book)}/${seg(chapter)}/${seg(verse)}`, VerseWordsOutSchema, o),
    lexicon: (strongs, o) => request('GET', `${API}/lexicon/${seg(strongs)}`, LexiconEntryOutSchema, o),
    search: (req, o) => request('POST', `${API}/search`, SearchResultsSchema, o, req),
    commentary: (req, o) =>
      request(
        'GET',
        `${API}/commentary${query([
          ['book', req.book],
          ['chapter', req.chapter],
          ['verse', req.verse],
          ['source', req.source],
        ])}`,
        CommentaryEntriesSchema,
        o,
      ),
    commentarySources: (o) => request('GET', `${API}/commentary/sources`, CommentarySourcesSchema, o),
    entities: (kind, o) => request('GET', `${API}/summary-entities/list/${seg(kind)}`, SummaryEntityListSchema, o),
    entity: (kind, slug, o) =>
      request('GET', `${API}/summary-entities/${seg(kind)}/${seg(slug)}`, SummaryEntityPageOutSchema, o),
    health: (o) => request('GET', '/health', HealthSchema, o),
  };
}
