// Read aloud's playback state machine. It owns the verse queue and the speech engine; the reader
// only shows its state (the verse to highlight and follow, the bar, the end-of-chapter offer).
//
//   idle ─start→ preparing ─voices→ playing ⇄ paused
//                     │                 │
//                     └→ no-voice       ├─ last verse done → ended, or advancing (auto-advance on)
//                                       └─ engine error → error
//   advancing ─the next chapter arrives (continueInto)→ preparing …
//   any ─stop / leave / another chapter→ idle
//
// Every engine call carries the generation it was made in; anything that stops or restarts speech
// bumps the generation, so a callback from older speech can never move the queue.
//
// A watchdog runs with each piece of speech: platforms sometimes never call back (Chrome's cut-off,
// a phone call interrupting iOS speech, an unknown voice on iOS). If a piece runs far past its
// expected length, it is treated as interrupted: reading pauses on the verse instead of hanging.
import type { TranslationId } from '../reader/translations';
import { DEFAULT_PREFS, type ReadAloudPrefs } from './keys';
import { pickVoice, speechLanguageFor, voicesFor, type SpeechGroup } from './language';
import { chunkForSpeech, estimateSeconds, maxPieceLength, speakableText } from './text';
import { RATES, type SpeechEngine, type SpeechVoice } from './types';

export type ReadAloudStatus = 'idle' | 'preparing' | 'playing' | 'paused' | 'ended' | 'advancing' | 'no-voice' | 'error';

export interface ReadAloudVerse {
  verse: number;
  text: string;
}

/** A chapter in one translation: in parallel reading, only the first translation's (decision 10). */
export interface ReadAloudChapter {
  /** Identifies book, chapter and translation; see `readAloudKey`. */
  key: string;
  translation: TranslationId;
  verses: readonly ReadAloudVerse[];
  /** The next chapter's key in the same translation, or null at the end of the Bible. */
  nextKey: string | null;
}

export interface ReadAloudState {
  status: ReadAloudStatus;
  chapterKey: string | null;
  translation: TranslationId | null;
  /** The voice group being read (`zh-Hans` for 和合本); also set in `no-voice`, for its message. */
  group: SpeechGroup | null;
  /** The verse being read, or (paused) the one Play restarts. Null when nothing is queued. */
  verse: number | null;
  /** 1-based place of `verse` in the chapter's spoken verses, and how many there are. */
  position: number;
  total: number;
  /** Whether the reader should keep `verse` in view (false once the user scrolls by hand). */
  following: boolean;
  voice: SpeechVoice | null;
  rate: number;
  autoAdvance: boolean;
  error: string | null;
  sampleVoiceId: string | null;
}

export interface PrefsStore {
  get(): ReadAloudPrefs;
  set(prefs: ReadAloudPrefs): void;
}

export function memoryPrefs(initial: ReadAloudPrefs = DEFAULT_PREFS): PrefsStore {
  let prefs = initial;
  return { get: () => prefs, set: (p) => (prefs = p) };
}

/** The key `ReadAloudChapter` uses for a chapter in a translation. */
export function readAloudKey(bookNumber: number, chapter: number, translation: TranslationId): string {
  return `${bookNumber}:${chapter}:${translation}`;
}

interface Queued {
  verse: number;
  text: string;
}

export interface Timers {
  setTimeout(fn: () => void, ms: number): unknown;
  clearTimeout(handle: unknown): void;
}

const GLOBAL_TIMERS: Timers = {
  setTimeout: (fn, ms) => setTimeout(fn, ms),
  clearTimeout: (h) => clearTimeout(h as ReturnType<typeof setTimeout>),
};

/** How long a piece may run before the watchdog calls it interrupted: twice the (slow) estimate, plus slack. */
export function watchdogMs(text: string, group: SpeechGroup, rate: number): number {
  return Math.round(estimateSeconds(text, group, rate) * 2000) + 5000;
}

export class ReadAloudController {
  private readonly engine: SpeechEngine;
  private readonly prefs: PrefsStore;
  private readonly listeners = new Set<() => void>();
  private state: ReadAloudState;
  private gen = 0;
  private chapter: ReadAloudChapter | null = null;
  private queue: Queued[] = [];
  private index = 0;
  private pieces: string[] = [];
  private piece = 0;
  /** The voice the current verse started with: a new choice applies from the next verse. */
  private verseVoice: SpeechVoice | null = null;
  private voices: SpeechVoice[] = [];
  /** Pause pressed while the voices were loading: start lands on `paused` instead of speaking. */
  private pauseRequested = false;
  private readonly timers: Timers;
  private watchdog: unknown = null;

  constructor(opts: { engine: SpeechEngine; prefs?: PrefsStore; timers?: Timers }) {
    this.engine = opts.engine;
    this.prefs = opts.prefs ?? memoryPrefs();
    this.timers = opts.timers ?? GLOBAL_TIMERS;
    const p = this.prefs.get();
    this.state = idleState(p);
  }

  // ---- For useSyncExternalStore ----
  getState = (): ReadAloudState => this.state;
  subscribe = (listener: () => void): (() => void) => {
    this.listeners.add(listener);
    return () => this.listeners.delete(listener);
  };

  // ---- Playback ----

  /** Reads `chapter` from `fromVerse` (the first verse on screen, decision 3), or from its start. */
  async start(chapter: ReadAloudChapter, fromVerse?: number): Promise<void> {
    this.engine.unlock?.();
    this.halt();
    this.pauseRequested = false;
    const gen = this.gen;
    const { group } = speechLanguageFor(chapter.translation);
    this.chapter = chapter;
    this.queue = chapter.verses
      .map((v) => ({ verse: v.verse, text: speakableText(v.text) }))
      .filter((v) => v.text.length > 0)
      .sort((a, b) => a.verse - b.verse);
    const start = fromVerse === undefined ? 0 : this.queue.findIndex((v) => v.verse >= fromVerse);
    this.set({
      ...idleState(this.prefs.get()),
      status: 'preparing',
      chapterKey: chapter.key,
      translation: chapter.translation,
      group,
      total: this.queue.length,
      verse: this.queue[start]?.verse ?? null,
      position: start >= 0 ? start + 1 : 0,
    });

    let voices: SpeechVoice[] = [];
    try {
      voices = await this.engine.getVoices();
    } catch {
      voices = [];
    }
    if (gen !== this.gen) return;
    this.voices = voices;
    const voice = pickVoice(voices, chapter.translation, this.prefs.get().voices[group]);
    if (!voice) {
      this.set({ status: 'no-voice' });
      return;
    }
    this.set({ voice });

    if (this.queue.length === 0 || start < 0) {
      this.finishChapter();
      return;
    }
    this.index = start;
    if (this.pauseRequested) {
      this.pauseRequested = false;
      const item = this.queue[start];
      this.set({ status: 'paused', verse: item?.verse ?? null, position: start + 1 });
      return;
    }
    this.speakVerse();
  }

  /** Stops after the current word; Play restarts the verse from its beginning (decision 6). */
  pause(): void {
    if (this.state.status === 'preparing') {
      this.pauseRequested = true;
      return;
    }
    if (this.state.status !== 'playing') return;
    this.halt();
    this.set({ status: 'paused' });
  }

  /** Plays the current verse from its beginning: after a pause, an interruption or an error. */
  resume(): void {
    const s = this.state.status;
    if (s === 'preparing') {
      this.pauseRequested = false;
      return;
    }
    if (s !== 'paused' && s !== 'error') return;
    // A sample may still be speaking: native speech would queue the verse behind it.
    this.halt();
    this.set({ following: true });
    this.speakVerse();
  }

  toggle(): void {
    const s = this.state.status;
    if (s === 'playing' || (s === 'preparing' && !this.pauseRequested)) this.pause();
    else this.resume();
  }

  next(): void {
    this.move(this.index + 1);
  }

  /** The previous verse; on the first verse, the first verse again. */
  prev(): void {
    this.move(Math.max(0, this.index - 1));
  }

  /** Stops reading and closes the bar. */
  stop(): void {
    this.halt();
    this.chapter = null;
    this.queue = [];
    this.set(idleState(this.prefs.get()));
  }

  /** Leaving the Bible tab stops reading (decision 13). */
  leave(): void {
    if (this.state.status !== 'idle') this.stop();
  }

  /**
   * The reader now shows `key` (null while nothing is loaded). Another chapter or translation stops
   * reading (decision 13), except the one auto-advance is waiting for.
   */
  chapterChanged(key: string | null): void {
    const s = this.state;
    if (s.status === 'idle' || key === s.chapterKey) return;
    // Turning to the next chapter keeps the end-of-chapter offer, in whichever order the UI turns the
    // page and calls playNextChapter.
    const waiting = s.status === 'advancing' || s.status === 'ended';
    if (waiting && (key === null || key === this.chapter?.nextKey)) return;
    this.stop();
  }

  /** "Play John 4" on the end-of-chapter card: wait for the next chapter like auto-advance does. */
  playNextChapter(): void {
    if (this.state.status === 'ended' && this.chapter?.nextKey) this.set({ status: 'advancing' });
  }

  /** The chapter auto-advance (or Play next) was waiting for has loaded: read it from verse 1. */
  continueInto(chapter: ReadAloudChapter): void {
    if (this.state.status !== 'advancing' || chapter.key !== this.chapter?.nextKey) return;
    void this.start(chapter);
  }

  // ---- Following the text ----

  /** The user scrolled by hand: stop keeping the verse in view (decision 5). */
  userScrolled(): void {
    if (this.state.following && this.isActive()) this.set({ following: false });
  }

  /** "Back to verse N". */
  backToVerse(): void {
    if (!this.state.following) this.set({ following: true });
  }

  // ---- Voice and speed ----

  setRate(rate: number): void {
    if (!(RATES as readonly number[]).includes(rate)) return;
    this.savePrefs({ rate });
    this.set({ rate });
  }

  setAutoAdvance(on: boolean): void {
    this.savePrefs({ autoAdvance: on });
    this.set({ autoAdvance: on });
  }

  /** The voices that may read `translation`, best first. Empty: the device has none (decision 11). */
  async listVoices(translation: TranslationId): Promise<SpeechVoice[]> {
    try {
      this.voices = await this.engine.getVoices();
    } catch {
      this.voices = [];
    }
    return voicesFor(this.voices, translation);
  }

  /**
   * Chooses the voice for `translation`'s language (remembered on this device). While reading, the
   * new voice starts at the next verse. Returns false for a voice that may not read that language.
   */
  setVoice(voiceId: string, translation: TranslationId | null = this.state.translation): boolean {
    if (!translation) return false;
    const voice = voicesFor(this.voices, translation).find((v) => v.id === voiceId);
    if (!voice) return false;
    const { group } = speechLanguageFor(translation);
    this.savePrefs({ voices: { ...this.prefs.get().voices, [group]: voiceId } });
    if (group === this.state.group) this.set({ voice });
    return true;
  }

  /** Plays a sample of a voice. It pauses reading first: the device speaks one thing at a time. */
  sample(voiceId: string, text: string, translation: TranslationId | null = this.state.translation): void {
    // While the voice list loads for a start, a sample would cancel that start; the sheet opens later anyway.
    if (!translation || this.state.status === 'preparing') return;
    const voice = voicesFor(this.voices, translation).find((v) => v.id === voiceId);
    if (!voice) return;
    if (this.state.status === 'playing') this.pause();
    this.halt();
    const gen = this.gen;
    this.set({ sampleVoiceId: voice.id });
    const finish = () => {
      if (gen === this.gen) this.set({ sampleVoiceId: null });
    };
    this.engine.speak(text, {
      lang: langOf(voice, translation),
      voiceId: voice.id,
      rate: this.state.rate,
      onDone: finish,
      onError: finish,
    });
  }

  stopSample(): void {
    if (this.state.sampleVoiceId !== null) this.halt();
  }

  /** Stops everything and drops listeners (the hook's unmount). */
  dispose(): void {
    this.stop();
    this.listeners.clear();
  }

  // ---- Internals ----

  private isActive(): boolean {
    return this.state.status === 'playing' || this.state.status === 'paused';
  }

  private move(to: number): void {
    if (!this.isActive()) return;
    if (to >= this.queue.length) {
      // Paused, Next past the end only ends: it never starts the next chapter by itself.
      const playing = this.state.status === 'playing';
      this.halt();
      this.finishChapter(playing);
      return;
    }
    this.index = to;
    if (this.state.status === 'playing') {
      this.halt();
      this.set({ following: true });
      this.speakVerse();
    } else {
      this.set({ verse: this.queue[to]?.verse ?? null, position: to + 1, following: true });
    }
  }

  private speakVerse(): void {
    const item = this.queue[this.index];
    const translation = this.state.translation;
    const group = this.state.group;
    if (!item || !translation || !group) return;
    this.verseVoice = this.state.voice;
    this.pieces = chunkForSpeech(item.text, maxPieceLength(group, this.state.rate));
    this.piece = 0;
    // `following` is left as it is: a verse that starts by itself never scrolls back a user who scrolled away.
    this.set({ status: 'playing', verse: item.verse, position: this.index + 1, error: null });
    this.speakPiece();
  }

  private speakPiece(): void {
    const text = this.pieces[this.piece];
    const voice = this.verseVoice;
    const translation = this.state.translation;
    const group = this.state.group;
    if (text === undefined || !voice || !translation || !group) return;
    const gen = ++this.gen;
    const rate = this.state.rate;
    this.clearWatchdog();
    this.watchdog = this.timers.setTimeout(() => {
      if (gen !== this.gen) return;
      this.halt();
      this.set({ status: 'paused' });
    }, watchdogMs(text, group, rate));
    this.engine.speak(text, {
      lang: langOf(voice, translation),
      voiceId: voice.id,
      rate,
      onDone: () => {
        if (gen !== this.gen) return;
        this.clearWatchdog();
        this.piece++;
        if (this.piece < this.pieces.length) {
          this.speakPiece();
          return;
        }
        this.index++;
        if (this.index < this.queue.length) this.speakVerse();
        else this.finishChapter();
      },
      onError: (err) => {
        if (gen !== this.gen) return;
        this.clearWatchdog();
        this.gen++;
        // Cut off from outside (a call, another app's audio, the browser): pause on this verse.
        if (err.name === 'interrupted') this.set({ status: 'paused' });
        else this.set({ status: 'error', error: err.message });
      },
    });
  }

  private finishChapter(mayAdvance = true): void {
    this.gen++;
    this.clearWatchdog();
    const advance = mayAdvance && this.state.autoAdvance && !!this.chapter?.nextKey;
    this.set({ status: advance ? 'advancing' : 'ended', verse: null, position: this.queue.length, following: true });
  }

  /** Silences the engine and invalidates every callback from speech started before now. */
  private halt(): void {
    this.gen++;
    this.clearWatchdog();
    this.engine.stop();
    if (this.state.sampleVoiceId !== null) this.set({ sampleVoiceId: null });
  }

  private clearWatchdog(): void {
    if (this.watchdog !== null) this.timers.clearTimeout(this.watchdog);
    this.watchdog = null;
  }

  private savePrefs(patch: Partial<ReadAloudPrefs>): void {
    try {
      this.prefs.set({ ...this.prefs.get(), ...patch });
    } catch {
      // A store that rejects the value keeps the old one; the session still uses the new choice.
    }
  }

  private set(patch: Partial<ReadAloudState>): void {
    this.state = { ...this.state, ...patch };
    this.listeners.forEach((l) => l());
  }
}

function idleState(p: ReadAloudPrefs): ReadAloudState {
  return {
    status: 'idle',
    chapterKey: null,
    translation: null,
    group: null,
    verse: null,
    position: 0,
    total: 0,
    following: true,
    voice: null,
    rate: p.rate,
    autoAdvance: p.autoAdvance,
    error: null,
    sampleVoiceId: null,
  };
}

/** The tag sent with the text: the voice's own (underscores mended), else the translation's. */
function langOf(voice: SpeechVoice, translation: TranslationId): string {
  return voice.lang ? voice.lang.replace(/_/g, '-') : speechLanguageFor(translation).tag;
}
