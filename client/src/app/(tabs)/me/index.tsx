import { router } from 'expo-router';

import { MeScreen } from '../../../me/MeScreen';

export default function MeRoute() {
  return <MeScreen onNavigate={(to) => router.push(`/me/${to}`)} />;
}
