// The coverage map: one square per book, ten to a row, shaded by how much of the book has been read.
import { StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import { bookAbbreviation } from '../../i18n/bookAbbreviations';
import { coverage, type BookCoverage, type CoverageLevel } from '../../progress';
import { bookNameForLocale } from '../../reader/books';
import type { BookInfo } from '../../api/schemas';
import type { ReadingProgress } from '../../storage/keys';
import { useTheme } from '../../theme/ThemeProvider';
import { coverageFill, coverageText } from './coverageColours';

const COLUMNS = 10;
const LAST_OT_BOOK = 39;
const LEVELS: CoverageLevel[] = [0, 1, 2, 3, 4];

function chunk<T>(items: readonly T[], size: number): T[][] {
  const rows: T[][] = [];
  for (let i = 0; i < items.length; i += size) rows.push(items.slice(i, i + size));
  return rows;
}

function Testament({ label, books, byNumber }: { label: string; books: BookCoverage[]; byNumber: Map<number, BookInfo> }) {
  const theme = useTheme();
  const { t, locale, formatNumber } = useI18n();
  return (
    <View style={styles.testament}>
      <Text
        style={{
          color: theme.colors.muted,
          fontFamily: uiFace(theme.type.ui, '700'),
          fontSize: 12,
          letterSpacing: 0.6,
          textTransform: 'uppercase',
        }}
      >
        {label}
      </Text>
      <View style={styles.grid}>
        {chunk(books, COLUMNS).map((row, r) => (
          <View key={r} style={styles.row}>
            {row.map((b) => {
              const info = byNumber.get(b.bookNumber);
              return (
                <View
                  key={b.bookNumber}
                  testID={`study-map-${b.bookNumber}`}
                  accessible
                  accessibilityLabel={t('study.bookCoverage', {
                    book: info ? bookNameForLocale(info, locale) : String(b.bookNumber),
                    read: formatNumber(b.read),
                    total: formatNumber(b.total),
                  })}
                  style={[styles.cell, { backgroundColor: coverageFill(theme, b.level) }]}
                >
                  <Text
                    numberOfLines={1}
                    style={{ color: coverageText(theme, b.level), fontFamily: uiFace(theme.type.ui, '700'), fontSize: 10 }}
                  >
                    {bookAbbreviation(b.bookNumber, locale)}
                  </Text>
                </View>
              );
            })}
            {/* Keeps a short last row on the same ten-column grid. */}
            {Array.from({ length: COLUMNS - row.length }, (_, i) => (
              <View key={`pad-${i}`} style={styles.pad} />
            ))}
          </View>
        ))}
      </View>
    </View>
  );
}

export function CoverageMap({ books, chaptersRead }: { books: readonly BookInfo[]; chaptersRead: ReadingProgress['chaptersRead'] }) {
  const theme = useTheme();
  const { t } = useI18n();
  const all = coverage(chaptersRead, books);
  const byNumber = new Map(books.map((b) => [b.book_number, b]));
  const muted = { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 12 };
  return (
    <View style={styles.map}>
      <Testament label={t('picker.ot')} books={all.filter((b) => b.bookNumber <= LAST_OT_BOOK)} byNumber={byNumber} />
      <Testament label={t('picker.nt')} books={all.filter((b) => b.bookNumber > LAST_OT_BOOK)} byNumber={byNumber} />
      <View accessible={false} aria-hidden importantForAccessibility="no-hide-descendants" accessibilityElementsHidden style={styles.legend}>
        <Text style={muted}>{t('study.legendNone')}</Text>
        {LEVELS.map((level) => (
          <View key={level} style={[styles.swatch, { backgroundColor: coverageFill(theme, level) }]} />
        ))}
        <Text style={muted}>{t('study.legendAll')}</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  map: { gap: 10 },
  testament: { gap: 10 },
  grid: { gap: 4 },
  row: { flexDirection: 'row', gap: 4 },
  cell: { flex: 1, minWidth: 0, height: 26, borderRadius: 6, alignItems: 'center', justifyContent: 'center' },
  pad: { flex: 1, minWidth: 0 },
  legend: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  swatch: { width: 16, height: 12, borderRadius: 3 },
});
