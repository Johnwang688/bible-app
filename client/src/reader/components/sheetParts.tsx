// Small pieces the verse sheet's views share: the pinned-header frame, the round icon button
// and the 英文 badge that marks English-only content in Chinese.
import type { ComponentRef, ReactNode, Ref } from 'react';
import { Pressable, ScrollView, StyleSheet, Text, View, type NativeScrollEvent, type NativeSyntheticEvent } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useI18n, useT } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';
import { Icon, type IconName } from './icons';
import { buttonStyle } from './ui';

/**
 * One view of a sheet: a header that stays put and a body that scrolls, so a capped sheet (landscape,
 * a short screen) keeps its back and close buttons in reach.
 */
export function SheetFrame({
  testID,
  header,
  scrollRef,
  onScroll,
  children,
}: {
  testID: string;
  header: ReactNode;
  scrollRef?: Ref<ComponentRef<typeof ScrollView>>;
  onScroll?(e: NativeSyntheticEvent<NativeScrollEvent>): void;
  children: ReactNode;
}) {
  return (
    <View testID={testID} style={styles.frame}>
      {header}
      <ScrollView
        ref={scrollRef}
        onScroll={onScroll}
        scrollEventThrottle={16}
        style={styles.body}
        contentContainerStyle={styles.bodyContent}
        keyboardShouldPersistTaps="handled"
      >
        {children}
      </ScrollView>
    </View>
  );
}

/** A 44 pt round button holding an icon (back, close). */
export function RoundIconButton({
  testID,
  label,
  icon,
  onPress,
}: {
  testID: string;
  label: string;
  icon: IconName;
  onPress(): void;
}) {
  const theme = useTheme();
  return (
    <Pressable
      testID={testID}
      accessibilityRole="button"
      accessibilityLabel={label}
      onPress={onPress}
      style={[styles.round, buttonStyle(theme), { borderRadius: 999 }]}
    >
      <Icon name={icon} size={icon === 'close' ? 18 : 20} color={theme.colors.btnText} />
    </Pressable>
  );
}

/** "英文": the content is English only. Shown in Chinese; in English there is nothing to mark. */
export function EnglishBadge() {
  const theme = useTheme();
  const t = useT();
  const { locale } = useI18n();
  if (locale !== 'zh-Hans') return null;
  return (
    <View style={[styles.badge, { borderColor: theme.colors.muted }]}>
      <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 12 }}>
        {t('content.englishOnly')}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  frame: { flexShrink: 1, minHeight: 0, gap: 12 },
  body: { flexGrow: 0, flexShrink: 1, minHeight: 0 },
  bodyContent: { gap: 12 },
  round: { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' },
  badge: { paddingHorizontal: 8, paddingVertical: 2, borderRadius: 999, borderWidth: 1, alignSelf: 'center' },
});
