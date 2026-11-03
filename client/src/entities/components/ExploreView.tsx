// Study → Explore (design/proposed/r5-explore.html): one find field across people, places and themes; below it
// a card per kind (count and a few names) that opens the full list, or, once two characters are typed, the
// matches (three per kind, "See all N" opening that kind's list already filtered). The lists are kept for the
// session by TanStack Query; the query text is local state, so matching is synchronous. Nothing is written.
import { router } from 'expo-router';
import { useMemo, useState, type ReactNode } from 'react';
import { Pressable, ScrollView, StyleSheet, Text, TextInput, View } from 'react-native';

import type { EntityKind, SummaryEntityListItemOut } from '../../api/schemas';
import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { Icon } from '../../reader/components/icons';
import { EnglishBadge } from '../../reader/components/sheetParts';
import { buttonStyle } from '../../reader/components/ui';
import { hasCjk } from '../../search/searchTranslation';
import { useTheme } from '../../theme/ThemeProvider';
import type { Background } from '../../theme/types';
import { ENTITY_KINDS, filterEntityList, matchEntities, MATCH_MIN, useEntityList, type EntityMatch } from '../data';
import { Glyph, KIND_GLYPH } from '../glyphs';
import { entityListHref, entityPageHref } from '../routes';

const TITLE_KEY: Record<EntityKind, MessageKey> = { person: 'entity.people', place: 'entity.places', theme: 'entity.themes' };
const HINT_KEY: Record<EntityKind, MessageKey> = {
  person: 'explore.peopleHint',
  place: 'explore.placesHint',
  theme: 'explore.themesHint',
};
const SAMPLES: Record<EntityKind, readonly string[]> = {
  person: ['Abraham', 'David', 'Mary', 'Moses', 'Paul', 'Ruth'],
  place: ['Bethlehem', 'Galilee', 'Jerusalem', 'Rome', 'Sinai'],
  theme: ['Atonement', 'Blessing', 'Covenant promise', 'Grace'],
};
/** Home's card tones: c1, the plain surface, c3. */
const TONE: Record<EntityKind, 1 | 2 | 3> = { person: 1, place: 2, theme: 3 };

/** The names a card shows: the well-known ones that are in the loaded list, else the first five. */
function sampleNames(kind: EntityKind, list: readonly SummaryEntityListItemOut[] | undefined): string {
  if (!list || list.length === 0) return '';
  const labels = new Set(list.map((item) => item.label));
  const known = SAMPLES[kind].filter((name) => labels.has(name));
  return (known.length > 0 ? known : list.slice(0, 5).map((item) => item.label)).join(' · ');
}

/** The decorative chevron at the right of a card or row. */
function Chevron({ color }: { color: string }) {
  return <Glyph name="chevronRight" color={color} size={16} strokeWidth={2.2} />;
}

function KindCard({
  kind,
  count,
  samples,
  onOpen,
}: {
  kind: EntityKind;
  count: string;
  samples: string;
  onOpen: (href: string) => void;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  const tone = TONE[kind];
  const c = theme.canvas;
  const background: Background =
    tone === 1 && c.c1 !== undefined
      ? { backgroundColor: c.c1 }
      : tone === 3 && c.c3 !== undefined
        ? { backgroundColor: c.c3 }
        : theme.backgrounds.surface;
  const text = (tone === 1 ? c.c1t : tone === 3 ? c.c3t : undefined) ?? theme.colors.text;
  const muted = (tone === 1 ? c.c1m : tone === 3 ? c.c3m : undefined) ?? theme.colors.muted;
  const title = t(TITLE_KEY[kind]);
  const hint = t(HINT_KEY[kind]);

  return (
    <Pressable
      testID={`explore-card-${kind}`}
      accessibilityRole="button"
      accessibilityLabel={[title, count, hint].filter((part) => part !== '').join(', ')}
      onPress={() => onOpen(entityListHref(kind))}
      style={({ pressed }) => ({ minHeight: 44, opacity: pressed ? 0.85 : 1 })}
    >
      <GlassSurface
        background={background}
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
        <View style={[styles.disc, { backgroundColor: theme.colors.cta }]}>
          <Glyph name={KIND_GLYPH[kind]} color={theme.colors.onCta} size={22} />
        </View>
        <View style={styles.cardBody}>
          <View style={styles.cardTitleLine}>
            <Text style={{ color: text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 18 }}>{title}</Text>
            {count !== '' ? (
              <Text style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}>{count}</Text>
            ) : null}
            <View style={styles.badgeEnd}>
              <EnglishBadge />
            </View>
          </View>
          <Text style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}>{hint}</Text>
          {samples !== '' ? (
            <Text numberOfLines={1} style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
              {samples}
            </Text>
          ) : null}
        </View>
        <Chevron color={muted} />
      </GlassSurface>
    </Pressable>
  );
}

function MatchGroup({
  kind,
  matches,
  total,
  query,
  onOpen,
}: {
  kind: EntityKind;
  matches: EntityMatch[];
  total: number;
  query: string;
  onOpen: (href: string) => void;
}) {
  const theme = useTheme();
  const { t, formatNumber } = useI18n();
  return (
    <View testID={`explore-group-${kind}`} style={styles.group}>
      <View style={styles.groupHead}>
        <Text
          accessibilityRole="header"
          style={{
            color: theme.colors.muted,
            fontFamily: uiFace(theme.type.ui, '700'),
            fontSize: 12,
            letterSpacing: 0.6,
            textTransform: 'uppercase',
          }}
        >
          {t(TITLE_KEY[kind])}
        </Text>
        <EnglishBadge />
        <Pressable
          testID={`explore-see-all-${kind}`}
          accessibilityRole="button"
          onPress={() => onOpen(entityListHref(kind, query))}
          style={styles.seeAll}
        >
          <Text style={{ color: theme.colors.accent, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 13 }}>
            {t('explore.seeAll', { n: formatNumber(total) })}
          </Text>
        </Pressable>
      </View>
      <GlassSurface
        background={theme.backgrounds.surface}
        style={{
          overflow: 'hidden',
          borderRadius: theme.radii.card,
          borderWidth: theme.borders.card.width,
          borderColor: theme.borders.card.color,
          boxShadow: theme.shadows.card ?? undefined,
        }}
      >
        {matches.map((m, i) => (
          <Pressable
            key={m.slug}
            testID={`explore-result-${kind}-${m.slug}`}
            accessibilityRole="button"
            onPress={() => onOpen(entityPageHref(kind, m.slug))}
            style={({ pressed }) => [
              styles.row,
              i > 0 && { borderTopWidth: StyleSheet.hairlineWidth, borderTopColor: theme.borders.sheet.color },
              { opacity: pressed ? 0.85 : 1 },
            ]}
          >
            <View style={[styles.rowDisc, buttonStyle(theme), { borderRadius: 999 }]}>
              <Glyph name={KIND_GLYPH[kind]} color={theme.colors.btnText} size={17} />
            </View>
            <Text style={[styles.rowTitle, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }]}>{m.label}</Text>
            <Chevron color={theme.colors.muted} />
          </Pressable>
        ))}
      </GlassSurface>
    </View>
  );
}

function FindField({
  value,
  onChange,
  disabled,
}: {
  value: string;
  onChange: (value: string) => void;
  disabled: boolean;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  const [focused, setFocused] = useState(false);
  return (
    <View
      style={[
        styles.field,
        buttonStyle(theme),
        focused && { outlineColor: theme.colors.accent, outlineWidth: 2, outlineOffset: 1, outlineStyle: 'solid' },
        disabled && { opacity: 0.6 },
      ]}
    >
      <Icon name="search" size={18} color={theme.colors.muted} strokeWidth={2} />
      <TextInput
        testID="explore-find"
        value={value}
        onChangeText={onChange}
        onFocus={() => setFocused(true)}
        onBlur={() => setFocused(false)}
        editable={!disabled}
        aria-disabled={disabled}
        accessibilityState={{ disabled }}
        placeholder={t('explore.find')}
        placeholderTextColor={theme.colors.muted}
        accessibilityLabel={t('explore.find')}
        accessibilityHint={t('entity.matchRule')}
        autoCorrect={false}
        autoCapitalize="none"
        returnKeyType="search"
        style={[styles.input, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') }]}
      />
      {value !== '' ? (
        <Pressable
          testID="explore-find-clear"
          accessibilityRole="button"
          accessibilityLabel={t('search.clear')}
          onPress={() => onChange('')}
          style={styles.clear}
        >
          <Icon name="close" size={16} color={theme.colors.muted} strokeWidth={2.4} />
        </Pressable>
      ) : null}
    </View>
  );
}

export function ExploreView({
  header,
  bottomInset,
  onOpen,
}: {
  header: ReactNode;
  bottomInset: number;
  onOpen?: (href: string) => void;
}) {
  const theme = useTheme();
  const { t, formatNumber } = useI18n();
  const open = onOpen ?? ((href: string) => router.push(href as never));
  const [query, setQuery] = useState('');

  const person = useEntityList('person');
  const place = useEntityList('place');
  const theme_ = useEntityList('theme');
  const queries = { person, place, theme: theme_ };
  const failed = ENTITY_KINDS.filter((k) => queries[k].isError);
  const loading = failed.length === 0 && ENTITY_KINDS.some((k) => queries[k].isPending);
  const error = failed.length > 0;

  const trimmed = query.trim();
  const searching = trimmed.length >= MATCH_MIN;
  const chinese = hasCjk(trimmed);
  const lists = { person: person.data, place: place.data, theme: theme_.data };
  const matches = useMemo(
    () => (searching && !chinese ? matchEntities(lists, trimmed) : []),
    // The three arrays are stable while their queries are.
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [searching, chinese, trimmed, person.data, place.data, theme_.data],
  );
  const groups = ENTITY_KINDS.map((kind) => ({ kind, rows: matches.filter((m) => m.kind === kind) })).filter((g) => g.rows.length > 0);

  const muted = { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 21 };
  let body: ReactNode;
  if (error) {
    body = (
      <View testID="explore-error" style={styles.state}>
        <View style={[styles.stateDisc, buttonStyle(theme), { borderRadius: 999 }]}>
          <Glyph name="offline" color={theme.colors.muted} size={26} strokeWidth={1.9} />
        </View>
        <Text
          accessibilityRole="header"
          style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 17, textAlign: 'center' }}
        >
          {t('explore.errorTitle')}
        </Text>
        <Text style={[muted, { textAlign: 'center' }]}>{t('explore.errorBody')}</Text>
        <Pressable
          testID="explore-retry"
          accessibilityRole="button"
          onPress={() => failed.forEach((k) => void queries[k].refetch())}
          style={[styles.retry, { backgroundColor: theme.colors.cta, borderRadius: theme.radii.button, boxShadow: theme.shadows.cta }]}
        >
          <Text style={{ color: theme.colors.onCta, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{t('common.retry')}</Text>
        </Pressable>
      </View>
    );
  } else if (!searching) {
    body = ENTITY_KINDS.map((kind) => {
      const list = queries[kind].data;
      return (
        <KindCard
          key={kind}
          kind={kind}
          count={list ? formatNumber(list.length) : ''}
          samples={sampleNames(kind, list)}
          onOpen={open}
        />
      );
    });
  } else if (chinese) {
    body = (
      <Text testID="explore-no-match" style={[muted, styles.note]}>
        {t('entity.englishNames')}
      </Text>
    );
  } else if (groups.length > 0) {
    body = groups.map((g) => (
      <MatchGroup
        key={g.kind}
        kind={g.kind}
        matches={g.rows}
        total={filterEntityList(lists[g.kind] ?? [], trimmed).length}
        query={trimmed}
        onOpen={open}
      />
    ));
  } else if (!loading) {
    body = (
      <Text testID="explore-no-match" style={[muted, styles.note]}>
        {`${t('entity.noMatch', { q: trimmed })} ${t('entity.matchRule')}`}
      </Text>
    );
  }

  return (
    <ScrollView
      testID="explore"
      style={styles.fill}
      contentContainerStyle={[styles.content, { paddingBottom: bottomInset }]}
      keyboardShouldPersistTaps="handled"
      keyboardDismissMode="on-drag"
    >
      {header}
      <FindField value={query} onChange={setQuery} disabled={error} />
      {loading ? (
        <Text testID="explore-loading" accessibilityLiveRegion="polite" style={[muted, styles.note]}>
          {t('common.loading')}
        </Text>
      ) : null}
      {body}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { paddingHorizontal: 20, gap: 14 },
  field: { minHeight: 46, flexDirection: 'row', alignItems: 'center', gap: 8, paddingHorizontal: 14 },
  input: { flex: 1, minHeight: 44, fontSize: 16, padding: 0 },
  clear: { minWidth: 44, minHeight: 44, marginRight: -12, alignItems: 'center', justifyContent: 'center' },
  note: { marginHorizontal: 4 },
  card: { flexDirection: 'row', alignItems: 'center', gap: 14, padding: 16 },
  disc: { width: 44, height: 44, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  cardBody: { flex: 1, minWidth: 0, gap: 3 },
  cardTitleLine: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'baseline', columnGap: 8 },
  badgeEnd: { marginLeft: 'auto' },
  group: { gap: 8, marginTop: 4 },
  groupHead: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  seeAll: { marginLeft: 'auto', minHeight: 44, justifyContent: 'center', paddingLeft: 8 },
  row: { minHeight: 52, flexDirection: 'row', alignItems: 'center', gap: 12, paddingVertical: 8, paddingHorizontal: 14 },
  rowDisc: { width: 32, height: 32, alignItems: 'center', justifyContent: 'center' },
  rowTitle: { flex: 1, minWidth: 0, fontSize: 16 },
  state: { marginTop: 36, alignItems: 'center', gap: 10, paddingHorizontal: 28 },
  stateDisc: { width: 56, height: 56, alignItems: 'center', justifyContent: 'center' },
  retry: { minHeight: 44, marginTop: 6, paddingHorizontal: 20, alignItems: 'center', justifyContent: 'center' },
});
