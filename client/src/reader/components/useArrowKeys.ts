// Web only: ArrowRight turns to the next chapter and ArrowLeft to the previous one.
import { useLayoutEffect, useRef } from 'react';
import { Platform } from 'react-native';

function typing(el: EventTarget | null): boolean {
  const node = el as HTMLElement | null;
  if (!node || typeof node.tagName !== 'string') return false;
  const tag = node.tagName.toUpperCase();
  return tag === 'INPUT' || tag === 'TEXTAREA' || tag === 'SELECT' || node.isContentEditable === true;
}

export function useArrowKeys({ onNext, onPrev, disabled }: { onNext(): void; onPrev(): void; disabled: boolean }): void {
  // Both the listener and the props it reads are set up in the layout phase, which runs in the same
  // commit that shows a change, before the browser can deliver another event. A passive effect can
  // run after the next key: then a key pressed right after a sheet closes or the reader's tab
  // regains focus would be judged by the previous render's `disabled`, or, since Expo Router hides
  // unfocused tabs in a React <Activity> (which tears down effects and sets them up again when the
  // tab shows), find no listener at all. The listener is added once per mount (or reveal), not
  // once per render.
  const latest = useRef({ onNext, onPrev, disabled });
  useLayoutEffect(() => {
    latest.current = { onNext, onPrev, disabled };
  }, [onNext, onPrev, disabled]);

  useLayoutEffect(() => {
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
