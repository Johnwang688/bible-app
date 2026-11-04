import { useLayoutEffect, useRef, type ComponentRef, type RefObject } from 'react';
import { Platform, ScrollView, useWindowDimensions } from 'react-native';

import { hasVisibleModal } from '../../components/hasVisibleModal';

const SCROLL_KEYS = new Set(['PageDown', 'PageUp', ' ', 'Home', 'End', 'ArrowDown', 'ArrowUp']);

/** Fresh web readers have no focused scroller. Route scroll keys without moving focus. */
export function useReaderScrollKeys(scrollRef: RefObject<ComponentRef<typeof ScrollView> | null>, enabled: boolean): void {
  const { width } = useWindowDimensions();
  const latest = useRef(enabled);
  useLayoutEffect(() => { latest.current = enabled; }, [enabled]);
  useLayoutEffect(() => {
    if (Platform.OS !== 'web' || width < 768 || typeof document === 'undefined') return;
    const onKey = (event: KeyboardEvent) => {
      if (!SCROLL_KEYS.has(event.key)) return;
      if (!latest.current || event.defaultPrevented || event.ctrlKey || event.altKey || event.metaKey || event.isComposing) return;
      const active = document.activeElement;
      if (active && active !== document.body && active.id !== 'main-content') return;
      if (hasVisibleModal(document)) return;
      // Also guard a dispatched control event before the browser has focused that control.
      const target = event.target as Element | null;
      if (target?.closest?.('input, textarea, select, button, a, [contenteditable]:not([contenteditable="false"]), [role="button"], [role="link"], [role="tab"], [role="radio"], [data-testid="verse-sheet"]')) return;
      const node = (scrollRef.current as unknown as { getScrollableNode?(): HTMLElement } | null)?.getScrollableNode?.();
      if (!node) return;
      const page = node.clientHeight * 0.9;
      let top: number;
      switch (event.key) {
        case 'PageDown': top = node.scrollTop + page; break;
        case 'PageUp': top = node.scrollTop - page; break;
        case ' ': top = node.scrollTop + (event.shiftKey ? -page : page); break;
        case 'Home': top = 0; break;
        case 'End': top = node.scrollHeight - node.clientHeight; break;
        case 'ArrowDown': top = node.scrollTop + 40; break;
        case 'ArrowUp': top = node.scrollTop - 40; break;
        default: return;
      }
      event.preventDefault();
      node.scrollTop = Math.max(0, Math.min(top, node.scrollHeight - node.clientHeight));
    };
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [scrollRef, width]);
}
