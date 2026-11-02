// The per-character diff the grader's own alignment produced (`displayDiff`), drawn in the theme's colours. A mark is
// told by shape as well as colour: a sound-alike is dotted-underlined, a different character is highlighted and
// underlined with the heard character beside it, a missed one is dashed and muted, an extra one is struck through.
import type { ReactNode } from 'react';
import { StyleSheet, Text, View, type TextStyle } from 'react-native';

import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import { useTheme } from '../../../theme/ThemeProvider';
import type { Theme } from '../../../theme/types';
import type { DiffOp, DisplayDiff } from '../../display/diff';

/** The character the legend draws each mark on. */
const SAMPLE = '人';

type Kind = 'ok' | 'alike' | 'wrong' | 'miss' | 'extra';

function markStyle(theme: Theme, kind: Kind): TextStyle {
  switch (kind) {
    case 'alike':
      return { textDecorationLine: 'underline', textDecorationStyle: 'dotted', textDecorationColor: theme.colors.text };
    case 'wrong':
      return {
        backgroundColor: theme.colors.hl,
        color: theme.colors.hlText,
        fontWeight: '700',
        textDecorationLine: 'underline',
        textDecorationColor: theme.colors.text,
      };
    case 'miss':
      return { color: theme.colors.muted, textDecorationLine: 'underline', textDecorationStyle: 'dashed', textDecorationColor: theme.colors.muted };
    case 'extra':
      return { textDecorationLine: 'line-through', textDecorationColor: theme.colors.text, fontSize: 14 };
    default:
      return {};
  }
}

/** The sound-alike pairs of a diff, in order: the expected character and the character heard in its place. */
export function alikePairs(ops: readonly DiffOp[]): { char: string; heard: string }[] {
  const pairs: { char: string; heard: string }[] = [];
  for (const op of ops) {
    if (op.kind === 'match' && op.heard !== op.char && !pairs.some((p) => p.char === op.char && p.heard === op.heard)) {
      pairs.push({ char: op.char, heard: op.heard });
    }
  }
  return pairs;
}

/** The diff's characters as nested text, so it can sit inline in a verse. */
export function DiffText({
  diff,
  font,
  size = 22,
  testID = 'memory-diff',
  lang = 'zh-Hans',
}: {
  diff: DisplayDiff;
  font: string | undefined;
  size?: number;
  testID?: string;
  lang?: string;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  const label = t('memory.res.diffAria', {
    ok: diff.counts.ok,
    alike: diff.counts.alike,
    wrong: diff.counts.wrong,
    miss: diff.counts.miss,
    extra: diff.counts.extra,
  });
  const nodes: ReactNode[] = diff.ops.map((op, i) => {
    switch (op.kind) {
      case 'match':
        return (
          <Text key={i} style={op.heard !== op.char ? markStyle(theme, 'alike') : undefined}>
            {op.char}
          </Text>
        );
      case 'sub':
        return (
          <Text key={i} style={markStyle(theme, 'wrong')}>
            {op.char}
            <Text style={{ fontSize: 13, fontWeight: '700' }}>{op.heard}</Text>
          </Text>
        );
      case 'del':
        return (
          <Text key={i} style={markStyle(theme, 'miss')}>
            {op.char}
          </Text>
        );
      case 'ins':
        return (
          <Text key={i} style={markStyle(theme, 'extra')}>
            {op.heard}
          </Text>
        );
      default:
        return <Text key={i}>{op.char}</Text>;
    }
  });
  return (
    <Text
      testID={testID}
      accessible
      accessibilityRole="image"
      accessibilityLabel={label}
      {...({ lang } as object)}
      style={{ color: theme.colors.text, fontFamily: font, fontSize: size, lineHeight: Math.round(size * 1.75) }}
    >
      {nodes}
    </Text>
  );
}

/** What the marks mean, drawn with the same marks. */
export function Legend() {
  const theme = useTheme();
  const { t } = useI18n();
  const items: { kind: Kind; label: string }[] = [
    { kind: 'ok', label: t('memory.res.legendOk') },
    { kind: 'alike', label: t('memory.res.legendAlike') },
    { kind: 'wrong', label: t('memory.res.legendWrong') },
    { kind: 'miss', label: t('memory.res.legendMiss') },
    { kind: 'extra', label: t('memory.res.legendExtra') },
  ];
  return (
    <View testID="memory-legend" style={styles.legend}>
      {items.map((item) => (
        <View key={item.kind} style={styles.legendItem}>
          <Text accessible={false} style={[{ color: theme.colors.text, fontSize: 16 }, markStyle(theme, item.kind)]}>
            {SAMPLE}
          </Text>
          <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 12 }}>{item.label}</Text>
        </View>
      ))}
    </View>
  );
}

/** "路 heard as 露: they sound the same, so it counts", when any match was a sound-alike. */
export function AlikeNote({ ops }: { ops: readonly DiffOp[] }) {
  const theme = useTheme();
  const { t } = useI18n();
  const pairs = alikePairs(ops);
  if (pairs.length === 0) return null;
  const list = pairs.map((p) => t('memory.res.alikePair', p)).join(t('memory.res.alikeJoin'));
  return (
    <Text
      testID="memory-alike-note"
      style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, lineHeight: 19 }}
    >
      {t('memory.res.alikeNote', { pairs: list })}
    </Text>
  );
}

const styles = StyleSheet.create({
  legend: { flexDirection: 'row', flexWrap: 'wrap', columnGap: 14, rowGap: 6 },
  legendItem: { flexDirection: 'row', alignItems: 'center', gap: 5 },
});
