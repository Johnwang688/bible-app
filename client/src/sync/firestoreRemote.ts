// The Firestore RemoteStore (R-6b): one signed-in user's sync data under users/{uid} (layout and
// shapes in types.ts; /firestore.rules enforces them). Writes replace whole documents and stamp
// `serverTime` with serverTimestamp(); pulls read from the server, never from the local cache, so a
// pull while offline fails as `offline` instead of returning stale data. The adapter keeps no state
// between calls.
//
// The wire format is one the schema-tight rules can check entry by entry (see the rules' header): a
// device's activeMs travels as one string "YYYY-MM-DD=ms;..." (decoded back to the same record on pull),
// and settings JSON is written with its object keys sorted. The push path first drops or normalises
// whatever the storage schemas allow but the rules refuse (the `pushable*` functions, mirroring the
// rules), so no such entry can make a push fail, forever, for the documents around it.
import {
  collection,
  doc,
  FirestoreError,
  getDocsFromServer,
  query,
  serverTimestamp,
  setDoc,
  Timestamp,
  where,
  writeBatch,
  type DocumentData,
  type Firestore,
  type Query,
} from 'firebase/firestore';

import { HIGHLIGHT_IDS, type HighlightId } from '../theme/highlights';
import { PRESET_IDS } from '../theme/types';
import { put, stableStringify } from './merge';
import {
  ITEM_KINDS,
  RemoteError,
  SETTING_JSON_MAX,
  SETTING_KEYS,
  type DeviceProgress,
  type ItemKind,
  type PulledItem,
  type RemoteItem,
  type RemoteItemValue,
  type RemoteSetting,
  type RemoteStore,
  type SettingKey,
} from './types';

/** Writes per batch (Firestore allows 500; keep a margin). */
const BATCH_MAX = 450;
/** Incremental pulls re-read this far back, so a write that became visible late is not missed. */
const PULL_OVERLAP_MS = 60_000;

// ---- Errors ------------------------------------------------------------------------------------

const OFFLINE_CODES = new Set<string>(['unavailable', 'deadline-exceeded']);
const DENIED_CODES = new Set<string>(['permission-denied', 'unauthenticated']);

function isNetworkFailure(e: unknown): boolean {
  if (!(e instanceof Error)) return false;
  return /network|failed to fetch|fetch failed|offline|ECONNREFUSED|ECONNRESET|ETIMEDOUT|ENOTFOUND/i.test(e.message);
}

/**
 * The error's Firestore code, or undefined. Matched by shape rather than `instanceof FirestoreError`:
 * bundlers and test runners can load more than one copy of the SDK (ESM and CJS builds), and an
 * error from the other copy fails `instanceof`. Codes may carry a `firestore/` prefix.
 */
function firestoreCode(e: unknown): string | undefined {
  if (e instanceof FirestoreError) return e.code;
  if (typeof e !== 'object' || e === null) return undefined;
  const { code, name } = e as { code?: unknown; name?: unknown };
  if (typeof code !== 'string' || (name !== 'FirebaseError' && name !== 'FirestoreError')) return undefined;
  return code.replace(/^firestore\//, '');
}

function toRemoteError(e: unknown): RemoteError {
  if (e instanceof RemoteError) return e;
  const code = firestoreCode(e);
  if (code !== undefined) {
    const message = (e as Error).message;
    if (DENIED_CODES.has(code)) return new RemoteError('denied', message, { cause: e });
    if (OFFLINE_CODES.has(code)) return new RemoteError('offline', message, { cause: e });
    return new RemoteError('other', message, { cause: e });
  }
  if (isNetworkFailure(e)) return new RemoteError('offline', (e as Error).message, { cause: e });
  return new RemoteError('other', e instanceof Error ? e.message : undefined, { cause: e });
}

async function guarded<T>(work: () => Promise<T>): Promise<T> {
  try {
    return await work();
  } catch (e) {
    throw toRemoteError(e);
  }
}

// ---- Shape checks for pulled documents ---------------------------------------------------------
// Minimal: field types only. The engine validates values against the storage schemas.

const isString = (v: unknown): v is string => typeof v === 'string';
const isNumber = (v: unknown): v is number => typeof v === 'number' && Number.isFinite(v);
/** A Firestore Timestamp (by shape, for the same reason as `firestoreCode`). */
const isTimestamp = (v: unknown): v is { toMillis(): number } =>
  v instanceof Timestamp || (typeof v === 'object' && v !== null && typeof (v as Timestamp).toMillis === 'function');
const isPlainMap = (v: unknown): v is Record<string, unknown> =>
  typeof v === 'object' && v !== null && !Array.isArray(v) && !isTimestamp(v);

function readValue(kind: ItemKind, v: unknown): RemoteItemValue | undefined {
  if (!isPlainMap(v)) return undefined;
  switch (kind) {
    case 'highlight':
      return isString(v.colour) ? ({ colour: v.colour } as RemoteItemValue) : undefined;
    case 'note':
      return isString(v.text) ? { text: v.text } : undefined;
    case 'bookmark':
      return isString(v.createdAt) ? { createdAt: v.createdAt } : undefined;
  }
}

function readItem(id: string, d: DocumentData): PulledItem | undefined {
  const { kind, ref, deleted, updatedAt, deviceId, serverTime } = d;
  if (!ITEM_KINDS.includes(kind) || !isString(ref) || id !== `${kind}:${ref}`) return undefined;
  if (typeof deleted !== 'boolean' || !isNumber(updatedAt) || !isString(deviceId)) return undefined;
  // A pending (or missing) server timestamp reads as null: skip until it is set.
  if (!isTimestamp(serverTime)) return undefined;
  const serverMs = serverTime.toMillis();
  if (!isNumber(serverMs)) return undefined;
  let value: RemoteItemValue | null = null;
  if (deleted) {
    if (d.value !== null) return undefined;
  } else {
    const v = readValue(kind as ItemKind, d.value);
    if (!v) return undefined;
    value = v;
  }
  return { id, kind, ref, deleted, value, updatedAt, deviceId, serverTime: serverMs };
}

/** activeMs from its wire string "day=ms;day=ms" (encodeActiveMs). Malformed entries are skipped. */
function readActiveMs(wire: unknown): Record<string, number> | undefined {
  if (!isString(wire)) return undefined;
  const out: Record<string, number> = {};
  if (wire === '') return out;
  for (const entry of wire.split(';')) {
    const at = entry.indexOf('=');
    const ms = at > 0 ? entry.slice(at + 1) : '';
    if (!/^[0-9]{1,15}$/.test(ms)) continue;
    put(out, entry.slice(0, at), Number(ms));
  }
  return out;
}

function readDevice(id: string, d: DocumentData): DeviceProgress | undefined {
  const { deviceId, chaptersRead, goalMetDays, goal, updatedAt } = d;
  if (!isString(deviceId) || deviceId !== id || !isNumber(updatedAt)) return undefined;
  const activeMs = readActiveMs(d.activeMs);
  if (!activeMs || !isPlainMap(chaptersRead) || !Array.isArray(goalMetDays)) return undefined;
  let g: DeviceProgress['goal'] = null;
  if (goal !== null) {
    if (!isPlainMap(goal) || !isNumber(goal.minutes) || !isNumber(goal.updatedAt)) return undefined;
    g = { minutes: goal.minutes, updatedAt: goal.updatedAt };
  }
  return {
    deviceId,
    activeMs,
    chaptersRead: { ...chaptersRead } as Record<string, string>,
    goalMetDays: [...goalMetDays] as string[],
    goal: g,
    updatedAt,
  };
}

function readSetting(id: string, d: DocumentData): RemoteSetting | undefined {
  const { key, json, updatedAt, deviceId } = d;
  if (!SETTING_KEYS.includes(key) || key !== id) return undefined;
  if (!isString(json) || !isNumber(updatedAt) || !isString(deviceId)) return undefined;
  return { key: key as SettingKey, json, updatedAt, deviceId };
}

// ---- Documents as written (exactly the rules' fields) -------------------------------------------
// These only shape documents; they never validate or drop anything (the push path does that first).

/** activeMs on the wire: "day=ms" entries sorted by day, joined with ';' ('' when there are none). */
const encodeActiveMs = (activeMs: Record<string, number>): string =>
  Object.keys(activeMs)
    .sort()
    .map((day) => `${day}=${String(activeMs[day])}`)
    .join(';');

/**
 * Settings JSON with its object keys sorted (merge.ts stableStringify) when that only reorders keys.
 * JSON that does not parse, or is not compact (exactly what JSON.stringify writes), is kept as it is.
 */
function canonicalJson(json: string): string {
  let parsed: unknown;
  try {
    parsed = JSON.parse(json);
  } catch {
    return json;
  }
  return JSON.stringify(parsed) === json ? stableStringify(parsed) : json;
}

const itemDoc = (item: RemoteItem) => ({
  kind: item.kind,
  ref: item.ref,
  deleted: item.deleted,
  value: item.deleted || item.value === null ? null : { ...item.value },
  updatedAt: item.updatedAt,
  deviceId: item.deviceId,
  serverTime: serverTimestamp(),
});

const deviceDoc = (p: DeviceProgress) => ({
  deviceId: p.deviceId,
  activeMs: encodeActiveMs(p.activeMs),
  chaptersRead: { ...p.chaptersRead },
  goalMetDays: [...p.goalMetDays],
  goal: p.goal === null ? null : { ...p.goal },
  updatedAt: p.updatedAt,
  serverTime: serverTimestamp(),
});

const settingDoc = (s: RemoteSetting) => ({
  key: s.key,
  json: canonicalJson(s.json),
  updatedAt: s.updatedAt,
  deviceId: s.deviceId,
  serverTime: serverTimestamp(),
});

/** The documents exactly as the adapter writes them, each with `serverTime: serverTimestamp()`. */
export const wireDocs = {
  item: (i: RemoteItem) => itemDoc(i),
  device: (p: DeviceProgress) => deviceDoc(p),
  setting: (s: RemoteSetting) => settingDoc(s),
};

// ---- The push path: what the rules would refuse is dropped or normalised first -------------------
// Mirrors /firestore.rules for what the storage schemas allow but the rules do not (a time that is not
// an ISO time, a day over the caps, ...). Ids and clocks are not checked: the engine makes those, and a
// refusal there should surface as an error, not vanish.

const DAY = '[0-9]{4}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12][0-9]|3[01])';
const DAY_RE = new RegExp(`^${DAY}$`);
const ISO_RE = new RegExp(`^${DAY}T(?:[01][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9][.][0-9]{3}Z$`);
const CHAPTER_RE = /^(?:[1-9]|[1-5][0-9]|6[0-6]):(?:[1-9]|[1-9][0-9]|1[0-4][0-9]|150)$/;
const REF_RE = /^(?:[1-9]|[1-5][0-9]|6[0-6]):[1-9][0-9]{0,2}:[1-9][0-9]{0,2}$/;
/** The most days in activeMs and in goalMetDays, and chapters in chaptersRead, the rules allow. */
const DAYS_MAX = 20_000;
const CHAPTERS_MAX = 1189;
/** The most reading time one day can hold. */
const DAY_MS_MAX = 86_400_000;
const NOTE_MAX = 5000;
const LANGUAGES: readonly unknown[] = ['system', 'en', 'zh-Hans'];
const MODES: readonly unknown[] = ['system', 'light', 'dark'];

/** The time as Date.toISOString() writes it, or undefined when it cannot be read as a time. */
function isoTime(t: unknown): string | undefined {
  if (!isString(t)) return undefined;
  if (ISO_RE.test(t)) return t;
  const ms = Date.parse(t);
  if (!Number.isFinite(ms)) return undefined;
  const iso = new Date(ms).toISOString();
  return ISO_RE.test(iso) ? iso : undefined;
}

/** One line without user data: how many entries or documents were dropped or normalised. */
function warnFixed(what: string, count: number): void {
  if (count > 0) console.warn(`[sync] ${count} ${what} the security rules would refuse were dropped or normalised before the push`);
}

/**
 * The item with its value reduced to its kind's one field, if the rules accept it; else null. A bookmark
 * whose time is not an ISO time is dropped rather than rewritten: its time is also its sync signature,
 * so a rewrite would come back as a change.
 */
function pushableItem(item: RemoteItem): RemoteItem | null {
  if (!ITEM_KINDS.includes(item.kind) || !REF_RE.test(item.ref) || item.id !== `${item.kind}:${item.ref}`) return null;
  const v = item.value as Record<string, unknown> | null;
  if (item.deleted || v === null) return item.deleted && v === null ? item : null;
  let value: RemoteItemValue | undefined;
  switch (item.kind) {
    case 'highlight':
      if ((HIGHLIGHT_IDS as readonly unknown[]).includes(v.colour)) value = { colour: v.colour as HighlightId };
      break;
    case 'note':
      if (isString(v.text) && v.text.length >= 1 && v.text.length <= NOTE_MAX) value = { text: v.text };
      break;
    case 'bookmark':
      if (isString(v.createdAt) && ISO_RE.test(v.createdAt)) value = { createdAt: v.createdAt };
      break;
  }
  return value ? { ...item, value } : null;
}

const isGoalMinutes = (m: number): boolean => Number.isInteger(m) && m >= 5 && m <= 120 && m % 5 === 0;

/**
 * The device progress the rules accept: days and chapters that are not days or chapters are dropped;
 * activeMs and goalMetDays keep the newest DAYS_MAX days; a day's time is clamped to 0..DAY_MS_MAX (and
 * dropped if it is not an int); chapter times are rewritten as ISO times (the same instant), or dropped
 * when they are not times; goalMetDays loses repeats and is sorted; the goal keeps only its two fields,
 * and a goal the rules refuse becomes null.
 */
function pushableDevice(p: DeviceProgress): DeviceProgress {
  let fixed = 0;

  const days = Object.keys(p.activeMs)
    .filter((day) => DAY_RE.test(day) && Number.isInteger(p.activeMs[day]))
    .sort();
  fixed += Object.keys(p.activeMs).length - days.length + Math.max(0, days.length - DAYS_MAX);
  const activeMs: Record<string, number> = {};
  for (const day of days.slice(-DAYS_MAX)) {
    const ms = p.activeMs[day]!;
    const clamped = Math.min(DAY_MS_MAX, Math.max(0, ms));
    if (clamped !== ms) fixed++;
    put(activeMs, day, clamped);
  }

  const chaptersRead: Record<string, string> = {};
  let chapters = 0;
  for (const chapter of Object.keys(p.chaptersRead)) {
    const raw = p.chaptersRead[chapter];
    const iso = CHAPTER_RE.test(chapter) && chapters < CHAPTERS_MAX ? isoTime(raw) : undefined;
    if (iso !== raw) fixed++;
    if (iso === undefined) continue;
    put(chaptersRead, chapter, iso);
    chapters++;
  }

  const metDays = [...new Set(p.goalMetDays.filter((day) => isString(day) && DAY_RE.test(day)))].sort();
  fixed += p.goalMetDays.length - metDays.length + Math.max(0, metDays.length - DAYS_MAX);
  const goalMetDays = metDays.slice(-DAYS_MAX);

  let goal: DeviceProgress['goal'] = null;
  if (p.goal !== null) {
    const { minutes, updatedAt } = p.goal;
    if (isGoalMinutes(minutes) && Number.isInteger(updatedAt) && updatedAt > 0) goal = { minutes, updatedAt };
    if (goal === null || Object.keys(p.goal).length !== 2) fixed++;
  }

  warnFixed('device progress entries', fixed);
  return { ...p, activeMs, chaptersRead, goalMetDays, goal };
}

const isObject = (v: unknown): v is Record<string, unknown> => typeof v === 'object' && v !== null && !Array.isArray(v);

/** The setting with canonical JSON (keys sorted) if the rules accept its value, else null. */
function pushableSetting(s: RemoteSetting): RemoteSetting | null {
  let value: unknown;
  try {
    value = JSON.parse(s.json);
  } catch {
    return null;
  }
  const json = stableStringify(value);
  let ok: boolean;
  switch (s.key) {
    case 'language':
      ok = LANGUAGES.includes(value);
      break;
    case 'appearance':
      ok =
        isObject(value) &&
        Object.keys(value).sort().join() === 'mode,preset' &&
        MODES.includes(value.mode) &&
        (value.preset === null || (PRESET_IDS as readonly unknown[]).includes(value.preset));
      break;
    case 'appearance.custom':
      ok = isObject(value) && json.length <= SETTING_JSON_MAX;
      break;
    default:
      ok = false;
  }
  return ok ? { ...s, json } : null;
}

/** The entries `fix` keeps (non-null), with one warning for the rest. */
function keepPushable<T>(list: readonly T[], fix: (entry: T) => T | null, what: string): T[] {
  const out: T[] = [];
  for (const entry of list) {
    const kept = fix(entry);
    if (kept !== null) out.push(kept);
  }
  warnFixed(what, list.length - out.length);
  return out;
}

// ---- The store ---------------------------------------------------------------------------------

export function createFirestoreRemote(db: Firestore, uid: string): RemoteStore {
  const items = () => collection(db, 'users', uid, 'items');
  const devices = () => collection(db, 'users', uid, 'devices');
  const settings = () => collection(db, 'users', uid, 'settings');

  /** Writes in batches of at most BATCH_MAX, committed one after another. */
  async function writeAll<T>(
    entries: readonly T[],
    target: (entry: T) => { id: string; data: DocumentData; coll: 'items' | 'settings' },
  ): Promise<void> {
    for (let start = 0; start < entries.length; start += BATCH_MAX) {
      const batch = writeBatch(db);
      for (const entry of entries.slice(start, start + BATCH_MAX)) {
        const { id, data, coll } = target(entry);
        batch.set(doc(db, 'users', uid, coll, id), data);
      }
      await batch.commit();
    }
  }

  async function readAll<T>(q: Query, read: (id: string, d: DocumentData) => T | undefined): Promise<T[]> {
    const snap = await getDocsFromServer(q);
    const out: T[] = [];
    for (const d of snap.docs) {
      const v = read(d.id, d.data());
      if (v !== undefined) out.push(v);
    }
    return out;
  }

  return {
    pullItems: (since) =>
      guarded(async () => {
        const q =
          since === null
            ? query(items())
            : query(items(), where('serverTime', '>', Timestamp.fromMillis(since - PULL_OVERLAP_MS)));
        const pulled = await readAll(q, readItem);
        let cursor = since;
        for (const item of pulled) if (cursor === null || item.serverTime > cursor) cursor = item.serverTime;
        return { items: pulled, cursor };
      }),

    pushItems: (list) =>
      guarded(() => {
        const pushable = keepPushable(list, pushableItem, 'study items');
        return writeAll(pushable, (item) => ({ coll: 'items', id: item.id, data: itemDoc(item) }));
      }),

    pullDevices: () => guarded(() => readAll(query(devices()), readDevice)),

    pushDevice: (progress) =>
      guarded(() => setDoc(doc(devices(), progress.deviceId), deviceDoc(pushableDevice(progress)))),

    pullSettings: () => guarded(() => readAll(query(settings()), readSetting)),

    pushSettings: (list) =>
      guarded(() => {
        const pushable = keepPushable(list, pushableSetting, 'settings');
        return writeAll(pushable, (s) => ({ coll: 'settings', id: s.key, data: settingDoc(s) }));
      }),
  };
}
