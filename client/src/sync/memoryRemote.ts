// An in-memory RemoteStore (R-6b, orchestrator-owned): the test double for the engine, with hooks to
// fail or hold calls. It behaves like the Firestore adapter: pushes replace documents by id, every
// write gets a strictly increasing serverTime, and incremental pulls return items (and Memory documents)
// written after `since`. Memory pulls keep the adapter's order and its MEMORY_PULL_MAX cap (not its
// character budget: test documents are small).
import { MEMORY_PULL_MAX, memoryPull } from './domains/memory';
import {
  RemoteError,
  type DeviceProgress,
  type MemoryDoc,
  type PulledItem,
  type RemoteItem,
  type RemoteSetting,
  type RemoteStore,
} from './types';

export type RemoteCall =
  | 'pullItems'
  | 'pushItems'
  | 'pullDevices'
  | 'pushDevice'
  | 'pullSettings'
  | 'pushSettings'
  | 'pullMemory'
  | 'pushMemory';

export interface MemoryRemote extends Required<RemoteStore> {
  /** The stored documents (copies). */
  readonly items: Map<string, PulledItem>;
  readonly devices: Map<string, DeviceProgress>;
  readonly settings: Map<string, RemoteSetting>;
  /** Memory documents by device id (each write also gets a serverTime, kept apart). */
  readonly memory: Map<string, MemoryDoc>;
  /** Every call made, in order. */
  readonly calls: RemoteCall[];
  /** Makes the next call(s) of `call` (or of any call when omitted) throw. */
  failNext(error: RemoteError, call?: RemoteCall, times?: number): void;
  /**
   * Holds the next call of `call` until the returned release() is called. The call's work runs at
   * release time (a push writes then, a pull reads then).
   */
  hold(call: RemoteCall): { release: () => void; started: Promise<void> };
  /**
   * Makes pushItems and pushSettings hold back (not write, and report as `held`) every entry whose id
   * (item id, setting key) `which` returns true for, as the Firestore adapter does for a clock too far
   * ahead (S5-1). Null (the default) holds nothing back.
   */
  holdBack(which: ((id: string) => boolean) | null): void;
  /** Writes an item as another device would (gets a serverTime). */
  putItem(item: RemoteItem): void;
  putDevice(progress: DeviceProgress): void;
  putSetting(setting: RemoteSetting): void;
  /** Writes a Memory document as another device would (stored as given, unvalidated). */
  putMemory(doc: MemoryDoc): void;
}

const copy = <T>(v: T): T => JSON.parse(JSON.stringify(v)) as T;

export function createMemoryRemote(): MemoryRemote {
  const items = new Map<string, PulledItem>();
  const devices = new Map<string, DeviceProgress>();
  const settings = new Map<string, RemoteSetting>();
  const memory = new Map<string, MemoryDoc>();
  const memoryTimes = new Map<string, number>();
  const calls: RemoteCall[] = [];
  const failures: { error: RemoteError; call?: RemoteCall }[] = [];
  const holds = new Map<RemoteCall, { gate: Promise<void>; markStarted: () => void }[]>();
  let clock = 1000;
  let heldBack: ((id: string) => boolean) | null = null;

  async function enter(call: RemoteCall): Promise<void> {
    calls.push(call);
    const i = failures.findIndex((f) => f.call === undefined || f.call === call);
    if (i >= 0) {
      const [f] = failures.splice(i, 1);
      throw f!.error;
    }
    const queue = holds.get(call);
    const h = queue?.shift();
    if (h) {
      h.markStarted();
      await h.gate;
    }
  }

  const putItem = (item: RemoteItem) => void items.set(item.id, { ...copy(item), serverTime: ++clock });
  const putMemory = (d: MemoryDoc) => {
    memory.set(d.deviceId, copy(d));
    memoryTimes.set(d.deviceId, ++clock);
  };

  return {
    items,
    devices,
    settings,
    memory,
    calls,
    failNext(error, call, times = 1) {
      for (let n = 0; n < times; n++) failures.push({ error, call });
    },
    hold(call) {
      let release!: () => void;
      let markStarted!: () => void;
      const gate = new Promise<void>((r) => (release = r));
      const started = new Promise<void>((r) => (markStarted = r));
      if (!holds.has(call)) holds.set(call, []);
      holds.get(call)!.push({ gate, markStarted });
      return { release, started };
    },
    holdBack(which) {
      heldBack = which;
    },
    putItem,
    putDevice: (p) => void devices.set(p.deviceId, copy(p)),
    putSetting: (s) => void settings.set(s.key, copy(s)),
    putMemory,

    async pullItems(since) {
      await enter('pullItems');
      const out = [...items.values()].filter((it) => since === null || it.serverTime > since).map(copy);
      const cursor = out.reduce<number | null>((m, it) => (m === null || it.serverTime > m ? it.serverTime : m), since);
      return { items: out, cursor };
    },
    async pushItems(list) {
      await enter('pushItems');
      const held: string[] = [];
      for (const it of list) {
        if ((it.value === null) !== it.deleted) throw new RemoteError('denied', 'value must be null exactly when deleted');
        if (heldBack?.(it.id)) held.push(it.id);
        else putItem(it);
      }
      return { held };
    },
    async pullDevices() {
      await enter('pullDevices');
      return [...devices.values()].map(copy);
    },
    async pushDevice(p) {
      await enter('pushDevice');
      devices.set(p.deviceId, copy(p));
    },
    async pullSettings() {
      await enter('pullSettings');
      return [...settings.values()].map(copy);
    },
    async pushSettings(list) {
      await enter('pushSettings');
      const held: string[] = [];
      for (const s of list) {
        if (heldBack?.(s.key)) held.push(s.key);
        else settings.set(s.key, copy(s));
      }
      return { held };
    },
    async pullMemory(since) {
      await enter('pullMemory');
      // A document cleared from `memory` by a test has no time either.
      const time = (id: string) => memoryTimes.get(id) ?? 0;
      const ids = [...memory.keys()];
      const page =
        since === null || since === undefined
          ? ids.sort((a, b) => time(b) - time(a) || (a < b ? 1 : -1)).slice(0, MEMORY_PULL_MAX)
          : ids
              .filter((id) => time(id) > since)
              .sort((a, b) => time(a) - time(b) || (a < b ? -1 : 1))
              .slice(0, MEMORY_PULL_MAX);
      const cursor = page.reduce<number | null>((m, id) => (m === null || time(id) > m ? time(id) : m), since ?? null);
      return memoryPull(page.map((id) => copy(memory.get(id)!)), cursor);
    },
    async pushMemory(d) {
      await enter('pushMemory');
      putMemory(d);
    },
  };
}
