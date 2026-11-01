// The chapter text (Reader.dc.html, ParallelPhone.dc.html, ParallelTablet.dc.html).
// One translation: a single flowing paragraph of tappable verses. Two translations: interleaved
// verse by verse on a phone, two aligned columns when the window is wide.
import { useEffect, useState } from 'react';
import { Pressable, StyleSheet, Text, useWindowDimensions, View, type TextStyle } from 'react-native';

import type { ChapterOut } from '../../api/schemas';
import { scriptureFace, uiFace } from '../../fonts/fonts';
import { ensureFont, LAZY_FONT_FAMILY } from '../../fonts/lazy';
import { useT } from '../../i18n/I18nProvider';
import { TEXT_SIZES } from '../../storage/keys';
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
  selectedVerse: number | null;
  onVersePress(verse: number): void;
  /** Swap the two translations (the wide layout's header). */
  onSwap?(): void;
}

// Once the Chinese font has loaded it stays loaded; later screens start with it.
let chineseFontLoaded = false;

/** Loads the Chinese Scripture font in the background. Text uses the system font until it is ready. */
function useChineseFont(needed: boolean): string | undefined {
  const [ready, setReady] = useState(chineseFontLoaded);
  useEffect(() => {
    if (!needed || chineseFontLoaded) return;
    let live = true;
    ensureFont('chineseScripture')
      .then(() => {
        chineseFontLoaded = true;
        if (live) setReady(true);
      })
      .catch(() => undefined); // keep the system font; the next visit tries again
    return () => {
      live = false;
    };
  }, [needed]);
  return needed && ready ? LAZY_FONT_FAMILY.chineseScripture : undefined;
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

function VerseNumber({ n, color }: { n: number; color: string }) {
  const theme = useTheme();
  const style: TextStyle = {
    fontFamily: uiFace(theme.type.ui, '700'),
    fontSize: 11,
    color,
    verticalAlign: 'top',
  };
  // Thin spaces stand in for padding, which nested Text does not support.
  return <Text style={style}>{` ${n} `}</Text>;
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

export function ChapterView({ chapter, translation, second, textSize, selectedVerse, onVersePress, onSwap }: ChapterViewProps) {
  const theme = useTheme();
  const t = useT();
  const { width } = useWindowDimensions();
  const size = TEXT_SIZES[textSize] ?? TEXT_SIZES[2];
  const secondTranslation = second?.translation;
  const chineseFont = useChineseFont(isChineseTranslation(translation) || (!!secondTranslation && isChineseTranslation(secondTranslation)));

  const verseButton = (n: number) => ({
    accessibilityRole: 'button' as const,
    accessibilityLabel: t('reader.verse', { n }),
    accessibilityState: { selected: selectedVerse === n },
    onPress: () => onVersePress(n),
  });

  if (!second) {
    const f = face(theme, translation, size, chineseFont);
    const space = isChineseTranslation(translation) ? '' : ' ';
    return (
      <View style={styles.reading}>
        <Text style={[f, { color: theme.colors.text }]}>
          {chapter.verses.map((v) => {
            const selected = selectedVerse === v.verse;
            return (
              <Text key={v.verse} testID={`verse-${v.verse}`} {...verseButton(v.verse)} style={selected ? { backgroundColor: theme.colors.hl } : undefined}>
                <VerseNumber n={v.verse} color={selected ? theme.colors.hlText : theme.colors.vnum} />
                <Runs
                  text={v.text}
                  size={size}
                  color={selected ? theme.colors.hlText : theme.colors.text}
                  noteColor={selected ? theme.colors.hlText : theme.colors.muted}
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

  if (!wide) {
    const secondSize = size * 0.92;
    const secondFace = face(theme, second.translation, secondSize, chineseFont);
    return (
      <View style={styles.phoneRows}>
        {rows.map((row) => {
          const selected = selectedVerse === row.verse;
          return (
            <View
              key={row.verse}
              testID={`verse-row-${row.verse}`}
              style={[styles.phoneRow, selected && { backgroundColor: theme.colors.hl }]}
            >
              {row.primary ? (
                <Text testID={`verse-${row.verse}`} {...verseButton(row.verse)} style={[firstFace, { color: selected ? theme.colors.hlText : theme.colors.text }]}>
                  <VerseNumber n={row.verse} color={selected ? theme.colors.hlText : theme.colors.vnum} />
                  <Runs
                    text={row.primary.text}
                    size={size}
                    color={selected ? theme.colors.hlText : theme.colors.text}
                    noteColor={selected ? theme.colors.hlText : theme.colors.muted}
                  />
                </Text>
              ) : (
                <Missing testID={`verse-${row.verse}-missing-first`} translation={translation} verse={row.verse} height={firstFace.lineHeight} />
              )}
              {row.secondary ? (
                <Text
                  testID={`verse-${row.verse}-second`}
                  {...verseButton(row.verse)}
                  style={[secondFace, { color: selected ? theme.colors.hlText : theme.colors.muted }]}
                >
                  {row.primary ? null : <VerseNumber n={row.verse} color={selected ? theme.colors.hlText : theme.colors.vnum} />}
                  <Runs
                    text={row.secondary.text}
                    size={secondSize}
                    color={selected ? theme.colors.hlText : theme.colors.muted}
                    noteColor={selected ? theme.colors.hlText : theme.colors.muted}
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
        const selected = selectedVerse === row.verse;
        const textColor = selected ? theme.colors.hlText : theme.colors.text;
        const noteColor = selected ? theme.colors.hlText : theme.colors.muted;
        return (
          <View key={row.verse} testID={`verse-row-${row.verse}`} style={[styles.wideRow, selected && { backgroundColor: theme.colors.hl }]}>
            <View style={styles.cell}>
              {row.primary ? (
                <Text testID={`verse-${row.verse}`} {...verseButton(row.verse)} style={[firstFace, { color: textColor }]}>
                  <Runs text={row.primary.text} size={size} color={textColor} noteColor={noteColor} />
                </Text>
              ) : (
                <Missing testID={`verse-${row.verse}-missing-first`} translation={translation} verse={row.verse} height={firstFace.lineHeight} />
              )}
            </View>
            <View style={styles.numberCell} accessible={false}>
              <Text style={{ fontFamily: uiFace(theme.type.ui, '700'), fontSize: 11, color: selected ? theme.colors.hlText : theme.colors.vnum, lineHeight: firstFace.lineHeight }}>
                {row.verse}
              </Text>
            </View>
            <View style={styles.cell}>
              {row.secondary ? (
                <Text testID={`verse-${row.verse}-second`} {...verseButton(row.verse)} style={[secondFace, { color: textColor }]}>
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
  numberCell: { width: VERSE_NUMBER_COLUMN, alignItems: 'center' },
});
