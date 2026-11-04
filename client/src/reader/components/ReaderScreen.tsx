// The Bible tab. The shown chapter is always the query for the current position (no copy of it
// is kept in state), so a late response for another chapter can never appear.
import { useCallback, useEffect, useLayoutEffect, useMemo, useRef, useState, type ComponentRef } from 'react';
import {
  ActivityIndicator,
  Platform,
  Pressable,
  ScrollView,
  StyleSheet,
  Text,
  useWindowDimensions,
  View,
  type LayoutChangeEvent,
  type NativeScrollEvent,
  type NativeSyntheticEvent,
} from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { readAloudChapter, readAloudKey, useReadAloud, chunkForSpeech, maxPieceLength, speakableText, speechLanguageFor, type SpeechEngine } from '../../readAloud';
import { ReadAloudBar } from '../../readAloud/components/ReadAloudBar';
import { ChapterToolsSheet } from '../../readAloud/components/ChapterToolsSheet';
import { VoiceSpeedSheet } from '../../readAloud/components/VoiceSpeedSheet';
import { NoVoiceSheet } from '../../readAloud/components/NoVoiceSheet';
import { useReduceMotion } from './useReduceMotion';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import type { ChapterInfo } from '../../progress';
import type { ReaderPosition, ReadingSettings } from '../../storage/keys';
import { getStorage, type Storage } from '../../storage/storage';
import { useStudyItems } from '../../study';
import { useTheme } from '../../theme/ThemeProvider';
import { bookName, findBook, useBooks } from '../books';
import { clampPosition, nextPosition, prevPosition } from '../navigation';
import { useReaderPosition, useReadingSettings } from '../state';
import { readerTargets, usePendingReaderTarget } from '../target';
import { TRANSLATIONS, type TranslationId } from '../translations';
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

type Sheet = 'book' | 'version' | 'settings' | 'tools' | 'voice';

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
  speechEngine?: SpeechEngine;
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
  const next = useMemo(() => nextPosition(books.data, position), [books.data, position]);
  const chapter = useMemo(() => {
    const data = firstQuery.data;
    return readAloudChapter(position, [first], { [first]: data && data.book_number === position.bookNumber && data.chapter === position.chapter ? data : undefined }, next);
  }, [position, first, firstQuery.data, next]);
  const read = useReadAloud({ chapter, active: focused, engine: props.speechEngine, storage });
  const readRef = useRef(read);
  useLayoutEffect(() => { readRef.current = read; }, [read]);
  const [noVoiceOpen, setNoVoiceOpen] = useState(false);
  if (!noVoiceOpen && read.status === 'no-voice') setNoVoiceOpen(true);
  if (noVoiceOpen && read.status !== 'preparing' && read.status !== 'no-voice') setNoVoiceOpen(false);
  const noVoiceVisible = noVoiceOpen || read.status === 'no-voice';
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
      if (readRef.current.status === 'ended') readRef.current.stop();
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
  const toolsButtonRef = useRef<ComponentRef<typeof View>>(null);
  const toggleRef = useRef<ComponentRef<typeof View>>(null);
  const speedRef = useRef<ComponentRef<typeof View>>(null);
  const [focusToggleRequest, setFocusToggleRequest] = useState(0);
  const [fromVerse, setFromVerse] = useState(1);
  const [barHeight, setBarHeight] = useState(0);
  const followDeadline = useRef(0);
  const scrollY = useRef(0);
  const reduceMotion = useReduceMotion();
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
  const { reset: resetHeader, show: showHeader } = header;
  // Coming back to the reader tab: the header is back too (it may have been scrolled away before leaving).
  useEffect(() => {
    if (focused) showHeader();
  }, [focused, showHeader]);
  const scrollRef = useRef<ComponentRef<typeof ScrollView>>(null);
  const scroller = useVerseScroller({
    scrollRef,
    toolsRefs,
    viewportHeight: windowHeight,
    headerBottom: insets.top + HEADER_BODY_HEIGHT + HEADER_GAP,
    // Native: the chapter view lays verses out in rows when it reads in parallel, else as one paragraph. Only
    // measurements of the layout on screen place a verse.
    layout: secondId ? 'rows' : 'text',
    shownKey: selectionKey,
  });
  const { cancel: cancelScroll, scrollToVerse, retry: retryScroll, release: releaseScroll } = scroller;
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
      scrollY.current = e.nativeEvent.contentOffset.y;
      if (Date.now() < followDeadline.current) header.syncScroll(e);
      else header.onScroll(e);
      reading.onScroll(e);
    },
    [header, reading],
  );
  // The scroll view's size and its content's: reading time uses both, and a scroll to a verse that is waiting for
  // the page to be measurable (a hidden tab) tries again.
  const onScrollLayout = useCallback(
    (e: LayoutChangeEvent) => {
      reading.onLayout(e);
      retryScroll();
    },
    [reading, retryScroll],
  );
  const onContentSizeChange = useCallback(
    (w: number, h: number) => {
      reading.onContentSizeChange(w, h);
      retryScroll();
    },
    [reading, retryScroll],
  );
  // The room under the chapter (see the scroll view's padding below).
  const barVisible = !verseSheetOpen && !['idle', 'no-voice'].includes(read.status);
  const bottomRoom = TAB_BAR_ROOM + insets.bottom + sheetRoom + (barVisible ? barHeight + 16 : 0);

  // The chapter's end marker (below) is the only measure of its content's height: its place plus the room below.
  // What is on screen now, for its reports (a layout effect, so it is current before any report runs), and the
  // marker's last place for that chapter. When the room below changes (the verse sheet opens or closes) the
  // marker does not move and reports nothing, so its height is reported again from its last place.
  const endLive = useRef<{ info: ChapterInfo | null; key: string; room: number }>({ info: shownInfo, key: selectionKey, room: bottomRoom });
  const endPlace = useRef<{ info: ChapterInfo; key: string; y: number } | null>(null);
  useLayoutEffect(() => {
    endLive.current = { info: shownInfo, key: selectionKey, room: bottomRoom };
    const end = endPlace.current;
    if (shownInfo && end && end.info === shownInfo && end.key === selectionKey) {
      reading.onChapterLayout(shownInfo, end.y + bottomRoom);
    }
  }, [shownInfo, selectionKey, bottomRoom, reading]);
  const onChapterEnd = useCallback(
    (info: ChapterInfo, key: string, e: LayoutChangeEvent) => {
      const y = e.nativeEvent.layout.y;
      const shown = endLive.current;
      // A marker rendered for another chapter (kept from an earlier render) says nothing about this one.
      if (shown.info === info && shown.key === key) endPlace.current = { info, key, y };
      reading.onChapterLayout(info, y + shown.room);
    },
    [reading],
  );

  const handScroll = useCallback(() => {
    followDeadline.current = 0;
    readRef.current.userScrolled();
    releaseScroll();
  }, [releaseScroll]);
  useEffect(() => {
    if (Platform.OS !== 'web') return;
    const node = (scrollRef.current as unknown as { getScrollableNode?(): HTMLElement } | null)?.getScrollableNode?.();
    if (!node) return;
    const mouse = (event: MouseEvent) => { if (event.target === node) handScroll(); };
    node.addEventListener('wheel', handScroll, { passive: true });
    node.addEventListener('touchmove', handScroll, { passive: true });
    node.addEventListener('mousedown', mouse);
    return () => {
      node.removeEventListener('wheel', handScroll);
      node.removeEventListener('touchmove', handScroll);
      node.removeEventListener('mousedown', mouse);
    };
  }, [handScroll]);
  useEffect(() => {
    if (!read.following || !chapter || read.chapterKey !== chapter.key || verseSheetOpen) return;
    const verse = read.status === 'ended' ? chapter.verses[chapter.verses.length - 1]?.verse : read.status === 'playing' || read.status === 'paused' ? read.verse : null;
    if (verse == null) return;
    followDeadline.current = Date.now() + 700;
    scrollToVerse(chapter.key, verse, chapter.verses, { animated: !reduceMotion });
  }, [read.following, read.status, read.verse, read.chapterKey, chapter, verseSheetOpen, scrollToVerse, reduceMotion, barHeight]);
  useEffect(() => {
    if (read.status === 'advancing' && next && read.chapterKey === readAloudKey(position.bookNumber, position.chapter, first)) {
      moveTo({ ...next, translation: first });
    }
  }, [read.status, read.chapterKey, next, position.bookNumber, position.chapter, first, moveTo]);
  const openTools = () => {
    const visibleTop = insets.top + (header.hidden ? 0 : HEADER_BODY_HEIGHT);
    setFromVerse(scroller.firstVisibleVerse(selectionKey, chapter?.verses ?? [], scrollY.current, visibleTop) ?? 1);
    setSheet('tools');
  };
  const closeReadSheet = () => {
    const opener = sheet === 'voice' ? speedRef.current : toolsButtonRef.current;
    setSheet(null);
    focusSoon(opener);
  };
  const stopRead = () => {
    read.stop();
    setNoVoiceOpen(false);
    header.show();
    focusSoon(toolsButtonRef.current);
  };
  const startRead = () => {
    read.start(fromVerse);
    setSheet(null);
    setFocusToggleRequest((n) => n + 1);
  };
  const translationName = t(TRANSLATIONS[first].shortKey);
  const chapterTitle = book ? t('reader.chapterTitle', { book: bookName(book, first), chapter: position.chapter }) : '';
  const endTitle = book ? t('readAloud.end.title', { book: bookName(book, first), chapter: position.chapter }) : '';
  const nextBook = next ? findBook(books.data, next.bookNumber) : undefined;
  const nextTitle = next && nextBook ? t('reader.chapterTitle', { book: bookName(nextBook, first), chapter: next.chapter }) : null;
  const sampleText = chapter ? chunkForSpeech(speakableText(chapter.verses[0]?.text ?? ''), maxPieceLength(speechLanguageFor(first).group, read.rate))[0] ?? '' : '';

  const swipeHandlers = useChapterSwipe(turn);
  // Keys move the reader only while its tab is showing and no sheet is open.
  useArrowKeys({ onNext: goNext, onPrev: goPrev, disabled: sheet !== null || noVoiceVisible || verseSheetOpen || !focused });

  const wide = width >= WIDE_BREAKPOINT;
  const horizontal = wide && secondId ? WIDE_PADDING : NARROW_PADDING;
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
          readingVerse={read.status === 'playing' || read.status === 'paused' ? read.verse : null}
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
        {/* The end of the chapter, for reading time: keyed by the chapter, so it reports its place whenever a
            chapter has laid out, even one whose content is the same size as the last (no content-size event
            comes then). Its report names the chapter it was rendered for; its place plus the room below is the
            content's height for that chapter, and nothing else establishes one. */}
        {shownInfo ? (
          <View
            key={selectionKey}
            testID="reader-chapter-end"
            style={styles.chapterEnd}
            accessible={false}
            pointerEvents="none"
            onLayout={(e) => onChapterEnd(shownInfo, selectionKey, e)}
          />
        ) : null}
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
        onScrollBeginDrag={handScroll}
        onLayout={onScrollLayout}
        onContentSizeChange={onContentSizeChange}
        scrollEventThrottle={16}
        keyboardShouldPersistTaps="handled"
        contentContainerStyle={[
          styles.content,
          {
            paddingTop: insets.top + HEADER_BODY_HEIGHT + HEADER_GAP,
            paddingBottom: bottomRoom,
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
        onOpenTools={openTools}
        toolsButtonRef={toolsButtonRef}
        onOpenBook={() => setSheet('book')}
        onOpenVersions={() => setSheet('version')}
        onOpenSettings={() => setSheet('settings')}
      />

      <ReadAloudBar read={read} translation={translationName} endTitle={endTitle} nextTitle={nextTitle} hidden={verseSheetOpen}
        insets={insets} onStop={stopRead} onOpenVoice={() => setSheet('voice')}
        onBack={() => { read.backToVerse(); setFocusToggleRequest((n) => n + 1); }} onHeight={setBarHeight}
        toggleRef={toggleRef} speedRef={speedRef} focusToggleRequest={focusToggleRequest} />
      {sheet === 'tools' ? <ChapterToolsSheet title={chapterTitle} translation={translationName} fromVerse={fromVerse} ready={!!chapter} onStart={startRead} onClose={closeReadSheet} /> : null}
      {sheet === 'voice' ? <VoiceSpeedSheet read={read} translation={translationName} sampleText={sampleText} onClose={closeReadSheet} /> : null}
      {noVoiceVisible ? <NoVoiceSheet read={read} translation={translationName} fromVerse={fromVerse} onClose={stopRead} /> : null}
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
  // No height, the full width: the web's layout reports need a size that is not 0 × 0.
  chapterEnd: { alignSelf: 'stretch', height: 0 },
});
