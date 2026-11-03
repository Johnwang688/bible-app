// Advanced (R-6a): every colour token the showing preset can edit, one row each. An edit is
// applied only if custom.ts accepts it; a refusal (Apply or Reset) says why and nothing is stored.
import { useState } from 'react';
import { Text } from 'react-native';

import { uiFace } from '../fonts/fonts';
import { useI18n } from '../i18n/I18nProvider';
import { ACCENT_CHOICES, editableTokens, setTokenEdit, type ColorToken, type EditResult } from '../theme/custom';
import { useAppearance, useTheme } from '../theme/ThemeProvider';
import { AdvancedTokenRow } from './components/AdvancedTokenRow';
import { CustomiseFrame } from './components/CustomiseFrame';

const EXAMPLE_COLOUR = ACCENT_CHOICES[0].color;

export function AdvancedScreen(props: { onBack(): void }) {
  const theme = useTheme();
  const { t, formatNumber } = useI18n();
  const { presetId, custom, updateCustom, showingPresetId } = useAppearance();
  // What the reader has typed but not applied, and the last refusal, per token.
  const [drafts, setDrafts] = useState<Partial<Record<ColorToken, string>>>({});
  const [errors, setErrors] = useState<Partial<Record<ColorToken, string>>>({});

  // One edit (a colour, or null to reset), built from the stored value and the preset showing at
  // the moment of the press. Only an applied write clears the row; a refusal keeps or shows its error.
  const edit = (token: ColorToken, value: string | null) => {
    const id = showingPresetId();
    let result: EditResult | undefined;
    updateCustom((current) => {
      result = setTokenEdit(current, id, token, value);
      return result.ok ? result.custom : null;
    });
    if (!result) return;
    if (result.ok) {
      setDrafts((d) => omit(d, token));
      setErrors((e) => omit(e, token));
      return;
    }
    const message =
      result.reason === 'contrast'
        ? t('advanced.error.contrast', {
            count: result.failures.length,
            ratio: formatNumber(Math.min(...result.failures.map((f) => f.ratio)), { maximumFractionDigits: 2 }),
          })
        : t('advanced.error.invalid', { example: EXAMPLE_COLOUR });
    setErrors((e) => ({ ...e, [token]: message }));
  };

  const edits = custom.edits[presetId] ?? {};
  return (
    <CustomiseFrame
      testID="screen-advanced"
      backTestID="advanced-back"
      titleKey="advanced.title"
      backLabelKey="customise.title"
      onBack={props.onBack}
    >
      <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 20 }}>
        {t('advanced.intro', { preset: t(`preset.${presetId}`) })}
      </Text>
      {editableTokens(presetId).map((token) => (
        <AdvancedTokenRow
          key={token}
          token={token}
          value={theme.canvas[token] ?? ''}
          draft={drafts[token]}
          error={errors[token]}
          edited={edits[token] !== undefined}
          onDraft={(text) => setDrafts((d) => ({ ...d, [token]: text }))}
          onApply={(text) => edit(token, text)}
          onReset={() => edit(token, null)}
        />
      ))}
    </CustomiseFrame>
  );
}

function omit<T extends object>(obj: T, key: keyof T): T {
  const next = { ...obj };
  delete next[key];
  return next;
}
