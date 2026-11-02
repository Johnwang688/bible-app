// The Me tab (R-6a): appearance, language and reading settings, and the way to Sources, About and Help.
// Every value is read from storage through the shared hooks, so a write anywhere shows at once.
import { useRef, useState } from 'react';
import { StyleSheet, View } from 'react-native';

import { Screen } from '../components/Screen';
import { useI18n } from '../i18n/I18nProvider';
import type { LanguagePreference } from '../i18n/types';
import { VersionPicker } from '../reader/components/VersionPicker';
import { useReaderPosition, useReadingSettings } from '../reader/state';
import { TRANSLATION_IDS, TRANSLATIONS, type TranslationId } from '../reader/translations';
import { readerPositionKey, readingSettingsKey, TEXT_SIZES } from '../storage/keys';
import { getStorage } from '../storage/storage';
import { useAppearance, useTheme } from '../theme/ThemeProvider';
import { MeChoiceSheet, type MeChoice } from './components/MeChoiceSheet';
import { MeGroup, MeSettingsRow } from './components/MeSettingsRow';
import type { MeRoute } from './routes';

type Sheet = 'language' | 'translation' | 'parallel' | null;

const LANGUAGES: readonly LanguagePreference[] = ['system', 'en', 'zh-Hans'];

export function MeScreen({ onNavigate }: { onNavigate(to: MeRoute): void }) {
  const { t, formatNumber, preference, setPreference } = useI18n();
  const theme = useTheme();
  const { choice, presetId } = useAppearance();
  const { position, setPosition } = useReaderPosition();
  const [settings, setSettings] = useReadingSettings();
  const [sheet, setSheet] = useState<Sheet>(null);
  // The picker is closing once a choice is made: a second tap in that moment must not write again.
  const picked = useRef(false);

  const open = (s: Exclude<Sheet, null>) => {
    picked.current = false;
    setSheet(s);
  };
  const close = () => setSheet(null);

  const chooseTranslation = (translation: TranslationId) => {
    if (picked.current) return;
    picked.current = true;
    // Read at press time: the reader or another screen may have written newer values since this render.
    const storage = getStorage();
    const current = storage.get(readerPositionKey) ?? position;
    setPosition({ ...current, translation });
    const currentSettings = storage.get(readingSettingsKey);
    if (currentSettings.parallel === translation) setSettings({ ...currentSettings, parallel: null });
    close();
  };

  const chooseParallel = (choice: 'off' | TranslationId) => {
    // Read at press time: the main translation may have changed since this render, and the parallel
    // text must never repeat it.
    const storage = getStorage();
    const main = (storage.get(readerPositionKey) ?? position).translation;
    if (choice === main) return;
    setSettings({ ...storage.get(readingSettingsKey), parallel: choice === 'off' ? null : choice });
  };

  const parallelValue = settings.parallel === null ? t('me.value.off') : t(TRANSLATIONS[settings.parallel].shortKey);

  const languageChoices: MeChoice<LanguagePreference>[] = LANGUAGES.map((value) => ({
    value,
    testID: `me-language-${value}`,
    label: t(`language.${value}`),
  }));
  const parallelChoices: MeChoice<'off' | TranslationId>[] = [
    { value: 'off', testID: 'me-parallel-off', label: t('me.value.off') },
    ...TRANSLATION_IDS.filter((id) => id !== position.translation).map((id) => ({
      value: id,
      testID: `me-parallel-${id}`,
      label: t(TRANSLATIONS[id].nameKey),
    })),
  ];

  return (
    <Screen titleKey="screen.me.title" testID="screen-me">
      <View style={styles.groups}>
        <MeGroup titleKey="me.group.appearance">
          <MeSettingsRow id="me-row-look" first labelKey="me.row.look" value={t(`preset.${presetId}`)} onPress={() => onNavigate('customise')} />
          <MeSettingsRow id="me-row-mode" labelKey="me.row.mode" value={t(`mode.${choice.mode}`)} onPress={() => onNavigate('customise')} />
          <MeSettingsRow id="me-row-font" labelKey="me.row.font" value={t(`font.${theme.type.scripture}`)} onPress={() => onNavigate('customise')} />
          <MeSettingsRow
            id="me-row-textSize"
            labelKey="me.row.textSize"
            value={formatNumber(TEXT_SIZES[settings.textSize] ?? TEXT_SIZES[0])}
            onPress={() => onNavigate('customise')}
          />
        </MeGroup>

        <MeGroup titleKey="me.group.language">
          <MeSettingsRow id="me-row-language" first labelKey="me.row.language" value={t(`language.${preference}`)} onPress={() => open('language')} />
        </MeGroup>

        <MeGroup titleKey="me.group.reading">
          <MeSettingsRow
            id="me-row-translation"
            first
            labelKey="me.row.translation"
            value={t(TRANSLATIONS[position.translation].shortKey)}
            onPress={() => open('translation')}
          />
          <MeSettingsRow id="me-row-parallel" labelKey="me.row.parallel" value={parallelValue} onPress={() => open('parallel')} />
        </MeGroup>

        <MeGroup titleKey="me.group.more">
          <MeSettingsRow id="me-row-sources" first labelKey="me.row.sources" onPress={() => onNavigate('sources')} />
          <MeSettingsRow id="me-row-about" labelKey="me.row.about" onPress={() => onNavigate('about')} />
          <MeSettingsRow id="me-row-help" labelKey="me.row.help" onPress={() => onNavigate('help')} />
        </MeGroup>
      </View>

      {sheet === 'language' ? (
        <MeChoiceSheet
          testID="me-language-sheet"
          titleKey="me.row.language"
          choices={languageChoices}
          selected={preference}
          onChoose={setPreference}
          onClose={close}
        />
      ) : null}
      {sheet === 'translation' ? (
        <VersionPicker current={position.translation} onSelect={chooseTranslation} onClose={close} />
      ) : null}
      {sheet === 'parallel' ? (
        <MeChoiceSheet
          testID="me-parallel-sheet"
          titleKey="me.row.parallel"
          choices={parallelChoices}
          selected={settings.parallel ?? 'off'}
          onChoose={chooseParallel}
          onClose={close}
        />
      ) : null}
    </Screen>
  );
}

const styles = StyleSheet.create({
  groups: { gap: 14, paddingTop: 14 },
});
