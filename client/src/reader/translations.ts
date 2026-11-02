// The translations the reader offers. Owned by the orchestrator (R-1).
// The backend lists KJV too, but it has no text yet, so it is not offered.
import type { MessageKey } from '../i18n/messages/en';

export const TRANSLATION_IDS = ['BSB', 'WEB', 'ASV', 'CUV-SIMP', 'CUV'] as const;
export type TranslationId = (typeof TRANSLATION_IDS)[number];

export interface TranslationMeta {
  id: TranslationId;
  language: 'en' | 'zh';
  /** Short label for the reader header. */
  shortKey: MessageKey;
  /** Full name for pickers and screen readers. */
  nameKey: MessageKey;
}

export const TRANSLATIONS: Record<TranslationId, TranslationMeta> = {
  BSB: { id: 'BSB', language: 'en', shortKey: 'translation.BSB.short', nameKey: 'translation.BSB.name' },
  WEB: { id: 'WEB', language: 'en', shortKey: 'translation.WEB.short', nameKey: 'translation.WEB.name' },
  ASV: { id: 'ASV', language: 'en', shortKey: 'translation.ASV.short', nameKey: 'translation.ASV.name' },
  'CUV-SIMP': {
    id: 'CUV-SIMP',
    language: 'zh',
    shortKey: 'translation.CUV-SIMP.short',
    nameKey: 'translation.CUV-SIMP.name',
  },
  CUV: { id: 'CUV', language: 'zh', shortKey: 'translation.CUV.short', nameKey: 'translation.CUV.name' },
};

export function isChineseTranslation(id: TranslationId): boolean {
  return TRANSLATIONS[id].language === 'zh';
}
