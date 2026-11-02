// A placeholder for the verse's commentary until the commentary sheet arrives (R-5). Commentary is
// English only, so Chinese readers see the 英文 badge.
import { StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';
import { programmaticFocus, useFocusOnMount } from './a11y';
import { EnglishBadge, RoundIconButton, SheetFrame } from './sheetParts';

export function CommentaryPlaceholder({ onBack, onClose }: { onBack(): void; onClose(): void }) {
  const theme = useTheme();
  const t = useT();
  const titleRef = useFocusOnMount();
  return (
    <SheetFrame
      testID="commentary-placeholder"
      header={
        <View style={styles.titleRow}>
          <RoundIconButton testID="commentary-back" label={t('note.back')} icon="chevronLeft" onPress={onBack} />
          <Text
            ref={titleRef}
            accessibilityRole="header"
            {...programmaticFocus}
            style={[styles.title, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}
          >
            {t('commentary.title')}
          </Text>
          <EnglishBadge />
          <RoundIconButton testID="sheet-close" label={t('common.close')} icon="close" onPress={onClose} />
        </View>
      }
    >
      <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 16, lineHeight: 24 }}>
        {t('commentary.soon')}
      </Text>
    </SheetFrame>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  title: { flex: 1, fontSize: 19 },
});
