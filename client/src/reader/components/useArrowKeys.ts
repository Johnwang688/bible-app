// Web only: ArrowRight turns to the next chapter and ArrowLeft to the previous one.
import { useEffect, useRef } from 'react';
import { Platform } from 'react-native';

function typing(el: EventTarget | null): boolean {
  const node = el as HTMLElement | null;
  if (!node || typeof node.tagName !== 'string') return false;
  const tag = node.tagName.toUpperCase();
  return tag === 'INPUT' || tag === 'TEXTAREA' || tag === 'SELECT' || node.isContentEditable === true;
}

export function useArrowKeys({ onNext, onPrev, disabled }: { onNext(): void; onPrev(): void; disabled: boolean }): void {
  const latest = useRef({ onNext, onPrev, disabled });
  useEffect(() => {
    latest.current = { onNext, onPrev, disabled };
  }, [onNext, onPrev, disabled]);

  useEffect(() => {
    if (Platform.OS !== 'web' || typeof document === 'undefined') return;
    const onKeyDown = (e: KeyboardEvent) => {
      if (e.key !== 'ArrowRight' && e.key !== 'ArrowLeft') return;
      if (e.ctrlKey || e.metaKey || e.altKey || e.shiftKey) return;
      if (latest.current.disabled) return;
      if (typing(e.target) || typing(document.activeElement)) return;
      if (e.key === 'ArrowRight') latest.current.onNext();
      else latest.current.onPrev();
    };
    document.addEventListener('keydown', onKeyDown);
    return () => document.removeEventListener('keydown', onKeyDown);
  }, []);
}
