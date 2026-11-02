// "Today" for a screen that can stay open across midnight. It returns `now()` and re-renders the screen when the
// local day changes: one timeout aimed at the next local midnight (armed again each time it fires), and a re-check
// when the app returns to the foreground, because timers may not fire while a native app is suspended.
import { useEffect, useState } from 'react';
import { AppState } from 'react-native';

import { dayKey } from '../progress';

/** Added to the wait so the timer fires just after midnight, never just before it. */
const MARGIN_MS = 250;

/** Milliseconds from `date` to the next local midnight (the start of the next calendar day). */
function msUntilNextMidnight(date: Date): number {
  const next = new Date(date.getFullYear(), date.getMonth(), date.getDate() + 1);
  return Math.max(0, next.getTime() - date.getTime());
}

export function useToday(now: () => Date): Date {
  // The day last rendered. Setting it to the same value renders nothing, so only a real day change re-renders.
  const [, setDay] = useState(() => dayKey(now()));

  useEffect(() => {
    let timer: ReturnType<typeof setTimeout> | undefined;
    const check = () => {
      setDay(dayKey(now()));
      clearTimeout(timer);
      timer = setTimeout(check, msUntilNextMidnight(now()) + MARGIN_MS);
    };
    timer = setTimeout(check, msUntilNextMidnight(now()) + MARGIN_MS);
    const sub = AppState.addEventListener('change', (state) => {
      if (state === 'active') check();
    });
    return () => {
      clearTimeout(timer);
      sub.remove();
    };
  }, [now]);

  return now();
}
