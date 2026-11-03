// The storage module: one typed key/value store with validated schemas.
// Native: MMKV. Web: MMKV's web build, which keeps values in localStorage.
// Every value is stored as JSON `{ v, data }`; a value that is corrupt, from another version
// or fails its schema reads as the key's fallback, so bad data never reaches the app. A key with
// `migrate` reads an older version through it instead (the next write stores the new version).
//
// Write tags (R-6b sync journal): a write may carry a short tag, stored in the same envelope as the
// value (`{ j, v, data }`, `j` first), so the value and its tag land in one atomic key write. A plain
// `set` keeps the key's existing tag, so a tagged write stays recognisable after the app edits the
// value again; `remove` drops it. `get` ignores the tag, and values stored without one read as before.
//
// Other tabs (web): two tabs of the app share localStorage, and the browser tells each tab when another one
// writes it (the `storage` event). What is shown follows it: `useStoredValue` hears other tabs' writes, so a tab
// left open never shows, or acts on, a stale value (a stale first-run intro closes once another tab finishes it,
// INT F2). A plain `subscribe` hears this tab's own writes only, as before: the sync engine reads its listener as
// "this device changed it", and another tab's write is that tab's to upload (hearing it would upload it twice).
import { useCallback, useSyncExternalStore } from 'react';
import type { z } from 'zod';

export interface KeyValueBackend {
  getString(key: string): string | undefined;
  set(key: string, value: string): void;
  remove(key: string): void;
  /**
   * Calls `listener` when a value changes from outside this store (another tab on the web), with its key, or
   * null when it cannot say which (the whole store was cleared). Returns the unsubscribe.
   */
  subscribeExternal?(listener: (key: string | null) => void): () => void;
}

export interface StorageKey<T> {
  key: string;
  version: number;
  schema: z.ZodType<T>;
  fallback: T;
  /**
   * Turns data stored under an older version into this version's shape; the result is still checked
   * against `schema`. Return `undefined` for data it cannot read, which then reads as the fallback.
   */
  migrate?: (fromVersion: number, data: unknown) => unknown;
}

export interface Storage {
  get<T>(k: StorageKey<T>): T;
  /**
   * Validates against the key's schema and throws (writing nothing) if it fails. With `tag`, the value
   * is stored with that tag (`[A-Za-z0-9_-]`, 1–64 characters; anything else throws, writing nothing);
   * without it, the key keeps the tag it had.
   */
  set<T>(k: StorageKey<T>, value: T, opts?: { tag?: string }): void;
  /** The tag stored with the key's value, or undefined (no value, or one written without a tag). */
  tagOf<T>(k: StorageKey<T>): string | undefined;
  remove<T>(k: StorageKey<T>): void;
  /**
   * Calls `listener` after each set or remove of this key made through this store. With `otherTabs`, also when
   * another tab changes it (web). Returns the unsubscribe.
   */
  subscribe<T>(k: StorageKey<T>, listener: () => void, opts?: { otherTabs?: boolean }): () => void;
}

const TAG_RE = /^[A-Za-z0-9_-]{1,64}$/;
/** A tagged envelope starts `{"j":"<tag>",`, so the tag is read without parsing the whole value. */
const TAGGED_RE = /^\{"j":"([A-Za-z0-9_-]{1,64})",/;

function tagIn(raw: string | undefined): string | undefined {
  return raw === undefined ? undefined : TAGGED_RE.exec(raw)?.[1];
}

export function createStorage(backend: KeyValueBackend): Storage {
  const listeners = new Map<string, Set<() => void>>();
  /** The subscribers that asked to hear other tabs' writes too. */
  const otherTabListeners = new Map<string, Set<() => void>>();
  const notify = (key: string) => {
    listeners.get(key)?.forEach((l) => l());
    otherTabListeners.get(key)?.forEach((l) => l());
  };
  const notifyOtherTab = (key: string) => otherTabListeners.get(key)?.forEach((l) => l());
  // For as long as the app runs: a change made in another tab reaches the subscribers that asked for it.
  backend.subscribeExternal?.((key) => {
    if (key !== null) notifyOtherTab(key);
    else [...otherTabListeners.keys()].forEach(notifyOtherTab);
  });

  return {
    // Parsed afresh on every read, so callers can never mutate the stored copy.
    get<T>(k: StorageKey<T>): T {
      const raw = backend.getString(k.key);
      if (raw === undefined) return clone(k.fallback);
      try {
        const env: unknown = JSON.parse(raw);
        if (env && typeof env === 'object' && 'data' in env) {
          const { v, data } = env as { v?: unknown; data: unknown };
          const current =
            v === k.version
              ? data
              : k.migrate && typeof v === 'number' && Number.isInteger(v) && v < k.version
                ? k.migrate(v, data)
                : undefined;
          const parsed = current === undefined ? null : k.schema.safeParse(current);
          if (parsed?.success) return parsed.data;
        }
      } catch {
        // Corrupt JSON, or a migration that throws, reads as the fallback.
      }
      return clone(k.fallback);
    },
    set(k, value, opts) {
      const data = k.schema.parse(value);
      let tag = opts?.tag;
      if (tag !== undefined && !TAG_RE.test(tag)) throw new Error('storage: invalid tag');
      tag ??= tagIn(backend.getString(k.key));
      backend.set(k.key, JSON.stringify(tag === undefined ? { v: k.version, data } : { j: tag, v: k.version, data }));
      notify(k.key);
    },
    tagOf(k) {
      return tagIn(backend.getString(k.key));
    },
    remove(k) {
      backend.remove(k.key);
      notify(k.key);
    },
    subscribe(k, listener, opts) {
      const byKey = opts?.otherTabs ? otherTabListeners : listeners;
      let set = byKey.get(k.key);
      if (!set) byKey.set(k.key, (set = new Set()));
      set.add(listener);
      return () => {
        set.delete(listener);
      };
    },
  };
}

/** The stored value as React state: the same object until the value changes, here or in another tab. */
export function useStoredValue<T>(storage: Storage, k: StorageKey<T>): [T, (value: T) => void] {
  const subscribe = useCallback((cb: () => void) => storage.subscribe(k, cb, { otherTabs: true }), [storage, k]);
  const snapshot = useSyncExternalStore(subscribe, () => snapshotOf(storage, k), () => snapshotOf(storage, k));
  const set = useCallback((value: T) => storage.set(k, value), [storage, k]);
  return [snapshot, set];
}

const snapshots = new WeakMap<Storage, Map<string, { json: string; value: unknown }>>();

function snapshotOf<T>(storage: Storage, k: StorageKey<T>): T {
  const value = storage.get(k);
  const json = JSON.stringify(value);
  let byKey = snapshots.get(storage);
  if (!byKey) snapshots.set(storage, (byKey = new Map()));
  const hit = byKey.get(k.key);
  if (hit && hit.json === json) return hit.value as T;
  byKey.set(k.key, { json, value });
  return value;
}

export function memoryBackend(): KeyValueBackend {
  const map = new Map<string, string>();
  return {
    getString: (key) => map.get(key),
    set: (key, value) => void map.set(key, value),
    remove: (key) => void map.delete(key),
  };
}

let defaultStorage: Storage | null = null;

/** The app's storage (MMKV, or localStorage on web), created on first use. */
export function getStorage(): Storage {
  if (!defaultStorage) {
    // Loaded lazily so tests and tools that never touch device storage do not need the native module.
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    const { createMMKV } = require('react-native-mmkv') as typeof import('react-native-mmkv');
    const mmkv = createMMKV({ id: 'bible-app' });
    defaultStorage = createStorage({
      getString: (key) => mmkv.getString(key),
      set: (key, value) => mmkv.set(key, value),
      remove: (key) => void mmkv.remove(key),
      subscribeExternal: (listener) => otherTabWrites(listener),
    });
  }
  return defaultStorage;
}

/** MMKV's web build keeps each value in localStorage under `<store id>` + one backslash + `<key>`. */
const WEB_KEY_PREFIX = 'bible-app\\';

/**
 * Writes to this app's keys made by another tab (web: the `storage` event, which the browser fires only in the
 * other tabs). On native there is one app and nothing to hear.
 */
export function otherTabWrites(listener: (key: string | null) => void): () => void {
  if (typeof window === 'undefined' || typeof window.addEventListener !== 'function') return () => {};
  const onStorage = (event: StorageEvent) => {
    // Session storage is not the store's.
    if (event.storageArea !== null && typeof localStorage !== 'undefined' && event.storageArea !== localStorage) return;
    if (event.key === null) listener(null);
    else if (event.key.startsWith(WEB_KEY_PREFIX)) listener(event.key.slice(WEB_KEY_PREFIX.length));
  };
  window.addEventListener('storage', onStorage);
  return () => window.removeEventListener('storage', onStorage);
}

/** Tests swap the app storage for a memory one. Pass null to go back to the device store. */
export function setStorageForTesting(storage: Storage | null): void {
  defaultStorage = storage;
}

function clone<T>(value: T): T {
  return value === null || typeof value !== 'object' ? value : (JSON.parse(JSON.stringify(value)) as T);
}
