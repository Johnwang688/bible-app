// A fake speech engine for read aloud's tests: records what is spoken and lets a test finish or
// break the current utterance. It keeps the engine contract (no callbacks after stop), and also
// hands out the raw callbacks, so a test can play a broken adapter that calls back late.
import type { SpeakOptions, SpeechEngine, SpeechVoice } from '../types';

export function voice(id: string, lang: string, extra: Partial<SpeechVoice> = {}): SpeechVoice {
  return { id, name: id, lang, isDefault: false, localService: true, enhanced: false, ...extra };
}

export const VOICES = {
  samantha: voice('samantha', 'en-US', { isDefault: true }),
  daniel: voice('daniel', 'en-GB'),
  tingting: voice('tingting', 'zh-CN'),
  meijia: voice('meijia', 'zh-TW'),
  sinji: voice('sinji', 'zh-HK'),
};

export interface Spoken {
  text: string;
  opts: SpeakOptions;
}

export class FakeEngine implements SpeechEngine {
  voices: SpeechVoice[];
  spoken: Spoken[] = [];
  current: Spoken | null = null;
  stops = 0;
  unlock?: () => void;
  /** When set, getVoices waits for `releaseVoices()`. */
  private held: ((v: SpeechVoice[]) => void) | null = null;
  holdVoices = false;

  constructor(voices: SpeechVoice[] = Object.values(VOICES)) {
    this.voices = voices;
  }

  getVoices(): Promise<SpeechVoice[]> {
    if (!this.holdVoices) return Promise.resolve([...this.voices]);
    return new Promise((resolve) => (this.held = resolve));
  }

  releaseVoices(): void {
    this.held?.([...this.voices]);
    this.held = null;
  }

  speak(text: string, opts: SpeakOptions): void {
    this.current = { text, opts };
    this.spoken.push(this.current);
  }

  stop(): void {
    this.stops++;
    this.current = null;
  }

  /** The current utterance ends normally. */
  finish(): void {
    const c = this.current;
    if (!c) throw new Error('nothing is being spoken');
    this.current = null;
    c.opts.onDone();
  }

  /** Finishes utterances until nothing is spoken (or `max` is reached). */
  finishAll(max = 200): void {
    for (let i = 0; i < max && this.current; i++) this.finish();
  }

  fail(name: string, message = name): void {
    const c = this.current;
    if (!c) throw new Error('nothing is being spoken');
    this.current = null;
    const err = new Error(message);
    err.name = name;
    c.opts.onError(err);
  }

  get texts(): string[] {
    return this.spoken.map((s) => s.text);
  }
}
