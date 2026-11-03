import {
  DEFAULT_SPEECH_LANGUAGE,
  SPEECH_QUERY_PARAM,
  type TranscribeLanguage,
} from './speech/types';

// Transcription client. Real impl (realTranscribe): POST the audio blob to the
// app's own API (`${baseUrl}/memory/transcribe`), which authenticates the
// Firebase ID token, enforces per-user quota, and proxies to the speech
// provider. mockTranscribe is the no-backend dev fallback; the audio blob is
// ignored there.

/** The network seam: everything `realTranscribe` needs from its host. */
export interface TranscribeDeps {
  /** The API base, no trailing slash. */
  baseUrl: string;
  /** Firebase ID token; null = signed out. */
  getIdToken: () => Promise<string | null>;
  /** Defaults to `globalThis.fetch`. */
  fetch?: typeof fetch;
}

type MockMode = 'pass' | 'fail';
const mockFlagHost = globalThis as typeof globalThis & { __MOCK_TRANSCRIBE_MODE__?: MockMode };

/**
 * The mock ignores the language by construction — it echoes the (simplified)
 * expected text, so a mock-driven run can never exercise the traditional-
 * transcript path. That is why the normalisation contract is a pure-function
 * test, not a UI verification.
 */
export async function mockTranscribe(
  _audioBlob: Blob,
  expectedHanzi: string,
): Promise<string> {
  // DEV-ONLY override. Set globalThis.__MOCK_TRANSCRIBE_MODE__ to 'fail' or 'pass'
  // to deterministically exercise the error/diff or success path during verification.
  // 'pass' → always return expectedHanzi verbatim.
  // 'fail' → always return expectedHanzi.slice(0, -1) (one character short).
  // undefined → default 80% pass / 20% one-short.
  const mode = mockFlagHost.__MOCK_TRANSCRIBE_MODE__;
  if (mode === 'pass') return expectedHanzi;
  if (mode === 'fail') return expectedHanzi.length > 1 ? expectedHanzi.slice(0, -1) : '';

  // 300-500ms artificial delay so the UI's loading state is observable.
  const delay = 300 + Math.floor(Math.random() * 200);
  await new Promise((r) => setTimeout(r, delay));

  // 80% perfect transcription, 20% one-character-short to simulate user error.
  if (Math.random() < 0.2 && expectedHanzi.length > 1) {
    return expectedHanzi.slice(0, -1); // drop trailing char
  }
  return expectedHanzi;
}

/**
 * POST the audio to `${baseUrl}/memory/transcribe?lang=<language>`.
 *
 * The signed-out check fires first so a signed-out user fails fast
 * ('not signed in') without uploading audio for a guaranteed 401.
 *
 * The language rides as `?lang=` because the BODY is the raw audio blob —
 * there is no form field or JSON envelope to put it in. The server allow-lists
 * it and defaults to Mandarin; it never 400s on a language.
 */
export async function realTranscribe(
  blob: Blob,
  language: TranscribeLanguage = DEFAULT_SPEECH_LANGUAGE,
  deps: TranscribeDeps,
): Promise<string> {
  const token = await deps.getIdToken();
  if (token === null) throw new Error('not signed in');

  const doFetch = deps.fetch ?? globalThis.fetch;
  const res = await doFetch(`${deps.baseUrl}/memory/transcribe?${SPEECH_QUERY_PARAM}=${language}`, {
    method: 'POST',
    headers: {
      'Content-Type': blob.type || 'audio/webm',
      Authorization: `Bearer ${token}`,
    },
    body: blob,
  });
  if (!res.ok) {
    const body = await res.text();
    throw new Error(`transcribe ${res.status}: ${body}`);
  }
  const json = (await res.json()) as { text: string };
  return json.text.trim();
}

/**
 * Dispatch helper: picks real or mock transcription.
 *  - If globalThis.__MOCK_TRANSCRIBE_MODE__ is 'pass' or 'fail', always use mockTranscribe (testability wins).
 *  - Else if `deps` is given, use realTranscribe.
 *  - Else fall through to mockTranscribe (default dev path).
 */
export async function transcribe(
  blob: Blob,
  expectedHanzi: string,
  language: TranscribeLanguage = DEFAULT_SPEECH_LANGUAGE,
  deps?: TranscribeDeps,
): Promise<string> {
  const mode = mockFlagHost.__MOCK_TRANSCRIBE_MODE__;
  if (mode === 'pass' || mode === 'fail') return mockTranscribe(blob, expectedHanzi);
  if (deps) return realTranscribe(blob, language, deps);
  return mockTranscribe(blob, expectedHanzi);
}
