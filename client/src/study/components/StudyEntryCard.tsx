// One saved item in the Study list, as drawn: a colour bar, an icon for the kind, the reference and date,
// the verse text (two lines, in the reader's translation) and, for a note, the note. The card is one button
// that opens the passage in the reader.
import { memo, useMemo } from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';
import Svg, { Path } from 'react-native-svg';

import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import { splitAlternateReadings } from '../../reader/alternateReadings';
import { bookNameForLocale, findBook, useBooks } from '../../reader/books';
import { Icon } from '../../reader/components/icons';
import type { TranslationId } from '../../reader/translations';
import { useChapter } from '../../reader/useChapter';
import { UNKNOWN_TIME } from '../../storage/keys';
import { HIGHLIGHTS } from '../../theme/highlights';
import { useTheme } from '../../theme/ThemeProvider';
import type { StudyEntry } from '../list';
import { formatReference } from '../share';
import { useScriptureFont } from './scriptureFont';

/** The highlighter, from the design (the shared icon set has none). */
const HIGHLIGHTER = 'M9 11 4 16v4h4l5-5M14 6l4 4M12 8l5-5 4 4-5 5';

function KindIcon({ kind, color }: { kind: StudyEntry['kind']; color: string }) {
  if (kind === 'note') return <Icon name="note" size={16} color={color} strokeWidth={2} />;
  if (kind === 'bookmark') return <Icon name="bookmark" size={16} color={color} strokeWidth={2} />;
  return (
    <Svg width={16} height={16} viewBox="0 0 24 24" accessible={false}>
      <Path d={HIGHLIGHTER} fill="none" stroke={color} strokeWidth={2} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}

/** The verses `start…end` of a loaded chapter, alternate readings removed, joined for the translation. */
function verseText(verses: readonly { verse: number; text: string }[], start: number, end: number, zh: boolean): string {
  return verses
    .filter((v) => v.verse >= start && v.verse <= end)
    .sort((a, b) => a.verse - b.verse)
    .map((v) =>
      splitAlternateReadings(v.text)
        .filter((run) => !run.note)
        .map((run) => run.text)
        .join('')
        .trim(),
    )
    .filter((text) => text !== '')
    .join(zh ? '' : ' ');
}

function VerseText({ entry, translation }: { entry: StudyEntry; translation: TranslationId }) {
  const theme = useTheme();
  const { t } = useI18n();
  const books = useBooks();
  const book = findBook(books.data, entry.bookNumber);
  const chapter = useChapter(book, entry.chapter, translation);
  const { fontFamily, zh } = useScriptureFont(theme, translation);
  const text = useMemo(
    () => (chapter.data ? verseText(chapter.data.verses, entry.start, entry.end, zh) : ''),
    [chapter.data, entry.start, entry.end, zh],
  );
  const muted = { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 };

  if (chapter.isError || books.isError) return <Text style={muted}>{t('study.textError')}</Text>;
  if (!chapter.data) return <Text style={muted}>{t('common.loading')}</Text>;
  if (text === '') return null; // the translation lacks these verses
  return (
    <Text
      testID={`study-entry-${entry.id}-text`}
      numberOfLines={2}
      style={{ color: theme.colors.text, fontFamily, fontSize: 16, lineHeight: Math.round(16 * (zh ? 1.8 : 1.5)) }}
    >
      {text}
    </Text>
  );
}

export const StudyEntryCard = memo(function StudyEntryCard({
  entry,
  translation,
  onOpen,
}: {
  entry: StudyEntry;
  translation: TranslationId;
  onOpen(entry: StudyEntry): void;
}) {
  const theme = useTheme();
  const { t, locale, formatDate } = useI18n();
  const books = useBooks();
  const book = findBook(books.data, entry.bookNumber);

  const verses = Array.from({ length: entry.end - entry.start + 1 }, (_, i) => entry.start + i);
  const ref = formatReference(book ? bookNameForLocale(book, locale) : String(entry.bookNumber), entry.chapter, verses);
  const when = new Date(entry.time);
  const date =
    entry.time === UNKNOWN_TIME || Number.isNaN(when.getTime()) ? '' : formatDate(when, { month: 'short', day: 'numeric' });
  const kind =
    entry.kind === 'highlight' && entry.colour
      ? t('study.kind.highlight', { colour: t(HIGHLIGHTS[entry.colour].nameKey) })
      : t(entry.kind === 'note' ? 'study.kind.note' : 'study.kind.bookmark');
  // No date: the label ends after the reference.
  const label = t('study.entryLabel', { kind, ref, date }).replace(/[\s,，]+$/, '');
  const bar = entry.kind === 'highlight' && entry.colour ? HIGHLIGHTS[entry.colour].swatch : theme.colors.muted;

  return (
    <Pressable
      testID={`study-entry-${entry.id}`}
      accessibilityRole="button"
      accessibilityLabel={label}
      accessibilityHint={t('study.openHint')}
      onPress={() => onOpen(entry)}
      style={({ pressed }) => ({ opacity: pressed ? 0.85 : 1 })}
    >
      <GlassSurface
        background={theme.backgrounds.surface}
        style={[
          styles.card,
          {
            borderRadius: theme.radii.card,
            borderWidth: theme.borders.card.width,
            borderColor: theme.borders.card.color,
            boxShadow: theme.shadows.card ?? undefined,
          },
        ]}
      >
        <View accessible={false} style={[styles.bar, { backgroundColor: bar }]} />
        <View style={styles.body}>
          <View style={styles.top}>
            <KindIcon kind={entry.kind} color={theme.colors.muted} />
            <Text style={[styles.ref, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}>{ref}</Text>
            {date !== '' ? (
              <Text style={[styles.date, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }]}>{date}</Text>
            ) : null}
          </View>
          <VerseText entry={entry} translation={translation} />
          {entry.note !== null ? (
            <View style={[styles.note, theme.backgrounds.button]}>
              <Text
                testID={`study-entry-${entry.id}-note`}
                numberOfLines={4}
                style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 20 }}
              >
                {entry.note}
              </Text>
            </View>
          ) : null}
        </View>
      </GlassSurface>
    </Pressable>
  );
});

const styles = StyleSheet.create({
  card: { flexDirection: 'row', gap: 12, paddingVertical: 14, paddingLeft: 12, paddingRight: 14 },
  bar: { width: 5, borderRadius: 999 },
  body: { flex: 1, minWidth: 0, gap: 5 },
  top: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  ref: { flexShrink: 1, fontSize: 15 },
  date: { marginLeft: 'auto', fontSize: 12 },
  note: { paddingHorizontal: 10, paddingVertical: 8, borderRadius: 10 },
});
