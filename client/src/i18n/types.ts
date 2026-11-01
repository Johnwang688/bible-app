// Shared i18n types. Owned by the orchestrator (R-0).

/** The interface languages: English and Simplified Chinese. There is no Traditional interface. */
export type AppLocale = 'en' | 'zh-Hans';

/** Me → Language: follow the phone (the default), or a fixed language. */
export type LanguagePreference = 'system' | AppLocale;

/** The parts of an expo-localization `Locale` the app reads. */
export interface DeviceLocale {
  languageTag: string;
  languageCode: string | null;
  scriptCode?: string | null;
  regionCode: string | null;
}

/** The translation a brand-new reader starts in. */
export type StarterTranslation = 'BSB' | 'CUV-SIMP' | 'CUV';
