// The small pieces both Memory clusters (home and the trainers) share: buttons, the card, the section label and the
// status label. Every colour, radius, border, shadow and font comes from the theme.
import type { ReactNode } from 'react';
import { Pressable, StyleSheet, Text, View, type StyleProp, type ViewStyle } from 'react-native';

import { auroraTextShadow } from '../../aurora';
import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { buttonStyle } from '../../reader/components/ui';
import { useTheme } from '../../theme/ThemeProvider';
import type { Background } from '../../theme/types';
import { MemoryIcon, type MemoryIconName } from './icons';

export type MemButtonKind = 'primary' | 'secondary' | 'ghost';

/**
 * A text button, at least 44 pt tall (52 for a block primary: `block`). Primary is the call to action (`cta`/`onCta`, as the
 * selected segment in Study), secondary the plain button of the preset, ghost text only.
 */
export function MemButton({
  label,
  kind,
  onPress,
  testID,
  accessibilityLabel,
  disabled = false,
  icon,
  block = false,
}: {
  label: string;
  kind: MemButtonKind;
  onPress(): void;
  testID?: string;
  accessibilityLabel?: string;
  disabled?: boolean;
  icon?: MemoryIconName;
  /** Full width; a primary block is 52 tall. */
  block?: boolean;
}) {
  const theme = useTheme();
  const border = theme.borders.button;
  const base: ViewStyle =
    kind === 'primary'
      ? {
          backgroundColor: theme.colors.cta,
          borderRadius: theme.radii.button,
          borderWidth: border?.width ?? 0,
          borderColor: border?.color,
          boxShadow: disabled ? undefined : theme.shadows.cta,
        }
      : kind === 'secondary'
        ? buttonStyle(theme)
        : { borderRadius: theme.radii.button };
  const color = kind === 'primary' ? theme.colors.onCta : kind === 'secondary' ? theme.colors.btnText : theme.colors.text;
  return (
    <Pressable
      testID={testID}
      accessibilityRole="button"
      accessibilityLabel={accessibilityLabel ?? label}
      accessibilityState={{ disabled }}
      disabled={disabled}
      onPress={onPress}
      style={({ pressed }) => [
        styles.button,
        block && styles.block,
        block && kind === 'primary' && styles.blockPrimary,
        base,
        { opacity: pressed ? 0.85 : disabled ? 0.42 : 1 },
      ]}
    >
      {icon ? <MemoryIcon name={icon} color={color} size={20} /> : null}
      <Text style={[styles.buttonText, { color, fontFamily: uiFace(theme.type.ui, '700') }]}>{label}</Text>
    </Pressable>
  );
}

/** A card as the design draws it: the surface, the outline and shadow of the preset, glass where the preset is glass. */
export function MemCard({
  children,
  style,
  testID,
  background,
}: {
  children: ReactNode;
  style?: StyleProp<ViewStyle>;
  testID?: string;
  /** Another fill than the surface (the lesson card's own colour). */
  background?: Background;
}) {
  const theme = useTheme();
  return (
    <GlassSurface
      testID={testID}
      background={background ?? theme.backgrounds.surface}
      style={[
        styles.card,
        {
          borderRadius: theme.radii.card,
          borderWidth: theme.borders.card.width,
          borderColor: theme.borders.card.color,
          boxShadow: theme.shadows.card ?? undefined,
        },
        style,
      ]}
    >
      {children}
    </GlassSurface>
  );
}

/** A small muted caption over a block, in capitals. */
export function SectionLabel({ children, color }: { children: ReactNode; color?: string }) {
  const theme = useTheme();
  return (
    <Text
      style={{
        color: color ?? theme.colors.muted,
        fontFamily: uiFace(theme.type.ui, '700'),
        fontSize: 12,
        letterSpacing: 0.6,
        textTransform: 'uppercase',
      }}
    >
      {children}
    </Text>
  );
}

/** A tick and a line of text: a state ("Done today"), never a button. */
/**
 * A done mark and its words. On a card, pass the card's text colour. Without one it is drawn in the app's text
 * colour straight on the screen (Week's "Done today"), so by default it gets the text halo that keeps text on the
 * aurora readable; `onAurora` says so either way.
 */
export function StatusLabel({
  text,
  testID,
  color,
  onAurora = color === undefined,
}: {
  text: string;
  testID?: string;
  color?: string;
  onAurora?: boolean;
}) {
  const theme = useTheme();
  const ink = color ?? theme.colors.text;
  return (
    <View testID={testID} accessible accessibilityRole="text" accessibilityLabel={text} style={styles.status}>
      <MemoryIcon name="check" color={ink} size={20} strokeWidth={2.6} />
      <Text
        style={{
          color: ink,
          fontFamily: uiFace(theme.type.ui, '700'),
          fontSize: 15,
          flexShrink: 1,
          ...(onAurora ? auroraTextShadow(theme) : null),
        }}
      >
        {text}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  button: {
    minHeight: 44,
    paddingHorizontal: 18,
    paddingVertical: 8,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
  },
  block: { alignSelf: 'stretch' },
  blockPrimary: { minHeight: 52 },
  buttonText: { fontSize: 15, textAlign: 'center', flexShrink: 1 },
  card: { padding: 16, gap: 12 },
  status: { minHeight: 44, flexDirection: 'row', alignItems: 'center', gap: 6 },
});
