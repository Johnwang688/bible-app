// The first-run state behind the intro screens (R-7a): whether the intro is still needed, and what its
// buttons do. The screens call this; no gate is mounted in the layout yet. Call it inside ThemeProvider.
import { useCallback, useMemo } from 'react';

import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import { useAppearance } from '../theme/ThemeProvider';
import type { PresetId } from '../theme/types';
import { onboardingKey, type AgeRange } from './keys';

export interface FirstRun {
  /** True until the intro is finished or skipped. Live: a write from anywhere re-renders. */
  needed: boolean;
  /** Picks a look, keeping the light/dark choice. */
  chooseLook(preset: PresetId): void;
  /** Ends the intro with the optional age range, leaving the look as it is. */
  finish(ageRange: AgeRange | null): void;
  /** Ends the intro with the default look (Silver / Graphite), keeping any light/dark choice. */
  skip(): void;
}

export function useFirstRun(storage: Storage = getStorage()): FirstRun {
  const [onboarding, setOnboarding] = useStoredValue(storage, onboardingKey);
  const { choice, setChoice } = useAppearance();
  const mode = choice.mode;

  const chooseLook = useCallback((preset: PresetId) => setChoice({ preset, mode }), [setChoice, mode]);
  // Both read the stored state at the press, not this render's: on the web another tab may have finished the intro
  // since (storage only notifies its own tab). Then the stricter answer wins: Under 13 from either tab always stands,
  // and any other answer keeps the stored one, so a stale tab can never replace a stored Under 13 nor drop a new one
  // (INT security review F1, R1). Writing the answer again also closes this tab's intro.
  const finish = useCallback(
    (ageRange: AgeRange | null) => {
      const current = storage.get(onboardingKey);
      setOnboarding(!current.done || ageRange === 'under-13' ? { done: true, ageRange } : current);
    },
    [storage, setOnboarding],
  );
  const skip = useCallback(() => {
    const current = storage.get(onboardingKey);
    if (current.done) {
      setOnboarding(current);
      return;
    }
    setChoice({ preset: null, mode });
    setOnboarding({ done: true, ageRange: null });
  }, [storage, setChoice, setOnboarding, mode]);

  return useMemo(
    () => ({ needed: !onboarding.done, chooseLook, finish, skip }),
    [onboarding.done, chooseLook, finish, skip],
  );
}
