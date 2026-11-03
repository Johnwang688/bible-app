// Sol round 2's crash-window counterexamples (R-6b). Parked in PR #36, then made the acceptance tests of the
// sync write journal (FOLLOW-UP item 1, John 2026-11-02). The fixer may not edit them.
// Round-two counterexamples. Production code and existing tests are intentionally unchanged.
import { languageKey } from '../../storage/keys';
import { createStorage, memoryBackend, type KeyValueBackend, type Storage } from '../../storage/storage';
import { createMemoryRemote } from '../memoryRemote';
import { syncStateKey } from '../state';
import { makeDevice, progressKey, setNote, studyKey } from './fixtures';

const DAY = '2026-11-02';
const PROGRESS = { progress: progressKey };
const LANGUAGE = { settings: [languageKey] };

/** Copy the exact durable bytes at a crash boundary; the original process can finish independently. */
function snapshot(backend: KeyValueBackend, keys: readonly string[]): Storage {
  const copy = memoryBackend();
  for (const key of keys) {
    const raw = backend.getString(key);
    if (raw !== undefined) copy.set(key, raw);
  }
  return createStorage(copy);
}

test('rule 12: a pre-write crash marker must not consume reading recorded before sync restarts', async () => {
  const remote = createMemoryRemote();
  const backend = memoryBackend();
  const storage = createStorage(backend);
  const a = makeDevice(remote, 'devA', { domains: PROGRESS, storage });
  storage.set(progressKey, { ...progressKey.fallback, activeMs: { [DAY]: 50_000 } });
  await a.engine.syncNow();
  remote.putDevice({
    deviceId: 'devB', activeMs: { [DAY]: 100_000 }, chaptersRead: {},
    goalMetDays: [], goal: null, updatedAt: 2_000_000,
  });

  const stateKey = syncStateKey('alice');
  let crashed: Storage | undefined;
  const off = storage.subscribe(stateKey, () => {
    if (storage.get(stateKey).progress.pending) {
      // Step 1 landed, step 2 (the progress write) did not.
      crashed = snapshot(backend, [stateKey.key, progressKey.key]);
    }
  });
  await a.engine.syncNow();
  off();
  expect(crashed).toBeDefined();
  const recovered = crashed!;
  expect(recovered.get(progressKey).activeMs[DAY]).toBe(50_000);
  expect(recovered.get(stateKey).progress.pending?.expect[DAY]).toBe(150_000);

  // Local-first reading remains usable before optional sync is recreated on app startup/sign-in.
  recovered.set(progressKey, { ...recovered.get(progressKey), activeMs: { [DAY]: 150_000 } });
  const restarted = makeDevice(remote, 'devA', { domains: PROGRESS, storage: recovered });
  await restarted.engine.syncNow();
  await restarted.engine.syncNow();

  expect({
    total: recovered.get(progressKey).activeMs[DAY],
    own: remote.devices.get('devA')?.activeMs[DAY],
  }).toEqual({ total: 250_000, own: 150_000 });
});

test('rule 14: a downloaded goal must retain its clock after a crash following the progress write', async () => {
  const remote = createMemoryRemote();
  const backend = memoryBackend();
  const storage = createStorage(backend);
  const a = makeDevice(remote, 'devA', { domains: PROGRESS, storage });
  await a.engine.syncNow(); // A's goal 10 at 1,000,000.
  remote.putDevice({
    deviceId: 'devB', activeMs: {}, chaptersRead: {}, goalMetDays: [],
    goal: { minutes: 20, updatedAt: 2_000_000 }, updatedAt: 2_000_000,
  });

  const stateKey = syncStateKey('alice');
  let crashed: Storage | undefined;
  const off = storage.subscribe(progressKey, () => {
    // Step 2 landed but step 3 (the new goal/base and cleared marker) did not.
    crashed = snapshot(backend, [stateKey.key, progressKey.key]);
  });
  a.clock.now = 3_000_000;
  await a.engine.syncNow();
  off();
  expect(crashed).toBeDefined();
  const recovered = crashed!;
  expect(recovered.get(progressKey).goalMinutes).toBe(20);
  expect(recovered.get(stateKey).progress.goal?.m).toBe(10);
  expect(recovered.get(stateKey).progress.pending).not.toBeNull();

  remote.putDevice({
    deviceId: 'devC', activeMs: {}, chaptersRead: {}, goalMetDays: [],
    goal: { minutes: 30, updatedAt: 2_500_000 }, updatedAt: 2_500_000,
  });
  const restarted = makeDevice(remote, 'devA', { domains: PROGRESS, storage: recovered, start: 4_000_000 });
  await restarted.engine.syncNow();
  const observer = makeDevice(remote, 'devD', { domains: PROGRESS, start: 5_000_000 });
  await observer.engine.syncNow();

  expect({
    local: recovered.get(progressKey).goalMinutes,
    observer: observer.storage.get(progressKey).goalMinutes,
  }).toEqual({ local: 30, observer: 30 });
});

test('rule 9: a downloaded setting must not become a newer local edit after a crash before base save', async () => {
  const remote = createMemoryRemote();
  const backend = memoryBackend();
  const storage = createStorage(backend);
  const a = makeDevice(remote, 'devA', { domains: LANGUAGE, storage });
  storage.set(languageKey, 'en');
  await a.engine.syncNow();
  remote.putSetting({ key: 'language', json: '"zh-Hans"', updatedAt: 2_000_000, deviceId: 'devB' });

  const stateKey = syncStateKey('alice');
  let crashed: Storage | undefined;
  const off = storage.subscribe(languageKey, () => {
    crashed = snapshot(backend, [stateKey.key, languageKey.key]);
  });
  a.clock.now = 3_000_000;
  await a.engine.syncNow();
  off();
  expect(crashed).toBeDefined();
  const recovered = crashed!;
  expect(recovered.get(languageKey)).toBe('zh-Hans');
  expect(recovered.get(stateKey).settings.base.language?.s).toBe('"en"');

  remote.putSetting({ key: 'language', json: '"system"', updatedAt: 2_500_000, deviceId: 'devC' });
  const restarted = makeDevice(remote, 'devA', { domains: LANGUAGE, storage: recovered, start: 4_000_000 });
  await restarted.engine.syncNow();
  const observer = makeDevice(remote, 'devD', { domains: LANGUAGE });
  await observer.engine.syncNow();

  expect({
    local: recovered.get(languageKey),
    observer: observer.storage.get(languageKey),
    remote: remote.settings.get('language')?.json,
  }).toEqual({ local: 'system', observer: 'system', remote: '"system"' });
});

test('rule 3: a downloaded tombstone must not be restamped after a crash and defeat a newer edit', async () => {
  const remote = createMemoryRemote();
  const backend = memoryBackend();
  const storage = createStorage(backend);
  const domains = { studyItems: studyKey };
  const a = makeDevice(remote, 'devA', { domains, storage });
  setNote(storage, '43:3:16', 'original', 900_000);
  await a.engine.syncNow();
  remote.putItem({
    id: 'note:43:3:16', kind: 'note', ref: '43:3:16', deleted: true,
    value: null, updatedAt: 2_000_000, deviceId: 'devB',
  });

  const stateKey = syncStateKey('alice');
  let crashed: Storage | undefined;
  const off = storage.subscribe(studyKey, () => {
    crashed = snapshot(backend, [stateKey.key, studyKey.key]);
  });
  a.clock.now = 3_000_000;
  await a.engine.syncNow();
  off();
  expect(crashed).toBeDefined();
  const recovered = crashed!;
  expect(recovered.get(studyKey).notes['43:3:16']).toBeUndefined();
  expect(recovered.get(stateKey).items.base['note:43:3:16']?.s).toBe('original');

  remote.putItem({
    id: 'note:43:3:16', kind: 'note', ref: '43:3:16', deleted: false,
    value: { text: 'newer edit' }, updatedAt: 2_500_000, deviceId: 'devC',
  });
  const restarted = makeDevice(remote, 'devA', { domains, storage: recovered, start: 4_000_000 });
  await restarted.engine.syncNow();
  await restarted.engine.syncNow();
  const observer = makeDevice(remote, 'devD', { domains });
  await observer.engine.syncNow();

  expect({
    local: recovered.get(studyKey).notes['43:3:16']?.text,
    observer: observer.storage.get(studyKey).notes['43:3:16']?.text,
    remote: remote.items.get('note:43:3:16')?.value,
  }).toEqual({ local: 'newer edit', observer: 'newer edit', remote: { text: 'newer edit' } });
});
