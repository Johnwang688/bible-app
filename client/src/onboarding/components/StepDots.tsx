// The step dots: one image labelled "Step n of 3". The active dot is wider, in the CTA colour.
import { View } from 'react-native';

import { useT } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';

export const STEP_COUNT = 3;

export function StepDots({ step }: { step: number }) {
  const theme = useTheme();
  const t = useT();
  const glass = theme.style === 'glass';
  const size = glass ? 8 : 14;
  const wide = glass ? 24 : 34;
  const edge = glass ? undefined : theme.borders.card;
  return (
    <View
      accessible
      accessibilityRole="image"
      accessibilityLabel={t('onboarding.step', { n: step, total: STEP_COUNT })}
      style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 8, height: 20 }}
    >
      {Array.from({ length: STEP_COUNT }, (_, i) => {
        const on = i + 1 === step;
        return (
          <View
            key={i}
            style={{
              width: on ? wide : size,
              height: size,
              borderRadius: 999,
              backgroundColor: on ? theme.colors.cta : glass ? theme.colors.muted : theme.backgrounds.surface.backgroundColor,
              opacity: on || !glass ? 1 : 0.4,
              borderColor: edge?.color,
              borderWidth: edge?.width ?? 0,
            }}
          />
        );
      })}
    </View>
  );
}
