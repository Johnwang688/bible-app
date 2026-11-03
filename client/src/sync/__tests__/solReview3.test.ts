// Sol round 3 on the write journal (R6b-fu-journal). Confirmed failing by the orchestrator.
// Test 1 (rule 9): a first catch of a new class (the watcher re-enters recovery in the middle of commit()); fixed by
// R6b-fu-journal-fix1. Test 2 (rules 8/12): PARKED for John (claude-workflows 5a step 5, the crash-evidence class
// caught again after implementer-hard). Reaching it needs a crash inside one synchronous commit and then another
// account syncing on this device before the first account's engine starts again; a restored session creates the
// first account's engine (which recovers on creation) first. Fix design: a device-level index of open journals, settled
// by any engine before it overwrites a key another account's open journal names.
import { appearanceKey, languageKey } from '../../storage/keys';
import { createStorage, memoryBackend, type KeyValueBackend } from '../../storage/storage';
import { createMemoryRemote } from '../memoryRemote';
import { syncStateKey } from '../state';
import { makeDevice, progressKey } from './fixtures';

const DAY = '2026-11-02';
const PROGRESS = { progress: progressKey };
const SETTINGS = { settings: [appearanceKey, languageKey] };
const stateKey = syncStateKey('alice');

beforeEach(() => jest.useFakeTimers());
afterEach(() => {
  jest.clearAllTimers();
  jest.useRealTimers();
});

/** Exact durable bytes, captured after one atomic key write (as in solReview2). */
function snapshot(backend: KeyValueBackend, keys: readonly string[]): KeyValueBackend {
  const copy = memoryBackend();
  for (const key of keys) {
    const raw = backend.getString(key);
    if (raw !== undefined) copy.set(key, raw);
  }
  return copy;
}

test('rule 9: downloading two settings while started must not invent a local change to the second', async () => {
  const remote = createMemoryRemote();
  const backend = memoryBackend();
  const storage = createStorage(backend);
  const a = makeDevice(remote, 'devA', { domains: SETTINGS, storage });
  a.storage.set(languageKey, 'en');
  await a.engine.syncNow();
  a.engine.start();
  remote.putSetting({ key: 'appearance', json: '{"preset":null,"mode":"dark"}', updatedAt: 2_000_000, deviceId: 'devB' });
  remote.putSetting({ key: 'language', json: '"zh-Hans"', updatedAt: 2_000_000, deviceId: 'devB' });
  let crashed: KeyValueBackend | undefined;
  const off = storage.subscribe(stateKey, () => {
    // Crash after the final state write clears the journal. No app setting was edited.
    if (!crashed && !storage.get(stateKey).journal && storage.get(languageKey) === 'zh-Hans') {
      crashed = snapshot(backend, [stateKey.key, appearanceKey.key, languageKey.key]);
    }
  });
  a.clock.now = 3_000_000;
  await a.engine.syncNow();
  off();
  await a.engine.stop();
  expect(crashed).toBeDefined();
  expect(a.storage.get(languageKey)).toBe('zh-Hans');
  const recovered = createStorage(crashed!);
  expect(recovered.get(stateKey).settings.base.language).toMatchObject({ t: 2_000_000, d: 'devB' });

  // This change is newer than the download but older than the receiving sync.
  remote.putSetting({ key: 'language', json: '"system"', updatedAt: 2_500_000, deviceId: 'devC' });
  const restarted = makeDevice(remote, 'devA', { domains: SETTINGS, storage: recovered, start: 4_000_000 });
  await restarted.engine.syncNow();
  await restarted.engine.syncNow();
  const observer = makeDevice(remote, 'devD', { domains: SETTINGS, start: 5_000_000 });
  await observer.engine.syncNow();
  expect({
    local: recovered.get(languageKey),
    observer: observer.storage.get(languageKey),
    remote: remote.settings.get('language')?.json,
  }).toEqual({ local: 'system', observer: 'system', remote: '"system"' });
});

test.skip('rules 8 and 12: another account must not erase the evidence of a landed progress write', async () => {
  const remote = createMemoryRemote();
  const backend = memoryBackend();
  const storage = createStorage(backend);
  const a = makeDevice(remote, 'devA', { domains: PROGRESS, storage });
  storage.set(progressKey, { ...progressKey.fallback, activeMs: { [DAY]: 50_000 } });
  await a.engine.syncNow();
  remote.putDevice({ deviceId: 'devB', activeMs: { [DAY]: 100_000 }, chaptersRead: {}, goalMetDays: [], goal: null, updatedAt: 2_000_000 });
  let crashed: KeyValueBackend | undefined;
  const off = storage.subscribe(progressKey, () => {
    crashed = snapshot(backend, [stateKey.key, progressKey.key]);
  });
  await a.engine.syncNow();
  off();
  expect(crashed).toBeDefined();
  const recovered = createStorage(crashed!);
  const journal = recovered.get(stateKey).journal;
  expect(journal).not.toBeNull();
  expect(recovered.tagOf(progressKey)).toBe(journal!.id);
  expect(recovered.get(progressKey).activeMs[DAY]).toBe(150_000);

  // A different account's goal changes the shared progress key, without adding any minutes.
  const bobRemote = createMemoryRemote();
  bobRemote.putDevice({ deviceId: 'bobPhone', activeMs: {}, chaptersRead: {}, goalMetDays: [], goal: { minutes: 20, updatedAt: 3_000_000 }, updatedAt: 3_000_000 });
  const bob = makeDevice(bobRemote, 'devA', { uid: 'bob', domains: PROGRESS, storage: recovered, start: 4_000_000 });
  await bob.engine.syncNow();
  await bob.engine.stop();
  // Bob must leave Alice's state alone; his tagged write must not make her landed write look absent.
  expect(recovered.get(stateKey).journal).toEqual(journal);
  expect(recovered.get(progressKey).activeMs[DAY]).toBe(150_000);
  expect(recovered.tagOf(progressKey)).not.toBe(journal!.id);

  const restarted = makeDevice(remote, 'devA', { domains: PROGRESS, storage: recovered, start: 5_000_000 });
  await restarted.engine.syncNow();
  await restarted.engine.syncNow();
  const observer = makeDevice(remote, 'devD', { domains: PROGRESS, start: 6_000_000 });
  await observer.engine.syncNow();
  expect({
    local: recovered.get(progressKey).activeMs[DAY],
    own: remote.devices.get('devA')?.activeMs[DAY],
    observer: observer.storage.get(progressKey).activeMs[DAY],
  }).toEqual({ local: 150_000, own: 50_000, observer: 150_000 });
});
