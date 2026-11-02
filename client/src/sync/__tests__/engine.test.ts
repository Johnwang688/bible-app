// Acceptance tests for the sync engine and its conflict rules (R-6b, orchestrator-owned; the
// implementer may not edit them). The rules are written down in src/sync/CONFLICTS.md.
import { appearanceKey, languageKey } from '../../storage/keys';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import { RemoteError, type DeviceProgress, type RemoteItem } from '../types';
import { iso, makeDevice, progressKey, removeItem, setHighlight, setNote, studyKey } from './fixtures';

const DAY = '2026-11-02';
let remote: MemoryRemote;
beforeEach(() => {
  remote = createMemoryRemote();
});

const item = (over: Partial<RemoteItem> & Pick<RemoteItem, 'id'>): RemoteItem => {
  const [kind, ...rest] = over.id.split(':');
  return { kind: kind as RemoteItem['kind'], ref: rest.join(':'), deleted: false, value: null, updatedAt: 1, deviceId: 'devZ', ...over };
};

/** Resolves when the engine next reports idle after syncing. */
function nextIdle(engine: { subscribe(l: () => void): () => void; status(): { state: string } }): Promise<void> {
  let sawSyncing = false;
  return new Promise((resolve) => {
    const off = engine.subscribe(() => {
      const state = engine.status().state;
      if (state === 'syncing') sawSyncing = true;
      else if (sawSyncing) {
        off();
        resolve();
      }
    });
  });
}

async function synced(...devices: { engine: { syncNow(): Promise<void> } }[]) {
  for (const d of devices) await d.engine.syncNow();
}

describe('study items', () => {
  test('a local highlight is pushed with its own time, kind, ref and device', async () => {
    const a = makeDevice(remote, 'devA');
    setHighlight(a.storage, '43:3:16', 'blue', 900_000);
    await a.engine.syncNow();
    expect(remote.items.get('highlight:43:3:16')).toMatchObject({
      id: 'highlight:43:3:16',
      kind: 'highlight',
      ref: '43:3:16',
      deleted: false,
      value: { colour: 'blue' },
      updatedAt: 900_000,
      deviceId: 'devA',
    });
  });

  test('items, edits and deletions travel between devices', async () => {
    const a = makeDevice(remote, 'devA');
    const b = makeDevice(remote, 'devB');
    setNote(a.storage, '1:1:1', 'In the beginning', 900_000);
    a.storage.set(studyKey, { ...a.storage.get(studyKey), bookmarks: { '19:23:1': { createdAt: iso(900_500) } } });
    await synced(a, b);
    expect(b.storage.get(studyKey).notes['1:1:1']?.text).toBe('In the beginning');
    expect(b.storage.get(studyKey).bookmarks['19:23:1']).toEqual({ createdAt: iso(900_500) });

    b.engine.start();
    await b.engine.syncNow();
    b.tick(10_000);
    removeItem(b.storage, 'bookmarks', '19:23:1');
    await b.engine.syncNow();
    expect(remote.items.get('bookmark:19:23:1')).toMatchObject({ deleted: true, value: null, deviceId: 'devB' });
    await a.engine.syncNow();
    expect(a.storage.get(studyKey).bookmarks['19:23:1']).toBeUndefined();
    expect(a.storage.get(studyKey).notes['1:1:1']?.text).toBe('In the beginning');
    await b.engine.stop();
  });

  test.each([
    ['A first', 'a'],
    ['B first', 'b'],
  ])('the newer edit wins whichever device syncs first (%s)', async (_label, first) => {
    const a = makeDevice(remote, 'devA');
    const b = makeDevice(remote, 'devB');
    setNote(a.storage, '43:3:16', 'older', 100_000);
    setNote(b.storage, '43:3:16', 'newer', 200_000);
    const order = first === 'a' ? [a, b, a] : [b, a, b];
    await synced(...order);
    expect(a.storage.get(studyKey).notes['43:3:16']?.text).toBe('newer');
    expect(b.storage.get(studyKey).notes['43:3:16']?.text).toBe('newer');
    expect(remote.items.get('note:43:3:16')?.value).toEqual({ text: 'newer' });
  });

  test('equal times: the larger deviceId wins on every device', async () => {
    const a = makeDevice(remote, 'devA');
    const b = makeDevice(remote, 'devB');
    setHighlight(a.storage, '43:3:16', 'yellow', 100_000);
    setHighlight(b.storage, '43:3:16', 'green', 100_000);
    await synced(b, a, b);
    expect(a.storage.get(studyKey).highlights['43:3:16']?.colour).toBe('green');
    expect(b.storage.get(studyKey).highlights['43:3:16']?.colour).toBe('green');
  });

  test('a newer edit beats an older delete, and a newer delete beats an older edit', async () => {
    const a = makeDevice(remote, 'devA', { start: 1_000_000 });
    const b = makeDevice(remote, 'devB', { start: 1_000_000 });
    setNote(a.storage, '2:1:1', 'first', 900_000);
    await synced(a, b);
    a.engine.start();
    b.engine.start();
    await synced(a, b);

    // A deletes at 1.1M (seen time); B edits at 1.2M: the edit wins.
    a.clock.now = 1_100_000;
    removeItem(a.storage, 'notes', '2:1:1');
    b.clock.now = 1_200_000;
    setNote(b.storage, '2:1:1', 'edited', 1_200_000);
    await synced(a, b, a);
    expect(a.storage.get(studyKey).notes['2:1:1']?.text).toBe('edited');
    expect(b.storage.get(studyKey).notes['2:1:1']?.text).toBe('edited');

    // B edits at 1.3M; A deletes at 1.4M: the delete wins.
    b.clock.now = 1_300_000;
    setNote(b.storage, '2:1:1', 'again', 1_300_000);
    a.clock.now = 1_400_000;
    removeItem(a.storage, 'notes', '2:1:1');
    await synced(b, a, b);
    expect(a.storage.get(studyKey).notes['2:1:1']).toBeUndefined();
    expect(b.storage.get(studyKey).notes['2:1:1']).toBeUndefined();
    await a.engine.stop();
    await b.engine.stop();
  });

  test('an item time in the future is capped at the moment the change was first seen', async () => {
    const a = makeDevice(remote, 'devA', { start: 5_000_000 });
    setNote(a.storage, '3:1:1', 'from a fast clock', Date.UTC(2100, 0, 1));
    await a.engine.syncNow();
    expect(remote.items.get('note:3:1:1')?.updatedAt).toBe(5_000_000);
  });

  test('a change keeps the time it was first seen across failed syncs', async () => {
    const a = makeDevice(remote, 'devA', { start: 1_000_000 });
    const b = makeDevice(remote, 'devB', { start: 1_000_000 });
    setHighlight(a.storage, '5:5:5', 'yellow', 900_000);
    await synced(a, b);
    a.engine.start();
    await a.engine.syncNow();

    a.clock.now = 2_000_000;
    removeItem(a.storage, 'highlights', '5:5:5'); // seen at 2.0M
    remote.failNext(new RemoteError('offline'));
    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('offline');

    b.clock.now = 3_000_000;
    setHighlight(b.storage, '5:5:5', 'pink', 3_000_000); // B recolours at 3.0M
    await synced(b);
    a.clock.now = 5_000_000; // A comes back online much later
    await synced(a, b);
    expect(a.storage.get(studyKey).highlights['5:5:5']?.colour).toBe('pink');
    expect(b.storage.get(studyKey).highlights['5:5:5']?.colour).toBe('pink');
    await a.engine.stop();
  });

  test('a local change made while a sync is in flight is kept and pushed next time', async () => {
    const a = makeDevice(remote, 'devA');
    setNote(a.storage, '7:7:7', 'before', 900_000);
    await a.engine.syncNow();
    a.engine.start();
    await a.engine.syncNow();
    remote.putItem(item({ id: 'highlight:8:8:8', value: { colour: 'orange' }, updatedAt: 950_000, deviceId: 'devB' }));

    const held = remote.hold('pullItems');
    const run = a.engine.syncNow();
    await held.started;
    a.tick(1000);
    setNote(a.storage, '7:7:7', 'during', a.clock.now);
    setHighlight(a.storage, '9:9:9', 'purple', a.clock.now);
    held.release();
    await run;

    const local = a.storage.get(studyKey);
    expect(local.notes['7:7:7']?.text).toBe('during');
    expect(local.highlights['9:9:9']?.colour).toBe('purple');
    expect(local.highlights['8:8:8']?.colour).toBe('orange');
    await a.engine.syncNow();
    expect(remote.items.get('note:7:7:7')?.value).toEqual({ text: 'during' });
    expect(remote.items.get('highlight:9:9:9')?.value).toEqual({ colour: 'purple' });
    await a.engine.stop();
  });

  test('remote values the device cannot store are ignored; the rest apply', async () => {
    const a = makeDevice(remote, 'devA');
    remote.putItem(item({ id: 'note:1:2:3', value: { text: 'x'.repeat(6000) }, updatedAt: 5 }));
    remote.putItem(item({ id: 'highlight:1:2:4', value: { colour: 'red' as never }, updatedAt: 5 }));
    remote.putItem(item({ id: 'note:1:2:5', value: { text: 'fine' }, updatedAt: 5 }));
    await a.engine.syncNow();
    const local = a.storage.get(studyKey);
    expect(local.notes['1:2:3']).toBeUndefined();
    expect(local.highlights['1:2:4']).toBeUndefined();
    expect(local.notes['1:2:5']?.text).toBe('fine');
    expect(a.engine.status().state).toBe('idle');
  });

  test('on first sign-in, an account tombstone removes a local item only if it is newer', async () => {
    const a = makeDevice(remote, 'devA', { start: 1_000_000 });
    setNote(a.storage, '4:1:1', 'kept', 500_000);
    setNote(a.storage, '4:1:2', 'removed', 500_000);
    remote.putItem(item({ id: 'note:4:1:1', deleted: true, value: null, updatedAt: 400_000 }));
    remote.putItem(item({ id: 'note:4:1:2', deleted: true, value: null, updatedAt: 600_000 }));
    await a.engine.syncNow();
    const local = a.storage.get(studyKey);
    expect(local.notes['4:1:1']?.text).toBe('kept');
    expect(local.notes['4:1:2']).toBeUndefined();
    expect(remote.items.get('note:4:1:1')).toMatchObject({ deleted: false, value: { text: 'kept' } });
  });

  test('signing in again as the same account resumes without rewriting anything', async () => {
    const a = makeDevice(remote, 'devA');
    setNote(a.storage, '6:1:1', 'once', 900_000);
    await a.engine.syncNow();
    const before = JSON.stringify([...remote.items.entries()]);
    await a.engine.stop();
    a.restart();
    remote.calls.length = 0;
    await a.engine.syncNow();
    expect(JSON.stringify([...remote.items.entries()])).toBe(before);
    expect(remote.calls).not.toContain('pushItems');
  });

  test('another account starts fresh; deletions made while signed out reach the first account later', async () => {
    const a = makeDevice(remote, 'devA', { start: 1_000_000 });
    setNote(a.storage, '10:1:1', 'x', 900_000);
    setNote(a.storage, '10:1:2', 'y', 900_000);
    await a.engine.syncNow();
    await a.engine.stop();

    a.tick(1000);
    removeItem(a.storage, 'notes', '10:1:1'); // signed out

    const bobRemote = createMemoryRemote();
    const bob = makeDevice(bobRemote, 'devA', { uid: 'bob', storage: a.storage, start: a.clock.now });
    await bob.engine.syncNow();
    expect(bobRemote.items.get('note:10:1:2')?.value).toEqual({ text: 'y' });
    expect(bobRemote.items.get('note:10:1:1')?.deleted ?? true).toBe(true);
    expect(a.storage.get(studyKey).notes['10:1:2']?.text).toBe('y');
    await bob.engine.stop();

    a.restart('alice');
    await a.engine.syncNow();
    expect(remote.items.get('note:10:1:1')).toMatchObject({ deleted: true, value: null });
    expect(remote.items.get('note:10:1:2')?.value).toEqual({ text: 'y' });
  });
});

describe('status, scheduling and stop', () => {
  test('offline and denied map to statuses; success records lastSyncedAt', async () => {
    const a = makeDevice(remote, 'devA', { start: 7_000_000 });
    expect(a.engine.status()).toEqual({ state: 'idle', lastSyncedAt: null });
    remote.failNext(new RemoteError('offline'));
    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('offline');
    remote.failNext(new RemoteError('denied'));
    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('error');
    await a.engine.syncNow();
    expect(a.engine.status()).toEqual({ state: 'idle', lastSyncedAt: 7_000_000 });
  });

  test('status listeners hear syncing then idle', async () => {
    const a = makeDevice(remote, 'devA');
    const seen: string[] = [];
    const off = a.engine.subscribe(() => seen.push(a.engine.status().state));
    await a.engine.syncNow();
    off();
    expect(seen[0]).toBe('syncing');
    expect(seen[seen.length - 1]).toBe('idle');
  });

  test('concurrent syncNow calls coalesce and all resolve', async () => {
    const a = makeDevice(remote, 'devA');
    await Promise.all([a.engine.syncNow(), a.engine.syncNow(), a.engine.syncNow()]);
    expect(remote.calls.filter((c) => c === 'pullItems').length).toBeLessThanOrEqual(2);
  });

  test('a local change schedules a push after the debounce, and nothing runs after stop', async () => {
    jest.useFakeTimers();
    try {
      const a = makeDevice(remote, 'devA');
      a.engine.start();
      await jest.advanceTimersByTimeAsync(1);
      await a.engine.syncNow();
      remote.calls.length = 0;
      setHighlight(a.storage, '11:1:1', 'blue', a.clock.now);
      await jest.advanceTimersByTimeAsync(59_000);
      expect(remote.calls).not.toContain('pushItems');
      const idle = nextIdle(a.engine);
      await jest.advanceTimersByTimeAsync(2000);
      await idle;
      expect(remote.items.get('highlight:11:1:1')).toBeDefined();

      await a.engine.stop();
      remote.calls.length = 0;
      setHighlight(a.storage, '11:1:2', 'blue', a.clock.now);
      await jest.advanceTimersByTimeAsync(10 * 60_000);
      expect(remote.calls).toEqual([]);
    } finally {
      jest.useRealTimers();
    }
  });

  test('stop waits for a run in flight; that run writes nothing after stop resolves', async () => {
    const a = makeDevice(remote, 'devA');
    a.engine.start();
    await a.engine.syncNow();
    setNote(a.storage, '12:1:1', 'late', a.clock.now);
    const held = remote.hold('pullItems');
    const run = a.engine.syncNow();
    await held.started;
    const stopped = a.engine.stop();
    held.release();
    await stopped;
    const snapshot = { local: JSON.stringify(a.storage.get(studyKey)), remote: JSON.stringify([...remote.items.entries()]) };
    await run;
    await new Promise((r) => setTimeout(r, 10));
    expect(JSON.stringify(a.storage.get(studyKey))).toBe(snapshot.local);
    expect(JSON.stringify([...remote.items.entries()])).toBe(snapshot.remote);
  });
});

describe('settings', () => {
  test('first sign-in on a device takes the account value; with none, uploads the device value', async () => {
    const a = makeDevice(remote, 'devA');
    a.storage.set(languageKey, 'zh-Hans');
    await a.engine.syncNow();
    expect(remote.settings.get('language')).toMatchObject({ key: 'language', json: '"zh-Hans"', deviceId: 'devA' });

    const b = makeDevice(remote, 'devB');
    b.storage.set(languageKey, 'en');
    await b.engine.syncNow();
    expect(b.storage.get(languageKey)).toBe('zh-Hans');
  });

  test('after linking, the newer change wins on every device', async () => {
    const a = makeDevice(remote, 'devA', { start: 1_000_000 });
    const b = makeDevice(remote, 'devB', { start: 1_000_000 });
    await synced(a, b);
    a.engine.start();
    b.engine.start();
    a.clock.now = 1_100_000;
    a.storage.set(appearanceKey, { preset: 'silver', mode: 'light' } as never);
    b.clock.now = 1_200_000;
    b.storage.set(appearanceKey, { preset: 'graphite', mode: 'dark' } as never);
    await synced(a, b, a);
    expect(a.storage.get(appearanceKey)).toEqual({ preset: 'graphite', mode: 'dark' });
    expect(b.storage.get(appearanceKey)).toEqual({ preset: 'graphite', mode: 'dark' });
    await a.engine.stop();
    await b.engine.stop();
  });

  test('a remote setting that fails the schema is ignored', async () => {
    const a = makeDevice(remote, 'devA');
    remote.putSetting({ key: 'language', json: '"klingon"', updatedAt: 5, deviceId: 'devZ' });
    remote.putSetting({ key: 'appearance', json: '{not json', updatedAt: 5, deviceId: 'devZ' });
    await a.engine.syncNow();
    expect(a.storage.get(languageKey)).toBe('system');
    expect(a.storage.get(appearanceKey)).toEqual({ preset: null, mode: 'system' });
    expect(a.engine.status().state).toBe('idle');
  });
});

describe('reading progress', () => {
  const progress = (over: Partial<ReturnType<typeof progressKey.schema.parse>>) => ({ ...progressKey.fallback, ...over });

  test('minutes add up across devices, each device uploads only its own, and repeats change nothing', async () => {
    const a = makeDevice(remote, 'devA');
    const b = makeDevice(remote, 'devB');
    a.storage.set(progressKey, progress({ activeMs: { [DAY]: 300_000 } }));
    b.storage.set(progressKey, progress({ activeMs: { [DAY]: 200_000 } }));
    await synced(a, b, a, b, a);
    expect(a.storage.get(progressKey).activeMs[DAY]).toBe(500_000);
    expect(b.storage.get(progressKey).activeMs[DAY]).toBe(500_000);

    // A reads 100 s more, as the reader's tracker would (read, add, write).
    const p = a.storage.get(progressKey);
    p.activeMs[DAY] = p.activeMs[DAY]! + 100_000;
    a.storage.set(progressKey, p);
    await synced(a, b, a, b);
    expect(a.storage.get(progressKey).activeMs[DAY]).toBe(600_000);
    expect(b.storage.get(progressKey).activeMs[DAY]).toBe(600_000);
    expect(remote.devices.get('devA')?.activeMs[DAY]).toBe(400_000);
    expect(remote.devices.get('devB')?.activeMs[DAY]).toBe(200_000);
  });

  test('chapters read and goal-met days are unions; the earliest credit time is kept', async () => {
    const a = makeDevice(remote, 'devA');
    const b = makeDevice(remote, 'devB');
    a.storage.set(progressKey, progress({ chaptersRead: { '43:3': iso(2000), '1:1': iso(5000) }, goalMetDays: ['2026-11-01'] }));
    b.storage.set(progressKey, progress({ chaptersRead: { '43:3': iso(1000), '19:23': iso(3000) }, goalMetDays: ['2026-10-30', '2026-11-01'] }));
    await synced(a, b, a);
    for (const d of [a, b]) {
      const p = d.storage.get(progressKey);
      expect(p.chaptersRead).toEqual({ '43:3': iso(1000), '1:1': iso(5000), '19:23': iso(3000) });
      expect(p.goalMetDays).toEqual(['2026-10-30', '2026-11-01']);
    }
  });

  test('the newest goal wins; a new device takes the account goal; evidence stays on the device', async () => {
    const a = makeDevice(remote, 'devA', { start: 1_000_000 });
    a.storage.set(progressKey, progress({ goalMinutes: 20, evidence: { day: DAY, chapters: { '43:3': { furthestVerse: 9, engagedMs: 5 } } } }));
    await a.engine.syncNow();
    const doc = remote.devices.get('devA') as DeviceProgress & Record<string, unknown>;
    expect(doc.goal?.minutes).toBe(20);
    expect(Object.keys(doc)).not.toContain('evidence');

    const b = makeDevice(remote, 'devB', { start: 1_000_000 });
    b.storage.set(progressKey, progress({ goalMinutes: 15 }));
    await b.engine.syncNow();
    expect(b.storage.get(progressKey).goalMinutes).toBe(20);
    expect(b.storage.get(progressKey).evidence).toEqual({ day: '', chapters: {} });

    b.engine.start();
    await b.engine.syncNow();
    b.clock.now = 2_000_000;
    b.storage.set(progressKey, { ...b.storage.get(progressKey), goalMinutes: 30 });
    await synced(b, a);
    expect(a.storage.get(progressKey).goalMinutes).toBe(30);
    await b.engine.stop();
  });
});
