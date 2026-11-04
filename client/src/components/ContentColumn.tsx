import type { ReactNode } from 'react';
import { View, useWindowDimensions, type StyleProp, type ViewStyle } from 'react-native';

import { BREAKPOINT, COLUMN } from './layout';
import { useRailWidth } from './RailContext';

export function useColumn(kind: keyof typeof COLUMN = 'text', gutter = 0): ViewStyle | null {
  const { width } = useWindowDimensions();
  const rail = useRailWidth();
  if (rail > 0) {
    const inner = Math.min(COLUMN[kind] + 2 * gutter, width - rail);
    return { width: inner, marginLeft: rail + (width - rail - inner) / 2, alignSelf: 'flex-start' };
  }
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
