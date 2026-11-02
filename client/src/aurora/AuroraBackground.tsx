// The moving aurora behind a glass screen, on iOS and Android (R-7a). The app has no GPU drawing
// library (adding one is John's call), so native gets a lighter drift for both styles: three large
// soft orbs in the palette colours over the base, each drifting on its own slow looping path.
// Transforms only, animated on the UI thread by the native animation driver: nothing re-renders per
// frame. (React Native's Animated, not Reanimated: Reanimated 4 does not load under the app's Jest
// config, and every screen renders this.)
// Reduce Motion leaves a still layout; the drift stops while the tab is not focused or the app is
// not active. Renders nothing in the pastel style.
import { useEffect, useMemo, useState } from 'react';
import { Animated, Easing, StyleSheet, useWindowDimensions, View } from 'react-native';

import { useReduceMotion } from '../reader/components/useReduceMotion';
import { useTabFocused } from '../reader/components/useTabFocused';
import { useTheme } from '../theme/ThemeProvider';
import type { Color } from '../theme/types';
import { auroraColours } from './palette';
import { usePageVisible } from './usePageVisible';

/**
 * Where each orb sits (its centre, as a fraction of the screen, y down), how far it drifts, and
 * how long each half of its x and y loops takes (a full loop is twice that: 12 to 20 s). Colour 1
 * leans top left, colour 2 right, colour 3 bottom, as the still paint draws them.
 */
const ORBS = [
  { cx: 0.15, cy: 0.15, ax: 0.18, ay: 0.1, tx: 7000, ty: 9000 },
  { cx: 0.85, cy: 0.45, ax: 0.16, ay: 0.12, tx: 8500, ty: 6500 },
  { cx: 0.25, cy: 0.85, ax: 0.2, ay: 0.1, tx: 9500, ty: 7500 },
] as const;

/** Each orb's diameter, as a multiple of the screen width. */
const ORB_SIZE = 1.2;
const EASE = Easing.inOut(Easing.sin);

export function AuroraBackground() {
  const theme = useTheme();
  const colours = useMemo(() => auroraColours(theme), [theme]);
  if (colours === null) return null;
  return <Drift base={colours.base} colours={colours.colours} />;
}

function Drift({ base, colours }: { base: Color; colours: readonly [Color, Color, Color] }) {
  const reduceMotion = useReduceMotion();
  const focused = useTabFocused();
  const visible = usePageVisible();
  const { width, height } = useWindowDimensions();
  const moving = !reduceMotion && focused && visible;
  return (
    <View testID="aurora-background" pointerEvents="none" style={[StyleSheet.absoluteFill, styles.clip, { backgroundColor: base }]}>
      {ORBS.map((orb, i) => (
        <Orb key={i} colour={colours[i]!} orb={orb} width={width} height={height} moving={moving} still={reduceMotion} />
      ))}
    </View>
  );
}

/** Starts or stops one axis of a drift (0..1 and back). `still` puts it at the centre of its path. */
function useAxis(half: number, moving: boolean, still: boolean): Animated.Value {
  const [v] = useState(() => new Animated.Value(0.5));
  useEffect(() => {
    if (moving) {
      const leg = (to: number) => Animated.timing(v, { toValue: to, duration: half, easing: EASE, useNativeDriver: true });
      const drift = Animated.loop(Animated.sequence([leg(1), leg(0)]));
      drift.start();
      return () => drift.stop();
    }
    v.stopAnimation();
    if (still) v.setValue(0.5);
    return undefined;
  }, [v, half, moving, still]);
  return v;
}

function Orb({
  colour,
  orb,
  width,
  height,
  moving,
  still,
}: {
  colour: Color;
  orb: (typeof ORBS)[number];
  width: number;
  height: number;
  moving: boolean;
  still: boolean;
}) {
  const x = useAxis(orb.tx, moving, still);
  const y = useAxis(orb.ty, moving, still);
  const ampX = orb.ax * width;
  const ampY = orb.ay * height;
  const drift = useMemo(
    () => ({
      transform: [
        { translateX: x.interpolate({ inputRange: [0, 1], outputRange: [-ampX, ampX] }) },
        { translateY: y.interpolate({ inputRange: [0, 1], outputRange: [-ampY, ampY] }) },
      ],
    }),
    [x, y, ampX, ampY],
  );
  const size = width * ORB_SIZE;
  const place = {
    width: size,
    height: size,
    left: orb.cx * width - size / 2,
    top: orb.cy * height - size / 2,
    backgroundImage: `radial-gradient(circle at 50% 50%, ${colour} 0%, transparent 70%)`,
  };
  return <Animated.View style={[styles.orb, place, drift]} />;
}

const styles = StyleSheet.create({
  clip: { overflow: 'hidden' },
  orb: { position: 'absolute' },
});
