import { Pressable, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { Icon } from '../../reader/components/icons';
import { SheetModal } from '../../reader/components/SheetModal';
import { buttonStyle } from '../../reader/components/ui';
import { useTheme } from '../../theme/ThemeProvider';
import { ctaStyle, SheetHeading } from './parts';

export function ChapterToolsSheet({ title, translation, fromVerse, ready, onStart, onClose }: {
  title: string; translation: string; fromVerse: number; ready: boolean; onStart(): void; onClose(): void;
}) {
  const t = useT();
  const theme = useTheme();
  return <SheetModal testID="chapter-tools-sheet" onClose={onClose}
    header={<SheetHeading title={title} caps={t('readAloud.tools')} onClose={onClose} />}>
    <Pressable testID="read-aloud-start" accessibilityRole="button" accessibilityState={{ disabled: !ready }} aria-disabled={!ready}
      disabled={!ready} onPress={() => { if (ready) onStart(); }}
      style={({ pressed }) => [buttonStyle(theme), { minHeight: 64, padding: 10, flexDirection: 'row', alignItems: 'center', gap: 12, borderRadius: theme.radii.card, opacity: !ready ? 0.45 : pressed ? 0.7 : 1 }]}>
      <View style={[ctaStyle(theme), { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' }]}>
        <Icon name="play" size={22} color={theme.colors.onCta} filled />
      </View>
      <View style={{ flex: 1, gap: 2 }}>
        <Text style={{ fontSize: 16, color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700') }}>{t('readAloud.row')}</Text>
        <Text style={{ fontSize: 13, color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }}>{t('readAloud.row.from', { n: fromVerse, translation })}</Text>
      </View>
    </Pressable>
  </SheetModal>;
}
