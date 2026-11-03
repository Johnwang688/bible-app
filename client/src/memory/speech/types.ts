/**
 * Speech-language preference — which spoken language the user recites in.
 *
 * The written verse never changes: a Cantonese speaker reads the same 和合本
 * simplified text aloud. What changes is (a) the language token Whisper decodes
 * under and (b) the phonetic key the comparator scores against — Mandarin
 * toneless pinyin or Cantonese toneless jyutping. Verse data, chunks and the
 * trainers' pedagogy are untouched by this preference.
 *
 * `SPEECH_ASR_CODE` values are Whisper LANGUAGES-table tokens, NOT ISO-639-1:
 * `yue` has no 639-1 code, and both OpenRouter and Groq document 639-1 only.
 * Both were nevertheless verified live to accept `language=yue` on
 * whisper-large-v3-turbo (HTTP 200) while a bogus `zz` 400s — i.e. the code is
 * forwarded, not swallowed. That is undocumented behaviour either provider
 * could tighten without notice, which is exactly why `asr_language` rides on
 * every `asr_call` event: a Cantonese-only outage would otherwise look like a
 * generic upstream fault.
 *
 * Dependency-free on purpose: imported by the keyer, the transcription client and the
 * tests. No React, no native modules.
 */

export type SpeechLanguage = 'mandarin' | 'cantonese';

export const SPEECH_LANGUAGES: readonly SpeechLanguage[] = ['mandarin', 'cantonese'];

/**
 * The language a transcription request asks for: the stored Chinese preference for a Chinese verse, or `english`
 * for an English one (the verses follow the app language). `english` is never stored: the Mandarin/Cantonese
 * preference is for the Chinese verses only. The server maps it to Whisper's `en`.
 */
export type TranscribeLanguage = SpeechLanguage | 'english';

export const DEFAULT_SPEECH_LANGUAGE: SpeechLanguage = 'mandarin';

/** Query parameter on `/memory/transcribe` (its body is the raw audio blob). */
export const SPEECH_QUERY_PARAM = 'lang';

/** The only place a Whisper language token is written. */
export const SPEECH_ASR_CODE: Record<SpeechLanguage, 'zh' | 'yue'> = {
  mandarin: 'zh',
  cantonese: 'yue',
};

export function isSpeechLanguage(value: unknown): value is SpeechLanguage {
  return value === 'mandarin' || value === 'cantonese';
}

/**
 * The allow-list, and the ONLY validator either server route uses. Anything
 * unrecognised — absent, misspelled, an ASR code, a stale tab from before this
 * shipped — resolves to Mandarin. Neither route ever 400s on a language: a
 * rejection would break mid-lesson for every client deployed before this.
 */
export function resolveSpeechLanguage(value: unknown): SpeechLanguage {
  return isSpeechLanguage(value) ? value : DEFAULT_SPEECH_LANGUAGE;
}

/**
 * Thrown when a language's keyer cannot be constructed (a failed dynamic
 * import, a missing export, or a broken code-point invariant). Only the
 * Cantonese branch can raise it — Mandarin degrades to the synchronous keyer
 * instead, because a perfect Mandarin recital must never be discarded by a
 * lazy chunk that failed to load.
 */
export class SpeechKeyerUnavailableError extends Error {
  constructor(message: string, options?: { cause?: unknown }) {
    super(message, options);
    this.name = 'SpeechKeyerUnavailableError';
  }
}
