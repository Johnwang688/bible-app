// The book filter's sheet: "All books", then only the books that have saved items, in canon order.
import { Pressable, StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import { bookNameForLocale, findBook, useBooks } from '../../reader/books';
import { Icon } from '../../reader/components/icons';
import { SheetModal } from '../../reader/components/SheetModal';
import { RoundIconButton } from '../../reader/components/sheetParts';
import { groupStyle } from '../../reader/components/ui';
import { useTheme } from '../../theme/ThemeProvider';

export function BookFilterSheet({
  bookNumbers,
  selected,
  onSelect,
  onClose,
}: {
  /** The books to offer, in canon order. */
  bookNumbers: readonly number[];
  selected: number | null;
  onSelect(bookNumber: number | null): void;
  onClose(): void;
}) {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const books = useBooks();

  const options: { key: string; testID: string; label: string; value: number | null }[] = [
    { key: 'all', testID: 'study-book-option-all', label: t('study.allBooks'), value: null },
    ...bookNumbers.map((n) => {
      const book = findBook(books.data, n);
      return { key: String(n), testID: `study-book-option-${n}`, label: book ? bookNameForLocale(book, locale) : String(n), value: n };
    }),
  ];

  return (
    <SheetModal
      testID="study-book-sheet"
      onClose={onClose}
      header={
        <View style={styles.titleRow}>
          <Text
            accessibilityRole="header"
            style={{ flex: 1, color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 20 }}
          >
            {t('study.chooseBook')}
          </Text>
          <RoundIconButton testID="study-book-close" label={t('common.close')} icon="close" onPress={onClose} />
        </View>
      }
    >
      <View style={groupStyle(theme)}>
        {options.map((o, i) => {
          const checked = o.value === selected;
          return (
            <Pressable
              key={o.key}
              testID={o.testID}
              accessibilityRole="radio"
              accessibilityState={{ checked }}
              aria-checked={checked}
              onPress={() => onSelect(o.value)}
              style={[styles.row, i > 0 && { borderTopWidth: StyleSheet.hairlineWidth, borderTopColor: theme.borders.sheet.color }]}
            >
              <Text style={{ flex: 1, color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>
                {o.label}
              </Text>
              {checked ? <Icon name="check" size={20} color={theme.colors.vnum} /> : null}
            </Pressable>
          );
        })}
      </View>
    </SheetModal>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12 },
  row: { minHeight: 48, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12, paddingHorizontal: 14 },
});
