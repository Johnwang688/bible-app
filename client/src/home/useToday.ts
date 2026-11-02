// "Now" for a screen that can stay open across a change of day or of greeting. What Home shows depends on the local
// time only through the period: the day (date, goal, verse of the day) and the greeting band (`greeting.ts`). The
// hook returns `now()` and re-renders the screen whenever the period changes: one timeout aimed at the next period
// boundary (armed again each time it fires), and a re-check when the app returns to the foreground, because timers
// may not fire while a native app is suspended. The state holds the period last rendered, so a check that finds the
// same period renders nothing.
import { useEffect, useState } from 'react';
import { AppState } from 'react-native';

import { dayKey } from '../progress';
import { GREETING_BOUNDARY_HOURS, greetingBand } from './greeting';

/** Added to the wait so the timer fires just after a boundary, never just before it. */
const MARGIN_MS = 250;

/** The period `date` falls in: its local day and its greeting band. */
export function periodKey(date: Date): string {
  return `${dayKey(date)} band ${greetingBand(date)}`;
}

/** Milliseconds from `date` to the next period boundary: the next greeting boundary today, or the next midnight. */
export function msUntilNextBoundary(date: Date): number {
  const y = date.getFullYear();
  const m = date.getMonth();
  const d = date.getDate();
  const midnight = new Date(y, m, d + 1);
  const next =
    GREETING_BOUNDARY_HOURS.map((h) => new Date(y, m, d, h)).find((c) => c.getTime() > date.getTime()) ?? midnight;
  return Math.max(0, next.getTime() - date.getTime());
}

export function useToday(now: () => Date): Date {
  // The period last rendered. Setting it to the same value renders nothing, so only a real change re-renders.
  const [, setPeriod] = useState(() => periodKey(now()));

  useEffect(() => {
    let timer: ReturnType<typeof setTimeout> | undefined;
    // Re-read the period from this clock (rendering if it changed) and aim the one timer at the next boundary.
    const check = () => {
      const current = now();
      setPeriod(periodKey(current));
      clearTimeout(timer);
      timer = setTimeout(check, msUntilNextBoundary(current) + MARGIN_MS);
    };
    // Runs on mount and whenever `now` changes identity: the stored period is re-synced to this clock.
    check();
    const sub = AppState.addEventListener('change', (state) => {
      if (state === 'active') check();
    });
    return () => {
      clearTimeout(timer);
      sub?.remove();
    };
  }, [now]);

  return now();
}
