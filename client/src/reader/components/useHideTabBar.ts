// Hides the tab bar while a screen needs the whole bottom of the display (the open verse sheet).
//
// The tab layout owns the flag and applies it to the Bible route's own tab-bar style, so the bar's full
// style comes back from the layout when the flag clears (React Navigation merges `setOptions` with
// `Object.assign`, so restoring through it would mean knowing the layout's style here). Only the Bible
// route is affected: another tab shows the bar even if the sheet is still open on the Bible tab.
//
// Outside the tab layout (the Jest harness) there is no provider and this does nothing.
import { createContext, useContext, useEffect } from 'react';

export const HideTabBarContext = createContext<((hidden: boolean) => void) | null>(null);

export function useHideTabBar(hidden: boolean): void {
  const setHidden = useContext(HideTabBarContext);
  useEffect(() => {
    if (!setHidden || !hidden) return;
    setHidden(true);
    return () => setHidden(false);
  }, [setHidden, hidden]);
}
