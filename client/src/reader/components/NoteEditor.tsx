// The note editor: a sub-view of the verse sheet. It is bound to the verse it opened for (the first verse of
// the selection then); the sheet saves to that verse even if the selection changes while it is open.
// Every change is reported (`onDraft`), so the sheet can keep the unsaved text when it closes under the editor
// (a chapter change); opened again with that draft, the editor starts from it and says so.
import { useState } from 'react';
import { Platform, Pressable, StyleSheet, Text, TextInput, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { NOTE_MAX_LENGTH } from '../../storage/keys';
import { useTheme } from '../../theme/ThemeProvider';
import { programmaticFocus, useFocusOnMount } from './a11y';
import { RoundIconButton, SheetFrame } from './sheetParts';
import { buttonStyle } from './ui';

export function NoteEditor({
  reference,
  initial,
  draft,
  onDraft,
  onBack,
  onClose,
  onSave,
  onDelete,
}: {
  /** The first verse's reference, e.g. "John 3:16". */
  reference: string;
  /** The saved note, or null. */
  initial: string | null;
  /** Unsaved text kept from an earlier visit; the editor starts from it instead of the saved note. */
  draft?: string;
  /** The text after each change. */
  onDraft?(text: string): void;
  onBack(): void;
  onClose(): void;
  onSave(text: string): void;
  onDelete(): void;
}) {
  const theme = useTheme();
  const t = useT();
  const [text, setText] = useState(draft ?? initial ?? '');
  // Fixed for this visit: the hint says the editor opened on a draft.
  const [restored] = useState(draft !== undefined);
  const change = (value: string) => {
    setText(value);
    onDraft?.(value);
  };
  const titleRef = useFocusOnMount();
  const tooLong = text.length > NOTE_MAX_LENGTH;
  const bold = uiFace(theme.type.ui, '700');

  return (
    <SheetFrame
      testID="note-editor"
      header={
        <View style={styles.titleRow}>
          <RoundIconButton testID="note-back" label={t('note.back')} icon="chevronLeft" onPress={onBack} />
          <Text
            ref={titleRef}
            accessibilityRole="header"
            {...programmaticFocus}
            style={[styles.title, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}
          >
            {t('note.title', { ref: reference })}
          </Text>
          <RoundIconButton testID="sheet-close" label={t('common.close')} icon="close" onPress={onClose} />
        </View>
      }
    >
      <TextInput
        testID="note-input"
        value={text}
        onChangeText={change}
        multiline
        placeholder={t('note.placeholder')}
        placeholderTextColor={theme.colors.muted}
        accessibilityLabel={t('sheet.note')}
        textAlignVertical="top"
        style={[
          styles.input, buttonStyle(theme),
          Platform.OS === 'web' && { outlineColor: theme.colors.accent },
          { borderRadius: theme.radii.card, color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '400') },
        ]}
      />
      {restored ? (
        <Text testID="note-draft" style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}>
          {t('note.draftRestored')}
        </Text>
      ) : null}
      {tooLong ? (
        <Text accessibilityRole="alert" style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14 }}>
          {t('note.tooLong', { max: NOTE_MAX_LENGTH })}
        </Text>
      ) : null}
      <View style={styles.actions}>
        {initial !== null ? (
          <Pressable
            testID="note-delete"
            accessibilityRole="button"
            onPress={onDelete}
            style={[styles.button, buttonStyle(theme)]}
          >
            <Text style={{ color: theme.colors.btnText, fontFamily: bold, fontSize: 15 }}>{t('note.delete')}</Text>
          </Pressable>
        ) : null}
        <Pressable
          testID="note-save"
          accessibilityRole="button"
          accessibilityState={{ disabled: tooLong }}
          disabled={tooLong}
          onPress={() => onSave(text)}
          style={[styles.button, buttonStyle(theme), { backgroundColor: theme.colors.accent, opacity: tooLong ? 0.4 : 1 }]}
        >
          <Text style={{ color: theme.colors.onAccent, fontFamily: bold, fontSize: 15 }}>{t('note.save')}</Text>
        </Pressable>
      </View>
    </SheetFrame>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  title: { flex: 1, fontSize: 19 },
  input: { minHeight: 140, padding: 14, fontSize: 16, lineHeight: 23 },
  actions: { flexDirection: 'row', justifyContent: 'flex-end', gap: 8, flexWrap: 'wrap' },
  button: { minHeight: 44, paddingHorizontal: 20, alignItems: 'center', justifyContent: 'center' },
});
