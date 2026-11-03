// The Me tab's building blocks: a labelled group (header text over a card) and the rows inside it.
// Layout follows Me.dc.html: 12 pt header, card of 50 pt rows with label, value and chevron.
import type { ReactNode } from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';

import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { Icon } from '../../reader/components/icons';
import { useTheme } from '../../theme/ThemeProvider';

export function MeGroup({ titleKey, children }: { titleKey: MessageKey; children: ReactNode }) {
  const theme = useTheme();
  const t = useT();
  const border = theme.borders.card;
  return (
    <View style={styles.group}>
      <Text
        accessibilityRole="header"
        style={[styles.groupTitle, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700') }]}
      >
        {t(titleKey)}
      </Text>
      <GlassSurface
        background={theme.backgrounds.surface}
        style={{
          borderRadius: theme.radii.card,
          borderWidth: border.width,
          borderColor: border.color,
          boxShadow: theme.shadows.card ?? undefined,
          overflow: 'hidden',
        }}
      >
        {children}
      </GlassSurface>
    </View>
  );
}

export function MeSettingsRow({
  id,
  labelKey,
  value,
  first = false,
  onPress,
}: {
  /** The row's testID; the value is `<id>-value`. */
  id: string;
  labelKey: MessageKey;
  /** Omitted for the More rows. */
  value?: string;
  first?: boolean;
  onPress(): void;
}) {
  const theme = useTheme();
  const t = useT();
  const label = t(labelKey);
  return (
    <Pressable
      testID={id}
      accessibilityRole="button"
      accessibilityLabel={value === undefined ? label : t('me.row.a11y', { label, value })}
      onPress={onPress}
      style={[
        styles.row,
        !first && { borderTopWidth: StyleSheet.hairlineWidth, borderTopColor: theme.borders.card.color },
      ]}
    >
      <Text style={[styles.label, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }]}>{label}</Text>
      {value === undefined ? null : (
        <Text testID={`${id}-value`} style={[styles.value, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }]}>
          {value}
        </Text>
      )}
      <Icon name="chevronRight" size={16} color={theme.colors.muted} />
    </Pressable>
  );
}

const styles = StyleSheet.create({
  group: { gap: 6 },
  groupTitle: { paddingHorizontal: 4, fontSize: 12, letterSpacing: 0.6, textTransform: 'uppercase' },
  row: { minHeight: 50, flexDirection: 'row', alignItems: 'center', gap: 10, paddingHorizontal: 14, paddingVertical: 6 },
  label: { flex: 1, flexShrink: 1, fontSize: 15 },
  value: { flexShrink: 1, maxWidth: '50%', fontSize: 14, textAlign: 'right' },
});
