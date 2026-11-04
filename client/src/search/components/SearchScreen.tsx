// The search screen (design/proposed/r5-search.html, approved by John, with the fixes in r5/GO-AHEAD.md): one field
// that takes a reference or words. Below it, one scrolling list: with the field empty, the recent passages and a few
// examples; when typing, passages, then verses, then people, places and themes. A full screen above the tabs.
import { router, type Href } from 'expo-router';
import { useMemo, useRef, useState, type ComponentRef } from 'react';
import {
  Platform,
  Pressable,
  ScrollView,
  StyleSheet,
  Text,
  TextInput,
  View,
  type TextStyle,
  type ViewStyle,
} from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { useColumn } from '../../components/ContentColumn';
import type { EntityKind, SummaryEntityListItemOut } from '../../api/schemas';
import { entityPageHref } from '../../entities/routes';
import { matchEntities, MATCH_MIN, useEntityList } from '../../entities/data';
import { KIND_GLYPH } from '../../entities/glyphs';
import { uiFace } from '../../fonts/fonts';
import { bookAbbreviation } from '../../i18n/bookAbbreviations';
import { useI18n } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import type { DeviceLocale } from '../../i18n/types';
import { bookNameForLocale, findBook, useBooks } from '../../reader/books';
import { Icon } from '../../reader/components/icons';
import { EnglishBadge, RoundIconButton } from '../../reader/components/sheetParts';
import { buttonStyle } from '../../reader/components/ui';
import { useReaderPosition, useReadingSettings } from '../../reader/state';
import { readerTargets } from '../../reader/target';
import { TRANSLATIONS } from '../../reader/translations';
import { recentPassagesKey, type ReaderPosition } from '../../storage/keys';
import { getStorage, useStoredValue, type Storage } from '../../storage/storage';
import { useScriptureFont } from '../../study/components/scriptureFont';
import { formatReference } from '../../study/share';
import { useTheme } from '../../theme/ThemeProvider';
import { buildBookIndex, parseReference, suggestPassages } from '../reference';
import { hasCjk, searchTranslation } from '../searchTranslation';
import type { PassageRef } from '../types';
import { SEARCH_LIMIT, useDebouncedValue, useVerseSearch } from '../useVerseSearch';
import { useOpenPassage } from '../useOpenPassage';
import { useScreenBack } from '../useScreenBack';
import { Card, GroupLabel, ListRow, SearchingPlaceholder, StateBlock } from './parts';
import { VerseCard } from './VerseCard';

/** Results shown at first, and added by each press of "Show more". */
const PAGE = 10;
/** The verse search waits for typing to pause this long (ms). */
const DEBOUNCE_MS = 250;
const EXAMPLE_KEYS: readonly MessageKey[] = ['search.example.1', 'search.example.2', 'search.example.3', 'search.example.4'];
const KIND_KEY: Record<EntityKind, MessageKey> = { person: 'entity.person', place: 'entity.place', theme: 'entity.theme' };

const goToBibleTab = () => router.navigate('/bible');
const defaultBack = () => (router.canGoBack() ? router.back() : router.replace('/bible'));
const defaultOpenEntity = (href: string) => router.push(href as Href);

/** True when a suggestion carries a chapter: the query reads as a reference, so words and names are not searched. */
const hasChapter = (passages: readonly PassageRef[]) => passages.some((p) => p.chapter !== undefined);

/** The query's words (split on whitespace), each once. */
function queryWords(text: string): string[] {
  return [...new Set(text.split(/\s+/).filter((w) => w !== ''))];
}

export function SearchScreen({
  storage: storageProp,
  locales,
  navigate,
  onBack,
  onOpenEntity,
}: {
  storage?: Storage;
  locales?: readonly DeviceLocale[];
  /** Shows the Bible tab after a passage is chosen (default: switch to the Bible tab). */
  navigate?: () => void;
  onBack?: () => void;
  onOpenEntity?: (href: string) => void;
}) {
  const column = useColumn('text', 16);
  const theme = useTheme();
  const { t, locale } = useI18n();
  const insets = useSafeAreaInsets();
  const storage = useMemo(() => storageProp ?? getStorage(), [storageProp]);
  const goBible = navigate ?? goToBibleTab;
  const back = onBack ?? defaultBack;
  const openEntity = onOpenEntity ?? defaultOpenEntity;

  const books = useBooks();
  const index = useMemo(() => (books.data ? buildBookIndex(books.data) : null), [books.data]);
  const { position, setPosition } = useReaderPosition(locales ? { storage, locales } : { storage });
  const [settings] = useReadingSettings({ storage });
  const [recent, setRecent] = useStoredValue(storage, recentPassagesKey);
  const openPassage = useOpenPassage(navigate ? { storage, navigate } : { storage });

  const [query, setQuery] = useState('');
  const [focused, setFocused] = useState(false);
  const inputRef = useRef<ComponentRef<typeof TextInput>>(null);
  const trimmed = query.trim();
  const settled = useDebouncedValue(trimmed, DEBOUNCE_MS);

  // Escape (web) and the Android back button go back, while this screen is the focused one.
  useScreenBack(back);

  // Passages are worked out on the phone on every keystroke.
  const passages = useMemo(() => (index ? suggestPassages(query, index) : []), [index, query]);
  const exact = useMemo(() => (index ? parseReference(query, index) : null), [index, query]);
  const readsAsReference = hasChapter(passages);
  // The verse search runs for the settled text, and not while either it or the live text reads as a reference.
  const settledPassages = useMemo(() => (index && settled !== '' ? suggestPassages(settled, index) : []), [index, settled]);
  const verseActive = trimmed !== '' && settled !== '' && !readsAsReference && !hasChapter(settledPassages);
  const translation = searchTranslation(settled, position.translation, settings.parallel);
  const search = useVerseSearch(settled, translation, { enabled: verseActive });
  const translationName = t(TRANSLATIONS[translation].shortKey);
  const scripture = useScriptureFont(theme, translation);
  const terms = useMemo(() => queryWords(settled), [settled]);

  // Ten at a time; the count belongs to the query on screen now, so any change of query or translation (even back
  // to an earlier one) starts again at ten.
  const resultKey = `${settled}|${translation}`;
  const [shown, setShown] = useState({ key: resultKey, count: PAGE });
  if (shown.key !== resultKey) setShown({ key: resultKey, count: PAGE });
  const count = shown.key === resultKey ? shown.count : PAGE;
  const results = search.data ?? [];
  const visible = results.slice(0, count);
  const remaining = Math.min(SEARCH_LIMIT, results.length) - visible.length;

  // People, places and themes: names, in English, once the query is long enough and is not a reference.
  // They are fetched once typing has paused, alongside the verse search, so they never flicker while typing.
  const entitiesOn = trimmed.length >= MATCH_MIN && !readsAsReference && settled === trimmed;
  // They come last in the list, but do not wait for the verse search: they show as soon as their lists have loaded.
  const showEntities = entitiesOn;
  const people = useEntityList('person', { enabled: entitiesOn });
  const places = useEntityList('place', { enabled: entitiesOn });
  const themes = useEntityList('theme', { enabled: entitiesOn });
  const chinese = hasCjk(trimmed);
  const entityRows = useMemo(() => {
    if (!entitiesOn || chinese) return [];
    const lists: Partial<Record<EntityKind, SummaryEntityListItemOut[]>> = {};
    if (people.data) lists.person = people.data;
    if (places.data) lists.place = places.data;
    if (themes.data) lists.theme = themes.data;
    return matchEntities(lists, trimmed);
  }, [entitiesOn, chinese, people.data, places.data, themes.data, trimmed]);

  const bookName = (bookNumber: number) => {
    const book = findBook(books.data, bookNumber);
    // Until the book list arrives (it is normally cached already) the short name stands in.
    return book ? bookNameForLocale(book, locale) : bookAbbreviation(bookNumber, locale);
  };
  const passageTitle = (ref: PassageRef) => {
    const name = bookName(ref.bookNumber);
    if (ref.chapter === undefined) return name;
    if (ref.start === undefined) return t('reader.chapterTitle', { book: name, chapter: ref.chapter });
    const end = ref.end ?? ref.start;
    return formatReference(name, ref.chapter, Array.from({ length: end - ref.start + 1 }, (_, i) => ref.start! + i));
  };
  const passageSub = (ref: PassageRef, isExact: boolean) => {
    if (isExact && ref.chapter !== undefined) return t('search.goTo');
    if (ref.chapter === undefined) return t('search.fromChapterOne');
    if (ref.start === undefined) return t('search.wholeChapter');
    return t(ref.end === undefined || ref.end === ref.start ? 'search.verseSub' : 'search.versesSub');
  };

  const openRecent = (p: ReaderPosition) => {
    readerTargets.clear();
    setPosition(p);
    goBible();
  };
  const submit = () => {
    if (exact) openPassage(exact);
  };
  const clearField = () => {
    setQuery('');
    inputRef.current?.focus();
  };
  const fillExample = (text: string) => {
    setQuery(text);
    inputRef.current?.focus();
  };

  const ui = (weight: '400' | '700') => uiFace(theme.type.ui, weight);
  const focusRing = {
    outlineWidth: focused ? 2 : 0,
    outlineStyle: 'solid',
    outlineColor: theme.colors.accent,
    outlineOffset: 1,
  } as ViewStyle;
  const plainInput = Platform.OS === 'web' ? { outlineWidth: 0, outlineStyle: 'none' } as unknown as TextStyle : null;

  const recents = recent.map((p, i) => ({ p, i, title: t('reader.chapterTitle', { book: bookName(p.bookNumber), chapter: p.chapter }) }));

  const emptyField = trimmed === '';

  return (
    <View testID="screen-search" style={[styles.screen, theme.backgrounds.reader, { paddingTop: insets.top + 8 }]}>
      <View style={[styles.header, column]}>
        <RoundIconButton testID="search-back" label={t('search.back')} icon="chevronLeft" onPress={back} />
        <View style={[styles.field, buttonStyle(theme), Platform.OS === 'web' && focusRing]}>
          <Icon name="search" size={18} color={theme.colors.muted} strokeWidth={2} />
          <TextInput
            ref={inputRef}
            testID="search-input"
            value={query}
            onChangeText={setQuery}
            onSubmitEditing={submit}
            onFocus={() => setFocused(true)}
            onBlur={() => setFocused(false)}
            placeholder={t('search.placeholder')}
            placeholderTextColor={theme.colors.muted}
            accessibilityLabel={t('search.label')}
            autoFocus
            returnKeyType="search"
            autoCorrect={false}
            autoCapitalize="none"
            maxLength={200}
            style={[styles.input, { color: theme.colors.text, fontFamily: ui('400') }, plainInput]}
          />
          {query !== '' ? (
            <Pressable
              testID="search-clear"
              accessibilityRole="button"
              accessibilityLabel={t('search.clear')}
              onPress={clearField}
              style={styles.clear}
            >
              <Icon name="close" size={16} color={theme.colors.muted} strokeWidth={2.4} />
            </Pressable>
          ) : null}
        </View>
      </View>

      <ScrollView
        testID="search-results"
        keyboardShouldPersistTaps="handled"
        keyboardDismissMode="on-drag"
        style={styles.list}
        contentContainerStyle={[styles.content, column, { paddingBottom: insets.bottom + 24 }]}
      >
        {emptyField ? (
          <>
            {recents.length > 0 ? (
              <View testID="search-recent" style={styles.group}>
                <View style={styles.labelRow}>
                  <GroupLabel>{t('search.recent')}</GroupLabel>
                  <Pressable
                    testID="search-recent-clear"
                    accessibilityRole="button"
                    accessibilityLabel={t('search.clearRecentLabel')}
                    onPress={() => setRecent([])}
                    style={styles.textButton}
                  >
                    <Text style={{ color: theme.colors.accent, fontFamily: ui('700'), fontSize: 14 }}>{t('search.clearRecent')}</Text>
                  </Pressable>
                </View>
                <Card>
                  {recents.map(({ p, i, title }, n) => (
                    <ListRow
                      key={`${p.bookNumber}:${p.chapter}`}
                      testID={`search-recent-${i}`}
                      first={n === 0}
                      glyph="clock"
                      title={title}
                      note={t(TRANSLATIONS[p.translation].shortKey)}
                      label={`${title}, ${t(TRANSLATIONS[p.translation].nameKey)}`}
                      onPress={() => openRecent(p)}
                    />
                  ))}
                </Card>
              </View>
            ) : null}
            <View testID="search-examples" style={styles.group}>
              <GroupLabel>{t('search.try')}</GroupLabel>
              <View style={styles.chips}>
                {EXAMPLE_KEYS.map((key, i) => (
                  <Pressable
                    key={key}
                    testID={`search-example-${i + 1}`}
                    accessibilityRole="button"
                    onPress={() => fillExample(t(key))}
                    style={styles.chipPress}
                  >
                    <View style={[styles.chip, buttonStyle(theme), { borderRadius: 999 }]}>
                      <Text style={{ color: theme.colors.btnText, fontFamily: ui('700'), fontSize: 14 }}>{t(key)}</Text>
                    </View>
                  </Pressable>
                ))}
              </View>
            </View>
          </>
        ) : (
          <>
            {passages.length > 0 ? (
              <View testID="search-passages" style={styles.group}>
                <GroupLabel>{t('search.passages')}</GroupLabel>
                <Card>
                  {passages.map((ref, i) => {
                    const isExact = i === 0 && exact !== null;
                    return (
                      <ListRow
                        key={`${ref.bookNumber}:${ref.chapter}:${ref.start}:${ref.end}`}
                        testID={`search-passage-${i}`}
                        first={i === 0}
                        glyph="book"
                        active={isExact}
                        title={passageTitle(ref)}
                        sub={passageSub(ref, isExact)}
                        onPress={() => openPassage(ref)}
                      />
                    );
                  })}
                </Card>
              </View>
            ) : null}

            {verseActive && search.isError ? (
              <StateBlock
                testID="search-error"
                glyph="offline"
                title={t('search.errorTitle')}
                body={t('search.errorBody')}
                live
                retry={{ testID: 'search-retry', label: t('common.retry'), onPress: () => void search.refetch() }}
              />
            ) : null}
            {verseActive && !search.isError && search.data === undefined ? <SearchingPlaceholder testID="search-loading" /> : null}
            {verseActive && search.data !== undefined && results.length === 0 ? (
              <StateBlock
                testID="search-no-results"
                glyph="notFound"
                title={t('search.noResults', { q: settled })}
                body={t('search.noResultsBody')}
              />
            ) : null}
            {verseActive && results.length > 0 ? (
              <View testID="search-verses" style={styles.group}>
                <GroupLabel>
                  {t(results.length === 1 ? 'search.versesCountOne' : 'search.versesCount', { n: results.length, translation: translationName })}
                </GroupLabel>
                {visible.map(({ verse }) => (
                  <VerseCard
                    key={verse.id}
                    testID={`search-verse-${verse.book_number}-${verse.chapter}-${verse.verse}`}
                    reference={`${bookName(verse.book_number)} ${verse.chapter}:${verse.verse}`}
                    text={verse.text}
                    terms={terms}
                    fontFamily={scripture.fontFamily}
                    onOpen={() =>
                      openPassage({ bookNumber: verse.book_number, chapter: verse.chapter, start: verse.verse, end: verse.verse })
                    }
                  />
                ))}
                {remaining > 0 ? (
                  <Pressable
                    testID="search-more"
                    accessibilityRole="button"
                    onPress={() => setShown({ key: resultKey, count: count + PAGE })}
                    style={[styles.more, buttonStyle(theme)]}
                  >
                    <Text style={{ color: theme.colors.btnText, fontFamily: ui('700'), fontSize: 14 }}>
                      {t('search.more', { n: Math.min(PAGE, remaining) })}
                    </Text>
                  </Pressable>
                ) : null}
              </View>
            ) : null}

            {showEntities && chinese ? (
              <View style={styles.group}>
                <GroupLabel>{t('search.entities')}</GroupLabel>
                <Text
                  testID="search-entities"
                  style={{ color: theme.colors.muted, fontFamily: ui('400'), fontSize: 14, lineHeight: 21 }}
                >
                  {t('entity.englishNames')}
                </Text>
              </View>
            ) : null}
            {showEntities && entityRows.length > 0 ? (
              <View testID="search-entities" style={styles.group}>
                <View style={styles.labelRow}>
                  <GroupLabel>{t('search.entities')}</GroupLabel>
                  <EnglishBadge />
                </View>
                <Card>
                  {entityRows.map((row, i) => (
                    <ListRow
                      key={`${row.kind}:${row.slug}`}
                      testID={`search-entity-${row.kind}-${row.slug}`}
                      first={i === 0}
                      glyph={KIND_GLYPH[row.kind]}
                      title={row.label}
                      note={t(KIND_KEY[row.kind])}
                      label={`${row.label}, ${t(KIND_KEY[row.kind])}`}
                      onPress={() => openEntity(entityPageHref(row.kind, row.slug))}
                    />
                  ))}
                </Card>
              </View>
            ) : null}
          </>
        )}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  screen: { flex: 1 },
  header: { flexDirection: 'row', alignItems: 'center', gap: 8, paddingHorizontal: 16, paddingBottom: 10 },
  field: { flex: 1, minWidth: 0, minHeight: 46, flexDirection: 'row', alignItems: 'center', gap: 8, paddingHorizontal: 14 },
  input: { flex: 1, minWidth: 0, minHeight: 44, fontSize: 16, padding: 0 },
  clear: { minWidth: 44, minHeight: 44, marginRight: -12, alignItems: 'center', justifyContent: 'center' },
  list: { flex: 1 },
  content: { paddingHorizontal: 16, paddingTop: 4, gap: 18 },
  group: { gap: 10 },
  labelRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  textButton: { marginLeft: 'auto', minHeight: 44, paddingHorizontal: 8, alignItems: 'center', justifyContent: 'center' },
  chips: { flexDirection: 'row', flexWrap: 'wrap', columnGap: 8 },
  chipPress: { minHeight: 44, justifyContent: 'center' },
  chip: { minHeight: 36, paddingHorizontal: 14, alignItems: 'center', justifyContent: 'center' },
  more: { minHeight: 44, alignItems: 'center', justifyContent: 'center' },
});
