import { useEffect, useState } from 'react';
import { Pressable, ScrollView, Text, useWindowDimensions, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { TFunction } from '../../i18n/translate';
import { RadioGroup, useRadioKeys } from './radio';
import { Icon } from '../../reader/components/icons';
import { SheetModal } from '../../reader/components/SheetModal';
import { buttonStyle } from '../../reader/components/ui';
import { useTheme } from '../../theme/ThemeProvider';
import { parseLangTag } from '../language';
import { RATES, type SpeechVoice } from '../types';
import type { ReadAloud } from '../useReadAloud';
import { ctaStyle, SheetHeading } from './parts';

export function voiceLanguageLabel(voice: SpeechVoice, t: TFunction): string {
  const tag = voice.lang.replace(/_/g, '-').toLowerCase();
  const parsed = parseLangTag(tag);
  if (parsed.family === 'en') return t(tag.split('-').includes('us') ? 'readAloud.voice.enUS' : tag.split('-').includes('gb') ? 'readAloud.voice.enGB' : 'readAloud.voice.en');
  if (parsed.family === 'zh') return t(parsed.cantonese ? 'readAloud.voice.zhHK' : parsed.script === 'Hans' ? 'readAloud.voice.zhCN' : parsed.script === 'Hant' ? 'readAloud.voice.zhTW' : 'readAloud.voice.zh');
  return voice.lang;
}

export function VoiceSpeedSheet({ read, translation, sampleText, onClose }: {
  read: ReadAloud; translation: string; sampleText: string; onClose(): void;
}) {
  const theme = useTheme();
  const t = useT();
  const { height } = useWindowDimensions();
  const insets = useSafeAreaInsets();
  const [voices, setVoices] = useState<SpeechVoice[]>([]);
  const listVoices = read.listVoices;
  useEffect(() => {
    let live = true;
    void listVoices().then((v) => { if (live) setVoices(v); });
    return () => { live = false; };
  }, [listVoices]);
  const rateKeys = useRadioKeys(RATES.length, RATES.findIndex((r) => r === read.rate), (i) => read.setRate(RATES[i]!));
  const voiceKeys = useRadioKeys(voices.length, voices.findIndex((v) => v.id === read.voice?.id), (i) => read.setVoice(voices[i]!.id));
  const regular = { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400') };
  const bold = { color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700') };
  return <SheetModal testID="voice-speed-sheet" onClose={onClose} header={<SheetHeading title={t('readAloud.sheet.title')} onClose={onClose} />}>
    <View style={{ gap: 14, maxHeight: Math.max(120, height * 0.85 - 115 - Math.max(insets.bottom, 12)) }}>
      <View style={{ gap: 8 }}>
        <Text style={[bold, { fontSize: 14 }]}>{t('readAloud.sheet.speed')}</Text>
        <RadioGroup label={t('readAloud.sheet.speed')} style={{ flexDirection: 'row', gap: 6 }}>
          {RATES.map((rate, i) => {
            const on = rate === read.rate;
            return <Pressable key={rate} {...rateKeys(i)} testID={`read-aloud-rate-${rate}`} accessibilityRole="radio"
              accessibilityLabel={t('readAloud.times', { x: rate })} accessibilityState={{ checked: on }} aria-checked={on}
              onPress={() => read.setRate(rate)} style={({ pressed }) => [on ? ctaStyle(theme) : buttonStyle(theme), { flex: 1, minWidth: 44, height: 44, justifyContent: 'center', alignItems: 'center', opacity: pressed ? 0.7 : 1 },
                on && { backgroundColor: theme.floatingTabBar ? theme.colors.cta : theme.colors.text, backgroundImage: undefined, boxShadow: theme.floatingTabBar ? theme.shadows.cta : undefined }]}>
              <Text style={[bold, { fontSize: 14, color: on ? (theme.floatingTabBar ? theme.colors.onCta : theme.colors.onAccent) : theme.colors.btnText }]}>{`${rate}×`}</Text>
            </Pressable>;
          })}
        </RadioGroup>
      </View>
      <View style={{ gap: 8, flexShrink: 1, minHeight: 0 }}>
        <Text style={[bold, { fontSize: 14 }]}>{t('readAloud.voiceFor', { translation })}</Text>
        <Text style={[regular, { color: theme.colors.muted, fontSize: 13, lineHeight: 19 }]}>{t('readAloud.voiceHint')}</Text>
        <ScrollView testID="read-aloud-voices" nestedScrollEnabled style={{ maxHeight: 56 * 3.5 + 6 * 3, flexShrink: 1 }} contentContainerStyle={{ flexDirection: 'row', gap: 8 }} keyboardShouldPersistTaps="handled">
          <RadioGroup label={t('readAloud.voiceFor', { translation })} style={{ flex: 1, gap: 6 }}>
            {voices.map((voice, i) => {
              const on = voice.id === read.voice?.id;
              const language = voiceLanguageLabel(voice, t);
              return <Pressable key={voice.id} {...voiceKeys(i)} testID={`read-aloud-voice-${i}`} accessibilityRole="radio"
                accessibilityLabel={`${voice.name}, ${voice.localService ? language : t('readAloud.voice.needsInternet', { language })}`}
                accessibilityState={{ checked: on }} aria-checked={on} onPress={() => read.setVoice(voice.id)}
                style={({ pressed }) => [on ? buttonStyle(theme) : null, { height: 56, borderRadius: Math.min(theme.radii.button, 18), borderWidth: 2, borderColor: on ? theme.colors.text : 'transparent', paddingHorizontal: 10, flexDirection: 'row', alignItems: 'center', gap: 10, opacity: pressed ? 0.7 : 1 }]}>
                <View style={{ width: 22, height: 22, borderRadius: 11, borderWidth: 2, borderColor: theme.colors.text, justifyContent: 'center', alignItems: 'center' }}>
                  {on ? <View style={{ width: 10, height: 10, borderRadius: 5, backgroundColor: theme.colors.text }} /> : null}
                </View>
                <View style={{ flex: 1, minWidth: 0 }}>
                  <Text numberOfLines={1} style={[bold, { fontSize: 15 }]}>{voice.name}</Text>
                  <Text numberOfLines={1} style={[regular, { fontSize: 13, color: theme.colors.muted }]}>{voice.localService ? language : t('readAloud.voice.needsInternet', { language })}</Text>
                </View>
              </Pressable>;
            })}
          </RadioGroup>
          <View style={{ gap: 6 }}>
            {voices.map((voice, i) => {
              const sampling = read.sampleVoiceId === voice.id;
              return <View key={voice.id} style={{ height: 56, justifyContent: 'center' }}>
                <Pressable testID={`read-aloud-sample-${i}`} accessibilityRole="button" aria-pressed={sampling}
                  accessibilityState={{ selected: sampling }} accessibilityLabel={t(sampling ? 'readAloud.stopSample' : 'readAloud.sample', { name: voice.name })}
                  onPress={() => sampling ? read.stopSample() : read.sample(voice.id, sampleText)}
                  style={({ pressed }) => [buttonStyle(theme), { width: 44, height: 44, borderRadius: 999, alignItems: 'center', justifyContent: 'center', opacity: pressed ? 0.7 : 1 }]}>
                  <Icon name={sampling ? 'stop' : 'speaker'} size={20} color={theme.colors.btnText} />
                </Pressable>
              </View>;
            })}
          </View>
        </ScrollView>
      </View>
      <Pressable testID="read-aloud-auto-next" accessibilityRole="switch" accessibilityLabel={t('readAloud.autoNext')}
        accessibilityHint={t('readAloud.autoNextSub')} accessibilityState={{ checked: read.autoAdvance }} aria-checked={read.autoAdvance}
        onPress={() => read.setAutoAdvance(!read.autoAdvance)} style={({ pressed }) => ({ minHeight: 56, flexDirection: 'row', alignItems: 'center', gap: 12, opacity: pressed ? 0.7 : 1 })}>
        <View style={{ flex: 1, gap: 2 }}>
          <Text style={[bold, { fontSize: 15 }]}>{t('readAloud.autoNext')}</Text>
          <Text style={[regular, { fontSize: 13, lineHeight: 19, color: theme.colors.muted }]}>{t('readAloud.autoNextSub')}</Text>
        </View>
        <View style={{ width: 51, height: 31, borderRadius: 999, backgroundColor: read.autoAdvance ? theme.colors.accent : theme.colors.track, borderWidth: theme.borders.button?.width ?? 1.5, borderColor: theme.borders.button?.color ?? theme.colors.muted, justifyContent: 'center' }}>
          <View style={{ width: 22, height: 22, borderRadius: 11, marginLeft: read.autoAdvance ? 25 : 3, backgroundColor: read.autoAdvance ? theme.colors.onAccent : theme.colors.muted }} />
        </View>
      </Pressable>
    </View>
  </SheetModal>;
}
