// Security review of SYNC-1 (Memory sync): failing tests for the findings in
// C:/dev/bible-app-work/mem/sync1-security-review.md. Each test states the behaviour the app should have; it fails on
// the branch as reviewed. Every hostile document here is one the Firestore rules (isMemory) and the adapter's decoder
// (readMemory / decodeMemoryProgress) accept: verse ids of at most 64 characters, real ISO times and real days, at
// most MEMORY_ROWS_MAX rows and MEMORY_DAYS_MAX days. Anyone holding the user's ID token can write them as another
// "device" of that user (memorySecurityReview.emu.ts shows the rules and the adapter let them through).
import { dailyStreak } from '../../memory/dailyLesson';
import type { ProgressMap, VerseProgress } from '../../memory/types';
import { memoryHistoryKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, type KeyValueBackend } from '../../storage/storage';
import { MEMORY_DAYS_MAX, MEMORY_ROWS_MAX } from '../domains/memory';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import type { SyncDomains } from '../shapes';
import type { MemoryDoc } from '../types';
import { DOMAINS, makeDevice, setHighlight } from './fixtures';

const MEM_DOMAINS: SyncDomains = { ...DOMAINS, memory: { progress: memoryProgressKey, history: memoryHistoryKey } };
const NOW = Date.parse('2026-11-03T12:00:00.000Z');

let remote: MemoryRemote;
beforeEach(() => {
  remote = createMemoryRemote();
});

const row = (over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'review',
  successes: 12,
  failures: 1,
  masteryScore: 90,
  nextDueAt: '2026-11-10T11:00:00.000Z',
  lastReviewedAt: '2026-11-03T11:00:00.000Z',
  lapsedAt: null,
  ...over,
});

const hostile = (deviceId: string, over: Partial<MemoryDoc> = {}): MemoryDoc => ({
  deviceId,
  progress: {},
  history: { startedOn: null, completedDates: [] },
  updatedAt: NOW,
  ...over,
});

/** `n` distinct verse ids of exactly 64 characters (the storage cap), unique to `tag`. */
const longIds = (tag: string, n: number) =>
  Array.from({ length: n }, (_, i) => `${tag}-${String(i).padStart(6, '0')}-`.padEnd(64, 'x'));

const fullOfUnknownVerses = (deviceId: string): MemoryDoc => {
  const progress: ProgressMap = {};
  for (const id of longIds(deviceId.toLowerCase(), MEMORY_ROWS_MAX)) {
    progress[id] = row({ stage: 'review', successes: 0, failures: 0, masteryScore: 0, nextDueAt: null, lapsedAt: null });
  }
  return hostile(deviceId, { progress });
};

/** A web-sized key-value store: localStorage's quota of about 5 M UTF-16 code units across all keys. */
function quotaBackend(limit = 5 * 1024 * 1024): KeyValueBackend {
  const map = new Map<string, string>();
  const used = () => [...map].reduce((n, [k, v]) => n + k.length + v.length, 0);
  return {
    getString: (key) => map.get(key),
    set: (key, value) => {
      const prev = map.get(key);
      if (used() - (prev === undefined ? 0 : key.length + prev.length) + key.length + value.length > limit) {
        throw new DOMException('The quota has been exceeded.', 'QuotaExceededError');
      }
      map.set(key, value);
    },
    remove: (key) => void map.delete(key),
  };
}

describe('SYNC-1 security review: pulled Memory documents', () => {
  test('SR-M1: a far-future lastReviewedAt on another device does not override a real review made since', async () => {
    // A tampered document (or a device whose clock reads year 9999) resets every verse to the start of the ladder,
    // and because its review time is never passed, it beats every later real review, on every device, for good.
    remote.putMemory(
      hostile('evilDevice0000000000', {
        progress: { 'john-3-16': row({ stage: 'chunk_order', successes: 0, failures: 0, masteryScore: 0, lastReviewedAt: '9999-12-31T23:59:59.999Z' }) },
      }),
    );
    const a = makeDevice(remote, 'devA', { domains: MEM_DOMAINS, start: NOW });
    const real = row();
    a.storage.set(memoryProgressKey, { 'john-3-16': real });
    await a.engine.syncNow();
    expect(a.storage.get(memoryProgressKey)['john-3-16']).toEqual(real);
  });

  test('SR-M2: far-future completed days on another device do not evict the real ones (or end the streak)', async () => {
    // mergeMemoryHistory keeps the LATEST MEMORY_DAYS_MAX days, so 1000 days in the year 9000 push every real day out
    // of the union, and every device then stores only the fake ones.
    const future = Array.from({ length: MEMORY_DAYS_MAX }, (_, i) => new Date(Date.UTC(9000, 0, 1 + i)).toISOString().slice(0, 10));
    remote.putMemory(hostile('evilDevice0000000000', { history: { startedOn: null, completedDates: future } }));
    const a = makeDevice(remote, 'devA', { domains: MEM_DOMAINS, start: NOW });
    const real = ['2026-11-01', '2026-11-02', '2026-11-03'];
    a.storage.set(memoryHistoryKey, { startedOn: '2026-11-01', completedDates: real });
    await a.engine.syncNow();
    const after = a.storage.get(memoryHistoryKey).completedDates;
    expect(after).toEqual(expect.arrayContaining(real));
    expect(dailyStreak(after, '2026-11-03')).toBe(3);
  });

  test(`SR-M3a: Memory documents full of unknown verses do not grow local progress past ${MEMORY_ROWS_MAX} rows`, async () => {
    // Each device document may carry MEMORY_ROWS_MAX verses, the number of device documents is not bounded, and the
    // local join keeps the union of all of them: N documents put N * MEMORY_ROWS_MAX rows into memory.progress, which
    // is then parsed and zod-validated on every read (useStoredValue reads on every render).
    for (const id of ['evilDevice0000000001', 'evilDevice0000000002', 'evilDevice0000000003']) remote.putMemory(fullOfUnknownVerses(id));
    const a = makeDevice(remote, 'devA', { domains: MEM_DOMAINS, start: NOW });
    a.storage.set(memoryProgressKey, { 'john-3-16': row() });
    await a.engine.syncNow();
    expect(Object.keys(a.storage.get(memoryProgressKey)).length).toBeLessThanOrEqual(MEMORY_ROWS_MAX);
  });

  test('SR-M3b: on web-sized storage, hostile Memory documents do not stop study items from syncing', async () => {
    // On web (localStorage, ~5 M code units) the joined Memory progress no longer fits: writeMemory's storage.set
    // throws inside commit, before any push, so every run fails and no domain (items, settings, reading progress)
    // syncs from this device again. The documents cannot be deleted by a client, so it stays that way.
    for (let i = 0; i < 20; i++) remote.putMemory(fullOfUnknownVerses(`evilDevice${String(i).padStart(10, '0')}`));
    const a = makeDevice(remote, 'devA', { domains: MEM_DOMAINS, start: NOW, storage: createStorage(quotaBackend()) });
    setHighlight(a.storage, '43:3:16', 'yellow', NOW - 1000);
    // Twenty such documents are about 4 MB on the wire (each ~206 KB, under the rules' 343999-character bound).
    for (let run = 0; run < 2; run++) await a.engine.syncNow().catch(() => undefined);
    expect(remote.items.has('highlight:43:3:16')).toBe(true);
  });
});
