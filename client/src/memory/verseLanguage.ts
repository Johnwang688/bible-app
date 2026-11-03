// Which language the Memory verses are shown, spoken and graded in: they follow the app's interface language
// (English interface -> English verses; 中文 -> the Chinese Union Version, as before). Progress is per verse id, so
// both languages share it.
import { createContext, useContext, useEffect } from 'react';

import { useI18n } from '../i18n/I18nProvider';
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
 * Calls `onChange` synchronously, from the storage's change listener, on **any** change of the stored interface
 * language preference (`languageKey`), before React renders the new language, whatever the new value resolves to.
 * It does not try to work out whether the verse language changed (`system` follows device locales that can differ
 * from the ones `I18nProvider` resolved): a preference change, made from the Me tab, simply leaves the step, which is
 * harmless and never misses a switch. Nothing is called while the verse language is pinned
 * (`VerseLanguageOverride`).
 */
export function useLanguagePreferenceChange(storage: Storage, onChange: () => void): void {
  const pinned = useContext(VerseLanguageOverride) !== null;
  // The preference this render was drawn with: a change between the render and the subscription counts too.
  const rendered = storage.get(languageKey);
  useEffect(() => {
    if (pinned) return undefined;
    let seen = rendered;
    const check = () => {
      const pref = storage.get(languageKey);
      if (pref === seen) return;
      seen = pref;
      onChange();
    };
    const unsubscribe = storage.subscribe(languageKey, check);
    check();
    return unsubscribe;
  }, [storage, onChange, pinned, rendered]);
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
