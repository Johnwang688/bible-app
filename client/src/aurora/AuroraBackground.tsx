// The moving aurora behind a glass screen, on iOS and Android (R-7a). The app has no GPU drawing
// library (adding one is John's call), so native gets a lighter drift for both styles: three large
// soft orbs in the palette colours over the base, each drifting on its own slow looping path.
// Transforms only, animated on the UI thread by the native animation driver: each axis is one
// native timing of its phase (0 to 1, looped natively, so no JavaScript runs between loops) and
// `interpolate` turns the phase into the there-and-back sway. Nothing re-renders per frame. (React Native's Animated, not Reanimated: Reanimated 4 does not load under the app's Jest
// config, and every screen renders this.)
// Reduce Motion leaves a still layout; the drift stops while the tab is not focused or the app is
// not active. Renders nothing in the pastel style.
import { useEffect, useMemo, useRef, useState } from 'react';
import { Animated, Easing, StyleSheet, useWindowDimensions, View } from 'react-native';

import { useReduceMotion } from '../reader/components/useReduceMotion';
import { useTabFocused } from '../reader/components/useTabFocused';
import { useTheme } from '../theme/ThemeProvider';
import type { Color } from '../theme/types';
import { auroraColours } from './palette';
import { usePageVisible } from './usePageVisible';

/**
 * Where each orb sits (its centre, as a fraction of the screen, y down), how far it drifts, and
 * how long its x and y loops take (12 to 20 s). Colour 1 leans top left, colour 2 right, colour 3
 * bottom, as the still paint draws them.
 */
const ORBS = [
  { cx: 0.15, cy: 0.15, ax: 0.18, ay: 0.1, tx: 14000, ty: 18000 },
  { cx: 0.85, cy: 0.45, ax: 0.16, ay: 0.12, tx: 17000, ty: 13000 },
  { cx: 0.25, cy: 0.85, ax: 0.2, ay: 0.1, tx: 19000, ty: 15000 },
] as const;

/** Each orb's diameter, as a multiple of the screen width. */
const ORB_SIZE = 1.2;

/**
 * The sway over one loop, sampled for `interpolate` (the native driver interpolates piecewise
 * linearly): phase 0..1 maps to sin(2πφ), from the centre out to +1, back through the centre to -1
 * and home, so the loop's end meets its start. 32 samples keep it within 0.5% of a true sine.
 */
const SAMPLES = 32;
const PHASES = Array.from({ length: SAMPLES + 1 }, (_, i) => i / SAMPLES);
const SWAY = PHASES.map((p) => Math.sin(2 * Math.PI * p));

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

/**
 * One axis of a drift: its phase in its loop (0..1), animated on the UI thread while `moving`.
 * `still` puts it at the centre of its path (phase 0). Pausing keeps the phase, and resuming
 * finishes the interrupted loop before looping again, so the orb never jumps.
 */
function useAxis(period: number, moving: boolean, still: boolean): Animated.Value {
  const [v] = useState(() => new Animated.Value(0));
  // Where the phase stood when the drift last stopped (tracked by time: the native value is not
  // read back synchronously).
  const phase = useRef(0);
  useEffect(() => {
    if (!moving) {
      v.stopAnimation();
      if (still) {
        phase.current = 0;
        v.setValue(0);
      }
      return undefined;
    }
    let current: Animated.CompositeAnimation | null = null;
    let from = phase.current;
    let startedAt = Date.now();
    let stopped = false;
    // One linear native timing over the whole loop, looped natively: the loop never returns to
    // JavaScript between iterations.
    const loop = () => {
      from = 0;
      startedAt = Date.now();
      v.setValue(0);
      current = Animated.loop(
        Animated.timing(v, { toValue: 1, duration: period, easing: Easing.linear, useNativeDriver: true }),
      );
      current.start();
    };
    if (from > 0) {
      // Finish the loop the pause interrupted, then loop from the start (phase 1 = phase 0).
      v.setValue(from);
      current = Animated.timing(v, {
        toValue: 1,
        duration: Math.max(1, (1 - from) * period),
        easing: Easing.linear,
        useNativeDriver: true,
      });
      current.start(({ finished }) => {
        if (finished && !stopped) loop();
      });
    } else {
      loop();
    }
    return () => {
      stopped = true;
      current?.stop();
      phase.current = (from + (Date.now() - startedAt) / period) % 1;
    };
  }, [v, period, moving, still]);
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
        { translateX: x.interpolate({ inputRange: PHASES, outputRange: SWAY.map((s) => s * ampX) }) },
        { translateY: y.interpolate({ inputRange: PHASES, outputRange: SWAY.map((s) => s * ampY) }) },
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
