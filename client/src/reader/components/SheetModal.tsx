// The bottom-sheet frame shared by the book picker, the version picker, the reading settings and the verse
// sheet: a transparent Modal, the scrim, then the sheet with its grabber (Picker.dc.html). The verse sheet
// opts out of the Modal and the scrim (`modal={false}`): the chapter stays usable above it.
// Escape on the web goes through the shared Escape stack (`components/escapeStack`), not the Modal's own keyup
// handler, so a press closes only the topmost layer.
import { useCallback, useId, useLayoutEffect, useState, type ReactNode } from 'react';
import { KeyboardAvoidingView, Modal, Platform, Pressable, ScrollView, StyleSheet, useWindowDimensions, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { useEscapeKey } from '../../components/escapeStack';
import { GlassSurface } from '../../components/GlassSurface';
import { BREAKPOINT } from '../../components/layout';
import { SCRIM } from '../../theme/overlays';
import { useTheme } from '../../theme/ThemeProvider';
import { useReduceMotion } from './useReduceMotion';

export const SHEET_MAX_WIDTH = 560;
/** The web Modal's own Escape (on keyup) is ignored: the Escape stack handles the keydown. */
const ignoreRequestClose = () => {};
/** Space kept between a capped sheet and the top safe area. */
const SHEET_TOP_GAP = 10;
/** A non-modal sheet takes at most this share of the window, so the chapter stays in view above it. */
const FLOATING_MAX_SHARE = 0.65;

export function SheetModal({
  testID,
  onClose,
  onRequestClose,
  avoidKeyboard = false,
  tall = false,
  modal = true,
  dock = false,
  onHeight,
  header,
  children,
}: {
  testID: string;
  onClose(): void;
  /** Escape (web, via the Escape stack) and the Android back button; defaults to `onClose`. A sheet with sub-views steps back here. */
  onRequestClose?(): void;
  /** Lift the sheet above the on-screen keyboard (a sheet with a text field). */
  avoidKeyboard?: boolean;
  /** Fill the screen below the status bar (the book picker) instead of fitting the content. */
  tall?: boolean;
  /**
   * False: no Modal and no scrim. The sheet sits at the bottom of its parent and everything above it stays
   * touchable. `onRequestClose` is not called then; the owner handles Escape and back itself.
   */
  modal?: boolean;
  /** Verse tools only: a non-modal side panel at desktop widths. */
  dock?: boolean;
  /** The sheet's height whenever it changes (a non-modal sheet's parent keeps its content clear of it). */
  onHeight?(height: number): void;
  /** Pinned above the scrolling body, so it stays visible when the sheet is capped to a short screen. */
  header?: ReactNode;
  children: ReactNode;
}) {
  const theme = useTheme();
  const insets = useSafeAreaInsets();
  const { width: windowWidth, height: windowHeight } = useWindowDimensions();
  const dialog = modal && windowWidth >= BREAKPOINT.rail;
  const docked = dock && !modal && windowWidth >= BREAKPOINT.rail;
  const dockInset = windowWidth < 1280 ? 12 : 16;
  const titleId = useId();
  const [surface, setSurface] = useState<HTMLElement | null>(null);
  const surfaceRef = useCallback((node: unknown) => setSurface(node as HTMLElement | null), []);
  useLayoutEffect(() => {
    if (Platform.OS !== 'web' || !modal || !surface || typeof document === 'undefined') return;
    const label = () => {
      const heading = surface.querySelector('[role="heading"]');
      if (heading) {
        heading.id = titleId;
        surface.setAttribute('aria-labelledby', titleId);
      } else {
        surface.removeAttribute('aria-labelledby');
      }
    };
    label();
    // Sub-views can change inside a sheet without re-rendering this frame.
    const observer = new MutationObserver(label);
    observer.observe(surface, { childList: true, subtree: true, characterData: true, attributes: true, attributeFilter: ['role'] });
    return () => observer.disconnect();
  }, [modal, surface, titleId, header, children]);
  const reduceMotion = useReduceMotion();
  const radius = theme.radii.sheet;
  // A modal sheet is a layer of the Escape stack, found by its test ID inside its Modal. On the web the Modal gets
  // no Escape handler of its own (it would act on the keyup, after the stack has handled the keydown).
  const requestClose = onRequestClose ?? onClose;
  useEscapeKey(requestClose, { enabled: modal, modalTestID: modal ? testID : null });
  const border = theme.borders.sheet;

  const sheet = (
    <GlassSurface
      testID={testID}
      background={theme.backgrounds.sheet}
      surfaceRef={Platform.OS === 'web' && modal ? surfaceRef : undefined}
      webProps={Platform.OS === 'web' && modal ? { role: 'dialog', 'aria-modal': true } : undefined}
      style={[
        styles.sheet,
        docked ? { flex: 1, maxHeight: '100%', paddingTop: 16 } : dialog
          ? { maxWidth: Math.min(440, windowWidth - 48), maxHeight: windowHeight - 48, ...(tall ? { height: Math.min(720, windowHeight - 48) } : {}) }
          : tall ? styles.tall : { maxHeight: Math.max(0, modal ? windowHeight - insets.top - SHEET_TOP_GAP : Math.round(windowHeight * FLOATING_MAX_SHARE)) },
        {
          borderTopLeftRadius: radius,
          borderTopRightRadius: radius,
          borderWidth: border.width,
          borderBottomWidth: dialog || docked ? border.width : 0,
          borderBottomLeftRadius: dialog || docked ? radius : 0,
          borderBottomRightRadius: dialog || docked ? radius : 0,
          borderColor: border.color,
          boxShadow: theme.shadows.sheet ?? undefined,
          paddingBottom: Math.max(insets.bottom, 12) + 12,
          ...(dialog ? { paddingTop: 16 } : {}),
        },
      ]}
    >
      {!dialog && !docked ? <View testID="sheet-grabber" accessible={false} style={[styles.grabber, { backgroundColor: theme.canvas.grabber ?? theme.colors.muted }]} /> : null}
      {header}
      {header !== undefined && !tall ? (
        <ScrollView style={styles.body} contentContainerStyle={styles.bodyContent} keyboardShouldPersistTaps="handled">
          {children}
        </ScrollView>
      ) : (
        children
      )}
    </GlassSurface>
  );

  if (!modal) {
    // box-none all the way down: the empty area around the sheet passes touches through to the chapter.
    return (
      <KeyboardAvoidingView
        enabled={avoidKeyboard}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        pointerEvents="box-none"
        style={[StyleSheet.absoluteFill, styles.fill, styles.floating]}
      >
        <View
          pointerEvents="box-none"
          onLayout={onHeight ? (e) => onHeight(docked ? 0 : e.nativeEvent.layout.height) : undefined}
          style={[styles.floatingSheet, docked && { position: 'absolute', top: dockInset, bottom: dockInset, right: dockInset, width: windowWidth < 1280 ? 304 : 328 }]}
        >
          {sheet}
        </View>
      </KeyboardAvoidingView>
    );
  }

  return (
    <Modal
      testID={`${testID}-modal`}
      transparent
      visible
      statusBarTranslucent
      animationType={reduceMotion ? 'none' : dialog ? 'fade' : 'slide'}
      onRequestClose={Platform.OS === 'web' ? ignoreRequestClose : requestClose}
    >
      <KeyboardAvoidingView
        enabled={avoidKeyboard}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        style={[styles.fill, dialog ? { justifyContent: 'center' } : tall && { paddingTop: insets.top + 10 }]}
      >
        <Pressable testID={`${testID}-scrim`} accessible={false} {...(Platform.OS === 'web' ? { tabIndex: -1 } : {})} style={[StyleSheet.absoluteFill, styles.scrim]} onPress={onClose} />
        {sheet}
      </KeyboardAvoidingView>
    </Modal>
  );
}

const styles = StyleSheet.create({
  fill: { flex: 1, justifyContent: 'flex-end', alignItems: 'center' },
  floating: { zIndex: 10, elevation: 10 },
  floatingSheet: { width: '100%', maxWidth: SHEET_MAX_WIDTH, flexShrink: 1 },
  scrim: { backgroundColor: SCRIM },
  sheet: { width: '100%', maxWidth: SHEET_MAX_WIDTH, paddingHorizontal: 16, paddingTop: 8, gap: 12 },
  tall: { flex: 1 },
  body: { flexGrow: 0, flexShrink: 1, minHeight: 0 },
  bodyContent: { gap: 12 },
  grabber: { alignSelf: 'center', width: 36, height: 5, borderRadius: 999 },
});
