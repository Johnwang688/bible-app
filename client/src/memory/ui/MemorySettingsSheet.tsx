// The Memory settings sheet: which verses are shown (they follow the app language), the Chinese script, the voice
// switch and the spoken language for the Chinese verses. Self-contained (it reads and writes the stored settings
// itself), so the trainers open this same sheet over a lesson.
import { Pressable, StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useI18n } from '../../i18n/I18nProvider';
import { RoundIconButton } from '../../reader/components/sheetParts';
import { SheetModal } from '../../reader/components/SheetModal';
import { buttonStyle } from '../../reader/components/ui';
import type { Storage } from '../../storage/storage';
import { useTheme } from '../../theme/ThemeProvider';
import { TMS_ENGLISH_TRANSLATION } from '../library';
import { useMemorySettings } from '../useMemorySettings';
import { useVerseLanguage } from '../verseLanguage';
import { MemButton } from './parts';
import { ScriptureNotice } from './ScriptureNotice';

interface SegItem {
  id: string;
  testID: string;
  glyph: string;
  /** The second line (the language's name); none in Chinese for the speech choice. */
  sub: string | null;
}

/** Two choices as large buttons. `off` dims the group and disables them (the speech choice with voice off). */
function Segmented({
  label,
  items,
  value,
  onChange,
  off = false,
}: {
  label: string;
  items: SegItem[];
  value: string;
  onChange(id: string): void;
  off?: boolean;
}) {
  const theme = useTheme();
  return (
    <View
      accessibilityRole="radiogroup"
      accessibilityLabel={label}
      accessibilityState={{ disabled: off }}
      style={[styles.seg, off && styles.dim]}
    >
      {items.map((item) => {
        const selected = item.id === value;
        const color = selected ? theme.colors.onCta : theme.colors.btnText;
        return (
          <Pressable
            key={item.id}
            testID={item.testID}
            accessibilityRole="radio"
            accessibilityLabel={item.sub ? `${item.glyph} ${item.sub}` : item.glyph}
            accessibilityState={{ checked: selected, disabled: off }}
            disabled={off}
            onPress={() => onChange(item.id)}
            style={[
              styles.segItem,
              buttonStyle(theme),
              selected && { backgroundColor: theme.colors.cta },
              selected && !off && { boxShadow: theme.shadows.cta },
            ]}
          >
            <Text style={{ color, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 17 }}>{item.glyph}</Text>
            {item.sub ? <Text style={{ color, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 11 }}>{item.sub}</Text> : null}
          </Pressable>
        );
      })}
    </View>
  );
}

function Switch({ checked, label, testID, onChange }: { checked: boolean; label: string; testID: string; onChange(next: boolean): void }) {
  const theme = useTheme();
  const border = theme.borders.button;
  return (
    <Pressable
      testID={testID}
      accessibilityRole="switch"
      accessibilityLabel={label}
      accessibilityState={{ checked }}
      aria-checked={checked}
      onPress={() => onChange(!checked)}
      style={styles.switchHit}
    >
      <View
        style={[
          styles.track,
          {
            borderWidth: border?.width ?? 2,
            borderColor: border?.color ?? theme.colors.muted,
            backgroundColor: checked ? theme.colors.cta : theme.backgrounds.button.backgroundColor,
            alignItems: checked ? 'flex-end' : 'flex-start',
          },
        ]}
      >
        <View style={[styles.thumb, { backgroundColor: checked ? theme.colors.onCta : theme.colors.muted }]} />
      </View>
    </Pressable>
  );
}

export function MemorySettingsSheet({ visible, onClose, storage }: { visible: boolean; onClose(): void; storage?: Storage }) {
  const theme = useTheme();
  const { t, locale } = useI18n();
  const [settings, update] = useMemorySettings(storage);
  const language = useVerseLanguage();
  if (!visible) return null;

  const en = locale === 'en';
  const heading = { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') };
  const hint = { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 13, lineHeight: 19 };

  return (
    <SheetModal
      testID="memory-settings-sheet"
      onClose={onClose}
      header={
        <View style={styles.header}>
          <Text accessibilityRole="header" style={[heading, styles.title]}>
            {t('memory.settings.title')}
          </Text>
          <RoundIconButton testID="memory-settings-close" label={t('memory.settings.close')} icon="close" onPress={onClose} />
        </View>
      }
    >
      <View style={styles.section}>
        <Text testID="memory-settings-verses" style={hint}>
          {t('memory.settings.englishNote', { translation: TMS_ENGLISH_TRANSLATION })}
        </Text>
        <ScriptureNotice language={language} />
      </View>

      <View style={styles.section}>
        <Text style={[heading, styles.label]}>{t('memory.settings.script')}</Text>
        <Segmented
          label={t('memory.settings.script')}
          value={settings.script}
          onChange={(id) => update({ script: id as 'simplified' | 'traditional' })}
          items={[
            { id: 'simplified', testID: 'memory-script-simplified', glyph: '简', sub: t('memory.settings.simplified') },
            { id: 'traditional', testID: 'memory-script-traditional', glyph: '繁', sub: t('memory.settings.traditional') },
          ]}
        />
        <Text style={hint}>{t('memory.settings.scriptHint')}</Text>
      </View>

      <View style={styles.section}>
        <View style={styles.switchRow}>
          <Text style={[heading, styles.label, styles.grow]}>{t('memory.settings.voice')}</Text>
          <Text style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 13 }}>
            {t(settings.voice ? 'memory.settings.on' : 'memory.settings.off')}
          </Text>
          <Switch
            testID="memory-voice-switch"
            label={t('memory.settings.voice')}
            checked={settings.voice}
            onChange={(voice) => update({ voice })}
          />
        </View>
        <Text style={hint}>{t(settings.voice ? 'memory.settings.voiceHintOn' : 'memory.settings.voiceHintOff')}</Text>
      </View>

      <View style={styles.section}>
        <Text style={[heading, styles.label, !settings.voice && { color: theme.colors.muted }]}>{t('memory.settings.speech')}</Text>
        {language === 'en' ? <Text style={hint}>{t('memory.settings.forChinese')}</Text> : null}
        <Segmented
          label={t('memory.settings.speech')}
          value={settings.speech}
          off={!settings.voice}
          onChange={(id) => update({ speech: id as 'mandarin' | 'cantonese' })}
          items={[
            { id: 'mandarin', testID: 'memory-speech-mandarin', glyph: '普通话', sub: en ? t('memory.settings.mandarin') : null },
            { id: 'cantonese', testID: 'memory-speech-cantonese', glyph: '粤语', sub: en ? t('memory.settings.cantonese') : null },
          ]}
        />
        <Text style={hint}>{t(settings.voice ? 'memory.settings.speechHint' : 'memory.settings.speechOff')}</Text>
      </View>

      <MemButton testID="memory-settings-done" label={t('memory.settings.done')} kind="primary" block onPress={onClose} />
    </SheetModal>
  );
}

const styles = StyleSheet.create({
  header: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12 },
  title: { flex: 1, fontSize: 21 },
  section: { gap: 8 },
  label: { fontSize: 15 },
  grow: { flex: 1 },
  seg: { flexDirection: 'row', gap: 8 },
  dim: { opacity: 0.42 },
  segItem: { flex: 1, minHeight: 56, alignItems: 'center', justifyContent: 'center', gap: 1 },
  switchRow: { flexDirection: 'row', alignItems: 'center', gap: 4 },
  switchHit: { width: 56, height: 44, alignItems: 'center', justifyContent: 'center' },
  track: { width: 52, height: 30, borderRadius: 999, justifyContent: 'center', paddingHorizontal: 3 },
  thumb: { width: 20, height: 20, borderRadius: 999 },
});
