// Study → Progress: the streak and this week, today's goal, and the chapters explored with the coverage map.
import type { ReactNode } from 'react';
import { ScrollView, StyleSheet, Text, View } from 'react-native';

import { GlassSurface } from '../../components/GlassSurface';
import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { TOTAL_CHAPTERS, type ReadingProgressView, type WeekDay } from '../../progress';
import { useBooks } from '../../reader/books';
import { Icon } from '../../reader/components/icons';
import { useTheme } from '../../theme/ThemeProvider';
import type { Background, Theme } from '../../theme/types';
import { CoverageMap } from './CoverageMap';

/** A card as the design draws it: the surface, the outline and shadow of the preset, glass where the preset is glass. */
function Card({
  testID,
  children,
  gap,
  paddingVertical = 16,
  background,
}: {
  testID?: string;
  children: ReactNode;
  gap: number;
  paddingVertical?: number;
  background?: Background;
}) {
  const theme = useTheme();
  return (
    <GlassSurface
      testID={testID}
      background={background ?? theme.backgrounds.surface}
      style={{
        gap,
        paddingVertical,
        paddingHorizontal: 16,
        borderRadius: theme.radii.card,
        borderWidth: theme.borders.card.width,
        borderColor: theme.borders.card.color,
        boxShadow: theme.shadows.card ?? undefined,
      }}
    >
      {children}
    </GlassSurface>
  );
}

const smallCaps = (theme: Theme) => ({
  color: theme.colors.muted,
  fontFamily: uiFace(theme.type.ui, '700'),
  fontSize: 12,
  letterSpacing: 0.6,
  textTransform: 'uppercase' as const,
});

function DayCircle({ day, tint }: { day: WeekDay; tint: { text: string; muted: string } }) {
  const theme = useTheme();
  const { t } = useI18n();
  const name = t(`study.weekdayName.${day.weekday}` as MessageKey);
  const met = day.met && !day.future;
  const label = t(day.future ? 'study.dayAhead' : met ? 'study.dayMet' : 'study.dayMissed', { day: name });
  return (
    <View style={styles.day}>
      <View
        testID={`study-day-${day.weekday}`}
        accessible
        accessibilityLabel={label}
        style={[
          styles.circle,
          met
            ? { backgroundColor: theme.colors.cta }
            : { borderWidth: 2, borderStyle: 'dashed', borderColor: tint.muted },
        ]}
      >
        {met ? <Icon name="check" size={15} color={theme.colors.onCta} strokeWidth={2.6} /> : null}
      </View>
      <Text accessible={false} style={{ color: tint.muted, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 11 }}>
        {t(`study.weekday.${day.weekday}` as MessageKey)}
      </Text>
    </View>
  );
}

function StreakCard({ progress }: { progress: ReadingProgressView }) {
  const theme = useTheme();
  const { t } = useI18n();
  const tint = { text: theme.canvas.c1t ?? theme.colors.text, muted: theme.canvas.c1m ?? theme.colors.muted };
  return (
    <View testID="study-streak" role="group" accessibilityLabel={t('study.streakLabel', { n: progress.streak })}>
      <Card gap={12} background={theme.canvas.c1 === undefined ? undefined : { backgroundColor: theme.canvas.c1 }}>
        <View style={styles.streakTop}>
          <Text
            testID="study-streak-count"
            style={{ color: tint.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 40, lineHeight: 44 }}
          >
            {String(progress.streak)}
          </Text>
          <Text style={{ color: tint.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15, flexShrink: 1 }}>
            {t('study.streakDays')}
          </Text>
          {progress.best > 0 ? (
            <Text style={{ marginLeft: 'auto', color: tint.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
              {progress.best === 1 ? t('study.bestOne') : t('study.best', { n: progress.best })}
            </Text>
          ) : null}
        </View>
        <View style={styles.week}>
          {progress.week.map((d) => (
            <DayCircle key={d.weekday} day={d} tint={tint} />
          ))}
        </View>
      </Card>
    </View>
  );
}

function GoalCard({ progress }: { progress: ReadingProgressView }) {
  const theme = useTheme();
  const { t } = useI18n();
  const done = progress.goalProgressMinutes;
  const goal = progress.goalMinutes;
  const share = goal > 0 ? Math.min(1, done / goal) : 0;
  return (
    <Card testID="study-goal" gap={8} paddingVertical={14}>
      <View style={styles.goalTop}>
        <Text style={smallCaps(theme)}>{t('study.goal')}</Text>
        <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}>
          {t('study.goalValue', { done, goal })}
        </Text>
      </View>
      <View
        testID="study-goal-bar"
        accessibilityRole="progressbar"
        accessibilityLabel={t('study.goal')}
        accessibilityValue={{ min: 0, max: goal, now: done }}
        style={[styles.track, { backgroundColor: theme.colors.track }]}
      >
        <View style={[styles.barFill, { width: `${share * 100}%`, backgroundColor: theme.canvas.bar ?? theme.colors.cta }]} />
      </View>
    </Card>
  );
}

function ExploredCard({ progress }: { progress: ReadingProgressView }) {
  const theme = useTheme();
  const { t, formatNumber } = useI18n();
  const books = useBooks();
  const count = formatNumber(progress.exploredCount);
  return (
    <Card gap={10}>
      <View style={styles.goalTop}>
        <Text accessibilityRole="header" style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 17, flexShrink: 1 }}>
          {t('study.explored')}
        </Text>
        <Text
          testID="study-explored-count"
          accessibilityLabel={t('study.exploredLabel', { n: count, total: formatNumber(TOTAL_CHAPTERS) })}
          style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}
        >
          <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }}>{count}</Text>
          {` / ${formatNumber(TOTAL_CHAPTERS)}`}
        </Text>
      </View>
      {books.data ? (
        <CoverageMap books={books.data} chaptersRead={progress.progress.chaptersRead} />
      ) : (
        <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}>{t('common.loading')}</Text>
      )}
    </Card>
  );
}

export function ProgressView({ header, progress, bottomInset }: { header: ReactNode; progress: ReadingProgressView; bottomInset: number }) {
  return (
    <ScrollView style={styles.fill} contentContainerStyle={[styles.content, { paddingBottom: bottomInset }]}>
      {header}
      <StreakCard progress={progress} />
      <GoalCard progress={progress} />
      <ExploredCard progress={progress} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { paddingHorizontal: 20, gap: 14 },
  streakTop: { flexDirection: 'row', alignItems: 'baseline', gap: 8 },
  week: { flexDirection: 'row', justifyContent: 'space-between' },
  day: { alignItems: 'center', gap: 5 },
  circle: { width: 30, height: 30, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  goalTop: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'baseline', gap: 12 },
  track: { height: 8, borderRadius: 999, overflow: 'hidden' },
  barFill: { height: '100%', borderRadius: 999 },
});
