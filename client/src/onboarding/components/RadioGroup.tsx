// A radio group's container. It keeps `role="radiogroup"` and its label. On iOS it must not be `accessible`: a
// container that is an accessibility element makes VoiceOver treat the group as one item and it cannot reach the
// radio Pressables inside. On Android and the web it is `accessible`, so the group is announced and found by its
// role (e2e/firstRun.spec.ts looks it up with getByRole('radiogroup')); the radios stay reachable there.
import type { ReactNode } from 'react';
import { Platform, View, type StyleProp, type ViewStyle } from 'react-native';

export function RadioGroup({ label, style, children }: { label: string; style?: StyleProp<ViewStyle>; children: ReactNode }) {
  return (
    <View accessible={Platform.OS !== 'ios'} role="radiogroup" aria-label={label} style={style}>
      {children}
    </View>
  );
}
