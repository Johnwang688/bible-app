// Whether the screen's tab is the one showing. Expo Router keeps visited tabs mounted on web, so
// anything global (like the keyboard listener) must check this. Outside a navigator (the Jest
// harness) there is no navigation context and `useIsFocused` throws; there the screen counts as
// focused. It throws before it calls any other hook, and whether a navigator exists never changes
// while a screen is mounted, so the hook order stays the same on every render.
import { useIsFocused } from 'expo-router';

export function useTabFocused(): boolean {
  try {
    return useIsFocused();
  } catch {
    return true;
  }
}
