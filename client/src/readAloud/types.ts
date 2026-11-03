// Read aloud (R-7): the one interface both speech adapters implement. The web adapter wraps the
// browser's `speechSynthesis` (engine.web.ts); iOS and Android use `expo-speech` (engine.ts).

/** A voice on this device. `id` is what `speak` takes: the web `voiceURI`, or expo-speech's `identifier`. */
export interface SpeechVoice {
  id: string;
  name: string;
  /** BCP 47 tag as the platform reports it (`zh-CN`, `en_US`, `yue-HK`); compare with `parseLangTag`. */
  lang: string;
  /** The platform's default voice (web only; always false on native). */
  isDefault: boolean;
  /** Speaks without the network (web `localService`; native voices count as local). */
  localService: boolean;
  /** An enhanced or premium voice (native `VoiceQuality.Enhanced`). */
  enhanced: boolean;
}

export interface SpeakOptions {
  /** BCP 47 tag for the text. */
  lang: string;
  voiceId: string | null;
  /** 1 is the normal rate. */
  rate: number;
  onDone: () => void;
  /** `err.name` is `'interrupted'` when something outside this app cut the speech off. */
  onError: (err: Error) => void;
}

/**
 * One utterance at a time. After `speak`, exactly one of `onDone` or `onError` is called, unless
 * `stop` (or another `speak`) comes first: then neither is, ever. Adapters guarantee this, so callers
 * never see the late "interrupted" or "end" events some platforms send for a cancelled utterance.
 */
export interface SpeechEngine {
  /** The voices on this device. Waits a little for voices that load late (web, Android). */
  getVoices(): Promise<SpeechVoice[]>;
  speak(text: string, opts: SpeakOptions): void;
  stop(): void;
}

/** The speeds offered, slowest first (decision 7). */
export const RATES = [0.75, 1, 1.25, 1.5, 2] as const;
export const DEFAULT_RATE = 1;

export function interruptedError(): Error {
  const err = new Error('speech was interrupted');
  err.name = 'interrupted';
  return err;
}
