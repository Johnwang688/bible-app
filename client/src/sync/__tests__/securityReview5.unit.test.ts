// PARKED for John (claude-workflows 5a step 5): every S5 finding repeats a class implementer-hard already fixed in
// round 4 (S5-1/2/3: the S4-1 held-back-clock class; S5-4/5: the S4-5 session store under an MMKV failure; S5-6: the
// S4-3 offer recording). Confirmed failing by the orchestrator; the "sound:" tests stay on. Fix designs are in the
// reviewer's notes (C:/dev/bible-app-work/r6b/R6b-security-r5-result.json) and the PR.
// Security review round 5 (R-6b follow-up): the fixes for round 4's S4-1 in the Firestore adapter (held-back clocks and
// the per-document retry). Reviewer-owned. A test named "S5-n ..." encodes a finding and fails on the code as reviewed;
// a test named "sound: ..." records something checked and found correct (it passes).
//
// The adapter (firestoreRemote.ts) runs against an in-memory fake of 'firebase/firestore' that applies the one rule
// these findings are about, the rules' isClientTime: a client clock must be an int > 0 and at most the server's
// request.time + 1 day (items' and settings' updatedAt, the device document's updatedAt and its goal's updatedAt).
// The server's clock and this device's clock are separate, so a device whose clock runs ahead can be modelled.
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { createSyncEngine } from '../engine';
import { createFirestoreRemote } from '../firestoreRemote';
import type { SyncDomains } from '../shapes';
import type { RemoteItem, SyncEngine } from '../types';
import { progressKey, setNote, studyKey } from './fixtures';

type Data = Record<string, unknown>;
interface FakeState {
  /** The server's clock (request.time), ms. */
  serverNow: number;
  /** Every write request that reached the server: a batch commit counts once, a setDoc once. */
  requests: { kind: 'batch' | 'set'; paths: string[]; ok: boolean }[];
}

jest.mock('firebase/firestore', () => {
  const docs = new Map<string, Record<string, unknown>>();
  const state: FakeState = { serverNow: 0, requests: [] };
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
  const allowed = (path: string, d: Record<string, unknown>): boolean => {
    if (!isClientTime(d.updatedAt)) return false;
    if (path.split('/')[2] === 'devices' && d.goal !== null && !isClientTime((d.goal as { updatedAt?: unknown }).updatedAt)) return false;
    return true;
  };
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
      const ok = allowed(ref.path, d);
      state.requests.push({ kind: 'set', paths: [ref.path], ok });
      if (!ok) throw denied();
      store(ref.path, d);
    },
    writeBatch: () => {
      const ops: { ref: { path: string }; d: Record<string, unknown> }[] = [];
      return {
        set: (ref: { path: string }, d: Record<string, unknown>) => void ops.push({ ref, d }),
        commit: async () => {
          const ok = ops.every((o) => allowed(o.ref.path, o.d));
          state.requests.push({ kind: 'batch', paths: ops.map((o) => o.ref.path), ok });
          if (!ok) throw denied();
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

/** This device's clock (Date.now, which the adapter's bound reads, and the engine's `now`). */
let deviceNow = T0;
let warn: jest.SpyInstance;

beforeEach(() => {
  fake.docs.clear();
  fake.state.requests.length = 0;
  fake.state.serverNow = T0;
  deviceNow = T0;
  jest.spyOn(Date, 'now').mockImplementation(() => deviceNow);
  warn = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
});
afterEach(() => {
  jest.restoreAllMocks();
});

const remote = () => createFirestoreRemote({} as never, UID);

function engineFor(storage: Storage, domains: SyncDomains): SyncEngine {
  return createSyncEngine({ uid: UID, storage, remote: remote(), domains, deviceId: SELF, now: () => Date.now(), debounceMs: 60_000 });
}

/** Both clocks agree again (the device's clock was fixed), at `at`. */
const clocksAt = (at: number) => {
  deviceNow = at;
  fake.state.serverNow = at;
};

const itemOnServer = (id: string) => fake.docs.get(`users/${UID}/items/${id}`);

// ---- S5-1: a held-back document is settled by the engine and never sent again --------------------------------

describe('S5-1 (medium): an item the adapter holds back (or the server refuses on its own) never reaches the account', () => {
  // firestoreRemote.ts holds back an item whose clock is past Date.now() + 23 h, and after a refused batch counts the
  // documents refused on their own as `held.denied`; in both cases pushItems RESOLVES. The engine (engine.ts, after
  // `await remote.pushItems(...)`) then moves the base to the item's value and clock and settles its stamp, exactly as
  // for a written item. So the item is never sent again: not when real time passes its clock, not on any later run.
  // The adapter's own comment says so ("Not by itself"); the fix card assumed the opposite ("it can once real time
  // passes its clock, since the engine keeps its stamp"). The RemoteStore contract says a push "resolves only when all
  // are written". The user sees the note on this device, sync status idle, and the note is missing on every other
  // device and after a reinstall, with no error anywhere. With a device clock more than ~1 h ahead of the server
  // (a date set by hand), the second test's path loses every fresh edit that shares a batch with an older one.
  const items: SyncDomains = { studyItems: studyKey };

  test.skip('S5-1 a note stamped while the clock ran two days ahead syncs once real time has passed its clock', async () => {
    const storage = createStorage(memoryBackend());
    const engine = engineFor(storage, items);

    deviceNow = T0 + 2 * DAY; // the device's clock runs two days ahead; the server is at T0
    setNote(storage, '43:3:16', 'written while the clock ran ahead', T0 + 2 * DAY);
    await engine.syncNow();
    expect(engine.status().state).toBe('error'); // sound: refused by the server, and it shows

    deviceNow = T0; // the clock is fixed: the note's stamp is now 2 days ahead, so the adapter holds it back
    await engine.syncNow();
    expect(itemOnServer('note:43:3:16')).toBeUndefined(); // sound: held back, not sent to be refused
    expect(engine.status().state).toBe('idle');

    clocksAt(T0 + 3 * DAY); // real time has passed the note's clock: the rules accept it now
    await engine.syncNow();
    await engine.syncNow();
    // Expected: the note is in the account. Actual: undefined (the engine settled it as written two runs ago).
    expect(itemOnServer('note:43:3:16')?.value).toEqual({ text: 'written while the clock ran ahead' });
  });

  test.skip('S5-1 a note the server refused on its own in a retried batch is sent again later', async () => {
    const storage = createStorage(memoryBackend());
    const engine = engineFor(storage, items);
    fake.state.serverNow = T0;

    // Offline first, so the earlier note is stamped (by the device's correct clock) but not pushed.
    deviceNow = T0 - HOUR;
    setNote(storage, '1:1:1', 'earlier note', T0 - HOUR);
    const offline = jest.spyOn(jest.requireMock('firebase/firestore') as { getDocsFromServer: () => Promise<unknown> }, 'getDocsFromServer');
    offline.mockRejectedValueOnce(Object.assign(new Error('offline'), { name: 'FirebaseError', code: 'unavailable' }));
    await engine.syncNow();
    expect(engine.status().state).toBe('offline');

    // Then the clock jumps two days ahead (set by hand); the next note is stamped by it.
    deviceNow = T0 + 2 * DAY;
    setNote(storage, '43:3:16', 'fresh note', T0 + 2 * DAY);
    await engine.syncNow();
    expect(itemOnServer('note:1:1:1')).toBeDefined(); // sound: the batch was retried document by document
    expect(itemOnServer('note:43:3:16')).toBeUndefined(); // refused on its own (server time + 1 day)
    expect(engine.status().state).toBe('idle'); // ...and the run reports success

    clocksAt(T0 + 3 * DAY); // the clock is fixed and real time has passed the note's clock
    await engine.syncNow();
    await engine.syncNow();
    // Expected: the fresh note reaches the account. Actual: undefined, forever (until the note is edited again).
    expect(itemOnServer('note:43:3:16')?.value).toEqual({ text: 'fresh note' });
  });
});

// ---- S5-2: the per-document retry runs again on every engine retry ---------------------------------------------

describe('S5-2 (low): a push the server refuses for every document costs 1 + N write requests on every engine retry', () => {
  // writeAll: a refused batch of N >= 2 documents is retried with N parallel setDoc calls; when all N are refused it
  // throws, the engine fails the run and retries it (5 s, 30 s, 2 min, then every 5 min, plus the 5-minute interval),
  // and every retry repeats the whole fan-out. Before the fix one retry was one refused commit; now it is 1 + N (up to
  // 451), each a rules evaluation with the deletedUsers exists()/get() reads. Triggers: a device clock more than a day
  // ahead (every fresh edit is refused; this lasts until the clock is fixed), or the deletedUsers marker (an account
  // deleted on another device, until this device's ID token expires). Around 288 retries a day x 451 requests.
  test.skip('S5-2 three attempts at the same all-refused push of 50 notes make at most 3 + 50 write requests', async () => {
    deviceNow = T0 + 2 * DAY; // ahead of the server by two days: every note below is refused
    const list: RemoteItem[] = Array.from({ length: 50 }, (_, i) => ({
      id: `note:1:1:${i + 1}`,
      kind: 'note',
      ref: `1:1:${i + 1}`,
      deleted: false,
      value: { text: `n${i}` },
      updatedAt: deviceNow - 1000,
      deviceId: SELF,
    }));
    const r = remote();
    for (let attempt = 0; attempt < 3; attempt++) await expect(r.pushItems(list)).rejects.toMatchObject({ kind: 'denied' });
    // Expected: the per-document fan-out is not repeated for a push it already proved is refused as a whole (at most
    // 53 requests). Actual: 153 (each attempt: 1 batch + 50 single writes).
    expect(fake.state.requests.length).toBeLessThanOrEqual(3 + 50);
  });
});

// ---- S5-3: a held-back goal makes every run write the device document -------------------------------------------

describe('S5-3 (low): while a goal is held back, every sync run rewrites the device document', () => {
  // pushableDevice sends a goal stamped past now + 23 h as null, and pushDevice resolves; the engine then records the
  // goal as sent (recordPushedGoal: ownGoal = the held-back goal). On the next run writeProgress builds the document
  // with ownGoal, the account's copy has goal null, so sameDoc is false and the document is pushed again (and the goal
  // held back again): one device write per run, every 5 minutes (pullIntervalMs) and on every foreground, for as long
  // as the goal's clock is ahead of real time (for a date set years ahead, years). Without a held-back goal an
  // unchanged device document is not written at all (the control test below).
  const progress: SyncDomains = { progress: progressKey };
  const deviceWrites = () => fake.state.requests.filter((r) => r.kind === 'set' && r.paths[0]!.includes('/devices/')).length;

  test('sound: control: with nothing held back, runs with no change write no device document', async () => {
    const storage = createStorage(memoryBackend());
    const engine = engineFor(storage, progress);
    storage.set(progressKey, { ...storage.get(progressKey), goalMinutes: 20 });
    await engine.syncNow();
    const after = deviceWrites();
    for (let i = 0; i < 4; i++) {
      clocksAt(Date.now() + 5 * 60_000);
      await engine.syncNow();
    }
    expect(deviceWrites()).toBe(after);
  });

  test.skip('S5-3 runs with no change do not rewrite the device document while its goal is held back', async () => {
    const storage = createStorage(memoryBackend());
    const engine = engineFor(storage, progress);
    deviceNow = T0 + 30 * DAY; // the goal is changed while the clock runs a month ahead
    storage.set(progressKey, { ...storage.get(progressKey), goalMinutes: 20 });
    await engine.syncNow(); // refused (the device document's own updatedAt is ahead too)
    deviceNow = T0; // the clock is fixed
    await engine.syncNow();
    expect(fake.docs.get(`users/${UID}/devices/${SELF}`)?.goal).toBeNull(); // sound: the progress synced, goal held back
    const after = deviceWrites();
    for (let i = 0; i < 4; i++) {
      clocksAt(Date.now() + 5 * 60_000); // the 5-minute interval, nothing changed locally
      await engine.syncNow();
    }
    // Expected: no more device writes (nothing changed). Actual: one per run (4).
    expect(deviceWrites()).toBe(after);
  });
});

// Keep the warn spy referenced (the adapter warns once per push with counts only; checked in round 4's tests).
test('sound: the adapter warns with counts only (no note text) when it holds back', async () => {
  deviceNow = T0;
  await remote().pushItems([
    { id: 'note:1:1:1', kind: 'note', ref: '1:1:1', deleted: false, value: { text: 'secret text' }, updatedAt: T0 + 2 * DAY, deviceId: SELF },
  ]);
  const said = warn.mock.calls.map((c) => c.join(' ')).join('\n');
  expect(said).toMatch(/held back/);
  expect(said).not.toMatch(/secret text|1:1:1/);
});
