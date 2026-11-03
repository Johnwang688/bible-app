// Home's one-line "confirm your email" banner (email verification, decision 13, John 11-03; prototype
// design/proposed/r6b-verify.html section 8). Shown only while someone is signed in with an unconfirmed email, between
// the greeting and Today. The whole row is one link to Me, where the account card does the confirming; it has no
// buttons of its own and no dismiss. It says what the card's sync line says: "start syncing" for a new account, "Sync
// is paused" (the pause glyph in the danger colour) for one made before this change. It goes as soon as the email is
// confirmed. Outside an AccountProvider (screens tested bare) it renders nothing.
import { router } from 'expo-router';
import { Pressable, StyleSheet, Text, View } from 'react-native';

import { useOptionalAccount } from '../auth/AccountProvider';
import { Glyph } from '../auth/components/parts';
import { GlassSurface } from '../components/GlassSurface';
import { uiFace } from '../fonts/fonts';
import { useI18n } from '../i18n/I18nProvider';
import { useTheme } from '../theme/ThemeProvider';
import { dangerColours } from '../theme/danger';

const openMe = () => router.navigate('/me');

/** The text's line height; the leading glyph sits on the first line. */
const LINE = 19;

export function VerifyBanner({ onPress = openMe }: { onPress?: () => void }) {
  const account = useOptionalAccount();
  const theme = useTheme();
  const { t } = useI18n();
  const verify = account && account.status === 'signedIn' && account.signInAllowed ? account.verify : null;
  if (!verify) return null;
  const paused = verify.kind === 'paused';
  const label = t(paused ? 'home.verifyBanner.paused' : 'home.verifyBanner.new');
  const pop = theme.style === 'pastel';
  return (
    <Pressable
      testID="home-verify-banner"
      accessibilityRole="link"
      accessibilityLabel={label}
      accessibilityHint={t('home.verifyBanner.hint')}
      onPress={onPress}
      style={({ pressed, hovered }: { pressed: boolean; hovered?: boolean }) => [
        // The preset's usual press: a dimmer fill on glass; on pop, the 2 px shift onto its hard shadow.
        (pressed || hovered) && (pop ? { transform: [{ translateX: 2 }, { translateY: 2 }] } : { opacity: 0.72 }),
      ]}
    >
      <GlassSurface
        background={theme.backgrounds.surface}
        style={[
          styles.row,
          {
            borderRadius: theme.radii.card,
            borderWidth: theme.borders.card.width,
            borderColor: theme.borders.card.color,
            boxShadow: theme.shadows.card ?? undefined,
          },
        ]}
      >
        {/* The glyph sits on the text's first line when it wraps (large text); the chevron stays centred. */}
        <View style={styles.message}>
          <View style={styles.lead}>
            <Glyph name={paused ? 'pause' : 'mail'} size={18} strokeWidth={paused ? 2.2 : 2} color={paused ? dangerColours(theme).text : theme.colors.text} />
          </View>
          <Text style={[styles.text, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }]}>{label}</Text>
        </View>
        <Glyph name="chevron" size={18} color={theme.colors.muted} />
      </GlassSurface>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  row: { minHeight: 48, flexDirection: 'row', alignItems: 'center', gap: 10, paddingVertical: 8, paddingLeft: 14, paddingRight: 10 },
  message: { flex: 1, minWidth: 0, flexDirection: 'row', alignItems: 'flex-start', gap: 10 },
  lead: { marginTop: (LINE - 18) / 2 },
  text: { flex: 1, minWidth: 0, fontSize: 14, lineHeight: LINE },
});
