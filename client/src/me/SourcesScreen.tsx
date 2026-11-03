// Sources and credits: every text the app shows, with its licence.
import { Linking, Pressable, StyleSheet, Text } from 'react-native';

import { uiFace } from '../fonts/fonts';
import { useT } from '../i18n/I18nProvider';
import type { MessageKey } from '../i18n/messages/en';
import { useTheme } from '../theme/ThemeProvider';
import { MeCard, MeInfoScreen } from './components/MeInfoScreen';

const STEP_URL = 'https://www.stepbible.org';

const BEFORE_STEP: readonly MessageKey[] = ['credits.bsb', 'credits.web', 'credits.asv', 'credits.cuv'];

export function SourcesScreen({ onBack }: { onBack(): void }) {
  const theme = useTheme();
  const t = useT();
  const body = { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') };
  return (
    <MeInfoScreen testID="screen-sources" backID="sources-back" titleKey="credits.title" onBack={onBack}>
      <Text style={[styles.text, body]}>{t('credits.intro')}</Text>
      <MeCard>
        {BEFORE_STEP.map((key) => (
          <Text key={key} style={[styles.text, body]}>
            {t(key)}
          </Text>
        ))}
        <Text style={[styles.text, body]}>{t('credits.step')}</Text>
        <Pressable
          testID="credits-step-link"
          accessibilityRole="link"
          accessibilityLabel={t('credits.stepLink')}
          onPress={() => void Linking.openURL(STEP_URL)}
          style={styles.link}
        >
          <Text style={[styles.text, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), textDecorationLine: 'underline' }]}>
            {t('credits.stepLink')}
          </Text>
        </Pressable>
        <Text style={[styles.text, body]}>{t('credits.henry')}</Text>
      </MeCard>
    </MeInfoScreen>
  );
}

const styles = StyleSheet.create({
  text: { fontSize: 15, lineHeight: 22 },
  link: { minHeight: 44, alignSelf: 'flex-start', justifyContent: 'center' },
});
