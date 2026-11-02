// Screen-reader helpers shared by the reader's sheets: announcements and moving focus.
import { useEffect, useRef, type ComponentRef } from 'react';
import { AccessibilityInfo, findNodeHandle, Platform, type Text } from 'react-native';

/** Let a sheet's slide-in finish before focus moves into it. */
const FOCUS_DELAY_MS = 150;

export function announce(message: string): void {
  try {
    AccessibilityInfo.announceForAccessibility(message);
  } catch {
    // Announcements are a courtesy; never break an action over one.
  }
}

/** Moves screen-reader (and, on the web, keyboard) focus to a rendered node. */
export function focusNode(node: unknown): void {
  if (!node) return;
  try {
    if (Platform.OS === 'web') {
      (node as { focus?: () => void }).focus?.();
      return;
    }
    const tag = findNodeHandle(node as never);
    if (tag) AccessibilityInfo.setAccessibilityFocus(tag);
  } catch {
    // The node may be gone already.
  }
}

/** Focus on the web must be allowed on a non-interactive element (a heading) to be programmatic. */
export const programmaticFocus = (Platform.OS === 'web' ? { tabIndex: -1 } : {}) as object;

/** A ref for a heading: it receives focus once the component has mounted (after the sheet has settled). */
export function useFocusOnMount(enabled = true) {
  const ref = useRef<ComponentRef<typeof Text>>(null);
  useEffect(() => {
    if (!enabled) return;
    const id = setTimeout(() => focusNode(ref.current), FOCUS_DELAY_MS);
    return () => clearTimeout(id);
  }, [enabled]);
  return ref;
}

/** Focus a node after a short delay (returning to the verse-tools button once a sheet has closed). */
export function focusNodeSoon(node: unknown): void {
  setTimeout(() => focusNode(node), FOCUS_DELAY_MS);
}
