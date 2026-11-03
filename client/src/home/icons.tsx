// Icons only Home uses, drawn with react-native-svg like the reader's.
import type { ColorValue } from 'react-native';
import Svg, { Path } from 'react-native-svg';

const FLAME = 'M12 3c1 3.5 5 5.5 5 10a5 5 0 0 1-10 0c0-2 1-3.5 2-4.5 0 2 1 3 2 3 0-3-1-5.5 1-8.5z';

const MINUS = 'M5 12h14';
const PLUS = 'M12 5v14M5 12h14';
const SHUFFLE = 'M16 3h5v5M4 20 21 3M21 16v5h-5M15 15l6 6M4 4l5 5';

function StrokeIcon({ d, color, size, strokeWidth }: { d: string; color: ColorValue; size: number; strokeWidth: number }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false}>
      <Path d={d} fill="none" stroke={color} strokeWidth={strokeWidth} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}

/** The goal sheet's minus button. */
export function MinusIcon({ color, size = 24, strokeWidth = 2.4 }: { color: ColorValue; size?: number; strokeWidth?: number }) {
  return <StrokeIcon d={MINUS} color={color} size={size} strokeWidth={strokeWidth} />;
}

/** The goal sheet's plus button. */
export function PlusIcon({ color, size = 24, strokeWidth = 2.4 }: { color: ColorValue; size?: number; strokeWidth?: number }) {
  return <StrokeIcon d={PLUS} color={color} size={size} strokeWidth={strokeWidth} />;
}

/** Surprise me's button. */
export function ShuffleIcon({ color, size = 22, strokeWidth = 2.1 }: { color: ColorValue; size?: number; strokeWidth?: number }) {
  return <StrokeIcon d={SHUFFLE} color={color} size={size} strokeWidth={strokeWidth} />;
}

/** The streak flame. */
export function FlameIcon({ color, size = 18, strokeWidth = 1.9 }: { color: ColorValue; size?: number; strokeWidth?: number }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false}>
      <Path d={FLAME} fill="none" stroke={color} strokeWidth={strokeWidth} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}
