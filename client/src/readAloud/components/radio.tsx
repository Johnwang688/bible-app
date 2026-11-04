// The generic radio pattern, kept local: the onboarding privacy boundary forbids imports from that module.
// A radio group's container. It keeps `role="radiogroup"` and its label. On iOS it must not be `accessible`: a
// container that is an accessibility element makes VoiceOver treat the group as one item and it cannot reach the
// radio Pressables inside. On Android and the web it is `accessible`, so the group is announced and found by its
// role (e2e/firstRun.spec.ts looks it up with getByRole('radiogroup')); the radios stay reachable there.
import { useCallback, useRef, type ReactNode } from 'react';
import { Platform, View, type StyleProp, type ViewStyle } from 'react-native';

export function RadioGroup({ label, style, children }: { label: string; style?: StyleProp<ViewStyle>; children: ReactNode }) {
  return (
    <View accessible={Platform.OS !== 'ios'} role="radiogroup" aria-label={label} style={style}>
      {children}
    </View>
  );
}

// Arrow keys for a radio group on the web (the prototypes' `radioKeys` and `roving`): the arrows move focus
// and the choice together, wrapping at the ends, and only the checked radio (or the first, when none is
// checked) is in the tab order. On native there are no arrow keys, so this does nothing there.
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
      if (Platform.OS === 'web') (nodes.current[to] as { focus?: () => void } | null)?.focus?.();
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
