// Small pieces the account card and the account sheets share: glyphs, buttons, the text field and the
// error line. Every colour comes from the theme. No control has a fixed height: each has a `minHeight`
// (44 pt, fields 48 pt) plus padding, so the text can grow with the phone's font size.
import { useEffect, useState, type ComponentRef, type ReactNode, type Ref, type RefObject } from 'react';
import {
  Animated,
  Easing,
  Pressable,
  StyleSheet,
  Text,
  TextInput,
  View,
  type KeyboardTypeOptions,
  type ReturnKeyTypeOptions,
  type TextInputProps,
} from 'react-native';
import Svg, { Path } from 'react-native-svg';

import { uiFace } from '../../fonts/fonts';
import { useReduceMotion } from '../../reader/components/useReduceMotion';
import { useTheme } from '../../theme/ThemeProvider';
import { dangerColours } from '../../theme/danger';
import { buttonStyle } from '../../reader/components/ui';
import { fieldBorderColour, fieldBorderWidth } from './fieldStyle';

export type GlyphName = 'person' | 'check' | 'sync' | 'offline' | 'alert' | 'close' | 'back' | 'eye' | 'eyeOff' | 'mail';

const PATHS: Record<GlyphName, string> = {
  person: 'M12 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM4 21a8 8 0 0 1 16 0',
  check: 'M5 12.5l4.5 4.5L19 7.5',
  sync: 'M21 12a9 9 0 0 0-9-9 9.75 9.75 0 0 0-6.74 2.74L3 8M3 3v5h5M3 12a9 9 0 0 0 9 9 9.75 9.75 0 0 0 6.74-2.74L21 16M16 16h5v5',
  offline:
    'M2 8.8a15 15 0 0 1 4.2-2.6M22 8.8a15 15 0 0 0-8.5-3.7M5 12.9a10 10 0 0 1 5-2.7M19 12.9a10 10 0 0 0-2.4-2M8.5 16.4a5 5 0 0 1 7 0M12 20h.01M2 2l20 20',
  alert: 'M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zM12 8v5M12 16.5h.01',
  close: 'M6 6l12 12M18 6 6 18',
  back: 'm15 6-6 6 6 6',
  eye: 'M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12zM12 9a3 3 0 1 0 0 6 3 3 0 0 0 0-6z',
  eyeOff:
    'M3 3l18 18M10.6 5.1A9.8 9.8 0 0 1 12 5c6.5 0 10 7 10 7a17 17 0 0 1-3.2 4.1M6.6 6.6A16.7 16.7 0 0 0 2 12s3.5 7 10 7a9.7 9.7 0 0 0 4.2-.9M9.9 9.9a3 3 0 0 0 4.2 4.2',
  mail: 'M4 6h16a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1zM3.5 7.5 12 13l8.5-5.5',
};

export function Glyph({ name, color, size = 18, strokeWidth = 2.2 }: { name: GlyphName; color: string; size?: number; strokeWidth?: number }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false}>
      <Path d={PATHS[name]} fill="none" stroke={color} strokeWidth={strokeWidth} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}

/** The sync glyph, turning. Still under Reduce Motion. */
export function Spinner({ color, size = 18 }: { color: string; size?: number }) {
  const reduceMotion = useReduceMotion();
  const [turn] = useState(() => new Animated.Value(0));
  useEffect(() => {
    if (reduceMotion) return;
    const loop = Animated.loop(Animated.timing(turn, { toValue: 1, duration: 1100, easing: Easing.linear, useNativeDriver: true }));
    loop.start();
    return () => {
      loop.stop();
      turn.setValue(0);
    };
  }, [reduceMotion, turn]);
  const rotate = turn.interpolate({ inputRange: [0, 1], outputRange: ['0deg', '360deg'] });
  return (
    <Animated.View accessible={false} style={{ transform: [{ rotate }] }}>
      <Glyph name="sync" color={color} size={size} strokeWidth={2} />
    </Animated.View>
  );
}

// ---- buttons ---------------------------------------------------------------------------------------

export type ActionVariant = 'primary' | 'secondary' | 'danger';

/** A full-width (or `grow`) button: primary CTA, plain secondary, or the destructive fill. */
export function ActionButton({
  testID,
  label,
  onPress,
  variant = 'primary',
  busy = false,
  disabled = false,
  grow = false,
}: {
  testID: string;
  label: string;
  onPress(): void;
  variant?: ActionVariant;
  busy?: boolean;
  disabled?: boolean;
  /** Share a row equally with a sibling instead of taking the full width. */
  grow?: boolean;
}) {
  const theme = useTheme();
  const danger = dangerColours(theme);
  const off = disabled || busy;
  const border = theme.borders.button;
  const look =
    variant === 'secondary'
      ? { ...buttonStyle(theme), color: theme.colors.btnText }
      : variant === 'danger'
        ? { backgroundColor: danger.fill, color: danger.onFill }
        : { backgroundColor: theme.colors.cta, color: theme.colors.onCta };
  return (
    <Pressable
      testID={testID}
      accessibilityRole="button"
      accessibilityLabel={label}
      accessibilityState={{ disabled: off, busy }}
      disabled={off}
      onPress={onPress}
      style={[
        styles.action,
        grow ? styles.grow : styles.fullWidth,
        variant === 'secondary'
          ? look
          : {
              backgroundColor: look.backgroundColor,
              borderRadius: theme.radii.button,
              borderWidth: border?.width ?? 0,
              borderColor: border?.color,
              boxShadow: theme.shadows.cta,
            },
        { opacity: busy ? 0.75 : disabled ? 0.45 : 1 },
      ]}
    >
      {busy ? <Spinner color={look.color} /> : null}
      <Text style={[styles.actionText, { color: look.color, fontFamily: uiFace(theme.type.ui, '700') }]}>{label}</Text>
    </Pressable>
  );
}

/** A text-only button (44 pt minimum): Forgot password?, Create an account, Delete account. */
export function TextButton({
  testID,
  label,
  onPress,
  disabled = false,
  tone = 'accent',
  align = 'center',
  role = 'button',
}: {
  testID: string;
  label: string;
  onPress(): void;
  disabled?: boolean;
  tone?: 'accent' | 'danger';
  align?: 'center' | 'flex-start';
  /** `link` for navigation (it is a link on the web too); `button` for actions. */
  role?: 'button' | 'link';
}) {
  const theme = useTheme();
  const colour = tone === 'danger' ? dangerColours(theme).text : theme.colors.accent;
  return (
    <Pressable
      testID={testID}
      accessibilityRole={role}
      accessibilityLabel={label}
      accessibilityState={{ disabled }}
      disabled={disabled}
      onPress={onPress}
      style={[styles.textButton, { alignSelf: align, opacity: disabled ? 0.45 : 1 }]}
    >
      <Text style={{ color: colour, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15, textAlign: 'center' }}>{label}</Text>
    </Pressable>
  );
}

/** A 44 pt round icon button (back, close, dismiss). `surface`: the plain button fill; otherwise bare. */
export function RoundButton({
  testID,
  label,
  glyph,
  onPress,
  disabled = false,
  surface = true,
  colour,
}: {
  testID: string;
  label: string;
  glyph: GlyphName;
  onPress(): void;
  disabled?: boolean;
  surface?: boolean;
  colour?: string;
}) {
  const theme = useTheme();
  return (
    <Pressable
      testID={testID}
      accessibilityRole="button"
      accessibilityLabel={label}
      accessibilityState={{ disabled }}
      disabled={disabled}
      onPress={onPress}
      style={[styles.round, surface ? buttonStyle(theme) : null, { borderRadius: 999, opacity: disabled ? 0.45 : 1 }]}
    >
      <Glyph name={glyph} size={glyph === 'eye' || glyph === 'eyeOff' ? 20 : 18} color={colour ?? theme.colors.btnText} strokeWidth={glyph === 'eye' || glyph === 'eyeOff' ? 1.9 : 2.2} />
    </Pressable>
  );
}

// ---- messages --------------------------------------------------------------------------------------

/** An error line with its alert glyph (under a field, or above a button). */
export function ErrorLine({ testID, text, boxed = false }: { testID: string; text: string; boxed?: boolean }) {
  const theme = useTheme();
  const danger = dangerColours(theme).text;
  return (
    <View
      testID={testID}
      accessibilityRole="alert"
      accessibilityLiveRegion="polite"
      style={[
        styles.errorLine,
        boxed && [
          styles.errorBox,
          theme.backgrounds.surface,
          { borderColor: danger, borderWidth: theme.style === 'pastel' ? 2.5 : 1.5, borderRadius: theme.style === 'pastel' ? 12 : 18 },
        ],
      ]}
    >
      <View style={styles.errorGlyph}>
        <Glyph name="alert" size={boxed ? 18 : 15} color={danger} />
      </View>
      <Text style={{ color: danger, fontFamily: uiFace(theme.type.ui, '700'), fontSize: boxed ? 14 : 13, lineHeight: boxed ? 20 : 18, flex: 1 }}>{text}</Text>
    </View>
  );
}

/** A paragraph of sheet text. */
export function Para({ text, tone = 'muted', size = 14, center = false, testID }: { text: string; tone?: 'muted' | 'text'; size?: number; center?: boolean; testID?: string }) {
  const theme = useTheme();
  return (
    <Text
      testID={testID}
      style={{
        color: tone === 'text' ? theme.colors.text : theme.colors.muted,
        fontFamily: uiFace(theme.type.ui, '400'),
        fontSize: size,
        lineHeight: Math.round(size * 1.45),
        textAlign: center ? 'center' : 'auto',
      }}
    >
      {text}
    </Text>
  );
}

// ---- the text field --------------------------------------------------------------------------------

export interface AuthFieldProps {
  testID: string;
  label: string;
  value: string;
  onChangeText(text: string): void;
  autoComplete: TextInputProps['autoComplete'];
  textContentType: TextInputProps['textContentType'];
  keyboardType?: KeyboardTypeOptions;
  secureTextEntry?: boolean;
  /** The field is read-only while a request runs. */
  disabled?: boolean;
  /** Draws the error border and marks the field invalid. */
  invalid?: boolean;
  returnKeyType?: ReturnKeyTypeOptions;
  /** Keep the keyboard up when Return moves on to another field. */
  keepKeyboard?: boolean;
  onSubmitEditing?(): void;
  /** Return moves focus to this field instead of calling `onSubmitEditing`. */
  focusNext?: RefObject<ComponentRef<typeof TextInput> | null>;
  inputRef?: Ref<ComponentRef<typeof TextInput>>;
  /** The show/hide button of a password field. */
  trailing?: ReactNode;
  /** The hint or error shown under the field. */
  below?: ReactNode;
}

export function AuthField({ inputRef, focusNext, ...p }: AuthFieldProps) {
  const theme = useTheme();
  const danger = dangerColours(theme).border;
  const pill = theme.radii.button >= 24;
  return (
    <View style={styles.fieldGroup}>
      <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 13 }}>{p.label}</Text>
      <View
        style={[
          styles.fieldBox,
          theme.backgrounds.surface,
          {
            borderRadius: pill ? 24 : theme.radii.button,
            borderWidth: fieldBorderWidth(theme),
            borderColor: p.invalid ? danger : fieldBorderColour(theme),
            paddingLeft: pill ? 18 : 14,
            paddingRight: p.trailing ? 2 : 14,
            opacity: p.disabled ? 0.6 : 1,
          },
        ]}
      >
        <TextInput
          testID={p.testID}
          ref={inputRef}
          value={p.value}
          onChangeText={p.onChangeText}
          editable={!p.disabled}
          accessibilityLabel={p.label}
          autoComplete={p.autoComplete}
          textContentType={p.textContentType}
          keyboardType={p.keyboardType}
          secureTextEntry={p.secureTextEntry}
          autoCapitalize="none"
          autoCorrect={false}
          spellCheck={false}
          returnKeyType={p.returnKeyType}
          submitBehavior={p.keepKeyboard ? 'submit' : 'blurAndSubmit'}
          onSubmitEditing={() => (focusNext ? focusNext.current?.focus() : p.onSubmitEditing?.())}
          placeholderTextColor={theme.colors.muted}
          style={[styles.input, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') }]}
        />
        {p.trailing}
      </View>
      {p.below}
    </View>
  );
}

const styles = StyleSheet.create({
  action: { minHeight: 48, paddingVertical: 10, paddingHorizontal: 12, flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 8 },
  fullWidth: { alignSelf: 'stretch' },
  grow: { flex: 1, minWidth: 0 },
  actionText: { fontSize: 15, textAlign: 'center', flexShrink: 1 },
  textButton: { minHeight: 44, paddingVertical: 8, paddingHorizontal: 12, alignItems: 'center', justifyContent: 'center' },
  round: { minWidth: 44, minHeight: 44, alignItems: 'center', justifyContent: 'center' },
  errorLine: { flexDirection: 'row', alignItems: 'flex-start', gap: 6 },
  errorBox: { padding: 12, gap: 10 },
  errorGlyph: { marginTop: 1 },
  fieldGroup: { gap: 6 },
  fieldBox: { minHeight: 48, flexDirection: 'row', alignItems: 'center' },
  input: { flex: 1, minWidth: 0, minHeight: 48, paddingVertical: 10, paddingHorizontal: 0, fontSize: 16 },
});
