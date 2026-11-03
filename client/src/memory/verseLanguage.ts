// Which language the Memory verses are shown, spoken and graded in: they follow the app's interface language
// (English interface -> English verses; 中文 -> the Chinese Union Version, as before). Progress is per verse id, so
// both languages share it.
import { createContext, useContext, useEffect } from 'react';

import { useI18n } from '../i18n/I18nProvider';
import { detectLocale, getDeviceLocales, resolveLocale } from '../i18n/locale';
import type { AppLocale } from '../i18n/types';
import { languageKey } from '../storage/keys';
import type { Storage } from '../storage/storage';
import type { ChineseScript, LibraryVerse } from './types';

export type VerseLanguage = 'zh' | 'en';

export function verseLanguageFor(locale: AppLocale): VerseLanguage {
  return locale === 'en' ? 'en' : 'zh';
}

/**
 * Pins the verse language regardless of the interface language. The app never mounts it (its verses follow the app
 * language); the Memory test harness does, so the suites written before English Memory keep exercising the Chinese
 * verses under the English interface they render in.
 */
export const VerseLanguageOverride = createContext<VerseLanguage | null>(null);

/** The verse language for the current interface language. */
export function useVerseLanguage(): VerseLanguage {
  const { locale } = useI18n();
  return useContext(VerseLanguageOverride) ?? verseLanguageFor(locale);
}

/**
 * Calls `onChange` synchronously, from the storage's change listener, as soon as the stored interface language
 * changes so that the verse language is no longer `current`: before React renders the new language. A change of the
 * stored preference that keeps the verse language (`system` that resolves to the same locale) calls nothing, and
 * neither does anything while the verse language is pinned (`VerseLanguageOverride`).
 *
 * `system` resolves exactly as `I18nProvider` resolves it: while the preference is `system` the provider's locale
 * is that resolution; otherwise it is the phone's languages, which the provider reads too.
 */
export function useVerseLanguageChange(storage: Storage, current: VerseLanguage, onChange: () => void): void {
  const { locale, preference } = useI18n();
  const pinned = useContext(VerseLanguageOverride) !== null;
  const systemLocale = preference === 'system' ? locale : null;
  useEffect(() => {
    if (pinned) return undefined;
    const check = () => {
      const pref = storage.get(languageKey);
      const resolved =
        pref === 'system' ? (systemLocale ?? detectLocale(getDeviceLocales())) : resolveLocale(pref, []);
      if (verseLanguageFor(resolved) !== current) onChange();
    };
    const unsubscribe = storage.subscribe(languageKey, check);
    // A change between this render and the subscription counts too.
    check();
    return unsubscribe;
  }, [storage, current, onChange, pinned, systemLocale]);
}

export interface VerseView {
  text: string;
  chunks: readonly string[];
  reference: string;
  /** The `lang` attribute for the verse text on the web. */
  lang: 'en' | 'zh-Hans' | 'zh-Hant';
}

/**
 * What a screen draws for `verse`: the English text, chunks and reference, or the Chinese ones in the reader's
 * script. The one place a screen picks its verse text. (Grading never reads it: it runs on `textEn`/`chunksEn` or the
 * simplified `textZh`/`chunks`.)
 */
export function verseView(verse: LibraryVerse, language: VerseLanguage, script: ChineseScript): VerseView {
  if (language === 'en') return { text: verse.textEn, chunks: verse.chunksEn, reference: verse.referenceEn, lang: 'en' };
  if (script === 'traditional') {
    return { text: verse.textZhHant, chunks: verse.chunksHant, reference: verse.referenceZhHant, lang: 'zh-Hant' };
  }
  return { text: verse.textZh, chunks: verse.chunks, reference: verse.referenceZh, lang: 'zh-Hans' };
}
