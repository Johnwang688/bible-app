// Whether the app is showing (native): paused when the app is in the background or inactive.
import { useEffect, useState } from 'react';
import { AppState, type AppStateStatus } from 'react-native';

const isActive = (s: AppStateStatus | string | null | undefined) => s !== 'background' && s !== 'inactive';

export function usePageVisible(): boolean {
  const [visible, setVisible] = useState(() => isActive(AppState.currentState));
  useEffect(() => {
    const sub = AppState.addEventListener('change', (s) => setVisible(isActive(s)));
    return () => sub?.remove(); // jest's AppState mock returns no subscription (as in home/useToday.ts)
  }, []);
  return visible;
}
