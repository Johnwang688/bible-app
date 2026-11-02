// The frame every step shares: the theme's app background with the aurora behind (nothing for pastel), the
// header above, the step's body in the middle and the footer (dots and the primary button) pinned below.
import type { ReactNode } from 'react';
import { StyleSheet, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { AuroraBackground } from '../../aurora';
import type { MessageKey } from '../../i18n/messages/en';
import { useT } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';
import { PrimaryButton } from './PrimaryButton';
import { StepDots } from './StepDots';
import { StepHeader } from './StepHeader';

export function StepFrame({
  testID,
  step,
  ctaKey,
  onCta,
  onSkip,
  onBack,
  children,
}: {
  testID: string;
  step: number;
  ctaKey: Extract<MessageKey, 'onboarding.getStarted' | 'onboarding.continue' | 'onboarding.startReading'>;
  onCta(): void;
  onSkip(): void;
  onBack?: () => void;
  children: ReactNode;
}) {
  const theme = useTheme();
  const t = useT();
  const insets = useSafeAreaInsets();
  return (
    <View testID={testID} style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      <View style={[styles.fill, { paddingTop: insets.top, paddingBottom: Math.max(insets.bottom, 16) }]}>
        <StepHeader skipKey={onBack ? 'onboarding.skipForNow' : 'onboarding.skip'} onSkip={onSkip} onBack={onBack} />
        {children}
        <View style={styles.foot}>
          <StepDots step={step} />
          <PrimaryButton label={t(ctaKey)} onPress={onCta} />
        </View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  foot: { gap: 14, paddingTop: 8 },
});
