// The reader's hook onto read aloud. The reader passes the chapter it shows (first translation only)
// and whether the Bible tab is showing; it gets the state to draw and the actions for the bar.
import { useEffect, useMemo, useState, useSyncExternalStore } from 'react';

import { getStorage, type Storage } from '../storage/storage';
import type { TranslationId } from '../reader/translations';
import {
  ReadAloudController,
  readAloudKey,
  type PrefsStore,
  type ReadAloudChapter,
  type ReadAloudState,
  type ReadAloudVerse,
} from './controller';
import { createSpeechEngine } from './engine';
import { readAloudPrefsKey } from './keys';
import type { SpeechEngine, SpeechVoice } from './types';

export function storagePrefs(storage: Storage): PrefsStore {
  return { get: () => storage.get(readAloudPrefsKey), set: (p) => storage.set(readAloudPrefsKey, p) };
}

interface Position {
  bookNumber: number;
  chapter: number;
}

/**
 * The chapter read aloud reads: the FIRST translation's, also in parallel reading (decision 10).
 * Null until that translation's chapter has loaded. `next` is the next chapter's position, or null.
 */
export function readAloudChapter(
  position: Position,
  translations: readonly TranslationId[],
  chapters: Partial<Record<TranslationId, { verses: readonly ReadAloudVerse[] }>>,
  next: Position | null,
): ReadAloudChapter | null {
  const translation = translations[0];
  if (!translation) return null;
  const loaded = chapters[translation];
  if (!loaded) return null;
  return {
    key: readAloudKey(position.bookNumber, position.chapter, translation),
    translation,
    verses: loaded.verses.map((v) => ({ verse: v.verse, text: v.text })),
    nextKey: next ? readAloudKey(next.bookNumber, next.chapter, translation) : null,
  };
}

export interface UseReadAloudOptions {
  /** The chapter on screen (from `readAloudChapter`), or null while it loads. */
  chapter: ReadAloudChapter | null;
  /** False when the Bible tab is not the one showing: reading stops (decision 13). */
  active: boolean;
  /** Tests pass a fake; the app uses the platform's engine. Read once, on mount. */
  engine?: SpeechEngine;
  storage?: Storage;
}

export interface ReadAloud extends ReadAloudState {
  /** Starts reading this chapter from `fromVerse` (the first verse on screen), or from verse 1. */
  start(fromVerse?: number): void;
  pause(): void;
  resume(): void;
  toggle(): void;
  next(): void;
  prev(): void;
  stop(): void;
  playNextChapter(): void;
  userScrolled(): void;
  backToVerse(): void;
  setRate(rate: number): void;
  setAutoAdvance(on: boolean): void;
  setVoice(voiceId: string): boolean;
  listVoices(): Promise<SpeechVoice[]>;
  sample(voiceId: string, text: string): void;
}

export function useReadAloud({ chapter, active, engine, storage }: UseReadAloudOptions): ReadAloud {
  const [controller] = useState(
    () => new ReadAloudController({ engine: engine ?? createSpeechEngine(), prefs: storagePrefs(storage ?? getStorage()) }),
  );
  const state = useSyncExternalStore(controller.subscribe, controller.getState, controller.getState);

  const key = chapter?.key ?? null;
  useEffect(() => {
    controller.chapterChanged(key);
  }, [controller, key]);

  // Auto-advance (or "Play John 4"): once the reader has turned to the next chapter and it has loaded.
  useEffect(() => {
    if (state.status === 'advancing' && chapter) controller.continueInto(chapter);
  }, [controller, state.status, chapter]);

  useEffect(() => {
    if (!active) controller.leave();
  }, [controller, active]);

  useEffect(() => () => controller.dispose(), [controller]);

  const translation = chapter?.translation ?? null;
  const actions = useMemo(
    () => ({
      start: (fromVerse?: number) => {
        if (chapter) void controller.start(chapter, fromVerse);
      },
      pause: () => controller.pause(),
      resume: () => controller.resume(),
      toggle: () => controller.toggle(),
      next: () => controller.next(),
      prev: () => controller.prev(),
      stop: () => controller.stop(),
      playNextChapter: () => controller.playNextChapter(),
      userScrolled: () => controller.userScrolled(),
      backToVerse: () => controller.backToVerse(),
      setRate: (rate: number) => controller.setRate(rate),
      setAutoAdvance: (on: boolean) => controller.setAutoAdvance(on),
      setVoice: (voiceId: string) => controller.setVoice(voiceId, translation),
      listVoices: () => (translation ? controller.listVoices(translation) : Promise.resolve([])),
      sample: (voiceId: string, text: string) => controller.sample(voiceId, text, translation),
    }),
    [controller, chapter, translation],
  );

  return { ...state, ...actions };
}
