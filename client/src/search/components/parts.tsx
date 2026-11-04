// Small pieces the search screen's groups share, as drawn in design/proposed/r5-search.html: the group label,
// the card of rows, one row, the centred state block (nothing found, offline) and the loading placeholders.
import type { ReactNode } from 'react';
import { Platform, Pressable, StyleSheet, Text, View } from 'react-native';

import { GlassSurface } from '../../components/GlassSurface';
import { Glyph, type GlyphName } from '../../entities/glyphs';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';

/** A group's label: small, uppercase, muted, and a heading for screen readers. */
export function GroupLabel({ children }: { children: string }) {
  const theme = useTheme();
  return (
    <Text
      accessibilityRole="header"
      style={[styles.groupLabel, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700') }]}
    >
      {children}
    </Text>
  );
}

/** The card the Study list draws its entries on: the preset's surface, border, radius and shadow. */
export function Card({ children }: { children: ReactNode }) {
  const theme = useTheme();
  return (
    <GlassSurface
      background={theme.backgrounds.surface}
      style={{
        borderRadius: theme.radii.card,
        borderWidth: theme.borders.card.width,
        borderColor: theme.borders.card.color,
        boxShadow: theme.shadows.card ?? undefined,
      }}
    >
      {children}
    </GlassSurface>
  );
}

/** A 32 pt round disc holding a glyph; `active` fills it with the accent (the exact passage). */
export function Disc({ glyph, active = false }: { glyph: GlyphName; active?: boolean }) {
  const theme = useTheme();
  return (
    <View
      accessible={false}
      style={[styles.disc, active ? { backgroundColor: theme.colors.cta } : theme.backgrounds.button]}
    >
      <Glyph name={glyph} size={17} color={active ? theme.colors.onCta : theme.colors.btnText} />
    </View>
  );
}

/** One row of a grouped card: a disc, a title with an optional sub-line, an optional note and a chevron. */
export function ListRow({
  testID,
  first,
  glyph,
  active,
  title,
  sub,
  note,
  label,
  onPress,
}: {
  testID: string;
  first: boolean;
  glyph: GlyphName;
  active?: boolean;
  title: string;
  sub?: string;
  note?: string;
  label?: string;
  onPress(): void;
}) {
  const theme = useTheme();
  return (
    <Pressable
      testID={testID}
      {...(Platform.OS === 'web' ? { dataSet: { hover: 'flat' } } : {})}
      accessibilityRole="button"
      accessibilityLabel={label}
      onPress={onPress}
      style={({ pressed }) => [
        styles.row,
        !first && { borderTopWidth: StyleSheet.hairlineWidth, borderTopColor: theme.borders.sheet.color },
        { opacity: pressed ? 0.85 : 1 },
      ]}
    >
      <Disc glyph={glyph} active={active ?? false} />
      <View style={styles.rowText}>
        <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 16 }}>{title}</Text>
        {sub ? <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>{sub}</Text> : null}
      </View>
      {note ? (
        <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>{note}</Text>
      ) : null}
      <Glyph name="chevronRight" size={16} color={theme.colors.muted} strokeWidth={2.2} />
    </Pressable>
  );
}

/** Nothing found, or the server could not be reached: an icon disc, a title, a line, and maybe a button. */
export function StateBlock({
  testID,
  glyph,
  title,
  body,
  retry,
  live = false,
}: {
  testID: string;
  glyph: GlyphName;
  title: string;
  body: string;
  retry?: { testID: string; label: string; onPress(): void };
  live?: boolean;
}) {
  const theme = useTheme();
  return (
    <View testID={testID} accessibilityLiveRegion={live ? 'polite' : undefined} style={styles.state}>
      <View accessible={false} style={[styles.stateDisc, theme.backgrounds.button]}>
        <Glyph name={glyph} size={26} strokeWidth={1.9} color={theme.colors.muted} />
      </View>
      <Text
        accessibilityRole="header"
        style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 17, textAlign: 'center' }}
      >
        {title}
      </Text>
      <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 21, textAlign: 'center' }}>
        {body}
      </Text>
      {retry ? (
        <Pressable
          testID={retry.testID}
          accessibilityRole="button"
          onPress={retry.onPress}
          style={[
            styles.retry,
            { backgroundColor: theme.colors.cta, borderRadius: theme.radii.button, boxShadow: theme.shadows.cta },
          ]}
        >
          <Text style={{ color: theme.colors.onCta, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{retry.label}</Text>
        </Pressable>
      ) : null}
    </View>
  );
}

/** Three still placeholder cards while the verse search runs (no animation, so Reduce Motion needs no case). */
export function SearchingPlaceholder({ testID }: { testID: string }) {
  const theme = useTheme();
  const t = useT();
  const bar = (width: `${number}%`) => (
    <View style={[styles.bar, { width, backgroundColor: theme.colors.muted }]} />
  );
  return (
    <View testID={testID} accessibilityLiveRegion="polite" style={styles.group}>
      <GroupLabel>{t('search.searching')}</GroupLabel>
      {[0, 1, 2].map((i) => (
        <Card key={i}>
          <View accessible={false} style={styles.skeleton}>
            {bar('34%')}
            {bar('92%')}
            {bar('70%')}
          </View>
        </Card>
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  groupLabel: { fontSize: 12, letterSpacing: 0.6, textTransform: 'uppercase' },
  disc: { width: 32, height: 32, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  row: { minHeight: 52, flexDirection: 'row', alignItems: 'center', gap: 12, paddingHorizontal: 14, paddingVertical: 8 },
  rowText: { flex: 1, minWidth: 0, gap: 1 },
  state: { marginTop: 18, alignItems: 'center', gap: 10, paddingHorizontal: 28 },
  stateDisc: { width: 56, height: 56, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  retry: { marginTop: 6, minHeight: 44, paddingHorizontal: 20, alignItems: 'center', justifyContent: 'center' },
  group: { gap: 10 },
  skeleton: { gap: 9, padding: 14 },
  bar: { height: 12, borderRadius: 6, opacity: 0.22 },
});
