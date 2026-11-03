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
  const finish = useCallback(
    (ageRange: AgeRange | null) => setOnboarding({ done: true, ageRange }),
    [setOnboarding],
  );
  const skip = useCallback(() => {
    setChoice({ preset: null, mode });
    setOnboarding({ done: true, ageRange: null });
  }, [setChoice, setOnboarding, mode]);

  return useMemo(
    () => ({ needed: !onboarding.done, chooseLook, finish, skip }),
    [onboarding.done, chooseLook, finish, skip],
  );
}
