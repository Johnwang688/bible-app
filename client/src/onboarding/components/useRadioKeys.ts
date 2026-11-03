// Arrow keys for a radio group on the web (the prototypes' `radioKeys` and `roving`): the arrows move focus
// and the choice together, wrapping at the ends, and only the checked radio (or the first, when none is
// checked) is in the tab order. On native there are no arrow keys, so this does nothing there.
import { useCallback, useRef } from 'react';
import { Platform } from 'react-native';

type KeyEvent = { nativeEvent: { key: string }; preventDefault?: () => void };

export interface RadioKeyProps {
  ref: (node: unknown) => void;
  tabIndex?: 0 | -1;
  onKeyDown?: (e: KeyEvent) => void;
}

/**
 * @param count how many radios the group has
 * @param checked the index of the checked radio, or -1 for none
 * @param select makes radio `i` the choice (the same as pressing it)
 * @returns props to spread onto radio `i`
 */
export function useRadioKeys(count: number, checked: number, select: (i: number) => void): (i: number) => RadioKeyProps {
  const nodes = useRef<unknown[]>([]);
  const move = useCallback(
    (from: number, step: number) => {
      const to = (from + step + count) % count;
      select(to);
      (nodes.current[to] as { focus?: () => void } | null)?.focus?.();
    },
    [count, select],
  );
  return (i) => {
    const props: RadioKeyProps = {
      ref: (node) => {
        nodes.current[i] = node;
      },
    };
    if (Platform.OS !== 'web') return props;
    props.tabIndex = i === (checked >= 0 ? checked : 0) ? 0 : -1;
    props.onKeyDown = (e) => {
      const key = e.nativeEvent.key;
      const step = key === 'ArrowRight' || key === 'ArrowDown' ? 1 : key === 'ArrowLeft' || key === 'ArrowUp' ? -1 : 0;
      if (step === 0) return;
      e.preventDefault?.();
      move(i, step);
    };
    return props;
  };
}
