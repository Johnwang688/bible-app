import { router } from 'expo-router';

import { HelpScreen } from '../../../me/HelpScreen';

export default function HelpRoute() {
  return <HelpScreen onBack={() => router.back()} />;
}
