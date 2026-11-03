// The lesson's end: the day complete, or the steps still waiting.
import { router } from 'expo-router';

import { CompleteScreen } from '../../memory/ui/trainer/CompleteScreen';

export default function CompleteRoute() {
  return <CompleteScreen onNavigate={(href) => router.replace(href as never)} />;
}
