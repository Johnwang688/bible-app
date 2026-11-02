// The streak and the last weeks, inside the Study tab's stack.
import { router } from 'expo-router';

import { WeekScreen } from '../../../../memory/ui/home/WeekScreen';

export default function MemoryWeekRoute() {
  return <WeekScreen onNavigate={(href) => router.push(href)} />;
}
