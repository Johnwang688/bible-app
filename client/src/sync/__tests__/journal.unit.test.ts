// The write journal (R6b-fu-journal, implementer-owned): a crash after EVERY single storage write of a
// run, for each domain and all together, must leave a device that converges with the account and an
// observer device exactly as if the run had either finished or never happened (journal.ts). Every
// scenario runs with the engine idle and started (watchers subscribed): a started engine's watchers see
// each of its own writes while the others have not landed yet (R6b-fu-journal-fix1).
import { z } from 'zod';

import type { VerseProgress } from '../../memory/types';
import { appearanceKey, languageKey } from '../../storage/keys';
import { memoryHistoryKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, type KeyValueBackend, type Storage, type StorageKey } from '../../storage/storage';
import { createSyncEngine } from '../engine';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import type { SyncDomains } from '../shapes';
import { syncStateKey } from '../state';
import { RemoteError, type RemoteStore } from '../types';
import { iso, makeDevice, progressKey, setNote, studyKey } from './fixtures';

const DAY = '2026-11-02';
const UNKNOWN = '1970-01-01T00:00:00.000Z';
const stateKey = syncStateKey('alice');
/** A third synced setting (types.ts SettingKey), so that one run takes two settings and pushes a third. */
const customKey: StorageKey<string> = { key: 'appearance.custom', version: 1, schema: z.string().min(1), fallback: 'plain' };

/** A backend whose writes can be counted and whose bytes can be copied at any moment. */
function mapBackend(init?: Map<string, string>) {
  const map = new Map(init);
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
    copy: () => new Map(map),
    arm(hook: (n: number) => void) {
      writes = 0;
      onWrite = hook;
    },
    disarm() {
      onWrite = null;
    },
  };
}

/** The remote as the crashed process sees it: once `dead`, every call fails (the process is gone). */
function mortal(remote: RemoteStore, isDead: () => boolean): RemoteStore {
  const guard =
    <A extends unknown[], R>(f: (...a: A) => Promise<R>) =>
    async (...a: A): Promise<R> => {
      if (isDead()) throw new RemoteError('offline');
      const r = await f(...a);
      if (isDead()) throw new RemoteError('offline');
      return r;
    };
  return {
    pullItems: guard(remote.pullItems.bind(remote)),
    pushItems: guard(remote.pushItems.bind(remote)),
    pullDevices: guard(remote.pullDevices.bind(remote)),
    pushDevice: guard(remote.pushDevice.bind(remote)),
    pullSettings: guard(remote.pullSettings.bind(remote)),
    pushSettings: guard(remote.pushSettings.bind(remote)),
    pullMemory: remote.pullMemory && guard(remote.pullMemory.bind(remote)),
    pushMemory: remote.pushMemory && guard(remote.pushMemory.bind(remote)),
  };
}

type Part = 'items' | 'settings' | 'progress' | 'memory';
const PARTS: Record<string, Part[]> = {
  all: ['items', 'settings', 'progress', 'memory'],
  items: ['items'],
  settings: ['settings'],
  progress: ['progress'],
  memory: ['memory'],
};

/** A Memory row reviewed at `t` (ms). */
const memRow = (t: number, over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'fill_blank',
  successes: 1,
  failures: 0,
  masteryScore: 20,
  nextDueAt: iso(t + 86_400_000),
  lastReviewedAt: iso(t),
  lapsedAt: null,
  ...over,
});

function domainsOf(parts: Part[]): SyncDomains {
  return {
    studyItems: parts.includes('items') ? studyKey : undefined,
    progress: parts.includes('progress') ? progressKey : undefined,
    // The run under test takes B's custom setting and language in one commit (custom written first) and
    // C changes both later, so a local change invented for either shows.
    settings: parts.includes('settings') ? [appearanceKey as StorageKey<unknown>, customKey as StorageKey<unknown>, languageKey as StorageKey<unknown>] : undefined,
    // Memory is not journaled (engine.ts "Memory"): its join must make every crash point safe on its own.
    memory: parts.includes('memory') ? { progress: memoryProgressKey, history: memoryHistoryKey } : undefined,
  };
}

const note = (ref: string, text: string, t: number, deviceId: string) => ({
  id: `note:${ref}`, kind: 'note' as const, ref, deleted: false, value: { text }, updatedAt: t, deviceId,
});

/**
 * Device A syncs, then the account changes on device B (at 2,000,000) while A changes locally. A's
 * next run is the run under test; `crashAt` (1-based write number, or null for no crash) copies A's
 * storage after that write (0: before its first). With `started`, A's engine is started (watching)
 * before its local changes. Returns the copy, the number of writes the run made and the remote.
 */
async function runUnderTest(parts: Part[], crashAt: number | null, remoteDies: boolean, started: boolean) {
  const remote = createMemoryRemote();
  const disk = mapBackend();
  const storage = createStorage(disk.backend);
  const domains = domainsOf(parts);
  const clock = { now: 1_000_000 };
  let dead = false;
  const engine = createSyncEngine({
    uid: 'alice', storage, remote: mortal(remote, () => dead), domains, deviceId: 'devA', now: () => clock.now, debounceMs: 60_000,
  });

  // Synced start.
  if (parts.includes('items')) {
    setNote(storage, '1:1:1', 'keep', 900_000);
    setNote(storage, '2:2:2', 'old', 900_000);
    setNote(storage, '3:3:3', 'doomed', 900_000);
    const v = storage.get(studyKey);
    v.highlights['6:6:6'] = { colour: 'yellow', updatedAt: UNKNOWN }; // no own time: its change time is first-seen
    storage.set(studyKey, v);
  }
  if (parts.includes('settings')) {
    storage.set(languageKey, 'en');
    storage.set(customKey, 'a0');
  }
  if (parts.includes('progress')) storage.set(progressKey, { ...progressKey.fallback, activeMs: { [DAY]: 50_000 } });
  if (parts.includes('memory')) {
    storage.set(memoryProgressKey, { 'john-3-16': memRow(900_000) });
    storage.set(memoryHistoryKey, { startedOn: '2026-11-01', completedDates: ['2026-11-01'] });
  }
  await engine.syncNow();
  expect(engine.status().state).toBe('idle');
  if (started) {
    engine.start(); // its first run is a timer (fake: never fires); the run under test is syncNow
    clock.now = 1_500_000; // the watchers stamp A's local changes below now
  }

  // The account changes on B.
  remote.putItem(note('2:2:2', 'from B', 2_000_000, 'devB'));
  remote.putItem({ id: 'note:3:3:3', kind: 'note', ref: '3:3:3', deleted: true, value: null, updatedAt: 2_000_000, deviceId: 'devB' });
  remote.putItem({ id: 'highlight:6:6:6', kind: 'highlight', ref: '6:6:6', deleted: false, value: { colour: 'pink' }, updatedAt: 2_000_000, deviceId: 'devB' });
  remote.putSetting({ key: 'language', json: '"zh-Hans"', updatedAt: 2_000_000, deviceId: 'devB' });
  remote.putSetting({ key: 'appearance.custom', json: '"from B"', updatedAt: 2_000_000, deviceId: 'devB' });
  remote.putDevice({ deviceId: 'devB', activeMs: { [DAY]: 100_000 }, chaptersRead: { '1:1': iso(2_000_000) }, goalMetDays: [], goal: { minutes: 20, updatedAt: 2_000_000 }, updatedAt: 2_000_000 });
  remote.putMemory({
    deviceId: 'devB',
    progress: { 'john-3-16': memRow(2_000_000, { stage: 'review', masteryScore: 60 }), 'romans-12-1': memRow(2_000_000) },
    history: { startedOn: '2026-10-30', completedDates: ['2026-10-30'] },
    updatedAt: 2_000_000,
  });

  // A changes locally.
  if (parts.includes('items')) {
    setNote(storage, '1:1:1', 'keep edited', 1_500_000);
    setNote(storage, '4:4:4', 'new A', 1_500_000);
  }
  if (parts.includes('settings')) storage.set(appearanceKey, { preset: null, mode: 'dark' });
  if (parts.includes('progress')) storage.set(progressKey, { ...storage.get(progressKey), activeMs: { [DAY]: 55_000 }, chaptersRead: { '2:1': iso(1_500_000) } });
  if (parts.includes('memory')) {
    storage.set(memoryProgressKey, { ...storage.get(memoryProgressKey), 'psalm-23-1': memRow(1_500_000) });
    storage.set(memoryHistoryKey, { startedOn: '2026-11-01', completedDates: ['2026-11-01', '2026-11-02'] });
  }

  // The run under test. Crash point 0 is before its first write.
  let crashed: Map<string, string> | null = null;
  let writes = 0;
  const crash = () => {
    crashed = disk.copy();
    if (remoteDies) dead = true;
  };
  if (crashAt === 0) crash();
  disk.arm((n) => {
    writes = n;
    if (n === crashAt) crash();
  });
  clock.now = 3_000_000;
  await engine.syncNow();
  disk.disarm();
  await engine.stop();
  return { remote, crashed: crashed as Map<string, string> | null, writes };
}

type Edit = 'none' | 'trap';

/** Restarts device A from the crashed bytes (after optional local edits; started, with `started`) and checks convergence. */
async function restartAndCheck(parts: Part[], remote: MemoryRemote, bytes: Map<string, string>, edit: Edit, startTwice: boolean, started: boolean) {
  const disk = mapBackend(bytes);
  const storage: Storage = createStorage(disk.backend);
  const domains = domainsOf(parts);
  const make = (start: number) => makeDevice(remote, 'devA', { domains, storage, start });

  if (startTwice) make(3_500_000); // an earlier start that recovered the journal and then stopped
  // Local-first: the app writes before sync starts again.
  if (edit === 'trap') {
    if (parts.includes('progress')) {
      // Exactly what the interrupted run would have added: a value comparison would be fooled.
      const p = storage.get(progressKey);
      storage.set(progressKey, { ...p, activeMs: { [DAY]: (p.activeMs[DAY] ?? 0) + 100_000 } });
    }
    if (parts.includes('items')) setNote(storage, '5:5:5', 'after crash', 3_600_000);
    if (parts.includes('memory')) storage.set(memoryProgressKey, { ...storage.get(memoryProgressKey), 'matthew-6-33': memRow(3_600_000) });
  }

  // Meanwhile device C changes what B changed, later than B (2,500,000) but before A restarts.
  remote.putItem(note('2:2:2', 'from C', 2_500_000, 'devC'));
  remote.putItem(note('3:3:3', 'from C', 2_500_000, 'devC'));
  remote.putItem({ id: 'highlight:6:6:6', kind: 'highlight', ref: '6:6:6', deleted: false, value: { colour: 'green' }, updatedAt: 2_500_000, deviceId: 'devC' });
  remote.putSetting({ key: 'language', json: '"system"', updatedAt: 2_500_000, deviceId: 'devC' });
  remote.putSetting({ key: 'appearance.custom', json: '"from C"', updatedAt: 2_500_000, deviceId: 'devC' });
  remote.putDevice({ deviceId: 'devC', activeMs: { [DAY]: 7_000 }, chaptersRead: {}, goalMetDays: [], goal: { minutes: 30, updatedAt: 2_500_000 }, updatedAt: 2_500_000 });
  remote.putMemory({
    deviceId: 'devC',
    progress: { 'romans-12-1': memRow(2_500_000, { stage: 'full_recall', successes: 2 }) },
    history: { startedOn: null, completedDates: ['2026-11-03'] },
    updatedAt: 2_500_000,
  });

  const a = make(4_000_000);
  if (started) a.engine.start();
  const d = makeDevice(remote, 'devD', { domains, start: 5_000_000 });
  for (const dev of [a, a, d, a, d]) {
    await dev.engine.syncNow();
    expect(dev.engine.status().state).toBe('idle');
  }
  await a.engine.stop();

  const state = storage.get(stateKey);
  expect(state.journal ?? null).toBeNull();
  expect(state.progress.pending).toBeNull();
  // Converged: no local change is left pending (an invented one would go out as newer than it is).
  expect({ items: state.items.stamps, settings: state.settings.stamps, goal: state.progress.goalStamp }).toEqual({ items: {}, settings: {}, goal: null });

  if (parts.includes('items')) {
    const want: Record<string, string> = { '1:1:1': 'keep edited', '2:2:2': 'from C', '3:3:3': 'from C', '4:4:4': 'new A' };
    if (edit === 'trap') want['5:5:5'] = 'after crash';
    const texts = (s: Storage) => Object.fromEntries(Object.entries(s.get(studyKey).notes).map(([r, n]) => [r, n.text]));
    expect(texts(storage)).toEqual(want);
    expect(texts(d.storage)).toEqual(want);
    expect(storage.get(studyKey).highlights['6:6:6']?.colour).toBe('green');
    expect(d.storage.get(studyKey).highlights['6:6:6']?.colour).toBe('green');
    expect(remote.items.get('note:3:3:3')?.value).toEqual({ text: 'from C' });
  }
  if (parts.includes('settings')) {
    expect([storage.get(languageKey), d.storage.get(languageKey), remote.settings.get('language')?.json]).toEqual(['system', 'system', '"system"']);
    expect([storage.get(appearanceKey).mode, d.storage.get(appearanceKey).mode]).toEqual(['dark', 'dark']);
    expect([storage.get(customKey), d.storage.get(customKey), remote.settings.get('appearance.custom')?.json]).toEqual(['from C', 'from C', '"from C"']);
  }
  if (parts.includes('progress')) {
    const own = 55_000 + (edit === 'trap' ? 100_000 : 0);
    const others = 100_000 + 7_000;
    expect({
      own: remote.devices.get('devA')?.activeMs[DAY],
      a: storage.get(progressKey).activeMs[DAY],
      d: d.storage.get(progressKey).activeMs[DAY],
      goalA: storage.get(progressKey).goalMinutes,
      goalD: d.storage.get(progressKey).goalMinutes,
      chapters: Object.keys(storage.get(progressKey).chaptersRead).sort(),
    }).toEqual({ own, a: own + others, d: own + others, goalA: 30, goalD: 30, chapters: ['1:1', '2:1'] });
  }
  if (parts.includes('memory')) {
    // Nothing lost, nothing older winning: per verse the newest review, every day, the earliest start.
    const progress: Record<string, VerseProgress> = {
      'john-3-16': memRow(2_000_000, { stage: 'review', masteryScore: 60 }),
      'psalm-23-1': memRow(1_500_000),
      'romans-12-1': memRow(2_500_000, { stage: 'full_recall', successes: 2 }),
    };
    if (edit === 'trap') progress['matthew-6-33'] = memRow(3_600_000);
    const history = { startedOn: '2026-10-30', completedDates: ['2026-10-30', '2026-11-01', '2026-11-02', '2026-11-03'] };
    expect({ progress: storage.get(memoryProgressKey), history: storage.get(memoryHistoryKey) }).toEqual({ progress, history });
    expect({ progress: d.storage.get(memoryProgressKey), history: d.storage.get(memoryHistoryKey) }).toEqual({ progress, history });
    expect(remote.memory.get('devA')).toMatchObject({ progress, history });
  }
}

describe('a crash after every single storage write of a run converges', () => {
  beforeEach(() => jest.useFakeTimers());
  afterEach(() => {
    jest.clearAllTimers();
    jest.useRealTimers();
  });

  for (const [name, parts] of Object.entries(PARTS)) {
    for (const started of [false, true]) {
      test(`${name}, engine ${started ? 'started' : 'idle'}: every crash point, remote finishing or dying, with and without local edits before restart`, async () => {
        const { writes: total, crashed: none } = await runUnderTest(parts, null, false, started);
        expect(none).toBeNull();
        // At least: the journal, each local key the run takes a value into, the final state, a base update after a push.
        expect(total).toBeGreaterThanOrEqual(parts.length >= 3 ? 8 : parts.includes('settings') ? 5 : 4);
        let checked = 0;
        for (let n = 0; n <= total; n++) {
          for (const remoteDies of [false, true]) {
            for (const edit of ['none', 'trap'] as const) {
              for (const startTwice of [false, true]) {
                const { remote, crashed } = await runUnderTest(parts, n, remoteDies, started);
                try {
                  await restartAndCheck(parts, remote, crashed!, edit, startTwice, started);
                } catch (e) {
                  throw new Error(`crash after write ${n}/${total}, remote ${remoteDies ? 'dies' : 'finishes'}, edit ${edit}, startTwice ${startTwice}: ${(e as Error).message}`);
                }
                checked++;
              }
            }
          }
        }
        expect(checked).toBe((total + 1) * 8);
      });
    }
  }
});

/** Storage whose next tagged write of `key` throws (a full disk, say) once armed; everything else passes through. */
function failingStorage(inner: Storage, key: string) {
  let armed = false;
  const storage: Storage = {
    get: <T>(k: StorageKey<T>) => inner.get(k),
    set<T>(k: StorageKey<T>, value: T, opts?: { tag?: string }) {
      if (armed && k.key === key && opts?.tag !== undefined) {
        armed = false;
        throw new Error('disk full');
      }
      inner.set(k, value, opts);
    },
    remove: <T>(k: StorageKey<T>) => inner.remove(k),
    subscribe: <T>(k: StorageKey<T>, l: () => void) => inner.subscribe(k, l),
    tagOf: <T>(k: StorageKey<T>) => inner.tagOf(k),
  };
  return { storage, arm: () => void (armed = true) };
}

describe('a local write that throws in the middle of a run', () => {
  const ITEMS_AND_LANGUAGE: SyncDomains = { studyItems: studyKey, settings: [languageKey as StorageKey<unknown>] };

  async function failMidRun(start: boolean) {
    const remote = createMemoryRemote();
    const disk = mapBackend();
    const failing = failingStorage(createStorage(disk.backend), 'language');
    const a = makeDevice(remote, 'devA', { domains: ITEMS_AND_LANGUAGE, storage: failing.storage });
    if (start) a.engine.start();
    setNote(failing.storage, '3:3:3', 'doomed', 900_000);
    failing.storage.set(languageKey, 'en');
    await a.engine.syncNow();
    await a.engine.syncNow();
    remote.putItem({ id: 'note:3:3:3', kind: 'note', ref: '3:3:3', deleted: true, value: null, updatedAt: 2_000_000, deviceId: 'devB' });
    remote.putSetting({ key: 'language', json: '"zh-Hans"', updatedAt: 2_000_000, deviceId: 'devB' });
    failing.arm();
    a.clock.now = 3_000_000;
    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('error');
    // The study items write landed (the tombstone was taken), the language write did not.
    expect(failing.storage.get(studyKey).notes['3:3:3']).toBeUndefined();
    expect(failing.storage.get(languageKey)).toBe('en');
    return { remote, a, storage: failing.storage };
  }

  test('the next run settles it first: the taken tombstone is not sent back as a newer local change', async () => {
    const { remote, a, storage } = await failMidRun(false);
    remote.putItem(note('3:3:3', 'from C', 2_500_000, 'devC'));
    remote.putSetting({ key: 'language', json: '"system"', updatedAt: 2_500_000, deviceId: 'devC' });
    a.clock.now = 4_000_000;
    await a.engine.syncNow();
    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('idle');
    const d = makeDevice(remote, 'devD', { domains: ITEMS_AND_LANGUAGE, start: 5_000_000 });
    await d.engine.syncNow();
    expect({
      a: [storage.get(studyKey).notes['3:3:3']?.text, storage.get(languageKey)],
      d: [d.storage.get(studyKey).notes['3:3:3']?.text, d.storage.get(languageKey)],
      journal: storage.get(stateKey).journal,
    }).toEqual({ a: ['from C', 'system'], d: ['from C', 'system'], journal: null });
  });

  test('a local change right after it is stamped against the settled state', async () => {
    const { a, storage } = await failMidRun(true);
    a.clock.now = 3_100_000;
    setNote(storage, '5:5:5', 'later', 3_100_000); // the watcher stamps it now
    const state = storage.get(stateKey);
    expect(state.journal).toBeNull();
    expect(Object.keys(state.items.stamps)).toEqual(['note:5:5:5']);
    expect(state.items.base['note:3:3:3']).toMatchObject({ s: null, t: 2_000_000, d: 'devB' });
    expect(state.settings.base.language?.s).toBe('"en"');
    await a.engine.stop();
  });
});

describe('a started engine watching its own commit', () => {
  beforeEach(() => jest.useFakeTimers());
  afterEach(() => {
    jest.clearAllTimers();
    jest.useRealTimers();
  });

  test('an app write made in response to one of its writes, and an edit right after the commit, are stamped (rule 5)', async () => {
    const remote = createMemoryRemote();
    const a = makeDevice(remote, 'devA', { domains: domainsOf(['settings']) });
    a.storage.set(languageKey, 'en');
    await a.engine.syncNow();
    a.engine.start();
    remote.putSetting({ key: 'appearance.custom', json: '"from B"', updatedAt: 2_000_000, deviceId: 'devB' });
    remote.putSetting({ key: 'language', json: '"zh-Hans"', updatedAt: 2_000_000, deviceId: 'devB' });
    // An app listener reacts to the custom setting (written before the language) by changing the appearance.
    let reacted = false;
    const off = a.storage.subscribe(customKey, () => {
      if (reacted || a.storage.get(customKey) !== 'from B') return;
      reacted = true;
      expect(a.storage.get(languageKey)).toBe('en'); // mid-commit: the language has not landed yet
      a.storage.set(appearanceKey, { preset: null, mode: 'light' });
    });
    a.clock.now = 3_000_000;
    await a.engine.syncNow();
    off();
    expect(reacted).toBe(true);
    let state = a.storage.get(stateKey);
    expect(state.settings.stamps).toEqual({ appearance: { at: 3_000_000, s: '{"mode":"light","preset":null}' } });
    expect([state.settings.base['appearance.custom']?.s, state.settings.base.language?.s]).toEqual(['"from B"', '"zh-Hans"']);

    a.clock.now = 3_100_000;
    a.storage.set(languageKey, 'system'); // right after the commit: the watcher stamps it at once
    state = a.storage.get(stateKey);
    expect(state.settings.stamps.language).toEqual({ at: 3_100_000, s: '"system"' });

    await a.engine.syncNow();
    await a.engine.stop();
    expect({
      appearance: [remote.settings.get('appearance')?.json, remote.settings.get('appearance')?.updatedAt],
      language: [remote.settings.get('language')?.json, remote.settings.get('language')?.updatedAt],
      stamps: a.storage.get(stateKey).settings.stamps,
    }).toEqual({
      appearance: ['{"preset":null,"mode":"light"}', 3_000_000],
      language: ['"system"', 3_100_000],
      stamps: {},
    });
  });
});

describe('journal bookkeeping', () => {
  test('the local writes of one run carry one fresh tag; the next run uses another', async () => {
    const remote = createMemoryRemote();
    const a = makeDevice(remote, 'devA');
    await a.engine.syncNow();
    remote.putItem(note('2:2:2', 'from B', 2_000_000, 'devB'));
    remote.putSetting({ key: 'language', json: '"zh-Hans"', updatedAt: 2_000_000, deviceId: 'devB' });
    remote.putDevice({ deviceId: 'devB', activeMs: { [DAY]: 1_000 }, chaptersRead: {}, goalMetDays: [], goal: null, updatedAt: 2_000_000 });
    a.clock.now = 3_000_000;
    await a.engine.syncNow();
    const tag = a.storage.tagOf(studyKey);
    expect(tag).toMatch(/^[A-Za-z0-9_-]{16}$/);
    expect([a.storage.tagOf(languageKey), a.storage.tagOf(progressKey), a.storage.tagOf(appearanceKey)]).toEqual([tag, tag, undefined]);
    expect(a.storage.get(stateKey).journal).toBeNull();
    // The app's own edit keeps the tag; the engine's next write replaces it.
    setNote(a.storage, '9:9:9', 'mine', 3_000_000);
    expect(a.storage.tagOf(studyKey)).toBe(tag);
    remote.putItem(note('2:2:2', 'from B again', 3_500_000, 'devB'));
    await a.engine.syncNow();
    expect(a.storage.tagOf(studyKey)).not.toBe(tag);
    expect(a.storage.tagOf(languageKey)).toBe(tag);
  });

  test('a state saved before the journal existed reads as itself, and its progress marker is settled by values', () => {
    const disk = mapBackend();
    const storage = createStorage(disk.backend);
    storage.set(progressKey, { ...progressKey.fallback, activeMs: { [DAY]: 150_000 } });
    const old = {
      items: { cursor: 42, base: {}, stamps: {}, ignored: {} },
      settings: { base: { language: { s: '"en"', t: 1, d: 'devA' } }, stamps: {} },
      progress: { fold: {}, goal: null, ownGoal: null, goalStamp: null, sig: null, pending: { fold: { [DAY]: 100_000 }, expect: { [DAY]: 150_000 } } },
    };
    disk.backend.set(stateKey.key, JSON.stringify({ v: 1, data: old }));
    expect(storage.get(stateKey)).toEqual({ ...old, journal: null });
    makeDevice(createMemoryRemote(), 'devA', { domains: { progress: progressKey }, storage });
    const state = storage.get(stateKey);
    expect(state.items.cursor).toBe(42);
    expect(state.settings.base.language?.s).toBe('"en"');
    expect(state.progress).toMatchObject({ fold: { [DAY]: 100_000 }, pending: null });
    expect(state.journal).toBeNull();
  });
});
