/**
 * Acceptance tests for the transcription pipeline.
 * Ported from Little Lamb's tests/run.ts, sections A (realTranscribe) and
 * B (transcribe dispatcher). The network seam is `TranscribeDeps`: every test
 * injects its own `fetch` and token getter, so nothing touches the real network.
 */
import { realTranscribe, transcribe, type TranscribeDeps } from '../transcribe';

const BASE = 'https://api.example.test';

type MockFlag = 'pass' | 'fail';
const flagHost = globalThis as typeof globalThis & { __MOCK_TRANSCRIBE_MODE__?: MockFlag };

type Captured = { url: string; init: RequestInit };

/** A fetch stub that records every call and answers with `body` and `status`. */
function recordingFetch(body: string, status = 200): { stub: typeof fetch; calls: Captured[] } {
  const calls: Captured[] = [];
  const stub: typeof fetch = async (input, init) => {
    calls.push({ url: String(input), init: init ?? {} });
    return new Response(body, { status });
  };
  return { stub, calls };
}

function makeDeps(token: string | null, fetchImpl: typeof fetch): TranscribeDeps {
  return { baseUrl: BASE, getIdToken: async () => token, fetch: fetchImpl };
}

function audioBlob(type?: string): Blob {
  return type === undefined
    ? new Blob([new Uint8Array([1])])
    : new Blob([new Uint8Array([1])], { type });
}

const OK_JSON = JSON.stringify({ text: '神' });

beforeEach(() => {
  delete flagHost.__MOCK_TRANSCRIBE_MODE__;
});

afterEach(() => {
  delete flagHost.__MOCK_TRANSCRIBE_MODE__;
});

describe('A. realTranscribe', () => {
  it('A1/A2 a null ID token throws "not signed in" before any request', async () => {
    const { stub, calls } = recordingFetch(OK_JSON);
    await expect(
      realTranscribe(audioBlob('audio/webm'), 'mandarin', makeDeps(null, stub)),
    ).rejects.toThrow(new Error('not signed in'));
    expect(calls).toHaveLength(0);
  });

  it('A3 POSTs the blob to /memory/transcribe?lang=mandarin with Content-Type and Bearer auth', async () => {
    const { stub, calls } = recordingFetch(OK_JSON);
    const blob = new Blob([new Uint8Array([1, 2, 3])], { type: 'audio/webm;codecs=opus' });
    await realTranscribe(blob, 'mandarin', makeDeps('jwt-session-token', stub));
    expect(calls).toHaveLength(1);
    const c = calls[0]!;
    const u = new URL(c.url);
    expect(`${u.origin}${u.pathname}`).toBe(`${BASE}/memory/transcribe`);
    expect(u.searchParams.get('lang')).toBe('mandarin');
    expect(c.init.method).toBe('POST');
    const headers = c.init.headers as Record<string, string>;
    expect(headers['Content-Type']).toBe('audio/webm;codecs=opus');
    expect(headers.Authorization).toBe('Bearer jwt-session-token');
    expect(c.init.body).toBeInstanceOf(Blob);
  });

  it('A4 falls back to Content-Type: audio/webm when blob.type is empty', async () => {
    const { stub, calls } = recordingFetch(OK_JSON);
    await realTranscribe(audioBlob(), 'mandarin', makeDeps('jwt', stub));
    const headers = calls[0]!.init.headers as Record<string, string>;
    expect(headers['Content-Type']).toBe('audio/webm');
  });

  it('A5 returns the trimmed text from a 200 JSON body', async () => {
    const { stub } = recordingFetch(JSON.stringify({ text: '  神爱世人 ' }));
    const out = await realTranscribe(audioBlob('audio/webm'), 'mandarin', makeDeps('jwt', stub));
    expect(out).toBe('神爱世人');
  });

  it('A6 throws on non-2xx with status and body in the message', async () => {
    const { stub } = recordingFetch('boom', 502);
    await expect(
      realTranscribe(audioBlob('audio/webm'), 'mandarin', makeDeps('jwt', stub)),
    ).rejects.toThrow(new Error('transcribe 502: boom'));
  });

  it('A7 throws "not signed in" and never POSTs audio when there is no session', async () => {
    const { stub, calls } = recordingFetch('SHOULD NOT BE CALLED');
    await expect(
      realTranscribe(audioBlob('audio/webm'), 'mandarin', makeDeps(null, stub)),
    ).rejects.toThrow(new Error('not signed in'));
    expect(calls).toHaveLength(0);
  });

  it('A8 an explicit cantonese language rides as ?lang=cantonese with auth', async () => {
    const { stub, calls } = recordingFetch(OK_JSON);
    const blob = new Blob([new Uint8Array([1, 2, 3])], { type: 'audio/webm' });
    await realTranscribe(blob, 'cantonese', makeDeps('jwt', stub));
    expect(calls).toHaveLength(1);
    const c = calls[0]!;
    const u = new URL(c.url);
    expect(`${u.origin}${u.pathname}`).toBe(`${BASE}/memory/transcribe`);
    expect(u.searchParams.get('lang')).toBe('cantonese');
    const headers = c.init.headers as Record<string, string>;
    expect(headers['Content-Type']).toBe('audio/webm');
    expect(headers.Authorization).toBe('Bearer jwt');
    expect(Object.keys(headers).sort()).toEqual(['Authorization', 'Content-Type']);
    expect(c.init.body).toBeInstanceOf(Blob);
  });

  it('A9 signed out still fails fast with an explicit language', async () => {
    const { stub, calls } = recordingFetch('SHOULD NOT BE CALLED');
    await expect(
      realTranscribe(audioBlob('audio/webm'), 'cantonese', makeDeps(null, stub)),
    ).rejects.toThrow(new Error('not signed in'));
    expect(calls).toHaveLength(0);
  });
});

describe('B. transcribe dispatcher', () => {
  it('B1 mock flag "pass" returns the expected text even with deps set, and never fetches', async () => {
    flagHost.__MOCK_TRANSCRIBE_MODE__ = 'pass';
    const { stub, calls } = recordingFetch('SHOULD NOT BE CALLED');
    const out = await transcribe(audioBlob(), '神爱世人', undefined, makeDeps('jwt', stub));
    expect(calls).toHaveLength(0);
    expect(out).toBe('神爱世人');
  });

  it('B2 mock flag "fail" returns the expected text with the last character dropped', async () => {
    flagHost.__MOCK_TRANSCRIBE_MODE__ = 'fail';
    const out = await transcribe(audioBlob(), '神爱世人');
    expect(out).toBe('神爱世');
  });

  it('B3 with deps set and no mock flag, uses realTranscribe (?lang=mandarin)', async () => {
    const { stub, calls } = recordingFetch(OK_JSON);
    await transcribe(audioBlob('audio/webm'), '神', undefined, makeDeps('jwt', stub));
    expect(calls).toHaveLength(1);
    const u = new URL(calls[0]!.url);
    expect(`${u.origin}${u.pathname}`).toBe(`${BASE}/memory/transcribe`);
    expect(u.searchParams.get('lang')).toBe('mandarin');
  });

  it('B4 with no deps and no mock flag falls through to mockTranscribe', async () => {
    // Single character, so the slice-tail behaviour cannot change the output.
    const out = await transcribe(audioBlob(), '神');
    expect(out).toBe('神');
  });
});
