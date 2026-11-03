// Memory progress and history across devices (MEM 3; CONFLICTS.md "Memory", rules 17–23). Pure: no I/O.
//
// Both merges are joins (commutative, associative, idempotent), so the order in which devices sync, how
// often a value is merged in again, and whether a document is stale or a copy of another device's merged
// values never matter: every device that has seen the same documents holds the same value.
//   - Progress: the union of verses; for a verse on both sides, the whole row with the newer
//     `lastReviewedAt` wins (never a mix of two rows' fields). Ties go by a fixed total order on the rows.
//   - History: the completed days are a sorted union without repeats, keeping the latest
//     MEMORY_DAYS_MAX (the storage cap); the start is the earliest known one. The streak is never
//     stored: Memory derives it from the completed days (memory/dailyLesson.ts dailyStreak).
//
// The wire form of progress is one compact string that the Firestore rules check with one anchored
// regex plus size bounds (/firestore.rules isMemoryProgress): one row per verse, sorted by verse id,
// joined with ';', each row the fields in a fixed order joined with ',' (null times are empty):
//   stage,verseId,successes,failures,masteryScore,nextDueAt,lastReviewedAt,lapsedAt
//   e.g. "fill_blank,john-3-16,1,0,20,2026-11-04T09:00:00.000Z,2026-11-02T09:00:00.000Z,"
// The stage comes first because no stage stays a stage with a character in front of it: a string with
// anything put before an encoding is not an encoding (a verse id would just read as a longer id).
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
  const ta = reviewMs(a.lastReviewedAt);
  const tb = reviewMs(b.lastReviewedAt);
  if (ta !== tb) return ta > tb;
  const na = a.successes + a.failures;
  const nb = b.successes + b.failures;
  if (na !== nb) return na > nb;
  return encodeRow(id, a) > encodeRow(id, b);
}

/** Per verse, the whole row with the newer review (CONFLICTS.md rule 18). A join. */
export function mergeMemoryProgress(a: ProgressMap, b: ProgressMap): ProgressMap {
  const out: ProgressMap = {};
  for (const [id, row] of Object.entries(a)) put(out, id, { ...row });
  for (const [id, row] of Object.entries(b)) {
    const mine = lookup(out, id);
    if (mine === undefined || rowBeats(id, row, mine)) put(out, id, { ...row });
  }
  return out;
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

/** A pulled document's parts the device can store; a part the storage schema refuses is null (rule 21). */
export interface CheckedMemory {
  deviceId: string;
  progress: ProgressMap | null;
  history: MemoryHistory | null;
}

const isRecord = (v: unknown): v is Record<string, unknown> => !!v && typeof v === 'object' && !Array.isArray(v);

/** Validates each pulled document's progress and history against the local keys' schemas. */
export function checkMemoryDocs(keys: MemoryKeys, raw: readonly MemoryDoc[]): CheckedMemory[] {
  const out: CheckedMemory[] = [];
  for (const doc of raw) {
    if (!isRecord(doc) || typeof doc.deviceId !== 'string') continue;
    const p = keys.progress.schema.safeParse(doc.progress);
    const h = keys.history.schema.safeParse(doc.history);
    out.push({
      deviceId: doc.deviceId,
      progress: p.success ? (p.data as ProgressMap) : null,
      history: h.success ? (h.data as MemoryHistory) : null,
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
