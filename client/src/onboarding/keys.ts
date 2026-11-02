// First run (R-7a): whether the reader has been through the intro, and the one optional personal detail.
// Kept in its own file so storage/keys.ts (shared) stays untouched.
import { z } from 'zod';

import type { StorageKey } from '../storage/storage';

/** The optional age ranges. Whether to offer 'under-13' is open for John (minimum age and privacy). */
export const AGE_RANGES = ['under-13', '13-17', '18-24', '25-34', '35-49', '50-64', '65-plus'] as const;
export type AgeRange = (typeof AGE_RANGES)[number];

export interface Onboarding {
  /** True once the intro was finished or skipped; the intro never shows again. */
  done: boolean;
  /** Null when not given (or skipped). Only on the device until sync (R-6b). */
  ageRange: AgeRange | null;
}

export const onboardingKey: StorageKey<Onboarding> = {
  key: 'onboarding',
  version: 1,
  schema: z.object({ done: z.boolean(), ageRange: z.enum(AGE_RANGES).nullable() }),
  fallback: { done: false, ageRange: null },
};
