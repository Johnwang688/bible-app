// A surface in the current style. Pastel: the flat fill. Aurora glass: the system glass
// material on iOS 26 (expo-glass-effect), a blur on Android (expo-blur) and a CSS backdrop
// filter on the web, each with the preset's glass paint on top.
import { BlurView } from 'expo-blur';
import { GlassView, isLiquidGlassAvailable } from 'expo-glass-effect';
import type { ReactNode } from 'react';
import { Platform, StyleSheet, View, type StyleProp, type ViewStyle } from 'react-native';

import { useTheme } from '../theme/ThemeProvider';
import type { Background } from '../theme/types';

export function GlassSurface({
  background,
  style,
  children,
  testID,
}: {
  background: Background;
  style?: StyleProp<ViewStyle>;
  children?: ReactNode;
  testID?: string;
}) {
  const theme = useTheme();
  if (theme.style !== 'glass' || theme.blur.css === null) {
    return (
      <View testID={testID} style={[background, style]}>
        {children}
      </View>
    );
  }
  if (Platform.OS === 'web') {
    // React Native Web passes backdropFilter through to CSS.
    const web = { backdropFilter: theme.blur.css, WebkitBackdropFilter: theme.blur.css } as ViewStyle;
    return (
      <View testID={testID} style={[background, web, style]}>
        {children}
      </View>
    );
  }
  const tint = theme.mode === 'dark' ? 'dark' : 'light';
  return (
    <View testID={testID} style={[styles.clip, style]}>
      {Platform.OS === 'ios' && isLiquidGlassAvailable() ? (
        <GlassView style={StyleSheet.absoluteFill} glassEffectStyle="regular" colorScheme={tint} />
      ) : (
        <BlurView
          style={StyleSheet.absoluteFill}
          tint={tint}
          intensity={Math.min(100, theme.blur.radius * 5)}
          blurMethod="dimezisBlurViewSdk31Plus"
        />
      )}
      <View style={[StyleSheet.absoluteFill, background]} />
      {children}
    </View>
  );
}

const styles = StyleSheet.create({ clip: { overflow: 'hidden' } });
