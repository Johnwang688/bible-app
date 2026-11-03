// Customise (R-6a): the live preview, the look (12 presets), light or dark, accent, reading font
// and text size. Every change is written through the hooks and shows in the whole app at once.
import { StyleSheet, Text, View } from 'react-native';

import { GlassSurface } from '../components/GlassSurface';
import { uiFace } from '../fonts/fonts';
import { useI18n } from '../i18n/I18nProvider';
import { Icon } from '../reader/components/icons';
import { useReadingSettings } from '../reader/state';
import { TEXT_SIZES, readingSettingsKey } from '../storage/keys';
import { getStorage } from '../storage/storage';
import { resetPreset } from '../theme/custom';
import { PRESETS } from '../theme/presets';
import { useAppearance, useTheme } from '../theme/ThemeProvider';
import type { PresetId } from '../theme/types';
import { CustomiseAccents, CustomiseFonts, CustomiseModes, CustomiseSize } from './components/CustomiseControls';
import { CustomiseFrame, CustomiseLabel } from './components/CustomiseFrame';
import { CustomisePresetRow } from './components/CustomisePresetRow';
import { CustomisePressable } from './components/CustomisePressable';
import { CustomisePreview } from './components/CustomisePreview';

const modeOf = (id: PresetId) => PRESETS.find((p) => p.id === id)?.mode;

export function CustomiseScreen(props: { onBack(): void; onAdvanced(): void }) {
  const theme = useTheme();
  const { t } = useI18n();
  const { presetId, updateChoice, updateCustom, showingPresetId } = useAppearance();
  const [reading] = useReadingSettings();
  const presetName = t(`preset.${presetId}`);

  const pick = (id: PresetId) => {
    const mode = modeOf(id);
    // Same mode as the preset showing at the press: keep the mode setting. Otherwise switch so the
    // new look shows. Both read from the stored choice, so a mode press just before is counted.
    const shownMode = modeOf(showingPresetId());
    updateChoice((current) => {
      const next = { preset: id, mode: mode === undefined || mode === shownMode ? current.mode : mode };
      // A look with no light/dark partner (Liberty, Northern lights) shows in either mode, so its mode can be the
      // opposite of its own: keeping it would show the picked look's partner. Then take the picked look's mode (F10).
      return mode === undefined || showingPresetId(next) === id ? next : { preset: id, mode };
    });
  };

  // Built from the stored settings at the moment of the press, so quick presses each count and
  // settings written elsewhere since the last render are kept.
  const stepSize = (delta: number) => {
    const storage = getStorage();
    const current = storage.get(readingSettingsKey);
    const textSize = Math.min(TEXT_SIZES.length - 1, Math.max(0, current.textSize + delta));
    if (textSize !== current.textSize) storage.set(readingSettingsKey, { ...current, textSize });
  };

  return (
    <CustomiseFrame
      testID="screen-customise"
      backTestID="customise-back"
      titleKey="customise.title"
      backLabelKey="customise.back"
      onBack={props.onBack}
      action={
        <CustomisePressable
          testID="customise-reset"
          role="button"
          label={t('customise.reset.a11y', { preset: presetName })}
          onPress={() => {
            const id = showingPresetId();
            updateCustom((current) => resetPreset(current, id));
          }}
          style={[styles.reset, { borderRadius: theme.radii.button, borderWidth: theme.borders.button?.width ?? 1, borderColor: theme.borders.button?.color ?? theme.colors.muted }]}
        >
          <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 14 }}>{t('customise.reset')}</Text>
        </CustomisePressable>
      }
    >
      <View style={styles.top}>
        <CustomisePreview textSize={reading.textSize} />
        <View style={styles.side}>
          <View style={styles.group}>
            <CustomiseLabel>{t('customise.mode')}</CustomiseLabel>
            <CustomiseModes />
          </View>
          <View style={styles.group}>
            <CustomiseLabel>{t('customise.size')}</CustomiseLabel>
            <CustomiseSize textSize={reading.textSize} onStep={stepSize} />
          </View>
        </View>
      </View>

      <View style={styles.group}>
        <CustomiseLabel>{t('customise.look')}</CustomiseLabel>
        <CustomisePresetRow presetId={presetId} onPick={pick} />
      </View>

      <View style={styles.group}>
        <CustomiseLabel>{t('customise.accent')}</CustomiseLabel>
        <CustomiseAccents />
      </View>

      <View style={styles.group}>
        <CustomiseLabel>{t('customise.font')}</CustomiseLabel>
        <CustomiseFonts />
      </View>

      <GlassSurface
        background={theme.backgrounds.surface}
        style={{
          borderRadius: theme.radii.card,
          borderWidth: theme.borders.card.width,
          borderColor: theme.borders.card.color,
          boxShadow: theme.shadows.card ?? undefined,
        }}
      >
        <CustomisePressable
          testID="customise-advanced"
          role="button"
          label={`${t('customise.advanced')}. ${t('customise.advancedSub')}`}
          onPress={props.onAdvanced}
          style={styles.advanced}
        >
          <View style={styles.advancedText}>
            <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{t('customise.advanced')}</Text>
            <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 12 }}>{t('customise.advancedSub')}</Text>
          </View>
          <Icon name="chevronRight" color={theme.colors.text} size={18} />
        </CustomisePressable>
      </GlassSurface>
    </CustomiseFrame>
  );
}

const styles = StyleSheet.create({
  top: { flexDirection: 'row', gap: 14 },
  side: { flex: 1, minWidth: 0, gap: 14 },
  group: { gap: 8 },
  reset: { minHeight: 44, paddingHorizontal: 14, alignItems: 'center', justifyContent: 'center' },
  advanced: { minHeight: 56, flexDirection: 'row', alignItems: 'center', gap: 10, paddingHorizontal: 16 },
  advancedText: { flex: 1, minWidth: 0, gap: 2 },
});
