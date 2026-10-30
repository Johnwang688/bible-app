'use client';

import { createContext, useContext, useEffect, useMemo, useRef, useState } from 'react';
import type { Dispatch, ReactNode, SetStateAction } from 'react';
import { DEFAULT_READER_SETTINGS } from '@/features/reader/settings';
import type { ReaderSettings } from '@/features/reader/types';
import { READER_SETTINGS_STORAGE_KEY } from '@/features/progress/progress';
import { readStoredReaderSettings } from '@/lib/localState';

interface ReaderSettingsContextValue {
  readerSettings: ReaderSettings;
  setReaderSettings: Dispatch<SetStateAction<ReaderSettings>>;
}

const ReaderSettingsContext = createContext<ReaderSettingsContextValue | null>(null);

export function ReaderSettingsProvider({ children }: { children: ReactNode }) {
  const [readerSettings, setReaderSettings] = useState<ReaderSettings>(DEFAULT_READER_SETTINGS);
  /** Set once the stored value has been read; saves are skipped until then. */
  const loadedRef = useRef(false);

  // Declared before the load effect on purpose: on the mount commit this runs first, still sees
  // loadedRef false, and so cannot overwrite the stored value with the defaults before it is read.
  useEffect(() => {
    if (typeof window === 'undefined' || !loadedRef.current) return;
    window.localStorage.setItem(READER_SETTINGS_STORAGE_KEY, JSON.stringify(readerSettings));
  }, [readerSettings]);

  useEffect(() => {
    loadedRef.current = true;
    setReaderSettings(readStoredReaderSettings());
    return () => { loadedRef.current = false; };
  }, []);

  const value = useMemo(() => ({ readerSettings, setReaderSettings }), [readerSettings]);
  return <ReaderSettingsContext.Provider value={value}>{children}</ReaderSettingsContext.Provider>;
}

export function useReaderSettings(): ReaderSettingsContextValue {
  const ctx = useContext(ReaderSettingsContext);
  if (!ctx) throw new Error('useReaderSettings must be used within a ReaderSettingsProvider');
  return ctx;
}
