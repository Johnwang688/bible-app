// Whether this device may sign in and sync (R-7a, John 2026-11-02): not when the reader chose
// "Under 13" on the first-run age step. Under 13, nothing is collected: no email, no synced data.
// The age choice itself never leaves the device; this boolean is all other modules may read.
//
// For R-6b: pass `signInGateFor(storage)` as `AccountProvider`'s `signInGate`, or use
// `storageGate(storage, onboardingKey, isSignInAllowed)`; components can call `useSignInAllowed()`.
import { useMemo } from 'react';

import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import { onboardingKey, type Onboarding } from './keys';

/** False only when the stored age range is "Under 13". No answer, or a skipped intro, allows it. */
export function isSignInAllowed(onboarding: Pick<Onboarding, 'ageRange'>): boolean {
  return onboarding.ageRange !== 'under-13';
}

/** `isSignInAllowed` for the device's stored first-run state. Live: re-renders when the age changes. */
export function useSignInAllowed(storage: Storage = getStorage()): boolean {
  const [onboarding] = useStoredValue(storage, onboardingKey);
  return isSignInAllowed(onboarding);
}

/** The gate R-6b's AccountProvider takes: read now, and hear about changes. */
export interface SignInGate {
  allowed(): boolean;
  subscribe(listener: () => void): () => void;
}

/** A live gate over the stored first-run state (outside React). */
export function signInGateFor(storage: Storage = getStorage()): SignInGate {
  return {
    allowed: () => isSignInAllowed(storage.get(onboardingKey)),
    subscribe: (listener) => storage.subscribe(onboardingKey, listener),
  };
}

/** Hook form of `signInGateFor`, stable for the storage. */
export function useSignInGate(storage: Storage = getStorage()): SignInGate {
  return useMemo(() => signInGateFor(storage), [storage]);
}
