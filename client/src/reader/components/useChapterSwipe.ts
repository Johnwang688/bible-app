// Native swipe between chapters. Only a clearly horizontal move is claimed, so vertical
// scrolling and verse taps keep working.
import { useMemo } from 'react';
import { PanResponder, Platform, type GestureResponderHandlers } from 'react-native';

export type SwipeDirection = 'next' | 'prev';

const MIN_DISTANCE = 60;
const CLAIM_DISTANCE = 12;

/** Left is next, right is previous; null for a short or mostly vertical move. */
export function swipeDirection(dx: number, dy: number): SwipeDirection | null {
  if (Math.abs(dx) >= MIN_DISTANCE && Math.abs(dx) > 2 * Math.abs(dy)) return dx < 0 ? 'next' : 'prev';
  return null;
}

/** `onSwipe` should be stable (the responder is rebuilt when it changes). */
export function useChapterSwipe(onSwipe: (direction: SwipeDirection) => void): GestureResponderHandlers {
  const responder = useMemo(
    () =>
      PanResponder.create({
        onMoveShouldSetPanResponderCapture: (_e, g) =>
          Math.abs(g.dx) > CLAIM_DISTANCE && Math.abs(g.dx) > 2 * Math.abs(g.dy),
        onPanResponderTerminationRequest: () => false,
        onPanResponderRelease: (_e, g) => {
          const direction = swipeDirection(g.dx, g.dy);
          if (direction) onSwipe(direction);
        },
      }),
    [onSwipe],
  );

  // The web turns chapters with the arrow keys, and a mouse drag there selects text.
  return Platform.OS === 'web' ? {} : responder.panHandlers;
}
