import { useLayoutEffect, useRef } from 'react';
import { Platform, useWindowDimensions } from 'react-native';
import { hasVisibleModal } from '../../../components/hasVisibleModal';

/** Leave Enter to fields and focused controls (including controls nested inside a button). */
export function enterCheckAllowed(event: KeyboardEvent, active: Element | null, doc = typeof document === 'undefined' ? undefined : document): boolean {
  if (event.key !== 'Enter' || event.defaultPrevented || event.repeat || event.isComposing || event.ctrlKey || event.altKey || event.metaKey || event.shiftKey) return false;
  if (doc && hasVisibleModal(doc)) return false;
  const selector = 'input, textarea, select, button, a, [contenteditable]:not([contenteditable="false"]), [role="button"], [role="link"], [role="tab"], [role="radio"], [role="checkbox"], [role="switch"], [role="slider"], [role="combobox"]';
  const target = event.target as Element | null;
  return !active?.closest(selector) && !target?.closest?.(selector);
}

export function useEnterCheck(available: boolean, check: () => void): void {
  const { width } = useWindowDimensions();
  const latest = useRef({ available, check });
  useLayoutEffect(() => { latest.current = { available, check }; }, [available, check]);
  useLayoutEffect(() => {
    if (Platform.OS !== 'web' || width < 768 || typeof document === 'undefined') return;
    const onKey = (event: KeyboardEvent) => {
      if (!latest.current.available || !enterCheckAllowed(event, document.activeElement)) return;
      event.preventDefault();
      latest.current.check();
    };
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [width]);
}
