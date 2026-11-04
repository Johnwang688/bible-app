// A bottom sheet of radio options (app language, parallel translation). The first choice closes the
// sheet; a second tap while it is closing does nothing, so a choice is never written twice.
import { useRef } from 'react';
import { Platform, Pressable, StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { MessageKey } from '../../i18n/messages/en';
import { Icon } from '../../reader/components/icons';
import { SheetModal } from '../../reader/components/SheetModal';
import { buttonStyle, groupStyle } from '../../reader/components/ui';
import { useTheme } from '../../theme/ThemeProvider';

export interface MeChoice<V extends string> {
  value: V;
  testID: string;
  label: string;
}

export function MeChoiceSheet<V extends string>({
  testID,
  titleKey,
  choices,
  selected,
  onChoose,
  onClose,
  note,
}: {
  testID: string;
  titleKey: MessageKey;
  choices: readonly MeChoice<V>[];
  selected: V;
  onChoose(value: V): void;
  onClose(): void;
  /** A line under the options (full text colour), read out with the option it describes. */
  note?: { id: string; text: string; describes: V };
}) {
  const theme = useTheme();
  const t = useT();
  const chosen = useRef(false);

  const choose = (value: V) => {
    if (chosen.current) return;
    chosen.current = true;
    onChoose(value);
    onClose();
  };

  return (
    <SheetModal
      testID={testID}
      onClose={onClose}
      header={
        <View style={styles.titleRow}>
          <Text
            accessibilityRole="header"
            style={[styles.title, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}
          >
            {t(titleKey)}
          </Text>
          <Pressable
            testID={`${testID}-close`}
            accessibilityRole="button"
            accessibilityLabel={t('common.close')}
            onPress={onClose}
            style={[styles.close, buttonStyle(theme), { borderRadius: 999 }]}
          >
            <Icon name="close" color={theme.colors.btnText} />
          </Pressable>
        </View>
      }
    >
      <View style={groupStyle(theme)}>
        {choices.map((c, i) => {
          const isSelected = c.value === selected;
          return (
            <Pressable
              key={c.value}
              testID={c.testID}
              accessibilityRole="radio"
              accessibilityLabel={c.label}
              aria-describedby={note !== undefined && note.describes === c.value ? note.id : undefined}
              {...(Platform.OS === 'web' ? { 'aria-checked': isSelected } : {})}
              accessibilityState={{ selected: isSelected, checked: isSelected }}
              onPress={() => choose(c.value)}
              style={[styles.option, i > 0 && { borderTopWidth: StyleSheet.hairlineWidth, borderTopColor: theme.borders.sheet.color }]}
            >
              <Text style={[styles.optionText, { color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700') }]}>
                {c.label}
              </Text>
              {isSelected ? <Icon name="check" size={20} color={theme.colors.vnum} /> : null}
            </Pressable>
          );
        })}
      </View>
      {note !== undefined ? (
        <Text
          testID={note.id}
          nativeID={note.id}
          style={[styles.note, { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') }]}
        >
          {note.text}
        </Text>
      ) : null}
    </SheetModal>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12 },
  title: { flex: 1, fontSize: 20 },
  close: { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' },
  option: { minHeight: 50, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12, paddingHorizontal: 14, paddingVertical: 6 },
  optionText: { flex: 1, fontSize: 15 },
  note: { fontSize: 14, lineHeight: 20, marginTop: 10 },
});
