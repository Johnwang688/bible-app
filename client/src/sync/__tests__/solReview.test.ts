// Counterexamples for the R-6b review. Production files are intentionally unchanged.
import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryRemote } from '../memoryRemote';
import { syncStateKey } from '../state';
import { makeDevice, progressKey, removeItem, setHighlight, setNote, studyKey } from './fixtures';

const DAY = '2026-11-02';
const ITEMS = { studyItems: studyKey };
const PROGRESS = { progress: progressKey };

beforeEach(() => jest.useFakeTimers());
afterEach(() => {
  jest.clearAllTimers();
  jest.useRealTimers();
});

test('rules 2-3: a delayed older push must not erase a newer edit from another device', async () => {
  const remote = createMemoryRemote();
  const a = makeDevice(remote, 'devA', { domains: ITEMS });
  const b = makeDevice(remote, 'devB', { domains: ITEMS });
  setNote(a.storage, '43:3:16', 'older', 100_000);
  setNote(b.storage, '43:3:16', 'newer', 200_000);

  // Both devices pull before A writes; B's newer edit commits first.
  const held = remote.hold('pushItems');
  const run = a.engine.syncNow();
  await held.started;
  await b.engine.syncNow();
  expect(remote.items.get('note:43:3:16')?.value).toEqual({ text: 'newer' });
  held.release();
  await run;
  // Give both engines repeated opportunities to repair the conflict.
  for (const d of [b, a, b, a]) await d.engine.syncNow();

  expect({
    remote: remote.items.get('note:43:3:16')?.value,
    a: a.storage.get(studyKey).notes['43:3:16']?.text,
    b: b.storage.get(studyKey).notes['43:3:16']?.text,
  }).toEqual({ remote: { text: 'newer' }, a: 'newer', b: 'newer' });
});

test('rules 2 and 4: recolouring back to the base colour is still a newer change', async () => {
  const remote = createMemoryRemote();
  const a = makeDevice(remote, 'devA', { domains: ITEMS });
  const b = makeDevice(remote, 'devB', { domains: ITEMS });
  setHighlight(a.storage, '43:3:16', 'blue', 900_000);
  await a.engine.syncNow();
  await b.engine.syncNow();
  a.engine.start();

  b.tick(100_000);
  setHighlight(b.storage, '43:3:16', 'green', b.clock.now);
  await b.engine.syncNow();
  a.tick(200_000);
  setHighlight(a.storage, '43:3:16', 'pink', a.clock.now);
  a.tick(100_000);
  setHighlight(a.storage, '43:3:16', 'blue', a.clock.now);
  await a.engine.syncNow();
  await b.engine.syncNow();
  await a.engine.stop();

  expect({
    a: a.storage.get(studyKey).highlights['43:3:16']?.colour,
    b: b.storage.get(studyKey).highlights['43:3:16']?.colour,
    remote: remote.items.get('highlight:43:3:16')?.value,
  }).toEqual({ a: 'blue', b: 'blue', remote: { colour: 'blue' } });
});

test('rule 2: matching payloads must not discard the newer local clock', async () => {
  const remote = createMemoryRemote();
  remote.putItem({
    id: 'note:43:3:16', kind: 'note', ref: '43:3:16', deleted: false,
    value: { text: 'same' }, updatedAt: 1_000_000, deviceId: 'devZ',
  });
  const a = makeDevice(remote, 'devA', { domains: ITEMS, start: 3_000_000 });
  const b = makeDevice(remote, 'devB', { domains: ITEMS, start: 3_000_000 });
  setNote(a.storage, '43:3:16', 'same', 3_000_000);
  setNote(b.storage, '43:3:16', 'middle', 2_000_000);
  await a.engine.syncNow();
  await b.engine.syncNow();
  await a.engine.syncNow();

  expect({
    a: a.storage.get(studyKey).notes['43:3:16']?.text,
    b: b.storage.get(studyKey).notes['43:3:16']?.text,
    remote: remote.items.get('note:43:3:16')?.value,
  }).toEqual({ a: 'same', b: 'same', remote: { text: 'same' } });
});

test('rule 4: deleting during an unacknowledged creation keeps the deletion first-seen time', async () => {
  const remote = createMemoryRemote();
  const a = makeDevice(remote, 'devA', { domains: ITEMS });
  const b = makeDevice(remote, 'devB', { domains: ITEMS, start: 4_000_000 });
  a.engine.start();
  await a.engine.syncNow();
  a.clock.now = 2_000_000;
  setNote(a.storage, '43:3:16', 'created', a.clock.now);
  const held = remote.hold('pushItems');
  const run = a.engine.syncNow();
  await held.started;
  a.clock.now = 3_000_000;
  removeItem(a.storage, 'notes', '43:3:16');
  held.release();
  await run;

  // B edits after the deletion, before A's next run discovers it again.
  setNote(b.storage, '43:3:16', 'edited after deletion', b.clock.now);
  await b.engine.syncNow();
  a.clock.now = 5_000_000;
  await a.engine.syncNow();
  await b.engine.syncNow();
  await a.engine.stop();

  expect({
    local: a.storage.get(studyKey).notes['43:3:16']?.text,
    remote: remote.items.get('note:43:3:16')?.value,
  }).toEqual({ local: 'edited after deletion', remote: { text: 'edited after deletion' } });
});

test('rule 14: stopping after a goal upload commits must not erase that goal on restart', async () => {
  const remote = createMemoryRemote();
  const a = makeDevice(remote, 'devA', { domains: PROGRESS });
  a.storage.set(progressKey, { ...progressKey.fallback, goalMinutes: 20 });
  const held = remote.hold('pushDevice');
  const run = a.engine.syncNow();
  await held.started;
  const stopped = a.engine.stop();
  held.release(); // The remote commits, then the stopped run skips its acknowledgement.
  await Promise.all([run, stopped]);
  expect(remote.devices.get('devA')?.goal?.minutes).toBe(20);

  a.restart();
  await a.engine.syncNow();
  const b = makeDevice(remote, 'devB', { domains: PROGRESS });
  await b.engine.syncNow();
  await a.engine.syncNow();

  expect({
    a: a.storage.get(progressKey).goalMinutes,
    b: b.storage.get(progressKey).goalMinutes,
    uploadedGoal: remote.devices.get('devA')?.goal?.minutes,
  }).toEqual({ a: 20, b: 20, uploadedGoal: 20 });
});

test('rule 12 and crash idempotence: restart between the progress write and fold save must not duplicate minutes', async () => {
  const remote = createMemoryRemote();
  const backend = memoryBackend();
  const storage = createStorage(backend);
  const a = makeDevice(remote, 'devA', { domains: PROGRESS, storage });
  storage.set(progressKey, { ...progressKey.fallback, activeMs: { [DAY]: 50_000 } });
  await a.engine.syncNow();
  remote.putDevice({
    deviceId: 'devB', activeMs: { [DAY]: 100_000 }, chaptersRead: {},
    goalMetDays: [], goal: null, updatedAt: 1,
  });

  // Snapshot durable storage at the exact boundary after progress is written but before
  // the engine persists the matching fold. A process crash at this point leaves these bytes.
  const crashedBackend = memoryBackend();
  const stateKey = syncStateKey('alice');
  let captured = false;
  const off = storage.subscribe(progressKey, () => {
    for (const key of [progressKey.key, stateKey.key]) {
      const raw = backend.getString(key);
      if (raw !== undefined) crashedBackend.set(key, raw);
    }
    captured = true;
  });
  await a.engine.syncNow();
  off();
  expect(captured).toBe(true);
  const crashedStorage = createStorage(crashedBackend);
  expect(crashedStorage.get(progressKey).activeMs[DAY]).toBe(150_000);
  expect(crashedStorage.get(stateKey).progress.fold).toEqual({});

  const restarted = makeDevice(remote, 'devA', { domains: PROGRESS, storage: crashedStorage });
  await restarted.engine.syncNow();
  await restarted.engine.syncNow();
  expect({
    total: crashedStorage.get(progressKey).activeMs[DAY],
    own: remote.devices.get('devA')?.activeMs[DAY],
  }).toEqual({ total: 150_000, own: 50_000 });
});

test('run-loop serialization: syncNow called by a status listener must wait for the current run', async () => {
  const remote = createMemoryRemote();
  const a = makeDevice(remote, 'devA', { domains: ITEMS });
  const first = remote.hold('pullItems');
  const second = remote.hold('pullItems');
  let queued: Promise<void> | undefined;
  let requested = false;
  const off = a.engine.subscribe(() => {
    if (!requested && a.engine.status().state === 'syncing') {
      requested = true;
      queued = a.engine.syncNow();
    }
  });
  const run = a.engine.syncNow();
  await first.started;
  const callsBeforeRelease = [...remote.calls];
  first.release();
  second.release();
  await Promise.all([run, queued]);
  off();

  expect(callsBeforeRelease).toEqual(['pullItems']);
});
