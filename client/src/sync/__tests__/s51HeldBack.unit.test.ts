// S5-1 fix (R6b-s51-fix, implementer-owned): an item or setting the remote reports as held (not written) stays pending
// and is sent again on a later ordinary run. The acceptance tests are securityReview5.unit.test.ts (items, against the
// Firestore adapter); these add the settings twins, the engine's bookkeeping against memoryRemote, the cursor for a
// held item the run pulled, scheduling (no extra run) and crash safety.
//
// The Firestore adapter runs against the same kind of in-memory fake of 'firebase/firestore' as securityReview5: it
// applies the rules' isClientTime (a client clock must be an int > 0 and at most the server's time + 1 day), and the
// server's clock and this device's clock are separate.
import { appearanceKey, languageKey } from '../../storage/keys';
import { createStorage, memoryBackend, type KeyValueBackend, type Storage, type StorageKey } from '../../storage/storage';
import { createSyncEngine } from '../engine';
import { createFirestoreRemote } from '../firestoreRemote';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import type { SyncDomains } from '../shapes';
import { syncStateKey } from '../state';
import { RemoteError, type RemoteItem, type RemoteStore, type SyncEngine } from '../types';
import { setNote, studyKey } from './fixtures';

type Data = Record<string, unknown>;
interface FakeState {
  serverNow: number;
}

jest.mock('firebase/firestore', () => {
  const docs = new Map<string, Record<string, unknown>>();
  const state: FakeState = { serverNow: 0 };
  let tick = 0;
  class Timestamp {
    readonly ms: number;
    constructor(at: number) {
      this.ms = at;
    }
    toMillis() {
      return this.ms;
    }
    static fromMillis(ms: number) {
      return new Timestamp(ms);
    }
  }
  class FirestoreError extends Error {
    name = 'FirebaseError';
    code: string;
    constructor(code: string, message: string) {
      super(message);
      this.code = code;
    }
  }
  const isClientTime = (t: unknown) => typeof t === 'number' && Number.isInteger(t) && t > 0 && t <= state.serverNow + 86_400_000;
  const store = (path: string, d: Record<string, unknown>) => docs.set(path, { ...d, serverTime: new Timestamp(state.serverNow + ++tick) });
  const denied = () => new FirestoreError('permission-denied', 'Missing or insufficient permissions.');
  return {
    __fake: { docs, state },
    Timestamp,
    FirestoreError,
    serverTimestamp: () => ({ serverTimestamp: true }),
    collection: (_db: unknown, ...segs: string[]) => ({ path: segs.join('/') }),
    doc: (base: { path?: unknown }, ...segs: string[]) => ({ path: typeof base?.path === 'string' ? [base.path, ...segs].join('/') : segs.join('/') }),
    query: (c: { path: string }, ...cons: { field: string; value: Timestamp }[]) => ({ path: c.path, cons }),
    where: (field: string, _op: string, value: Timestamp) => ({ field, value }),
    getDocsFromServer: async (q: { path: string; cons: { field: string; value: Timestamp }[] }) => {
      const prefix = `${q.path}/`;
      const out: { id: string; data: () => Record<string, unknown> }[] = [];
      for (const [p, d] of docs) {
        const id = p.slice(prefix.length);
        if (!p.startsWith(prefix) || id.includes('/')) continue;
        if (q.cons.some((c) => !((d[c.field] as Timestamp).toMillis() > c.value.toMillis()))) continue;
        out.push({ id, data: () => d });
      }
      return { docs: out };
    },
    setDoc: async (ref: { path: string }, d: Record<string, unknown>) => {
      if (!isClientTime(d.updatedAt)) throw denied();
      store(ref.path, d);
    },
    writeBatch: () => {
      const ops: { ref: { path: string }; d: Record<string, unknown> }[] = [];
      return {
        set: (ref: { path: string }, d: Record<string, unknown>) => void ops.push({ ref, d }),
        commit: async () => {
          if (!ops.every((o) => isClientTime(o.d.updatedAt))) throw denied();
          for (const o of ops) store(o.ref.path, o.d);
        },
      };
    },
  };
});

const fake = (jest.requireMock('firebase/firestore') as { __fake: { docs: Map<string, Data>; state: FakeState } }).__fake;

const HOUR = 3_600_000;
const DAY = 24 * HOUR;
const T0 = Date.UTC(2026, 10, 2, 12, 0, 0);
const UID = 'alice';
const SELF = 'devA_0123456789abcde';

// ---- Settings through the Firestore adapter (the settings twins of the S5-1 tests) -------------------------------

describe('S5-1 settings: a setting the adapter holds back reaches the account later', () => {
  let deviceNow = T0;
  beforeEach(() => {
    fake.docs.clear();
    fake.state.serverNow = T0;
    deviceNow = T0;
    jest.spyOn(Date, 'now').mockImplementation(() => deviceNow);
    jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  });
  afterEach(() => jest.restoreAllMocks());

  const settingsOnly = (keys: StorageKey<unknown>[]): SyncDomains => ({ settings: keys });
  const engineFor = (storage: Storage, domains: SyncDomains): SyncEngine =>
    createSyncEngine({ uid: UID, storage, remote: createFirestoreRemote({} as never, UID), domains, deviceId: SELF, now: () => Date.now(), debounceMs: 60_000 });
  const settingOnServer = (key: string) => fake.docs.get(`users/${UID}/settings/${key}`);
  const clocksAt = (at: number) => {
    deviceNow = at;
    fake.state.serverNow = at;
  };

  test('a setting changed while the clock ran two days ahead syncs once real time has passed its clock', async () => {
    const storage = createStorage(memoryBackend());
    const engine = engineFor(storage, settingsOnly([languageKey as StorageKey<unknown>]));

    deviceNow = T0 + 2 * DAY; // the device's clock runs two days ahead; the server is at T0
    storage.set(languageKey, 'zh-Hans');
    await engine.syncNow();
    expect(engine.status().state).toBe('error'); // a one-document push refused by the server

    deviceNow = T0; // the clock is fixed: the setting's change time is now two days ahead, so it is held back
    await engine.syncNow();
    expect(settingOnServer('language')).toBeUndefined();
    expect(engine.status().state).toBe('idle');
    expect(storage.get(syncStateKey(UID)).settings.stamps.language).toBeDefined(); // still pending

    clocksAt(T0 + 3 * DAY);
    await engine.syncNow();
    expect(settingOnServer('language')?.json).toBe('"zh-Hans"');
    expect(storage.get(syncStateKey(UID)).settings.stamps.language).toBeUndefined(); // settled once written
  });

  test('a setting the server refused on its own in a retried batch is sent again later', async () => {
    const storage = createStorage(memoryBackend());
    const engine = engineFor(storage, settingsOnly([appearanceKey as StorageKey<unknown>, languageKey as StorageKey<unknown>]));

    // Offline first, so both settings are stamped by the device's correct clock but not pushed.
    deviceNow = T0 - HOUR;
    const offline = jest.spyOn(jest.requireMock('firebase/firestore') as { getDocsFromServer: () => Promise<unknown> }, 'getDocsFromServer');
    offline.mockRejectedValueOnce(Object.assign(new Error('offline'), { name: 'FirebaseError', code: 'unavailable' }));
    await engine.syncNow();
    expect(engine.status().state).toBe('offline');

    // The clock jumps two days ahead (set by hand); the language change is stamped by it.
    deviceNow = T0 + 2 * DAY;
    storage.set(languageKey, 'en');
    await engine.syncNow();
    expect(settingOnServer('appearance')).toBeDefined(); // the batch was retried document by document
    expect(settingOnServer('language')).toBeUndefined(); // refused on its own (server time + 1 day)
    expect(engine.status().state).toBe('idle');
    // Still pending, not settled (without this the engine's "the account has no value: put the device's back"
    // would hide a settled-as-written setting here, since the account has no language at all).
    const pending = storage.get(syncStateKey(UID)).settings;
    expect(pending.stamps.language).toBeDefined();
    expect(pending.base.language).toBeUndefined();
    expect(pending.base.appearance).toBeDefined(); // the written one settled

    clocksAt(T0 + 3 * DAY);
    await engine.syncNow();
    expect(settingOnServer('language')?.json).toBe('"en"');
  });
});

// ---- The adapter's result ----------------------------------------------------------------------------------------

describe('the Firestore adapter reports what it did not write', () => {
  beforeEach(() => {
    fake.docs.clear();
    fake.state.serverNow = T0;
    jest.spyOn(Date, 'now').mockImplementation(() => T0);
    jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  });
  afterEach(() => jest.restoreAllMocks());

  const note = (ref: string, updatedAt: number, text = 'n'): RemoteItem => ({ id: `note:${ref}`, kind: 'note', ref, deleted: false, value: { text }, updatedAt, deviceId: SELF });

  test('held: ahead and denied ids, not dropped ones, not written ones', async () => {
    const r = createFirestoreRemote({} as never, UID);
    fake.state.serverNow = T0 - 2 * HOUR; // the server is two hours behind: 23 h ahead of the device is 25 h ahead of it
    const res = await r.pushItems([
      note('1:1:1', T0 - HOUR), // written
      note('1:1:2', T0 + 2 * DAY), // ahead: held
      note('1:1:3', T0 + 23 * HOUR - 1), // inside the margin, refused by the server on its own: held
      note('1:1:4', T0 - HOUR, ''), // an empty note: dropped by the shape check, never pushable, not held
      { ...note('1:1:5', T0 - HOUR), value: { text: 'x', extra: 1 } as never }, // normalised: written
    ]);
    expect([...res.held].sort()).toEqual(['note:1:1:2', 'note:1:1:3']);
    expect(fake.docs.has(`users/${UID}/items/note:1:1:1`)).toBe(true);
    expect(fake.docs.has(`users/${UID}/items/note:1:1:5`)).toBe(true);
    expect(fake.docs.has(`users/${UID}/items/note:1:1:4`)).toBe(false);
  });

  test('settings: held keys', async () => {
    const r = createFirestoreRemote({} as never, UID);
    const res = await r.pushSettings([
      { key: 'language', json: '"en"', updatedAt: T0 + 2 * DAY, deviceId: SELF },
      { key: 'appearance', json: '{"mode":"dark","preset":null}', updatedAt: T0, deviceId: SELF },
    ]);
    expect(res.held).toEqual(['language']);
  });
});

// ---- The engine against memoryRemote's holdBack ---------------------------------------------------------------------

describe('the engine keeps held entries pending', () => {
  const items: SyncDomains = { studyItems: studyKey };
  let remote: MemoryRemote;
  let clock: { now: number };
  /** The ids sent in each pushItems call. */
  let pushed: string[][];

  beforeEach(() => {
    remote = createMemoryRemote();
    clock = { now: 1_000_000 };
    pushed = [];
    const inner = remote.pushItems.bind(remote);
    jest.spyOn(remote, 'pushItems').mockImplementation((list) => {
      pushed.push(list.map((i) => i.id));
      return inner(list);
    });
  });
  afterEach(() => {
    jest.restoreAllMocks();
    jest.useRealTimers();
  });

  const engineOn = (storage: Storage, domains: SyncDomains = items, r: RemoteStore = remote) =>
    createSyncEngine({ uid: UID, storage, remote: r, domains, deviceId: SELF, now: () => clock.now, debounceMs: 60_000, pullIntervalMs: 5 * 60_000 });
  const stateOf = (storage: Storage) => storage.get(syncStateKey(UID));
  const sentWith = (id: string) => pushed.filter((ids) => ids.includes(id)).length;

  test('a held item keeps its stamp, base and ignored entry; the rest settle; the run is idle; the next run sends it again', async () => {
    const storage = createStorage(memoryBackend());
    const engine = engineOn(storage);
    setNote(storage, '1:1:1', 'held', 900_000);
    setNote(storage, '2:2:2', 'written', 900_000);
    remote.failNext(new RemoteError('offline'), 'pullItems'); // a first run stamps both and pushes nothing
    await engine.syncNow();
    const before = stateOf(storage).items;
    expect(before.stamps['note:1:1:1']).toBeDefined();

    remote.holdBack((id) => id === 'note:1:1:1');
    await engine.syncNow();
    expect(engine.status().state).toBe('idle');
    const after = stateOf(storage).items;
    expect(after.stamps['note:1:1:1']).toEqual(before.stamps['note:1:1:1']);
    expect(after.base['note:1:1:1']).toEqual(before.base['note:1:1:1']);
    expect(after.ignored['note:1:1:1']).toEqual(before.ignored['note:1:1:1']);
    expect(after.stamps['note:2:2:2']).toBeUndefined();
    expect(after.base['note:2:2:2']).toBeDefined();
    expect(remote.items.has('note:1:1:1')).toBe(false);

    await engine.syncNow(); // still held: sent again, still pending
    expect(sentWith('note:1:1:1')).toBe(2);
    expect(sentWith('note:2:2:2')).toBe(1); // settled: not sent again
    expect(stateOf(storage).items.stamps['note:1:1:1']).toEqual(before.stamps['note:1:1:1']);

    remote.holdBack(null);
    await engine.syncNow();
    expect(sentWith('note:1:1:1')).toBe(3);
    expect(remote.items.get('note:1:1:1')?.value).toEqual({ text: 'held' });
    expect(stateOf(storage).items.stamps['note:1:1:1']).toBeUndefined();

    await engine.syncNow(); // settled now: nothing more to send
    expect(pushed).toHaveLength(3);
  });

  test('a held setting keeps its stamp and base and is sent again', async () => {
    const storage = createStorage(memoryBackend());
    const engine = engineOn(storage, { settings: [languageKey as StorageKey<unknown>] });
    storage.set(languageKey, 'en');
    remote.holdBack((id) => id === 'language');
    await engine.syncNow();
    expect(engine.status().state).toBe('idle');
    const held = stateOf(storage).settings;
    expect(held.stamps.language).toBeDefined();
    expect(held.base.language).toBeUndefined();
    expect(remote.settings.has('language')).toBe(false);

    remote.holdBack(null);
    await engine.syncNow();
    expect(remote.settings.get('language')?.json).toBe('"en"');
    expect(stateOf(storage).settings.stamps.language).toBeUndefined();
    expect(remote.calls.filter((c) => c === 'pushSettings')).toHaveLength(2);
  });

  test('a held repair of a copy this run pulled is sent again (the cursor waits for it)', async () => {
    const storage = createStorage(memoryBackend());
    const engine = engineOn(storage);
    setNote(storage, '1:1:1', 'mine', 900_000);
    await engine.syncNow();
    expect(remote.items.get('note:1:1:1')?.value).toEqual({ text: 'mine' });

    // A delayed write from another device lands with an older clock: this device sends its own value again.
    remote.putItem({ id: 'note:1:1:1', kind: 'note', ref: '1:1:1', deleted: false, value: { text: 'older' }, updatedAt: 500_000, deviceId: 'devB' });
    remote.holdBack((id) => id === 'note:1:1:1');
    await engine.syncNow();
    expect(engine.status().state).toBe('idle');
    expect(remote.items.get('note:1:1:1')?.value).toEqual({ text: 'older' });

    remote.holdBack(null);
    await engine.syncNow();
    expect(remote.items.get('note:1:1:1')?.value).toEqual({ text: 'mine' });
    expect(storage.get(studyKey).notes['1:1:1']?.text).toBe('mine');
  });

  test('a held item alone schedules no extra run: it is sent again by the next ordinary run (the interval)', async () => {
    jest.useFakeTimers();
    const storage = createStorage(memoryBackend());
    const engine = engineOn(storage);
    setNote(storage, '1:1:1', 'held', 900_000);
    remote.holdBack(() => true);
    engine.start();
    await jest.advanceTimersByTimeAsync(0); // the first run
    expect(engine.status().state).toBe('idle');
    expect(pushed).toHaveLength(1);
    const runs = () => remote.calls.filter((c) => c === 'pullItems').length;
    expect(runs()).toBe(1);

    await jest.advanceTimersByTimeAsync(5 * 60_000 - 1); // no retry, no debounce: nothing until the interval
    expect(runs()).toBe(1);
    expect(pushed).toHaveLength(1);

    remote.holdBack(null);
    await jest.advanceTimersByTimeAsync(1); // the interval's run sends it again
    expect(runs()).toBe(2);
    expect(pushed).toHaveLength(2);
    expect(remote.items.has('note:1:1:1')).toBe(true);
    await engine.stop();
  });
});

// ---- Crash safety ----------------------------------------------------------------------------------------------------

describe('crash safety: a crash anywhere in a run that held an item back still sends it next time', () => {
  /** A backend that can copy its bytes after any write of the run under test. */
  function copyingBackend() {
    const map = new Map<string, string>();
    let writes = 0;
    let onWrite: ((n: number) => void) | null = null;
    const after = () => {
      writes++;
      onWrite?.(writes);
    };
    const backend: KeyValueBackend = {
      getString: (k) => map.get(k),
      set: (k, v) => {
        map.set(k, v);
        after();
      },
      remove: (k) => {
        map.delete(k);
        after();
      },
    };
    return {
      backend,
      arm(hook: (n: number) => void) {
        writes = 0;
        onWrite = hook;
      },
      count: () => writes,
      copy: () => new Map(map),
    };
  }

  const fromCopy = (copy: Map<string, string>): KeyValueBackend => ({
    getString: (k) => copy.get(k),
    set: (k, v) => void copy.set(k, v),
    remove: (k) => void copy.delete(k),
  });

  /**
   * Device A syncs two notes; then B changes a third on the account (A takes it: a journaled local write) while A
   * edits 1:1:1, which the remote holds back. `crashAt` copies A's storage after that write of the run (0: before
   * the first; null: no crash, the run's write count is returned).
   */
  async function run(crashAt: number | null) {
    const remote = createMemoryRemote();
    const disk = copyingBackend();
    const storage = createStorage(disk.backend);
    const clock = { now: 1_000_000 };
    const engine = createSyncEngine({ uid: UID, storage, remote, domains: { studyItems: studyKey }, deviceId: SELF, now: () => clock.now, debounceMs: 60_000 });
    setNote(storage, '1:1:1', 'first', 900_000);
    setNote(storage, '3:3:3', 'mine', 900_000);
    await engine.syncNow();

    remote.putItem({ id: 'note:3:3:3', kind: 'note', ref: '3:3:3', deleted: false, value: { text: 'from B' }, updatedAt: 2_000_000, deviceId: 'devB' });
    clock.now = 2_500_000;
    setNote(storage, '1:1:1', 'edited', 2_400_000);
    remote.holdBack((id) => id === 'note:1:1:1');

    let crashed: Map<string, string> | null = crashAt === 0 ? disk.copy() : null;
    disk.arm((n) => {
      if (n === crashAt) crashed = disk.copy();
    });
    await engine.syncNow();
    expect(engine.status().state).toBe('idle');
    expect(remote.items.get('note:1:1:1')?.value).toEqual({ text: 'first' }); // held: the account still has the old one
    return { remote, writes: disk.count(), crashed: crashed as Map<string, string> | null, clock };
  }

  test('every crash point', async () => {
    const { writes } = await run(null);
    expect(writes).toBeGreaterThanOrEqual(3); // the journal, the taken note, the final state, the state after the push
    for (let at = 0; at <= writes; at++) {
      const { remote, crashed, clock } = await run(at);
      expect(crashed).not.toBeNull();
      remote.holdBack(null);
      const storage = createStorage(fromCopy(crashed!));
      clock.now = 3_000_000;
      const engine = createSyncEngine({ uid: UID, storage, remote, domains: { studyItems: studyKey }, deviceId: SELF, now: () => clock.now, debounceMs: 60_000 });
      await engine.syncNow();
      expect(engine.status().state).toBe('idle');
      expect(remote.items.get('note:1:1:1')?.value).toEqual({ text: 'edited' });
      expect(remote.items.get('note:1:1:1')?.updatedAt).toBe(2_400_000); // its own time, not the restart's
      expect(storage.get(studyKey).notes['3:3:3']?.text).toBe('from B');
      expect(remote.items.get('note:3:3:3')?.value).toEqual({ text: 'from B' });
      const st = storage.get(syncStateKey(UID));
      expect(st.items.stamps['note:1:1:1']).toBeUndefined();
      expect(st.journal).toBeNull();
    }
  });
});
