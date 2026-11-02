// The chapter text (Reader.dc.html, ParallelPhone.dc.html, ParallelTablet.dc.html).
// One translation: a single flowing paragraph of tappable verses. Two translations: interleaved
// verse by verse on a phone, two aligned columns when the window is wide.
import { useEffect, useState } from 'react';
import { Platform, Pressable, StyleSheet, Text, useWindowDimensions, View, type TextStyle, type ViewStyle } from 'react-native';

import type { ChapterOut } from '../../api/schemas';
import { scriptureFace, uiFace } from '../../fonts/fonts';
import { ensureFont, LAZY_FONT_FAMILY } from '../../fonts/lazy';
import { useT } from '../../i18n/I18nProvider';
import { TEXT_SIZES, type VerseRef } from '../../storage/keys';
import type { StudyItemsApi } from '../../study';
import { HIGHLIGHTS, type HighlightId } from '../../theme/highlights';
import { useTheme } from '../../theme/ThemeProvider';
import type { Theme } from '../../theme/types';
import { alignVerses } from '../align';
import { splitAlternateReadings } from '../alternateReadings';
import { isChineseTranslation, TRANSLATIONS, type TranslationId } from '../translations';
import { Icon } from './icons';
import { buttonStyle } from './ui';

/** Windows at least this wide (tablets, the web) get two columns. */
export const WIDE_BREAKPOINT = 768;
export const WIDE_PADDING = 40;
export const NARROW_PADDING = 22;
const READING_MAX_WIDTH = 720;
const VERSE_NUMBER_COLUMN = 44;

export interface SecondChapter {
  chapter: ChapterOut;
  translation: TranslationId;
}

export interface ChapterViewProps {
  chapter: ChapterOut;
  translation: TranslationId;
  /** The parallel translation's chapter; absent when reading one translation. */
  second?: SecondChapter | null;
  /** Index into TEXT_SIZES. */
  textSize: number;
  /** The first selected verse (the selection is `selectedVerse` to `selectedEnd`). */
  selectedVerse: number | null;
  /** The last selected verse of a range; absent for a single verse. */
  selectedEnd?: number | null;
  /** Highlights, notes and bookmarks to draw. Absent: none. */
  study?: Pick<StudyItemsApi, 'highlightOf' | 'noteOf' | 'isBookmarked'>;
  /** A tap on the verse text or its number. */
  onVersePress(verse: number): void;
  /** A long press on the verse text (extends the selection). */
  onVerseLongPress?(verse: number): void;
  /** Hands the screen each verse-tools button, so focus can return to it when the sheet closes. */
  registerTools?(verse: number, node: unknown): void;
  /** Swap the two translations (the wide layout's header). */
  onSwap?(): void;
}

// Once the Chinese font has loaded it stays loaded; later screens start with it.
let chineseFontLoaded = false;

/** Loads the Chinese Scripture font in the background. Text uses the system font until it is ready. */
function useChineseFont(needed: boolean): string | undefined {
  // The module flag is the source of truth, read on every render; the state only prompts a re-render.
  // A load that finishes while another translation is shown still counts when we come back.
  const [, setLoaded] = useState(chineseFontLoaded);
  useEffect(() => {
    if (!needed || chineseFontLoaded) return;
    ensureFont('chineseScripture')
      .then(() => {
        chineseFontLoaded = true;
        setLoaded(true); // a no-op once unmounted
      })
      .catch(() => undefined); // keep the system font; the next visit tries again
  }, [needed]);
  return needed && chineseFontLoaded ? LAZY_FONT_FAMILY.chineseScripture : undefined;
}

interface Face {
  fontFamily: string | undefined;
  fontSize: number;
  lineHeight: number;
}

function face(theme: Theme, translation: TranslationId, size: number, chineseFont: string | undefined): Face {
  const zh = isChineseTranslation(translation);
  return {
    fontFamily: zh ? chineseFont : scriptureFace(theme.type.scripture),
    fontSize: size,
    lineHeight: Math.round(size * (zh ? 1.8 : 1.72)),
  };
}

function Runs({ text, size, color, noteColor }: { text: string; size: number; color: string; noteColor: string }) {
  return (
    <>
      {splitAlternateReadings(text).map((run, i) => (
        <Text key={i} style={{ fontSize: run.note ? size * 0.7 : size, color: run.note ? noteColor : color }}>
          {run.text}
        </Text>
      ))}
    </>
  );
}

/** How a verse is drawn: a highlight's wash, or the selected look. A selected highlighted verse keeps its wash. */
interface Look {
  background: string | undefined;
  /** Selected text sits on the `hl` colour, so it takes the `hlText` colour. */
  onSelectedColour: boolean;
  /** Selected over a highlight: the wash stays, and this marks the selection instead. */
  marked: boolean;
}

function lookOf(theme: Theme, highlight: HighlightId | null, selected: boolean): Look {
  if (highlight) return { background: HIGHLIGHTS[highlight].wash[theme.mode], onSelectedColour: false, marked: selected };
  if (selected) return { background: theme.colors.hl, onSelectedColour: true, marked: false };
  return { background: undefined, onSelectedColour: false, marked: false };
}

/** The mark that shows a selection over a highlight: an underline on text, an outline on a row. */
function markStyles(theme: Theme) {
  return {
    text: { textDecorationLine: 'underline', textDecorationColor: theme.colors.accent } as TextStyle,
    row: { outlineWidth: 2, outlineStyle: 'solid', outlineColor: theme.colors.accent } as ViewStyle,
  };
}

interface VerseInfo {
  n: number;
  selected: boolean;
  look: Look;
  hasNote: boolean;
  bookmarked: boolean;
  label: string;
}

/** The small note and bookmark glyphs after a verse number. Decorative: the tools label says it in words. */
function Markers({ hasNote, bookmarked, color }: { hasNote: boolean; bookmarked: boolean; color: string }) {
  return (
    <>
      {hasNote ? <Icon name="note" size={10} color={color} strokeWidth={2} filled /> : null}
      {bookmarked ? <Icon name="bookmark" size={10} color={color} strokeWidth={2} filled /> : null}
    </>
  );
}

/**
 * The verse number, which is the verse's tools control. Nested inside the verse text it is a Text
 * button: on the web that renders as a short inline-block <button>, so the paragraph still flows.
 */
function VerseTools({
  info,
  color,
  onPress,
  registerTools,
}: {
  info: VerseInfo;
  color: string;
  onPress(): void;
  registerTools?(verse: number, node: unknown): void;
}) {
  const theme = useTheme();
  const style: TextStyle = {
    fontFamily: uiFace(theme.type.ui, '700'),
    fontSize: 11,
    color,
    verticalAlign: 'top',
    ...(Platform.OS === 'web' ? { paddingHorizontal: 3 } : null),
  };
  // Thin spaces stand in for padding where nested Text does not support it. The markers sit inside the
  // button, so they never wrap away from the number.
  return (
    <Text
      ref={(node) => registerTools?.(info.n, node)}
      testID={`verse-${info.n}-tools`}
      accessibilityRole="button"
      accessibilityLabel={info.label}
      accessibilityState={{ selected: info.selected }}
      onPress={onPress}
      style={style}
    >
      {` ${info.n} `}
      <Markers hasNote={info.hasNote} bookmarked={info.bookmarked} color={color} />
    </Text>
  );
}

/** An empty cell for a verse one translation lacks, so nothing shifts. */
function Missing({ testID, translation, verse, height }: { testID: string; translation: TranslationId; verse: number; height: number }) {
  const t = useT();
  return (
    <View
      testID={testID}
      accessible
      accessibilityLabel={t('reader.verseMissing', { translation: t(TRANSLATIONS[translation].shortKey), n: verse })}
      style={{ minHeight: height }}
    />
  );
}

export function ChapterView({
  chapter,
  translation,
  second,
  textSize,
  selectedVerse,
  selectedEnd,
  study,
  onVersePress,
  onVerseLongPress,
  registerTools,
  onSwap,
}: ChapterViewProps) {
  const theme = useTheme();
  const t = useT();
  const { width } = useWindowDimensions();
  const size = TEXT_SIZES[textSize] ?? TEXT_SIZES[2];
  const secondTranslation = second?.translation;
  const chineseFont = useChineseFont(isChineseTranslation(translation) || (!!secondTranslation && isChineseTranslation(secondTranslation)));
  const marks = markStyles(theme);

  // Study items attach to the reference, so they show in every translation.
  const info = (n: number): VerseInfo => {
    const ref: VerseRef = { bookNumber: chapter.book_number, chapter: chapter.chapter, verse: n };
    const selected = selectedVerse !== null && n >= selectedVerse && n <= (selectedEnd ?? selectedVerse);
    const hasNote = !!study?.noteOf(ref);
    const bookmarked = !!study?.isBookmarked(ref);
    let label = t('sheet.verseTools', { n });
    if (hasNote) label += `, ${t('sheet.hasNote')}`;
    if (bookmarked) label += `, ${t('sheet.isBookmarked')}`;
    return { n, selected, look: lookOf(theme, study?.highlightOf(ref) ?? null, selected), hasNote, bookmarked, label };
  };

  // The verse text is plain text to a screen reader; a tap or long press (touch and mouse) still reaches it.
  const textPress = (n: number) => ({
    onPress: () => onVersePress(n),
    onLongPress: onVerseLongPress ? () => onVerseLongPress(n) : undefined,
  });

  if (!second) {
    const f = face(theme, translation, size, chineseFont);
    const space = isChineseTranslation(translation) ? '' : ' ';
    return (
      <View style={styles.reading}>
        <Text style={[f, { color: theme.colors.text }]}>
          {chapter.verses.map((v) => {
            const i = info(v.verse);
            const onColour = i.look.onSelectedColour;
            return (
              <Text
                key={v.verse}
                testID={`verse-${v.verse}`}
                {...textPress(v.verse)}
                style={[i.look.background ? { backgroundColor: i.look.background } : null, i.look.marked ? marks.text : null]}
              >
                <VerseTools
                  info={i}
                  color={onColour ? theme.colors.hlText : theme.colors.vnum}
                  onPress={() => onVersePress(v.verse)}
                  registerTools={registerTools}
                />
                <Runs
                  text={v.text}
                  size={size}
                  color={onColour ? theme.colors.hlText : theme.colors.text}
                  noteColor={onColour ? theme.colors.hlText : theme.colors.muted}
                />
                {space}
              </Text>
            );
          })}
        </Text>
      </View>
    );
  }

  const rows = alignVerses(chapter.verses, second.chapter.verses);
  const firstFace = face(theme, translation, size, chineseFont);
  const wide = width >= WIDE_BREAKPOINT;
  const rowStyle = (i: VerseInfo) => [i.look.background ? { backgroundColor: i.look.background } : null, i.look.marked ? marks.row : null];

  if (!wide) {
    const secondSize = size * 0.92;
    const secondFace = face(theme, second.translation, secondSize, chineseFont);
    return (
      <View style={styles.phoneRows}>
        {rows.map((row) => {
          const i = info(row.verse);
          const onColour = i.look.onSelectedColour;
          const numberColor = onColour ? theme.colors.hlText : theme.colors.vnum;
          return (
            <View key={row.verse} testID={`verse-row-${row.verse}`} style={[styles.phoneRow, ...rowStyle(i)]}>
              {row.primary ? (
                <Text testID={`verse-${row.verse}`} {...textPress(row.verse)} style={[firstFace, { color: onColour ? theme.colors.hlText : theme.colors.text }]}>
                  <VerseTools info={i} color={numberColor} onPress={() => onVersePress(row.verse)} registerTools={registerTools} />
                  <Runs
                    text={row.primary.text}
                    size={size}
                    color={onColour ? theme.colors.hlText : theme.colors.text}
                    noteColor={onColour ? theme.colors.hlText : theme.colors.muted}
                  />
                </Text>
              ) : (
                <Missing testID={`verse-${row.verse}-missing-first`} translation={translation} verse={row.verse} height={firstFace.lineHeight} />
              )}
              {row.secondary ? (
                <Text
                  testID={`verse-${row.verse}-second`}
                  {...textPress(row.verse)}
                  style={[secondFace, { color: onColour ? theme.colors.hlText : theme.colors.muted }]}
                >
                  {row.primary ? null : (
                    <VerseTools info={i} color={numberColor} onPress={() => onVersePress(row.verse)} registerTools={registerTools} />
                  )}
                  <Runs
                    text={row.secondary.text}
                    size={secondSize}
                    color={onColour ? theme.colors.hlText : theme.colors.muted}
                    noteColor={onColour ? theme.colors.hlText : theme.colors.muted}
                  />
                </Text>
              ) : (
                <Missing testID={`verse-${row.verse}-missing`} translation={second.translation} verse={row.verse} height={secondFace.lineHeight} />
              )}
            </View>
          );
        })}
      </View>
    );
  }

  const secondFace = face(theme, second.translation, size, chineseFont);
  const headName = (id: TranslationId, labelKey: 'reader.firstTranslation' | 'reader.secondTranslation', testID: string) => {
    const name = t(TRANSLATIONS[id].nameKey);
    return (
      <View testID={testID} accessible accessibilityLabel={t(labelKey, { translation: name })} style={[styles.columnName, buttonStyle(theme)]}>
        <Text numberOfLines={1} style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14 }}>
          {name}
        </Text>
      </View>
    );
  };

  const firstName = headName(translation, 'reader.firstTranslation', 'parallel-first-name');
  const secondName = headName(second.translation, 'reader.secondTranslation', 'parallel-second-name');

  return (
    <View testID="parallel-columns" style={styles.columns}>
      <View style={styles.columnsHeader}>
        <View style={styles.headerCell}>{firstName}</View>
        <Pressable
          testID="reader-swap"
          accessibilityRole="button"
          accessibilityLabel={t('reader.swapTranslations')}
          onPress={onSwap}
          style={[styles.swap, buttonStyle(theme), { borderRadius: 999 }]}
        >
          <Icon name="swapH" size={18} color={theme.colors.btnText} />
        </Pressable>
        <View style={styles.headerCell}>{secondName}</View>
      </View>
      {rows.map((row) => {
        const i = info(row.verse);
        const onColour = i.look.onSelectedColour;
        const textColor = onColour ? theme.colors.hlText : theme.colors.text;
        const noteColor = onColour ? theme.colors.hlText : theme.colors.muted;
        const numberColor = onColour ? theme.colors.hlText : theme.colors.vnum;
        return (
          <View key={row.verse} testID={`verse-row-${row.verse}`} style={[styles.wideRow, ...rowStyle(i)]}>
            <View style={styles.cell}>
              {row.primary ? (
                <Text testID={`verse-${row.verse}`} {...textPress(row.verse)} style={[firstFace, { color: textColor }]}>
                  <Runs text={row.primary.text} size={size} color={textColor} noteColor={noteColor} />
                </Text>
              ) : (
                <Missing testID={`verse-${row.verse}-missing-first`} translation={translation} verse={row.verse} height={firstFace.lineHeight} />
              )}
            </View>
            <Pressable
              ref={(node) => registerTools?.(row.verse, node)}
              testID={`verse-${row.verse}-tools`}
              accessibilityRole="button"
              accessibilityLabel={i.label}
              accessibilityState={{ selected: i.selected }}
              onPress={() => onVersePress(row.verse)}
              style={styles.numberCell}
            >
              <Text style={{ fontFamily: uiFace(theme.type.ui, '700'), fontSize: 11, color: numberColor, lineHeight: firstFace.lineHeight }}>
                {row.verse}
              </Text>
              {i.hasNote || i.bookmarked ? (
                <View style={styles.markers}>
                  <Markers hasNote={i.hasNote} bookmarked={i.bookmarked} color={numberColor} />
                </View>
              ) : null}
            </Pressable>
            <View style={styles.cell}>
              {row.secondary ? (
                <Text testID={`verse-${row.verse}-second`} {...textPress(row.verse)} style={[secondFace, { color: textColor }]}>
                  <Runs text={row.secondary.text} size={size} color={textColor} noteColor={noteColor} />
                </Text>
              ) : (
                <Missing testID={`verse-${row.verse}-missing`} translation={second.translation} verse={row.verse} height={secondFace.lineHeight} />
              )}
            </View>
          </View>
        );
      })}
    </View>
  );
}

const styles = StyleSheet.create({
  reading: { width: '100%', maxWidth: READING_MAX_WIDTH, alignSelf: 'center' },
  phoneRows: { gap: 6 },
  phoneRow: { paddingVertical: 8, paddingHorizontal: 10, marginHorizontal: -10, borderRadius: 10, gap: 4 },
  columns: { gap: 4 },
  columnsHeader: { flexDirection: 'row', alignItems: 'center', gap: 12, paddingBottom: 10 },
  headerCell: { flex: 1, alignItems: 'flex-start' },
  columnName: { minHeight: 40, paddingHorizontal: 14, justifyContent: 'center', maxWidth: '100%' },
  swap: { width: VERSE_NUMBER_COLUMN, height: 44, alignItems: 'center', justifyContent: 'center' },
  wideRow: { flexDirection: 'row', gap: 12, paddingVertical: 8, paddingHorizontal: 12, marginHorizontal: -12, borderRadius: 10 },
  cell: { flex: 1 },
  numberCell: { width: VERSE_NUMBER_COLUMN, minHeight: 44, alignItems: 'center' },
  markers: { flexDirection: 'row', gap: 3, alignItems: 'center' },
});
