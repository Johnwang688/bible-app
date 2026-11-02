// Memory home, inside the Study tab's stack.
import { router } from 'expo-router';

import { MemoryHome } from '../../../../memory/ui/home/MemoryHome';

export default function MemoryRoute() {
  return <MemoryHome onNavigate={(href) => router.push(href)} />;
}
