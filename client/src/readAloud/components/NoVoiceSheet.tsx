import { useState } from 'react';
import { Platform, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { SheetModal } from '../../reader/components/SheetModal';
import { groupStyle } from '../../reader/components/ui';
import { useTheme } from '../../theme/ThemeProvider';
import type { ReadAloud } from '../useReadAloud';
import { Action, SheetHeading } from './parts';

export function NoVoiceSheet({ read, translation, fromVerse, onClose }: {
  read: ReadAloud; translation: string; fromVerse: number; onClose(): void;
}) {
  const theme = useTheme();
  const t = useT();
  const lang = read.group === 'en' ? 'en' : 'zh';
  const [checked, setChecked] = useState(false);
  const still = checked && read.status === 'no-voice';
  const path = Platform.OS === 'ios' ? t(`readAloud.noVoice.path.ios.${lang}`) : Platform.OS === 'android' ? t('readAloud.noVoice.path.android') : t('readAloud.noVoice.path.web');
  const text = { color: theme.colors.text, fontSize: 15, lineHeight: 22, fontFamily: uiFace(theme.type.ui, '400') };
  return <SheetModal testID="no-voice-sheet" onClose={onClose}
    header={<SheetHeading title={t(`readAloud.noVoice.title.${lang}`)} onClose={onClose} />}>
    <Text style={text}>{t(`readAloud.noVoice.body.${lang}`, { translation })}</Text>
    <Text style={[groupStyle(theme), text, { padding: 12 }]}>{path}</Text>
    <Text style={text}>{t(Platform.OS === 'web' ? 'readAloud.noVoice.then.web' : 'readAloud.noVoice.then')}</Text>
    <Text testID="read-aloud-no-voice-still" role="status" aria-live="polite" style={text}>{still ? t(`readAloud.noVoice.still.${lang}`) : ''}</Text>
    <View style={{ flexDirection: 'row', gap: 10, flexWrap: 'wrap' }}>
      <Action testID="read-aloud-check" label={t('readAloud.noVoice.check')} primary wide onPress={() => { setChecked(true); read.start(fromVerse); }} />
      <Action testID="read-aloud-no-voice-ok" label={t('readAloud.noVoice.ok')} wide onPress={onClose} />
    </View>
  </SheetModal>;
}
