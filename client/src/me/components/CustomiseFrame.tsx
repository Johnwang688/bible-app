// The frame both Customise screens sit in: the theme's background, a back button, the title and
// an optional action (Customise's Reset) in a header row, then the scrolling content.
import type { ReactNode } from 'react';
import { ScrollView, StyleSheet, Text, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { AuroraBackground, auroraTextShadow } from '../../aurora';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { Icon } from '../../reader/components/icons';
import { buttonStyle } from '../../reader/components/ui';
import { useTheme } from '../../theme/ThemeProvider';
import { CustomisePressable } from './CustomisePressable';

export function CustomiseFrame({
  testID,
  backTestID,
  titleKey,
  backLabelKey,
  onBack,
  action,
  children,
}: {
  testID: string;
  backTestID: string;
  titleKey: MessageKey;
  backLabelKey: MessageKey;
  onBack(): void;
  action?: ReactNode;
  children?: ReactNode;
}) {
  const theme = useTheme();
  const t = useT();
  const insets = useSafeAreaInsets();
  return (
    <View testID={testID} style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      <View style={[styles.header, { paddingTop: insets.top + 8 }]}>
        <CustomisePressable
          testID={backTestID}
          role="button"
          label={t(backLabelKey)}
          onPress={onBack}
          style={[buttonStyle(theme), styles.back]}
        >
          <Icon name="chevronLeft" color={theme.colors.btnText} size={20} />
        </CustomisePressable>
        <Text
          accessibilityRole="header"
          style={[
            styles.title,
            {
              color: theme.colors.text,
              fontFamily: uiFace(theme.type.head, theme.type.headWeight),
              letterSpacing: theme.type.headLetterSpacing,
              ...auroraTextShadow(theme),
            },
          ]}
        >
          {t(titleKey)}
        </Text>
        {action}
      </View>
      <ScrollView contentContainerStyle={styles.content}>{children}</ScrollView>
    </View>
  );
}

/** A small caps section label in the muted colour. */
export function CustomiseLabel({ children }: { children: string }) {
  const theme = useTheme();
  return (
    <Text
      accessibilityRole="header"
      style={[styles.caps, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700'), ...auroraTextShadow(theme) }]}
    >
      {children}
    </Text>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  header: { flexDirection: 'row', alignItems: 'center', gap: 8, paddingHorizontal: 12, paddingBottom: 6 },
  back: { width: 44, height: 44, borderRadius: 22, alignItems: 'center', justifyContent: 'center' },
  title: { flex: 1, minWidth: 0, fontSize: 22, fontWeight: '700' },
  content: { paddingHorizontal: 16, paddingTop: 6, paddingBottom: 120, gap: 18 },
  caps: { fontSize: 12, letterSpacing: 0.6, textTransform: 'uppercase' },
});
