// The Home tab's cards, as the signed-off design draws them. They take ready values; HomeScreen reads the
// storage and the API and decides what to show.
import type { ReactNode } from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';

import { GlassSurface } from '../components/GlassSurface';
import { uiFace } from '../fonts/fonts';
import { useI18n } from '../i18n/I18nProvider';
import { Icon } from '../reader/components/icons';
import { buttonStyle } from '../reader/components/ui';
import { useTheme } from '../theme/ThemeProvider';
import type { Background, Theme } from '../theme/types';
import { FlameIcon } from './icons';

/** A card: the surface, the outline and shadow of the preset, glass where the preset is glass. */
function Card({
  children,
  gap,
  padding,
  background,
  row = false,
}: {
  children: ReactNode;
  gap: number;
  padding: { top: number; bottom: number };
  background?: Background;
  row?: boolean;
}) {
  const theme = useTheme();
  return (
    <GlassSurface
      background={background ?? theme.backgrounds.surface}
      style={{
        gap,
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
}: {
  date: string;
  greeting: string;
  streak: number;
  streakLabel: string;
  streakDays: string;
}) {
  const theme = useTheme();
  return (
    <View style={styles.header}>
      <View style={styles.headerText}>
        <Text testID="home-date" style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
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
        <Text testID="home-streak-count" style={{ color: theme.colors.chipText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>
          {String(streak)}
        </Text>
        <Text style={{ color: theme.colors.chipText, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 12 }}>{streakDays}</Text>
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
      style={{ borderRadius: theme.radii.card }}
    >
      <Card gap={8} padding={{ top: 14, bottom: 14 }}>
        <View style={styles.baselineRow}>
          <Text style={smallCaps(theme, theme.colors.muted)}>{t('home.today')}</Text>
          <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, flexShrink: 1 }}>
            <Text testID="home-goal-done" style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }}>
              {String(done)}
            </Text>
            {t('home.goalOf', { goal })}
          </Text>
        </View>
        <View
          testID="home-goal-bar"
          accessibilityRole="progressbar"
          accessibilityLabel={t('study.goal')}
          accessibilityValue={{ min: 0, max: goal, now: done }}
          style={[styles.track, { backgroundColor: theme.colors.track }]}
        >
          <View style={[styles.barFill, { width: `${share * 100}%`, backgroundColor: theme.canvas.bar ?? theme.colors.cta }]} />
        </View>
      </Card>
    </Pressable>
  );
}

export function ContinueCard({
  reference,
  sub,
  label,
  onPress,
}: {
  /** The chapter and translation, or "Loading…" until the books arrive. */
  reference: string;
  sub: string;
  label: string;
  onPress: () => void;
}) {
  const theme = useTheme();
  const { t } = useI18n();
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
          <Text style={smallCaps(theme, muted)}>{t('home.continue')}</Text>
          <Text testID="home-continue-ref" style={{ color: text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19 }}>
            {reference}
          </Text>
          <Text testID="home-continue-sub" style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
            {sub}
          </Text>
        </View>
        <View style={[styles.round, cta(theme)]}>
          <Icon name="chevronRight" size={22} color={theme.colors.onCta} />
        </View>
      </Card>
    </Pressable>
  );
}

/** What the verse card shows in place of the verse. */
export type VerseState =
  | { kind: 'loading' }
  | { kind: 'none' }
  | {
      kind: 'ready';
      text: string;
      ref: string;
      label: string;
      fontFamily: string | undefined;
      zh: boolean;
    };

const SHARE_SIZE = 44;

export function VerseCard({ state, onOpen, onShare }: { state: VerseState; onOpen: () => void; onShare: () => void }) {
  const theme = useTheme();
  const { t } = useI18n();
  const text = theme.colors.text;
  const muted = theme.colors.muted;
  const caption = <Text style={smallCaps(theme, muted)}>{t('home.votd')}</Text>;
  return (
    <View testID="home-votd">
      <Card gap={12} padding={{ top: 18, bottom: 14 }} background={paint(theme.canvas.c2)}>
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
              <Text style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}>{t('common.loading')}</Text>
            ) : null}
          </>
        )}
      </Card>
    </View>
  );
}

export function SurpriseCard({
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
    <View testID="home-surprise">
      <Card gap={10} padding={{ top: 16, bottom: 16 }} background={paint(theme.canvas.c3)}>
        <View style={[styles.baselineRow, styles.wrap]}>
          <Text accessibilityRole="header" style={{ color: text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19, flexShrink: 1 }}>
            {t('home.surprise')}
          </Text>
          <Text
            testID="home-explored"
            accessibilityLabel={exploredLabel}
            style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, flexShrink: 1 }}
          >
            {exploredText}
          </Text>
        </View>
        <Text style={{ color: muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 20 }}>
          {t('home.surpriseBody')}
        </Text>
        <Pressable
          testID="home-surprise-go"
          accessibilityRole="button"
          accessibilityState={{ disabled }}
          disabled={disabled}
          onPress={onPress}
          style={[styles.go, cta(theme), { boxShadow: theme.shadows.cta }, disabled && styles.disabled]}
        >
          <Text style={{ color: theme.colors.onCta, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15, textAlign: 'center' }}>
            {t('home.surpriseGo')}
          </Text>
        </Pressable>
      </Card>
    </View>
  );
}

const styles = StyleSheet.create({
  header: { flexDirection: 'row', alignItems: 'flex-start', justifyContent: 'space-between', gap: 12 },
  headerText: { flex: 1, flexShrink: 1, gap: 4 },
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
  track: { height: 8, borderRadius: 999, overflow: 'hidden' },
  barFill: { height: '100%', borderRadius: 999 },
  continueText: { flex: 1, flexShrink: 1, gap: 3 },
  round: { width: 48, height: 48, flexShrink: 0, alignItems: 'center', justifyContent: 'center' },
  votdOpen: { gap: 12 },
  votdRef: { minHeight: SHARE_SIZE, justifyContent: 'center', paddingRight: SHARE_SIZE + 12 },
  share: { position: 'absolute', right: 16, bottom: 14, width: SHARE_SIZE, height: SHARE_SIZE, alignItems: 'center', justifyContent: 'center' },
  go: { height: 48, alignItems: 'center', justifyContent: 'center', paddingHorizontal: 16 },
  disabled: { opacity: 0.5 },
});
