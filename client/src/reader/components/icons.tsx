// Small stroke icons for the reader, drawn with react-native-svg like the tab bar's.
import type { ColorValue } from 'react-native';
import Svg, { Path } from 'react-native-svg';

export type IconName =
  | 'chevronDown'
  | 'chevronLeft'
  | 'chevronRight'
  | 'close'
  | 'search'
  | 'check'
  | 'swapH'
  | 'note'
  | 'bookmark'
  | 'copy'
  | 'share'
  | 'words';

const PATHS: Record<IconName, string> = {
  chevronDown: 'm6 9 6 6 6-6',
  chevronLeft: 'm15 6-6 6 6 6',
  chevronRight: 'm9 6 6 6-6 6',
  close: 'M6 6l12 12M18 6 6 18',
  search: 'M11 4a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm9 16-3.5-3.5',
  check: 'm5 12.5 4.5 4.5L19 7',
  swapH: 'M4 7h16M20 7l-4-4M20 7l-4 4M20 17H4M4 17l4-4M4 17l4 4',
  note: 'M4 4h16v12H8l-4 4z',
  bookmark: 'M6 3h12v18l-6-4-6 4z',
  copy: 'M9 9h11v11H9zM5 15V5a1 1 0 0 1 1-1h10',
  share: 'M12 15V3M7 8l5-5 5 5M5 13v6a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-6',
  words: 'M17 7c-1.5 5-3 10-5.5 10S7 14 7 11.5 9 7 11 7s3 3 4 6 1.5 4 2.5 4',
};

export function Icon({
  name,
  color,
  size = 18,
  strokeWidth = 2.2,
  filled = false,
}: {
  name: IconName;
  color: ColorValue;
  size?: number;
  strokeWidth?: number;
  /** Fill the shape with the colour too (the note and bookmark markers beside a verse number). */
  filled?: boolean;
}) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false}>
      <Path d={PATHS[name]} fill={filled ? color : 'none'} stroke={color} strokeWidth={strokeWidth} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}
