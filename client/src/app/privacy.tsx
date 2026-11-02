// /privacy: the privacy policy, a page of its own outside the tabs. `?lang=en` or `?lang=zh-Hans` fixes its language.
import { router, useLocalSearchParams } from 'expo-router';
import Head from 'expo-router/head';
import { Platform } from 'react-native';

import { useI18n } from '../i18n/I18nProvider';
import { createT } from '../i18n/translate';
import { privacyLocale } from '../privacy';
import { PrivacyScreen } from '../privacy/PrivacyScreen';

export default function PrivacyRoute() {
  const { lang } = useLocalSearchParams<{ lang?: string | string[] }>();
  const { locale } = useI18n();
  // The tab title follows the page's language, as the page does.
  const title = createT(privacyLocale(lang, locale))('privacy.title');
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
      />
    </>
  );
}
