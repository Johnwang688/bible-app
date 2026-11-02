// A small abstract sketch of Home (about 117 x 120, no text) in one preset's tokens: its still app paint, a
// heading bar, two card blocks and a tab bar block. It stands in for the prototype's small aurora, so the
// step runs only the one aurora behind the screen.
import { View } from 'react-native';

import type { Theme } from '../../theme/types';

const SCALE = 0.3;

export function LookSketch({ theme }: { theme: Theme }) {
  const { colors, borders, canvas } = theme;
  const glass = theme.style === 'glass';
  const card = {
    position: 'absolute' as const,
    left: 5,
    right: 5,
    borderColor: borders.card.color,
    borderWidth: Math.max(1, borders.card.width * SCALE),
    borderRadius: theme.radii.card * SCALE,
    overflow: 'hidden' as const,
  };
  const tabBar = glass
    ? { left: 5, right: 5, bottom: 6, height: 19, borderRadius: 10 }
    : { left: 0, right: 0, bottom: 0, height: 25, borderRadius: 0 };
  return (
    <View
      aria-hidden
      accessibilityElementsHidden
      importantForAccessibility="no-hide-descendants"
      style={[
        { width: 117, height: 120, borderRadius: 12, overflow: 'hidden', borderWidth: 1, borderColor: colors.muted },
        theme.backgrounds.app,
      ]}
    >
      <View style={{ position: 'absolute', left: 7, top: 9, width: 50, height: 9, borderRadius: 3, backgroundColor: colors.text }} />
      <View style={[card, { top: 28, height: 31, backgroundColor: canvas.c1 ?? theme.backgrounds.surface.backgroundColor }]} />
      <View style={[card, { top: 63, height: 26, backgroundColor: canvas.c2 ?? theme.backgrounds.surface.backgroundColor }]} />
      <View
        style={[
          {
            position: 'absolute',
            flexDirection: 'row',
            alignItems: 'center',
            justifyContent: 'space-around',
            borderColor: borders.tabBar.color,
            borderWidth: Math.max(1, borders.tabBar.width * SCALE),
          },
          tabBar,
          theme.backgrounds.tabBar,
        ]}
      >
        {[0, 1, 2, 3].map((i) => (
          <View key={i} style={{ width: 8, height: 8, borderRadius: 4, backgroundColor: i === 0 ? colors.tabOn : colors.tabOff }} />
        ))}
      </View>
    </View>
  );
}
