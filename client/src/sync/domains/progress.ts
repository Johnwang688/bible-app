// Reading progress ↔ DeviceProgress (R-6b, CONFLICTS.md rules 11–15).
// Each device uploads only its own minutes; the engine folds the other devices' minutes into the local
// count and remembers how much it added (the fold), so own = local − fold. Chapters read and goal-met
// days are unions (a chapter keeps its earliest credit time). The goal is last writer wins.
// `evidence` never leaves the device and is never changed here.
import type { StorageKey } from '../../storage/storage';
import { hash53, lookup, put, stableStringify } from '../merge';
import type { ProgressShape } from '../shapes';
import type { DeviceProgress } from '../types';

/** A pulled device document with every entry the device cannot store removed (rule 6). */
export interface CleanDoc {
  deviceId: string;
  activeMs: Record<string, number>;
  chaptersRead: Record<string, string>;
  goalMetDays: string[];
  goal: { minutes: number; updatedAt: number } | null;
}

const isRecord = (v: unknown): v is Record<string, unknown> => !!v && typeof v === 'object' && !Array.isArray(v);

/**
 * Validates pulled device documents entry by entry against the local key's schema: each candidate is
 * the local value with its collections emptied and the entries under test put in. A whole collection
 * is tried at once first; on failure, entry by entry.
 */
export function checkDevices(key: StorageKey<ProgressShape>, local: ProgressShape, raw: readonly DeviceProgress[]): CleanDoc[] {
  const skeleton: ProgressShape = { ...local, activeMs: {}, chaptersRead: {}, goalMetDays: [] };
  const ok = (patch: Partial<ProgressShape>) => key.schema.safeParse({ ...skeleton, ...patch }).success;
  if (!ok({})) return [];

  const byDevice = new Map<string, CleanDoc>();
  for (const doc of raw) {
    if (!isRecord(doc) || typeof doc.deviceId !== 'string') continue;

    const activeMs = filterRecord(doc.activeMs, (v): v is number => typeof v === 'number', (rec) => ok({ activeMs: rec }));
    const chaptersRead = filterRecord(doc.chaptersRead, (v): v is string => typeof v === 'string', (rec) => ok({ chaptersRead: rec }));

    let goalMetDays: string[] = [];
    if (Array.isArray(doc.goalMetDays)) {
      const days = (doc.goalMetDays as unknown[]).filter((d): d is string => typeof d === 'string');
      goalMetDays = ok({ goalMetDays: days }) ? days : days.filter((d) => ok({ goalMetDays: [d] }));
    }

    let goal: CleanDoc['goal'] = null;
    const g: unknown = doc.goal;
    if (
      isRecord(g) &&
      typeof g.minutes === 'number' &&
      typeof g.updatedAt === 'number' &&
      Number.isFinite(g.updatedAt) &&
      ok({ goalMinutes: g.minutes })
    ) {
      goal = { minutes: g.minutes, updatedAt: g.updatedAt };
    }
    byDevice.set(doc.deviceId, { deviceId: doc.deviceId, activeMs, chaptersRead, goalMetDays: sortedUnique(goalMetDays), goal });
  }
  return [...byDevice.values()];
}

function filterRecord<T>(
  raw: unknown,
  isT: (v: unknown) => v is T,
  ok: (rec: Record<string, T>) => boolean,
): Record<string, T> {
  const out: Record<string, T> = {};
  if (!isRecord(raw)) return out;
  const entries = Object.entries(raw).filter((e): e is [string, T] => isT(e[1]));
  const all: Record<string, T> = {};
  for (const [k, v] of entries) put(all, k, v);
  if (ok(all)) return all;
  for (const [k, v] of entries) {
    const one: Record<string, T> = {};
    put(one, k, v);
    if (ok(one)) put(out, k, v);
  }
  return out;
}

/** Rule 12: this device's own minutes per day = local − what was folded in last time, never below 0. */
export function ownMinutes(activeMs: Record<string, number>, fold: Record<string, number>): Record<string, number> {
  const own: Record<string, number> = {};
  for (const [day, ms] of Object.entries(activeMs)) put(own, day, Math.max(0, ms - (lookup(fold, day) ?? 0)));
  return own;
}

/** Rule 12: the other devices' minutes per day, summed. */
export function othersMinutes(docs: readonly CleanDoc[], self: string): Record<string, number> {
  const others: Record<string, number> = {};
  for (const doc of docs) {
    if (doc.deviceId === self) continue;
    for (const [day, ms] of Object.entries(doc.activeMs)) put(others, day, (lookup(others, day) ?? 0) + ms);
  }
  return others;
}

const creditTime = (iso: string): number => {
  const t = Date.parse(iso);
  return Number.isFinite(t) ? t : Infinity;
};

function sortedUnique(days: readonly string[]): string[] {
  return [...new Set(days)].sort();
}

/**
 * The merged local progress: own + others' minutes per day, the unions of chapters (earliest credit
 * time) and goal-met days, the given goal, and the local evidence untouched.
 */
export function mergeProgress(
  local: ProgressShape,
  docs: readonly CleanDoc[],
  fold: Record<string, number>,
  self: string,
  goalMinutes: number,
): { value: ProgressShape; own: Record<string, number>; others: Record<string, number> } {
  const own = ownMinutes(local.activeMs, fold);
  const others = othersMinutes(docs, self);
  const activeMs: Record<string, number> = {};
  for (const day of new Set([...Object.keys(own), ...Object.keys(others)])) {
    put(activeMs, day, (lookup(own, day) ?? 0) + (lookup(others, day) ?? 0));
  }

  const chaptersRead: Record<string, string> = {};
  for (const [ch, at] of Object.entries(local.chaptersRead)) put(chaptersRead, ch, at);
  const days: string[] = [...local.goalMetDays];
  for (const doc of docs) {
    for (const [ch, at] of Object.entries(doc.chaptersRead)) {
      const mine = lookup(chaptersRead, ch);
      if (mine === undefined || creditTime(at) < creditTime(mine)) put(chaptersRead, ch, at);
    }
    days.push(...doc.goalMetDays);
  }

  return {
    value: { ...local, goalMinutes, activeMs, chaptersRead, goalMetDays: sortedUnique(days) },
    own,
    others,
  };
}

/** Rule 14: the newest goal set on any device (ties by device id), or undefined if none set one. */
export function bestGoal(docs: readonly CleanDoc[]): { m: number; t: number; d: string } | undefined {
  let best: { m: number; t: number; d: string } | undefined;
  for (const doc of docs) {
    if (!doc.goal) continue;
    const c = { m: doc.goal.minutes, t: doc.goal.updatedAt, d: doc.deviceId };
    if (!best || c.t > best.t || (c.t === best.t && c.d > best.d)) best = c;
  }
  return best;
}

/** This device's document (without `updatedAt`): own minutes only (rule 11), the local unions, its own goal. */
export function deviceDoc(
  self: string,
  own: Record<string, number>,
  merged: ProgressShape,
  goal: CleanDoc['goal'],
): CleanDoc {
  const activeMs: Record<string, number> = {};
  for (const [day, ms] of Object.entries(own)) if (ms > 0) put(activeMs, day, ms);
  return { deviceId: self, activeMs, chaptersRead: { ...merged.chaptersRead }, goalMetDays: [...merged.goalMetDays], goal };
}

/** Whether the remote document already says what `doc` says (so no rewrite is needed). */
export function sameDoc(remote: CleanDoc | undefined, doc: CleanDoc): boolean {
  return remote !== undefined && stableStringify(remote) === stableStringify(doc);
}

/** A hash of the synced parts of the local progress (everything but evidence). */
export function progressSig(p: ProgressShape): string {
  return hash53(stableStringify({ a: p.activeMs, c: p.chaptersRead, g: p.goalMetDays, m: p.goalMinutes }));
}
