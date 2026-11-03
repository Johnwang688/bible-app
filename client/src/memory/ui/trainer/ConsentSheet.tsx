// The one-time sheet before the first microphone tap: what is recorded, where it goes, and the choice. Shared: the
// answer is stored in the settings (`voiceConsent`), so answering it in one trainer answers it for all.
import { Linking, Pressable, StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../../fonts/fonts';
import { useI18n } from '../../../i18n/I18nProvider';
import { useFocusOnMount, programmaticFocus } from '../../../reader/components/a11y';
import { SheetModal } from '../../../reader/components/SheetModal';
import { useTheme } from '../../../theme/ThemeProvider';
import { MemButton } from '../parts';

const OPENROUTER_PRIVACY_URL = 'https://openrouter.ai/privacy';

export function ConsentSheet({ onAllow, onType, onClose }: { onAllow(): void; onType(): void; onClose(): void }) {
  const theme = useTheme();
  const { t } = useI18n();
  const heading = useFocusOnMount();
  const muted = { color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') };
  const points = [1, 2, 3, 4] as const;
  return (
    <SheetModal
      testID="memory-consent-sheet"
      onClose={onClose}
      header={
        <Text
          ref={heading}
          accessibilityRole="header"
          {...programmaticFocus}
          style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 21 }}
        >
          {t('memory.consent.title')}
        </Text>
      }
    >
      <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 21 }}>
        {t('memory.consent.body')}
      </Text>
      <View accessibilityRole="list" style={styles.points}>
        {points.map((n) => (
          <View key={n} style={styles.point}>
            <View accessible={false} style={[styles.dot, { backgroundColor: theme.colors.accent }]} />
            <Text style={{ flex: 1, color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '400'), fontSize: 14, lineHeight: 20 }}>
              {t(`memory.consent.point${n}` as const)}
            </Text>
          </View>
        ))}
      </View>
      <View style={styles.small}>
        <Text style={[muted, { fontSize: 12, lineHeight: 18 }]}>{t('memory.consent.small')}</Text>
        <Pressable
          accessibilityRole="link"
          accessibilityLabel={t('memory.consent.policy')}
          onPress={() => void Linking.openURL(OPENROUTER_PRIVACY_URL)}
          style={styles.link}
        >
          <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 13, textDecorationLine: 'underline' }}>
            {t('memory.consent.policy')}
          </Text>
        </Pressable>
      </View>
      <View style={styles.choice}>
        <MemButton testID="memory-consent-allow" kind="primary" block label={t('memory.consent.allow')} onPress={onAllow} />
        <Text style={[muted, styles.centre]}>{t('memory.consent.allowNote')}</Text>
      </View>
      <View style={styles.choice}>
        <MemButton testID="memory-consent-type" kind="secondary" block label={t('memory.consent.type')} onPress={onType} />
        <Text style={[muted, styles.centre]}>{t('memory.consent.typeNote')}</Text>
      </View>
    </SheetModal>
  );
}

const styles = StyleSheet.create({
  points: { gap: 8 },
  point: { flexDirection: 'row', alignItems: 'flex-start', gap: 10 },
  dot: { width: 7, height: 7, borderRadius: 999, marginTop: 7 },
  small: { gap: 2 },
  link: { minHeight: 44, justifyContent: 'center', alignSelf: 'flex-start' },
  choice: { gap: 6, alignItems: 'stretch' },
  centre: { textAlign: 'center', fontSize: 13, lineHeight: 18 },
});
