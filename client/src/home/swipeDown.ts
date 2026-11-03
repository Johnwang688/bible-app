// Swipe down to dismiss a bottom sheet: the rule, and the PanResponder handlers that apply it.
import { useMemo } from 'react';
import { PanResponder, type GestureResponderHandlers } from 'react-native';

/** A drag of 80 pt closes the sheet; a shorter, quick flick (at least 24 pt at 0.5 pt/ms) does too. */
export function shouldDismissSheet(dy: number, vy: number): boolean {
  return dy >= 80 || (dy >= 24 && vy >= 0.5);
}

/** Handlers for the sheet's header: a mostly vertical downward drag claims the touch; releasing it may close. */
export function useSwipeDown(onClose: () => void): GestureResponderHandlers {
  return useMemo(
    () =>
      PanResponder.create({
        onMoveShouldSetPanResponder: (_e, g) => g.dy > 8 && Math.abs(g.dy) > Math.abs(g.dx),
        onPanResponderRelease: (_e, g) => {
          if (shouldDismissSheet(g.dy, g.vy)) onClose();
        },
      }).panHandlers,
    [onClose],
  );
}
