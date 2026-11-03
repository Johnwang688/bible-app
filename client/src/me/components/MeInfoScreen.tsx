// The frame of the three info screens (Sources, About, Help): the app background, a back button
// to Me, the title, and a scrolling body.
import type { ReactNode } from 'react';
import { Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { AuroraBackground, auroraTextShadow } from '../../aurora';
import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { Icon } from '../../reader/components/icons';
import { useTheme } from '../../theme/ThemeProvider';

export function MeInfoScreen({
  testID,
  backID,
  titleKey,
  onBack,
  children,
}: {
  testID: string;
  backID: string;
  titleKey: MessageKey;
  onBack(): void;
  children: ReactNode;
}) {
  const theme = useTheme();
  const t = useT();
  const insets = useSafeAreaInsets();
  return (
    <View testID={testID} style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      <ScrollView contentContainerStyle={[styles.content, { paddingTop: insets.top + 8 }]}>
        <Pressable
          testID={backID}
          accessibilityRole="button"
          accessibilityLabel={t('customise.back')}
          onPress={onBack}
          style={styles.back}
        >
          <Icon name="chevronLeft" size={20} color={theme.colors.text} />
          <Text style={[styles.backText, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), ...auroraTextShadow(theme) }]}>
            {t('customise.back')}
          </Text>
        </Pressable>
        <Text
          accessibilityRole="header"
          style={{
            color: theme.colors.text,
            fontFamily: uiFace(theme.type.head, theme.type.headWeight),
            fontSize: theme.type.headSize,
            letterSpacing: theme.type.headLetterSpacing,
            ...auroraTextShadow(theme),
          }}
        >
          {t(titleKey)}
        </Text>
        {children}
      </ScrollView>
    </View>
  );
}

/** A card on the info screens: the theme's surface, radius and border. */
export function MeCard({ children }: { children: ReactNode }) {
  const theme = useTheme();
  const border = theme.borders.card;
  return (
    <GlassSurface
      background={theme.backgrounds.surface}
      style={{
        gap: 10,
        padding: 16,
        borderRadius: theme.radii.card,
        borderWidth: border.width,
        borderColor: border.color,
        boxShadow: theme.shadows.card ?? undefined,
        overflow: 'hidden',
      }}
    >
      {children}
    </GlassSurface>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { paddingHorizontal: 20, paddingBottom: 120, gap: 14 },
  back: { minHeight: 44, flexDirection: 'row', alignItems: 'center', alignSelf: 'flex-start', gap: 4 },
  backText: { flexShrink: 1, fontSize: 15 },
});
