// Escape (web) and the Android back button for a root stack screen above the tabs (search, the people, places
// and themes screens). Orchestrator-owned (R-5 part 2).
//
// - Only the focused screen listens. The web stack keeps the screens below mounted (the list under a page,
//   search under an entity it opened), so a listener for the whole mount would take one Escape back twice.
// - On the web the listener is on `document` in the capture phase: React Native Web's TextInput stops Escape
//   from bubbling, so a bubble-phase listener never hears it from inside the search or filter field. It also
//   stops the event there, so listeners on the screens below (the reader's verse sheet) never see it.
// - Outside a navigator (the Jest harness) the screen counts as focused (`useTabFocused`).
import { useLayoutEffect, useRef } from 'react';
import { BackHandler, Platform } from 'react-native';

import { useTabFocused } from '../reader/components/useTabFocused';

export function useScreenBack(back: () => void): void {
  const focused = useTabFocused();
  const latest = useRef(back);
  useLayoutEffect(() => {
    latest.current = back;
  });
  useLayoutEffect(() => {
    if (!focused) return;
    if (Platform.OS === 'web') {
      if (typeof document === 'undefined') return;
      const onKeyDown = (e: KeyboardEvent) => {
        if (e.key !== 'Escape' || e.repeat || e.isComposing) return;
        e.preventDefault();
        e.stopImmediatePropagation();
        latest.current();
      };
      document.addEventListener('keydown', onKeyDown, true);
      return () => document.removeEventListener('keydown', onKeyDown, true);
    }
    const sub = BackHandler.addEventListener('hardwareBackPress', () => {
      latest.current();
      return true;
    });
    return () => sub.remove();
  }, [focused]);
}
