// The Home tab's cards, as the signed-off design draws them. They take ready values; HomeScreen reads the
// storage and the API and decides what to show.
import type { ReactNode } from 'react';
import { Platform, Pressable, StyleSheet, Text, View } from 'react-native';

import { auroraTextShadow } from '../aurora';
import { GlassSurface } from '../components/GlassSurface';
import { uiFace } from '../fonts/fonts';
import { useI18n } from '../i18n/I18nProvider';
import { Icon } from '../reader/components/icons';
import { buttonStyle } from '../reader/components/ui';
import { useTheme } from '../theme/ThemeProvider';
import type { Background, Theme } from '../theme/types';
import { FlameIcon, ShuffleIcon } from './icons';

/** A card: the surface, the outline and shadow of the preset, glass where the preset is glass. */
function Card({
  children,
  gap,
  padding,
  background,
  row = false,
  grow = false,
}: {
  children: ReactNode;
  gap: number;
  padding: { top: number; bottom: number };
  background?: Background;
  row?: boolean;
  /** Fill a parent that has a minimum height. */
  grow?: boolean;
}) {
  const theme = useTheme();
  return (
    <GlassSurface
      background={background ?? theme.backgrounds.surface}
      style={{
        gap,
        flexGrow: grow ? 1 : undefined,
        flexDirection: row ? 'row' : 'column',
        alignItems: row ? 'center' : undefined,
        paddingTop: padding.top,
        paddingBottom: padding.bottom,
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

const paint = (color: string | undefined): Background | undefined => (color === undefined ? undefined : { backgroundColor: color });

const smallCaps = (theme: Theme, color: string) => ({
  color,
  fontFamily: uiFace(theme.type.ui, '700'),
  fontSize: 12,
  letterSpacing: 0.6,
  textTransform: 'uppercase' as const,
});

/** The round call-to-action button of a card. */
function cta(theme: Theme) {
  const border = theme.borders.button;
  return {
    backgroundColor: theme.colors.cta,
    borderRadius: theme.radii.button,
    borderWidth: border?.width ?? 0,
    borderColor: border?.color,
  };
}

export function HomeHeader({
  date,
  greeting,
  streak,
  streakLabel,
  streakDays,
  streakStart,
}: {
  date: string;
  greeting: string;
  streak: number;
  streakLabel: string;
  streakDays: string;
  /** What the chip says at a streak of 0, in place of the count. */
  streakStart: string;
}) {
  const theme = useTheme();
  const shadow = auroraTextShadow(theme); // the date and greeting sit straight on the aurora
  return (
    <View testID="home-header" style={styles.header}>
      <View style={styles.headerText}>
        <Text testID="home-date" style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, ...shadow }}>
          {date}
        </Text>
        <Text
          testID="home-greeting"
          accessibilityRole="header"
          style={{
            color: theme.colors.text,
            fontFamily: uiFace(theme.type.head, theme.type.headWeight),
            fontSize: theme.type.headSize,
            letterSpacing: theme.type.headLetterSpacing,
            ...shadow,
          }}
        >
          {greeting}
        </Text>
      </View>
      <View
        testID="home-streak"
        accessible
        accessibilityLabel={streakLabel}
        style={[
          styles.chip,
          theme.backgrounds.chip,
          { borderWidth: theme.borders.card.width, borderColor: theme.borders.card.color, boxShadow: theme.shadows.card ?? undefined },
        ]}
      >
        <FlameIcon color={theme.colors.chipText} />
        {streak >= 1 ? (
          <>
            <Text testID="home-streak-count" numberOfLines={1} style={{ color: theme.colors.chipText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>
              {String(streak)}
            </Text>
            <Text numberOfLines={1} style={{ color: theme.colors.chipText, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 12 }}>
              {streakDays}
            </Text>
          </>
        ) : (
          <Text numberOfLines={1} style={{ color: theme.colors.chipText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 13 }}>
            {streakStart}
          </Text>
        )}
      </View>
    </View>
  );
}

export function GoalCard({
  done,
  goal,
  onPress,
}: {
  done: number;
  goal: number;
  onPress: () => void;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  const share = goal > 0 ? Math.min(1, done / goal) : 0;
  return (
    <Pressable
      testID="home-goal"
      accessibilityRole="button"
      accessibilityLabel={t('home.goalLabel', { done, goal })}
      accessibilityHint={t('home.goalHint')}
      onPress={onPress}
      style={{ borderRadius: theme.radii.card, minHeight: 44 }}
    >
      <Card gap={8} padding={{ top: 14, bottom: 14 }}>
        <View style={styles.baselineRow}>
          <Text style={smallCaps(theme, theme.colors.muted)}>{t('home.today')}</Text>
          <View style={styles.goalEnd}>
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, flexShrink: 1 }}>
              <Text testID="home-goal-done" style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }}>
                {String(done)}
              </Text>
              {t('home.goalOf', { goal })}
            </Text>
            {/* Says the card can be edited; the card's own label already says so. */}
            <View testID="home-goal-cue" accessible={false}>
              <Icon name="chevronRight" size={18} color={theme.colors.muted} />
            </View>
          </View>
        </View>
        <View
          testID="home-goal-bar"
          accessibilityRole="progressbar"
          accessibilityLabel={t('study.goal')}
          accessibilityValue={{ min: 0, max: goal, now: done }}
          aria-valuemin={0}
          aria-valuemax={goal}
          aria-valuenow={done}
          style={[
            styles.track,
            { backgroundColor: theme.colors.track },
            // An empty track would vanish into the card, so it is outlined until reading starts.
            done <= 0 && { borderWidth: 1, borderColor: theme.colors.muted },
          ]}
        >
          <View style={[styles.barFill, { width: `${share * 100}%`, backgroundColor: theme.canvas.bar ?? theme.colors.cta }]} />
        </View>
      </Card>
    </Pressable>
  );
}

export function ContinueCard({
  caps,
  reference,
  sub,
  label,
  onPress,
}: {
  /** The small caps line: "Continue reading", or "Start reading" for a reader with no position yet. */
  caps: string;
  /** The chapter and translation, or "Loading…" until the books arrive. */
  reference: string;
  sub: string;
  label: string;
  onPress: () => void;
}) {
  const theme = useTheme();
  const text = theme.canvas.c1t ?? theme.colors.text;
  const muted = theme.canvas.c1m ?? theme.colors.muted;
  return (
    <Pressable
      testID="home-continue"
      accessibilityRole="button"
      accessibilityLabel={label}
      onPress={onPress}
      style={{ borderRadius: theme.radii.card }}
    >
      <Card gap={14} row padding={{ top: 16, bottom: 16 }} background={paint(theme.canvas.c1)}>
        <View style={styles.continueText}>
          <Text style={smallCaps(theme, muted)}>{caps}</Text>
          <Text testID="home-continue-ref" style={{ color: text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19 }}>
            {reference}
          </Text>
          <Text testID="home-continue-sub" style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
            {sub}
          </Text>
        </View>
        {/* The card is the one control and carries the name ("Continue reading John 3"); the arrow only shows it. */}
        <View testID="home-continue-arrow" {...decorative} style={[styles.round, cta(theme)]}>
          <Icon name="chevronRight" size={22} color={theme.colors.onCta} />
        </View>
      </Card>
    </Pressable>
  );
}

/** What the verse card shows in place of the verse. */
export type VerseState =
  | { kind: 'loading' }
  | { kind: 'error'; retrying: boolean }
  | {
      kind: 'ready';
      text: string;
      ref: string;
      label: string;
      fontFamily: string | undefined;
      zh: boolean;
    };

const SHARE_SIZE = 44;
/** The verse card never gets shorter than this, so Home does not jump as the verse loads. */
export const VOTD_MIN_HEIGHT = 200;
/** Widths of the skeleton's bars, as a share of the card's width. */
const SKELETON_BARS = ['100%', '94%', '86%', '52%'] as const;

/** Hidden from screen readers: a look inside a control that already says what it does. */
const decorative = {
  accessible: false,
  importantForAccessibility: 'no-hide-descendants',
  'aria-hidden': true,
} as const;

/** Section labelling that only the web needs: a native screen reader reads the cards in order anyway. */
const region = (label: string) => (Platform.OS === 'web' ? ({ role: 'region', 'aria-label': label } as const) : {});

export function VerseCard({
  state,
  onOpen,
  onShare,
  onRetry,
}: {
  state: VerseState;
  onOpen: () => void;
  onShare: () => void;
  onRetry: () => void;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  const text = theme.colors.text;
  const muted = theme.colors.muted;
  const caption = <Text style={smallCaps(theme, muted)}>{t('home.votd')}</Text>;
  return (
    <View testID="home-votd" style={{ minHeight: VOTD_MIN_HEIGHT }} {...region(t('home.votd'))}>
      <Card gap={12} grow padding={{ top: 18, bottom: 14 }} background={paint(theme.canvas.c2)}>
        {state.kind === 'ready' ? (
          <>
            <Pressable
              testID="home-votd-open"
              accessibilityRole="button"
              accessibilityLabel={state.label}
              accessibilityHint={t('study.openHint')}
              onPress={onOpen}
              style={styles.votdOpen}
            >
              {caption}
              <Text
                testID="home-votd-text"
                style={{ color: text, fontFamily: state.fontFamily, fontSize: 22, lineHeight: 31 }}
              >
                {state.text}
              </Text>
              {/* Room beside the reference for the share button, which sits over it. */}
              <View style={styles.votdRef}>
                <Text testID="home-votd-ref" style={{ color: text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14 }}>
                  {state.ref}
                </Text>
              </View>
            </Pressable>
            <Pressable
              testID="home-votd-share"
              accessibilityRole="button"
              accessibilityLabel={t('home.shareVerse')}
              onPress={onShare}
              style={[styles.share, buttonStyle(theme)]}
            >
              <Icon name="share" size={20} color={theme.colors.btnText} strokeWidth={1.9} />
            </Pressable>
          </>
        ) : (
          <>
            {caption}
            {state.kind === 'loading' ? (
              <View testID="home-votd-skeleton" accessible accessibilityLabel={t('common.loading')} style={styles.skeleton}>
                {SKELETON_BARS.map((width) => (
                  <View key={width} style={[styles.bar, { width, backgroundColor: theme.colors.track }]} />
                ))}
              </View>
            ) : (
              <>
                <Text
                  testID="home-votd-error"
                  aria-live="polite"
                  style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 15, lineHeight: 22 }}
                >
                  {t('home.votdError')}
                </Text>
                <Pressable
                  testID="home-votd-retry"
                  accessibilityRole="button"
                  accessibilityState={{ disabled: state.retrying, busy: state.retrying }}
                  disabled={state.retrying}
                  onPress={onRetry}
                  style={[styles.retry, buttonStyle(theme)]}
                >
                  <Text style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14 }}>
                    {state.retrying ? t('home.votdRetrying') : t('common.retry')}
                  </Text>
                </Pressable>
              </>
            )}
          </>
        )}
      </Card>
    </View>
  );
}

/** What the Memory card's button shows, and how: Start and Continue are the call to action, Week is secondary. */
export interface MemoryCardAction {
  text: string;
  primary: boolean;
}

/**
 * Today's Memory lesson in one row, built like Continue reading: a caps line with the learned count, the verse, and
 * the step (or "Done for today"); the button on the right. The whole card is one control with one name; each line
 * stays on one line.
 */
export function MemoryCard({
  caps,
  reference,
  sub,
  action,
  label,
  onPress,
}: {
  caps: string;
  reference: string;
  sub: string;
  action: MemoryCardAction;
  /** The card's accessible name: "Start Memory lesson, 2 Corinthians 5:17", or "See the week". */
  label: string;
  onPress: () => void;
}) {
  const theme = useTheme();
  const { locale } = useI18n();
  const text = theme.colors.text;
  const muted = theme.colors.muted;
  const button = action.primary ? cta(theme) : buttonStyle(theme);
  return (
    <Pressable
      testID="home-memory"
      accessibilityRole="button"
      accessibilityLabel={label}
      onPress={onPress}
      style={{ borderRadius: theme.radii.card, minHeight: 48 }}
    >
      <Card gap={14} row padding={{ top: 16, bottom: 16 }}>
        <View style={styles.rowText}>
          <Text testID="home-memory-caps" numberOfLines={1} style={[smallCaps(theme, muted), locale === 'zh-Hans' && styles.noTracking]}>
            {caps}
          </Text>
          <Text testID="home-memory-ref" numberOfLines={1} style={{ color: text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19 }}>
            {reference}
          </Text>
          <Text testID="home-memory-sub" numberOfLines={1} style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
            {sub}
          </Text>
        </View>
        <View testID="home-memory-action" {...decorative} style={[styles.textButton, button]}>
          <Text
            numberOfLines={1}
            style={{
              color: action.primary ? theme.colors.onCta : theme.colors.btnText,
              fontFamily: uiFace(theme.type.ui, '700'),
              fontSize: 15,
            }}
          >
            {action.text}
          </Text>
        </View>
      </Card>
    </Pressable>
  );
}

/** Surprise me in one row: the title and the explored count, and a round shuffle button (a secondary one). */
export function SurpriseRow({
  exploredText,
  exploredLabel,
  disabled,
  onPress,
}: {
  exploredText: string;
  exploredLabel: string;
  disabled: boolean;
  onPress: () => void;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  const text = theme.canvas.c3t ?? theme.colors.text;
  const muted = theme.canvas.c3m ?? theme.colors.muted;
  return (
    <View testID="home-surprise" {...region(t('home.surprise'))}>
      <Card gap={14} row padding={{ top: 16, bottom: 16 }} background={paint(theme.canvas.c3)}>
        <View style={styles.rowText}>
          <Text accessibilityRole="header" numberOfLines={1} style={{ color: text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19 }}>
            {t('home.surprise')}
          </Text>
          <Text
            testID="home-explored"
            numberOfLines={1}
            accessibilityLabel={exploredLabel}
            style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}
          >
            {exploredText}
          </Text>
        </View>
        <Pressable
          testID="home-surprise-go"
          accessibilityRole="button"
          accessibilityLabel={t('home.surpriseGo')}
          accessibilityState={{ disabled }}
          disabled={disabled}
          onPress={onPress}
          style={[styles.round, buttonStyle(theme), disabled && styles.disabled]}
        >
          <ShuffleIcon color={theme.colors.btnText} />
        </Pressable>
      </Card>
    </View>
  );
}

const styles = StyleSheet.create({
  header: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'flex-start', justifyContent: 'space-between', gap: 10 },
  // With large text the streak chip wraps below the greeting instead of squeezing it.
  headerText: { flex: 1, flexShrink: 1, minWidth: 160, gap: 4 },
  chip: {
    flexShrink: 0,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    minHeight: 44,
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: 999,
  },
  baselineRow: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'baseline', gap: 8 },
  wrap: { flexWrap: 'wrap' },
  goalEnd: { flexDirection: 'row', alignItems: 'center', gap: 2, flexShrink: 1 },
  track: { height: 8, borderRadius: 999, overflow: 'hidden' },
  barFill: { height: '100%', borderRadius: 999 },
  continueText: { flex: 1, flexShrink: 1, gap: 3 },
  rowText: { flex: 1, flexShrink: 1, minWidth: 0, gap: 3 },
  noTracking: { letterSpacing: 0 },
  textButton: { minHeight: 44, paddingHorizontal: 18, flexShrink: 0, alignItems: 'center', justifyContent: 'center' },
  round: { minWidth: 48, minHeight: 48, flexShrink: 0, alignItems: 'center', justifyContent: 'center' },
  votdOpen: { gap: 12 },
  votdRef: { minHeight: SHARE_SIZE, justifyContent: 'center', paddingRight: SHARE_SIZE + 12 },
  share: { position: 'absolute', right: 16, bottom: 14, width: SHARE_SIZE, height: SHARE_SIZE, alignItems: 'center', justifyContent: 'center' },
  disabled: { opacity: 0.5 },
  skeleton: { gap: 12, paddingVertical: 4 },
  bar: { height: 16, borderRadius: 999 },
  retry: { minHeight: 44, paddingHorizontal: 18, alignSelf: 'flex-start', alignItems: 'center', justifyContent: 'center' },
});
