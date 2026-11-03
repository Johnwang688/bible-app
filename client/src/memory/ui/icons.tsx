// The few stroke icons the Memory screens draw, paths from the approved prototypes (the shared reader set has no
// flame, sliders, clock or arrows). Decorative: the control that holds one carries the accessible name.
import type { ColorValue } from 'react-native';
import Svg, { Path } from 'react-native-svg';

export type MemoryIconName = 'check' | 'flame' | 'settings' | 'back' | 'forward' | 'clock' | 'close' | 'dash';

const PATHS: Record<MemoryIconName, string> = {
  check: 'm5 12 5 5 9-10',
  flame: 'M12 3c1 3.5 5 5.5 5 10a5 5 0 0 1-10 0c0-2 1-3.5 2-4.5 0 2 1 3 2 3 0-3-1-5.5 1-8.5z',
  settings: 'M4 7h9M17 7h3M4 17h3M11 17h9M15 5a2 2 0 1 0 0 4 2 2 0 1 0 0-4zM9 15a2 2 0 1 0 0 4 2 2 0 1 0 0-4z',
  back: 'm15 6-6 6 6 6',
  forward: 'm9 6 6 6-6 6',
  clock: 'M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zM12 7v5l3 2',
  close: 'M6 6l12 12M18 6 6 18',
  dash: 'M7 12h10',
};

export function MemoryIcon({
  name,
  color,
  size = 20,
  strokeWidth = 2,
}: {
  name: MemoryIconName;
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
