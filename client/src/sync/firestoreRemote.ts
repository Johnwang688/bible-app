// The Firestore RemoteStore (R-6b): one signed-in user's sync data under users/{uid} (layout and
// shapes in types.ts; /firestore.rules enforces them). Writes replace whole documents and stamp
// `serverTime` with serverTimestamp(); pulls read from the server, never from the local cache, so a
// pull while offline fails as `offline` instead of returning stale data. The adapter keeps no state
// between calls.
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

import {
  ITEM_KINDS,
  RemoteError,
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

function readDevice(id: string, d: DocumentData): DeviceProgress | undefined {
  const { deviceId, activeMs, chaptersRead, goalMetDays, goal, updatedAt } = d;
  if (!isString(deviceId) || deviceId !== id || !isNumber(updatedAt)) return undefined;
  if (!isPlainMap(activeMs) || !isPlainMap(chaptersRead) || !Array.isArray(goalMetDays)) return undefined;
  let g: DeviceProgress['goal'] = null;
  if (goal !== null) {
    if (!isPlainMap(goal) || !isNumber(goal.minutes) || !isNumber(goal.updatedAt)) return undefined;
    g = { minutes: goal.minutes, updatedAt: goal.updatedAt };
  }
  return {
    deviceId,
    activeMs: { ...activeMs } as Record<string, number>,
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

function writeValue(item: RemoteItem): RemoteItemValue | null {
  const v = item.value;
  if (item.deleted || v === null) return null;
  if ('colour' in v) return { colour: v.colour };
  if ('text' in v) return { text: v.text };
  return { createdAt: v.createdAt };
}

const itemDoc = (item: RemoteItem) => ({
  kind: item.kind,
  ref: item.ref,
  deleted: item.deleted,
  value: writeValue(item),
  updatedAt: item.updatedAt,
  deviceId: item.deviceId,
  serverTime: serverTimestamp(),
});

const deviceDoc = (p: DeviceProgress) => ({
  deviceId: p.deviceId,
  activeMs: { ...p.activeMs },
  chaptersRead: { ...p.chaptersRead },
  goalMetDays: [...p.goalMetDays],
  goal: p.goal === null ? null : { minutes: p.goal.minutes, updatedAt: p.goal.updatedAt },
  updatedAt: p.updatedAt,
  serverTime: serverTimestamp(),
});

const settingDoc = (s: RemoteSetting) => ({
  key: s.key,
  json: s.json,
  updatedAt: s.updatedAt,
  deviceId: s.deviceId,
  serverTime: serverTimestamp(),
});

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
      guarded(() => writeAll(list, (item) => ({ coll: 'items', id: item.id, data: itemDoc(item) }))),

    pullDevices: () => guarded(() => readAll(query(devices()), readDevice)),

    pushDevice: (progress) =>
      guarded(() => setDoc(doc(devices(), progress.deviceId), deviceDoc(progress))),

    pullSettings: () => guarded(() => readAll(query(settings()), readSetting)),

    pushSettings: (list) =>
      guarded(() => writeAll(list, (s) => ({ coll: 'settings', id: s.key, data: settingDoc(s) }))),
  };
}
