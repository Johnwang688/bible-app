// The first-run gate (R-7a): while the intro is still needed it renders the intro instead of the app, then the
// app. It renders in place of the navigator and does not navigate, so after the intro the app opens on the page
// that was asked for. Mount it inside ThemeProvider.
import type { ReactNode } from 'react';

import type { Storage } from '../storage/storage';
import { useFirstRun } from './firstRun';
import { FirstRunFlow } from './FirstRunFlow';

export function FirstRunGate({ children, storage }: { children: ReactNode; storage?: Storage }) {
  const firstRun = useFirstRun(storage);
  if (firstRun.needed) return <FirstRunFlow firstRun={firstRun} />;
  return <>{children}</>;
}
