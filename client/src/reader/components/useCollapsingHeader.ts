// The reader header hides after the text scrolls down a little and comes back on any upward
// scroll or at the top. The scroll direction lives in a ref: state changes only when the header
// flips between hidden and shown, so scrolling causes no re-render per frame.
import { useCallback, useEffect, useRef, useState } from 'react';
import { Animated, type NativeScrollEvent, type NativeSyntheticEvent } from 'react-native';

import { useReduceMotion } from './useReduceMotion';

export const HIDE_AFTER = 24;
export const SHOW_AFTER = 8;

interface ScrollTrack {
  hidden: boolean;
  lastY: number;
  /** Where the scroll last changed direction. */
  anchorY: number;
  dir: 'up' | 'down' | 'none';
}

export function useCollapsingHeader(hideDistance: number) {
  const reduceMotion = useReduceMotion();
  const [hidden, setHidden] = useState(false);
  const [translateY] = useState(() => new Animated.Value(0));
  const track = useRef<ScrollTrack>({ hidden: false, lastY: 0, anchorY: 0, dir: 'none' });

  const setHiddenIfChanged = useCallback((hide: boolean) => {
    if (track.current.hidden === hide) return;
    track.current.hidden = hide;
    setHidden(hide);
  }, []);

  useEffect(() => {
    const to = hidden ? -hideDistance : 0;
    if (reduceMotion) {
      translateY.setValue(to);
      return;
    }
    const animation = Animated.timing(translateY, { toValue: to, duration: 200, useNativeDriver: true });
    animation.start();
    return () => animation.stop();
  }, [hidden, hideDistance, reduceMotion, translateY]);

  const onScroll = useCallback(
    (e: NativeSyntheticEvent<NativeScrollEvent>) => {
      const { contentOffset, contentSize, layoutMeasurement } = e.nativeEvent;
      // Rubber-banding past either end is not a scroll direction.
      const maxY = Math.max(0, contentSize.height - layoutMeasurement.height);
      const y = Math.min(Math.max(contentOffset.y, 0), maxY);
      const s = track.current;
      const delta = y - s.lastY;
      if (y <= 0) {
        s.dir = 'none';
        s.anchorY = 0;
        setHiddenIfChanged(false);
      } else if (delta > 0) {
        if (s.dir !== 'down') {
          s.dir = 'down';
          s.anchorY = s.lastY;
        }
        if (y - s.anchorY > HIDE_AFTER) setHiddenIfChanged(true);
      } else if (delta < 0) {
        if (s.dir !== 'up') {
          s.dir = 'up';
          s.anchorY = s.lastY;
        }
        if (s.anchorY - y > SHOW_AFTER) setHiddenIfChanged(false);
      }
      s.lastY = y;
    },
    [setHiddenIfChanged],
  );

  /** Bring the header back (the pill). The next downward scroll counts from here. */
  const show = useCallback(() => {
    track.current.dir = 'up';
    track.current.anchorY = track.current.lastY;
    setHiddenIfChanged(false);
  }, [setHiddenIfChanged]);

  /** The text jumped to the top (a new chapter). */
  const reset = useCallback(() => {
    track.current.lastY = 0;
    track.current.anchorY = 0;
    track.current.dir = 'none';
    setHiddenIfChanged(false);
  }, [setHiddenIfChanged]);

  return { hidden, translateY, onScroll, show, reset };
}
