import { router } from 'expo-router';

import { CustomiseScreen } from '../../../me/CustomiseScreen';

export default function CustomiseRoute() {
  return <CustomiseScreen onBack={() => router.back()} onAdvanced={() => router.push('/me/advanced')} />;
}
