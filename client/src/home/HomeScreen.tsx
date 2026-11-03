// The Home tab: greeting and streak, today's goal, continue reading, the verse of the day, today's Memory lesson
// and Surprise me. It reads progress, the reader's position and Memory through hooks over storage, so a change made
// in the reader or in Memory shows at once. It writes only through Surprise me (the position, via `setPosition`),
// the verse of the day (via `useOpenInReader`) and, as Memory's own home does, by opening today's Memory lesson.
import { router } from 'expo-router';
import { useCallback, useEffect, useMemo, useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { AuroraBackground } from '../aurora';
import { useI18n } from '../i18n/I18nProvider';
import type { DeviceLocale } from '../i18n/types';
import { TOTAL_CHAPTERS, dayKey, useReadingProgress } from '../progress';
import { splitAlternateReadings } from '../reader/alternateReadings';
import { bookNameForLocale, findBook, useBooks } from '../reader/books';
import { useReaderPosition } from '../reader/state';
import { readerTargets, useOpenInReader } from '../reader/target';
import { TRANSLATIONS } from '../reader/translations';
import { useChapter } from '../reader/useChapter';
import { readerPositionKey } from '../storage/keys';
import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import { formatReference, shareText } from '../study/share';
import { useScriptureFont } from '../study/components/scriptureFont';
import { useTheme } from '../theme/ThemeProvider';
import { GoalSheet } from './GoalSheet';
import { greetingKey } from './greeting';
import { ContinueCard, GoalCard, HomeHeader, MemoryCard, SurpriseRow, VerseCard, type VerseState } from './HomeCards';
import { lastVerseKey } from './homeKeys';
import { NEW_READER_START } from './newReader';
import { shareVerse } from './shareVerse';
import { pickSurpriseChapter } from './surprise';
import { MEMORY_WEEK_HREF, useHomeMemory } from './useHomeMemory';
import { useToday } from './useToday';
import { verseOfTheDay } from './verseOfTheDay';
import { VOTD_BOOK_NAMES } from './votdBookNames';

/** Room under the content for the tab bar, so the last card can scroll above it (as Study does). */
const TAB_BAR_ROOM = 120;

const defaultNow = () => new Date();
const goToBibleTab = () => router.navigate('/bible');
const pushRoute = (href: string) => router.push(href as never);

export function HomeScreen({
  storage: storageProp,
  locales,
  now = defaultNow,
  navigate = goToBibleTab,
  go = pushRoute,
  random = Math.random,
}: {
  storage?: Storage;
  locales?: readonly DeviceLocale[];
  now?: () => Date;
  navigate?: () => void;
  /** Opens a route: today's Memory lesson, or Memory's week. */
  go?: (href: string) => void;
  random?: () => number;
}) {
  const theme = useTheme();
  const { t, locale, formatDate, formatNumber } = useI18n();
  const insets = useSafeAreaInsets();
  const storage = useMemo(() => storageProp ?? getStorage(), [storageProp]);

  const today = useToday(now);
  const progress = useReadingProgress({ storage, now });
  const { position, setPosition } = useReaderPosition({ storage, locales });
  const open = useOpenInReader({ storage, navigate });
  const books = useBooks();

  const [goalOpen, setGoalOpen] = useState(false);
  const openGoal = useCallback(() => setGoalOpen(true), []);
  const closeGoal = useCallback(() => setGoalOpen(false), []);

  // Continue reading
  const translation = position.translation;
  const meta = TRANSLATIONS[translation];
  // No stored position: a brand-new reader, who is offered John 1 in the starting translation rather than "continue".
  const [storedPosition] = useStoredValue(storage, readerPositionKey);
  const fresh = storedPosition === null;
  const shownBook = fresh ? NEW_READER_START.bookNumber : position.bookNumber;
  const shownChapter = fresh ? NEW_READER_START.chapter : position.chapter;
  const readerBook = findBook(books.data, shownBook);
  const chapterTitle = readerBook
    ? t('reader.chapterTitle', { book: bookNameForLocale(readerBook, locale), chapter: shownChapter })
    : null;
  const continueRef = chapterTitle === null ? t('common.loading') : `${chapterTitle} · ${t(meta.shortKey)}`;
  // A brand-new reader's press sets that start as the position, so the Bible tab opens there.
  const continueReading = () => {
    if (storage.get(readerPositionKey) === null) setPosition({ ...NEW_READER_START, translation });
    navigate();
  };
  const continueCaps = t(fresh ? 'home.start' : 'home.continue');
  const continueLabel =
    chapterTitle === null
      ? continueCaps
      : t(fresh ? 'home.startLabel' : 'home.continueLabel', { ref: chapterTitle });

  // Verse of the day
  const todayKey = dayKey(today);
  const daily = verseOfTheDay(todayKey);
  const dailyBook = findBook(books.data, daily.bookNumber);
  const chapter = useChapter(dailyBook, daily.chapter, translation);
  const scripture = useScriptureFont(theme, translation);
  const [kept] = useStoredValue(storage, lastVerseKey);
  const fetched = chapter.data?.verses.find((v) => v.verse === daily.verse)?.text;
  // The verse kept from earlier today stands in when the chapter can't be had.
  const cached =
    kept &&
    kept.day === todayKey &&
    kept.translation === translation &&
    kept.bookNumber === daily.bookNumber &&
    kept.chapter === daily.chapter &&
    kept.verse === daily.verse
      ? kept.text
      : undefined;
  const rawText = fetched ?? cached;

  // Remember the verse that loaded, for the day and translation it is the verse of the day for.
  useEffect(() => {
    if (fetched === undefined || fetched.length === 0 || fetched.length > 2000) return;
    const next = { day: todayKey, translation, bookNumber: daily.bookNumber, chapter: daily.chapter, verse: daily.verse, text: fetched };
    const current = storage.get(lastVerseKey);
    if (
      current &&
      current.day === next.day &&
      current.translation === next.translation &&
      current.bookNumber === next.bookNumber &&
      current.chapter === next.chapter &&
      current.verse === next.verse &&
      current.text === next.text
    ) {
      return;
    }
    storage.set(lastVerseKey, next);
  }, [storage, fetched, todayKey, translation, daily.bookNumber, daily.chapter, daily.verse]);

  // The catalogue's name when it has arrived, else the built-in one, so a verse kept from earlier today shows at once.
  const fallbackNames = VOTD_BOOK_NAMES[daily.bookNumber];
  const bookName =
    daily.bookNumber === 19
      ? t('home.psalm')
      : dailyBook
        ? bookNameForLocale(dailyBook, locale)
        : fallbackNames
          ? locale === 'zh-Hans'
            ? fallbackNames.zhHans
            : fallbackNames.en
          : null;
  const verseRef = bookName === null ? null : formatReference(bookName, daily.chapter, [daily.verse]);
  // A refetch of a query that never had data goes back to "pending", so the error count is what remembers a failure.
  const failed = chapter.isError || chapter.errorUpdateCount > 0 || (chapter.isSuccess && fetched === undefined);
  let verse: VerseState;
  if (rawText !== undefined && verseRef) {
    verse = {
      kind: 'ready',
      text: splitAlternateReadings(rawText)
        .filter((run) => !run.note)
        .map((run) => run.text)
        .join(''),
      ref: verseRef,
      label: t('home.votdLabel', { ref: verseRef }),
      fontFamily: scripture.fontFamily,
      zh: scripture.zh,
    };
  } else if (failed) {
    verse = { kind: 'error', retrying: chapter.isFetching };
  } else {
    verse = { kind: 'loading' };
  }
  const openVerse = () =>
    open({ bookNumber: daily.bookNumber, chapter: daily.chapter, start: daily.verse, end: daily.verse });
  const share = () => {
    if (rawText === undefined || !verseRef) return;
    const message = shareText(
      [{ verse: daily.verse, text: rawText }],
      verseRef,
      t(meta.shortKey),
      scripture.zh ? 'zh' : 'en',
    );
    void shareVerse(message, t('sheet.copied'));
  };
  const retry = () => {
    void chapter.refetch();
  };

  // Surprise me
  const surprise = () => {
    if (!books.data) return;
    // The stored position: it may be newer than this render's.
    const stored = storage.get(readerPositionKey);
    const current = stored ? { bookNumber: stored.bookNumber, chapter: stored.chapter } : null;
    const pick = pickSurpriseChapter(books.data, new Set(Object.keys(progress.progress.chaptersRead)), current, random);
    if (!pick) return;
    readerTargets.clear(); // a stale target must never select verses in the new chapter
    setPosition({ ...pick, translation: stored?.translation ?? position.translation });
    navigate();
  };
  const explored = formatNumber(progress.exploredCount);
  const total = formatNumber(TOTAL_CHAPTERS);

  // Memory: today's lesson. Start and Continue open its next step; once it is done, Week opens the week.
  const memory = useHomeMemory(storage, now, locale);
  const lesson = memory.state;
  const memoryCaps = t('home.memory.label', { n: formatNumber(memory.learned), total: formatNumber(memory.total) });
  const memoryCard =
    lesson.kind === 'done'
      ? {
          sub: t('home.memory.done'),
          action: { text: t('home.memory.week'), primary: false },
          label: t('home.memory.weekLabel'),
          onPress: () => go(MEMORY_WEEK_HREF),
        }
      : {
          sub: t('home.memory.step', { n: formatNumber(lesson.step), total: formatNumber(lesson.total) }),
          action: { text: t(lesson.kind === 'start' ? 'memory.lesson.start' : 'memory.lesson.continue'), primary: true },
          label: t(lesson.kind === 'start' ? 'home.memory.startLabel' : 'home.memory.continueLabel', { ref: lesson.reference }),
          onPress: () => go(lesson.href),
        };

  return (
    <View testID="screen-home" style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      <ScrollView style={styles.fill} contentContainerStyle={[styles.content, { paddingTop: insets.top + 16, paddingBottom: TAB_BAR_ROOM }]}>
        <HomeHeader
          date={formatDate(today, { weekday: 'long', month: 'long', day: 'numeric' })}
          greeting={t(greetingKey(today))}
          streak={progress.streak}
          streakLabel={progress.streak >= 1 ? t('study.streakLabel', { n: progress.streak }) : t('home.streakStart')}
          streakDays={t('study.streakDays')}
          streakStart={t('home.streakStart')}
        />
        <GoalCard done={progress.goalProgressMinutes} goal={progress.goalMinutes} onPress={openGoal} />
        <ContinueCard caps={continueCaps} reference={continueRef} sub={t(meta.nameKey)} label={continueLabel} onPress={continueReading} />
        <VerseCard state={verse} onOpen={openVerse} onShare={share} onRetry={retry} />
        <MemoryCard caps={memoryCaps} reference={lesson.reference} {...memoryCard} />
        <SurpriseRow
          exploredText={t('home.explored', { n: explored, total })}
          exploredLabel={t('home.exploredLabel', { n: explored, total })}
          disabled={!books.data}
          onPress={surprise}
        />
      </ScrollView>
      {goalOpen ? <GoalSheet storage={storage} now={now} onClose={closeGoal} /> : null}
    </View>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { paddingHorizontal: 16, gap: 14 },
});
