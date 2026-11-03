// Original words, the list (Words.dc.html): one row per aligned English phrase, beside the Greek or
// Hebrew words it renders. A port of HG-3a. The alignment is always the BSB's.
import { useEffect, useMemo, useRef, type ComponentRef } from 'react';
import { ActivityIndicator, Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';

import type { BookInfo } from '../../api/schemas';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';
import { groupWordRows, languageOf, useVerseWords, type WordRow } from '../words';
import { focusNode, programmaticFocus, useFocusOnMount } from './a11y';
import { EnglishBadge, RoundIconButton, SheetFrame } from './sheetParts';
import { isRtl, useOriginalFont } from './useLazyFont';

export function WordsList({
  book,
  chapter,
  verse,
  reference,
  onBack,
  onClose,
  onOpenWord,
  onScrolled,
  restoreScrollY,
  restoreFocusKey,
}: {
  book: BookInfo;
  chapter: number;
  /** The first verse of the selection. */
  verse: number;
  /** The first verse's reference, e.g. "John 3:16". */
  reference: string;
  onBack(): void;
  onClose(): void;
  onOpenWord(row: WordRow): void;
  /** Reports the list's scroll position, so coming back from a word card can restore it. */
  onScrolled?(y: number): void;
  /** Coming back from a word card: where the list was, and the row that opened it. */
  restoreScrollY?: number;
  restoreFocusKey?: string;
}) {
  const theme = useTheme();
  const t = useT();
  const query = useVerseWords(book, chapter, verse);
  const rows = useMemo(() => groupWordRows(query.data?.words ?? []), [query.data]);
  const language = languageOf(query.data?.words ?? []);
  const originalFont = useOriginalFont(language);
  const titleRef = useFocusOnMount(restoreFocusKey === undefined);
  const scrollRef = useRef<ComponentRef<typeof ScrollView>>(null);
  const rowRefs = useRef(new Map<string, unknown>());

  // Back from a word card: the same place in the list, with focus on the row that was open. The focus does not
  // scroll (web): the list is already where it was, and a row that was only partly in view would move it.
  const ready = rows.length > 0;
  // React Native Web's ScrollView reports the end of a scroll 100 ms after the last one, from a timer it does not
  // clear on unmount. Opening a word within that time unmounts the list first, and the late report then reads the
  // detached node's offset, 0, over the place to come back to. Reports after the list is gone are not the list's.
  const alive = useRef(true);
  useEffect(() => {
    alive.current = true;
    return () => {
      alive.current = false;
    };
  }, []);
  useEffect(() => {
    if (!ready || restoreFocusKey === undefined) return;
    const id = setTimeout(() => {
      if (restoreScrollY) scrollRef.current?.scrollTo({ y: restoreScrollY, animated: false });
      focusNode(rowRefs.current.get(restoreFocusKey), { preventScroll: restoreScrollY !== undefined });
    }, 0);
    return () => clearTimeout(id);
  }, [ready, restoreFocusKey, restoreScrollY]);

  // Opening a word: the place to come back to is the list as it is now, read from the scroller itself (web). React
  // Native Web reports a scroll at most every 16 ms, and the rest only at its end, 100 ms later, which the list no
  // longer hears once the word has opened; so the last report can trail a scroll made just before the press (a
  // tap's own scroll into view under load). Native has no such node and keeps the last report.
  const openWord = (row: WordRow) => {
    const node = (scrollRef.current as { getScrollableNode?: () => unknown } | null)?.getScrollableNode?.();
    const y = (node as { scrollTop?: unknown } | null | undefined)?.scrollTop;
    if (typeof y === 'number') onScrolled?.(y);
    onOpenWord(row);
  };

  const bold = uiFace(theme.type.ui, '700');
  const regular = uiFace(theme.type.ui, '400');
  const muted = { color: theme.colors.muted, fontFamily: regular };
  const languageName = language ? t(`words.${language}`) : null;

  const header = (
    <View style={styles.titleRow}>
      <RoundIconButton testID="words-back" label={t('words.backToVerse')} icon="chevronLeft" onPress={onBack} />
      <View style={styles.titleText}>
        <Text
          ref={titleRef}
          accessibilityRole="header"
          {...programmaticFocus}
          style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19 }}
        >
          {t('words.title')}
        </Text>
        <Text style={[muted, { fontSize: 13 }]}>{languageName ? `${reference} · ${languageName}` : reference}</Text>
      </View>
      <RoundIconButton testID="sheet-close" label={t('common.close')} icon="close" onPress={onClose} />
    </View>
  );

  let body;
  if (query.isError && !query.isFetching) {
    body = (
      <View style={styles.state}>
        <Text style={{ color: theme.colors.text, fontFamily: regular, fontSize: 16 }}>{t('words.error')}</Text>
        <Pressable
          testID="words-retry"
          accessibilityRole="button"
          onPress={() => void query.refetch()}
          style={[styles.retry, { backgroundColor: theme.colors.cta }]}
        >
          <Text style={{ color: theme.colors.onCta, fontFamily: bold, fontSize: 15 }}>{t('common.retry')}</Text>
        </Pressable>
      </View>
    );
  } else if (!query.data) {
    // Loading, including a retry of an earlier error: never the old error while the new request runs.
    body = (
      <View style={styles.state}>
        <ActivityIndicator accessibilityLabel={t('common.loading')} color={theme.colors.muted} />
        <Text style={[muted, { fontSize: 14 }]}>{t('common.loading')}</Text>
      </View>
    );
  } else if (rows.length === 0) {
    body = (
      <View style={styles.state}>
        <Text style={{ color: theme.colors.text, fontFamily: regular, fontSize: 16 }}>{t('words.empty')}</Text>
        <Text style={[muted, { fontSize: 14 }]}>{t('words.emptyHint')}</Text>
      </View>
    );
  } else {
    body = (
      <>
        <Text style={[muted, { fontSize: 13 }]}>{t('words.alignmentNote')}</Text>
        {rows.map((row) => (
          <Pressable
            key={row.key}
            ref={(node) => {
              if (node) rowRefs.current.set(row.key, node);
              else rowRefs.current.delete(row.key);
            }}
            testID={`word-row-${row.key}`}
            accessibilityRole="button"
            onPress={() => openWord(row)}
            style={[styles.row, { borderTopColor: theme.colors.track }]}
          >
            <View style={styles.original}>
              {row.words.map((word, i) => (
                <Text
                  key={i}
                  testID={`word-original-${row.key}-${i}`}
                  style={{
                    color: theme.colors.text,
                    fontSize: 20,
                    fontFamily: originalFont,
                    ...(isRtl(languageOf([word])) ? { writingDirection: 'rtl' as const } : null),
                  }}
                >
                  {word.original ?? word.lemma ?? ''}
                </Text>
              ))}
              <Text style={[muted, { fontSize: 12 }]}>{row.words.map((w) => w.translit).filter(Boolean).join(' ')}</Text>
            </View>
            <View style={styles.meaning}>
              {row.kind === 'text' ? (
                <Text style={{ color: theme.colors.text, fontFamily: bold, fontSize: 15 }}>{row.english}</Text>
              ) : (
                <Text style={[muted, { fontSize: 14 }]}>{t(row.kind === 'untranslated' ? 'words.notTranslated' : 'words.elsewhere')}</Text>
              )}
              {row.words.some((w) => w.gloss) ? (
                <View style={styles.gloss}>
                  <Text style={[muted, { fontSize: 13, flexShrink: 1 }]}>{row.words.map((w) => w.gloss).filter(Boolean).join(' · ')}</Text>
                  <EnglishBadge />
                </View>
              ) : null}
            </View>
          </Pressable>
        ))}
      </>
    );
  }

  return (
    <SheetFrame testID="words-list" header={header} scrollRef={scrollRef} onScroll={(e) => {
        if (alive.current) onScrolled?.(e.nativeEvent.contentOffset.y);
      }}>
      {body}
    </SheetFrame>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  titleText: { flex: 1, gap: 1 },
  state: { gap: 12, paddingVertical: 8, alignItems: 'flex-start' },
  retry: { minHeight: 44, paddingHorizontal: 20, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  row: { minHeight: 52, flexDirection: 'row', alignItems: 'center', gap: 12, paddingVertical: 8, paddingHorizontal: 4, borderTopWidth: StyleSheet.hairlineWidth },
  original: { width: 128, flexShrink: 0 },
  meaning: { flex: 1, gap: 2 },
  gloss: { flexDirection: 'row', alignItems: 'center', gap: 6, flexWrap: 'wrap' },
});
