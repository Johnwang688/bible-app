// The Bible tab. The shown chapter is always the query for the current position (no copy of it
// is kept in state), so a late response for another chapter can never appear.
import { useCallback, useEffect, useMemo, useRef, useState, type ComponentRef } from 'react';
import { ActivityIndicator, Pressable, ScrollView, StyleSheet, Text, useWindowDimensions, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import type { ReaderPosition, ReadingSettings } from '../../storage/keys';
import { getStorage, type Storage } from '../../storage/storage';
import { useTheme } from '../../theme/ThemeProvider';
import { findBook, useBooks } from '../books';
import { clampPosition, nextPosition, prevPosition } from '../navigation';
import { useReaderPosition, useReadingSettings } from '../state';
import type { TranslationId } from '../translations';
import { usePrefetchAdjacent, useChapter } from '../useChapter';
import { BookPicker } from './BookPicker';
import { ChapterView, NARROW_PADDING, WIDE_BREAKPOINT, WIDE_PADDING } from './ChapterView';
import { Icon } from './icons';
import { HEADER_BODY_HEIGHT, ReaderHeader } from './ReaderHeader';
import { ReadingSettingsSheet } from './ReadingSettingsSheet';
import { useArrowKeys } from './useArrowKeys';
import { useChapterSwipe, type SwipeDirection } from './useChapterSwipe';
import { useCollapsingHeader } from './useCollapsingHeader';
import { VersionPicker } from './VersionPicker';
import { buttonStyle } from './ui';

type Sheet = 'book' | 'version' | 'settings';

/** Room under the text for the floating tab bar (plus the bottom inset). */
const TAB_BAR_ROOM = 120;
/** Room between the header and the first line. */
const HEADER_GAP = 16;

export function ReaderScreen(props: { storage?: Storage; locales?: readonly DeviceLocale[] }) {
  const theme = useTheme();
  const t = useT();
  const insets = useSafeAreaInsets();
  const { width } = useWindowDimensions();
  const storage = useMemo(() => props.storage ?? getStorage(), [props.storage]);

  const { position: stored, setPosition } = useReaderPosition({ storage, locales: props.locales });
  const [settings, setSettings] = useReadingSettings({ storage });
  const books = useBooks();

  const position = useMemo<ReaderPosition>(
    () => ({ ...clampPosition(books.data, stored), translation: stored.translation }),
    [books.data, stored],
  );
  const book = findBook(books.data, position.bookNumber);
  const first = position.translation;
  const secondId: TranslationId | null = settings.parallel && settings.parallel !== first ? settings.parallel : null;

  const firstQuery = useChapter(book, position.chapter, first);
  // With one translation this is the same query as the first, so nothing extra is requested.
  const secondQuery = useChapter(book, position.chapter, secondId ?? first);
  usePrefetchAdjacent(books.data, position, secondId ? [first, secondId] : [first]);

  const [sheet, setSheet] = useState<Sheet | null>(null);
  const closeSheet = useCallback(() => setSheet(null), []);

  // Each press computes from the latest position, even before React has re-rendered.
  const positionRef = useRef(position);
  const settingsRef = useRef(settings);
  useEffect(() => {
    positionRef.current = position;
    settingsRef.current = settings;
  }, [position, settings]);

  const saveSettings = useCallback(
    (next: ReadingSettings) => {
      settingsRef.current = next;
      setSettings(next);
    },
    [setSettings],
  );
  // Every move goes through here, so every translation change follows the same rule: both sides
  // are never the same, and when the new first is the old second, the old first becomes the second.
  const moveTo = useCallback(
    (next: ReaderPosition) => {
      const here = positionRef.current;
      const current = settingsRef.current;
      if (next.translation !== here.translation && current.parallel === next.translation) {
        saveSettings({ ...current, parallel: here.translation });
      }
      positionRef.current = next;
      setPosition(next);
    },
    [setPosition, saveSettings],
  );

  const turn = useCallback(
    (direction: SwipeDirection) => {
      const here = positionRef.current;
      const target = (direction === 'next' ? nextPosition : prevPosition)(books.data, here);
      if (target) moveTo({ ...target, translation: here.translation });
    },
    [books.data, moveTo],
  );
  const goNext = useCallback(() => turn('next'), [turn]);
  const goPrev = useCallback(() => turn('prev'), [turn]);

  const chooseTranslation = useCallback(
    (id: TranslationId) => {
      const here = positionRef.current;
      if (id !== here.translation) moveTo({ ...here, translation: id });
      setSheet(null);
    },
    [moveTo],
  );

  const swap = useCallback(() => {
    const here = positionRef.current;
    const current = settingsRef.current;
    if (!current.parallel || current.parallel === here.translation) return;
    moveTo({ ...here, translation: current.parallel });
  }, [moveTo]);

  // Tapping a verse selects it (the verse sheet is R-2); tapping it again clears it.
  const chapterKey = `${position.bookNumber}:${position.chapter}`;
  const [selection, setSelection] = useState<{ key: string; verse: number } | null>(null);
  const selectedVerse = selection?.key === chapterKey ? selection.verse : null;
  const onVersePress = useCallback(
    (verse: number) =>
      setSelection((prev) => (prev && prev.key === chapterKey && prev.verse === verse ? null : { key: chapterKey, verse })),
    [chapterKey],
  );

  const hideDistance = insets.top + HEADER_BODY_HEIGHT + 4;
  const header = useCollapsingHeader(hideDistance);
  const { reset: resetHeader } = header;
  const scrollRef = useRef<ComponentRef<typeof ScrollView>>(null);
  useEffect(() => {
    scrollRef.current?.scrollTo({ y: 0, animated: false });
    resetHeader();
  }, [position.bookNumber, position.chapter, resetHeader]);

  const swipeHandlers = useChapterSwipe(turn);
  useArrowKeys({ onNext: goNext, onPrev: goPrev, disabled: sheet !== null });

  // What to show: always derived from the queries for the current position.
  const queries = secondId ? [books, firstQuery, secondQuery] : [books, firstQuery];
  const ready = !!books.data && !!firstQuery.data && (!secondId || !!secondQuery.data);
  const failed = queries.some((q) => q.isError && !q.isFetching);
  const retry = () => {
    for (const q of queries) if (q.isError) void q.refetch();
  };

  const wide = width >= WIDE_BREAKPOINT;
  const horizontal = wide && secondId ? WIDE_PADDING : NARROW_PADDING;
  const next = nextPosition(books.data, position);
  const prev = prevPosition(books.data, position);

  const navButton = (direction: SwipeDirection) => (
    <Pressable
      testID={direction === 'next' ? 'reader-next' : 'reader-prev'}
      accessibilityRole="button"
      accessibilityLabel={t(direction === 'next' ? 'reader.nextChapter' : 'reader.previousChapter')}
      onPress={() => turn(direction)}
      style={[styles.nav, buttonStyle(theme)]}
    >
      <Icon name={direction === 'next' ? 'chevronRight' : 'chevronLeft'} size={22} color={theme.colors.btnText} />
    </Pressable>
  );

  const prevButton = prev ? navButton('prev') : null;
  const nextButton = next ? navButton('next') : null;

  let body;
  if (ready && firstQuery.data) {
    body = (
      <>
        <ChapterView
          chapter={firstQuery.data}
          translation={first}
          second={secondId && secondQuery.data ? { chapter: secondQuery.data, translation: secondId } : null}
          textSize={settings.textSize}
          selectedVerse={selectedVerse}
          onVersePress={onVersePress}
          onSwap={swap}
        />
        <View style={styles.navRow}>
          {prevButton ?? <View style={styles.navSpacer} />}
          {nextButton ?? <View style={styles.navSpacer} />}
        </View>
      </>
    );
  } else if (failed) {
    body = (
      <View style={styles.center}>
        <Text testID="reader-error" style={[styles.errorText, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') }]}>
          {t('reader.loadError')}
        </Text>
        <Pressable
          testID="reader-retry"
          accessibilityRole="button"
          onPress={retry}
          style={[styles.retry, buttonStyle(theme), { backgroundColor: theme.colors.cta }]}
        >
          <Text style={{ color: theme.colors.onCta, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{t('common.retry')}</Text>
        </Pressable>
      </View>
    );
  } else {
    body = (
      <View style={styles.center}>
        <ActivityIndicator
          testID="reader-loading"
          accessibilityLabel={t('common.loading')}
          color={theme.colors.muted}
          size="large"
        />
      </View>
    );
  }

  return (
    <View testID="screen-bible" style={[styles.fill, theme.backgrounds.reader]} {...swipeHandlers}>
      <ScrollView
        ref={scrollRef}
        testID="reader-scroll"
        onScroll={header.onScroll}
        scrollEventThrottle={16}
        keyboardShouldPersistTaps="handled"
        contentContainerStyle={[
          styles.content,
          {
            paddingTop: insets.top + HEADER_BODY_HEIGHT + HEADER_GAP,
            paddingBottom: TAB_BAR_ROOM + insets.bottom,
            paddingHorizontal: horizontal,
          },
        ]}
      >
        {body}
      </ScrollView>

      <ReaderHeader
        book={book}
        position={position}
        second={secondId}
        hidden={header.hidden}
        translateY={header.translateY}
        onShow={header.show}
        onOpenBook={() => setSheet('book')}
        onOpenVersions={() => setSheet('version')}
        onOpenSettings={() => setSheet('settings')}
      />

      {sheet === 'book' && books.data ? (
        <BookPicker
          books={books.data}
          position={position}
          storage={storage}
          onSelect={(p) => {
            moveTo(p);
            closeSheet();
          }}
          onClose={closeSheet}
        />
      ) : null}
      {sheet === 'version' ? <VersionPicker current={first} onSelect={chooseTranslation} onClose={closeSheet} /> : null}
      {sheet === 'settings' ? (
        <ReadingSettingsSheet settings={settings} translation={first} onChange={saveSettings} onSwap={swap} onClose={closeSheet} />
      ) : null}
    </View>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { flexGrow: 1 },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center', gap: 16, paddingVertical: 48 },
  errorText: { fontSize: 16, textAlign: 'center' },
  retry: { minHeight: 44, paddingHorizontal: 20, alignItems: 'center', justifyContent: 'center' },
  navRow: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', paddingTop: 28 },
  nav: { width: 56, height: 48, alignItems: 'center', justifyContent: 'center' },
  navSpacer: { width: 56, height: 48 },
});
