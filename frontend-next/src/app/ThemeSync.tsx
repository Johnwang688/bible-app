'use client';

import { useEffect, useState } from 'react';
import { THEME_CHANGE_EVENT, normalizeThemeId, resolveAppliedTheme, subscribeDeviceTheme, type ThemePreference } from '@/lib/themes';

const DARK_QUERY = '(prefers-color-scheme: dark)';

/**
 * Paints `<html data-theme>` on every route. The pre-paint script in the root layout owns the first
 * paint; this keeps it in step with the stored preference and, for Auto only, with the device.
 */
export default function ThemeSync() {
  const [pref, setPref] = useState<ThemePreference | null>(null);

  // Reads the stored preference, and follows changes from this tab and from other tabs.
  useEffect(() => {
    const read = () => setPref(normalizeThemeId(localStorage.getItem('theme')));
    const onStorage = (e: StorageEvent) => {
      if (e.key === null || e.key === 'theme') read();
    };
    read();
    window.addEventListener('storage', onStorage);
    window.addEventListener(THEME_CHANGE_EVENT, read);
    return () => {
      window.removeEventListener('storage', onStorage);
      window.removeEventListener(THEME_CHANGE_EVENT, read);
    };
  }, []);

  // Paints now, and re-paints on a device change when the preference is Auto.
  useEffect(() => {
    if (pref === null) return;
    const mq = window.matchMedia(DARK_QUERY);
    const paint = (prefersDark: boolean) =>
      document.documentElement.setAttribute('data-theme', resolveAppliedTheme(pref, prefersDark));
    paint(mq.matches);
    return subscribeDeviceTheme(pref, mq, paint);
  }, [pref]);

  return null;
}
