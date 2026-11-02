// Icons only Home uses, drawn with react-native-svg like the reader's.
import type { ColorValue } from 'react-native';
import Svg, { Path } from 'react-native-svg';

const FLAME = 'M12 3c1 3.5 5 5.5 5 10a5 5 0 0 1-10 0c0-2 1-3.5 2-4.5 0 2 1 3 2 3 0-3-1-5.5 1-8.5z';

/** The streak flame. */
export function FlameIcon({ color, size = 18, strokeWidth = 1.9 }: { color: ColorValue; size?: number; strokeWidth?: number }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false}>
      <Path d={FLAME} fill="none" stroke={color} strokeWidth={strokeWidth} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}
