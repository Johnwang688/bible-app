// One person, place or theme (design/proposed/r5-entities.html): the name and how many chapters it appears
// in, the overview, a "life and times" timeline whose references open in the reader, and every chapter that
// names it, by book. The page is a root stack screen above the tabs, with Back.
import { useMemo, useState } from 'react';
import { useWindowDimensions, Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { BREAKPOINT } from '../../components/layout';
import { ContentColumn, useColumn } from '../../components/ContentColumn';
import { ApiError } from '../../api/client';
import type { BookInfo, EntityKind, SummaryEntityPageOut } from '../../api/schemas';
import { AuroraBackground, auroraTextShadow } from '../../aurora';
import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import type { AppLocale } from '../../i18n/types';
import type { MessageKey } from '../../i18n/messages/en';
import { bookNameForLocale, findBook, useBooks } from '../../reader/books';
import { EnglishBadge } from '../../reader/components/sheetParts';
import { buttonStyle } from '../../reader/components/ui';
import { buildBookIndex } from '../../search/reference';
import type { PassageRef } from '../../search/types';
import { useOpenPassage } from '../../search/useOpenPassage';
import type { Storage } from '../../storage/storage';
import { formatReference } from '../../study/share';
import { useTheme } from '../../theme/ThemeProvider';
import { groupReferencesByBook, useEntityPage } from '../data';
import { Glyph } from '../glyphs';
import { localiseEra, parseTimeline, type TimelineEvent } from '../timeline';
import { EntityCard, EntityLabel, EntityStateBlock, EntityTopBar, entityHeadStyle, useEntityBack } from './EntityParts';

const KIND_LABEL: Record<EntityKind, MessageKey> = { person: 'entity.person', place: 'entity.place', theme: 'entity.theme' };
/** An overview longer than this is cut to three lines with Read more. */
const LONG_OVERVIEW = 160;
const FIRST_EVENTS = 5;
const MORE_EVENTS = 10;

export function EntityPageScreen({
  kind,
  slug,
  storage,
  navigate,
  onBack,
}: {
  kind: EntityKind | null;
  slug: string;
  storage?: Storage;
  navigate?: () => void;
  onBack?: () => void;
}) {
  const column = useColumn('text', 16);
  const theme = useTheme();
  const { t } = useI18n();
  const back = useEntityBack(onBack);
  return (
    <View testID="screen-entity" style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      <ContentColumn gutter={12}><EntityTopBar onBack={back} /></ContentColumn>
      {kind === null ? (
        <View style={[styles.padded, column]}>
          <EntityStateBlock testID="entity-not-found" glyph="notFound" title={t('entity.notFoundTitle')} body={t('entity.notFoundBody')} />
        </View>
      ) : (
        <EntityPageLoader key={`${kind}/${slug}`} kind={kind} slug={slug} storage={storage} navigate={navigate} />
      )}
    </View>
  );
}

function EntityPageLoader({ kind, slug, storage, navigate }: { kind: EntityKind; slug: string; storage?: Storage; navigate?: () => void }) {
  const column = useColumn('text', 16);
  const theme = useTheme();
  const { t } = useI18n();
  const query = useEntityPage(kind, slug);
  const page = query.data;

  if (!page) {
    if (query.isError) {
      if (query.error instanceof ApiError && query.error.kind === 'http' && query.error.status === 404) {
        return (
          <View style={[styles.padded, column]}>
            <EntityStateBlock testID="entity-not-found" glyph="notFound" title={t('entity.notFoundTitle')} body={t('entity.notFoundBody')} />
          </View>
        );
      }
      return (
        <View style={[styles.padded, column]}>
          <EntityStateBlock
            testID="entity-error"
            glyph="offline"
            title={t('entity.errorTitle')}
            body={t('entity.errorBody')}
            actionLabel={t('common.retry')}
            actionTestID="entity-retry"
            onAction={() => void query.refetch()}
          />
        </View>
      );
    }
    return (
      <Text
        testID="entity-loading"
        accessibilityLiveRegion="polite"
        style={[styles.loading, column, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), ...auroraTextShadow(theme) }]}
      >
        {t('common.loading')}
      </Text>
    );
  }
  return <EntityPageContent kind={kind} page={page} storage={storage} navigate={navigate} />;
}

function EntityPageContent({ kind, page, storage, navigate }: { kind: EntityKind; page: SummaryEntityPageOut; storage?: Storage; navigate?: () => void }) {
  const column = useColumn('text', 16);
  const theme = useTheme();
  const { t, formatNumber } = useI18n();
  const insets = useSafeAreaInsets();
  const books = useBooks();
  const groups = useMemo(() => groupReferencesByBook(page.references), [page.references]);
  const chapterCount = groups.reduce((n, g) => n + g.chapters.length, 0);
  const overview = page.overview?.trim() ?? '';
  const events = useMemo(
    () => (books.data ? parseTimeline(page.timeline, buildBookIndex(books.data)) : []),
    [books.data, page.timeline],
  );

  return (
    <ScrollView
      testID="entity-content"
      keyboardShouldPersistTaps="handled"
      keyboardDismissMode="on-drag"
      style={styles.fill}
      contentContainerStyle={[styles.content, column, { paddingBottom: insets.bottom + 24 }]}
    >
      <View style={styles.titleBlock}>
        <EntityLabel testID="entity-kind" header={false}>
          {t(KIND_LABEL[kind])}
        </EntityLabel>
        <View style={styles.titleRow}>
          <Text
            testID="entity-title"
            accessibilityRole="header"
            style={[
              entityHeadStyle(theme, theme.type.headSize, theme.type.headWeight),
              { letterSpacing: theme.type.headLetterSpacing, lineHeight: Math.round(theme.type.headSize * 1.15), flexShrink: 1, ...auroraTextShadow(theme) },
            ]}
          >
            {page.label}
          </Text>
          <EnglishBadge />
        </View>
        <Text testID="entity-appears" style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, ...auroraTextShadow(theme) }}>
          {chapterCount === 1 ? t('entity.appearsInOne') : t('entity.appearsIn', { n: formatNumber(chapterCount) })}
        </Text>
      </View>

      {overview !== '' ? <Overview text={overview} /> : null}

      {events.length > 0 ? <Timeline events={events} books={books.data ?? []} storage={storage} navigate={navigate} /> : null}

      <View testID="entity-chapters" style={styles.section}>
        <EntityLabel>{t('entity.chapters')}</EntityLabel>
        {kind === 'theme' ? (
          <Text testID="entity-theme-note" style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 21, ...auroraTextShadow(theme) }}>
            {t('entity.themeNote')}
          </Text>
        ) : null}
        {books.data ? <ChapterGroups groups={groups} books={books.data} storage={storage} navigate={navigate} /> : null}
      </View>
    </ScrollView>
  );
}

function Overview({ text }: { text: string }) {
  const prose = useWindowDimensions().width >= BREAKPOINT.tablet ? { maxWidth: 620 } : null;
  const theme = useTheme();
  const { t } = useI18n();
  const [open, setOpen] = useState(false);
  const long = text.length > LONG_OVERVIEW;
  return (
    <EntityCard testID="entity-overview" style={styles.overview}>
      <EntityLabel>{t('entity.overview')}</EntityLabel>
      <Text
        testID="entity-overview-text"
        numberOfLines={long && !open ? 3 : undefined}
        style={[prose, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 15, lineHeight: Math.round(15 * 1.55) }]}
      >
        {text}
      </Text>
      {long ? (
        <Pressable
          testID="entity-overview-toggle"
          accessibilityRole="button"
          accessibilityState={{ expanded: open }}
          aria-expanded={open}
          onPress={() => setOpen(!open)}
          style={styles.textButton}
        >
          <Text style={{ color: theme.colors.accent, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14 }}>
            {open ? t('entity.showLess') : t('entity.readMore')}
          </Text>
        </Pressable>
      ) : null}
    </EntityCard>
  );
}

/** "John 3:16–18" in the interface language ("John 3" for a whole chapter). */
function referenceLabel(ref: PassageRef, books: readonly BookInfo[], locale: AppLocale): string {
  const book = findBook(books as BookInfo[], ref.bookNumber);
  const name = book ? bookNameForLocale(book, locale) : String(ref.bookNumber);
  const chapter = ref.chapter ?? 1;
  if (ref.start === undefined) return `${name} ${chapter}`;
  const end = Math.min(ref.end ?? ref.start, ref.start + 400);
  return formatReference(name, chapter, Array.from({ length: Math.max(end - ref.start + 1, 1) }, (_, i) => ref.start! + i));
}

function Timeline({
  events,
  books,
  storage,
  navigate,
}: {
  events: TimelineEvent[];
  books: readonly BookInfo[];
  storage?: Storage;
  navigate?: () => void;
}) {
  const prose = useWindowDimensions().width >= BREAKPOINT.tablet ? { maxWidth: 620 } : null;
  const theme = useTheme();
  const { t, locale } = useI18n();
  const openPassage = useOpenPassage({ storage, navigate });
  const [shown, setShown] = useState(FIRST_EVENTS);
  const [open, setOpen] = useState<ReadonlySet<number>>(() => new Set([0]));
  const toggle = (i: number) =>
    setOpen((prev) => {
      const next = new Set(prev);
      if (!next.delete(i)) next.add(i);
      return next;
    });
  const visible = events.slice(0, shown);
  const remaining = events.length - visible.length;
  const more = Math.min(MORE_EVENTS, remaining);
  const ui = (weight: '400' | '700') => uiFace(theme.type.ui, weight);

  return (
    <View style={styles.section}>
      <EntityLabel>{t('entity.life')}</EntityLabel>
      <View testID="entity-timeline">
        {visible.map((event, i) => {
          const isOpen = open.has(i);
          const era = event.era ? t('entity.eraLabel', { era: localiseEra(event.era, books as BookInfo[], locale) }) : '';
          return (
            <View key={i} style={styles.event}>
              <View accessible={false} style={styles.rail}>
                <View style={[styles.dot, { borderColor: theme.colors.accent, backgroundColor: isOpen ? theme.colors.accent : 'transparent' }]} />
                {i < visible.length - 1 ? <View style={[styles.line, { backgroundColor: theme.colors.muted }]} /> : null}
              </View>
              <View style={[styles.eventBody, prose]}>
                <Pressable
                  testID={`entity-event-${i}`}
                  accessibilityRole="button"
                  accessibilityState={{ expanded: isOpen }}
                  aria-expanded={isOpen}
                  onPress={() => toggle(i)}
                  style={styles.eventHeader}
                >
                  {era !== '' ? (
                    <Text testID={`entity-era-${i}`} accessibilityLabel={era} style={{ color: theme.colors.muted, fontFamily: ui('700'), fontSize: 12, ...auroraTextShadow(theme) }}>
                      {era}
                    </Text>
                  ) : null}
                  <Text style={[entityHeadStyle(theme, 16), { lineHeight: 22, ...auroraTextShadow(theme) }]}>{event.title}</Text>
                  {event.summary !== '' ? (
                    <Text style={{ color: theme.colors.muted, fontFamily: ui('400'), fontSize: 14, lineHeight: 20, ...auroraTextShadow(theme) }}>{event.summary}</Text>
                  ) : null}
                </Pressable>
                {isOpen ? (
                  <View style={styles.developments}>
                    {event.developments.map((dev, j) =>
                      dev.ref ? (
                        <Pressable
                          key={j}
                          testID={`entity-dev-${i}-${j}`}
                          accessibilityRole="button"
                          accessibilityHint={t('search.openHint')}
                          onPress={() => openPassage(dev.ref!)}
                          style={({ pressed }) => [styles.devRow, pressed && { opacity: 0.7 }]}
                        >
                          <Text style={[styles.devText, { color: theme.colors.text, fontFamily: ui('400'), ...auroraTextShadow(theme) }]}>
                            {dev.text}{' '}
                            <Text style={{ color: theme.colors.accent, fontFamily: ui('700') }}>{referenceLabel(dev.ref, books, locale)}</Text>
                          </Text>
                          <Glyph name="chevronRight" color={theme.colors.muted} size={16} strokeWidth={2.2} />
                        </Pressable>
                      ) : (
                        <Text key={j} testID={`entity-dev-${i}-${j}`} style={[styles.devText, styles.devPlain, { color: theme.colors.text, fontFamily: ui('400'), ...auroraTextShadow(theme) }]}>
                          {dev.text}
                        </Text>
                      ),
                    )}
                    {event.significance ? (
                      <Text style={{ color: theme.colors.muted, fontFamily: ui('400'), fontSize: 14, lineHeight: 20, paddingTop: 4, ...auroraTextShadow(theme) }}>
                        {event.significance}
                      </Text>
                    ) : null}
                  </View>
                ) : null}
              </View>
            </View>
          );
        })}
      </View>
      {remaining > 0 ? (
        <Pressable
          testID="entity-more-events"
          accessibilityRole="button"
          onPress={() => setShown(shown + MORE_EVENTS)}
          style={[styles.moreEvents, buttonStyle(theme)]}
        >
          <Text style={{ color: theme.colors.btnText, fontFamily: ui('700'), fontSize: 14 }}>
            {more === 1 ? t('entity.moreEventsOne') : t('entity.moreEvents', { n: more })}
          </Text>
        </Pressable>
      ) : null}
    </View>
  );
}

function ChapterGroups({
  groups,
  books,
  storage,
  navigate,
}: {
  groups: { bookNumber: number; chapters: number[] }[];
  books: readonly BookInfo[];
  storage?: Storage;
  navigate?: () => void;
}) {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const openPassage = useOpenPassage({ storage, navigate });
  return (
    <>
      {groups.map((group) => {
        const book = findBook(books as BookInfo[], group.bookNumber);
        const name = book ? bookNameForLocale(book, locale) : String(group.bookNumber);
        return (
          <View key={group.bookNumber} style={styles.bookGroup}>
            <Text testID={`entity-book-${group.bookNumber}`} accessibilityRole="header" style={[entityHeadStyle(theme, 15), { lineHeight: 21, ...auroraTextShadow(theme) }]}>
              {name}
            </Text>
            <View style={styles.grid}>
              {group.chapters.map((chapter) => (
                <View key={chapter} style={styles.cell}>
                  <Pressable
                    testID={`entity-chapter-${group.bookNumber}-${chapter}`}
                    accessibilityRole="button"
                    accessibilityLabel={t('entity.chapterLabel', { book: name, chapter })}
                    onPress={() => openPassage({ bookNumber: group.bookNumber, chapter })}
                    style={[styles.chip, buttonStyle(theme)]}
                  >
                    <Text style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{chapter}</Text>
                  </Pressable>
                </View>
              ))}
            </View>
          </View>
        );
      })}
    </>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  padded: { paddingHorizontal: 16 },
  loading: { marginTop: 36, paddingHorizontal: 16, textAlign: 'center', fontSize: 14 },
  content: { paddingHorizontal: 16, gap: 12 },
  titleBlock: { gap: 4, paddingTop: 6, paddingBottom: 4 },
  titleRow: { flexDirection: 'row', alignItems: 'center', flexWrap: 'wrap', gap: 10 },
  section: { gap: 12, marginTop: 6 },
  overview: { paddingVertical: 14, paddingHorizontal: 16, gap: 8 },
  textButton: { alignSelf: 'flex-start', minHeight: 44, justifyContent: 'center' },
  event: { flexDirection: 'row', gap: 12 },
  rail: { width: 14, alignItems: 'center' },
  dot: { width: 12, height: 12, marginTop: 4, borderRadius: 999, borderWidth: 2 },
  line: { flex: 1, width: 2, opacity: 0.35 },
  eventBody: { flex: 1, minWidth: 0, paddingBottom: 14 },
  eventHeader: { minHeight: 44, gap: 2 },
  developments: { gap: 2, paddingTop: 6 },
  devRow: { minHeight: 44, flexDirection: 'row', alignItems: 'center', gap: 8 },
  devText: { flex: 1, minWidth: 0, fontSize: 14, lineHeight: 20 },
  devPlain: { paddingVertical: 6 },
  moreEvents: { minHeight: 44, paddingHorizontal: 16, alignItems: 'center', justifyContent: 'center' },
  bookGroup: { gap: 8 },
  grid: { flexDirection: 'row', flexWrap: 'wrap', marginHorizontal: -4 },
  cell: { width: '16.66%', padding: 4 },
  chip: { minHeight: 44, alignItems: 'center', justifyContent: 'center' },
});
