// The Under 13 delete offer (R-6b follow-up item 2, John 2026-11-02): when a signed-in user later picks Under 13,
// the provider signs them out and offers to delete the account and its synced data, so an under-13's data is not
// kept by default without them choosing. The offer is the auth layer's own key (not in storage/keys.ts) and stays
// on the device, so it survives a restart, until the account is deleted, "Not now" is picked, or anyone signs in.
//
// It holds the account's uid (to check that the re-auth signed in to the same account) and its email (for the
// re-auth). Nothing else.
import { z } from 'zod';

import type { Storage, StorageKey } from '../storage/storage';

export interface Under13Offer {
  uid: string;
  email: string;
}

export const under13OfferKey: StorageKey<Under13Offer | null> = {
  key: 'account.under13Offer',
  version: 1,
  schema: z.object({ uid: z.string().min(1), email: z.string().min(1) }).nullable(),
  fallback: null,
};

/** The stored offer, or null (none, or unreadable: an offer that cannot be read is no offer). */
export function readUnder13Offer(storage: Storage): Under13Offer | null {
  try {
    return storage.get(under13OfferKey);
  } catch (e) {
    console.warn('[account] reading the Under 13 offer failed', e);
    return null;
  }
}

export function recordUnder13Offer(storage: Storage, offer: Under13Offer): void {
  storage.set(under13OfferKey, { uid: offer.uid, email: offer.email });
}

export function clearUnder13Offer(storage: Storage): void {
  storage.remove(under13OfferKey);
}
