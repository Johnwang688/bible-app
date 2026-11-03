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

// The closing (security review 5, S5-6; Sol round 2, U13-R2-1): the gate went from open to closed while this account
// was signed in (Under 13 picked during that run), and the gate has not yet signed it out. Only the gate's sign-out of
// this account turns it into an offer (the provider's header: S4-3). It is stored, not kept in memory, so a close of
// the app between Under 13 being picked and the gate's sign-out (which first waits for the sync run in flight), or
// right after that sign-out, still ends in the offer on the next launch. Cleared when the gate opens again, when anyone
// signs in, when an ordinary sign-out starts, when the account is deleted, and when it becomes the offer. Like the
// offer, the auth layer's own key (not in storage/keys.ts), and it holds only the uid and the email for the offer.
export type Under13Closing = Under13Offer;

export const under13ClosingKey: StorageKey<Under13Closing | null> = {
  key: 'account.under13Closing',
  version: 1,
  schema: z.object({ uid: z.string().min(1), email: z.string().min(1) }).nullable(),
  fallback: null,
};

/** The stored closing, or null (none, or unreadable: a closing that cannot be read records no offer). */
export function readUnder13Closing(storage: Storage): Under13Closing | null {
  try {
    return storage.get(under13ClosingKey);
  } catch (e) {
    console.warn('[account] reading the Under 13 closing failed', e);
    return null;
  }
}

export function recordUnder13Closing(storage: Storage, closing: Under13Closing): void {
  storage.set(under13ClosingKey, { uid: closing.uid, email: closing.email });
}

export function clearUnder13Closing(storage: Storage): void {
  storage.remove(under13ClosingKey);
}
