// The Home tab: greeting and streak, today's goal, continue reading, the verse of the day and Surprise me.
// It reads progress and the reader's position through hooks over storage, so a change made in the reader shows
// at once. It writes only through Surprise me (the position, via `setPosition`) and the verse of the day (via
// `useOpenInReader`).
import { router } from 'expo-router';
import { useCallback, useMemo } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

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
import { getStorage, type Storage } from '../storage/storage';
import { formatReference, shareText } from '../study/share';
import { useScriptureFont } from '../study/components/scriptureFont';
import { useTheme } from '../theme/ThemeProvider';
import { greetingKey } from './greeting';
import { ContinueCard, GoalCard, HomeHeader, SurpriseCard, VerseCard, type VerseState } from './HomeCards';
import { shareVerse } from './shareVerse';
import { pickSurpriseChapter } from './surprise';
import { verseOfTheDay } from './verseOfTheDay';

/** Room under the content for the tab bar, so the last card can scroll above it (as Study does). */
const TAB_BAR_ROOM = 120;

const defaultNow = () => new Date();
const goToBibleTab = () => router.navigate('/bible');

export function HomeScreen({
  storage: storageProp,
  locales,
  now = defaultNow,
  navigate = goToBibleTab,
  random = Math.random,
}: {
  storage?: Storage;
  locales?: readonly DeviceLocale[];
  now?: () => Date;
  navigate?: () => void;
  random?: () => number;
}) {
  const theme = useTheme();
  const { t, locale, formatDate, formatNumber } = useI18n();
  const insets = useSafeAreaInsets();
  const storage = useMemo(() => storageProp ?? getStorage(), [storageProp]);

  const today = now();
  const progress = useReadingProgress({ storage, now });
  const { position, setPosition } = useReaderPosition({ storage, locales });
  const open = useOpenInReader({ storage, navigate });
  const books = useBooks();

  // The daily-goal sheet arrives with the next card; the goal card calls this when pressed.
  const openGoal = useCallback(() => undefined, []);

  // Continue reading
  const translation = position.translation;
  const meta = TRANSLATIONS[translation];
  const readerBook = findBook(books.data, position.bookNumber);
  const chapterTitle = readerBook
    ? t('reader.chapterTitle', { book: bookNameForLocale(readerBook, locale), chapter: position.chapter })
    : null;
  const continueRef = chapterTitle === null ? t('common.loading') : `${chapterTitle} · ${t(meta.shortKey)}`;
  const continueLabel = chapterTitle === null ? t('home.continue') : t('home.continueLabel', { ref: chapterTitle });

  // Verse of the day
  const daily = verseOfTheDay(dayKey(today));
  const dailyBook = findBook(books.data, daily.bookNumber);
  const chapter = useChapter(dailyBook, daily.chapter, translation);
  const scripture = useScriptureFont(theme, translation);
  const rawVerse = chapter.data?.verses.find((v) => v.verse === daily.verse);
  const verseRef = dailyBook ? formatReference(bookNameForLocale(dailyBook, locale), daily.chapter, [daily.verse]) : null;
  let verse: VerseState;
  if (chapter.isError || (chapter.isSuccess && !rawVerse)) {
    verse = { kind: 'none' };
  } else if (rawVerse && verseRef) {
    verse = {
      kind: 'ready',
      text: splitAlternateReadings(rawVerse.text)
        .filter((run) => !run.note)
        .map((run) => run.text)
        .join(''),
      ref: verseRef,
      label: t('home.votdLabel', { ref: verseRef }),
      fontFamily: scripture.fontFamily,
      zh: scripture.zh,
    };
  } else {
    verse = { kind: 'loading' };
  }
  const openVerse = () =>
    open({ bookNumber: daily.bookNumber, chapter: daily.chapter, start: daily.verse, end: daily.verse });
  const share = () => {
    if (!rawVerse || !verseRef) return;
    const message = shareText(
      [{ verse: daily.verse, text: rawVerse.text }],
      verseRef,
      t(meta.shortKey),
      scripture.zh ? 'zh' : 'en',
    );
    void shareVerse(message, t('sheet.copied'));
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

  return (
    <View testID="screen-home" style={[styles.fill, theme.backgrounds.app]}>
      <ScrollView style={styles.fill} contentContainerStyle={[styles.content, { paddingTop: insets.top + 16, paddingBottom: TAB_BAR_ROOM }]}>
        <HomeHeader
          date={formatDate(today, { weekday: 'long', month: 'long', day: 'numeric' })}
          greeting={t(greetingKey(today))}
          streak={progress.streak}
          streakLabel={t('study.streakLabel', { n: progress.streak })}
          streakDays={t('study.streakDays')}
        />
        <GoalCard done={progress.goalProgressMinutes} goal={progress.goalMinutes} onPress={openGoal} />
        <ContinueCard reference={continueRef} sub={t(meta.nameKey)} label={continueLabel} onPress={navigate} />
        <VerseCard state={verse} onOpen={openVerse} onShare={share} />
        <SurpriseCard
          exploredText={t('home.explored', { n: explored, total })}
          exploredLabel={t('home.exploredLabel', { n: explored, total })}
          disabled={!books.data}
          onPress={surprise}
        />
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { paddingHorizontal: 20, gap: 14 },
});
