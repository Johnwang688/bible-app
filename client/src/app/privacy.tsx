// /privacy: the privacy policy, a page of its own outside the tabs. `?lang=en` or `?lang=zh-Hans` fixes its language.
import { router, useLocalSearchParams } from 'expo-router';
import Head from 'expo-router/head';
import { useState } from 'react';
import { Platform } from 'react-native';

import { useI18n } from '../i18n/I18nProvider';
import { createT } from '../i18n/translate';
import type { AppLocale } from '../i18n/types';
import { privacyLocale } from '../privacy';
import { PrivacyScreen } from '../privacy/PrivacyScreen';

export default function PrivacyRoute() {
  const { lang } = useLocalSearchParams<{ lang?: string | string[] }>();
  const { locale } = useI18n();
  // The page reports its language (including after its own switch); the title follows it.
  const [pageLocale, setPageLocale] = useState<AppLocale | null>(null);
  const title = createT(pageLocale ?? privacyLocale(lang, locale))('privacy.title');
  return (
    <>
      {Platform.OS === 'web' ? (
        <Head>
          <title>{title}</title>
        </Head>
      ) : null}
      <PrivacyScreen
        lang={lang}
        canGoBack={router.canGoBack()}
        onBack={() => router.back()}
        onOpenApp={() => router.replace('/')}
        onLocaleChange={setPageLocale}
      />
    </>
  );
}
