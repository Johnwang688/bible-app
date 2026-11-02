// The sync engine's own persisted state (R-6b). These keys belong to the sync layer and never appear
// in storage/keys.ts: the device id (one per install) and one state key per account (uid), so signing
// in as another account starts fresh while signing in again as the same one resumes (CONFLICTS.md rule 8).
//
// A state that is corrupt or from another version reads as EMPTY_SYNC_STATE, which the engine treats
// as a first sign-in (rules 7, 10, 14): every local value is combined with the account's, item by item.
import { z } from 'zod';

import type { StorageKey } from '../storage/storage';

const DEVICE_ID_RE = /^[A-Za-z0-9_-]{20}$/;
const UID_RE = /^[A-Za-z0-9_-]{1,128}$/;

/** This install's sync device id ('' until getDeviceId creates one). */
export const deviceIdKey: StorageKey<string> = {
  key: 'sync.deviceId',
  version: 1,
  schema: z.string().regex(DEVICE_ID_RE),
  fallback: '',
};

export const isDeviceId = (id: string): boolean => DEVICE_ID_RE.test(id);
export const isValidUid = (uid: string): boolean => UID_RE.test(uid);

/** A last-writer-wins clock: the change time and the device that made it. */
const clock = { t: z.number(), d: z.string() };

/** The first moment the engine saw a pending change, and the value (signature) it saw. */
const stamp = z.object({ at: z.number(), s: z.string().nullable() });

const stateSchema = z.object({
  items: z.object({
    /** pullItems cursor (server ms), or null before the first complete pull. */
    cursor: z.number().nullable(),
    /**
     * Last synced state per item id: the value signature (null = tombstone), its clock, and `f`, the
     * local fingerprint (value and own time, null = absent) the device held when it synced. A local
     * entry whose fingerprint differs is a pending change even when its value equals the base (a
     * re-colour back to the synced colour has a newer own time).
     */
    base: z.record(z.string(), z.object({ s: z.string().nullable(), ...clock, f: z.string().nullable().optional() })),
    /** First-seen stamps of pending local changes, per item id (s = the local fingerprint stamped). */
    stamps: z.record(z.string(), stamp),
    /**
     * Clocks of remote values this device cannot store (rule 6), kept so that an older local change
     * never overwrites them later when an incremental pull no longer returns them.
     */
    ignored: z.record(z.string(), z.object(clock)),
  }),
  settings: z.object({
    /** Last synced value per setting key (stable JSON) and its clock. No entry = not linked yet (rule 10). */
    base: z.record(z.string(), z.object({ s: z.string(), ...clock })),
    stamps: z.record(z.string(), stamp),
  }),
  progress: z.object({
    /** Other devices' minutes per day folded into the local activeMs last time (rule 12). */
    fold: z.record(z.string(), z.number()),
    /** The last synced goal and its clock. Null = not linked yet (rule 14). */
    goal: z.object({ m: z.number(), ...clock }).nullable(),
    /** The goal as this device last set it: the device document's `goal`. */
    ownGoal: z.object({ minutes: z.number(), updatedAt: z.number() }).nullable(),
    /** First-seen stamp of a pending goal change (s = the goal minutes as a string). */
    goalStamp: stamp.nullable(),
    /** Hash of the synced parts of the local progress after the last sync (detects pending changes). */
    sig: z.string().nullable(),
    /**
     * Set only while the engine writes merged progress (the crash marker, see engine.ts
     * `writeProgress`): the fold that goes with that write and the `activeMs` it writes. Found on a
     * later start, it decides which fold matches the stored progress.
     */
    pending: z
      .object({ fold: z.record(z.string(), z.number()), expect: z.record(z.string(), z.number()) })
      .nullable()
      .default(null),
  }),
});

export type SyncStateData = z.infer<typeof stateSchema>;
export type ItemBase = SyncStateData['items']['base'][string];
export type Stamp = SyncStateData['items']['stamps'][string];

export const EMPTY_SYNC_STATE: SyncStateData = {
  items: { cursor: null, base: {}, stamps: {}, ignored: {} },
  settings: { base: {}, stamps: {} },
  progress: { fold: {}, goal: null, ownGoal: null, goalStamp: null, sig: null, pending: null },
};

/** The state key for one account on this device. Throws on a uid that is not safe in a key name. */
export function syncStateKey(uid: string): StorageKey<SyncStateData> {
  if (!isValidUid(uid)) throw new Error('sync: invalid uid');
  return { key: `sync.state.${uid}`, version: 1, schema: stateSchema, fallback: EMPTY_SYNC_STATE };
}
