// The header row: Back (steps 2 and 3, a 44 pt chevron button) on the left and Skip on the right (44 pt
// high). Pastel underlines Skip; glass gives it the aurora text shadow.
import { Pressable, Text, View } from 'react-native';

import { auroraTextShadow } from '../../aurora';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { Icon } from '../../reader/components/icons';
import { useTheme } from '../../theme/ThemeProvider';
import type { MessageKey } from '../../i18n/messages/en';
import type { PressHandler } from '../steps/types';

export function StepHeader({
  skipKey,
  onSkip,
  onBack,
}: {
  skipKey: Extract<MessageKey, 'onboarding.skip' | 'onboarding.skipForNow'>;
  onSkip: PressHandler;
  /** Undefined on step 1, which has no Back. */
  onBack?: PressHandler;
}) {
  const theme = useTheme();
  const t = useT();
  return (
    <View style={{ flexDirection: 'row', alignItems: 'center', paddingHorizontal: 12, paddingTop: 1, paddingBottom: 6 }}>
      {onBack ? (
        <Pressable
          accessibilityRole="button"
          accessibilityLabel={t('onboarding.back')}
          onPress={onBack}
          style={{ minWidth: 44, minHeight: 44, alignItems: 'center', justifyContent: 'center' }}
        >
          <Icon name="chevronLeft" size={24} color={theme.colors.text} />
        </Pressable>
      ) : null}
      <Pressable
        accessibilityRole="button"
        onPress={onSkip}
        style={{ marginLeft: 'auto', minWidth: 44, minHeight: 44, paddingHorizontal: 14, alignItems: 'center', justifyContent: 'center' }}
      >
        <Text
          style={[
            {
              color: theme.colors.text,
              fontFamily: uiFace(theme.type.ui, '700'),
              fontSize: 16,
              textDecorationLine: theme.style === 'pastel' ? 'underline' : 'none',
            },
            auroraTextShadow(theme),
          ]}
        >
          {t(skipKey)}
        </Text>
      </Pressable>
    </View>
  );
}
