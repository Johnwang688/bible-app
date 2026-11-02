// The sign-in gate (R-6b, John 2026-11-02): whether sign-in and sync are allowed on this device. First run's
// Under 13 age choice turns them off, so no email or synced data is ever collected from under-13s. The age
// choice itself stays on the device (it is not a synced setting: sync/types.ts SETTING_KEYS).
import type { Storage, StorageKey } from '../storage/storage';

export interface SignInGate {
  /** Whether sign-in (and sync) is allowed right now. */
  allowed(): boolean;
  /** Calls `listener` whenever `allowed()` may have changed. Returns the unsubscribe. */
  subscribe(listener: () => void): () => void;
}

/** Sign-in is always allowed (the default until R-7a's first-run selector is wired in). */
export const ALWAYS_ALLOWED: SignInGate = Object.freeze({
  allowed: () => true,
  subscribe: () => () => undefined,
});

/** A gate over a stored value: allowed(predicate(storage.get(key))), live through storage.subscribe. */
export function storageGate<T>(storage: Storage, key: StorageKey<T>, predicate: (value: T) => boolean): SignInGate {
  return {
    allowed: () => predicate(storage.get(key)),
    subscribe: (listener) => storage.subscribe(key, listener),
  };
}
