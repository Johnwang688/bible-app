// "Continue with Google" (GOOGLE, board 11-03 row 7; prototype design/proposed/r6b-google.html). Google's branding
// rules: the full-colour G on Google's own light or dark fill with its stroke, Roboto Medium, Google's wording. The
// corner shape is the preset's. While Google's window is open the G and the label stay, a spinner sits at the right
// end, the accessible name says it is waiting, and the button stays pressable: a second press replaces the first
// window (Firebase cancels it), which brings a window lost behind the page back.
import { Platform, Pressable, StyleSheet, Text, View } from 'react-native';
import Svg, { Path } from 'react-native-svg';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { GOOGLE_BUTTON, GOOGLE_G } from '../../theme/google';
import { useTheme } from '../../theme/ThemeProvider';
import { Glyph, Spinner } from './parts';

/** Roboto when the device has it (Google's font for the button), else the system sans. */
const ROBOTO = Platform.OS === 'web' ? 'Roboto, system-ui, -apple-system, "Segoe UI", sans-serif' : undefined;

/** Google's G mark (decorative). */
export function GoogleG({ size = 20 }: { size?: number }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 48 48" accessible={false}>
      <Path fill={GOOGLE_G.red} d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z" />
      <Path fill={GOOGLE_G.blue} d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z" />
      <Path fill={GOOGLE_G.yellow} d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z" />
      <Path fill={GOOGLE_G.green} d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z" />
    </Svg>
  );
}

export function GoogleButton({ testID, waiting, disabled = false, onPress }: { testID: string; waiting: boolean; disabled?: boolean; onPress(): void }) {
  const t = useT();
  const theme = useTheme();
  const c = GOOGLE_BUTTON[theme.mode];
  const label = t('account.google.continue');
  return (
    <Pressable
      testID={testID}
      accessibilityRole="button"
      accessibilityLabel={waiting ? t('account.google.waiting') : label}
      accessibilityState={{ disabled, busy: waiting }}
      disabled={disabled}
      onPress={onPress}
      style={[
        styles.button,
        { backgroundColor: c.fill, borderColor: c.stroke, borderRadius: theme.radii.button, opacity: disabled ? 0.45 : 1 },
      ]}
    >
      <GoogleG />
      <Text style={[styles.caption, { color: c.text, fontFamily: ROBOTO }]}>{label}</Text>
      {waiting ? (
        <View style={styles.spinner} testID={`${testID}-waiting`}>
          <Spinner color={c.text} size={18} />
        </View>
      ) : null}
    </Pressable>
  );
}

/** The "or use email" divider under the Google button. */
export function OrDivider({ text }: { text: string }) {
  const theme = useTheme();
  const rule = <View accessible={false} style={[styles.rule, { backgroundColor: theme.colors.muted }]} />;
  return (
    <View style={styles.divider}>
      {rule}
      <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>{text}</Text>
      {rule}
    </View>
  );
}

/** A quiet status line (no error): Google's window closed, or what to do while it is open. Announced politely. */
export function QuietLine({ testID, text }: { testID: string; text: string }) {
  const theme = useTheme();
  return (
    <View testID={testID} accessibilityLiveRegion="polite" role="status" style={styles.quiet}>
      <View style={styles.quietGlyph}>
        <Glyph name="info" size={15} color={theme.colors.muted} />
      </View>
      <Text style={{ flex: 1, color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, lineHeight: 18 }}>{text}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  divider: { flexDirection: 'row', alignItems: 'center', gap: 12 },
  rule: { flex: 1, height: StyleSheet.hairlineWidth * 2, opacity: 0.45 },
  quiet: { flexDirection: 'row', alignItems: 'flex-start', gap: 6 },
  quietGlyph: { marginTop: 1 },
  button: {
    minHeight: 48,
    alignSelf: 'stretch',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 10,
    paddingVertical: 10,
    paddingHorizontal: 40,
    borderWidth: 1,
  },
  caption: { fontSize: 14, lineHeight: 20, fontWeight: '500', letterSpacing: 0.25, textAlign: 'center', flexShrink: 1 },
  spinner: { position: 'absolute', right: 12, top: 0, bottom: 0, justifyContent: 'center' },
});
