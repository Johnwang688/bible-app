import { router } from 'expo-router';

import { SourcesScreen } from '../../../me/SourcesScreen';

export default function SourcesRoute() {
  return <SourcesScreen onBack={() => router.back()} />;
}
