// Web beta helpers (B-1): the beta label on the Chinese interface choice, and the one-line beta note.
// MeScreen's language sheet uses t(languageLabelKey(value)) for option labels and shows t('beta.language.note') under them when showChineseBetaNote(). No UI lives here.
import { isBetaBuild } from '../api/config';
import type { MessageKey } from '../i18n/translate';
import type { LanguagePreference } from '../i18n/types';

/** The catalogue key for a language option's label. Simplified Chinese reads "（测试版）" in the web beta build. */
export function languageLabelKey(lang: LanguagePreference): MessageKey {
  if (isBetaBuild() && lang === 'zh-Hans') return 'beta.language.zh-Hans';
  return `language.${lang}`;
}

/** Whether the Chinese-interface beta note should be shown (web beta build only). */
export function showChineseBetaNote(): boolean {
  return isBetaBuild();
}
