// Highlights, notes and bookmarks, kept on the device and keyed by verse reference (so they show in every
// translation). Every write reads the latest stored value, never the render snapshot, so several writes in
// one tick all land.
import { useEffect, useMemo, useRef } from 'react';

import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import { refKey, studyItemsKey, type StudyItems, type VerseRef } from '../storage/keys';
import type { HighlightId } from '../theme/highlights';

export interface UseStudyItemsOptions {
  storage?: Storage;
  now?: () => Date;
}

export interface StudyItemsApi {
  items: StudyItems;
  highlightOf(ref: VerseRef): HighlightId | null;
  /** `null` clears the highlight. */
  setHighlight(refs: VerseRef[], colour: HighlightId | null): void;
  isBookmarked(ref: VerseRef): boolean;
  /** Removes the bookmarks if every verse is bookmarked; otherwise adds the missing ones. */
  toggleBookmark(refs: VerseRef[]): void;
  noteOf(ref: VerseRef): { text: string; updatedAt: string } | null;
  /** Trims. Empty text deletes the note. Throws, keeping the old note, if the text is over the limit. */
  setNote(ref: VerseRef, text: string): void;
}

const defaultNow = () => new Date();

export function useStudyItems(opts?: UseStudyItemsOptions): StudyItemsApi {
  const storage = opts?.storage ?? getStorage();
  const now = opts?.now ?? defaultNow;
  const [items] = useStoredValue(storage, studyItemsKey);

  // Callers usually pass a fresh `now` each render. The latest one is kept in a ref so the returned object
  // stays stable (it only changes with the stored items).
  const nowRef = useRef(now);
  useEffect(() => {
    nowRef.current = now;
  });

  return useMemo<StudyItemsApi>(() => {
    const update = (change: (latest: StudyItems) => void) => {
      const latest = storage.get(studyItemsKey);
      change(latest);
      storage.set(studyItemsKey, latest);
    };
    return {
      items,
      highlightOf: (ref) => items.highlights[refKey(ref)]?.colour ?? null,
      setHighlight: (refs, colour) =>
        update((latest) => {
          const updatedAt = nowRef.current().toISOString();
          for (const ref of refs) {
            const k = refKey(ref);
            if (colour === null) delete latest.highlights[k];
            // Setting the colour a verse already has keeps its time.
            else if (latest.highlights[k]?.colour !== colour) latest.highlights[k] = { colour, updatedAt };
          }
        }),
      isBookmarked: (ref) => refKey(ref) in items.bookmarks,
      toggleBookmark: (refs) =>
        update((latest) => {
          const keys = refs.map(refKey);
          if (keys.length > 0 && keys.every((k) => k in latest.bookmarks)) {
            for (const k of keys) delete latest.bookmarks[k];
          } else {
            const createdAt = nowRef.current().toISOString();
            for (const k of keys) if (!(k in latest.bookmarks)) latest.bookmarks[k] = { createdAt };
          }
        }),
      noteOf: (ref) => items.notes[refKey(ref)] ?? null,
      setNote: (ref, text) =>
        update((latest) => {
          const trimmed = text.trim();
          if (trimmed === '') delete latest.notes[refKey(ref)];
          else latest.notes[refKey(ref)] = { text: trimmed, updatedAt: nowRef.current().toISOString() };
        }),
    };
  }, [storage, items]);
}
