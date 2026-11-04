// The frame every trainer sits in: Back and the step counter on top, the step bar, then one scrolling body whose
// last block is the action panel. The whole screen scrolls (at large text nothing overlaps), and the panel rests at
// the bottom when the content is short.
import { createContext, useCallback, useContext, useEffect, useRef, type ComponentRef, type ReactNode } from 'react';
import { KeyboardAvoidingView, Platform, ScrollView, StyleSheet, Text, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ContentColumn, useColumn } from '../../../components/ContentColumn';
import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import { useTheme } from '../../../theme/ThemeProvider';
import type { ChineseScript, LibraryVerse } from '../../types';
import { verseView, type VerseLanguage } from '../../verseLanguage';
import { MemButton } from '../parts';
import { useKeyboardOpen } from './hooks';
import { TrainerIcon } from './icons';
import type { TrainerCtx } from './types';

/** Where the scrolling body keeps the thing that must stay in view above the keyboard (the blank of the fill-in). */
const KeepInViewContext = createContext<(y: number) => void>(() => undefined);

/** Wraps the block that must stay in view above the keyboard (the fill-in's verse, with its blank). */
export function KeepInView({ children }: { children: ReactNode }) {
  const keep = useContext(KeepInViewContext);
  return <View onLayout={(e) => keep(e.nativeEvent.layout.y)}>{children}</View>;
}

/** The body starts this far down the scrolling content. */
const BODY_TOP = 16;

/** The stage name in a small pill. */
export function ChipPill({ label }: { label: string }) {
  const theme = useTheme();
  return (
    <View
      style={[
        styles.pill,
        theme.backgrounds.chip,
        { borderWidth: theme.borders.card.width, borderColor: theme.borders.card.color },
      ]}
    >
      <Text style={{ color: theme.colors.chipText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 12, letterSpacing: 0.6 }}>
        {label}
      </Text>
    </View>
  );
}

/**
 * The reference in the verse language. A Chinese verse in the English interface (only where the verse language is
 * pinned) keeps the English reference under it.
 */
export function RefBlock({ verse, script, language }: { verse: LibraryVerse; script: ChineseScript; language: VerseLanguage }) {
  const theme = useTheme();
  const { locale } = useI18n();
  const view = verseView(verse, language, script);
  return (
    <View style={styles.ref}>
      <Text {...({ lang: view.lang } as object)} style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 18 }}>
        {view.reference}
      </Text>
      {language === 'zh' && locale === 'en' ? (
        <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>{verse.referenceEn}</Text>
      ) : null}
    </View>
  );
}

/** A heading for a step that is not showing a result yet. */
export function StepTitle({ children }: { children: string }) {
  const theme = useTheme();
  return (
    <Text
      accessibilityRole="header"
      style={{
        color: theme.colors.text,
        fontFamily: uiFace(theme.type.head, theme.type.headWeight),
        fontSize: 24,
        lineHeight: 30,
        letterSpacing: -0.4,
      }}
    >
      {children}
    </Text>
  );
}

export function TrainerShell({
  ctx,
  chip,
  children,
  action,
}: {
  ctx: TrainerCtx;
  chip: string;
  children: ReactNode;
  action: ReactNode;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  const insets = useSafeAreaInsets();
  const column = useColumn('lesson', 16);
  const scroll = useRef<ComponentRef<typeof ScrollView>>(null);
  const keyboardOpen = useKeyboardOpen();
  const keepY = useRef<number | null>(null);
  const keep = useCallback((y: number) => {
    keepY.current = y;
  }, []);
  const k = ctx.index === null || ctx.steps === null ? null : ctx.index + 1;

  // With the keyboard up the mic is hidden: keep the blank in view (or, without one, bring the field into view).
  useEffect(() => {
    if (!keyboardOpen) return;
    const id = setTimeout(() => {
      if (keepY.current === null) scroll.current?.scrollToEnd({ animated: true });
      else scroll.current?.scrollTo({ y: Math.max(0, keepY.current + BODY_TOP - 8), animated: true });
    }, 50);
    return () => clearTimeout(id);
  }, [keyboardOpen]);

  const fill = theme.canvas.bar ?? theme.colors.cta;
  return (
    <KeyboardAvoidingView
      testID="memory-trainer"
      style={[styles.fill, theme.backgrounds.app]}
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
    >
      <View style={[styles.header, column, { paddingTop: insets.top + 8 }]}>
        <MemButton
          testID="memory-back"
          kind="secondary"
          label={t('memory.backShort')}
          accessibilityLabel={t('memory.back')}
          onPress={ctx.back}
          icon="back"
        />
        <Text
          testID="memory-step"
          accessibilityLabel={k === null ? t('memory.step.practice') : t('memory.step.aria', { k, n: ctx.steps ?? 0 })}
          style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14, flexShrink: 1, textAlign: 'right' }}
        >
          {k === null ? t('memory.step.practice') : t('memory.step.of', { k, n: ctx.steps ?? 0 })}
        </Text>
      </View>
      {k !== null && ctx.steps !== null ? (
        <View
          accessibilityRole="progressbar"
          accessibilityLabel={t('memory.step.aria', { k, n: ctx.steps })}
          accessibilityValue={{ min: 1, max: ctx.steps, now: k }}
          style={[styles.bar, column]}
        >
          {Array.from({ length: ctx.steps }, (_, i) => (
            <View
              key={i}
              style={[
                styles.segment,
                i < k ? { backgroundColor: fill } : { backgroundColor: theme.colors.track, borderWidth: 1.5, borderColor: theme.colors.muted },
              ]}
            />
          ))}
        </View>
      ) : null}
      <KeepInViewContext.Provider value={keep}>
      <ScrollView
        ref={scroll}
        style={styles.fill}
        keyboardShouldPersistTaps="handled"
        contentContainerStyle={[styles.content, column, { paddingBottom: Math.max(insets.bottom, 12) + 16 }]}
      >
        <View style={styles.body}>
          <ChipPill label={chip} />
          {children}
        </View>
        {column === null ? <View style={styles.grow} /> : null}
        <View testID="memory-action-panel" style={[styles.action, column !== null && { marginTop: 24 }]}>
          {action}
        </View>
      </ScrollView>
      </KeepInViewContext.Provider>
    </KeyboardAvoidingView>
  );
}

/** The not-found state: a way back, never a crash. */
export function NotFound({ onBack }: { onBack(): void }) {
  const theme = useTheme();
  const { t } = useI18n();
  const insets = useSafeAreaInsets();
  return (
    <View testID="memory-not-found" style={[styles.fill, theme.backgrounds.app, { paddingTop: insets.top + 16 }]}>
      <ContentColumn kind="lesson" gutter={16} style={{ gap: 14, paddingHorizontal: 16 }}>
        <StepTitle>{t('memory.notFound.title')}</StepTitle>
        <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 15, lineHeight: 22 }}>
          {t('memory.notFound.body')}
        </Text>
        <MemButton testID="memory-back" kind="primary" block label={t('memory.back')} onPress={onBack} />
      </ContentColumn>
    </View>
  );
}

export { TrainerIcon };

const styles = StyleSheet.create({
  fill: { flex: 1 },
  header: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12, paddingHorizontal: 16 },
  bar: { flexDirection: 'row', gap: 6, paddingHorizontal: 16, paddingTop: 12 },
  segment: { flex: 1, height: 6, borderRadius: 999 },
  content: { flexGrow: 1, paddingHorizontal: 16, paddingTop: 16 },
  body: { gap: 14 },
  grow: { flexGrow: 1, minHeight: 12 },
  action: { gap: 10, alignItems: 'stretch' },
  pill: { alignSelf: 'flex-start', paddingHorizontal: 12, paddingVertical: 4, borderRadius: 999 },
  ref: { gap: 1 },
});
