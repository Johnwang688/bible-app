// Memory progress and history across devices (MEM 3; CONFLICTS.md "Memory", rules 17–24). Pure: no I/O.
//
// Both merges are joins (commutative, associative, idempotent), so the order in which devices sync, how
// often a value is merged in again, and whether a document is stale or a copy of another device's merged
// values never matter: every device that has seen the same documents holds the same value.
//   - Progress: the union of verses; for a verse on both sides, the whole row with the newer
//     `lastReviewedAt` wins (never a mix of two rows' fields). Ties go by a fixed total order on the rows.
//     At most MEMORY_ROWS_MAX rows are kept: the highest by the same total order (rowRank), which
//     keeps the merge a join (a backstop; the real bound is the library, below).
//   - History: the completed days are a sorted union without repeats, keeping the latest
//     MEMORY_DAYS_MAX (the storage cap); the start is the earliest known one. The streak is never
//     stored: Memory derives it from the completed days (memory/dailyLesson.ts dailyStreak).
//
// Pulled documents are untrusted (CONFLICTS.md rule 24): anyone holding the user's token can write any
// number of rule-valid ones, and no client can delete them. So before the join a pulled row is ignored
// when its review or lapse time is more than a day ahead of this device's clock, or its verse is not one
// this device's library knows; a pulled completed day (or start) more than a day after this device's
// local today is ignored too (checkMemoryDocs, boundMemory*). Each is per row or per day and depends on
// the clock (and the library) only, so the merge stays a join over what is accepted; a row skipped while
// this clock lags is joined on a later run (the documents stay on the account). The push holds back rows
// and days past the same time bounds (pushableMemoryValues), so a device never re-publishes them.
//
// The wire form of progress is one compact string that the Firestore rules check with one anchored
// regex plus size bounds (/firestore.rules isMemoryProgress): one row per verse, sorted by verse id,
// joined with ';', each row the fields in a fixed order joined with ',' (null times are empty):
//   stage,verseId,successes,failures,masteryScore,nextDueAt,lastReviewedAt,lapsedAt
//   e.g. "fill_blank,john-3-16,1,0,20,2026-11-04T09:00:00.000Z,2026-11-02T09:00:00.000Z,"
// The stage comes first because no stage stays a stage with a character in front of it: a string with
// anything put before an encoding is not an encoding (a verse id would just read as a longer id).
import { toLocalDateString } from '../../memory/localDate';
import type { ProgressMap, VerseProgress } from '../../memory/types';
import { memoryProgressKey, type MemoryHistory } from '../../storage/memoryKeys';
import type { StorageKey } from '../../storage/storage';
import { hash53, lookup, put, stableStringify } from '../merge';
import type { MemoryDoc } from '../types';

/** The most verses one Memory document carries: room for four times the ~500 verses of future libraries. */
export const MEMORY_ROWS_MAX = 2000;
/** The largest success or failure count the wire carries (seven digits). */
export const MEMORY_COUNT_MAX = 9_999_999;
/** The most completed days kept (memoryHistoryKey's cap). */
export const MEMORY_DAYS_MAX = 1000;
/**
 * The longest progress string: MEMORY_ROWS_MAX rows of at most 171 characters (a 64-character verse id,
 * an 11-character stage, two 7-digit counts, a 3-digit mastery, three 24-character times and 7 commas)
 * plus the ';' between rows.
 */
export const MEMORY_WIRE_MAX = MEMORY_ROWS_MAX * 172 - 1;
/**
 * How far ahead of this device's clock a pulled review or lapse time may be: the one day the rules allow
 * a document's `updatedAt` (isClientTime). `nextDueAt` is a schedule, weeks ahead by design: not bounded.
 */
export const MEMORY_AHEAD_MAX_MS = 86_400_000;
/**
 * 2026-01-01T00:00:00.000Z, before the app's first release. A device clock that reads earlier is known
 * wrong (a clock reset to 1970, say), so it cannot say what is "far ahead": the time bounds are off then,
 * and Memory syncs as it would without them (an attacker cannot set the victim device's clock).
 */
export const MEMORY_CLOCK_MIN_MS = Date.UTC(2026, 0, 1);
/**
 * The most Memory documents a sync reads: the most recently written (by `serverTime`). A person's real
 * devices fit with room, reinstalls included (each install is a new device id, and no client can delete
 * an old document); an old document's values are already joined into the newer documents of the devices
 * that saw it. It bounds a pull at about 50 * 344 KB however many documents a token holder writes. Such a
 * writer can still crowd the real devices out of the window: that stops Memory syncing (a denial of
 * sync) but never loses local progress.
 */
export const MEMORY_PULL_MAX = 50;

const STAGES = ['chunk_order', 'fill_blank', 'full_recall', 'review'] as const;

// The rules' patterns (firestore.rules memoryRowRe), in [0-9] form as the rules write them.
const VERSE_ID = '[a-z0-9]+(?:-[a-z0-9]+)*';
const DAY = '[0-9]{4}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12][0-9]|3[01])';
const ISO = `${DAY}T(?:[01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9][.][0-9]{3}Z`;
const COUNT = '(?:0|[1-9][0-9]{0,6})';
const MASTERY = '(?:0|[1-9][0-9]?|100)';
const ROW_RE = new RegExp(`^(${STAGES.join('|')}),(${VERSE_ID}),(${COUNT}),(${COUNT}),(${MASTERY}),(${ISO})?,(${ISO})?,(${ISO})?$`);

// ---- the merges ----

/** A time's ms, or -Infinity for null (never reviewed: the oldest) and for anything that is not a time. */
function reviewMs(t: string | null): number {
  if (t === null) return -Infinity;
  const ms = Date.parse(t);
  return Number.isFinite(ms) ? ms : -Infinity;
}

const encodeRow = (id: string, r: VerseProgress): string =>
  [r.stage, id, r.successes, r.failures, r.masteryScore, r.nextDueAt ?? '', r.lastReviewedAt ?? '', r.lapsedAt ?? ''].join(',');

/**
 * Whether row `a` beats row `b` for the same verse: the newer review; then more attempts (successes +
 * failures); then the larger encoding. The encoding is injective on rows the storage schema accepts, so
 * this is a total order and the merge a join. Equal rows: false (either is the same row).
 */
function rowBeats(id: string, a: VerseProgress, b: VerseProgress): boolean {
  return rowRank(id, a, id, b) > 0;
}

/**
 * The total order on (verse, row) pairs: the newer review, then more attempts, then the larger encoding
 * (it carries the verse id, and is injective on such pairs). For one verse it is rowBeats' order.
 * Positive when the first pair ranks higher, 0 for the same pair.
 */
function rowRank(ida: string, a: VerseProgress, idb: string, b: VerseProgress): number {
  const ta = reviewMs(a.lastReviewedAt);
  const tb = reviewMs(b.lastReviewedAt);
  if (ta !== tb) return ta > tb ? 1 : -1;
  const na = a.successes + a.failures;
  const nb = b.successes + b.failures;
  if (na !== nb) return na > nb ? 1 : -1;
  const ea = encodeRow(ida, a);
  const eb = encodeRow(idb, b);
  return ea === eb ? 0 : ea > eb ? 1 : -1;
}

/**
 * At most MEMORY_ROWS_MAX rows: the highest ranked (rowRank). Keeping the top K of the per-verse winners,
 * by an order that agrees with the per-verse one, is still a join: a row is kept exactly when it wins its
 * verse and fewer than K other verses have any row above it, whatever was cut earlier.
 */
export function capMemoryProgress(p: ProgressMap): ProgressMap {
  const ids = Object.keys(p);
  if (ids.length <= MEMORY_ROWS_MAX) return p;
  ids.sort((a, b) => rowRank(b, p[b]!, a, p[a]!));
  const out: ProgressMap = {};
  for (const id of ids.slice(0, MEMORY_ROWS_MAX)) put(out, id, p[id]!);
  return out;
}

/** Per verse, the whole row with the newer review (CONFLICTS.md rule 18); at most MEMORY_ROWS_MAX rows. A join. */
export function mergeMemoryProgress(a: ProgressMap, b: ProgressMap): ProgressMap {
  const out: ProgressMap = {};
  for (const [id, row] of Object.entries(a)) put(out, id, { ...row });
  for (const [id, row] of Object.entries(b)) {
    const mine = lookup(out, id);
    if (mine === undefined || rowBeats(id, row, mine)) put(out, id, { ...row });
  }
  return capMemoryProgress(out);
}

/** Completed days: a sorted union, the latest MEMORY_DAYS_MAX; the start: the earliest (rules 19, 20). A join. */
export function mergeMemoryHistory(a: MemoryHistory, b: MemoryHistory): MemoryHistory {
  const starts = [a.startedOn, b.startedOn].filter((d): d is string => d !== null).sort();
  const completedDates = [...new Set([...a.completedDates, ...b.completedDates])].sort().slice(-MEMORY_DAYS_MAX);
  return { startedOn: starts[0] ?? null, completedDates };
}

// ---- the wire encoding of progress ----

/** The wire string: one row per verse, sorted by verse id, joined with ';' ('' for no verses). Exact. */
export function encodeMemoryProgress(p: ProgressMap): string {
  return Object.keys(p)
    .sort()
    .map((id) => encodeRow(id, p[id]!))
    .join(';');
}

/**
 * The progress a wire string encodes, or null for anything that is not exactly an encoding (a row out of
 * pattern or order, a repeated verse, over the bounds) or whose value the storage schema refuses.
 */
export function decodeMemoryProgress(s: string): ProgressMap | null {
  if (typeof s !== 'string' || s.length > MEMORY_WIRE_MAX) return null;
  const out: ProgressMap = {};
  if (s === '') return out;
  const rows = s.split(';');
  if (rows.length > MEMORY_ROWS_MAX) return null;
  for (const row of rows) {
    const m = ROW_RE.exec(row);
    if (!m) return null;
    const [, stage, id, successes, failures, mastery, nextDueAt, lastReviewedAt, lapsedAt] = m;
    if (lookup(out, id!) !== undefined) return null;
    put(out, id!, {
      stage: stage as VerseProgress['stage'],
      successes: Number(successes),
      failures: Number(failures),
      masteryScore: Number(mastery),
      nextDueAt: nextDueAt ?? null,
      lastReviewedAt: lastReviewedAt ?? null,
      lapsedAt: lapsedAt ?? null,
    });
  }
  // Rows in another order (or anything else the pattern let through) are not exactly an encoding.
  if (encodeMemoryProgress(out) !== s) return null;
  return memoryProgressKey.schema.safeParse(out).success ? out : null;
}

// ---- the engine's helpers ----

/** The Memory storage keys the engine syncs (shapes.ts SyncDomains.memory). */
export interface MemoryKeys {
  progress: StorageKey<ProgressMap>;
  history: StorageKey<MemoryHistory>;
}

// ---- untrusted values: the bounds a row or a day must keep (rule 24) ----

/** What a Memory value may carry to be accepted (pulled) or sent (pushed). */
export interface MemoryBounds {
  /** A row reviewed or lapsed later than this (ms) is ignored. */
  latestMs: number;
  /** A completed day or start later than this local day is ignored. */
  latestDay: string;
  /** Rows of a verse it refuses are ignored (absent: any verse). */
  knownVerse?: (id: string) => boolean;
}

/** This device's local day after the one `nowMs` falls in (calendar arithmetic, so DST cannot skip a day). */
function localTomorrow(nowMs: number): string {
  const d = new Date(nowMs);
  return toLocalDateString(new Date(d.getFullYear(), d.getMonth(), d.getDate() + 1));
}

/**
 * The bounds at `nowMs`: times at most `aheadMs` ahead, days at most local tomorrow. A clock that reads
 * before MEMORY_CLOCK_MIN_MS is known wrong (a reset clock, or a test's): it bounds no time or day.
 */
export function memoryBounds(nowMs: number, aheadMs: number, knownVerse?: (id: string) => boolean): MemoryBounds {
  if (!(nowMs >= MEMORY_CLOCK_MIN_MS)) return { latestMs: Number.POSITIVE_INFINITY, latestDay: '9999-12-31', knownVerse };
  return { latestMs: nowMs + aheadMs, latestDay: localTomorrow(nowMs), knownVerse };
}

/** The rows within the bounds (each row on its own). The same map when none is dropped. */
export function boundMemoryProgress(p: ProgressMap, b: MemoryBounds): ProgressMap {
  const ok = (id: string, r: VerseProgress) =>
    (b.knownVerse === undefined || b.knownVerse(id)) && reviewMs(r.lastReviewedAt) <= b.latestMs && reviewMs(r.lapsedAt) <= b.latestMs;
  const ids = Object.keys(p);
  if (ids.every((id) => ok(id, p[id]!))) return p;
  const out: ProgressMap = {};
  for (const id of ids) if (ok(id, p[id]!)) put(out, id, p[id]!);
  return out;
}

/** The completed days and start within the bounds (a start past them reads as none). The same value when none is dropped. */
export function boundMemoryHistory(h: MemoryHistory, b: MemoryBounds): MemoryHistory {
  const completedDates = h.completedDates.filter((d) => d <= b.latestDay);
  const startedOn = h.startedOn !== null && h.startedOn > b.latestDay ? null : h.startedOn;
  if (completedDates.length === h.completedDates.length && startedOn === h.startedOn) return h;
  return { startedOn, completedDates };
}

/**
 * This device's own values as it may publish them (rule 24): rows and days within the push bounds
 * (`nowMs + CLOCK_AHEAD_MAX_MS`, local tomorrow; any verse). The engine signs and sends this, so a row
 * held back now goes out once real time reaches it (the value then differs from the last one sent);
 * the Firestore adapter applies it again (pushableMemory).
 */
export function pushableMemoryValues(
  v: { progress: ProgressMap; history: MemoryHistory },
  nowMs: number,
  aheadMs: number,
): { progress: ProgressMap; history: MemoryHistory } {
  const b = memoryBounds(nowMs, aheadMs);
  return { progress: boundMemoryProgress(v.progress, b), history: boundMemoryHistory(v.history, b) };
}

/** A pulled document's parts the device can store; a part the storage schema refuses is null (rule 21). */
export interface CheckedMemory {
  deviceId: string;
  progress: ProgressMap | null;
  history: MemoryHistory | null;
}

const isRecord = (v: unknown): v is Record<string, unknown> => !!v && typeof v === 'object' && !Array.isArray(v);

/**
 * Validates each pulled document's progress and history against the local keys' schemas, then drops the
 * rows and days outside `bounds` (rule 24; the engine passes now + MEMORY_AHEAD_MAX_MS and the library).
 */
export function checkMemoryDocs(keys: MemoryKeys, raw: readonly MemoryDoc[], bounds: MemoryBounds): CheckedMemory[] {
  const out: CheckedMemory[] = [];
  for (const doc of raw) {
    if (!isRecord(doc) || typeof doc.deviceId !== 'string') continue;
    const p = keys.progress.schema.safeParse(doc.progress);
    const h = keys.history.schema.safeParse(doc.history);
    out.push({
      deviceId: doc.deviceId,
      progress: p.success ? boundMemoryProgress(p.data as ProgressMap, bounds) : null,
      history: h.success ? boundMemoryHistory(h.data as MemoryHistory, bounds) : null,
    });
  }
  return out;
}

/** The join of every valid part of the documents (empty when there are none). */
export function joinMemoryDocs(docs: readonly CheckedMemory[]): { progress: ProgressMap; history: MemoryHistory } {
  let progress: ProgressMap = {};
  let history: MemoryHistory = { startedOn: null, completedDates: [] };
  for (const d of docs) {
    if (d.progress) progress = mergeMemoryProgress(progress, d.progress);
    if (d.history) history = mergeMemoryHistory(history, d.history);
  }
  return { progress, history };
}

/** A hash of the Memory values (change detection, and what this device last sent). */
export function memorySig(progress: ProgressMap, history: MemoryHistory): string {
  return hash53(`${encodeMemoryProgress(progress)}|${history.startedOn ?? ''}|${history.completedDates.join(';')}`);
}

/** Whether two Memory values are the same value. */
export function sameMemory(a: { progress: ProgressMap; history: MemoryHistory }, b: { progress: ProgressMap; history: MemoryHistory }): boolean {
  return stableStringify(a.progress) === stableStringify(b.progress) && stableStringify(a.history) === stableStringify(b.history);
}
