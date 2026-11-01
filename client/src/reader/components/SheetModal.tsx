// The bottom-sheet frame shared by the book picker, the version picker and the reading settings:
// a transparent Modal, the scrim, then the sheet with its grabber (Picker.dc.html).
import type { ReactNode } from 'react';
import { Modal, Pressable, StyleSheet, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { GlassSurface } from '../../components/GlassSurface';
import { SCRIM } from '../../theme/overlays';
import { useTheme } from '../../theme/ThemeProvider';
import { useReduceMotion } from './useReduceMotion';

export const SHEET_MAX_WIDTH = 560;

export function SheetModal({
  testID,
  onClose,
  tall = false,
  children,
}: {
  testID: string;
  onClose(): void;
  /** Fill the screen below the status bar (the book picker) instead of fitting the content. */
  tall?: boolean;
  children: ReactNode;
}) {
  const theme = useTheme();
  const insets = useSafeAreaInsets();
  const reduceMotion = useReduceMotion();
  const radius = theme.radii.sheet;
  const border = theme.borders.sheet;

  return (
    <Modal
      transparent
      visible
      statusBarTranslucent
      animationType={reduceMotion ? 'none' : 'slide'}
      onRequestClose={onClose}
    >
      <View style={[styles.fill, tall && { paddingTop: insets.top + 10 }]}>
        <Pressable accessible={false} style={[StyleSheet.absoluteFill, styles.scrim]} onPress={onClose} />
        <GlassSurface
          testID={testID}
          background={theme.backgrounds.sheet}
          style={[
            styles.sheet,
            tall && styles.tall,
            {
              borderTopLeftRadius: radius,
              borderTopRightRadius: radius,
              borderWidth: border.width,
              borderBottomWidth: 0,
              borderColor: border.color,
              boxShadow: theme.shadows.sheet ?? undefined,
              paddingBottom: Math.max(insets.bottom, 12) + 12,
            },
          ]}
        >
          <View
            accessible={false}
            style={[styles.grabber, { backgroundColor: theme.canvas.grabber ?? theme.colors.muted }]}
          />
          {children}
        </GlassSurface>
      </View>
    </Modal>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1, justifyContent: 'flex-end', alignItems: 'center' },
  scrim: { backgroundColor: SCRIM },
  sheet: { width: '100%', maxWidth: SHEET_MAX_WIDTH, paddingHorizontal: 16, paddingTop: 8, gap: 12 },
  tall: { flex: 1 },
  grabber: { alignSelf: 'center', width: 36, height: 5, borderRadius: 999 },
});
