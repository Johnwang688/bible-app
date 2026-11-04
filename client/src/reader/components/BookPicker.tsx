// The book and chapter picker (Picker.dc.html): a bottom sheet with a filter, recent passages,
// Old / New Testament tabs and an expanding chapter grid per book.
import { useMemo, useRef, useState, type ComponentRef } from 'react';
import { Platform, Pressable, ScrollView, StyleSheet, Text, TextInput, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import type { BookInfo } from '../../api/schemas';
import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import type { AppLocale } from '../../i18n/types';
import { useReadingProgress } from '../../progress';
import { recentPassagesKey, type ReaderPosition } from '../../storage/keys';
import { useStoredValue, type Storage } from '../../storage/storage';
import { useTheme } from '../../theme/ThemeProvider';
import { bookNameForLocale, findBook } from '../books';
import { Icon } from './icons';
import { SheetModal } from './SheetModal';
import { buttonStyle } from './ui';

type Testament = 'OT' | 'NT';
const COLUMNS = 6;
const TESTAMENTS: readonly Testament[] = ['OT', 'NT'];

/** True when the query matches the start of any word of the name (or of the words after it). */
function nameMatches(name: string, query: string): boolean {
  const words = name.toLowerCase().split(/\s+/).filter(Boolean);
  return words.some((_, i) => words.slice(i).join(' ').startsWith(query));
}

export function bookMatches(book: BookInfo, query: string, locale: AppLocale): boolean {
  const q = query.trim().toLowerCase().replace(/\s+/g, ' ');
  if (!q) return true;
  return nameMatches(book.name, q) || nameMatches(bookNameForLocale(book, locale), q);
}

export function BookPicker({
  books,
  position,
  storage,
  onSelect,
  onClose,
}: {
  books: BookInfo[];
  position: ReaderPosition;
  storage: Storage;
  /** A chapter chosen from the grid or a recent chip; carries its translation. */
  onSelect(p: ReaderPosition): void;
  onClose(): void;
}) {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const insets = useSafeAreaInsets();
  const [recent] = useStoredValue(storage, recentPassagesKey);
  const { isRead } = useReadingProgress({ storage });
  const sorted = useMemo(() => [...books].sort((a, b) => a.book_number - b.book_number), [books]);
  const current = findBook(books, position.bookNumber);

  const [testament, setTestament] = useState<Testament>(current?.testament === 'OT' ? 'OT' : 'NT');
  const [filter, setFilter] = useState('');
  const [expanded, setExpanded] = useState<number | null>(position.bookNumber);
  const scroll = useRef<ComponentRef<typeof ScrollView>>(null);
  const scrolledToCurrent = useRef(false);

  const query = filter.trim();
  const shown = query ? sorted.filter((b) => bookMatches(b, query, locale)) : sorted.filter((b) => b.testament === testament);
  const recents = recent.flatMap((p, i) => {
    const book = findBook(books, p.bookNumber);
    return book ? [{ p, i, label: t('reader.chapterTitle', { book: bookNameForLocale(book, locale), chapter: p.chapter }) }] : [];
  });

  const choose = (bookNumber: number, chapter: number) => onSelect({ bookNumber, chapter, translation: position.translation });
  const headFont = uiFace(theme.type.head, '700');
  const uiBold = uiFace(theme.type.ui, '700');

  return (
    <SheetModal testID="book-picker" onClose={onClose} tall>
      <View style={styles.titleRow}>
        <Text accessibilityRole="header" style={{ color: theme.colors.text, fontFamily: headFont, fontSize: 20 }}>
          {t('picker.title')}
        </Text>
        <Pressable
          testID="picker-close"
          accessibilityRole="button"
          accessibilityLabel={t('common.close')}
          onPress={onClose}
          style={[styles.close, buttonStyle(theme), { borderRadius: 999 }]}
        >
          <Icon name="close" color={theme.colors.btnText} />
        </Pressable>
      </View>

      <View style={[styles.filter, buttonStyle(theme)]}>
        <Icon name="search" size={18} color={theme.colors.muted} strokeWidth={2} />
        <TextInput
          testID="picker-filter"
          value={filter}
          onChangeText={setFilter}
          placeholder={t('picker.find')}
          placeholderTextColor={theme.colors.muted}
          accessibilityLabel={t('picker.find')}
          autoCapitalize="none"
          autoCorrect={false}
          returnKeyType="search"
          style={[styles.filterInput, Platform.OS === 'web' && { outlineColor: theme.colors.accent }, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') }]}
        />
      </View>

      {recents.length > 0 ? (
        <View style={styles.recentRow}>
          <Text style={[styles.recentLabel, { color: theme.colors.muted, fontFamily: uiBold }]}>{t('picker.recent')}</Text>
          <ScrollView horizontal showsHorizontalScrollIndicator={false} keyboardShouldPersistTaps="handled" contentContainerStyle={styles.chips}>
            {recents.map(({ p, i, label }) => (
              <Pressable
                key={`${p.bookNumber}:${p.chapter}`}
                testID={`picker-recent-${i}`}
                accessibilityRole="button"
                onPress={() => onSelect(p)}
                style={[styles.chip, buttonStyle(theme), { borderRadius: 999 }]}
              >
                <Text style={{ color: theme.colors.btnText, fontFamily: uiBold, fontSize: 13 }}>{label}</Text>
              </Pressable>
            ))}
          </ScrollView>
        </View>
      ) : null}

      {query ? null : (
        <View accessibilityRole="tablist" style={[styles.tabs, buttonStyle(theme)]}>
          {TESTAMENTS.map((id) => {
            const on = testament === id;
            return (
              <Pressable
                key={id}
                testID={`picker-testament-${id}`}
                accessibilityRole="tab"
                accessibilityState={{ selected: on }}
                aria-selected={on}
                onPress={() => setTestament(id)}
                style={[styles.tab, { borderRadius: theme.radii.button, backgroundColor: on ? theme.colors.cta : 'transparent' }]}
              >
                <Text style={{ color: on ? theme.colors.onCta : theme.colors.btnText, fontFamily: uiBold, fontSize: 14 }}>
                  {t(id === 'OT' ? 'picker.ot' : 'picker.nt')}
                </Text>
              </Pressable>
            );
          })}
        </View>
      )}

      <ScrollView
        ref={scroll}
        style={styles.list}
        keyboardShouldPersistTaps="handled"
        contentContainerStyle={{ paddingBottom: insets.bottom + 16 }}
      >
        {shown.length === 0 ? (
          <Text style={[styles.empty, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }]}>
            {t('picker.noMatch', { q: query })}
          </Text>
        ) : null}
        {shown.map((book, index) => {
          const open = expanded === book.book_number;
          const isCurrentBook = book.book_number === position.bookNumber;
          return (
            <View
              key={book.book_number}
              style={[styles.bookBlock, index > 0 && { borderTopWidth: StyleSheet.hairlineWidth, borderTopColor: theme.borders.sheet.color }]}
              onLayout={(e) => {
                if (isCurrentBook && !scrolledToCurrent.current) {
                  scrolledToCurrent.current = true;
                  scroll.current?.scrollTo({ y: e.nativeEvent.layout.y, animated: false });
                }
              }}
            >
              <Pressable
                testID={`picker-book-${book.book_number}`}
                accessibilityRole="button"
                accessibilityState={{ expanded: open }}
                onPress={() => setExpanded(open ? null : book.book_number)}
                style={styles.bookRow}
              >
                <Text style={[styles.bookName, { color: theme.colors.text, fontFamily: isCurrentBook ? uiBold : uiFace(theme.type.ui, '400') }]}>
                  {bookNameForLocale(book, locale)}
                </Text>
                <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
                  {t('picker.chapterCount', { n: book.total_chapters })}
                </Text>
                <View style={{ transform: [{ rotate: open ? '90deg' : '0deg' }] }}>
                  <Icon name="chevronRight" size={16} color={theme.colors.muted} />
                </View>
              </Pressable>
              {open ? (
                <View style={styles.grid}>
                  {Array.from({ length: book.total_chapters }, (_, i) => i + 1).map((n) => {
                    const here = isCurrentBook && n === position.chapter;
                    const read = isRead(book.book_number, n);
                    return (
                      <View key={n} style={styles.cell}>
                        <Pressable
                          testID={`picker-chapter-${n}`}
                          accessibilityRole="button"
                          accessibilityLabel={t(read ? 'picker.chapterRead' : 'picker.chapter', { n })}
                          accessibilityState={{ selected: here }}
                          aria-selected={here}
                          onPress={() => choose(book.book_number, n)}
                          style={[
                            styles.chapter,
                            buttonStyle(theme),
                            here && { backgroundColor: theme.colors.cta },
                          ]}
                        >
                          <Text style={{ color: here ? theme.colors.onCta : theme.colors.btnText, fontFamily: uiBold, fontSize: 15 }}>{n}</Text>
                          {read ? (
                            // The number's own colour is the one that reads on this cell, selected or not.
                            <View
                              testID={`picker-chapter-${n}-read`}
                              accessible={false}
                              pointerEvents="none"
                              style={[styles.readDot, { backgroundColor: here ? theme.colors.onCta : theme.colors.btnText }]}
                            />
                          ) : null}
                        </Pressable>
                      </View>
                    );
                  })}
                </View>
              ) : null}
            </View>
          );
        })}
      </ScrollView>
    </SheetModal>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between' },
  close: { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' },
  filter: { height: 46, flexDirection: 'row', alignItems: 'center', gap: 8, paddingHorizontal: 14 },
  filterInput: { flex: 1, height: 44, fontSize: 15, padding: 0 },
  recentRow: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  recentLabel: { fontSize: 12, letterSpacing: 0.6, textTransform: 'uppercase' },
  chips: { gap: 6, alignItems: 'center' },
  chip: { minHeight: 44, paddingHorizontal: 12, justifyContent: 'center' },
  tabs: { flexDirection: 'row', gap: 4, padding: 4 },
  tab: { flex: 1, minHeight: 44, alignItems: 'center', justifyContent: 'center' },
  list: { flex: 1 },
  empty: { paddingVertical: 24, textAlign: 'center', fontSize: 15 },
  bookBlock: { flexDirection: 'column' },
  bookRow: { minHeight: 50, flexDirection: 'row', alignItems: 'center', gap: 10, paddingHorizontal: 4 },
  bookName: { flex: 1, fontSize: 16 },
  grid: { flexDirection: 'row', flexWrap: 'wrap', marginHorizontal: -4, paddingBottom: 14 },
  cell: { width: `${100 / COLUMNS}%`, padding: 4 },
  chapter: { height: 44, alignItems: 'center', justifyContent: 'center' },
  readDot: { position: 'absolute', top: 6, right: 6, width: 6, height: 6, borderRadius: 3 },
});
