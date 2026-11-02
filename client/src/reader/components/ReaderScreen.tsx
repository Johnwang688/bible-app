// The Bible tab. The shown chapter is always the query for the current position (no copy of it
// is kept in state), so a late response for another chapter can never appear.
import { useCallback, useEffect, useMemo, useRef, useState, type ComponentRef } from 'react';
import {
  ActivityIndicator,
  Platform,
  Pressable,
  ScrollView,
  StyleSheet,
  Text,
  useWindowDimensions,
  View,
  type NativeScrollEvent,
  type NativeSyntheticEvent,
} from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import type { ChapterInfo } from '../../progress';
import type { ReaderPosition, ReadingSettings } from '../../storage/keys';
import { getStorage, type Storage } from '../../storage/storage';
import { useStudyItems } from '../../study';
import { useTheme } from '../../theme/ThemeProvider';
import { findBook, useBooks } from '../books';
import { clampPosition, nextPosition, prevPosition } from '../navigation';
import { useReaderPosition, useReadingSettings } from '../state';
import { readerTargets, usePendingReaderTarget } from '../target';
import type { TranslationId } from '../translations';
import { usePrefetchAdjacent, useChapter } from '../useChapter';
import { useFocusNodeSoon } from './a11y';
import { BookPicker } from './BookPicker';
import { ChapterView, NARROW_PADDING, WIDE_BREAKPOINT, WIDE_PADDING } from './ChapterView';
import { Icon } from './icons';
import { HEADER_BODY_HEIGHT, ReaderHeader } from './ReaderHeader';
import { ReadingSettingsSheet } from './ReadingSettingsSheet';
import { useArrowKeys } from './useArrowKeys';
import { useChapterSwipe, type SwipeDirection } from './useChapterSwipe';
import { useCollapsingHeader } from './useCollapsingHeader';
import { useHideTabBar } from './useHideTabBar';
import { useReadingTime } from './useReadingTime';
import { useTabFocused } from './useTabFocused';
import { useVerseScroller } from './scrollToVerse';
import { VerseSheet } from './VerseSheet';
import { VersionPicker } from './VersionPicker';
import { buttonStyle } from './ui';

type Sheet = 'book' | 'version' | 'settings';

interface Selection {
  /** The chapter and translation it belongs to. */
  key: string;
  /** The verse the selection started from; a long press extends from here. */
  anchor: number;
  start: number;
  end: number;
  /**
   * Whether the verse sheet is showing for it. The sheet's open state lives here, in the selection, so the
   * two can never disagree: whatever drops the selection (a chapter or translation change, closing) closes
   * the sheet with it. A reference from a word card selects its verse with the sheet closed.
   */
  open: boolean;
}

/** Room under the text for the floating tab bar (plus the bottom inset). */
const TAB_BAR_ROOM = 120;
/** Room between the header and the first line. */
const HEADER_GAP = 16;

export function ReaderScreen(props: {
  storage?: Storage;
  locales?: readonly DeviceLocale[];
  /** The reading-time clock; `Date.now` when absent. */
  now?: () => number;
}) {
  const theme = useTheme();
  const t = useT();
  const insets = useSafeAreaInsets();
  const { width, height: windowHeight } = useWindowDimensions();
  const storage = useMemo(() => props.storage ?? getStorage(), [props.storage]);

  const { position: stored, setPosition } = useReaderPosition({ storage, locales: props.locales });
  const [settings, setSettings] = useReadingSettings({ storage });
  const study = useStudyItems({ storage });
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

  // What to show: always derived from the queries for the current position.
  const queries = secondId ? [books, firstQuery, secondQuery] : [books, firstQuery];
  const ready = !!books.data && !!firstQuery.data && (!secondId || !!secondQuery.data);
  const failed = queries.some((q) => q.isError && !q.isFetching);
  const retry = () => {
    for (const q of queries) if (q.isError) void q.refetch();
  };

  // The chapter on screen: the first translation's data for the current position, once everything shown is
  // ready. Reading time and opening in context both wait for it; they never act on a chapter that is loading,
  // failed or no longer the current position.
  const loaded = firstQuery.data;
  const shownChapter =
    ready && loaded && loaded.book_number === position.bookNumber && loaded.chapter === position.chapter ? loaded : null;
  const isShown = !!shownChapter;
  const totalVerses = shownChapter?.verses.length ?? 0;
  const shownInfo = useMemo<ChapterInfo | null>(
    () => (isShown ? { bookNumber: position.bookNumber, chapter: position.chapter, totalVerses } : null),
    [isShown, position.bookNumber, position.chapter, totalVerses],
  );
  // Keys move the reader, and the clock runs, only while its tab is showing (the tab stays mounted on web).
  const focused = useTabFocused();
  const reading = useReadingTime({ storage, now: props.now, chapter: shownInfo, focused });

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

  // The selection is a range in the shown chapter. It belongs to one chapter in one translation: any
  // change of either discards it, and with it the verse sheet. Tapping a verse selects it and opens the
  // verse sheet; a long press on another verse extends the range. Closing the sheet clears the selection.
  const selectionKey = `${position.bookNumber}:${position.chapter}:${first}`;
  const [selection, setSelection] = useState<Selection | null>(null);
  const range = selection?.key === selectionKey ? selection : null;
  // Adjusting state while rendering: a selection from another chapter or translation is dropped at once,
  // so it can never reappear when the reader comes back to that chapter.
  if (selection && !range) setSelection(null);
  // The single source of truth for "the verse sheet is open": a selection in this chapter that has the sheet
  // open, and a chapter to show it for. Key handling, the tab bar and the rendered sheet all read this.
  const verseSheetOpen = !!(range?.open && book && firstQuery.data);

  // Extends the selection from its anchor (the first verse selected) to `verse`; with no selection it starts one.
  const extendTo = useCallback(
    (verse: number) => {
      setSelection((prev) =>
        prev && prev.key === selectionKey
          ? { ...prev, start: Math.min(prev.anchor, verse), end: Math.max(prev.anchor, verse), open: true }
          : { key: selectionKey, anchor: verse, start: verse, end: verse, open: true },
      );
    },
    [selectionKey],
  );
  // The sheet is not modal, so the chapter can be tapped while it is open: that tap extends the range, as
  // a long press does. With the sheet closed a tap starts a new selection.
  const onVersePress = useCallback(
    (verse: number) => {
      reading.interact();
      if (verseSheetOpen) extendTo(verse);
      else setSelection({ key: selectionKey, anchor: verse, start: verse, end: verse, open: true });
    },
    [verseSheetOpen, extendTo, selectionKey, reading],
  );
  const onVerseLongPress = useCallback(
    (verse: number) => {
      reading.interact();
      extendTo(verse);
    },
    [extendTo, reading],
  );

  // The open verse sheet's height: the chapter keeps that much room under its text, so any verse can be
  // scrolled up above the sheet.
  const [sheetHeight, setSheetHeight] = useState(0);
  const sheetRoom = verseSheetOpen ? sheetHeight : 0;
  // The sheet takes the bottom of the screen; the (floating) tab bar would cover its last row.
  useHideTabBar(verseSheetOpen);

  // Each verse-tools button, so focus can go back to it when the sheet closes.
  const toolsRefs = useRef(new Map<number, unknown>());
  const registerTools = useCallback((verse: number, node: unknown) => {
    if (node) toolsRefs.current.set(verse, node);
    else toolsRefs.current.delete(verse);
  }, []);
  const focusSoon = useFocusNodeSoon();
  // A verse to scroll to once its chapter is on screen (see the effect below).
  const pendingScroll = useRef<{ key: string; verse: number } | null>(null);

  const closeVerseSheet = () => {
    const anchor = range?.anchor;
    setSelection(null);
    if (anchor !== undefined) focusSoon(toolsRefs.current.get(anchor));
  };

  // A reference on a word card: go to that chapter in this translation and select the verse, sheet closed.
  const goToReference = (bookNumber: number, chapter: number, verse: number) => {
    const here = positionRef.current;
    moveTo({ bookNumber, chapter, translation: here.translation });
    const key = `${bookNumber}:${chapter}:${here.translation}`;
    setSelection({ key, anchor: verse, start: verse, end: verse, open: false });
    pendingScroll.current = { key, verse };
  };

  const hideDistance = insets.top + HEADER_BODY_HEIGHT + 4;
  const header = useCollapsingHeader(hideDistance);
  const { reset: resetHeader } = header;
  const scrollRef = useRef<ComponentRef<typeof ScrollView>>(null);
  const scroller = useVerseScroller({
    scrollRef,
    toolsRefs,
    viewportHeight: windowHeight,
    headerBottom: insets.top + HEADER_BODY_HEIGHT + HEADER_GAP,
  });
  const { cancel: cancelScroll, scrollToVerse } = scroller;
  useEffect(() => {
    // A scroll to a verse of the chapter we are leaving must not happen.
    cancelScroll();
    scrollRef.current?.scrollTo({ y: 0, animated: false });
    resetHeader();
  }, [position.bookNumber, position.chapter, resetHeader, cancelScroll]);

  // Opening a passage in context: once the reader shows the target's chapter, select its verses (sheet closed),
  // bring the first into view and move focus to it. A target for another chapter waits; the caller has already
  // moved the reader, so it arrives when the chapter does, in either order. It also waits for the tab to show.
  const pendingTarget = usePendingReaderTarget();
  const target =
    pendingTarget && isShown && focused && pendingTarget.bookNumber === position.bookNumber && pendingTarget.chapter === position.chapter
      ? pendingTarget
      : null;
  // Adjusting state while rendering (as the selection above): the verses are selected in the very render that
  // shows the chapter. The guard stops it once the selection is the target's.
  if (target && !(range && !range.open && range.start === target.start && range.end === target.end)) {
    setSelection({ key: selectionKey, anchor: target.start, start: target.start, end: target.end, open: false });
  }
  useEffect(() => {
    if (!target) return;
    pendingScroll.current = { key: selectionKey, verse: target.start };
    focusSoon(toolsRefs.current.get(target.start));
    readerTargets.done(target);
  }, [target, selectionKey, focusSoon]);

  // Scrolls to a verse once its chapter is on screen: for the target above and for a reference on a word card
  // (which moves the chapter first). A request for a chapter that is not the current position is dropped, so
  // the newest chapter wins and a verse of a chapter that is no longer shown is never scrolled to. Runs after
  // every render (a ref check) because the request can be made at any moment.
  useEffect(() => {
    const p = pendingScroll.current;
    if (!p) return;
    if (p.key !== selectionKey) {
      pendingScroll.current = null;
      return;
    }
    if (!shownChapter || !focused) return;
    pendingScroll.current = null;
    scrollToVerse(p.key, p.verse, shownChapter.verses);
  });

  const onScroll = useCallback(
    (e: NativeSyntheticEvent<NativeScrollEvent>) => {
      header.onScroll(e);
      reading.onScroll(e);
    },
    [header, reading],
  );

  const swipeHandlers = useChapterSwipe(turn);
  // Keys move the reader only while its tab is showing and no sheet is open.
  useArrowKeys({ onNext: goNext, onPrev: goPrev, disabled: sheet !== null || verseSheetOpen || !focused });

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
          selectedVerse={range?.start ?? null}
          selectedEnd={range?.end}
          study={study}
          onVersePress={onVersePress}
          onVerseLongPress={onVerseLongPress}
          registerTools={registerTools}
          onSwap={swap}
          // Native only: the web finds the verse's element.
          onVerseLayout={Platform.OS === 'web' ? undefined : scroller.onLayout}
          layoutKey={selectionKey}
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
        onScroll={onScroll}
        scrollEventThrottle={16}
        keyboardShouldPersistTaps="handled"
        contentContainerStyle={[
          styles.content,
          {
            paddingTop: insets.top + HEADER_BODY_HEIGHT + HEADER_GAP,
            paddingBottom: TAB_BAR_ROOM + insets.bottom + sheetRoom,
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
      {verseSheetOpen && range && book && firstQuery.data ? (
        <VerseSheet
          book={book}
          chapter={firstQuery.data}
          translation={first}
          start={range.start}
          end={range.end}
          study={study}
          onClose={closeVerseSheet}
          onHeight={setSheetHeight}
          onGoTo={goToReference}
          covered={sheet !== null}
        />
      ) : null}
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
