// The i18n provider: picks the interface language (stored choice or the phone's), exposes `t`
// and locale-aware formatting.
import { createContext, useContext, useEffect, useMemo, type ReactNode } from 'react';
import { Platform } from 'react-native';

import { languageKey } from '../storage/keys';
import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import { getDeviceLocales, resolveLocale } from './locale';
import { createT, type TFunction } from './translate';
import type { AppLocale, DeviceLocale, LanguagePreference } from './types';

export interface I18nValue {
  locale: AppLocale;
  preference: LanguagePreference;
  setPreference(p: LanguagePreference): void;
  t: TFunction;
  formatNumber(n: number, opts?: Intl.NumberFormatOptions): string;
  formatDate(d: Date, opts?: Intl.DateTimeFormatOptions): string;
}

const I18nContext = createContext<I18nValue | null>(null);

interface Props {
  children: ReactNode;
  storage?: Storage;
  locales?: readonly DeviceLocale[];
}

export function I18nProvider({ children, storage: storageProp, locales: localesProp }: Props) {
  // Read once: the storage and the phone's languages do not change under a mounted provider.
  const storage = useMemo(() => storageProp ?? getStorage(), [storageProp]);
  const locales = useMemo(() => localesProp ?? getDeviceLocales(), [localesProp]);
  const [preference, setPreference] = useStoredValue(storage, languageKey);
  const locale = resolveLocale(preference, locales);

  const formatters = useMemo(
    () => ({
      t: createT(locale),
      formatNumber: (n: number, opts?: Intl.NumberFormatOptions) => new Intl.NumberFormat(locale, opts).format(n),
      formatDate: (d: Date, opts?: Intl.DateTimeFormatOptions) => new Intl.DateTimeFormat(locale, opts).format(d),
    }),
    [locale],
  );

  useEffect(() => {
    if (Platform.OS === 'web' && typeof document !== 'undefined') {
      document.documentElement.lang = locale;
    }
  }, [locale]);

  const value = useMemo<I18nValue>(
    () => ({ locale, preference, setPreference, ...formatters }),
    [locale, preference, setPreference, formatters],
  );

  return <I18nContext.Provider value={value}>{children}</I18nContext.Provider>;
}

export function useI18n(): I18nValue {
  const value = useContext(I18nContext);
  if (!value) throw new Error('useI18n must be used inside I18nProvider');
  return value;
}

export function useT(): TFunction {
  return useI18n().t;
}
