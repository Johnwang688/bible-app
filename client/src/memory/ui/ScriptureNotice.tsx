// The translation's notice, shown wherever English verse text appears (each trainer, the library, the verse sheet,
// the settings sheet). The ESV's wording is Crossway's required notice; the BSB is public domain. Nothing for Chinese.
import { Text } from 'react-native';

import { auroraTextShadow } from '../../aurora';
import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';
import { TMS_ENGLISH_TRANSLATION } from '../library';
import type { VerseLanguage } from '../verseLanguage';

export function ScriptureNotice({
  language,
  onAurora = false,
  testID = 'memory-scripture-notice',
}: {
  language: VerseLanguage;
  /** Sits directly on the aurora (not on a card): carries the aurora's text shadow. */
  onAurora?: boolean;
  testID?: string;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  if (language !== 'en') return null;
  return (
    <Text
      testID={testID}
      style={{
        color: theme.colors.muted,
        fontFamily: uiFace(theme.type.ui, '400'),
        fontSize: 11,
        lineHeight: 16,
        ...(onAurora ? auroraTextShadow(theme) : null),
      }}
    >
      {t(TMS_ENGLISH_TRANSLATION === 'ESV' ? 'memory.notice.esv' : 'memory.notice.bsb')}
    </Text>
  );
}
