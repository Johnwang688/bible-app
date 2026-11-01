'use client';

import { useEffect } from 'react';
import { resolveAppliedTheme, subscribeDeviceTheme } from '@/lib/themes';
import { useThemePreference } from '@/lib/useThemePreference';

const DARK_QUERY = '(prefers-color-scheme: dark)';

/**
 * Paints `<html data-theme>` on every route. The pre-paint script in the root layout owns the first
 * paint; this keeps it in step with the stored preference (this tab and other tabs, through
 * `useThemePreference`) and, for Auto only, with the device.
 */
export default function ThemeSync() {
  const [pref] = useThemePreference();

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
