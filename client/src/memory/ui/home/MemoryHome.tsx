// Memory home (inside the Study tab's stack): today's lesson, the week, and the 60-verse library. Takes `onNavigate`
// instead of importing the router, so a test can watch where it goes. Colours, radii, borders and fonts are the theme's.
import { router } from 'expo-router';
import { memo, useEffect, useMemo, useState } from 'react';
import { Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { AuroraBackground, auroraTextShadow } from '../../../aurora';
import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import type { MessageKey } from '../../../i18n/messages/en';
import { SheetModal } from '../../../reader/components/SheetModal';
import { buttonStyle } from '../../../reader/components/ui';
import { getStorage, type Storage } from '../../../storage/storage';
import { useTheme } from '../../../theme/ThemeProvider';
import { dailyStreak, weekStrip } from '../../dailyLesson';
import { getAllMemoryVerses, getMemoryVerse, TOTAL_VERSES } from '../../library';
import { toLocalDateString } from '../../localDate';
import { useMemoryHistory, useMemoryProgress } from '../../memoryStore';
import { stageToSlug } from '../../stages';
import type { ChineseScript, LibraryVerse, ProgressMap } from '../../types';
import { useMemorySettings } from '../../useMemorySettings';
import { useVerseLanguage, verseView, type VerseLanguage } from '../../verseLanguage';
import { daysUntilDue, learnedCount as learnedVerses, libraryGroups, stageView, type StageName } from '../../view';
import { MemoryIcon } from '../icons';
import { MemorySettingsSheet } from '../MemorySettingsSheet';
import { MemButton, MemCard, SectionLabel, StatusLabel } from '../parts';
import { takeProgressSaved } from '../savedToast';
import { ScriptureNotice } from '../ScriptureNotice';
import { StageMark } from '../StageMark';
import { useVerseFont } from '../useVerseFont';
import { WeekStrip } from '../WeekStrip';
import { useTodayLesson } from './useTodayLesson';

/** Room under the content for the tab bar, so the last row can scroll above it (as Study does). */
const TAB_BAR_ROOM = 120;
/** How long the "Progress saved" status stays. */
const SAVED_MS = 4000;
const PREVIEW_CHARS = 10;
const DATE_LINE: Intl.DateTimeFormatOptions = { weekday: 'long', month: 'long', day: 'numeric' };
/** Stands in for the count while "{count} learned" is split around it. */
const LEARNED_MARK = '@@';

/**
 * A Chinese verse in the English interface (only where the verse language is pinned, as in the older tests) also
 * shows its English reference, as Memory did before English verses.
 */
const pairedEnglish = (language: VerseLanguage, locale: string): boolean => language === 'zh' && locale === 'en';

/** The name of a lesson step's trainer; a full recall on a verse already at review is a Review. */
function stepKindKey(stage: string, progress: ProgressMap, verseId: string): MessageKey {
  if (stage === 'chunk-order') return 'memory.kind.ordering';
  if (stage === 'fill-blank') return 'memory.kind.fillIn';
  return progress[verseId]?.stage === 'review' ? 'memory.kind.review' : 'memory.kind.recall';
}

const LessonCard = memo(function LessonCard({
  first,
  progress,
  script,
  language,
  onStart,
  lessonState,
}: {
  first: boolean;
  progress: ProgressMap;
  script: ChineseScript;
  language: VerseLanguage;
  onStart(href: string): void;
  lessonState: ReturnType<typeof useTodayLesson>;
}) {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const { lesson, done, total, firstIncomplete, allDone, href } = lessonState;
  const tint = { text: theme.canvas.c1t ?? theme.colors.text, muted: theme.canvas.c1m ?? theme.colors.muted };
  const fill = theme.canvas.bar ?? theme.colors.cta;
  const label = t(first ? 'memory.lesson.first' : 'memory.lesson.today');
  // One step left that is not the next in order: an earlier step was skipped.
  const skipped = total - done === 1 && firstIncomplete >= 0 && firstIncomplete < total - 1;

  const next = firstIncomplete >= 0 ? lesson.steps[firstIncomplete] : undefined;
  const verse = next ? getMemoryVerse(next.verseId) : undefined;
  const kind = next ? t(stepKindKey(next.stage, progress, next.verseId)) : '';
  const zhRef = verse ? verseView(verse, language, script).reference : '';
  const paired = pairedEnglish(language, locale);
  const subline = verse && paired ? `${verse.referenceEn} · ${kind}` : kind;
  const meta = skipped
    ? t('memory.lesson.oneLeft')
    : done === 0
      ? t('memory.lesson.steps', { n: total })
      : t('memory.lesson.stepsDone', { k: done, n: total });
  const action = t(done === 0 ? 'memory.lesson.start' : 'memory.lesson.continue');

  return (
    <MemCard
      testID="memory-lesson-card"
      background={theme.canvas.c1 === undefined ? undefined : { backgroundColor: theme.canvas.c1 }}
    >
      <View style={styles.spread}>
        <Text
          accessibilityRole="header"
          style={{
            color: tint.muted,
            fontFamily: uiFace(theme.type.ui, '700'),
            fontSize: 12,
            letterSpacing: 0.6,
            textTransform: 'uppercase',
            flexShrink: 1,
          }}
        >
          {label}
        </Text>
        <Text
          style={{
            color: skipped ? tint.text : tint.muted,
            fontFamily: uiFace(theme.type.ui, skipped ? '700' : '400'),
            fontSize: skipped ? 14 : 13,
          }}
        >
          {meta}
        </Text>
      </View>
      <View
        accessibilityRole="progressbar"
        accessibilityLabel={t('memory.lesson.progressAria', { k: done, n: total })}
        accessibilityValue={{ min: 0, max: total, now: done }}
        style={styles.segments}
      >
        {lesson.steps.map((_, i) => (
          <View
            key={i}
            style={[
              styles.segment,
              i < done ? { backgroundColor: fill } : { backgroundColor: theme.colors.track, borderWidth: 1.5, borderColor: tint.muted },
            ]}
          />
        ))}
      </View>
      <View style={styles.lessonRow}>
        <View style={styles.lessonText}>
          {allDone ? (
            <>
              <Text style={{ color: tint.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19 }}>
                {t('memory.lesson.doneTitle', { n: total })}
              </Text>
              <Text style={{ color: tint.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
                {t('memory.lesson.doneSub')}
              </Text>
            </>
          ) : (
            <>
              <Text
                style={{
                  color: tint.muted,
                  fontFamily: uiFace(theme.type.ui, '700'),
                  fontSize: 12,
                  letterSpacing: 0.6,
                  textTransform: 'uppercase',
                }}
              >
                {t(skipped ? 'memory.lesson.skipped' : 'memory.lesson.nextUp')}
              </Text>
              <Text style={{ color: tint.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19 }}>{zhRef}</Text>
              <Text style={{ color: tint.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>{subline}</Text>
            </>
          )}
        </View>
        {allDone ? (
          <StatusLabel testID="memory-lesson-done" text={t('memory.lesson.done')} color={tint.text} />
        ) : href !== null ? (
          <MemButton
            testID="memory-lesson-start"
            kind="primary"
            label={action}
            accessibilityLabel={t('memory.lesson.startAria', {
              action,
              verse: paired && verse ? verse.referenceEn : zhRef,
              kind,
            })}
            onPress={() => onStart(href)}
          />
        ) : null}
      </View>
    </MemCard>
  );
});

function HowItWorks() {
  const theme = useTheme();
  const { t } = useI18n();
  return (
    <MemCard testID="memory-how-it-works" style={styles.how}>
      <SectionLabel>{t('memory.how.title')}</SectionLabel>
      <View accessibilityRole="list" style={styles.howSteps}>
        {([1, 2, 3, 4] as const).map((n) => (
          <View key={n} accessibilityRole="none" style={styles.howStep}>
            {n > 1 ? <MemoryIcon name="forward" color={theme.colors.muted} size={16} /> : null}
            <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14 }}>
              {t(`memory.how.${n}` as MessageKey)}
            </Text>
          </View>
        ))}
      </View>
    </MemCard>
  );
}

const LibraryRow = memo(function LibraryRow({
  verse,
  stage,
  steps,
  script,
  language,
  first,
  onOpen,
}: {
  verse: LibraryVerse;
  stage: StageName;
  steps: number;
  script: ChineseScript;
  language: VerseLanguage;
  first: boolean;
  onOpen(id: string): void;
}) {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const font = useVerseFont(language);
  const en = locale === 'en';
  const shown = verseView(verse, language, script);
  const stageLabel = t(`memory.stage.${stage}` as MessageKey);
  // Chinese: the first characters; English: the whole line, cut to one line by the layout.
  const preview = language === 'en' ? shown.text : `${Array.from(shown.text).slice(0, PREVIEW_CHARS).join('')}…`;
  return (
    <Pressable
      testID={`memory-row-${verse.id}`}
      accessibilityRole="button"
      accessibilityLabel={t('memory.row.aria', { ref: en ? verse.referenceEn : shown.reference, stage: stageLabel })}
      onPress={() => onOpen(verse.id)}
      style={({ pressed }) => [
        styles.row,
        !first && { borderTopWidth: 1, borderTopColor: theme.colors.track },
        { opacity: pressed ? 0.7 : 1 },
      ]}
    >
      <View style={styles.rowMain}>
        <View style={styles.refs}>
          <Text style={[styles.zhRef, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}>
            {shown.reference}
          </Text>
          {pairedEnglish(language, locale) ? (
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 12, flexShrink: 1 }}>
              {verse.referenceEn}
            </Text>
          ) : null}
        </View>
        <Text numberOfLines={1} {...({ lang: shown.lang } as object)} style={{ color: theme.colors.muted, fontFamily: font, fontSize: 14 }}>
          {preview}
        </Text>
      </View>
      <View style={styles.rowStage}>
        <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 12 }}>{stageLabel}</Text>
        <StageMark steps={steps} />
      </View>
    </Pressable>
  );
});

function Library({
  progress,
  script,
  language,
  onOpen,
}: {
  progress: ProgressMap;
  script: ChineseScript;
  language: VerseLanguage;
  onOpen(id: string): void;
}) {
  const theme = useTheme();
  const { locale } = useI18n();
  const groups = useMemo(() => libraryGroups(getAllMemoryVerses()), []);
  const en = locale === 'en';
  const badge = theme.canvas.bar ?? theme.colors.accent;
  return (
    <View testID="memory-library" style={styles.library}>
      {groups.map((group) => (
        <MemCard key={group.series} style={styles.series}>
          <View style={styles.seriesHead}>
            <View accessible={false} style={[styles.badge, { backgroundColor: badge }]}>
              <Text style={{ color: theme.colors.onAccent, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14 }}>
                {group.series}
              </Text>
            </View>
            <Text
              accessibilityRole="header"
              style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 17, flexShrink: 1 }}
            >
              {en ? group.seriesEn : group.seriesZh}
            </Text>
          </View>
          {group.topics.map((topic) => (
            <View key={topic.topicEn}>
              <View style={styles.topic}>
                <SectionLabel>{en ? topic.topicEn : topic.topicZh}</SectionLabel>
              </View>
              {topic.verses.map((verse, i) => {
                const view = stageView(progress[verse.id]);
                return (
                  <LibraryRow
                    key={verse.id}
                    verse={verse}
                    stage={view.stage}
                    steps={view.steps}
                    script={script}
                    language={language}
                    first={i === 0}
                    onOpen={onOpen}
                  />
                );
              })}
            </View>
          ))}
        </MemCard>
      ))}
      <ScriptureNotice language={language} onAurora />
    </View>
  );
}

function VerseSheet({
  verse,
  progress,
  script,
  language,
  now,
  onClose,
  onPractise,
}: {
  verse: LibraryVerse;
  progress: ProgressMap;
  script: ChineseScript;
  language: VerseLanguage;
  now: Date;
  onClose(): void;
  onPractise(href: string): void;
}) {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const font = useVerseFont(language);
  const en = locale === 'en';
  const row = progress[verse.id];
  const view = stageView(row);
  const due = daysUntilDue(row?.nextDueAt ?? null, now);
  const shown = verseView(verse, language, script);
  const ref = shown.reference;
  const nextReview =
    due === null
      ? null
      : due === 0
        ? t('memory.verse.nextReviewToday')
        : due === 1
          ? t('memory.verse.nextReviewTomorrow')
          : t('memory.verse.nextReview', { n: due });
  const slug = stageToSlug(row?.stage ?? 'chunk_order');
  return (
    <SheetModal
      testID="memory-verse-sheet"
      onClose={onClose}
      header={
        <View style={styles.sheetHead}>
          <Text accessibilityRole="header" style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 21 }}>
            {ref}
          </Text>
          {pairedEnglish(language, locale) ? (
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}>{verse.referenceEn}</Text>
          ) : null}
        </View>
      }
    >
      <Text {...({ lang: shown.lang } as object)} style={{ color: theme.colors.text, fontFamily: font, fontSize: 20, lineHeight: 34 }}>
        {shown.text}
      </Text>
      <ScriptureNotice language={language} />
      <View style={[styles.stageRow, { borderColor: theme.colors.track }]}>
        <View style={styles.stageName}>
          <SectionLabel>{t('memory.stage.label')}</SectionLabel>
          <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>
            {t(`memory.stage.${view.stage}` as MessageKey)}
          </Text>
        </View>
        <StageMark steps={view.steps} />
        {nextReview !== null ? (
          <View style={styles.nextReview}>
            <MemoryIcon name="clock" color={theme.colors.muted} size={18} />
            <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14, flexShrink: 1 }}>
              {nextReview}
            </Text>
          </View>
        ) : null}
      </View>
      <View style={styles.practise}>
        <MemButton
          testID="memory-practise"
          kind="primary"
          block
          label={t('memory.verse.practise')}
          accessibilityLabel={t('memory.verse.practiseAria', { ref: en ? verse.referenceEn : ref })}
          // Free practice: no lesson step, so no `s` / `i` in the link and nothing counts for the day.
          onPress={() => onPractise(`/memory/lesson/${verse.id}/${slug}`)}
        />
        <Text
          style={{
            color: theme.colors.muted,
            fontFamily: uiFace(theme.type.ui, '400'),
            fontSize: 13,
            lineHeight: 18,
            textAlign: 'center',
          }}
        >
          {t('memory.verse.practiceNote')}
        </Text>
      </View>
      <MemButton testID="memory-verse-close" kind="ghost" block label={t('memory.verse.close')} onPress={onClose} />
    </SheetModal>
  );
}

export function MemoryHome({
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

  const lessonState = useTodayLesson(storage, now);
  const [progress] = useMemoryProgress(storage);
  const [history] = useMemoryHistory(storage);
  const [settings] = useMemorySettings(storage);
  const language = useVerseLanguage();
  const [settingsOpen, setSettingsOpen] = useState(false);
  const [openId, setOpenId] = useState<string | null>(null);
  // "Progress saved": a trainer notes it on the way back; taken once, on mount, and shown for a few seconds.
  const [saved, setSaved] = useState(() => takeProgressSaved());

  useEffect(() => {
    if (!saved) return;
    const timer = setTimeout(() => setSaved(null), SAVED_MS);
    return () => clearTimeout(timer);
  }, [saved]);

  const date = lessonState.date;
  const today = toLocalDateString(date);
  const streak = dailyStreak(history.completedDates, today);
  // A reader who has not started has nothing to miss: the days before today are "before you started".
  const week = weekStrip(history.completedDates, date, history.startedOn ?? today);
  const first = history.startedOn === null && Object.keys(progress).length === 0;
  // "{count} learned": the count is its own run of text, so it can be found by itself.
  const learnedCount = t('memory.library.count', { n: learnedVerses(progress), total: TOTAL_VERSES });
  const [learnedBefore = '', learnedAfter = ''] = t('memory.library.learned', { count: LEARNED_MARK }).split(LEARNED_MARK);
  const openVerse = openId !== null ? getMemoryVerse(openId) : undefined;

  const border = theme.borders.card;
  // Above the tab bar: a floating bar overlays the screen, a docked one ends the screen above it.
  const toastBottom = theme.floatingTabBar ? 68 + Math.max(insets.bottom, 12) + 16 : 16;

  return (
    <View testID="memory-home" style={[styles.fill, theme.backgrounds.app]}>
      <AuroraBackground />
      <ScrollView
        style={styles.fill}
        contentContainerStyle={[styles.content, { paddingTop: insets.top + 16, paddingBottom: TAB_BAR_ROOM }]}
      >
        <View style={styles.header}>
          <View style={styles.titleBlock}>
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, ...auroraTextShadow(theme) }}>
              {formatDate(date, DATE_LINE)}
            </Text>
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
              {t('memory.title')}
            </Text>
          </View>
          <View style={styles.headerActions}>
            <Pressable
              testID="memory-streak-chip"
              accessibilityRole="button"
              accessibilityLabel={streak === 0 ? t('memory.streak.startAria') : t('memory.streak.aria', { n: streak })}
              onPress={() => go('/study/memory/week')}
              style={({ pressed }) => [
                styles.chip,
                theme.backgrounds.chip,
                { borderWidth: border.width, borderColor: border.color, boxShadow: theme.shadows.card ?? undefined, opacity: pressed ? 0.85 : 1 },
              ]}
            >
              <MemoryIcon name="flame" color={theme.colors.chipText} size={18} />
              {streak === 0 ? (
                <Text style={{ color: theme.colors.chipText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14 }}>
                  {t('memory.streak.start')}
                </Text>
              ) : (
                <>
                  <Text style={{ color: theme.colors.chipText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{streak}</Text>
                  <Text style={{ color: theme.colors.chipText, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 12 }}>
                    {t('memory.streak.unit')}
                  </Text>
                </>
              )}
            </Pressable>
            <Pressable
              testID="memory-settings-button"
              accessibilityRole="button"
              accessibilityLabel={t('memory.settings.open')}
              onPress={() => setSettingsOpen(true)}
              style={[styles.round, buttonStyle(theme), { borderRadius: 999 }]}
            >
              <MemoryIcon name="settings" color={theme.colors.btnText} size={20} strokeWidth={1.9} />
            </Pressable>
          </View>
        </View>

        <LessonCard first={first} progress={progress} script={settings.script} language={language} onStart={go} lessonState={lessonState} />
        {first ? <HowItWorks /> : null}

        <MemCard style={styles.weekCard}>
          <SectionLabel>{t('memory.week.title')}</SectionLabel>
          <WeekStrip days={week} size="large" labels today={today} />
        </MemCard>

        <View style={styles.libraryHead}>
          <Text
            accessibilityRole="header"
            style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 21, flexShrink: 1, ...auroraTextShadow(theme) }}
          >
            {t('memory.library.title')}
          </Text>
          <Text
            accessibilityLabel={t('memory.library.learned', { count: learnedCount })}
            style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, ...auroraTextShadow(theme) }}
          >
            {learnedBefore}
            <Text testID="memory-learned">{learnedCount}</Text>
            {learnedAfter}
          </Text>
        </View>
        <Library progress={progress} script={settings.script} language={language} onOpen={setOpenId} />
      </ScrollView>

      {saved ? (
        <View
          testID="memory-saved-toast"
          role="status"
          aria-live="polite"
          accessibilityLiveRegion="polite"
          style={[
            styles.toast,
            {
              bottom: toastBottom,
              backgroundColor: theme.canvas.bar ?? theme.colors.cta,
              borderRadius: theme.radii.button,
              borderWidth: theme.borders.button?.width ?? 0,
              borderColor: theme.borders.button?.color,
            },
          ]}
        >
          <MemoryIcon name="check" color={theme.colors.onAccent} size={18} strokeWidth={2.6} />
          <Text style={{ color: theme.colors.onAccent, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14, flexShrink: 1 }}>
            {t('memory.saved', { k: saved.step, n: saved.total })}
          </Text>
        </View>
      ) : null}

      {openVerse ? (
        <VerseSheet
          verse={openVerse}
          progress={progress}
          script={settings.script}
          language={language}
          now={date}
          onClose={() => setOpenId(null)}
          onPractise={(href) => {
            setOpenId(null);
            go(href);
          }}
        />
      ) : null}
      <MemorySettingsSheet visible={settingsOpen} onClose={() => setSettingsOpen(false)} storage={storage} />
    </View>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { paddingHorizontal: 16, gap: 14 },
  header: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'flex-start', justifyContent: 'space-between', gap: 8 },
  titleBlock: { gap: 4, minWidth: 0, flexShrink: 1 },
  headerActions: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  chip: { minHeight: 44, flexDirection: 'row', alignItems: 'center', gap: 6, paddingHorizontal: 12, paddingVertical: 8, borderRadius: 999 },
  round: { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' },
  spread: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'baseline', gap: 8 },
  segments: { flexDirection: 'row', gap: 6 },
  segment: { flex: 1, height: 8, borderRadius: 999 },
  lessonRow: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'center', justifyContent: 'space-between', gap: 12 },
  lessonText: { flexGrow: 1, flexShrink: 1, flexBasis: 150, gap: 3 },
  how: { gap: 8, paddingVertical: 14 },
  howSteps: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'center', columnGap: 8, rowGap: 4 },
  howStep: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  weekCard: { paddingVertical: 14 },
  libraryHead: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'baseline', gap: 8, paddingTop: 6, paddingHorizontal: 2 },
  library: { gap: 14 },
  series: { paddingTop: 14, paddingBottom: 6, gap: 0 },
  seriesHead: { flexDirection: 'row', alignItems: 'center', gap: 10, paddingBottom: 4 },
  badge: { width: 28, height: 28, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  topic: { paddingTop: 12, paddingBottom: 2 },
  row: { minHeight: 64, paddingVertical: 10, flexDirection: 'row', alignItems: 'center', gap: 12 },
  rowMain: { flex: 1, minWidth: 0, gap: 2 },
  refs: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'baseline', columnGap: 8, rowGap: 2 },
  zhRef: { fontSize: 15, flexShrink: 1 },
  rowStage: { minWidth: 84, alignItems: 'flex-end', gap: 5 },
  sheetHead: { gap: 2 },
  stageRow: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: 12,
    paddingVertical: 12,
    borderTopWidth: 1,
    borderBottomWidth: 1,
  },
  stageName: { gap: 2 },
  nextReview: { flexDirection: 'row', alignItems: 'center', gap: 6, flexShrink: 1 },
  practise: { gap: 6 },
  toast: {
    position: 'absolute',
    left: 16,
    right: 16,
    minHeight: 48,
    paddingHorizontal: 16,
    paddingVertical: 10,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
  },
});
