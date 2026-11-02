// The first-run gate (R-7a): while the intro is still needed it renders the intro instead of the app, then the
// app. It renders in place of the navigator and does not navigate, so after the intro the app opens on the page
// that was asked for. Mount it inside ThemeProvider.
//
// Exempt paths (FIRST_RUN_EXEMPT_PATHS) are never covered by the intro: when `pathname` is one of them the gate
// renders the app even if the intro is needed. It changes no state, so the intro stays not done and the next
// non-exempt page still shows it. With no `pathname` the gate behaves as it always has.
import type { ReactNode } from 'react';

import type { Storage } from '../storage/storage';
import { useFirstRun } from './firstRun';
import { FirstRunFlow } from './FirstRunFlow';

// Paths the first-run intro never covers (e.g. the privacy policy: the App Store review URL and links from outside
// the app must open on a device that has never done the intro). Exact matches only.
export const FIRST_RUN_EXEMPT_PATHS = ['/privacy'];

// True when `pathname` is an exempt path, ignoring one trailing slash. Not a prefix match: '/privacyx' and
// '/read/privacy' are not exempt.
export function isFirstRunExempt(pathname: string): boolean {
  const path = pathname.length > 1 && pathname.endsWith('/') ? pathname.slice(0, -1) : pathname;
  return FIRST_RUN_EXEMPT_PATHS.includes(path);
}

export function FirstRunGate({
  children,
  storage,
  pathname,
}: {
  children: ReactNode;
  storage?: Storage;
  pathname?: string;
}) {
  const firstRun = useFirstRun(storage);
  if (firstRun.needed && !(pathname !== undefined && isFirstRunExempt(pathname))) {
    return <FirstRunFlow firstRun={firstRun} />;
  }
  return <>{children}</>;
}
