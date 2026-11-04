// One row of Advanced: a swatch of the current value, the token's name, a hex field with Apply,
// and, when the token is edited, an "Edited" badge with a reset.
import { Platform, StyleSheet, Text, TextInput, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import { buttonStyle } from '../../reader/components/ui';
import type { ColorToken } from '../../theme/custom';
import { useTheme } from '../../theme/ThemeProvider';
import { CustomisePressable } from './CustomisePressable';

export function AdvancedTokenRow({
  token,
  value,
  draft,
  error,
  edited,
  onDraft,
  onApply,
  onReset,
}: {
  token: ColorToken;
  /** The token's current colour in the showing theme. */
  value: string;
  /** What the reader has typed and not applied yet. */
  draft: string | undefined;
  error: string | undefined;
  edited: boolean;
  onDraft(text: string): void;
  onApply(text: string): void;
  onReset(): void;
}) {
  const theme = useTheme();
  const { t } = useI18n();
  const label = t(`advanced.token.${token}`);
  const shown = draft ?? value;
  const regular = uiFace(theme.type.ui, '400');
  const bold = uiFace(theme.type.ui, '700');
  return (
    <View
      testID={`advanced-token-${token}`}
      style={[
        styles.row,
        { backgroundColor: theme.colors.base, borderColor: theme.colors.muted, borderRadius: theme.radii.button },
      ]}
    >
      <View style={styles.head}>
        <View style={[styles.swatch, { backgroundColor: value, borderColor: theme.colors.muted }]} />
        <Text style={[styles.name, { color: theme.colors.text, fontFamily: bold }]}>{label}</Text>
        {edited ? (
          <Text
            testID={`advanced-edited-${token}`}
            style={[styles.badge, { color: theme.colors.onAccent, backgroundColor: theme.colors.accent, fontFamily: bold }]}
          >
            {t('advanced.edited')}
          </Text>
        ) : null}
      </View>
      <View style={styles.entry}>
        <TextInput
          testID={`advanced-input-${token}`}
          accessibilityLabel={t('advanced.input.a11y', { token: label, value })}
          value={shown}
          onChangeText={onDraft}
          onSubmitEditing={() => onApply(shown)}
          autoCapitalize="none"
          autoCorrect={false}
          spellCheck={false}
          style={[
            styles.input,
            Platform.OS === 'web' && { outlineColor: theme.colors.accent },
            {
              color: theme.colors.text,
              borderColor: error ? theme.colors.text : theme.colors.muted,
              borderWidth: error ? 2 : 1,
              borderRadius: theme.radii.button,
              fontFamily: regular,
            },
          ]}
        />
        <CustomisePressable
          testID={`advanced-apply-${token}`}
          role="button"
          label={t('advanced.apply')}
          onPress={() => onApply(shown)}
          style={[{ backgroundColor: theme.colors.cta, borderRadius: theme.radii.button }, styles.button]}
        >
          <Text style={{ color: theme.colors.onCta, fontFamily: bold, fontSize: 14 }}>{t('advanced.apply')}</Text>
        </CustomisePressable>
      </View>
      {error ? (
        <Text
          testID={`advanced-error-${token}`}
          role="alert"
          accessibilityLiveRegion="polite"
          style={{ color: theme.colors.text, fontFamily: bold, fontSize: 13 }}
        >
          {error}
        </Text>
      ) : null}
      {edited ? (
        <CustomisePressable
          testID={`advanced-reset-${token}`}
          role="button"
          label={t('advanced.resetToken.a11y', { token: label })}
          onPress={onReset}
          style={[buttonStyle(theme), styles.button, styles.reset]}
        >
          <Text style={{ color: theme.colors.btnText, fontFamily: bold, fontSize: 14 }}>{t('advanced.resetToken')}</Text>
        </CustomisePressable>
      ) : null}
    </View>
  );
}

const styles = StyleSheet.create({
  row: { padding: 12, gap: 10, borderWidth: StyleSheet.hairlineWidth },
  head: { flexDirection: 'row', alignItems: 'center', gap: 10, flexWrap: 'wrap' },
  swatch: { width: 32, height: 32, borderRadius: 10, borderWidth: 1 },
  name: { flexShrink: 1, fontSize: 15 },
  badge: { fontSize: 11, paddingHorizontal: 8, paddingVertical: 2, borderRadius: 999, overflow: 'hidden' },
  entry: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  input: { flex: 1, minWidth: 0, minHeight: 44, paddingHorizontal: 12, fontSize: 15 },
  button: { minHeight: 44, paddingHorizontal: 16, alignItems: 'center', justifyContent: 'center' },
  reset: { alignSelf: 'flex-start' },
});
