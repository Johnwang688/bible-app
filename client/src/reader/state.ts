// Persisted reader state: where the reader is, the recent passages and the reading settings.
import { useCallback, useMemo, useState } from 'react';

import { defaultTranslation, getDeviceLocales } from '../i18n/locale';
import type { DeviceLocale } from '../i18n/types';
import {
  readerPositionKey,
  readingSettingsKey,
  recentPassagesKey,
  RECENT_LIMIT,
  type ReaderPosition,
  type ReadingSettings,
} from '../storage/keys';
import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import type { Position } from './navigation';

export const DEFAULT_POSITION: Position = { bookNumber: 1, chapter: 1 };

export function useReaderPosition(opts?: { storage?: Storage; locales?: readonly DeviceLocale[] }): {
  position: ReaderPosition;
  setPosition(p: ReaderPosition): void;
} {
  const storage = useMemo(() => opts?.storage ?? getStorage(), [opts?.storage]);
  const [locales] = useState<readonly DeviceLocale[]>(() => opts?.locales ?? getDeviceLocales());
  const [stored] = useStoredValue(storage, readerPositionKey);

  const position = useMemo<ReaderPosition>(
    () => stored ?? { ...DEFAULT_POSITION, translation: defaultTranslation(locales) },
    [stored, locales],
  );

  const setPosition = useCallback(
    (p: ReaderPosition) => {
      storage.set(readerPositionKey, p);
      const rest = storage
        .get(recentPassagesKey)
        .filter((r) => r.bookNumber !== p.bookNumber || r.chapter !== p.chapter);
      storage.set(recentPassagesKey, [p, ...rest].slice(0, RECENT_LIMIT));
    },
    [storage],
  );

  return useMemo(() => ({ position, setPosition }), [position, setPosition]);
}

export function useReadingSettings(opts?: { storage?: Storage }): [ReadingSettings, (s: ReadingSettings) => void] {
  const storage = useMemo(() => opts?.storage ?? getStorage(), [opts?.storage]);
  return useStoredValue(storage, readingSettingsKey);
}
