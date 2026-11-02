// Whether the screen's tab is the one showing, or the one the user has just chosen. Expo Router
// keeps visited tabs mounted on web, so anything global (like the keyboard listener) must check
// this.
//
// A tab press does not switch tabs at once: Expo Router queues the navigation and applies it in a
// later render (often in a transition), so `useIsFocused` stays false for a moment after the press
// while the user already means this tab. The tab bar emits `tabPress` to the chosen screen inside
// the press itself, so from that event this hook also reports true, until the navigator's state
// next changes (by then `useIsFocused` is current again, whichever way the navigation went).
//
// Outside a navigator (the Jest harness) there is no navigation context and `useIsFocused` throws;
// there the screen counts as focused. Whether a navigator exists never changes while a screen is
// mounted, so the hook order stays the same on every render.
import { useIsFocused, useNavigation } from 'expo-router';
import { useEffect, useState } from 'react';

/** The two navigator events used here (`tabPress` is not in the generic navigation event map). */
type TabEvents = { addListener(type: 'tabPress' | 'state', listener: () => void): () => void };

function useFocusedOrNull(): boolean | null {
  try {
    return useIsFocused();
  } catch {
    return null;
  }
}

function useNavigationOrNull(): TabEvents | null {
  try {
    return useNavigation<TabEvents | undefined>() ?? null;
  } catch {
    return null;
  }
}

export function useTabFocused(): boolean {
  const focused = useFocusedOrNull() ?? true;
  const navigation = useNavigationOrNull();
  const [chosen, setChosen] = useState(false);
  useEffect(() => {
    if (!navigation) return;
    const offPress = navigation.addListener('tabPress', () => setChosen(true));
    const offState = navigation.addListener('state', () => setChosen(false));
    return () => {
      offPress();
      offState();
    };
  }, [navigation]);
  return focused || chosen;
}
