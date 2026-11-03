// Small readers for the old app's raw localStorage values. Stored values can be stale, hand-edited or
// written by older builds, so every reader returns null / [] for anything unexpected and never throws.
import type { LegacySource } from './source';

export const MAX_VERSE = 176;

/** The raw string under `key`; a source that throws reads as missing. */
export function readRaw(source: LegacySource, key: string): string | null {
  try {
    const raw = source.getItem(key);
    return typeof raw === 'string' ? raw : null;
  } catch {
    return null;
  }
}

/** The parsed JSON under `key`, or undefined when missing or not valid JSON. */
export function readJson(source: LegacySource, key: string): unknown {
  const raw = readRaw(source, key);
  if (raw === null) return undefined;
  try {
    return JSON.parse(raw) as unknown;
  } catch {
    return undefined;
  }
}

export function isPlainObject(value: unknown): value is Record<string, unknown> {
  return value !== null && typeof value === 'object' && !Array.isArray(value);
}

export function isFiniteNumber(value: unknown): value is number {
  return typeof value === 'number' && Number.isFinite(value);
}

export function isPositiveInteger(value: unknown): value is number {
  return typeof value === 'number' && Number.isInteger(value) && value > 0;
}

export function stringArray(value: unknown): string[] {
  return Array.isArray(value) ? value.filter((v): v is string => typeof v === 'string') : [];
}

export function isVerse(value: unknown): value is number {
  return isPositiveInteger(value) && value <= MAX_VERSE;
}

/** A real calendar day written `YYYY-MM-DD`. */
export function isRealDay(value: unknown): value is string {
  if (typeof value !== 'string' || !/^\d{4}-\d{2}-\d{2}$/.test(value)) return false;
  const d = new Date(`${value}T00:00:00.000Z`);
  return Number.isFinite(d.getTime()) && d.toISOString().slice(0, 10) === value;
}
