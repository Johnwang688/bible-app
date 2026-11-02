import { router } from 'expo-router';

import { AboutScreen } from '../../../me/AboutScreen';

export default function AboutRoute() {
  return <AboutScreen onBack={() => router.back()} />;
}
