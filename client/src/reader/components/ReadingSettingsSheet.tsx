// Reading settings (the sheet in ParallelPhone.dc.html): text size, parallel reading and the
// second translation. Every change is saved at once by the caller.
import { Pressable, StyleSheet, Text, View } from 'react-native';

import { scriptureFace, uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { TEXT_SIZES, type ReadingSettings } from '../../storage/keys';
import { useTheme } from '../../theme/ThemeProvider';
import { isChineseTranslation, TRANSLATION_IDS, TRANSLATIONS, type TranslationId } from '../translations';
import { Icon } from './icons';
import { SheetModal } from './SheetModal';
import { buttonStyle, groupStyle } from './ui';

/** The second translation a reader gets on switching parallel reading on. */
export function defaultSecondTranslation(first: TranslationId): TranslationId {
  return isChineseTranslation(first) ? 'BSB' : 'CUV-SIMP';
}

export function ReadingSettingsSheet({
  settings,
  translation,
  onChange,
  onSwap,
  onClose,
}: {
  settings: ReadingSettings;
  /** The first translation. */
  translation: TranslationId;
  onChange(next: ReadingSettings): void;
  onSwap(): void;
  onClose(): void;
}) {
  const theme = useTheme();
  const t = useT();
  const bold = uiFace(theme.type.ui, '700');
  const regular = uiFace(theme.type.ui, '400');
  const secondOn = settings.parallel !== null && settings.parallel !== translation;
  const atSmallest = settings.textSize <= 0;
  const atLargest = settings.textSize >= TEXT_SIZES.length - 1;
  const sizeButton = (testID: string, label: string, glyphSize: number, disabled: boolean, delta: number) => (
    <Pressable
      testID={testID}
      accessibilityRole="button"
      accessibilityLabel={label}
      accessibilityState={{ disabled }}
      disabled={disabled}
      onPress={() => onChange({ ...settings, textSize: settings.textSize + delta })}
      style={[styles.sizeButton, buttonStyle(theme), { backgroundColor: 'transparent', opacity: disabled ? 0.4 : 1 }]}
    >
      <Text style={{ color: theme.colors.btnText, fontFamily: scriptureFace(theme.type.scripture), fontSize: glyphSize }}>
        {t('settings.sizeGlyph')}
      </Text>
    </Pressable>
  );

  const smaller = sizeButton('settings-smaller', t('settings.smaller'), 14, atSmallest, -1);
  const larger = sizeButton('settings-larger', t('settings.larger'), 20, atLargest, 1);

  return (
    <SheetModal
      testID="reading-settings"
      onClose={onClose}
      header={
        <View style={styles.titleRow}>
          <Text accessibilityRole="header" style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 20 }}>
            {t('settings.title')}
          </Text>
          <Pressable
            testID="settings-done"
            accessibilityRole="button"
            onPress={onClose}
            style={[styles.done, buttonStyle(theme), { backgroundColor: theme.colors.accent }]}
          >
            <Text style={{ color: theme.colors.onAccent, fontFamily: bold, fontSize: 15 }}>{t('settings.done')}</Text>
          </Pressable>
        </View>
      }
    >
      <View style={[styles.sizeRow, groupStyle(theme)]}>
        <Text style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{t('settings.textSize')}</Text>
        <View style={styles.sizeButtons}>
          {smaller}
          {larger}
        </View>
      </View>

      <View style={groupStyle(theme)}>
        <View style={styles.switchRow}>
          <View style={styles.switchText}>
            <Text style={{ color: theme.colors.btnText, fontFamily: bold, fontSize: 15 }}>{t('settings.parallel')}</Text>
            <Text style={{ color: theme.colors.muted, fontFamily: regular, fontSize: 13 }}>{t('settings.parallelHint')}</Text>
          </View>
          <Pressable
            testID="settings-parallel"
            accessibilityRole="switch"
            accessibilityLabel={t('settings.parallel')}
            accessibilityHint={t('settings.parallelHint')}
            accessibilityState={{ checked: secondOn }}
            aria-checked={secondOn}
            onPress={() => onChange({ ...settings, parallel: secondOn ? null : defaultSecondTranslation(translation) })}
            style={styles.switchHit}
          >
            <View
              style={[
                styles.track,
                {
                  backgroundColor: secondOn ? theme.colors.accent : theme.colors.track,
                  borderColor: theme.borders.button?.color ?? theme.colors.muted,
                  borderWidth: theme.borders.button?.width ?? 1,
                },
              ]}
            >
              <View
                style={[
                  styles.thumb,
                  secondOn ? styles.thumbOn : styles.thumbOff,
                  { backgroundColor: secondOn ? theme.colors.onAccent : theme.colors.muted },
                ]}
              />
            </View>
          </Pressable>
        </View>

        {secondOn ? (
          <View>
            <Text accessibilityRole="header" style={[styles.listHeading, { color: theme.colors.muted, fontFamily: bold }]}>
              {t('settings.second')}
            </Text>
            {TRANSLATION_IDS.filter((id) => id !== translation).map((id) => {
              const checked = settings.parallel === id;
              return (
                <Pressable
                  key={id}
                  testID={`settings-second-${id}`}
                  accessibilityRole="radio"
                  accessibilityState={{ checked }}
                  aria-checked={checked}
                  onPress={() => onChange({ ...settings, parallel: id })}
                  style={[styles.option, { borderTopWidth: StyleSheet.hairlineWidth, borderTopColor: theme.borders.sheet.color }]}
                >
                  <View style={styles.names}>
                    <Text style={{ color: theme.colors.btnText, fontFamily: bold, fontSize: 15 }}>{t(TRANSLATIONS[id].nameKey)}</Text>
                    <Text style={{ color: theme.colors.muted, fontFamily: regular, fontSize: 12 }}>{t(TRANSLATIONS[id].shortKey)}</Text>
                  </View>
                  {checked ? <Icon name="check" size={20} color={theme.colors.vnum} /> : null}
                </Pressable>
              );
            })}
          </View>
        ) : null}
      </View>

      {secondOn ? (
        <Pressable
          testID="settings-swap"
          accessibilityRole="button"
          accessibilityLabel={t('settings.swap')}
          onPress={onSwap}
          style={[styles.swap, groupStyle(theme)]}
        >
          <Icon name="swapH" size={18} color={theme.colors.btnText} strokeWidth={2} />
          <Text style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{t('settings.swap')}</Text>
        </Pressable>
      ) : null}
    </SheetModal>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between' },
  done: { minHeight: 44, paddingHorizontal: 18, alignItems: 'center', justifyContent: 'center' },
  sizeRow: { minHeight: 56, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', paddingHorizontal: 14 },
  sizeButtons: { flexDirection: 'row', gap: 8 },
  sizeButton: { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' },
  switchRow: { minHeight: 60, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12, paddingHorizontal: 14 },
  switchText: { flex: 1, gap: 2 },
  switchHit: { minWidth: 51, minHeight: 44, justifyContent: 'center' },
  track: { width: 51, height: 31, borderRadius: 999 },
  thumb: { position: 'absolute', top: 2, width: 25, height: 25, borderRadius: 999 },
  thumbOn: { right: 2 },
  thumbOff: { left: 2 },
  listHeading: { paddingHorizontal: 14, paddingTop: 2, paddingBottom: 6, fontSize: 12, letterSpacing: 0.6, textTransform: 'uppercase' },
  option: { minHeight: 46, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12, paddingHorizontal: 14 },
  names: { flex: 1, gap: 1 },
  swap: { minHeight: 48, flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 8 },
});
