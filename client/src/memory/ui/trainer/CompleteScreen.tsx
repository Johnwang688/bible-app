// The lesson's end (`/memory/complete`): while a step is still waiting, which one and a way to do it now; once every
// step is done, the streak (+1 today), the week, verses learned, the next reviews and the way back to Memory.
import { useEffect, useMemo, useRef, type ComponentRef } from 'react';
import { ScrollView, StyleSheet, Text, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { useColumn } from '../../../components/ContentColumn';
import { AuroraBackground, auroraTextShadow } from '../../../aurora';
import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import type { MessageKey } from '../../../i18n/messages/en';
import { programmaticFocus, useFocusNodeSoon } from '../../../reader/components/a11y';
import { getStorage, type Storage } from '../../../storage/storage';
import { useTheme } from '../../../theme/ThemeProvider';
import { dailyStreak, weekStrip } from '../../dailyLesson';
import { getMemoryVerse, TOTAL_VERSES } from '../../library';
import { toLocalDateString } from '../../localDate';
import { useMemoryHistory, useMemoryProgress } from '../../memoryStore';
import { stepHref } from '../../session';
import type { LibraryVerse, ProgressMap } from '../../types';
import { useMemorySettings } from '../../useMemorySettings';
import { useVerseLanguage, verseView } from '../../verseLanguage';
import { daysUntilDue, learnedCount } from '../../view';
import { useTodayLesson } from '../home/useTodayLesson';
import { MemoryIcon } from '../icons';
import { MemButton, MemCard, SectionLabel, type MemButtonKind } from '../parts';
import { WeekStrip } from '../WeekStrip';

const HOME = '/study/memory';
const PRIMARY: MemButtonKind = 'primary';
const SECONDARY: MemButtonKind = 'secondary';

const defaultNavigate = (href: string): void => {
  void import('expo-router').then(({ router }) => router.replace(href as never));
};

/** The name of a lesson step's trainer; a full recall on a verse already at review is a Review. */
function kindKey(stage: string, progress: ProgressMap, verseId: string): MessageKey {
  if (stage === 'chunk-order') return 'memory.kind.ordering';
  if (stage === 'fill-blank') return 'memory.kind.fillIn';
  return progress[verseId]?.stage === 'review' ? 'memory.kind.review' : 'memory.kind.recall';
}

export function CompleteScreen({
  storage: storageProp,
  now = () => new Date(),
  onNavigate = defaultNavigate,
}: {
  storage?: Storage;
  now?: () => Date;
  onNavigate?: (href: string) => void;
}) {
  const column = useColumn('lesson', 16);
  const theme = useTheme();
  const { t, locale } = useI18n();
  const insets = useSafeAreaInsets();
  const storage = useMemo(() => storageProp ?? getStorage(), [storageProp]);
  const lesson = useTodayLesson(storage, now);
  const [history] = useMemoryHistory(storage);
  const [progress] = useMemoryProgress(storage);
  const [settings] = useMemorySettings(storage);
  const heading = useRef<ComponentRef<typeof Text>>(null);
  const focusSoon = useFocusNodeSoon();
  useEffect(() => {
    focusSoon(heading.current);
  }, [focusSoon, lesson.allDone]);

  const language = useVerseLanguage();
  // The reference in the verse language; a Chinese verse in the English interface (only where the verse language is
  // pinned) keeps the English reference, as before.
  const referenceOf = (verse: LibraryVerse): string =>
    language === 'zh' && locale === 'en' ? verse.referenceEn : verseView(verse, language, settings.script).reference;
  const date = now();
  const today = toLocalDateString(date);
  const streak = dailyStreak(history.completedDates, today);
  const muted = { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') };
  const head = { color: theme.colors.text, fontFamily: uiFace(theme.type.head, theme.type.headWeight) };
  const body = { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') };
  // Text that sits straight on the aurora (not inside a card) carries the soft halo.
  const glow = auroraTextShadow(theme);
  const tint = { text: theme.canvas.c1t ?? theme.colors.text, muted: theme.canvas.c1m ?? theme.colors.muted };

  const title = (text: string) => (
    <Text
      ref={heading}
      testID={lesson.allDone ? 'memory-complete-title' : 'memory-one-left-title'}
      accessibilityRole="header"
      {...programmaticFocus}
      style={[head, { fontSize: theme.type.headSize, letterSpacing: theme.type.headLetterSpacing }, glow]}
    >
      {text}
    </Text>
  );

  const backButton = (kind: MemButtonKind) => (
    <MemButton testID="memory-back-to-memory" kind={kind} block label={t('memory.back')} onPress={() => onNavigate(HOME)} />
  );

  const secondaryBack = backButton(SECONDARY);
  const primaryBack = backButton(PRIMARY);

  let content;
  if (!lesson.allDone) {
    const waiting = lesson.lesson.steps.map((step, i) => ({ step, i })).filter(({ step }) => step.completedAt === null);
    content = (
      <>
        <View testID="memory-one-left" role="status" aria-live="polite" accessibilityLiveRegion="polite" style={styles.block}>
          {title(waiting.length === 1 ? t('memory.end.leftOne') : t('memory.end.leftMany', { n: waiting.length }))}
          <Text style={[muted, { fontSize: 15 }, glow]}>{t('memory.end.doneOf', { k: lesson.done, n: lesson.total })}</Text>
          {streak > 0 ? (
            <Text style={[body, { fontSize: 14, lineHeight: 20, fontFamily: uiFace(theme.type.ui, '700') }, glow]}>
              {t('memory.end.keepStreak', { n: streak })}
            </Text>
          ) : null}
          <MemCard style={styles.steps}>
            <SectionLabel>{t('memory.end.waiting')}</SectionLabel>
            {waiting.map(({ step }) => {
              const verse = getMemoryVerse(step.verseId);
              if (!verse) return null;
              return (
                <View key={`${step.verseId}/${step.stage}`} style={styles.step}>
                  <Text style={[head, { fontSize: 16, flexShrink: 1 }]}>{referenceOf(verse)}</Text>
                  <Text style={[muted, { fontSize: 13 }]}>{t(kindKey(step.stage, progress, step.verseId))}</Text>
                </View>
              );
            })}
          </MemCard>
        </View>
        <View style={styles.actions}>
          <MemButton
            testID="memory-do-now"
            kind="primary"
            block
            label={t('memory.end.doNow')}
            onPress={() => {
              const href = stepHref(lesson.items, lesson.firstIncomplete);
              if (href) onNavigate(href);
            }}
          />
          {secondaryBack}
        </View>
      </>
    );
  } else {
    // Every step is done, so today counts: it is in the streak and ticked in the week even before the history catches up.
    const run = Math.max(streak, 1);
    const week = weekStrip(history.completedDates, date, history.startedOn ?? today).map((d) =>
      d.date === today ? { ...d, state: 'done' as const } : d,
    );
    const learned = learnedCount(progress);
    const verseIds = [...new Set(lesson.items.map((i) => i.verseId))];
    const reviews = verseIds
      .map((id) => ({ verse: getMemoryVerse(id), days: daysUntilDue(progress[id]?.nextDueAt ?? null, date) }))
      .filter((r): r is { verse: LibraryVerse; days: number } => r.verse !== undefined && r.days !== null)
      .sort((a, b) => a.days - b.days)
      .map(({ verse, days }) => {
        const when = days === 0 ? t('memory.end.whenToday') : days === 1 ? t('memory.end.whenTomorrow') : t('memory.end.whenDays', { n: days });
        return `${referenceOf(verse)} ${when}`;
      });
    content = (
      <>
        <View testID="memory-complete" role="status" aria-live="polite" accessibilityLiveRegion="polite" style={styles.block}>
          {title(t('memory.end.title'))}
          <Text style={[muted, { fontSize: 15 }, glow]}>{t('memory.end.sub', { n: lesson.total })}</Text>
        </View>
        <MemCard background={theme.canvas.c1 === undefined ? undefined : { backgroundColor: theme.canvas.c1 }} style={styles.streakCard}>
          <View style={styles.streakRow}>
            <MemoryIcon name="flame" color={tint.text} size={36} strokeWidth={1.9} />
            <Text style={[head, { color: tint.text, fontSize: 52, lineHeight: 56, letterSpacing: -1 }]}>{run}</Text>
            <Text style={{ color: tint.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15, flexShrink: 1 }}>{t('memory.streak.unit')}</Text>
            <View style={[styles.plus, { backgroundColor: theme.canvas.bar ?? theme.colors.cta }]}>
              <Text style={{ color: theme.colors.onAccent, fontFamily: uiFace(theme.type.ui, '800'), fontSize: 14 }}>{t('memory.end.plusOne')}</Text>
            </View>
          </View>
          <WeekStrip days={week} size="large" labels today={today} />
        </MemCard>
        <MemCard>
          <View style={styles.learnedRow}>
            <Text accessibilityRole="header" style={[head, { fontSize: 17 }]}>
              {t('memory.end.learned')}
            </Text>
            <Text testID="memory-complete-learned" style={[muted, { fontSize: 14 }]}>
              {t('memory.end.learnedOf', { n: learned, total: TOTAL_VERSES })}
            </Text>
          </View>
          <View
            accessibilityRole="progressbar"
            accessibilityLabel={t('memory.end.learned')}
            accessibilityValue={{ min: 0, max: TOTAL_VERSES, now: learned }}
            style={[styles.track, { backgroundColor: theme.colors.track }]}
          >
            <View style={[styles.bar, { width: `${Math.round((100 * learned) / TOTAL_VERSES)}%`, backgroundColor: theme.canvas.bar ?? theme.colors.cta }]} />
          </View>
        </MemCard>
        <MemCard style={styles.coming}>
          <Text accessibilityRole="header" style={[head, { fontSize: 17 }]}>
            {t('memory.end.comingUp')}
          </Text>
          {reviews.length > 0 ? (
            <Text testID="memory-next-reviews" style={[body, { fontSize: 14, lineHeight: 21 }]}>
              {t('memory.end.nextReview', { list: reviews.join(' · ') })}
            </Text>
          ) : null}
          <Text style={[muted, { fontSize: 14, lineHeight: 21 }]}>{t('memory.end.tomorrow')}</Text>
        </MemCard>
        <View style={styles.actions}>{primaryBack}</View>
      </>
    );
  }

  return (
    <View testID="memory-end" style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      <ScrollView
        style={styles.fill}
        contentContainerStyle={[styles.content, column, { paddingTop: insets.top + 24, paddingBottom: Math.max(insets.bottom, 12) + 24 }]}
      >
        {content}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { paddingHorizontal: 16, gap: 14 },
  block: { gap: 6 },
  steps: { gap: 8, marginTop: 8 },
  step: { minHeight: 36, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 10 },
  actions: { gap: 10, alignItems: 'stretch', paddingTop: 6 },
  streakCard: { gap: 16, paddingVertical: 18 },
  streakRow: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'center', gap: 12 },
  plus: { marginLeft: 'auto', paddingHorizontal: 12, paddingVertical: 6, borderRadius: 999 },
  learnedRow: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'baseline', gap: 8 },
  track: { height: 8, borderRadius: 999, overflow: 'hidden' },
  bar: { height: '100%', borderRadius: 999 },
  coming: { gap: 6 },
});
