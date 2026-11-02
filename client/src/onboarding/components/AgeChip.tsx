// An age chip (r7a-age.html): a radio, 44 pt tall. Unselected: the text card's fill (via GlassSurface), the
// text colour, and the 3:1 edge (`chipEdge`) on the radio's own style. Selected: the CTA fill, its text colour
// and a check.
import { Pressable, StyleSheet, Text } from 'react-native';

import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { Icon } from '../../reader/components/icons';
import { useTheme } from '../../theme/ThemeProvider';
import { chipEdge, textCardBackground } from '../paint';
import type { RadioKeyProps } from './useRadioKeys';

export function AgeChip({
  label,
  checked,
  onPress,
  keyProps,
}: {
  label: string;
  checked: boolean;
  onPress(): void;
  keyProps: RadioKeyProps;
}) {
  const theme = useTheme();
  const edge = chipEdge(theme);
  const ink = checked ? theme.colors.onCta : theme.colors.text;
  return (
    <Pressable
      role="radio"
      aria-checked={checked}
      accessibilityState={{ checked }}
      onPress={onPress}
      style={({ pressed }) => ({
        height: 44,
        paddingHorizontal: 18,
        flexDirection: 'row',
        alignItems: 'center',
        gap: 6,
        overflow: 'hidden',
        borderRadius: theme.radii.button,
        borderColor: edge.color,
        borderWidth: edge.width,
        backgroundColor: checked ? theme.colors.cta : undefined,
        boxShadow: checked ? theme.shadows.cta : undefined,
        transform: pressed ? (theme.style === 'glass' ? [{ scale: 0.98 }] : [{ translateX: 2 }, { translateY: 2 }]) : undefined,
      })}
      {...keyProps}
    >
      {checked ? null : <GlassSurface background={textCardBackground(theme)} style={StyleSheet.absoluteFill} />}
      {checked ? <Icon name="check" size={16} strokeWidth={3} color={ink} /> : null}
      <Text style={{ color: ink, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 16 }}>{label}</Text>
    </Pressable>
  );
}
