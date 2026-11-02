// Unit tests for the engine's edges (R-6b, implementer-owned): what the acceptance tests do not reach.
import { languageKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { clearSyncState, createSyncEngine, getDeviceId } from '../engine';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import { DEFAULT_DOMAINS } from '../registry';
import { syncStateKey } from '../state';
import { RemoteError, type RemoteItem } from '../types';
import { DOMAINS, iso, makeDevice, progressKey, setHighlight, setNote, studyKey } from './fixtures';

let remote: MemoryRemote;
beforeEach(() => {
  remote = createMemoryRemote();
});

const note = (ref: string, over: Partial<RemoteItem> = {}): RemoteItem => ({
  id: `note:${ref}`,
  kind: 'note',
  ref,
  deleted: false,
  value: { text: 'remote' },
  updatedAt: 1,
  deviceId: 'devZ',
  ...over,
});

describe('device id and state keys', () => {
  test('getDeviceId is url-safe, 20 characters and stable', () => {
    const storage = createStorage(memoryBackend());
    const id = getDeviceId(storage);
    expect(id).toMatch(/^[A-Za-z0-9_-]{20}$/);
    expect(getDeviceId(storage)).toBe(id);
    expect(getDeviceId(createStorage(memoryBackend()))).not.toBe(id);
  });

  test('an unsafe uid is refused', () => {
    expect(() => syncStateKey('a/b')).toThrow();
    expect(() => makeDevice(remote, 'devA', { uid: 'x'.repeat(129) })).toThrow();
    expect(() => clearSyncState(createStorage(memoryBackend()), '../evil')).not.toThrow();
  });

  test('clearSyncState makes the next sign-in a first sign-in', async () => {
    const a = makeDevice(remote, 'devA');
    setNote(a.storage, '1:1:1', 'kept', 900_000);
    await a.engine.syncNow();
    clearSyncState(a.storage, 'alice');
    expect(a.storage.get(syncStateKey('alice')).items.base).toEqual({});
    const fresh = createMemoryRemote(); // the account was wiped
    const again = makeDevice(fresh, 'devA', { storage: a.storage });
    await again.engine.syncNow();
    expect(fresh.items.get('note:1:1:1')?.value).toEqual({ text: 'kept' });
  });

  test('a corrupt state reads as a first sign-in and the run still succeeds', async () => {
    const a = makeDevice(remote, 'devA');
    setNote(a.storage, '1:1:1', 'x', 900_000);
    await a.engine.syncNow();
    const backend = memoryBackend();
    const storage = createStorage(backend);
    storage.set(studyKey, a.storage.get(studyKey));
    backend.set('sync.state.alice', '{"v":1,"data":{"items":42}}');
    const b = makeDevice(remote, 'devA', { storage });
    await b.engine.syncNow();
    expect(b.engine.status().state).toBe('idle');
    expect(storage.get(studyKey).notes['1:1:1']?.text).toBe('x');
  });
});

describe('items', () => {
  test('an unreadable newer remote value is never overwritten by an older local change, even later', async () => {
    const a = makeDevice(remote, 'devA', { start: 1_000_000 });
    setNote(a.storage, '2:2:2', 'local', 500_000); // time 500k
    remote.putItem(note('2:2:2', { value: { text: 'x'.repeat(6000) }, updatedAt: 600_000 }));
    await a.engine.syncNow();
    expect(a.storage.get(studyKey).notes['2:2:2']?.text).toBe('local');
    expect((remote.items.get('note:2:2:2')?.value as { text: string }).text).toHaveLength(6000);
    await a.engine.syncNow(); // the incremental pull no longer returns it
    expect((remote.items.get('note:2:2:2')?.value as { text: string }).text).toHaveLength(6000);
    // A newer local edit does win.
    a.engine.start();
    a.clock.now = 2_000_000;
    setNote(a.storage, '2:2:2', 'newer', 2_000_000);
    await a.engine.syncNow();
    expect(remote.items.get('note:2:2:2')?.value).toEqual({ text: 'newer' });
    await a.engine.stop();
  });

  test('a pulled item that changed locally during the run is pulled again, so a newer remote value still wins', async () => {
    const a = makeDevice(remote, 'devA', { start: 1_000_000 });
    a.engine.start();
    await a.engine.syncNow();
    remote.putItem(note('3:3:3', { value: { text: 'remote, newest' }, updatedAt: 5_000_000, deviceId: 'devB' }));
    const held = remote.hold('pullItems');
    const run = a.engine.syncNow();
    await held.started;
    setNote(a.storage, '3:3:3', 'during', 1_000_000);
    held.release();
    await run;
    expect(a.storage.get(studyKey).notes['3:3:3']?.text).toBe('during'); // rule 5
    await a.engine.syncNow();
    expect(a.storage.get(studyKey).notes['3:3:3']?.text).toBe('remote, newest');
    expect(remote.items.get('note:3:3:3')?.value).toEqual({ text: 'remote, newest' });
    await a.engine.stop();
  });

  test('a failed push keeps the change pending with its first-seen time', async () => {
    const a = makeDevice(remote, 'devA', { start: 1_000_000 });
    setHighlight(a.storage, '4:4:4', 'blue', 3_000_000);
    remote.failNext(new RemoteError('other'), 'pushItems');
    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('error');
    expect(remote.items.size).toBe(0);
    a.clock.now = 2_000_000;
    await a.engine.syncNow();
    expect(remote.items.get('highlight:4:4:4')).toMatchObject({ value: { colour: 'blue' }, updatedAt: 1_000_000 });
  });

  test('applying remote values creates no stamps and schedules no extra sync', async () => {
    jest.useFakeTimers();
    try {
      const a = makeDevice(remote, 'devA');
      a.engine.start();
      await jest.advanceTimersByTimeAsync(1);
      remote.putItem(note('5:5:5'));
      remote.calls.length = 0;
      await a.engine.syncNow();
      expect(a.storage.get(studyKey).notes['5:5:5']?.text).toBe('remote');
      expect(a.storage.get(syncStateKey('alice')).items.stamps).toEqual({});
      remote.calls.length = 0;
      await jest.advanceTimersByTimeAsync(120_000);
      expect(remote.calls).toEqual([]);
      await a.engine.stop();
    } finally {
      jest.useRealTimers();
    }
  });

  test('a structurally broken remote item is skipped; the rest apply', async () => {
    const a = makeDevice(remote, 'devA');
    remote.putItem({ ...note('6:6:6'), id: 'note:6:6:7' });
    remote.putItem({ ...note('6:6:8'), kind: 'nope' as never, id: 'nope:6:6:8' });
    remote.putItem(note('6:6:9', { value: { text: 'ok' }, updatedAt: 42 }));
    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('idle');
    const local = a.storage.get(studyKey);
    expect(Object.keys(local.notes)).toEqual(['6:6:9']);
    expect(local.notes['6:6:9']).toEqual({ text: 'ok', updatedAt: iso(42) });
  });
});

describe('progress', () => {
  test('minutes read during a run are kept and counted as this device’s own', async () => {
    const a = makeDevice(remote, 'devA');
    remote.putDevice({ deviceId: 'devB', activeMs: { '2026-11-02': 100_000 }, chaptersRead: {}, goalMetDays: [], goal: null, updatedAt: 1 });
    a.storage.set(progressKey, { ...progressKey.fallback, activeMs: { '2026-11-02': 50_000 } });
    const held = remote.hold('pullItems');
    const run = a.engine.syncNow();
    await held.started;
    const p = a.storage.get(progressKey);
    a.storage.set(progressKey, { ...p, activeMs: { '2026-11-02': 70_000 } });
    held.release();
    await run;
    expect(a.storage.get(progressKey).activeMs['2026-11-02']).toBe(170_000);
    expect(remote.devices.get('devA')?.activeMs['2026-11-02']).toBe(70_000);
    await a.engine.syncNow();
    expect(a.storage.get(progressKey).activeMs['2026-11-02']).toBe(170_000);
  });

  test('a device document with bad entries contributes only its good ones', async () => {
    const a = makeDevice(remote, 'devA');
    remote.putDevice({
      deviceId: 'devB',
      activeMs: { '2026-11-02': 1000, 'not a day': 5, '2026-11-03': -4 },
      chaptersRead: { '43:3': iso(1), '99:1': iso(1) },
      goalMetDays: ['2026-11-02', 'nope'],
      goal: { minutes: 7, updatedAt: 9 },
      updatedAt: 1,
    });
    await a.engine.syncNow();
    const p = a.storage.get(progressKey);
    expect(p.activeMs).toEqual({ '2026-11-02': 1000 });
    expect(p.chaptersRead).toEqual({ '43:3': iso(1) });
    expect(p.goalMetDays).toEqual(['2026-11-02']);
    expect(p.goalMinutes).toBe(10); // 7 is not a valid goal: ignored, the device value is uploaded
    expect(remote.devices.get('devA')?.goal?.minutes).toBe(10);
  });
});

describe('lifecycle', () => {
  test('retries with backoff after a failure while started', async () => {
    jest.useFakeTimers();
    try {
      const a = makeDevice(remote, 'devA');
      remote.failNext(new RemoteError('offline'), undefined, 2);
      a.engine.start();
      await jest.advanceTimersByTimeAsync(1);
      expect(a.engine.status().state).toBe('offline');
      await jest.advanceTimersByTimeAsync(5_000);
      expect(a.engine.status().state).toBe('offline');
      await jest.advanceTimersByTimeAsync(29_000);
      expect(a.engine.status().state).toBe('offline');
      await jest.advanceTimersByTimeAsync(1_000);
      expect(a.engine.status().state).toBe('idle');
      await a.engine.stop();
    } finally {
      jest.useRealTimers();
    }
  });

  test('a re-sync with nothing changed only pulls', async () => {
    const a = makeDevice(remote, 'devA');
    setNote(a.storage, '7:7:7', 'n', 900_000);
    a.storage.set(progressKey, { ...progressKey.fallback, activeMs: { '2026-11-02': 5000 }, goalMetDays: ['2026-11-02'] });
    await a.engine.syncNow();
    a.tick(60_000);
    remote.calls.length = 0;
    await a.engine.syncNow();
    expect([...new Set(remote.calls)].sort()).toEqual(['pullDevices', 'pullItems', 'pullSettings']);
  });

  test('stop aborts the run in flight at its next checkpoint: no push after the held pull', async () => {
    const a = makeDevice(remote, 'devA');
    setNote(a.storage, '8:8:8', 'pending', 900_000);
    const held = remote.hold('pullItems');
    const run = a.engine.syncNow();
    await held.started;
    const stopped = a.engine.stop();
    held.release();
    await stopped;
    await run;
    expect(remote.calls).toEqual(['pullSettings', 'pullDevices', 'pullItems']);
    expect(a.storage.get(syncStateKey('alice')).items.base).toEqual({});
  });

  test('stop before start is fine; after stop syncNow does nothing; start again resumes', async () => {
    const a = makeDevice(remote, 'devA');
    await a.engine.stop();
    await a.engine.stop();
    await a.engine.syncNow();
    expect(remote.calls).toEqual([]);
    a.engine.start();
    a.engine.start();
    await a.engine.syncNow();
    expect(remote.calls).toContain('pullItems');
    await a.engine.stop();
  });

  test('with only the registry domains, settings sync and nothing else is touched', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(languageKey, 'zh-Hans');
    const engine = createSyncEngine({ uid: 'u1', storage, remote, domains: DEFAULT_DOMAINS, deviceId: 'devA', now: () => 5 });
    await engine.syncNow();
    expect(engine.status()).toEqual({ state: 'idle', lastSyncedAt: 5 });
    expect(remote.settings.get('language')?.json).toBe('"zh-Hans"');
    expect([...new Set(remote.calls)].sort()).toEqual(['pullSettings', 'pushSettings']);
  });

  test('an engine with no domains still runs', async () => {
    const engine = createSyncEngine({ uid: 'u1', storage: createStorage(memoryBackend()), remote, domains: {}, deviceId: 'devA' });
    await engine.syncNow();
    expect(engine.status().state).toBe('idle');
    expect(remote.calls).toEqual([]);
    expect(DOMAINS.settings).toHaveLength(2);
  });
});
