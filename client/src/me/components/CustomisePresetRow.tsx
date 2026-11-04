// The Look row: every preset as a four-colour swatch and its name, scrolling sideways and
// starting at the one that shows (the design's rule).
import { useEffect, useRef, type ComponentRef } from 'react';
import { useWindowDimensions, ScrollView, StyleSheet, Text, View } from 'react-native';

import { BREAKPOINT } from '../../components/layout';
import { auroraTextShadow } from '../../aurora';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { getTheme, PRESETS } from '../../theme/presets';
import { useTheme } from '../../theme/ThemeProvider';
import type { PresetId } from '../../theme/types';
import { CustomisePressable } from './CustomisePressable';

const ITEM_WIDTH = 70;
const GAP = 10;

export function CustomisePresetRow({ presetId, onPick }: { presetId: PresetId; onPick(id: PresetId): void }) {
  const desktop = useWindowDimensions().width >= BREAKPOINT.tablet;
  const theme = useTheme();
  const t = useT();
  const scroll = useRef<ComponentRef<typeof ScrollView>>(null);
  // Start at the preset that shows when the scroller mounts. Picking a preset does not jump the row.
  useEffect(() => {
    if (desktop) return;
    const at = PRESETS.findIndex((p) => p.id === presetId);
    scroll.current?.scrollTo({ x: Math.max(0, at) * (ITEM_WIDTH + GAP), animated: false });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [desktop]);
  const items = PRESETS.map((p) => {
    const preset = getTheme(p.id);
    const on = p.id === presetId;
    const name = t(p.nameKey);
    const c = preset.colors;
    return (
      <CustomisePressable
        key={p.id}
        testID={`customise-preset-${p.id}`}
        role="radio"
        label={name}
        selected={on}
        onPress={() => onPick(p.id)}
        style={[styles.item, desktop && { width: 84 }]}
      >
        <View style={[styles.ring, { borderColor: on ? theme.colors.accent : theme.colors.base }]}>
          <View style={[styles.swatch, { borderColor: theme.colors.muted }]}>
            <View style={styles.pair}>
              <View style={[styles.cell, { backgroundColor: c.base }]} />
              <View style={[styles.cell, { backgroundColor: c.accent }]} />
            </View>
            <View style={styles.pair}>
              <View style={[styles.cell, { backgroundColor: c.hl }]} />
              <View style={[styles.cell, { backgroundColor: c.text }]} />
            </View>
          </View>
        </View>
        <Text
          numberOfLines={desktop ? 2 : 1}
          style={[
            { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, on ? '700' : '400'), fontSize: 11, maxWidth: ITEM_WIDTH },
            desktop && { maxWidth: 84, textAlign: 'center' },
            auroraTextShadow(theme),
          ]}
        >
          {name}
        </Text>
      </CustomisePressable>
    );
  });
  return desktop ? (
    <View accessibilityRole="radiogroup" style={[styles.row, { flexDirection: 'row', flexWrap: 'wrap' }]}>{items}</View>
  ) : (
    <ScrollView ref={scroll} horizontal showsHorizontalScrollIndicator={false} contentContainerStyle={styles.row} accessibilityRole="radiogroup">{items}</ScrollView>
  );
}

const styles = StyleSheet.create({
  row: { gap: GAP, paddingVertical: 2 },
  item: { width: ITEM_WIDTH, alignItems: 'center', gap: 4 },
  ring: { borderWidth: 3, borderRadius: 20, padding: 1 },
  swatch: { width: 56, height: 56, borderRadius: 16, overflow: 'hidden', borderWidth: StyleSheet.hairlineWidth },
  pair: { flex: 1, flexDirection: 'row' },
  cell: { flex: 1 },
});
