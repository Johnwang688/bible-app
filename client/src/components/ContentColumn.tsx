import type { ReactNode } from 'react';
import { View, useWindowDimensions, type StyleProp, type ViewStyle } from 'react-native';

import { BREAKPOINT, COLUMN } from './layout';

export function useColumn(kind: keyof typeof COLUMN = 'text', gutter = 0): ViewStyle | null {
  const { width } = useWindowDimensions();
  return width < BREAKPOINT.tablet
    ? null
    : { width: '100%', maxWidth: COLUMN[kind] + 2 * gutter, alignSelf: 'center' };
}

export function ContentColumn({ kind = 'text', gutter = 0, style, testID, children }: {
  kind?: keyof typeof COLUMN;
  gutter?: number;
  style?: StyleProp<ViewStyle>;
  testID?: string;
  children?: ReactNode;
}) {
  const column = useColumn(kind, gutter);
  return <View testID={testID} style={[style, column]}>{children}</View>;
}
