// The people, places and themes lists (design/proposed/r5-entities.html): a title and count, a filter that
// narrows the list at once, A–Z sections with a jump bar for people, and a search-first prompt for the
// 2,989 themes.
import { router } from 'expo-router';
import { memo, useCallback, useEffect, useMemo, useRef, useState } from 'react';
import { Platform, Pressable, ScrollView, SectionList, StyleSheet, type TextStyle, Text, TextInput, View, useWindowDimensions } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { GlassSurface } from '../../components/GlassSurface';
import { BREAKPOINT } from '../../components/layout';
import { ContentColumn, useColumn } from '../../components/ContentColumn';
import type { EntityKind, SummaryEntityListItemOut } from '../../api/schemas';
import { AuroraBackground, auroraTextShadow } from '../../aurora';
import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { Icon } from '../../reader/components/icons';
import { EnglishBadge } from '../../reader/components/sheetParts';
import { buttonStyle } from '../../reader/components/ui';
import { hasCjk } from '../../search/searchTranslation';
import { useTheme } from '../../theme/ThemeProvider';
import { filterEntityList, sectionLetter, sortEntities, useEntityList } from '../data';
import { Glyph, KIND_GLYPH } from '../glyphs';
import { entityPageHref } from '../routes';
import { EntityCard, EntityLabel, EntityStateBlock, EntityTopBar, entityHeadStyle, useEntityBack } from './EntityParts';

/** Rows per card: a long list is cut into cards so the list can be virtualised. */
const CHUNK = 30;

const TITLE: Record<EntityKind, MessageKey> = { person: 'entity.people', place: 'entity.places', theme: 'entity.themes' };
const COUNT: Record<EntityKind, MessageKey> = { person: 'entity.countPeople', place: 'entity.countPlaces', theme: 'entity.countThemes' };
const FIND: Record<EntityKind, MessageKey> = { person: 'entity.findPerson', place: 'entity.findPlace', theme: 'entity.findTheme' };

interface Chunk {
  letter?: string | null;
  key: string;
  items: SummaryEntityListItemOut[];
}
interface Section {
  /** The letter heading, or null for one headerless run (filtering). */
  letter: string | null;
  data: Chunk[];
}

function chunk(items: SummaryEntityListItemOut[], prefix: string): Chunk[] {
  const out: Chunk[] = [];
  for (let i = 0; i < items.length; i += CHUNK) out.push({ key: `${prefix}-${items[i]!.slug}`, items: items.slice(i, i + CHUNK) });
  return out;
}

/** How long a jump keeps landing on its section while the rows above it are measured. */
const LANDING_MS = 1500;

export function EntityListScreen({
  kind,
  initialFilter,
  onBack,
  onOpenEntity,
}: {
  kind: EntityKind | null;
  initialFilter?: string;
  onBack?: () => void;
  onOpenEntity?: (href: string) => void;
}) {
  const { width } = useWindowDimensions();
  const columnKind = width >= BREAKPOINT.rail ? 'wide' : 'text';
  const column = useColumn(columnKind, 16);
  const theme = useTheme();
  const { t } = useI18n();
  const back = useEntityBack(onBack);
  return (
    <View testID="screen-entity-list" style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      <ContentColumn kind={columnKind} gutter={12}><EntityTopBar onBack={back} /></ContentColumn>
      {kind === null ? (
        <View style={[styles.padded, column]}>
          <EntityStateBlock testID="entity-not-found" glyph="notFound" title={t('entity.notFoundTitle')} body={t('entity.notFoundBody')} />
        </View>
      ) : (
        <EntityListBody key={kind} kind={kind} initialFilter={initialFilter ?? ''} onOpenEntity={onOpenEntity ?? defaultOpen} />
      )}
    </View>
  );
}

const defaultOpen = (href: string) => router.push(href as never);

function EntityListBody({ kind, initialFilter, onOpenEntity }: { kind: EntityKind; initialFilter: string; onOpenEntity(href: string): void }) {
  const { width } = useWindowDimensions();
  const columnKind = width >= BREAKPOINT.rail ? 'wide' : 'text';
  const column = useColumn(columnKind, 16);
  const columns = width >= BREAKPOINT.rail ? 3 : width >= BREAKPOINT.tablet ? 2 : 1;
  const theme = useTheme();
  const { t, formatNumber } = useI18n();
  const insets = useSafeAreaInsets();
  const query = useEntityList(kind);
  const [filter, setFilter] = useState(initialFilter);
  const listRef = useRef<SectionList<Chunk, Section>>(null);
  const retryTimer = useRef<ReturnType<typeof setTimeout> | null>(null);
  /** The section a jump is landing on, until its rows are measured (see `onContentSizeChange`). */
  const landing = useRef<{ sectionIndex: number; until: number } | null>(null);
  useEffect(
    () => () => {
      if (retryTimer.current) clearTimeout(retryTimer.current);
    },
    [],
  );

  const list = query.data;
  const sorted = useMemo(() => (list ? sortEntities(list) : []), [list]);
  const filtering = filter.trim() !== '';
  const matches = useMemo(() => (filtering ? filterEntityList(sorted, filter) : sorted), [filtering, sorted, filter]);

  const sections = useMemo<Section[]>(() => {
    if (!list) return [];
    if (filtering) return matches.length > 0 ? [{ letter: null, data: chunk(matches, 'found') }] : [];
    if (kind === 'theme') return []; // search-first
    const byLetter = new Map<string, SummaryEntityListItemOut[]>();
    for (const item of matches) {
      const letter = sectionLetter(item.label);
      const items = byLetter.get(letter);
      if (items) items.push(item);
      else byLetter.set(letter, [item]);
    }
    return [...byLetter].map(([letter, items]) => ({ letter, data: chunk(items, letter) }));
  }, [list, filtering, matches, kind]);

  const jumpLetters = useMemo(
    () => (kind === 'person' && !filtering ? sections.map((s) => s.letter).filter((l): l is string => l !== null) : []),
    [kind, filtering, sections],
  );

  const shownSections = useMemo<Section[]>(() => columns === 1 || sections.length === 0 ? sections : [{
    letter: null,
    data: sections.flatMap((section) => section.data.map((item, i) => ({ ...item, letter: i === 0 ? section.letter : null }))),
  }], [columns, sections]);
  const scrollToSection = useCallback((sectionIndex: number, animated: boolean) => {
    if (columns === 1) {
      listRef.current?.scrollToLocation({ sectionIndex, itemIndex: 0, viewPosition: 0, animated });
    } else {
      // One sticky jump header, with each letter and its first chunk in the same item. SectionList accounts
      // for the sticky header's measured height when itemIndex > 0 (the first data item is at index 1).
      const itemIndex = 1 + sections.slice(0, sectionIndex).reduce((sum, section) => sum + section.data.length, 0);
      listRef.current?.scrollToLocation({ sectionIndex: 0, itemIndex, viewPosition: 0, animated });
    }
  }, [columns, sections]);

  const jumpTo = useCallback(
    (letter: string) => {
      const sectionIndex = sections.findIndex((s) => s.letter === letter);
      if (sectionIndex < 0) return;
      if (retryTimer.current) clearTimeout(retryTimer.current);
      landing.current = { sectionIndex, until: Date.now() + LANDING_MS };
      scrollToSection(sectionIndex, true);
    },
    [sections, scrollToSection],
  );
  // The rows above a far section are measured only as the jump renders them, and each measurement moves the
  // section: a jump planned on estimates can stop short of it (or past it). Until the rows settle, every change of
  // the content's size lands on the section again. The reader's own scrolling (a drag, a touch, the wheel), or a new
  // filter, ends the landing.
  const onContentSizeChange = useCallback(() => {
    const target = landing.current;
    if (!target) return;
    if (Date.now() > target.until || target.sectionIndex >= sections.length) {
      landing.current = null;
      return;
    }
    scrollToSection(target.sectionIndex, false);
  }, [sections.length, scrollToSection]);
  const onMeasuredChunk = useCallback(() => {
    if (!landing.current) return;
    if (retryTimer.current) clearTimeout(retryTimer.current);
    // The child's layout arrives before SectionList has saved its cell's measured offset. Land after that
    // measurement too: a grid can exchange spacer height without changing the total content height.
    retryTimer.current = setTimeout(() => {
      retryTimer.current = null;
      onContentSizeChange();
    }, 50);
  }, [onContentSizeChange]);
  const endLanding = useCallback(() => {
    landing.current = null;
    if (retryTimer.current) clearTimeout(retryTimer.current);
    retryTimer.current = null;
  }, []);
  useEffect(endLanding, [filter, endLanding]);
  // A section far below the rendered window has no measured position yet: scroll to an estimate, which
  // renders it, then land on it.
  const onScrollToIndexFailed = useCallback(
    (info: { index: number; averageItemLength: number }) => {
      listRef.current?.getScrollResponder()?.scrollTo({ y: info.averageItemLength * info.index, animated: false });
      if (retryTimer.current) clearTimeout(retryTimer.current);
      retryTimer.current = setTimeout(() => {
        retryTimer.current = null;
        // Only for the jump still landing, within its time: the reader's own scrolling, a new filter or a newer jump
        // ended it.
        const target = landing.current;
        if (!target || Date.now() > target.until || target.sectionIndex >= sections.length) {
          landing.current = null;
          return;
        }
        scrollToSection(target.sectionIndex, true);
      }, 100);
    },
    [sections, scrollToSection],
  );

  const count = !list
    ? null
    : filtering
      ? matches.length === 1
        ? t('entity.matchesOne')
        : t('entity.matches', { n: formatNumber(matches.length) })
      : t(COUNT[kind], { n: formatNumber(list.length) });

  const trimmed = filter.trim();
  let empty: React.ReactElement | undefined;
  if (query.isError && !list) {
    empty = (
      <EntityStateBlock
        testID="entity-list-error"
        glyph="offline"
        title={t('entity.listErrorTitle')}
        body={t('entity.errorBody')}
        actionLabel={t('common.retry')}
        actionTestID="entity-list-retry"
        onAction={() => void query.refetch()}
      />
    );
  } else if (!list) {
    empty = (
      <Text
        testID="entity-list-loading"
        accessibilityLiveRegion="polite"
        style={[styles.note, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), ...auroraTextShadow(theme) }]}
      >
        {t('common.loading')}
      </Text>
    );
  } else if (filtering) {
    empty = (
      <View testID="entity-no-match" style={styles.note}>
        {/* A Chinese query can never match an English name, so the rule is no help: say why instead. */}
        {hasCjk(trimmed) ? null : (
          <Text style={[styles.noteText, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), ...auroraTextShadow(theme) }]}>
            {t('entity.noMatch', { q: trimmed })}
          </Text>
        )}
        <Text style={[styles.noteText, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), ...auroraTextShadow(theme) }]}>
          {hasCjk(trimmed) ? t('entity.englishNames') : t('entity.matchRule')}
        </Text>
      </View>
    );
  } else if (kind === 'theme') {
    empty = (
      <Text testID="entity-themes-prompt" style={[styles.note, styles.noteText, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), ...auroraTextShadow(theme) }]}>
        {t('entity.themesPrompt', { n: formatNumber(list.length) })}
      </Text>
    );
  } else {
    empty = undefined;
  }

  const jumpButtons = (<>
          {jumpLetters.map((letter) => (
            <Pressable
              key={letter}
              testID={`entity-jump-${letter}`}
              accessibilityRole="button"
              accessibilityLabel={t('entity.jumpTo', { letter })}
              onPress={() => jumpTo(letter)}
              style={columns > 1 ? styles.jumpHit : [styles.jump, buttonStyle(theme)]}
            >
              {columns > 1 ? <View style={[buttonStyle(theme), styles.jumpChip]}>
                <Text style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{letter}</Text>
              </View> : <Text style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{letter}</Text>}
            </Pressable>
          ))}
  </>);
  const jump = jumpLetters.length > 0 ? (columns > 1
    ? <View testID="entity-jump" style={styles.jumpWrap}>{jumpButtons}</View>
    : <ScrollView testID="entity-jump" horizontal showsHorizontalScrollIndicator={false} keyboardShouldPersistTaps="handled" contentContainerStyle={styles.jumpContent}>{jumpButtons}</ScrollView>
  ) : null;

  const header = (
    <View style={styles.header}>
      <View style={styles.titleBlock}>
        <View style={styles.titleRow}>
          <Text
            testID="entity-list-title"
            accessibilityRole="header"
            style={[
              entityHeadStyle(theme, theme.type.headSize, theme.type.headWeight),
              { letterSpacing: theme.type.headLetterSpacing, lineHeight: Math.round(theme.type.headSize * 1.15), flexShrink: 1, ...auroraTextShadow(theme) },
            ]}
          >
            {t(TITLE[kind])}
          </Text>
          <EnglishBadge />
        </View>
        {count !== null ? (
          <Text testID="entity-list-count" style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, ...auroraTextShadow(theme) }}>
            {count}
          </Text>
        ) : null}
      </View>
      <EntityFilter
        label={t(FIND[kind])}
        hint={t('entity.matchRule')}
        clearLabel={t('search.clear')}
        value={filter}
        onChange={setFilter}
        editable={!(query.isError && !list)}
      />
      {columns === 1 ? jump : null}
    </View>
  );

  return (
    <SectionList<Chunk, Section>
      testID="entity-list-scroll"
      ref={listRef}
      sections={shownSections}
      keyExtractor={(c) => c.key}
      ListHeaderComponent={header}
      ListEmptyComponent={empty}
      renderSectionHeader={({ section }) =>
        columns > 1 ? (jump ? <GlassSurface background={theme.backgrounds.tabBar}
          style={{ paddingVertical: 4, borderRadius: theme.radii.card, backgroundColor: theme.colors.base, overflow: 'hidden',
            // At 1120 the hits borrow a little of the column's gutter to keep their 44px minimum in one row.
            width: '100%', alignSelf: 'center', minWidth: width >= 1120 ? jumpLetters.length * 44 : undefined }}>{jump}</GlassSurface> : null) : section.letter === null ? null : (
          <View style={styles.sectionHeader}>
            <EntityLabel testID={`entity-section-${section.letter}`}>{section.letter}</EntityLabel>
          </View>
        )
      }
      renderItem={({ item }) => columns > 1 ? <View onLayout={onMeasuredChunk}>
        {item.letter ? <View style={styles.sectionHeader}><EntityLabel testID={`entity-section-${item.letter}`}>{item.letter}</EntityLabel></View> : null}
        <EntityRows columns={columns} items={item.items} kind={kind} onOpen={onOpenEntity} />
      </View> : <EntityRows columns={columns} items={item.items} kind={kind} onOpen={onOpenEntity} />}
      stickySectionHeadersEnabled={columns > 1}
      onScrollToIndexFailed={onScrollToIndexFailed}
      onContentSizeChange={onContentSizeChange}
      onScrollBeginDrag={endLanding}
      onTouchStart={endLanding}
      {...(Platform.OS === 'web' ? ({ onWheel: endLanding } as object) : {})}
      keyboardShouldPersistTaps="handled"
      keyboardDismissMode="on-drag"
      style={styles.fill}
      contentContainerStyle={[styles.content, column, { paddingBottom: insets.bottom + 24 }]}
    />
  );
}

/** The filter field, drawn like search's: the button surface, a search icon, an accent ring when focused. */
function EntityFilter({
  label,
  hint,
  clearLabel,
  value,
  onChange,
  editable,
}: {
  label: string;
  hint: string;
  clearLabel: string;
  value: string;
  onChange(v: string): void;
  editable: boolean;
}) {
  const theme = useTheme();
  const [focused, setFocused] = useState(false);
  return (
    <View
      style={[
        styles.field,
        buttonStyle(theme),
        focused && Platform.OS === 'web' && { outlineWidth: 2, outlineStyle: 'solid', outlineColor: theme.colors.accent, outlineOffset: 1 },
      ]}
    >
      <Icon name="search" size={18} color={theme.colors.muted} strokeWidth={2} />
      <TextInput
        testID="entity-filter"
        value={value}
        onChangeText={onChange}
        onFocus={() => setFocused(true)}
        onBlur={() => setFocused(false)}
        editable={editable}
        aria-disabled={!editable}
        accessibilityState={{ disabled: !editable }}
        placeholder={label}
        placeholderTextColor={theme.colors.muted}
        accessibilityLabel={label}
        accessibilityHint={hint}
        autoCorrect={false}
        autoCapitalize="none"
        returnKeyType="search"
        style={[styles.input, Platform.OS === 'web' && ({ outlineStyle: 'none' } as unknown as TextStyle), { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') }]}
      />
      {value !== '' ? (
        <Pressable
          testID="entity-filter-clear"
          accessibilityRole="button"
          accessibilityLabel={clearLabel}
          onPress={() => onChange('')}
          style={styles.clear}
        >
          <Icon name="close" size={16} color={theme.colors.muted} strokeWidth={2.4} />
        </Pressable>
      ) : null}
    </View>
  );
}

/** One card of rows: the kind's glyph in a disc, the name, a chevron. */
const EntityRows = memo(function EntityRows({
  items,
  kind,
  onOpen,
  columns,
}: {
  items: SummaryEntityListItemOut[];
  kind: EntityKind;
  onOpen(href: string): void;
  columns: number;
}) {
  const theme = useTheme();
  const disc = buttonStyle(theme);
  return (
    <EntityCard style={{ ...styles.card, ...(columns > 1 ? styles.grid : {}) }}>
      {items.map((item, i) => (
        <View key={item.slug} style={columns > 1 ? { width: `${100 / columns}%` } : undefined}>
          {i >= columns ? <View accessible={false} style={[styles.separator, { backgroundColor: theme.colors.muted }]} /> : null}
          <Pressable
            testID={`entity-row-${item.slug}`}
            accessibilityRole="button"
            onPress={() => onOpen(entityPageHref(kind, item.slug))}
            style={({ pressed }) => [styles.row, pressed && { opacity: 0.7 }]}
          >
            <View style={[styles.disc, disc, { borderRadius: 999 }]}>
              <Glyph name={KIND_GLYPH[kind]} color={theme.colors.btnText} size={17} />
            </View>
            <Text style={[styles.rowTitle, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }]}>{item.label}</Text>
            <Glyph name="chevronRight" color={theme.colors.muted} size={16} strokeWidth={2.2} />
          </Pressable>
        </View>
      ))}
    </EntityCard>
  );
});

const styles = StyleSheet.create({
  fill: { flex: 1 },
  padded: { paddingHorizontal: 16 },
  content: { paddingHorizontal: 16, flexGrow: 1 },
  header: { gap: 12, paddingBottom: 4 },
  titleBlock: { gap: 4, paddingTop: 6 },
  titleRow: { flexDirection: 'row', alignItems: 'center', gap: 10 },
  field: { minHeight: 46, flexDirection: 'row', alignItems: 'center', gap: 8, paddingHorizontal: 14 },
  input: { flex: 1, minWidth: 0, minHeight: 44, fontSize: 16, paddingVertical: 0 },
  clear: { width: 44, minHeight: 44, marginRight: -12, alignItems: 'center', justifyContent: 'center' },
  jumpContent: { gap: 6 },
  jumpWrap: { flexDirection: 'row', flexWrap: 'wrap' },
  jumpHit: { flex: 1, minWidth: 44, minHeight: 44, alignItems: 'center', justifyContent: 'center' },
  jumpChip: { width: 38, height: 44, alignItems: 'center', justifyContent: 'center' },
  grid: { flexDirection: 'row', flexWrap: 'wrap' },
  jump: { minWidth: 44, minHeight: 44, paddingHorizontal: 10, alignItems: 'center', justifyContent: 'center' },
  sectionHeader: { paddingTop: 16, paddingBottom: 8 },
  card: { overflow: 'hidden', marginBottom: 12 },
  separator: { height: 1, opacity: 0.28 },
  row: { minHeight: 52, flexDirection: 'row', alignItems: 'center', gap: 12, paddingVertical: 8, paddingHorizontal: 14 },
  disc: { width: 32, height: 32, alignItems: 'center', justifyContent: 'center' },
  rowTitle: { flex: 1, minWidth: 0, fontSize: 16 },
  note: { marginTop: 24, gap: 6 },
  noteText: { fontSize: 14, lineHeight: 21 },
});
