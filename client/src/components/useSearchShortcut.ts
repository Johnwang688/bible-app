import { useEffect } from 'react';
import { Platform } from 'react-native';

export function searchShortcutAllowed(event: KeyboardEvent, doc: Document): boolean {
  if (event.defaultPrevented || event.repeat || event.isComposing || event.altKey) return false;
  const shortcut = (event.key === '/' && !event.ctrlKey && !event.metaKey) ||
    (event.key.toLowerCase() === 'k' && (event.ctrlKey || event.metaKey));
  if (!shortcut) return false;
  const target = doc.activeElement;
  if (target?.closest('input, textarea, [contenteditable]:not([contenteditable="false"])')) return false;
  return !Array.from(doc.querySelectorAll('[aria-modal="true"]')).some((node) => node.getClientRects().length > 0);
}

export function useSearchShortcut(enabled: boolean, open: () => void) {
  useEffect(() => {
    if (!enabled || Platform.OS !== 'web' || typeof document === 'undefined') return;
    const onKey = (event: KeyboardEvent) => {
      if (!searchShortcutAllowed(event, document)) return;
      event.preventDefault();
      open();
    };
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [enabled, open]);
}
