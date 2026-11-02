// First run (R-7a): whether the reader has been through the intro, and the one optional personal detail.
// Kept in its own file so storage/keys.ts (shared) stays untouched.
import { z } from 'zod';

import type { StorageKey } from '../storage/storage';

/**
 * The optional age ranges. 'under-13' is offered (John, 2026-11-02) and turns sign-in and sync off
 * (`signIn.ts`). The age never leaves the device: it is never synced or sent (`__tests__/ageStaysOnDevice.test.ts`).
 */
export const AGE_RANGES = ['under-13', '13-17', '18-24', '25-34', '35-49', '50-64', '65-plus'] as const;
export type AgeRange = (typeof AGE_RANGES)[number];

export interface Onboarding {
  /** True once the intro was finished or skipped; the intro never shows again. */
  done: boolean;
  /** Null when not given (skipped, or "Prefer not to say"). Only ever on the device. */
  ageRange: AgeRange | null;
}

export const onboardingKey: StorageKey<Onboarding> = {
  key: 'onboarding',
  version: 1,
  schema: z.object({ done: z.boolean(), ageRange: z.enum(AGE_RANGES).nullable() }),
  fallback: { done: false, ageRange: null },
};
