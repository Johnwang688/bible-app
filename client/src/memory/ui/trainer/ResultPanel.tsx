// The pieces of a step's result that every trainer shares: the verdict and the percentage in one polite live
// region (the heading takes focus when the result appears), the note after a pass with a hint, and the buttons.
import { useEffect, useRef, type ComponentRef } from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import { useTheme } from '../../../theme/ThemeProvider';
import { programmaticFocus, useFocusNodeSoon } from '../../../reader/components/a11y';
import { MemButton } from '../parts';
import { TrainerIcon } from './icons';

export type Verdict = 'pass' | 'fail' | 'hint-pass';

/** The heading and the percentage, as one polite live region; focus moves to the heading when it appears. */
export function ResultHeader({ verdict, pct, caption, detail }: { verdict: Verdict; pct: string; caption?: string; detail?: string }) {
  const theme = useTheme();
  const { t } = useI18n();
  const heading = useRef<ComponentRef<typeof Text>>(null);
  const focusSoon = useFocusNodeSoon();
  useEffect(() => {
    focusSoon(heading.current);
  }, [focusSoon]);
  const title = t(verdict === 'pass' ? 'memory.res.pass' : verdict === 'fail' ? 'memory.res.fail' : 'memory.res.hintPass');
  return (
    <View
      testID="memory-result"
      role="status"
      aria-live="polite"
      accessibilityLiveRegion="polite"
      style={styles.header}
    >
      <Text
        ref={heading}
        testID="memory-result-title"
        accessibilityRole="header"
        {...programmaticFocus}
        style={[
          styles.title,
          { color: theme.colors.text, fontFamily: uiFace(theme.type.head, theme.type.headWeight) },
        ]}
      >
        {title}
      </Text>
      <View style={styles.pct}>
        <Text
          testID="memory-result-pct"
          style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 34, lineHeight: 38 }}
        >
          {pct}
        </Text>
        <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
          {caption ?? t('memory.res.match')}
        </Text>
      </View>
      {detail ? (
        <Text testID="memory-result-detail" style={[styles.detail, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }]}>
          {detail}
        </Text>
      ) : null}
    </View>
  );
}

/** A line of muted help text. */
export function Note({ children, testID, center = false }: { children: string; testID?: string; center?: boolean }) {
  const theme = useTheme();
  return (
    <Text
      testID={testID}
      style={{
        color: theme.colors.muted,
        fontFamily: uiFace(theme.type.ui, '400'),
        fontSize: 13,
        lineHeight: 19,
        textAlign: center ? 'center' : undefined,
      }}
    >
      {children}
    </Text>
  );
}

/** "You used a hint, so this step isn't done yet…": a bold line with an icon, not a card. */
export function HintPassNote() {
  const theme = useTheme();
  const { t } = useI18n();
  return (
    <View role="note" style={styles.hintPass}>
      <View style={styles.hintIcon}>
        <TrainerIcon name="info" color={theme.colors.accent} size={18} />
      </View>
      <Text style={{ flex: 1, color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14, lineHeight: 20 }}>
        {t('memory.res.hintPassBody')}
      </Text>
    </View>
  );
}

/**
 * The buttons under a fill-in or recall result. A clean pass: Next. A pass with a hint: Again without the hint.
 * A fail: Try again (and, after a voice answer, "Heard differently? Type it"). Skip leaves the step for later.
 */
export function ResultActions({
  verdict,
  fromVoice,
  onNext,
  onTryAgain,
  onHintAgain,
  onSkip,
  onHeardDifferently,
}: {
  verdict: Verdict;
  fromVoice: boolean;
  onNext(): void;
  onTryAgain(): void;
  onHintAgain(): void;
  onSkip(): void;
  onHeardDifferently(): void;
}) {
  const { t } = useI18n();
  if (verdict === 'pass') {
    return <MemButton testID="memory-next" kind="primary" block label={t('memory.res.next')} onPress={onNext} />;
  }
  return (
    <>
      {verdict === 'hint-pass' ? (
        <MemButton testID="memory-hint-again" kind="primary" block label={t('memory.res.hintAgain')} onPress={onHintAgain} />
      ) : (
        <>
          <MemButton testID="memory-try-again" kind="primary" block label={t('memory.res.tryAgain')} onPress={onTryAgain} />
          {fromVoice ? (
            <MemButton testID="memory-heard-differently" kind="ghost" block label={t('memory.res.heardDifferently')} onPress={onHeardDifferently} />
          ) : null}
        </>
      )}
      <MemButton testID="memory-skip" kind="ghost" block label={t('memory.res.skip')} onPress={onSkip} />
      <Note center>{t('memory.res.stays')}</Note>
    </>
  );
}

const styles = StyleSheet.create({
  header: { flexDirection: 'row', flexWrap: 'wrap', alignItems: 'center', justifyContent: 'space-between', gap: 12 },
  title: { fontSize: 26, lineHeight: 32, letterSpacing: -0.4, flexShrink: 1 },
  pct: { flexDirection: 'row', alignItems: 'baseline', gap: 8 },
  detail: { width: '100%', fontSize: 14, lineHeight: 20 },
  hintPass: { flexDirection: 'row', alignItems: 'flex-start', gap: 8 },
  hintIcon: { marginTop: 1 },
});
