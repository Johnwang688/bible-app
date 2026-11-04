// The frame every tab screen sits in: the theme's background and a safe-area-aware title.
// The Bible tab uses the reader background, so Scripture never sits on the glass orbs.
// On the app background, glass looks get the moving aurora behind the content and a soft shadow on
// the title; the root's still paint stays underneath as the fallback.
import type { ReactNode } from 'react';
import { ScrollView, StyleSheet, Text, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { useColumn } from './ContentColumn';
import { AuroraBackground, auroraTextShadow } from '../aurora';
import { uiFace } from '../fonts/fonts';
import { useT } from '../i18n/I18nProvider';
import type { MessageKey } from '../i18n/messages/en';
import { useTheme } from '../theme/ThemeProvider';

export function Screen({
  titleKey,
  background = 'app',
  testID,
  children,
}: {
  titleKey: MessageKey;
  background?: 'app' | 'reader';
  testID?: string;
  children?: ReactNode;
}) {
  const column = useColumn('text', 20);
  const theme = useTheme();
  const t = useT();
  const insets = useSafeAreaInsets();
  const onAurora = background === 'app';
  return (
    <View testID={testID} style={[styles.fill, theme.backgrounds[background]]}>
      {onAurora ? <AuroraBackground /> : null}
      <ScrollView testID={testID ? `${testID}-scroll` : undefined} contentContainerStyle={[styles.content, column, { paddingTop: insets.top + 16 }]}>
        <Text
          accessibilityRole="header"
          style={{
            color: theme.colors.text,
            fontFamily: uiFace(theme.type.head, theme.type.headWeight),
            fontSize: theme.type.headSize,
            letterSpacing: theme.type.headLetterSpacing,
            ...(onAurora ? auroraTextShadow(theme) : null),
          }}
        >
          {t(titleKey)}
        </Text>
        {children}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1 },
  content: { paddingHorizontal: 20, paddingBottom: 120 },
});
