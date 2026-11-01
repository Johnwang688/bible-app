// The version picker: the same sheet pattern as the book picker, one row per translation.
import { Pressable, StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';
import { TRANSLATION_IDS, TRANSLATIONS, type TranslationId } from '../translations';
import { Icon } from './icons';
import { SheetModal } from './SheetModal';
import { buttonStyle, groupStyle } from './ui';

export function VersionPicker({
  current,
  onSelect,
  onClose,
}: {
  current: TranslationId;
  onSelect(id: TranslationId): void;
  onClose(): void;
}) {
  const theme = useTheme();
  const t = useT();

  return (
    <SheetModal testID="version-picker" onClose={onClose}>
      <View style={styles.titleRow}>
        <Text accessibilityRole="header" style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 20 }}>
          {t('versions.title')}
        </Text>
        <Pressable
          testID="version-close"
          accessibilityRole="button"
          accessibilityLabel={t('common.close')}
          onPress={onClose}
          style={[styles.close, buttonStyle(theme), { borderRadius: 999 }]}
        >
          <Icon name="close" color={theme.colors.btnText} />
        </Pressable>
      </View>
      <View style={groupStyle(theme)}>
        {TRANSLATION_IDS.map((id, i) => {
          const checked = id === current;
          return (
            <Pressable
              key={id}
              testID={`version-${id}`}
              accessibilityRole="radio"
              accessibilityState={{ checked }}
              onPress={() => onSelect(id)}
              style={[styles.row, i > 0 && { borderTopWidth: StyleSheet.hairlineWidth, borderTopColor: theme.borders.sheet.color }]}
            >
              <View style={styles.names}>
                <Text style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>
                  {t(TRANSLATIONS[id].nameKey)}
                </Text>
                <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 12 }}>
                  {t(TRANSLATIONS[id].shortKey)}
                </Text>
              </View>
              {checked ? <Icon name="check" size={20} color={theme.colors.vnum} /> : null}
            </Pressable>
          );
        })}
      </View>
    </SheetModal>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between' },
  close: { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' },
  row: { minHeight: 56, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12, paddingHorizontal: 14 },
  names: { flex: 1, gap: 1 },
});
