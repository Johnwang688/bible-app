// The Customise controls: light or dark, accent, reading font and text size. Each builds the
// next value from the current one with src/theme/custom.ts and writes it through the hooks.
import { StyleSheet, Text, View } from 'react-native';

import { scriptureFace, uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { buttonStyle } from '../../reader/components/ui';
import { TEXT_SIZES } from '../../storage/keys';
import {
  ACCENT_CHOICES,
  ACCENT_STAND_IN,
  accentAllowed,
  editedAccent,
  SCRIPTURE_FONTS,
  setAccent,
} from '../../theme/custom';
import { getTheme } from '../../theme/presets';
import { useAppearance, useTheme } from '../../theme/ThemeProvider';
import type { ModePreference } from '../../theme/types';
import { CustomisePressable } from './CustomisePressable';

const MODES: readonly ModePreference[] = ['light', 'dark', 'system'];
const MINUS = '−';
const PLUS = '+';

export function CustomiseModes() {
  const theme = useTheme();
  const { t } = useI18n();
  const { choice, setChoice } = useAppearance();
  return (
    <View style={styles.column} accessibilityRole="radiogroup">
      {MODES.map((mode) => {
        const on = choice.mode === mode;
        return (
          <CustomisePressable
            key={mode}
            testID={`customise-mode-${mode}`}
            role="radio"
            label={t(`mode.${mode}`)}
            selected={on}
            onPress={() => setChoice({ preset: choice.preset, mode })}
            style={[
              on ? { backgroundColor: theme.colors.cta, borderRadius: theme.radii.button } : buttonStyle(theme),
              styles.option,
            ]}
          >
            <Text
              style={{
                color: on ? theme.colors.onCta : theme.colors.btnText,
                fontFamily: uiFace(theme.type.ui, '700'),
                fontSize: 14,
                textAlign: 'center',
              }}
            >
              {t(`mode.${mode}`)}
            </Text>
          </CustomisePressable>
        );
      })}
    </View>
  );
}

interface AccentOption {
  id: string;
  color: string;
  labelKey: MessageKey;
  fixed: boolean;
}

export function CustomiseAccents() {
  const theme = useTheme();
  const { t } = useI18n();
  const { presetId, custom, setCustom } = useAppearance();
  const own = getTheme(presetId).colors.accent;
  const current = editedAccent(custom, presetId);
  const options: AccentOption[] = [
    { id: 'preset', color: own, labelKey: 'customise.accent.preset', fixed: false },
    ...ACCENT_CHOICES.map((a): AccentOption =>
      // A fixed choice that repeats the preset's own accent shows as Slate instead.
      a.color.toLowerCase() === own.toLowerCase()
        ? { id: 'slate', color: ACCENT_STAND_IN, labelKey: 'customise.accent.slate', fixed: true }
        : { id: a.id, color: a.color, labelKey: `customise.accent.${a.id}`, fixed: true },
    ),
  ];
  return (
    <View style={styles.accentRow} accessibilityRole="radiogroup">
      {options.map((o) => {
        const on = o.fixed ? current !== null && current.toLowerCase() === o.color.toLowerCase() : current === null;
        const label = t(o.labelKey);
        const blocked = o.fixed && !accentAllowed(custom, presetId, o.color);
        return (
          <CustomisePressable
            key={o.id}
            testID={`customise-accent-${o.id}`}
            role="radio"
            label={blocked ? t('customise.accent.blocked', { colour: label }) : label}
            selected={on}
            disabled={blocked}
            onPress={() => {
              const result = setAccent(custom, presetId, o.fixed ? o.color : null);
              if (result.ok) setCustom(result.custom);
            }}
            style={[styles.dot, { backgroundColor: o.color, borderColor: on ? theme.colors.text : theme.colors.base }]}
          />
        );
      })}
    </View>
  );
}

export function CustomiseFonts() {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const { custom, setCustom } = useAppearance();
  return (
    <View style={styles.column}>
      <View style={styles.fontRow} accessibilityRole="radiogroup">
        {SCRIPTURE_FONTS.map((font) => {
          const on = theme.type.scripture === font;
          return (
            <CustomisePressable
              key={font}
              testID={`customise-font-${font}`}
              role="radio"
              label={t(`font.${font}`)}
              selected={on}
              onPress={() => setCustom({ ...custom, scriptureFont: font })}
              style={[
                buttonStyle(theme),
                styles.font,
                { borderWidth: on ? 2 : 1, borderColor: on ? theme.colors.accent : theme.colors.muted },
              ]}
            >
              <Text style={{ color: theme.colors.btnText, fontFamily: scriptureFace(font), fontSize: 17, textAlign: 'center' }}>
                {t(`font.${font}`)}
              </Text>
            </CustomisePressable>
          );
        })}
      </View>
      {locale === 'zh-Hans' ? (
        <Text testID="customise-font-note" style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13 }}>
          {t('customise.font.zhNote')}
        </Text>
      ) : null}
    </View>
  );
}

export function CustomiseSize({ textSize, onChange }: { textSize: number; onChange(index: number): void }) {
  const theme = useTheme();
  const { t, formatNumber } = useI18n();
  const last = TEXT_SIZES.length - 1;
  return (
    <View style={styles.sizeRow}>
      <CustomiseStep
        testID="customise-size-smaller"
        label={t('customise.size.smaller')}
        glyph={MINUS}
        disabled={textSize <= 0}
        onPress={() => onChange(Math.max(0, textSize - 1))}
      />
      <Text
        testID="customise-size-value"
        style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 16, minWidth: 28, textAlign: 'center' }}
      >
        {formatNumber(TEXT_SIZES[textSize] ?? TEXT_SIZES[0])}
      </Text>
      <CustomiseStep
        testID="customise-size-larger"
        label={t('customise.size.larger')}
        glyph={PLUS}
        disabled={textSize >= last}
        onPress={() => onChange(Math.min(last, textSize + 1))}
      />
    </View>
  );
}

function CustomiseStep(props: { testID: string; label: string; glyph: string; disabled: boolean; onPress(): void }) {
  const theme = useTheme();
  return (
    <CustomisePressable
      testID={props.testID}
      role="button"
      label={props.label}
      disabled={props.disabled}
      onPress={props.onPress}
      style={[buttonStyle(theme), styles.step]}
    >
      <Text style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 20 }}>{props.glyph}</Text>
    </CustomisePressable>
  );
}

const styles = StyleSheet.create({
  column: { gap: 8 },
  option: { justifyContent: 'center', paddingHorizontal: 8, minHeight: 44 },
  accentRow: { flexDirection: 'row', flexWrap: 'wrap', justifyContent: 'space-between', gap: 8 },
  dot: { width: 44, height: 44, borderRadius: 22, borderWidth: 3 },
  fontRow: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  font: { flex: 1, minWidth: 120, minHeight: 50, justifyContent: 'center', paddingHorizontal: 8 },
  sizeRow: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  step: { alignItems: 'center', justifyContent: 'center' },
});
