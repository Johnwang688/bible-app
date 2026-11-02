// Customise's four-colour swatch for a preset, read from the preset's own theme tokens: glass shows its base,
// its first two aurora colours and its accent; pastel shows its base, its two card colours and its accent.
import { View } from 'react-native';

import { auroraColours } from '../../aurora/palette';
import type { Color, Theme } from '../../theme/types';

export function swatchColours(theme: Theme): readonly [Color, Color, Color, Color] {
  const { colors, canvas } = theme;
  if (theme.style === 'glass') {
    const aurora = auroraColours(theme);
    return aurora
      ? [aurora.base, aurora.colours[0], aurora.colours[1], colors.accent]
      : [colors.base, colors.hl, colors.track, colors.accent];
  }
  const surface = theme.backgrounds.surface.backgroundColor;
  return theme.mode === 'dark'
    ? [colors.base, surface, canvas.c1 ?? surface, colors.accent]
    : [colors.base, canvas.c1 ?? surface, canvas.c3 ?? surface, colors.accent];
}

/** The swatch: `size` square, four quarters. Hidden from screen readers (the name is the label). */
export function Swatch({ theme, size, radius, edge }: { theme: Theme; size: number; radius: number; edge: Color }) {
  return (
    <View
      aria-hidden
      accessibilityElementsHidden
      importantForAccessibility="no-hide-descendants"
      style={{ width: size, height: size, borderRadius: radius, overflow: 'hidden', flexDirection: 'row', flexWrap: 'wrap', borderWidth: 1, borderColor: edge }}
    >
      {swatchColours(theme).map((c, i) => (
        <View key={i} style={{ width: '50%', height: '50%', backgroundColor: c }} />
      ))}
    </View>
  );
}
