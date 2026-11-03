// Small pieces the people / places / themes screens share: the way back (button, Escape, the Android back
// button), the top bar, the card surface, the uppercase label and the centred state block.
import { router } from 'expo-router';
import type { ReactNode } from 'react';
import { Pressable, StyleSheet, Text, View, type ViewStyle } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { auroraTextShadow } from '../../aurora';
import { useScreenBack } from '../../search/useScreenBack';
import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { RoundIconButton } from '../../reader/components/sheetParts';
import { buttonStyle } from '../../reader/components/ui';
import { useTheme } from '../../theme/ThemeProvider';
import type { Theme } from '../../theme/types';
import { Glyph, type GlyphName } from '../glyphs';

/** Back to wherever this was opened from; with nothing behind it (a deep link), to Study. */
export function goBack() {
  if (router.canGoBack()) router.back();
  else router.replace('/study');
}

/**
 * The one way back for a screen: `onBack`, else the router. Escape (web) and the Android back button come
 * through here too. Returns the handler for the Back button.
 */
export function useEntityBack(onBack?: () => void): () => void {
  const back = onBack ?? goBack;
  useScreenBack(back);
  return back;
}

/** The round Back button under the status bar. */
export function EntityTopBar({ onBack }: { onBack(): void }) {
  const t = useT();
  const insets = useSafeAreaInsets();
  return (
    <View style={[styles.topBar, { paddingTop: insets.top + 8 }]}>
      <RoundIconButton testID="entity-back" label={t('entity.back')} icon="chevronLeft" onPress={onBack} />
    </View>
  );
}

/** The card the Study list uses: the preset's surface, border, radius and shadow (glass where the preset is). */
export function EntityCard({ children, style, testID }: { children: ReactNode; style?: ViewStyle; testID?: string }) {
  const theme = useTheme();
  return (
    <GlassSurface
      testID={testID}
      background={theme.backgrounds.surface}
      style={[
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

/** The small uppercase muted label above a group ("Overview", "Chapters", a letter). */
export function EntityLabel({ children, testID, header = true }: { children: ReactNode; testID?: string; header?: boolean }) {
  const theme = useTheme();
  return (
    <Text
      testID={testID}
      accessibilityRole={header ? 'header' : undefined}
      style={{
        color: theme.colors.muted,
        fontFamily: uiFace(theme.type.ui, '700'),
        fontSize: 12,
        letterSpacing: 0.6,
        textTransform: 'uppercase',
        // Section labels sit on the screen background, which runs the aurora in the glass looks.
        ...auroraTextShadow(theme),
      }}
    >
      {children}
    </Text>
  );
}

/** A heading in the preset's head type. */
export function entityHeadStyle(theme: Theme, size: number, weight: '400' | '700' | '800' = '700') {
  return { color: theme.colors.text, fontFamily: uiFace(theme.type.head, weight), fontSize: size };
}

/** A centred block: a round glyph, a title, a line of text and (optionally) one action. */
export function EntityStateBlock({
  testID,
  glyph,
  title,
  body,
  actionLabel,
  actionTestID,
  onAction,
}: {
  testID: string;
  glyph: GlyphName;
  title: string;
  body: string;
  actionLabel?: string;
  actionTestID?: string;
  onAction?: () => void;
}) {
  const theme = useTheme();
  const border = theme.borders.button;
  return (
    <View testID={testID} style={styles.state}>
      <View
        accessible={false}
        style={[
          styles.stateDisc,
          theme.backgrounds.button,
          { borderWidth: border?.width ?? 0, borderColor: border?.color },
        ]}
      >
        <Glyph name={glyph} color={theme.colors.muted} size={26} strokeWidth={1.9} />
      </View>
      <Text accessibilityRole="header" style={[entityHeadStyle(theme, 17), styles.stateTitle]}>
        {title}
      </Text>
      <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 21, textAlign: 'center' }}>
        {body}
      </Text>
      {actionLabel ? (
        <Pressable
          testID={actionTestID}
          accessibilityRole="button"
          onPress={onAction}
          style={[
            styles.stateAction,
            buttonStyle(theme),
            { backgroundColor: theme.colors.cta, backgroundImage: undefined, boxShadow: theme.shadows.cta },
          ]}
        >
          <Text style={{ color: theme.colors.onCta, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{actionLabel}</Text>
        </Pressable>
      ) : null}
    </View>
  );
}

const styles = StyleSheet.create({
  topBar: { paddingHorizontal: 16, paddingBottom: 4, flexDirection: 'row', alignItems: 'center' },
  state: { marginTop: 36, alignItems: 'center', gap: 10, paddingHorizontal: 28 },
  stateDisc: { width: 56, height: 56, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  stateTitle: { textAlign: 'center' },
  stateAction: { marginTop: 6, minHeight: 44, paddingHorizontal: 20, alignItems: 'center', justifyContent: 'center' },
});
