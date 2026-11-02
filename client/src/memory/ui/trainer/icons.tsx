// The stroke icons the trainers draw beyond the few in `ui/icons.tsx` (paths from the approved prototypes).
// Decorative: the control that holds one carries the accessible name.
import type { ColorValue } from 'react-native';
import Svg, { Path } from 'react-native-svg';

export type TrainerIconName =
  | 'mic'
  | 'stop'
  | 'micOff'
  | 'wifiOff'
  | 'clock'
  | 'info'
  | 'user'
  | 'pencil'
  | 'eye'
  | 'eyeOff'
  | 'x'
  | 'retry'
  | 'dash'
  | 'check'
  | 'back';

const PATHS: Record<TrainerIconName, string> = {
  mic: 'M12 3a3 3 0 0 1 3 3v6a3 3 0 0 1-6 0V6a3 3 0 0 1 3-3zM5 11a7 7 0 0 0 14 0M12 18v3',
  stop: 'M7 7h10v10H7z',
  micOff: 'M3 3l18 18M9 6a3 3 0 0 1 6 0v5M9 9v3a3 3 0 0 0 4.5 2.6M5 11a7 7 0 0 0 11.5 5.3M12 18v3',
  wifiOff:
    'M3 3l18 18M5 12.5a10 10 0 0 1 4-2.5M9 16.5a5 5 0 0 1 6 0M12 20h.01M16.7 10.3A10 10 0 0 1 19 12.5M2 8.8a15 15 0 0 1 4.2-2.5M10.7 5.1A15 15 0 0 1 22 8.8',
  clock: 'M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zM12 7v5l3 2',
  info: 'M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zM12 8v5M12 16h.01',
  user: 'M12 4a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM4 21a8 8 0 0 1 16 0',
  pencil: 'M4 20h4L19 9l-4-4L4 16z',
  eye: 'M2 12s4-7 10-7 10 7 10 7-4 7-10 7S2 12 2 12zM12 9a3 3 0 1 1 0 6 3 3 0 0 1 0-6z',
  eyeOff:
    'M3 3l18 18M10.6 6.1A9.7 9.7 0 0 1 12 5c6 0 10 7 10 7a17 17 0 0 1-3.2 3.9M6.4 7.7A17 17 0 0 0 2 12s4 7 10 7a9.6 9.6 0 0 0 4-.9',
  x: 'M6 6l12 12M18 6 6 18',
  retry: 'M20 12a8 8 0 1 1-2.3-5.7M20 4v5h-5',
  dash: 'M7 12h10',
  check: 'm5 12 5 5 9-10',
  back: 'm15 6-6 6 6 6',
};

export function TrainerIcon({
  name,
  color,
  size = 20,
  strokeWidth = 2,
  fill = false,
}: {
  name: TrainerIconName;
  color: ColorValue;
  size?: number;
  strokeWidth?: number;
  fill?: boolean;
}) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false}>
      <Path
        d={PATHS[name]}
        fill={fill ? color : 'none'}
        stroke={color}
        strokeWidth={strokeWidth}
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </Svg>
  );
}
