// Opening a passage in the reader from another tab ("open it in context"): the Study list, and later Home
// and search. The caller moves the reader to the chapter (keeping its translation), leaves a target for the
// reader, and switches to the Bible tab. The reader takes the target once that chapter is showing: it
// selects the verses (sheet closed), scrolls them into view and moves focus to the first one.
//
// The target lives in memory only: it means "show this now", not a place to come back to.
import { router } from 'expo-router';
import { useCallback, useMemo, useSyncExternalStore } from 'react';

import { readerPositionKey } from '../storage/keys';
import { getStorage, type Storage } from '../storage/storage';
import { useReaderPosition } from './state';

export interface ReaderTarget {
  bookNumber: number;
  chapter: number;
  start: number;
  end: number;
}

let pending: ReaderTarget | null = null;
const listeners = new Set<() => void>();
const notify = () => listeners.forEach((l) => l());

export const readerTargets = {
  get: (): ReaderTarget | null => pending,
  set(t: ReaderTarget) {
    pending = { ...t };
    notify();
  },
  /**
   * The reader calls this with the object `get()` returned, once it has shown it. A no-op if a newer target
   * replaced it, even one for the same verses (each `set` makes a new object).
   */
  done(t: ReaderTarget) {
    if (pending === t) {
      pending = null;
      notify();
    }
  },
  clear() {
    pending = null;
    notify();
  },
  subscribe(l: () => void) {
    listeners.add(l);
    return () => void listeners.delete(l);
  },
};

/** The target waiting for the reader, if any. */
export function usePendingReaderTarget(): ReaderTarget | null {
  return useSyncExternalStore(readerTargets.subscribe, readerTargets.get, readerTargets.get);
}

const goToBibleTab = () => router.navigate('/bible');

/** Returns `open(target)`: moves the reader there (same translation) and shows the Bible tab. */
export function useOpenInReader(opts?: { storage?: Storage; navigate?: () => void }): (t: ReaderTarget) => void {
  const storage = useMemo(() => opts?.storage ?? getStorage(), [opts?.storage]);
  const { position, setPosition } = useReaderPosition({ storage });
  const navigate = opts?.navigate ?? goToBibleTab;
  return useCallback(
    (t: ReaderTarget) => {
      // The translation the reader is in now: the stored one, which may be newer than this render's.
      const translation = storage.get(readerPositionKey)?.translation ?? position.translation;
      readerTargets.set(t);
      setPosition({ bookNumber: t.bookNumber, chapter: t.chapter, translation });
      navigate();
    },
    [navigate, position.translation, setPosition, storage],
  );
}
