import { router } from 'expo-router';

import { AdvancedScreen } from '../../../me/AdvancedScreen';

export default function AdvancedRoute() {
  return <AdvancedScreen onBack={() => router.back()} />;
}
