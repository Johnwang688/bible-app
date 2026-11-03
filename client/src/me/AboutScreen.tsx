// About and privacy: what the app is, what stays on the device, and the version.
import Constants from 'expo-constants';
import { StyleSheet, Text } from 'react-native';

import { uiFace } from '../fonts/fonts';
import { useT } from '../i18n/I18nProvider';
import { useTheme } from '../theme/ThemeProvider';
import { MeCard, MeInfoScreen } from './components/MeInfoScreen';

export function AboutScreen({ onBack }: { onBack(): void }) {
  const theme = useTheme();
  const t = useT();
  const body = { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') };
  return (
    <MeInfoScreen testID="screen-about" backID="about-back" titleKey="about.title" onBack={onBack}>
      <MeCard>
        <Text style={[styles.name, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}>{t('app.name')}</Text>
        <Text style={[styles.text, body]}>{t('about.body')}</Text>
        <Text testID="about-version" style={[styles.small, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }]}>
          {t('about.version', { version: Constants.expoConfig?.version ?? '' })}
        </Text>
      </MeCard>
      <MeCard>
        <Text accessibilityRole="header" style={[styles.heading, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}>
          {t('about.privacy.title')}
        </Text>
        <Text style={[styles.text, body]}>{t('about.privacy.body')}</Text>
      </MeCard>
    </MeInfoScreen>
  );
}

const styles = StyleSheet.create({
  name: { fontSize: 20 },
  heading: { fontSize: 17 },
  text: { fontSize: 15, lineHeight: 22 },
  small: { fontSize: 13 },
});
