// Step 1: welcome (r7a-welcome.html). The app name, one line about the app, and a verse.
import { Platform, Text, View } from 'react-native';

import { uiFace, scriptureFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';
import { StepFrame } from '../components/StepFrame';
import { StepHeading } from '../components/StepHeading';
import { TextCard } from '../components/TextCard';
import type { StepProps } from './types';

/** Chinese Scripture's own font is a large download, so the first screen uses the system serif. */
const SYSTEM_SERIF = Platform.select({ web: 'serif', android: 'serif', default: 'Songti SC' });

export function WelcomeStep({ announce, onNext, onSkip }: StepProps) {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const scripture = locale === 'zh-Hans' ? SYSTEM_SERIF : scriptureFace(theme.type.scripture);
  return (
    <StepFrame testID="first-run-welcome" step={1} ctaKey="onboarding.getStarted" onCta={onNext} onSkip={onSkip}>
      <View style={{ flex: 1, justifyContent: 'center', gap: 36, paddingHorizontal: 24 }}>
        <View style={{ gap: 12 }}>
          <StepHeading focusOnMount={announce}>{t('app.name')}</StepHeading>
          <TextCard testID="welcome-line-card" style={{ paddingHorizontal: 16, paddingVertical: 12 }}>
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 18, lineHeight: 25 }}>
              {t('onboarding.welcome.line')}
            </Text>
          </TextCard>
        </View>
        <TextCard testID="welcome-verse-card" style={{ paddingHorizontal: 20, paddingTop: 20, paddingBottom: 16 }}>
          <Text style={{ color: theme.colors.text, fontFamily: scripture, fontSize: 21, lineHeight: 31.5 }}>
            {t('onboarding.welcome.verse')}
          </Text>
          <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 13, marginTop: 12 }}>
            {t('onboarding.welcome.ref')}
          </Text>
        </TextCard>
      </View>
    </StepFrame>
  );
}
