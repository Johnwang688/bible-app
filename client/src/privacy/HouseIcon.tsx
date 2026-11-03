// A small house icon for "Open the app". The reader's icon set has none, so it is drawn here.
import type { ColorValue } from 'react-native';
import Svg, { Path } from 'react-native-svg';

export function HouseIcon({ color, size = 18 }: { color: ColorValue; size?: number }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false}>
      <Path d="M4 11 12 4l8 7v9h-5v-6H9v6H4z" fill="none" stroke={color} strokeWidth={2} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}
