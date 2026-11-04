import type { ReactNode, Ref, ComponentRef } from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { programmaticFocus, useFocusOnMount } from '../../reader/components/a11y';
import { Icon, type IconName } from '../../reader/components/icons';
import { buttonStyle } from '../../reader/components/ui';
import { useTheme } from '../../theme/ThemeProvider';

export function SheetHeading({ title, caps, onClose }: { title: string; caps?: string; onClose(): void }) {
  const theme = useTheme();
  const t = useT();
  const heading = useFocusOnMount();
  return <View style={styles.heading}>
    <View style={{ flex: 1, gap: 2 }}>
      {caps ? <Text style={{ color: theme.colors.muted, fontSize: 11, fontFamily: uiFace(theme.type.ui, '700'), textTransform: 'uppercase' }}>{caps}</Text> : null}
      <Text ref={heading} {...programmaticFocus} accessibilityRole="header" style={{ color: theme.colors.text, fontSize: 21, fontFamily: uiFace(theme.type.head, '700') }}>{title}</Text>
    </View>
    <Action testID="read-aloud-sheet-close" label={t('common.close')} icon="close" onPress={onClose} />
  </View>;
}

export function Action({ testID, label, icon, onPress, primary = false, children, nodeRef, wide = false, popup = false }: {
  testID: string; label: string; icon?: IconName; onPress(): void; primary?: boolean; children?: ReactNode;
  nodeRef?: Ref<ComponentRef<typeof View>>; wide?: boolean; popup?: boolean;
}) {
  const theme = useTheme();
  const color = primary ? theme.colors.onCta : theme.colors.btnText;
  return <Pressable ref={nodeRef} testID={testID} accessibilityRole="button" accessibilityLabel={label} aria-haspopup={popup ? 'dialog' : undefined}
    onPress={onPress} style={({ pressed }) => [buttonStyle(theme), styles.action,
      { opacity: pressed ? 0.7 : 1, width: wide ? undefined : primary ? 48 : 44, minWidth: wide ? 50 : undefined,
        height: primary || wide ? 48 : 44, paddingHorizontal: wide ? 12 : 0 },
      primary && { backgroundColor: theme.colors.cta, boxShadow: theme.shadows.cta }] }>
    {icon ? <Icon name={icon} size={primary ? 22 : 20} color={color} filled={icon === 'play'} /> : null}
    {children ?? (wide ? <Text style={{ color, fontSize: 15, fontFamily: uiFace(theme.type.ui, '700'), flexShrink: 1 }}>{label}</Text> : null)}
  </Pressable>;
}

const styles = StyleSheet.create({
  heading: { flexDirection: 'row', alignItems: 'center', gap: 12, minHeight: 44 },
  action: { flexShrink: 0, alignItems: 'center', justifyContent: 'center', flexDirection: 'row', gap: 8 },
});
