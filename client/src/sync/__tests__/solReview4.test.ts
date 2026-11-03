// Sol round 4 on the write journal. Confirmed failing by the orchestrator (6 tests, 2 findings) and PARKED for John
// (claude-workflows 5a step 5: the commit/listener class caught again after implementer-hard's fix1). Both need an app
// storage listener that writes a synced key synchronously inside a storage notification during the engine's commit.
// No app code does that today: the only storage subscribers outside sync are useStoredValue (React re-renders;
// writes happen later, in effects) and the sign-in gate (writes no synced key). Fix design if wanted: commit defers
// listener notifications until all its writes land (storage batch), or re-reads each key just before writing it and
// leaves a changed key pending (rule 5).
// Round 4 counterexamples for the write journal and f2f16bf's deferred watchers.
// Findings (production code and previous tests are intentionally unchanged):
// F1, rules 5/9/12: a listener edits a later commit key; expected its edit/reading to survive,
// actual the precomputed tagged write overwrites it (language system -> zh-Hans; own 60,000 -> 50,000).
// F2, rules 5/9: a listener changes a setting away from and back to its base during commit;
// expected a new first-seen clock, actual no stamp, so an older remote change wins.
import { appearanceKey, languageKey } from '../../storage/keys';
import { createStorage, memoryBackend, type KeyValueBackend } from '../../storage/storage';
import { createMemoryRemote } from '../memoryRemote';
import { syncStateKey } from '../state';
import { makeDevice, progressKey } from './fixtures';

const DAY = '2026-11-02';
const SETTINGS = { settings: [appearanceKey, languageKey] };
const stateKey = syncStateKey('alice');

beforeEach(() => jest.useFakeTimers());
afterEach(() => {
  jest.clearAllTimers();
  jest.useRealTimers();
});

/** Exact durable bytes after one storage write, as in solReview2.test.ts. */
function snapshot(backend: KeyValueBackend, keys: readonly string[]): KeyValueBackend {
  const copy = memoryBackend();
  for (const key of keys) {
    const raw = backend.getString(key);
    if (raw !== undefined) copy.set(key, raw);
  }
  return copy;
}

// Exercise the same counterexamples without a crash and with a restart at the named write.
for (const crash of [false, true]) {
  const mode = crash ? 'crash/restart' : 'live engine';

  test.skip(`F1, rule 5/9 (${mode}): a listener's language edit must survive a later write in the commit`, async () => {
    const remote = createMemoryRemote();
    const backend = memoryBackend();
    const storage = createStorage(backend);
    const a = makeDevice(remote, 'devA', { domains: SETTINGS, storage });
    storage.set(languageKey, 'en');
    await a.engine.syncNow();
    a.engine.start();
    remote.putSetting({ key: 'appearance', json: '{"preset":null,"mode":"dark"}', updatedAt: 2_000_000, deviceId: 'devB' });
    remote.putSetting({ key: 'language', json: '"zh-Hans"', updatedAt: 2_000_000, deviceId: 'devB' });

    let edited = false;
    let valueAfterAppWrite: string | undefined;
    let crashed: KeyValueBackend | undefined;
    const offEdit = storage.subscribe(appearanceKey, () => {
      if (edited || storage.get(appearanceKey).mode !== 'dark') return;
      edited = true;
      // The language download is planned but has not landed. This is a real app write during sync.
      storage.set(languageKey, 'system');
      valueAfterAppWrite = storage.get(languageKey);
    });
    const offCrash = storage.subscribe(languageKey, () => {
      if (!crashed && edited && storage.tagOf(languageKey) === storage.get(stateKey).journal?.id) {
        // Crash after the engine's tagged language write, before final state save.
        crashed = snapshot(backend, [stateKey.key, appearanceKey.key, languageKey.key]);
      }
    });
    a.clock.now = 3_000_000;
    await a.engine.syncNow();
    offEdit();
    offCrash();
    if (crash) await a.engine.stop();
    expect(valueAfterAppWrite).toBe('system');
    expect(crashed).toBeDefined();

    const resumed = crash
      ? makeDevice(remote, 'devA', { domains: SETTINGS, storage: createStorage(crashed!), start: 4_000_000 })
      : a;
    resumed.clock.now = 4_000_000;
    await resumed.engine.syncNow();
    await resumed.engine.syncNow();
    await resumed.engine.stop();
    const observer = makeDevice(remote, 'devD', { domains: SETTINGS, start: 5_000_000 });
    await observer.engine.syncNow();
    expect({
      local: resumed.storage.get(languageKey),
      observer: observer.storage.get(languageKey),
      remote: remote.settings.get('language')?.json,
    }).toEqual({ local: 'system', observer: 'system', remote: '"system"' });
  });

  test.skip(`F1, rules 5/12 (${mode}): reading in a setting listener must survive the later progress write`, async () => {
    const remote = createMemoryRemote();
    const backend = memoryBackend();
    const storage = createStorage(backend);
    const domains = { settings: [languageKey], progress: progressKey };
    const a = makeDevice(remote, 'devA', { domains, storage });
    storage.set(languageKey, 'en');
    storage.set(progressKey, { ...progressKey.fallback, activeMs: { [DAY]: 50_000 } });
    await a.engine.syncNow();
    a.engine.start();
    remote.putSetting({ key: 'language', json: '"zh-Hans"', updatedAt: 2_000_000, deviceId: 'devB' });
    remote.putDevice({ deviceId: 'devB', activeMs: { [DAY]: 100_000 }, chaptersRead: {}, goalMetDays: [], goal: null, updatedAt: 2_000_000 });

    let read = false;
    let valueAfterReading: number | undefined;
    let crashed: KeyValueBackend | undefined;
    const offRead = storage.subscribe(languageKey, () => {
      if (read || storage.get(languageKey) !== 'zh-Hans') return;
      read = true;
      const p = storage.get(progressKey);
      storage.set(progressKey, { ...p, activeMs: { [DAY]: p.activeMs[DAY]! + 10_000 } });
      valueAfterReading = storage.get(progressKey).activeMs[DAY];
    });
    const offCrash = storage.subscribe(progressKey, () => {
      if (!crashed && read && storage.tagOf(progressKey) === storage.get(stateKey).journal?.id) {
        // Crash after the tagged progress write; the new fold is still journaled.
        crashed = snapshot(backend, [stateKey.key, languageKey.key, progressKey.key]);
      }
    });
    a.clock.now = 3_000_000;
    await a.engine.syncNow();
    offRead();
    offCrash();
    if (crash) await a.engine.stop();
    expect(valueAfterReading).toBe(60_000);
    expect(crashed).toBeDefined();

    const resumed = crash
      ? makeDevice(remote, 'devA', { domains, storage: createStorage(crashed!), start: 4_000_000 })
      : a;
    resumed.clock.now = 4_000_000;
    await resumed.engine.syncNow();
    await resumed.engine.syncNow();
    await resumed.engine.stop();
    const observer = makeDevice(remote, 'devD', { domains, start: 5_000_000 });
    await observer.engine.syncNow();
    expect({
      local: resumed.storage.get(progressKey).activeMs[DAY],
      own: remote.devices.get('devA')?.activeMs[DAY],
      observer: observer.storage.get(progressKey).activeMs[DAY],
    }).toEqual({ local: 160_000, own: 60_000, observer: 160_000 });
  });

  test.skip(`F2, rules 5/9 (${mode}): changing away from and back to the base in a listener must retain its new clock`, async () => {
    const remote = createMemoryRemote();
    const backend = memoryBackend();
    const storage = createStorage(backend);
    const a = makeDevice(remote, 'devA', { domains: SETTINGS, storage });
    storage.set(appearanceKey, { preset: null, mode: 'dark' });
    storage.set(languageKey, 'en');
    await a.engine.syncNow();
    a.engine.start();
    remote.putSetting({ key: 'language', json: '"zh-Hans"', updatedAt: 2_000_000, deviceId: 'devB' });

    let edited = false;
    let crashed: KeyValueBackend | undefined;
    const offEdit = storage.subscribe(languageKey, () => {
      if (edited || storage.get(languageKey) !== 'zh-Hans') return;
      edited = true;
      // This key is NOT being downloaded. Both app changes notify the started engine's watcher.
      storage.set(appearanceKey, { preset: null, mode: 'light' });
      storage.set(appearanceKey, { preset: null, mode: 'dark' });
    });
    const offCrash = storage.subscribe(stateKey, () => {
      if (!crashed && edited && !storage.get(stateKey).journal) {
        // Crash at the final state save after deferred stamping should have preserved the edit.
        crashed = snapshot(backend, [stateKey.key, appearanceKey.key, languageKey.key]);
      }
    });
    a.clock.now = 3_000_000;
    await a.engine.syncNow();
    offEdit();
    offCrash();
    if (crash) await a.engine.stop();
    expect(edited).toBe(true);
    expect(storage.get(appearanceKey).mode).toBe('dark');
    expect(crashed).toBeDefined();

    // A competing edit made before this listener's edits must lose to their 3,000,000 clock.
    remote.putSetting({ key: 'appearance', json: '{"preset":null,"mode":"light"}', updatedAt: 2_500_000, deviceId: 'devC' });
    const resumed = crash
      ? makeDevice(remote, 'devA', { domains: SETTINGS, storage: createStorage(crashed!), start: 4_000_000 })
      : a;
    resumed.clock.now = 4_000_000;
    await resumed.engine.syncNow();
    await resumed.engine.syncNow();
    await resumed.engine.stop();
    const observer = makeDevice(remote, 'devD', { domains: SETTINGS, start: 5_000_000 });
    await observer.engine.syncNow();
    expect({
      local: resumed.storage.get(appearanceKey).mode,
      observer: observer.storage.get(appearanceKey).mode,
      remote: remote.settings.get('appearance')?.json,
      clock: remote.settings.get('appearance')?.updatedAt,
    }).toEqual({ local: 'dark', observer: 'dark', remote: '{"preset":null,"mode":"dark"}', clock: 3_000_000 });
  });
}
