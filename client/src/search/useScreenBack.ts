// Escape (web) and the Android back button for a root stack screen above the tabs (search, the people, places
// and themes screens). Orchestrator-owned (R-5 part 2).
//
// - Only the focused screen listens. The web stack keeps the screens below mounted (the list under a page,
//   search under an entity it opened), so a listener for the whole mount would take one Escape back twice.
// - On the web the screen is a layer of the shared Escape stack (`components/escapeStack`): it hears Escape from
//   inside the search or filter field too, and a press it takes never reaches the layers below it (the reader's
//   verse sheet). A sheet opened above the screen takes the press first.
// - Outside a navigator (the Jest harness) the screen counts as focused (`useTabFocused`).
import { useLayoutEffect, useRef } from 'react';
import { BackHandler, Platform } from 'react-native';

import { useEscapeKey } from '../components/escapeStack';
import { useTabFocused } from '../reader/components/useTabFocused';

export function useScreenBack(back: () => void): void {
  const focused = useTabFocused();
  useEscapeKey(back, { enabled: focused });
  const latest = useRef(back);
  useLayoutEffect(() => {
    latest.current = back;
  });
  useLayoutEffect(() => {
    if (!focused || Platform.OS === 'web') return;
    const sub = BackHandler.addEventListener('hardwareBackPress', () => {
      latest.current();
      return true;
    });
    return () => sub.remove();
  }, [focused]);
}
