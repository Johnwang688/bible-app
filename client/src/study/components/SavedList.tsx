// Study → Saved: the filters (kind, colour, book) and the list of saved items. The list is a FlatList with
// the title, the tabs and the filters as its header, so only the rows on screen are rendered (and only they
// ask for their verse text).
import { useMemo, useState, type ReactNode } from 'react';
import { FlatList, Pressable, StyleSheet, Text, View } from 'react-native';

import { useColumn } from '../../components/ContentColumn';
import { auroraTextShadow } from '../../aurora';
import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { bookNameForLocale, findBook, useBooks } from '../../reader/books';
import { Icon } from '../../reader/components/icons';
import { buttonStyle } from '../../reader/components/ui';
import type { TranslationId } from '../../reader/translations';
import { HIGHLIGHT_IDS, HIGHLIGHTS } from '../../theme/highlights';
import { useTheme } from '../../theme/ThemeProvider';
import { booksWithEntries, filterStudyList, NO_FILTER, type StudyEntry, type StudyFilter, type StudyKind } from '../list';
import { BookFilterSheet } from './BookFilterSheet';
import { StudyEntryCard } from './StudyEntryCard';

const KINDS: { kind: StudyFilter['kind']; testID: string; labelKey: MessageKey }[] = [
  { kind: 'all', testID: 'study-kind-all', labelKey: 'study.filter.all' },
  { kind: 'highlight', testID: 'study-kind-highlight', labelKey: 'study.filter.highlights' },
  { kind: 'note', testID: 'study-kind-note', labelKey: 'study.filter.notes' },
  { kind: 'bookmark', testID: 'study-kind-bookmark', labelKey: 'study.filter.bookmarks' },
];

function Filters({ all, filter, onChange }: { all: readonly StudyEntry[]; filter: StudyFilter; onChange(f: StudyFilter): void }) {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const books = useBooks();
  const [sheetOpen, setSheetOpen] = useState(false);
  const bookNumbers = useMemo(() => booksWithEntries(all), [all]);
  const chosen = filter.bookNumber === null ? undefined : findBook(books.data, filter.bookNumber);
  const bookLabel =
    filter.bookNumber === null ? t('study.allBooks') : chosen ? bookNameForLocale(chosen, locale) : String(filter.bookNumber);
  const button = buttonStyle(theme);
  // A selected chip is the solid accent: the button's fill without its (glass) gradient.
  const { backgroundImage: _gradient, ...buttonSolid } = button;
  const label = { fontFamily: uiFace(theme.type.ui, '700'), fontSize: 13 };

  return (
    <View style={styles.filters}>
      <View style={styles.wrap}>
        {KINDS.map((k) => {
          const selected = filter.kind === k.kind;
          return (
            <Pressable
              key={k.kind}
              testID={k.testID}
              accessibilityRole="button"
              accessibilityState={{ selected }}
              onPress={() => onChange({ ...filter, kind: k.kind as StudyKind | 'all' })}
              style={[styles.chip, selected ? { ...buttonSolid, backgroundColor: theme.colors.accent } : button, { borderRadius: 999 }]}
            >
              <Text style={[label, { color: selected ? theme.colors.onAccent : theme.colors.btnText }]}>{t(k.labelKey)}</Text>
            </Pressable>
          );
        })}
      </View>

      <View role="group" accessibilityLabel={t('study.byColour')} style={styles.dots}>
        <Text
          style={{
            color: theme.colors.muted,
            fontFamily: uiFace(theme.type.ui, '700'),
            fontSize: 12,
            letterSpacing: 0.6,
            textTransform: 'uppercase',
            marginRight: 4,
            ...auroraTextShadow(theme),
          }}
        >
          {t('study.byColour')}
        </Text>
        {HIGHLIGHT_IDS.map((id) => {
          const selected = filter.colour === id;
          return (
            <Pressable
              key={id}
              testID={`study-colour-${id}`}
              accessibilityRole="button"
              accessibilityLabel={t('study.colourFilter', { colour: t(HIGHLIGHTS[id].nameKey) })}
              accessibilityState={{ selected }}
              onPress={() => onChange({ ...filter, colour: selected ? null : id })}
              style={styles.dotHit}
            >
              <View style={[styles.ring, selected && { borderWidth: 2, borderColor: theme.colors.text }]}>
                <View style={[styles.dot, { backgroundColor: HIGHLIGHTS[id].swatch, borderColor: theme.colors.muted }]} />
              </View>
            </Pressable>
          );
        })}
      </View>

      <Pressable
        testID="study-book-filter"
        accessibilityRole="button"
        onPress={() => setSheetOpen(true)}
        style={[styles.bookButton, button, { borderRadius: theme.radii.button }]}
      >
        <Text numberOfLines={1} style={[label, styles.bookLabel, { color: theme.colors.btnText }]}>
          {bookLabel}
        </Text>
        <Icon name="chevronDown" size={18} color={theme.colors.btnText} />
      </Pressable>

      {sheetOpen ? (
        <BookFilterSheet
          bookNumbers={bookNumbers}
          selected={filter.bookNumber}
          onSelect={(bookNumber) => {
            onChange({ ...filter, bookNumber });
            setSheetOpen(false);
          }}
          onClose={() => setSheetOpen(false)}
        />
      ) : null}
    </View>
  );
}

export function SavedList({
  header,
  all,
  filter,
  onFilterChange,
  translation,
  onOpen,
  bottomInset,
}: {
  /** The title and the tabs, which scroll with the list. */
  header: ReactNode;
  /** Every entry, newest first. */
  all: readonly StudyEntry[];
  filter: StudyFilter;
  onFilterChange(f: StudyFilter): void;
  translation: TranslationId;
  onOpen(entry: StudyEntry): void;
  bottomInset: number;
}) {
  const column = useColumn('text', 20);
  const theme = useTheme();
  const { t } = useI18n();
  const shown = useMemo(() => filterStudyList(all, filter), [all, filter]);
  // The empty states sit on the screen background, which runs the aurora in the glass looks.
  const halo = auroraTextShadow(theme);
  const muted = { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, textAlign: 'center' as const, ...halo };

  const empty =
    all.length === 0 ? (
      <View testID="study-empty" style={styles.empty}>
        <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 17, textAlign: 'center', ...halo }}>
          {t('study.empty')}
        </Text>
        <Text style={muted}>{t('study.emptyHint')}</Text>
      </View>
    ) : (
      <View testID="study-no-matches" style={styles.empty}>
        <Text style={muted}>{t('study.noMatches')}</Text>
        <Pressable
          testID="study-clear-filters"
          accessibilityRole="button"
          onPress={() => onFilterChange(NO_FILTER)}
          style={[styles.chip, buttonStyle(theme), { borderRadius: 999, paddingHorizontal: 18 }]}
        >
          <Text style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 13 }}>
            {t('study.clearFilters')}
          </Text>
        </Pressable>
      </View>
    );

  return (
    <FlatList
      testID="study-saved"
      data={shown}
      keyExtractor={(e) => e.id}
      renderItem={({ item }) => <StudyEntryCard entry={item} translation={translation} onOpen={onOpen} />}
      ItemSeparatorComponent={Separator}
      ListHeaderComponent={
        <View style={styles.header}>
          {header}
          {all.length > 0 ? <Filters all={all} filter={filter} onChange={onFilterChange} /> : null}
        </View>
      }
      ListEmptyComponent={empty}
      style={styles.fill}
      contentContainerStyle={[styles.content, column, { paddingBottom: bottomInset }]}
    />
  );
}

const Separator = () => <View style={styles.separator} />;

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { paddingHorizontal: 20 },
  header: { gap: 14, paddingBottom: 14 },
  separator: { height: 12 },
  filters: { gap: 10 },
  wrap: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'center', gap: 6 },
  dots: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'center' },
  chip: { minHeight: 44, paddingHorizontal: 16, alignItems: 'center', justifyContent: 'center' },
  dotHit: { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' },
  ring: { width: 36, height: 36, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  dot: { width: 26, height: 26, borderRadius: 999, borderWidth: 1 },
  bookButton: {
    alignSelf: 'flex-start',
    maxWidth: '100%',
    minHeight: 44,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingHorizontal: 16,
  },
  bookLabel: { flexShrink: 1 },
  empty: { alignItems: 'center', gap: 12, paddingVertical: 32 },
});
