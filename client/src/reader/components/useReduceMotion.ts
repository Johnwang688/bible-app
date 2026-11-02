// Follows the system Reduce Motion setting.
import { useEffect, useState } from 'react';
import { AccessibilityInfo, Platform } from 'react-native';

// On the web the setting can be read at once, so a sheet mounts with its final animation type. It must:
// react-native-web's Modal becomes active (its Escape listener and focus trap) only when its open animation
// ends, and an animation type that changes from 'slide' to 'none' mid-way never ends, which would leave the
// book picker, version picker and reading settings deaf to Escape under Reduce Motion.
function initialReduceMotion(): boolean {
  if (Platform.OS !== 'web' || typeof window === 'undefined' || typeof window.matchMedia !== 'function') return false;
  try {
    return window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  } catch {
    return false;
  }
}

export function useReduceMotion(): boolean {
  const [reduce, setReduce] = useState(initialReduceMotion);
  useEffect(() => {
    let live = true;
    AccessibilityInfo.isReduceMotionEnabled()
      .then((on) => {
        if (live) setReduce(on);
      })
      .catch(() => undefined);
    const sub = AccessibilityInfo.addEventListener('reduceMotionChanged', setReduce);
    return () => {
      live = false;
      sub.remove();
    };
  }, []);
  return reduce;
}
