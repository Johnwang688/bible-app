// Trainer 1: put the phrases in order. Slots are buttons that send their phrase back to the pool; Check grades the
// order. A wrong order keeps the right slots (ticked) and marks the others; "Show me the order" reveals it, then the
// reader places the shown ones themselves. Skip is offered from the start.
import { useRef, useState } from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import { useTheme } from '../../../theme/ThemeProvider';
import { gradeStep } from '../../grading';
import { verseView } from '../../verseLanguage';
import { MemButton } from '../parts';
import { ScriptureNotice } from '../ScriptureNotice';
import { useVerseFont } from '../useVerseFont';
import { TrainerIcon } from './icons';
import { Note, ResultHeader } from './ResultPanel';
import { RefBlock, StepTitle, TrainerShell } from './TrainerShell';
import { useEnterCheck } from './useEnterCheck';
import type { TrainerCtx } from './types';

type Mode = 'play' | 'wrong' | 'right' | 'shown';

interface State {
  mode: Mode;
  /** Slot -> canonical position of the phrase placed there, or null. */
  slots: (number | null)[];
  /** The phrases still to place, as canonical positions, in the order they are drawn. */
  pool: number[];
  /** Slots whose phrase is right and stays put. */
  fixed: boolean[];
  /** Slots that were wrong and are now showing the right phrase. */
  shown: number[];
}

/** A shuffle that is never already in order when there are two or more (the answer is ascending). */
export function shuffled(ids: readonly number[], random: () => number): number[] {
  const out = [...ids];
  for (let i = out.length - 1; i > 0; i--) {
    const j = Math.min(i, Math.floor(random() * (i + 1)));
    [out[i], out[j]] = [out[j]!, out[i]!];
  }
  if (out.length > 1 && out.every((v, i) => i === 0 || out[i - 1]! < v)) out.push(out.shift()!);
  return out;
}

export function ChunkOrderTrainer({ ctx }: { ctx: TrainerCtx }) {
  const theme = useTheme();
  const { t } = useI18n();
  const font = useVerseFont(ctx.language);
  const { verse } = ctx;
  // The phrases in the verse language (English chunks are their own; their count may differ from the Chinese).
  const { chunks, lang } = verseView(verse, ctx.language, ctx.script);
  const n = chunks.length;

  const [state, setState] = useState<State>(() => ({
    mode: 'play',
    slots: Array.from({ length: n }, () => null),
    pool: shuffled(
      Array.from({ length: n }, (_, i) => i),
      ctx.random,
    ),
    fixed: Array.from({ length: n }, () => false),
    shown: [],
  }));
  // The live state. Every action reads and writes this synchronously, so a press queued behind another acts on what
  // that one left, not on the render its handler came from; `setState` only renders it. The mode doubles as the
  // "already checked" guard: Check leaves 'play' at once, so a second queued Check finds nothing to grade.
  const live = useRef(state);
  const commit = (next: State) => {
    live.current = next;
    setState(next);
  };

  const filled = state.slots.filter((s) => s !== null).length;
  const right = state.slots.reduce<number>((k, c, i) => k + (c === i ? 1 : 0), 0);

  const place = (c: number) => {
    const s = live.current;
    if (s.mode !== 'play' || !s.pool.includes(c)) return;
    const at = s.slots.indexOf(null);
    if (at < 0) return;
    const slots = [...s.slots];
    slots[at] = c;
    commit({ ...s, slots, pool: s.pool.filter((x) => x !== c) });
  };

  const unplace = (i: number) => {
    const s = live.current;
    const c = s.slots[i];
    if (s.mode !== 'play' || s.fixed[i] || c === null || c === undefined || s.pool.includes(c)) return;
    const slots = [...s.slots];
    slots[i] = null;
    commit({ ...s, slots, pool: [...s.pool, c] });
  };

  const check = () => {
    const s = live.current;
    // Skip (or Back) pressed first in the same act left the step: read synchronously, not from a re-render.
    if (ctx.left.aborted) return;
    if (s.mode !== 'play' || s.slots.some((c) => c === null)) return;
    const order = s.slots as number[];
    const verdict = gradeStep(verse.id, 'chunk-order', { kind: 'chunk-order', order }, undefined, ctx.language);
    // Commit before recording, so anything the record triggers already sees the graded state.
    commit({ ...s, mode: verdict.passed ? 'right' : 'wrong' });
    ctx.record(verdict.passed);
  };

  useEnterCheck(state.mode === 'play' && filled === n, check);

  const retryMarked = () => {
    const s = live.current;
    if (s.mode !== 'wrong') return;
    const bad = s.slots.map((c, i) => (c === i ? -1 : i)).filter((i) => i >= 0);
    const slots = [...s.slots];
    const back: number[] = [];
    for (const i of bad) {
      back.push(slots[i]!);
      slots[i] = null;
    }
    commit({ ...s, mode: 'play', slots, pool: shuffled(back, ctx.random), fixed: s.slots.map((c, i) => c === i), shown: [] });
  };

  const showOrder = () => {
    const s = live.current;
    if (s.mode !== 'wrong') return;
    commit({
      ...s,
      mode: 'shown',
      shown: s.slots.map((c, i) => (c === i ? -1 : i)).filter((i) => i >= 0),
      slots: Array.from({ length: n }, (_, i) => i),
      pool: [],
    });
  };

  const placeMyself = () => {
    const s = live.current;
    if (s.mode !== 'shown') return;
    const slots = [...s.slots];
    for (const i of s.shown) slots[i] = null;
    commit({
      ...s,
      mode: 'play',
      slots,
      pool: shuffled(s.shown, ctx.random),
      fixed: slots.map((c) => c !== null),
      shown: [],
    });
  };

  const { mode } = state;
  const okColor = theme.canvas.bar ?? theme.colors.cta;

  const slotViews = state.slots.map((c, i) => {
    const num = i + 1;
    const testID = `chunk-slot-${i}`;
    if (c === null) {
      return (
        <View
          key={i}
          testID={testID}
          accessible
          accessibilityRole="text"
          accessibilityLabel={t('memory.order.slotEmpty', { n: num })}
          style={[styles.slot, { borderWidth: 2, borderStyle: 'dashed', borderColor: theme.colors.muted, borderRadius: theme.radii.button }]}
        >
          <View style={[styles.badge, { borderWidth: 0 }]}>
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14 }}>{num}</Text>
          </View>
        </View>
      );
    }
    const kind: 'plain' | 'ok' | 'wrong' | 'shown' =
      mode === 'wrong' ? (c === i ? 'ok' : 'wrong') : mode === 'right' ? 'ok' : mode === 'shown' ? (state.shown.includes(i) ? 'shown' : 'ok') : state.fixed[i] ? 'ok' : 'plain';
    const locked = kind !== 'plain';
    const phrase = chunks[c]!;
    const labelKey =
      kind === 'ok' ? 'memory.order.slotRight' : kind === 'wrong' ? 'memory.order.slotWrong' : kind === 'shown' ? 'memory.order.slotShown' : 'memory.order.slotPlain';
    const frame =
      kind === 'wrong'
        ? { borderWidth: 3, borderColor: theme.colors.accent, backgroundColor: theme.colors.hl }
        : kind === 'shown'
          ? { borderWidth: 2, borderStyle: 'dashed' as const, borderColor: theme.colors.accent, ...theme.backgrounds.surface }
          : { borderWidth: theme.borders.card.width, borderColor: theme.borders.card.color, ...theme.backgrounds.surface };
    const badgeBg = kind === 'wrong' || kind === 'shown' ? theme.colors.accent : okColor;
    const badgeInk = theme.colors.onAccent;
    const pressable = (
      <Pressable
        key={i}
        testID={testID}
        accessibilityRole="button"
        accessibilityLabel={t(labelKey, { n: num, phrase })}
        accessibilityState={{ disabled: locked }}
        disabled={locked}
        onPress={() => unplace(i)}
        style={[styles.slot, frame, { borderRadius: theme.radii.button }]}
      >
        <View style={[styles.badge, { backgroundColor: badgeBg }]}>
          {kind === 'ok' ? (
            <TrainerIcon name="check" color={badgeInk} size={18} strokeWidth={2.8} />
          ) : kind === 'wrong' ? (
            <TrainerIcon name="x" color={badgeInk} size={18} strokeWidth={2.8} />
          ) : kind === 'shown' ? (
            <TrainerIcon name="eye" color={badgeInk} size={18} strokeWidth={2.2} />
          ) : (
            <Text style={{ color: badgeInk, fontFamily: uiFace(theme.type.ui, '800'), fontSize: 14 }}>{num}</Text>
          )}
        </View>
        <Text
          {...({ lang } as object)}
          style={{
            flex: 1,
            color: theme.colors.text,
            fontFamily: font,
            fontSize: 17,
            lineHeight: 24,
            textDecorationLine: kind === 'wrong' ? 'underline' : 'none',
          }}
        >
          {phrase}
        </Text>
      </Pressable>
    );
    if (kind !== 'shown') return pressable;
    return (
      <View key={i} style={styles.shownRow}>
        <View style={styles.grow}>{pressable}</View>
        <View style={[styles.tag, { borderColor: theme.colors.accent }]}>
          <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 11, textTransform: 'uppercase' }}>
            {t('memory.order.shownTag')}
          </Text>
        </View>
      </View>
    );
  });

  const status =
    mode === 'wrong' ? t('memory.order.wrongMsg', { k: right, n }) : mode === 'right' ? t('memory.order.rightMsg') : mode === 'shown' ? t('memory.order.shownNote') : t('memory.order.slotHint');

  const header =
    mode === 'play' ? (
      <StepTitle>{t('memory.trainer.ordering')}</StepTitle>
    ) : mode === 'shown' ? (
      <StepTitle>{t('memory.order.shownTitle')}</StepTitle>
    ) : (
      <ResultHeader verdict={mode === 'right' ? 'pass' : 'fail'} pct={`${mode === 'right' ? n : right} / ${n}`} caption={t('memory.order.inPlace')} />
    );

  const action =
    mode === 'wrong' ? (
      <>
        <MemButton testID="chunk-retry-marked" kind="primary" block label={t('memory.order.tryMarked')} onPress={retryMarked} />
        <MemButton testID="chunk-show-order" kind="secondary" block label={t('memory.order.showOrder')} onPress={showOrder} />
        <MemButton testID="memory-skip" kind="ghost" block label={t('memory.res.skip')} onPress={ctx.skip} />
        <Note center>{t('memory.res.stays')}</Note>
      </>
    ) : mode === 'shown' ? (
      <>
        <MemButton testID="chunk-place-myself" kind="primary" block label={t('memory.order.placeMyself')} onPress={placeMyself} />
        <MemButton testID="memory-skip" kind="ghost" block label={t('memory.res.skip')} onPress={ctx.skip} />
      </>
    ) : mode === 'right' ? (
      <MemButton testID="memory-next" kind="primary" block label={t('memory.res.next')} onPress={ctx.next} />
    ) : (
      <>
        <MemButton testID="chunk-check" kind="primary" block disabled={filled < n} label={t('memory.type.check')} onPress={check} />
        <MemButton testID="memory-skip" kind="ghost" block label={t('memory.res.skip')} onPress={ctx.skip} />
      </>
    );

  return (
    <TrainerShell ctx={ctx} chip={t('memory.kind.ordering')} action={action}>
      {header}
      <RefBlock verse={verse} script={ctx.script} language={ctx.language} />
      <Text
        role="status"
        aria-live="polite"
        style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, lineHeight: 19 }}
      >
        {status}
        {mode === 'play' ? <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') }}>{` ${t('memory.order.placed', { k: filled, n })}`}</Text> : null}
      </Text>
      <View accessibilityRole="list" accessibilityLabel={t('memory.order.slots')} style={styles.slots}>
        {slotViews}
      </View>
      {mode === 'play' && state.pool.length > 0 ? (
        <View accessibilityRole="list" accessibilityLabel={t('memory.order.phrases')} style={styles.pool}>
          {state.pool.map((c) => (
            <Pressable
              key={c}
              testID={`chunk-chip-${c}`}
              accessibilityRole="button"
              accessibilityLabel={chunks[c]}
              onPress={() => place(c)}
              style={({ pressed }) => [
                styles.chip,
                theme.backgrounds.chip,
                { borderRadius: theme.radii.button, borderWidth: theme.borders.card.width, borderColor: theme.borders.card.color, opacity: pressed ? 0.8 : 1 },
              ]}
            >
              <Text {...({ lang } as object)} style={{ color: theme.colors.chipText, fontFamily: font, fontSize: 17, lineHeight: 24 }}>
                {chunks[c]}
              </Text>
            </Pressable>
          ))}
        </View>
      ) : null}
      <ScriptureNotice language={ctx.language} />
    </TrainerShell>
  );
}

const styles = StyleSheet.create({
  slots: { gap: 8 },
  slot: { minHeight: 52, flexDirection: 'row', alignItems: 'center', gap: 12, paddingVertical: 6, paddingLeft: 8, paddingRight: 14 },
  badge: { width: 32, height: 32, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  shownRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  grow: { flex: 1, minWidth: 0 },
  tag: { borderWidth: 1.5, borderRadius: 999, paddingHorizontal: 8, paddingVertical: 2 },
  pool: { flexDirection: 'row', flexWrap: 'wrap', gap: 8, paddingTop: 4 },
  chip: { minHeight: 48, paddingHorizontal: 16, paddingVertical: 6, justifyContent: 'center', maxWidth: '100%' },
});
