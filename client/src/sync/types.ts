// The sync layer's contracts (R-6b, orchestrator-owned). The engine, the Firestore adapter, the
// in-memory test remote and the account provider all build against these; change them only here.
//
// Firestore layout (every path is per user; the security rules in /firestore.rules enforce it):
//   users/{uid}/items/{kind}:{ref}     one study item, last writer wins (RemoteItem)
//   users/{uid}/devices/{deviceId}     one device's own reading progress (DeviceProgress)
//   users/{uid}/settings/{key}         one synced setting, last writer wins (RemoteSetting)
//   users/{uid}/memory/{deviceId}      one device's Memory progress and history (MemoryDoc); each device
//                                      writes only its own, every device merges them all (a join)
// Every document also carries `serverTime`, set by the server (request.time) on each write; pulls of
// items and of Memory documents are incremental on it. The client never deletes documents: a deleted study item is a
// tombstone (`deleted: true`, `value: null`). Only the backend's "delete my data" removes documents.
import type { ProgressMap } from '../memory/types';
import type { MemoryHistory } from '../storage/memoryKeys';
import type { HighlightId } from '../theme/highlights';

export type ItemKind = 'highlight' | 'note' | 'bookmark';
export const ITEM_KINDS: readonly ItemKind[] = ['highlight', 'note', 'bookmark'];

/** The value of a live item, by kind. */
export type RemoteItemValue =
  | { colour: HighlightId } // highlight
  | { text: string } // note: 1..NOTE_MAX_LENGTH characters
  | { createdAt: string }; // bookmark: an ISO time, at most 40 characters

export interface RemoteItem {
  /** `${kind}:${ref}`, e.g. `note:43:3:16`. Also the Firestore document id. */
  id: string;
  kind: ItemKind;
  /** The verse, `"43:3:16"` (storage/keys.ts `refKey`). */
  ref: string;
  deleted: boolean;
  /** Null exactly when `deleted`. */
  value: RemoteItemValue | null;
  /** Client time in ms of the change: the last-writer-wins clock. */
  updatedAt: number;
  /** The device that made the change: the tie-break when two changes have the same `updatedAt`. */
  deviceId: string;
}

/** An item as pulled: `serverTime` is the server's write time in ms. */
export interface PulledItem extends RemoteItem {
  serverTime: number;
}

/** One device's own reading progress. Each device writes only its own document. */
export interface DeviceProgress {
  deviceId: string;
  /** This device's own engaged reading time per local day (`"2026-11-02"` → ms). Never other devices' time. */
  activeMs: Record<string, number>;
  /** Chapters credited as read (`"43:3"` → ISO time first credited). */
  chaptersRead: Record<string, string>;
  /** Days the daily goal was met. */
  goalMetDays: string[];
  /** The daily goal as this device last set it, or null if this device never changed it. */
  goal: { minutes: number; updatedAt: number } | null;
  /** Client time in ms of this write. */
  updatedAt: number;
}

/**
 * One device's Memory progress and history (decoded; the wire form is the adapter's). Each device writes
 * only its own; it carries the device's merged values, so every document is a lower bound of the account's
 * Memory and merging any of them in is harmless (domains/memory.ts: the merge is a join).
 */
export interface MemoryDoc {
  deviceId: string;
  /** Verse id -> progress (storage/memoryKeys.ts memoryProgressKey). */
  progress: ProgressMap;
  /** The completed days and the start day (memoryHistoryKey). The streak is derived, never stored. */
  history: MemoryHistory;
  /** Client time in ms of this write. */
  updatedAt: number;
}

/**
 * A Memory pull (RemoteStore.pullMemory): the documents that decoded, as a plain array, and the cursor
 * the next incremental pull starts from (a non-enumerable property: domains/memory.ts memoryPull).
 */
export type MemoryPull = MemoryDoc[] & { readonly cursor: number | null };

/** The synced settings: the storage keys (storage/*.ts `key`) whose whole value syncs. */
export type SettingKey = 'appearance' | 'appearance.custom' | 'language';
export const SETTING_KEYS: readonly SettingKey[] = ['appearance', 'appearance.custom', 'language'];
export const SETTING_JSON_MAX = 4000;

export interface RemoteSetting {
  key: SettingKey;
  /** JSON of the stored value (the storage key's `data`, not the `{ v, data }` envelope). At most SETTING_JSON_MAX characters. */
  json: string;
  updatedAt: number;
  deviceId: string;
}

export type RemoteErrorKind = 'offline' | 'denied' | 'other';

/** What a RemoteStore throws. The engine maps `offline` to the offline status and the rest to error. */
export class RemoteError extends Error {
  readonly kind: RemoteErrorKind;
  constructor(kind: RemoteErrorKind, message?: string, options?: { cause?: unknown }) {
    super(message ?? `remote ${kind}`, options);
    this.name = 'RemoteError';
    this.kind = kind;
  }
}

/** One signed-in user's remote data. Implemented by firestoreRemote.ts and memoryRemote.ts. */
export interface RemoteStore {
  /**
   * Items written since `since` (server ms), or every item when `since` is null. Implementations may
   * return items at or before `since` too (callers must tolerate repeats). `cursor` is the larger of
   * `since` and the largest `serverTime` returned (null only when both are absent); it never goes back.
   */
  pullItems(since: number | null): Promise<{ items: PulledItem[]; cursor: number | null }>;
  /**
   * Writes the items (each replaces the document with that id). Resolves with the ids of the items it
   * did not write (`held`): resolving means every item not in `held` was written. An item is held when
   * it cannot be written now but may be later (firestoreRemote.ts: a clock too far ahead, or a document
   * the server refused on its own); the caller keeps it pending and sends it again on a later run.
   * Rejects when it cannot tell which items were written (the caller then treats none as written).
   */
  pushItems(items: readonly RemoteItem[]): Promise<{ held: readonly string[] }>;
  /** Every device's progress document, this device's included. */
  pullDevices(): Promise<DeviceProgress[]>;
  /** Replaces this device's progress document. */
  pushDevice(progress: DeviceProgress): Promise<void>;
  pullSettings(): Promise<RemoteSetting[]>;
  /** Writes the settings (each replaces the document with its key). Resolves and rejects as pushItems; `held` holds setting keys. */
  pushSettings(settings: readonly RemoteSetting[]): Promise<{ held: readonly string[] }>;
  /**
   * Memory documents, this device's included. With `since` null or absent, a full pull: the most recently
   * written ones (by `serverTime`), newest first. With `since` (server ms), an incremental pull: those
   * written after it, oldest first, so a pull that stops at its bounds skips nothing. Either reads at most
   * MEMORY_PULL_MAX documents and MEMORY_PULL_CHARS_MAX characters (domains/memory.ts). The result's
   * `cursor` is the largest `serverTime` it read, documents that did not decode included (or `since` when
   * it read none; null only when both are absent): an incremental pull from it returns exactly the
   * documents written since this one's last. Optional only so that test doubles written before Memory
   * synced (outside sync/) still type-check: the engine syncs Memory only when its domain is set and the
   * remote has both Memory methods. Both real remotes have them.
   */
  pullMemory?(since?: number | null): Promise<MemoryPull>;
  /** Replaces this device's Memory document. */
  pushMemory?(doc: MemoryDoc): Promise<void>;
}

export type SyncState = 'idle' | 'syncing' | 'offline' | 'error';

export interface SyncStatus {
  state: SyncState;
  /** Client ms of the last sync that finished without error, or null. */
  lastSyncedAt: number | null;
}

export interface SyncEngine {
  /** Starts watching local changes and runs a first sync. Calling it twice is a no-op. */
  start(): void;
  /**
   * Stops: no further local or remote writes once the returned promise resolves (it waits for a run
   * in flight to reach a safe point). Calling it twice, or before start, is fine.
   */
  stop(): Promise<void>;
  /** Runs a sync now (or joins the one in flight and runs once more after it). Never rejects. */
  syncNow(): Promise<void>;
  status(): SyncStatus;
  /** Called after every status change. Returns the unsubscribe. */
  subscribe(listener: () => void): () => void;
}
