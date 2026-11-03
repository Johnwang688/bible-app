// What this device remembers about confirming an account's email (email verification, 11-03), per uid: when Send
// again is allowed again (the 60 s cooldown, or 5 minutes after Firebase's too-many-requests, so a reload does not
// reset it), whether a link was sent from here, and a change of address waiting for its link. Like the Under 13
// offer, the auth layer's own key (not in storage/keys.ts). It holds no secrets: an address the person typed, and
// times. At most MAX_ACCOUNTS accounts are kept (the most recently written win).
import { z } from 'zod';

import type { Storage, StorageKey } from '../storage/storage';

/** Between two sends. */
export const RESEND_COOLDOWN_MS = 60_000;
/** After Firebase's too-many-requests. */
export const TOO_MANY_HOLD_MS = 5 * 60_000;

const MAX_ACCOUNTS = 8;

export interface VerifyRecord {
  /** Client ms before which Send again is held. */
  resendAt: number;
  /** A link was sent from this device. */
  sent: boolean;
  /** A change of address waiting for its link, or null. */
  pending: string | null;
  /** The account was created on this device by this app's sign-up (it was sent a link then): not a paused one. */
  fresh: boolean;
  /** Client ms of the last write (to keep the newest MAX_ACCOUNTS). */
  at: number;
}

const recordSchema = z.object({
  resendAt: z.number().finite(),
  sent: z.boolean(),
  pending: z.string().min(1).max(320).nullable(),
  fresh: z.boolean().default(false),
  at: z.number().finite(),
});

export const verifyKey: StorageKey<Record<string, VerifyRecord>> = {
  key: 'account.verify',
  version: 1,
  schema: z.record(z.string().min(1).max(128), recordSchema),
  fallback: {},
};

function all(storage: Storage): Record<string, VerifyRecord> {
  try {
    return storage.get(verifyKey);
  } catch (e) {
    console.warn('[account] reading the verification record failed', e);
    return {};
  }
}

/** `uid`'s record, or null (none, or the store cannot be read). */
export function readVerifyRecord(storage: Storage, uid: string): VerifyRecord | null {
  const records = all(storage);
  return Object.prototype.hasOwnProperty.call(records, uid) ? (records[uid] ?? null) : null;
}

/** Writes `uid`'s record (merged into what is there). A failure is logged, never thrown. */
export function writeVerifyRecord(storage: Storage, uid: string, change: Partial<Omit<VerifyRecord, 'at'>>, now: number): void {
  try {
    const records = { ...all(storage) };
    const before = Object.prototype.hasOwnProperty.call(records, uid) ? records[uid] : undefined;
    records[uid] = {
      resendAt: change.resendAt ?? before?.resendAt ?? 0,
      sent: change.sent ?? before?.sent ?? false,
      pending: change.pending !== undefined ? change.pending : (before?.pending ?? null),
      fresh: change.fresh ?? before?.fresh ?? false,
      at: now,
    };
    const kept = Object.entries(records)
      .sort((a, b) => b[1].at - a[1].at)
      .slice(0, MAX_ACCOUNTS);
    storage.set(verifyKey, Object.fromEntries(kept));
  } catch (e) {
    console.warn('[account] storing the verification record failed', e);
  }
}

/** Forgets `uid`'s record (its email is confirmed, or the account is gone). A failure is logged, never thrown. */
export function clearVerifyRecord(storage: Storage, uid: string): void {
  try {
    const records = all(storage);
    if (!Object.prototype.hasOwnProperty.call(records, uid)) return;
    const rest = { ...records };
    delete rest[uid];
    storage.set(verifyKey, rest);
  } catch (e) {
    console.warn('[account] clearing the verification record failed', e);
  }
}
