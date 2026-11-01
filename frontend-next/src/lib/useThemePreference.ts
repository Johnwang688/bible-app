'use client';

import { useCallback, useSyncExternalStore } from 'react';
import { THEME_CHANGE_EVENT, normalizeThemeId, type ThemePreference } from '@/lib/themes';

const STORAGE_KEY = 'theme';

function subscribe(onChange: () => void): () => void {
  const onStorage = (e: StorageEvent) => {
    if (e.key === null || e.key === STORAGE_KEY) onChange();
  };
  window.addEventListener('storage', onStorage);
  window.addEventListener(THEME_CHANGE_EVENT, onChange);
  return () => {
    window.removeEventListener('storage', onStorage);
    window.removeEventListener(THEME_CHANGE_EVENT, onChange);
  };
}

const getSnapshot = (): ThemePreference => normalizeThemeId(localStorage.getItem(STORAGE_KEY));
/** On the server and during hydration the preference is unknown (the pre-paint script owns the DOM). */
const getServerSnapshot = (): ThemePreference | null => null;

/**
 * The one source of truth for the theme preference in the browser: `localStorage['theme']`,
 * normalised. Every caller follows changes from other tabs (`storage`) and from this tab
 * (`THEME_CHANGE_EVENT`). Null until hydrated. `setPref` writes storage, then dispatches the event.
 */
export function useThemePreference(): [ThemePreference | null, (pref: ThemePreference) => void] {
  const pref = useSyncExternalStore<ThemePreference | null>(subscribe, getSnapshot, getServerSnapshot);
  const setPref = useCallback((next: ThemePreference) => {
    localStorage.setItem(STORAGE_KEY, next);
    window.dispatchEvent(new Event(THEME_CHANGE_EVENT));
  }, []);
  return [pref, setPref];
}
