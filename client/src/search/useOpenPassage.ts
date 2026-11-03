// Opening a search result (or any passage) in the reader. With verses, the reader selects and scrolls to them
// (see useOpenInReader); without, it opens the chapter at the top, keeping the reader's translation.
import { router } from 'expo-router';
import { useCallback, useMemo } from 'react';

import { useReaderPosition } from '../reader/state';
import { readerTargets, useOpenInReader } from '../reader/target';
import { readerPositionKey } from '../storage/keys';
import { getStorage, type Storage } from '../storage/storage';
import type { PassageRef } from './types';

const goToBibleTab = () => router.navigate('/bible');

export function useOpenPassage(opts?: { storage?: Storage; navigate?: () => void }): (ref: PassageRef) => void {
  const storage = useMemo(() => opts?.storage ?? getStorage(), [opts?.storage]);
  const navigate = opts?.navigate ?? goToBibleTab;
  const { position, setPosition } = useReaderPosition({ storage });
  const openInReader = useOpenInReader({ storage, navigate });

  return useCallback(
    (ref: PassageRef) => {
      const chapter = ref.chapter ?? 1;
      if (ref.start !== undefined) {
        openInReader({ bookNumber: ref.bookNumber, chapter, start: ref.start, end: ref.end ?? ref.start });
        return;
      }
      // A chapter with no verses: drop any target still waiting for the reader, then move there.
      readerTargets.clear();
      // The translation the reader is in now: the stored one, which may be newer than this render's.
      const translation = storage.get(readerPositionKey)?.translation ?? position.translation;
      setPosition({ bookNumber: ref.bookNumber, chapter, translation });
      navigate();
    },
    [navigate, openInReader, position.translation, setPosition, storage],
  );
}
