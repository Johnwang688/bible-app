// The bottom-sheet frame shared by the book picker, the version picker and the reading settings:
// a transparent Modal, the scrim, then the sheet with its grabber (Picker.dc.html).
import type { ReactNode } from 'react';
import { KeyboardAvoidingView, Modal, Platform, Pressable, ScrollView, StyleSheet, useWindowDimensions, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { GlassSurface } from '../../components/GlassSurface';
import { SCRIM } from '../../theme/overlays';
import { useTheme } from '../../theme/ThemeProvider';
import { useReduceMotion } from './useReduceMotion';

export const SHEET_MAX_WIDTH = 560;
/** Space kept between a capped sheet and the top safe area. */
const SHEET_TOP_GAP = 10;

export function SheetModal({
  testID,
  onClose,
  onRequestClose,
  avoidKeyboard = false,
  tall = false,
  header,
  children,
}: {
  testID: string;
  onClose(): void;
  /** Escape and the Android back button; defaults to `onClose`. A sheet with sub-views steps back here. */
  onRequestClose?(): void;
  /** Lift the sheet above the on-screen keyboard (a sheet with a text field). */
  avoidKeyboard?: boolean;
  /** Fill the screen below the status bar (the book picker) instead of fitting the content. */
  tall?: boolean;
  /** Pinned above the scrolling body, so it stays visible when the sheet is capped to a short screen. */
  header?: ReactNode;
  children: ReactNode;
}) {
  const theme = useTheme();
  const insets = useSafeAreaInsets();
  const { height: windowHeight } = useWindowDimensions();
  const reduceMotion = useReduceMotion();
  const radius = theme.radii.sheet;
  const border = theme.borders.sheet;

  return (
    <Modal
      transparent
      visible
      statusBarTranslucent
      animationType={reduceMotion ? 'none' : 'slide'}
      onRequestClose={onRequestClose ?? onClose}
    >
      <KeyboardAvoidingView
        enabled={avoidKeyboard}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        style={[styles.fill, tall && { paddingTop: insets.top + 10 }]}
      >
        <Pressable accessible={false} style={[StyleSheet.absoluteFill, styles.scrim]} onPress={onClose} />
        <GlassSurface
          testID={testID}
          background={theme.backgrounds.sheet}
          style={[
            styles.sheet,
            tall ? styles.tall : { maxHeight: Math.max(0, windowHeight - insets.top - SHEET_TOP_GAP) },
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
          {header}
          {header !== undefined && !tall ? (
            <ScrollView
              style={styles.body}
              contentContainerStyle={styles.bodyContent}
              keyboardShouldPersistTaps="handled"
            >
              {children}
            </ScrollView>
          ) : (
            children
          )}
        </GlassSurface>
      </KeyboardAvoidingView>
    </Modal>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1, justifyContent: 'flex-end', alignItems: 'center' },
  scrim: { backgroundColor: SCRIM },
  sheet: { width: '100%', maxWidth: SHEET_MAX_WIDTH, paddingHorizontal: 16, paddingTop: 8, gap: 12 },
  tall: { flex: 1 },
  body: { flexGrow: 0, flexShrink: 1, minHeight: 0 },
  bodyContent: { gap: 12 },
  grabber: { alignSelf: 'center', width: 36, height: 5, borderRadius: 999 },
});
