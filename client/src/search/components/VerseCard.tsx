// One verse result, as drawn: the reference, then the verse in its translation's Scripture font with the query's
// words marked, and a chevron. The whole card is one button that opens the verse in context.
import { memo, useMemo } from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';

import { Glyph } from '../../entities/glyphs';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { splitAlternateReadings } from '../../reader/alternateReadings';
import { useTheme } from '../../theme/ThemeProvider';
import { excerptAround, splitMarked } from '../excerpt';
import { Card } from './parts';

const FONT_SIZE = 16;
const LINE_HEIGHT = Math.round(FONT_SIZE * 1.55);

/** The verse without CUV alternate readings. */
export function plainVerse(text: string): string {
  return splitAlternateReadings(text)
    .filter((run) => !run.note)
    .map((run) => run.text)
    .join('')
    .trim();
}

export const VerseCard = memo(function VerseCard({
  testID,
  reference,
  text,
  terms,
  fontFamily,
  onOpen,
}: {
  testID: string;
  /** The reference in the interface language, "John 3:16". */
  reference: string;
  /** The verse as the API sent it. */
  text: string;
  /** The query's words, marked wherever they occur. */
  terms: readonly string[];
  fontFamily: string | undefined;
  onOpen(): void;
}) {
  const theme = useTheme();
  const t = useT();
  const full = useMemo(() => plainVerse(text), [text]);
  // The card clamps to three lines, so the text starts near the first match; the label keeps the whole verse.
  const pieces = useMemo(() => splitMarked(excerptAround(full, [...terms]), terms), [full, terms]);

  return (
    <Pressable
      testID={testID}
      accessibilityRole="button"
      accessibilityLabel={`${reference}. ${full}`}
      accessibilityHint={t('search.openHint')}
      onPress={onOpen}
      style={({ pressed }) => [styles.press, { opacity: pressed ? 0.85 : 1 }]}
    >
      <Card>
        <View accessible={false} style={styles.card}>
          <View style={styles.body}>
            <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 15 }}>{reference}</Text>
            <Text
              numberOfLines={3}
              style={{ color: theme.colors.text, fontFamily, fontSize: FONT_SIZE, lineHeight: LINE_HEIGHT }}
            >
              {pieces.map((piece, i) =>
                piece.hit ? (
                  <Text
                    key={i}
                    style={{ backgroundColor: theme.colors.hl, color: theme.colors.hlText, fontWeight: '600' }}
                  >
                    {piece.text}
                  </Text>
                ) : (
                  piece.text
                ),
              )}
            </Text>
          </View>
          <Glyph name="chevronRight" size={16} color={theme.colors.muted} strokeWidth={2.2} />
        </View>
      </Card>
    </Pressable>
  );
});

const styles = StyleSheet.create({
  press: { minHeight: 44 },
  card: { flexDirection: 'row', alignItems: 'center', gap: 10, paddingVertical: 12, paddingHorizontal: 14 },
  body: { flex: 1, minWidth: 0, gap: 5 },
});
