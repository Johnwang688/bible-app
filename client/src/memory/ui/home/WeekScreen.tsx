// The week: the streak, this week large, the last four weeks, the key. Pushed from Memory home's streak chip inside
// the Study tab's stack (so the tab bar stays), with its own address. `onNavigate` is only for the lesson link.
import { router } from 'expo-router';
import { useMemo } from 'react';
import { ScrollView, StyleSheet, Text, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { AuroraBackground, auroraTextShadow } from '../../../aurora';
import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import type { MessageKey } from '../../../i18n/messages/en';
import { getStorage, type Storage } from '../../../storage/storage';
import { useTheme } from '../../../theme/ThemeProvider';
import { dailyStreak, weekStrip, type WeekDayState } from '../../dailyLesson';
import { toLocalDateString } from '../../localDate';
import { useMemoryHistory } from '../../memoryStore';
import { bestStreak, pastWeeks } from '../../view';
import { MemoryIcon } from '../icons';
import { MemButton, MemCard, StatusLabel } from '../parts';
import { DayDot, DOT, WeekStrip } from '../WeekStrip';
import { useTodayLesson } from './useTodayLesson';

const TAB_BAR_ROOM = 120;
const PAST_WEEKS = 4;
const KEY: WeekDayState[] = ['done', 'missed', 'today', 'future', 'before-start'];

function localDate(date: string): Date {
  const [y = 0, m = 1, d = 1] = date.split('-').map(Number);
  return new Date(y, m - 1, d);
}

export function WeekScreen({
  storage: storageProp,
  now = () => new Date(),
  onNavigate,
}: {
  storage?: Storage;
  now?: () => Date;
  onNavigate?: (href: string) => void;
}) {
  const theme = useTheme();
  const { t, formatDate } = useI18n();
  const insets = useSafeAreaInsets();
  const storage = useMemo(() => storageProp ?? getStorage(), [storageProp]);
  const go = onNavigate ?? ((href: string) => router.push(href));
  const [history] = useMemoryHistory(storage);
  const lesson = useTodayLesson(storage, now);

  const date = lesson.date;
  const today = toLocalDateString(date);
  const streak = dailyStreak(history.completedDates, today);
  const best = Math.max(bestStreak(history.completedDates), streak);
  // A reader who has not started has nothing to miss: the days before today are "before you started".
  const week = weekStrip(history.completedDates, date, history.startedOn ?? today);
  const past = pastWeeks(history, date, PAST_WEEKS);
  const beforeStart = week.some((d) => d.state === 'before-start');
  const tint = { text: theme.canvas.c1t ?? theme.colors.text, muted: theme.canvas.c1m ?? theme.colors.muted };

  const back = () => {
    if (router.canGoBack()) router.back();
    else router.replace('/study/memory');
  };

  return (
    <View testID="memory-week" style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      <ScrollView
        style={styles.fill}
        contentContainerStyle={[styles.content, { paddingTop: insets.top + 16, paddingBottom: TAB_BAR_ROOM }]}
      >
        <View style={styles.backRow}>
          <MemButton
            testID="memory-week-back"
            kind="secondary"
            icon="back"
            label={t('memory.week.back')}
            accessibilityLabel={t('memory.week.backAria')}
            onPress={back}
          />
        </View>
        <Text
          accessibilityRole="header"
          style={{
            color: theme.colors.text,
            fontFamily: uiFace(theme.type.head, theme.type.headWeight),
            fontSize: theme.type.headSize,
            letterSpacing: theme.type.headLetterSpacing,
            ...auroraTextShadow(theme),
          }}
        >
          {t('memory.week.screenTitle')}
        </Text>

        <MemCard background={theme.canvas.c1 === undefined ? undefined : { backgroundColor: theme.canvas.c1 }} style={styles.streakCard}>
          <View style={styles.streakTop}>
            <MemoryIcon name="flame" color={tint.text} size={30} strokeWidth={1.9} />
            <Text
              testID="memory-week-streak"
              style={{ color: tint.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 44, lineHeight: 48 }}
            >
              {streak}
            </Text>
            <Text style={{ color: tint.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15, flexShrink: 1 }}>
              {t('memory.streak.unit')}
            </Text>
            <Text
              testID="memory-week-best"
              style={{ marginLeft: 'auto', color: tint.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}
            >
              {t('memory.week.best', { n: best })}
            </Text>
          </View>
          <WeekStrip days={week} size="large" labels today={today} />
          {beforeStart ? (
            <Text style={{ color: tint.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
              {t('memory.week.firstWeek')}
            </Text>
          ) : null}
          {streak < best && best >= 2 ? (
            <Text
              testID="memory-week-restart"
              style={{ color: tint.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14, lineHeight: 20 }}
            >
              {t('memory.week.restart', { n: best })}
            </Text>
          ) : null}
        </MemCard>

        {lesson.allDone ? (
          <View style={styles.doneRow}>
            <StatusLabel testID="memory-week-done" text={t('memory.week.done')} />
          </View>
        ) : (
          <MemButton
            testID="memory-week-today"
            kind="primary"
            block
            label={t('memory.week.doToday')}
            onPress={() => {
              if (lesson.href !== null) go(lesson.href);
            }}
          />
        )}

        <MemCard style={styles.pastCard}>
          <Text
            accessibilityRole="header"
            style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 17, marginBottom: 4 }}
          >
            {t('memory.week.last4')}
          </Text>
          {past.map((w, i) => {
            const count = w.days.filter((d) => d.state === 'done').length;
            const none = w.days.every((d) => d.state === 'before-start');
            const start = formatDate(localDate(w.start), { month: 'short', day: 'numeric' });
            return (
              <View
                key={w.start}
                testID={`memory-week-row-${i}`}
                accessible
                accessibilityLabel={t('memory.week.rowAria', { date: start, n: count })}
                style={styles.pastRow}
              >
                <Text style={[styles.pastDate, { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }]}>{start}</Text>
                <View style={styles.pastDots}>
                  <WeekStrip days={w.days} size="small" />
                </View>
                <Text style={[styles.pastCount, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }]}>
                  {none ? '' : count}
                </Text>
              </View>
            );
          })}
        </MemCard>

        <MemCard style={styles.keyCard}>
          <View accessibilityRole="list" accessibilityLabel={t('memory.week.key')} style={styles.keyGrid}>
            {KEY.map((state) => (
              <View key={state} style={styles.keyItem}>
                <DayDot state={state} size={DOT.small} />
                <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, flexShrink: 1 }}>
                  {t(`memory.key.${state}` as MessageKey)}
                </Text>
              </View>
            ))}
          </View>
        </MemCard>
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { paddingHorizontal: 16, gap: 14 },
  backRow: { alignItems: 'flex-start' },
  streakCard: { gap: 16 },
  streakTop: { flexDirection: 'row', alignItems: 'center', gap: 10 },
  doneRow: { alignItems: 'center', justifyContent: 'center', minHeight: 48 },
  pastCard: { gap: 4, paddingVertical: 14 },
  pastRow: { flexDirection: 'row', alignItems: 'center', gap: 10, minHeight: 36 },
  pastDate: { width: 72, fontSize: 13, flexShrink: 1 },
  pastDots: { flex: 1 },
  pastCount: { width: 28, textAlign: 'right', fontSize: 13 },
  keyCard: { paddingVertical: 12 },
  keyGrid: { flexDirection: 'row', flexWrap: 'wrap', columnGap: 12, rowGap: 2 },
  keyItem: { width: '47%', flexDirection: 'row', alignItems: 'center', gap: 10, minHeight: 32 },
});
