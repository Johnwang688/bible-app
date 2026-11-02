// Small stroke icons for the reader, drawn with react-native-svg like the tab bar's.
import type { ColorValue } from 'react-native';
import Svg, { Path } from 'react-native-svg';

export type IconName = 'chevronDown' | 'chevronLeft' | 'chevronRight' | 'close' | 'search' | 'check' | 'swapH';

const PATHS: Record<IconName, string> = {
  chevronDown: 'm6 9 6 6 6-6',
  chevronLeft: 'm15 6-6 6 6 6',
  chevronRight: 'm9 6 6 6-6 6',
  close: 'M6 6l12 12M18 6 6 18',
  search: 'M11 4a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm9 16-3.5-3.5',
  check: 'm5 12.5 4.5 4.5L19 7',
  swapH: 'M4 7h16M20 7l-4-4M20 7l-4 4M20 17H4M4 17l4-4M4 17l4 4',
};

export function Icon({
  name,
  color,
  size = 18,
  strokeWidth = 2.2,
}: {
  name: IconName;
  color: ColorValue;
  size?: number;
  strokeWidth?: number;
}) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false}>
      <Path d={PATHS[name]} fill="none" stroke={color} strokeWidth={strokeWidth} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}
