// A radio group's container. `accessible` is set because the test library only finds an element by role when
// it is an accessibility element; the radios inside are Pressables and stay reachable on Android and the web.
// (On iOS a container marked accessible can hide its children from VoiceOver: see the report.)
import type { ReactNode } from 'react';
import { View, type StyleProp, type ViewStyle } from 'react-native';

export function RadioGroup({ label, style, children }: { label: string; style?: StyleProp<ViewStyle>; children: ReactNode }) {
  return (
    <View accessible role="radiogroup" aria-label={label} style={style}>
      {children}
    </View>
  );
}
