// The frame every step shares: the theme's app background with the aurora behind (nothing for pastel), the
// header above, the step's body in the middle and the footer (dots and the primary button) pinned below.
import type { ReactNode } from 'react';
import { useWindowDimensions, ScrollView, StyleSheet, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ContentColumn, useColumn } from '../../components/ContentColumn';
import { BREAKPOINT, COLUMN } from '../../components/layout';
import { AuroraBackground } from '../../aurora';
import type { MessageKey } from '../../i18n/messages/en';
import { useT } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';
import type { PressHandler } from '../steps/types';
import { PrimaryButton } from './PrimaryButton';
import { StepDots } from './StepDots';
import { StepHeader } from './StepHeader';

export function StepFrame({
  testID,
  kind = 'welcome',
  centerGroup = false,
  step,
  ctaKey,
  onCta,
  onSkip,
  onBack,
  children,
}: {
  testID: string;
  kind?: keyof typeof COLUMN;
  centerGroup?: boolean;
  step: number;
  ctaKey: Extract<MessageKey, 'onboarding.getStarted' | 'onboarding.continue' | 'onboarding.startReading'>;
  onCta: PressHandler;
  onSkip: PressHandler;
  onBack?: PressHandler;
  children: ReactNode;
}) {
  const desktop = useWindowDimensions().width >= BREAKPOINT.tablet;
  const column = useColumn(kind, 24);
  const theme = useTheme();
  const t = useT();
  const insets = useSafeAreaInsets();
  const header = <StepHeader skipKey={onBack ? 'onboarding.skipForNow' : 'onboarding.skip'} onSkip={onSkip} onBack={onBack} />;
  const content = (
    <>
      {desktop ? <ContentColumn kind={kind} gutter={12}>{header}</ContentColumn> : header}
      {children}
      <View style={[styles.foot, desktop && { paddingTop: 0 }]}>
        <StepDots step={step} />
        <PrimaryButton label={t(ctaKey)} onPress={onCta} />
      </View>
    </>
  );
  const safeArea = { paddingTop: insets.top, paddingBottom: Math.max(insets.bottom, 16) };
  return (
    <View testID={testID} style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      {desktop && centerGroup ? (
        <ScrollView
          testID={`${testID}-scroll`}
          style={styles.fill}
          contentContainerStyle={[safeArea, { flexGrow: 1, justifyContent: 'center' }]}
        >
          <View style={[column, { gap: 24, flexShrink: 0 }]}>{content}</View>
        </ScrollView>
      ) : (
        <View style={[styles.fill, safeArea, column]}>{content}</View>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  foot: { gap: 14, paddingTop: 8 },
});
