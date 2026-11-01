// Tab bar icons, drawn with react-native-svg so the app needs no icon font.
import Svg, { Path } from 'react-native-svg';

export type TabIconName = 'home' | 'bible' | 'study' | 'me';

const PATHS: Record<TabIconName, string> = {
  home: 'M4 11.5 12 5l8 6.5V20a1 1 0 0 1-1 1h-4.5v-5.5h-5V21H5a1 1 0 0 1-1-1z',
  bible: 'M6 4h11a1 1 0 0 1 1 1v15H7a2 2 0 0 1-2-2V5a1 1 0 0 1 1-1zm6 3v7m-3-4.5h6M5 18a2 2 0 0 1 2-2h11',
  study: 'M7 4h10a1 1 0 0 1 1 1v16l-6-4-6 4V5a1 1 0 0 1 1-1z',
  me: 'M12 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm-7 9a7 7 0 0 1 14 0',
};

export function TabIcon({ name, color, size = 24 }: { name: TabIconName; color: string; size?: number }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false}>
      <Path d={PATHS[name]} fill="none" stroke={color} strokeWidth={2} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}
