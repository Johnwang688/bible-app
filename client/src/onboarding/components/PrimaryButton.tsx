// The full-width primary button (52 pt) in the style's CTA paint: pastel `cta`/`onCta` with its outline and
// offset shadow, glass `accent`/`onAccent` with the glass CTA shadow (`theme.colors.cta` already resolves to
// each). Pressed: pastel nudges, glass shrinks a hair.
import { Pressable, Text } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useTheme } from '../../theme/ThemeProvider';
import type { PressHandler } from '../steps/types';

export function PrimaryButton({ label, onPress }: { label: string; onPress: PressHandler }) {
  const theme = useTheme();
  const { colors, borders } = theme;
  return (
    <Pressable
      accessibilityRole="button"
      onPress={onPress}
      style={({ pressed }) => ({
        height: 52,
        marginHorizontal: 24,
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: colors.cta,
        borderRadius: theme.radii.button,
        borderColor: borders.button?.color,
        borderWidth: borders.button?.width ?? 0,
        boxShadow: theme.shadows.cta,
        transform: pressed ? (theme.style === 'glass' ? [{ scale: 0.98 }] : [{ translateX: 2 }, { translateY: 2 }]) : undefined,
      })}
    >
      <Text style={{ color: colors.onCta, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 17 }}>{label}</Text>
    </Pressable>
  );
}
