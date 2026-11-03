// SYNC-1 fix 2 (implementer-owned): incremental Memory pulls and their cursor, the nextDueAt bound, a
// device repairing its own document, and a Memory write that fails without stopping the other domains
// (CONFLICTS.md rules 24-25).
import { getAllMemoryVerses } from '../../memory/library';
import { recordAttempt } from '../../memory/schedule';
import type { ProgressMap, VerseProgress } from '../../memory/types';
import { appearanceKey } from '../../storage/keys';
import { memoryHistoryKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend, type KeyValueBackend } from '../../storage/storage';
import {
  boundMemoryProgress,
  MEMORY_AHEAD_MAX_MS,
  MEMORY_DUE_SPAN_MS,
  MEMORY_FULL_PULL_MS,
  MEMORY_PULL_MAX,
  memoryBounds,
  pushableMemoryValues,
} from '../domains/memory';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import { DEFAULT_DOMAINS } from '../registry';
import type { SyncDomains } from '../shapes';
import { syncStateKey } from '../state';
import type { MemoryDoc, MemoryPull } from '../types';
import { DOMAINS, iso, makeDevice, progressKey, setHighlight } from './fixtures';

const PROD_DOMAINS: SyncDomains = {
  ...DOMAINS,
  memory: { progress: memoryProgressKey, history: memoryHistoryKey },
  memoryVerses: DEFAULT_DOMAINS.memoryVerses,
};
const NOW = Date.parse('2026-11-03T12:00:00.000Z');
const HOUR = 3_600_000;
const DAY = 86_400_000;
const [V1, V2, V3] = getAllMemoryVerses().map((v) => v.id);

const row = (over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'review',
  successes: 12,
  failures: 1,
  masteryScore: 80,
  nextDueAt: iso(NOW + 2 * DAY),
  lastReviewedAt: iso(NOW - 2 * DAY),
  lapsedAt: null,
  ...over,
});

const doc = (deviceId: string, progress: ProgressMap = {}, completedDates: string[] = []): MemoryDoc => ({
  deviceId,
  progress,
  history: { startedOn: null, completedDates },
  updatedAt: NOW,
});

let remote: MemoryRemote;
/** Every pullMemory call: its `since` and what it returned. */
let pulls: { since: number | null | undefined; result: MemoryPull }[];
beforeEach(() => {
  remote = createMemoryRemote();
  pulls = [];
  const pull = remote.pullMemory.bind(remote);
  (remote as { pullMemory: MemoryRemote['pullMemory'] }).pullMemory = async (since) => {
    const result = await pull(since);
    pulls.push({ since, result });
    return result;
  };
});
const pushes = () => remote.calls.filter((c) => c === 'pushMemory').length;
const device = (id: string) => makeDevice(remote, id, { domains: PROD_DOMAINS, start: NOW });

describe('the nextDueAt bound (rule 24)', () => {
  const b = memoryBounds(NOW, MEMORY_AHEAD_MAX_MS);

  test('every schedule the scheduler can write is within it, at the longest interval and the widest day end', () => {
    let r: VerseProgress | undefined;
    let t = NOW;
    // Pass on every due date until mastery 100, each with the day end 36 h out (the scheduler's clamp).
    for (let i = 0; i < 8; i++) {
      r = recordAttempt(r, true, new Date(t), t + 40 * HOUR);
      expect(boundMemoryProgress({ [V1!]: r }, memoryBounds(t, MEMORY_AHEAD_MAX_MS))[V1!]).toBe(r);
      t = Date.parse(r.nextDueAt!);
    }
    expect(r!.masteryScore).toBe(100);
    // A pass on a verse not due keeps the earlier date, which stays within the bound of the newer review.
    const early = recordAttempt(r, true, new Date(t - 3 * DAY), t - 3 * DAY);
    expect(early.nextDueAt).toBe(r!.nextDueAt);
    expect(boundMemoryProgress({ [V1!]: early }, memoryBounds(t, MEMORY_AHEAD_MAX_MS))[V1!]).toBe(early);
  });

  test('a row due further from its review than the longest interval allows is ignored, and never pushed', () => {
    const reviewed = NOW - DAY;
    const ok = row({ lastReviewedAt: iso(reviewed), nextDueAt: iso(reviewed + MEMORY_DUE_SPAN_MS) });
    const far = row({ lastReviewedAt: iso(reviewed), nextDueAt: iso(reviewed + MEMORY_DUE_SPAN_MS + 1) });
    expect(Object.keys(boundMemoryProgress({ [V1!]: ok, [V2!]: far }, b))).toEqual([V1]);
    const pushed = pushableMemoryValues({ progress: { [V1!]: ok, [V2!]: far }, history: { startedOn: null, completedDates: [] } }, NOW, HOUR);
    expect(Object.keys(pushed.progress)).toEqual([V1]);
  });

  test('a row never reviewed may be due at most the same span past now', () => {
    const ok = row({ lastReviewedAt: null, nextDueAt: iso(NOW + MEMORY_DUE_SPAN_MS) });
    const far = row({ lastReviewedAt: null, nextDueAt: '9999-12-31T23:59:59.999Z' });
    expect(Object.keys(boundMemoryProgress({ [V1!]: ok, [V2!]: far, [V3!]: row({ lastReviewedAt: null, nextDueAt: null }) }, b)).sort()).toEqual(
      [V1, V3].sort(),
    );
  });
});

describe('incremental Memory pulls (rule 25)', () => {
  test('the first sync pulls in full; later ones pull only what was written since, and the cursor moves on', async () => {
    remote.putMemory(doc('devB', { [V1!]: row() }));
    const a = device('devA');
    await a.engine.syncNow();
    expect(pulls[0]!.since).toBeNull();
    const cursor = a.storage.get(syncStateKey('alice')).memory!.cursor;
    expect(cursor).not.toBeNull();

    remote.putMemory(doc('devC', { [V2!]: row() }));
    await a.engine.syncNow();
    expect(pulls[1]!.since).toBe(cursor);
    // devA's own document (its first push) and devC's: not devB's again.
    expect(pulls[1]!.result.map((d) => d.deviceId).sort()).toEqual(['devA', 'devC']);
    expect(Object.keys(a.storage.get(memoryProgressKey)).sort()).toEqual([V1, V2].sort());

    await a.engine.syncNow();
    expect(pulls[2]!.result.map((d) => d.deviceId)).toEqual(['devA']); // its second push (it took devC's verse)
    await a.engine.syncNow();
    expect(pulls[3]!.result).toEqual([]);
  });

  test(`a pull cut short at ${MEMORY_PULL_MAX} documents skips nothing: the next one goes on from there`, async () => {
    const a = device('devA');
    await a.engine.syncNow();
    await a.engine.syncNow(); // the first pull found nothing, so this one is full too: it finds A's document
    expect(a.storage.get(syncStateKey('alice')).memory!.cursor).not.toBeNull();
    // Written after A's cursor, oldest first: an honest device, a crowd of documents, another honest device.
    remote.putMemory(doc('devB', { [V1!]: row() }, ['2026-11-01']));
    for (let i = 0; i < MEMORY_PULL_MAX + 5; i++) remote.putMemory(doc(`crowd${String(i).padStart(15, '0')}`));
    remote.putMemory(doc('devC', { [V2!]: row() }, ['2026-11-02']));
    await a.engine.syncNow();
    expect(pulls[pulls.length - 1]!.result).toHaveLength(MEMORY_PULL_MAX);
    expect(Object.keys(a.storage.get(memoryProgressKey))).toEqual([V1]);
    await a.engine.syncNow();
    expect(Object.keys(a.storage.get(memoryProgressKey)).sort()).toEqual([V1, V2].sort());
    expect(a.storage.get(memoryHistoryKey).completedDates).toEqual(['2026-11-01', '2026-11-02']);
  });

  test('a document the device cannot store is ignored once: the cursor moves past it', async () => {
    const a = device('devA');
    remote.putMemory({ ...doc('devZ'), history: { startedOn: 'yesterday', completedDates: ['nope'] }, progress: 'x' as never });
    await a.engine.syncNow();
    expect(pulls[0]!.result.map((d) => d.deviceId)).toEqual(['devZ']);
    await a.engine.syncNow();
    expect(pulls[1]!.result.map((d) => d.deviceId)).not.toContain('devZ');
  });

  test('a row skipped for the clock bound is joined by the next full pull, a day later', async () => {
    const ahead = row({ lastReviewedAt: iso(NOW + 30 * HOUR), nextDueAt: iso(NOW + 40 * HOUR) });
    remote.putMemory(doc('devB', { [V1!]: ahead }));
    const a = device('devA');
    await a.engine.syncNow();
    expect(a.storage.get(memoryProgressKey)[V1!]).toBeUndefined();
    a.tick(8 * HOUR); // now within a day of the row, but an incremental pull does not read devB's document again
    await a.engine.syncNow();
    expect(pulls[pulls.length - 1]!.since).not.toBeNull();
    expect(a.storage.get(memoryProgressKey)[V1!]).toBeUndefined();
    a.tick(MEMORY_FULL_PULL_MS);
    await a.engine.syncNow();
    expect(pulls[pulls.length - 1]!.since).toBeNull();
    expect(a.storage.get(memoryProgressKey)[V1!]).toEqual(ahead);
  });

  test('a full pull that does not find this device’s document (crowded out of the newest) sends it again', async () => {
    const a = device('devA');
    a.storage.set(memoryProgressKey, { [V1!]: row() });
    await a.engine.syncNow();
    await a.engine.syncNow();
    expect(pushes()).toBe(1);
    for (let i = 0; i < MEMORY_PULL_MAX; i++) remote.putMemory(doc(`crowd${String(i).padStart(15, '0')}`));
    a.tick(MEMORY_FULL_PULL_MS);
    await a.engine.syncNow(); // full: the newest MEMORY_PULL_MAX are the crowd
    expect(pushes()).toBe(2);
    // A new device's first (full) pull now finds it.
    const n = device('devN');
    await n.engine.syncNow();
    expect(n.storage.get(memoryProgressKey)[V1!]).toEqual(row());
  });
});

describe('this device’s own document (rule 25)', () => {
  test('repaired once after another client overwrites it, then left alone', async () => {
    const a = device('devA');
    a.storage.set(memoryProgressKey, { [V1!]: row() });
    await a.engine.syncNow();
    await a.engine.syncNow();
    expect(pushes()).toBe(1);
    remote.putMemory(doc('devA', { [V1!]: row({ masteryScore: 0, stage: 'chunk_order' }) }));
    await a.engine.syncNow();
    expect(pushes()).toBe(2);
    expect(remote.memory.get('devA')!.progress[V1!]).toEqual(row());
    for (let i = 0; i < 3; i++) await a.engine.syncNow();
    expect(pushes()).toBe(2);
  });

  test('rows a pull ignores (unknown verse, too far ahead) do not make it push on every sync', async () => {
    const a = device('devA');
    // Local values a pull would not take from any document: a verse the library does not know.
    a.storage.set(memoryProgressKey, { [V1!]: row(), 'not-a-library-verse': row() });
    await a.engine.syncNow();
    for (let i = 0; i < 3; i++) await a.engine.syncNow();
    expect(pushes()).toBe(1);
  });
});

describe('a Memory write that fails (web storage full)', () => {
  /** A backend whose Memory progress writes throw while `full` is set. */
  function fullBackend(): KeyValueBackend & { full: boolean } {
    const inner = memoryBackend();
    const b = {
      full: false,
      getString: inner.getString,
      remove: inner.remove,
      set(key: string, value: string) {
        if (b.full && key === memoryProgressKey.key) throw new DOMException('The quota has been exceeded.', 'QuotaExceededError');
        inner.set(key, value);
      },
    };
    return b;
  }

  test('still commits and pushes the other domains; Memory pulls the same documents again and catches up', async () => {
    const backend = fullBackend();
    const storage = createStorage(backend);
    const a = makeDevice(remote, 'devA', { domains: PROD_DOMAINS, start: NOW, storage });
    remote.putMemory(doc('devB', { [V1!]: row() }, ['2026-11-02']));
    setHighlight(storage, '43:3:16', 'yellow', NOW - 1000);
    storage.set(appearanceKey, { preset: 'silver', mode: 'light' } as never);
    storage.set(progressKey, { ...progressKey.fallback, goalMetDays: ['2026-11-02'] });
    backend.full = true;

    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('error');
    // Study items, the setting and this device's reading progress all went out.
    expect(remote.items.has('highlight:43:3:16')).toBe(true);
    expect(remote.settings.has('appearance')).toBe(true);
    expect(remote.devices.get('devA')?.goalMetDays).toEqual(['2026-11-02']);
    // Memory: not pushed; the history key (another key) still joined; no journal left; the cursor did not move.
    expect(remote.memory.has('devA')).toBe(false);
    expect(storage.get(memoryHistoryKey).completedDates).toEqual(['2026-11-02']);
    const state = storage.get(syncStateKey('alice'));
    expect(state.journal).toBeNull();
    expect(state.memory?.cursor ?? null).toBeNull();

    backend.full = false;
    const itemPushes = remote.calls.filter((c) => c === 'pushItems').length;
    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('idle');
    expect(pulls[pulls.length - 1]!.result.map((d) => d.deviceId)).toContain('devB');
    expect(storage.get(memoryProgressKey)[V1!]).toEqual(row());
    expect(remote.memory.get('devA')!.progress[V1!]).toEqual(row());
    expect(remote.calls.filter((c) => c === 'pushItems').length).toBe(itemPushes); // the item is not sent again
  });
});
