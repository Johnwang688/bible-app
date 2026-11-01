// Locale detection: which interface language and starter Scripture a phone's settings point to.
import { getLocales } from 'expo-localization';

import type { AppLocale, DeviceLocale, LanguagePreference, StarterTranslation } from './types';

export type { AppLocale, LanguagePreference, DeviceLocale, StarterTranslation } from './types';

function languageOf(l: DeviceLocale): string {
  return (l.languageCode ?? l.languageTag.split(/[-_]/)[0] ?? '').toLowerCase();
}

/** The first preferred language the app has an interface for, or undefined. */
function firstSupported(locales: readonly DeviceLocale[]): { app: AppLocale; device: DeviceLocale } | undefined {
  for (const device of locales) {
    const lang = languageOf(device);
    if (lang === 'en') return { app: 'en', device };
    if (lang === 'zh') return { app: 'zh-Hans', device };
  }
  return undefined;
}

export function detectLocale(locales: readonly DeviceLocale[]): AppLocale {
  return firstSupported(locales)?.app ?? 'en';
}

export function resolveLocale(pref: LanguagePreference, locales: readonly DeviceLocale[]): AppLocale {
  return pref === 'system' ? detectLocale(locales) : pref;
}

function isTraditional(l: DeviceLocale): boolean {
  const subtags = l.languageTag.split(/[-_]/).slice(1);
  const script = l.scriptCode ?? subtags.find((s) => /^[A-Za-z]{4}$/.test(s)) ?? null;
  if (script === 'Hant') return true;
  if (script === 'Hans') return false;
  if (subtags.includes('Hant')) return true;
  if (subtags.includes('Hans')) return false;
  const region = (l.regionCode ?? subtags.find((s) => /^[A-Za-z]{2}$/.test(s)) ?? '').toUpperCase();
  return region === 'TW' || region === 'HK' || region === 'MO';
}

export function defaultTranslation(locales: readonly DeviceLocale[]): StarterTranslation {
  const hit = firstSupported(locales);
  if (!hit || hit.app === 'en') return 'BSB';
  return isTraditional(hit.device) ? 'CUV' : 'CUV-SIMP';
}

export function getDeviceLocales(): DeviceLocale[] {
  try {
    return getLocales().map((l) => ({
      languageTag: l.languageTag,
      languageCode: l.languageCode ?? null,
      scriptCode: (l as { scriptCode?: string | null }).scriptCode ?? null,
      regionCode: l.regionCode ?? null,
    }));
  } catch {
    return [];
  }
}
