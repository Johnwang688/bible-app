// Settings ↔ RemoteSetting (R-6b, CONFLICTS.md rules 9–10). Each setting syncs as one whole value:
// the storage key's data as JSON. Its signature is the value's stable JSON.
import type { StorageKey } from '../../storage/storage';
import { stableStringify, type Clock, type RemoteSide } from '../merge';
import { SETTING_JSON_MAX, SETTING_KEYS, type RemoteSetting, type SettingKey } from '../types';

export const isSettingKey = (key: string): key is SettingKey => (SETTING_KEYS as readonly string[]).includes(key);

export const settingSig = (value: unknown): string => stableStringify(value);

export interface CheckedSetting {
  side: RemoteSide;
  value: unknown;
}

/**
 * Checks a pulled setting for `k`. Null when the document is not usable at all (wrong key, no clock).
 * `side.valid` is false when the JSON is too long, does not parse, or fails the key's schema (rule 6).
 */
export function checkPulledSetting(k: StorageKey<unknown>, raw: RemoteSetting): CheckedSetting | null {
  if (!raw || typeof raw !== 'object' || raw.key !== k.key) return null;
  if (typeof raw.updatedAt !== 'number' || !Number.isFinite(raw.updatedAt) || typeof raw.deviceId !== 'string') return null;
  const clock: Clock = { t: raw.updatedAt, d: raw.deviceId };
  const invalid: CheckedSetting = { side: { sig: null, valid: false, clock }, value: undefined };
  if (typeof raw.json !== 'string' || raw.json.length > SETTING_JSON_MAX) return invalid;
  let data: unknown;
  try {
    data = JSON.parse(raw.json);
  } catch {
    return invalid;
  }
  const parsed = k.schema.safeParse(data);
  if (!parsed.success) return invalid;
  return { side: { sig: settingSig(parsed.data), valid: true, clock }, value: parsed.data };
}

/** The remote document for a local value, or null when it is too large to sync. */
export function toRemoteSetting(key: SettingKey, value: unknown, clock: Clock): RemoteSetting | null {
  const json = JSON.stringify(value);
  if (json === undefined || json.length > SETTING_JSON_MAX) return null;
  return { key, json, updatedAt: clock.t, deviceId: clock.d };
}
