// The web speech adapter: the browser's `speechSynthesis`, with its known quirks handled here so the
// controller never sees them.
//  - Voices load late: `getVoices()` is often empty at first and fills in with a `voiceschanged`
//    event (Chrome), or only fills in on a later call with no event (Safari). We wait for either.
//  - Cancelling an utterance fires `error` ('interrupted'/'canceled') or `end` on it afterwards, in
//    different orders per browser. Handlers are detached before cancelling, so nothing late arrives.
//  - Chrome can garbage-collect an utterance mid-speech and never fire `end`; we hold a reference
//    to the current one until it settles.
//  - Chrome cuts long utterances off: the controller speaks one verse (or piece of one) at a time.
//  - Pause and resume are unreliable across browsers; the controller never uses them (decision 6).
//  - Mobile Safari starts speech only from a user tap: `unlock` speaks an empty utterance inside it.
//  - Chrome sometimes never sends `end` at all; the controller's watchdog covers that.
import { interruptedError, type SpeakOptions, type SpeechEngine, type SpeechVoice } from './types';

/** The parts of `SpeechSynthesisVoice` we read. */
export interface WebVoiceLike {
  voiceURI: string;
  name: string;
  lang: string;
  default: boolean;
  localService: boolean;
}

/** The parts of `SpeechSynthesisUtterance` we use. */
export interface WebUtteranceLike {
  text: string;
  lang: string;
  rate: number;
  voice: WebVoiceLike | null;
  onend: ((ev: unknown) => void) | null;
  onerror: ((ev: { error?: string }) => void) | null;
}

/** The parts of `speechSynthesis` we use. */
export interface WebSynthLike {
  readonly paused: boolean;
  getVoices(): WebVoiceLike[];
  speak(u: WebUtteranceLike): void;
  cancel(): void;
  resume(): void;
  addEventListener?(type: 'voiceschanged', listener: () => void): void;
  removeEventListener?(type: 'voiceschanged', listener: () => void): void;
}

export interface WebSpeechDeps {
  synth: WebSynthLike;
  makeUtterance: (text: string) => WebUtteranceLike;
  /** How long `getVoices` waits for late voices before answering with what there is. */
  voiceWaitMs?: number;
  pollMs?: number;
}

const CANCELLED = new Set(['interrupted', 'canceled']);

function toVoice(v: WebVoiceLike): SpeechVoice {
  return { id: v.voiceURI, name: v.name, lang: v.lang, isDefault: v.default, localService: v.localService, enhanced: false };
}

export function createWebSpeechEngine(deps: WebSpeechDeps): SpeechEngine {
  const { synth, makeUtterance, voiceWaitMs = 3000, pollMs = 250 } = deps;
  let current: WebUtteranceLike | null = null;
  let unlocked = false;

  const detach = () => {
    const u = current;
    current = null;
    if (u) {
      u.onend = null;
      u.onerror = null;
    }
  };

  return {
    getVoices() {
      const now = synth.getVoices();
      if (now.length > 0) return Promise.resolve(now.map(toVoice));
      return new Promise((resolve) => {
        let done = false;
        const deadline = Date.now() + voiceWaitMs;
        const finish = () => {
          if (done) return;
          const list = synth.getVoices();
          // Polling and the event may both fire with nothing yet; only the deadline answers empty.
          if (list.length === 0 && Date.now() < deadline) return;
          done = true;
          clearInterval(poll);
          clearTimeout(timer);
          synth.removeEventListener?.('voiceschanged', finish);
          resolve(list.map(toVoice));
        };
        const poll = setInterval(finish, pollMs);
        const timer = setTimeout(finish, voiceWaitMs);
        synth.addEventListener?.('voiceschanged', finish);
      });
    },

    speak(text: string, opts: SpeakOptions) {
      if (current) {
        detach();
        synth.cancel();
      }
      // A page that paused speechSynthesis elsewhere would leave new utterances queued forever.
      if (synth.paused) synth.resume();
      const u = makeUtterance(text);
      u.lang = opts.lang;
      u.rate = opts.rate;
      u.voice = (opts.voiceId && synth.getVoices().find((v) => v.voiceURI === opts.voiceId)) || null;
      u.onend = () => {
        if (current !== u) return;
        detach();
        opts.onDone();
      };
      u.onerror = (ev) => {
        if (current !== u) return;
        detach();
        const code = ev?.error ?? 'error';
        if (CANCELLED.has(code)) {
          opts.onError(interruptedError());
          return;
        }
        const err = new Error(`speech failed: ${code}`);
        err.name = code;
        opts.onError(err);
      };
      current = u;
      synth.speak(u);
    },

    stop() {
      detach();
      synth.cancel();
    },

    // Mobile Safari only starts speech from a tap; an empty utterance spoken inside the tap unlocks it.
    unlock() {
      if (unlocked) return;
      unlocked = true;
      synth.speak(makeUtterance(''));
    },
  };
}

/** A stand-in for browsers without speech: no voices, so read aloud shows its "no voice" state. */
export function silentEngine(): SpeechEngine {
  return {
    getVoices: () => Promise.resolve([]),
    speak: (_text, opts) => opts.onError(interruptedError()),
    stop: () => {},
  };
}

type SpeechGlobals = {
  speechSynthesis?: WebSynthLike;
  SpeechSynthesisUtterance?: new (text: string) => WebUtteranceLike;
};

export function createSpeechEngine(): SpeechEngine {
  const g = globalThis as SpeechGlobals;
  const synth = g.speechSynthesis;
  const Utterance = g.SpeechSynthesisUtterance;
  if (!synth || !Utterance) return silentEngine();
  return createWebSpeechEngine({ synth, makeUtterance: (text) => new Utterance(text) });
}
