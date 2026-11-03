// Acceptance (MEM 3; orchestrator-owned, implementers may not edit): Memory progress and history sync across a
// user's devices (CONFLICTS.md "Memory"). Each device writes only its own Memory document; every device merges all
// of them in: per verse the newer review wins, completed days are a union, and the streak is read from the merged
// days (never synced as a number). The day's frozen lesson plan and the Memory settings stay on the device.
import { dailyStreak } from '../../memory/dailyLesson';
import type { ProgressMap, VerseProgress } from '../../memory/types';
import { memoryHistoryKey, memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import type { SyncDomains } from '../shapes';
import { DOMAINS, makeDevice } from './fixtures';

const MEM_DOMAINS: SyncDomains = { ...DOMAINS, memory: { progress: memoryProgressKey, history: memoryHistoryKey } };

let remote: MemoryRemote;
beforeEach(() => {
  remote = createMemoryRemote();
});

const device = (id: string) => makeDevice(remote, id, { domains: MEM_DOMAINS });

const row = (lastReviewedAt: string, over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'fill_blank',
  successes: 1,
  failures: 0,
  masteryScore: 20,
  nextDueAt: '2026-11-05T09:00:00.000Z',
  lastReviewedAt,
  lapsedAt: null,
  ...over,
});

async function synced(...devices: { engine: { syncNow(): Promise<void> } }[]) {
  for (const d of devices) await d.engine.syncNow();
}

test('one device’s progress and history reach a new device', async () => {
  const a = device('devA');
  const b = device('devB');
  const progress: ProgressMap = { 'john-3-16': row('2026-11-02T09:00:00.000Z', { stage: 'review', masteryScore: 70 }) };
  a.storage.set(memoryProgressKey, progress);
  a.storage.set(memoryHistoryKey, { startedOn: '2026-11-01', completedDates: ['2026-11-01', '2026-11-02'] });
  await synced(a, b);
  expect(b.storage.get(memoryProgressKey)).toEqual(progress);
  expect(b.storage.get(memoryHistoryKey)).toEqual({ startedOn: '2026-11-01', completedDates: ['2026-11-01', '2026-11-02'] });
});

test('each device writes only its own Memory document', async () => {
  const a = device('devA');
  const b = device('devB');
  a.storage.set(memoryProgressKey, { 'john-3-16': row('2026-11-02T09:00:00.000Z') });
  b.storage.set(memoryProgressKey, { 'romans-12-1': row('2026-11-02T10:00:00.000Z') });
  await synced(a, b, a);
  expect([...remote.memory.keys()].sort()).toEqual(['devA', 'devB']);
  expect(remote.memory.get('devA')!.deviceId).toBe('devA');
});

test('verses learned on two devices end up on both', async () => {
  const a = device('devA');
  const b = device('devB');
  a.storage.set(memoryProgressKey, { 'john-3-16': row('2026-11-02T09:00:00.000Z') });
  b.storage.set(memoryProgressKey, { 'romans-12-1': row('2026-11-02T10:00:00.000Z') });
  await synced(a, b, a);
  expect(Object.keys(a.storage.get(memoryProgressKey)).sort()).toEqual(['john-3-16', 'romans-12-1']);
  expect(b.storage.get(memoryProgressKey)).toEqual(a.storage.get(memoryProgressKey));
});

test('the same verse on two devices: the newer review wins on both', async () => {
  const a = device('devA');
  const b = device('devB');
  const older = row('2026-11-02T09:00:00.000Z', { stage: 'review', masteryScore: 80 });
  const newer = row('2026-11-03T09:00:00.000Z', { stage: 'full_recall', masteryScore: 40, lapsedAt: '2026-11-03T09:00:00.000Z' });
  a.storage.set(memoryProgressKey, { 'john-3-16': newer });
  b.storage.set(memoryProgressKey, { 'john-3-16': older });
  await synced(a, b, a);
  expect(a.storage.get(memoryProgressKey)['john-3-16']).toEqual(newer);
  expect(b.storage.get(memoryProgressKey)['john-3-16']).toEqual(newer);
});

test('history is a union: no day is lost, and the streak counts both devices’ days', async () => {
  const a = device('devA');
  const b = device('devB');
  a.storage.set(memoryHistoryKey, { startedOn: '2026-10-31', completedDates: ['2026-10-31', '2026-11-01'] });
  b.storage.set(memoryHistoryKey, { startedOn: '2026-11-02', completedDates: ['2026-11-02'] });
  await synced(a, b, a);
  for (const d of [a, b]) {
    const history = d.storage.get(memoryHistoryKey);
    expect(history).toEqual({ startedOn: '2026-10-31', completedDates: ['2026-10-31', '2026-11-01', '2026-11-02'] });
    expect(dailyStreak(history.completedDates, '2026-11-02')).toBe(3);
  }
});

test('the day’s lesson plan and the Memory settings never leave the device', async () => {
  const a = device('devA');
  const b = device('devB');
  const lesson = { date: '2026-11-02', steps: [{ verseId: 'john-3-16', stage: 'chunk-order' as const, completedAt: null }], completedAt: null };
  a.storage.set(memoryLessonKey, lesson);
  a.storage.set(memorySettingsKey, { speech: 'cantonese', script: 'traditional', voice: false, voiceConsent: true });
  a.storage.set(memoryProgressKey, { 'john-3-16': row('2026-11-02T09:00:00.000Z') });
  await synced(a, b);
  expect(b.storage.get(memoryLessonKey)).toBeNull();
  expect(b.storage.get(memorySettingsKey)).toEqual(memorySettingsKey.fallback);
  expect(JSON.stringify([...remote.memory.values()])).not.toMatch(/cantonese|traditional|voiceConsent|chunk-order/);
});

test('an attempt recorded while a sync is running is kept, and goes out on the next sync', async () => {
  const a = device('devA');
  const b = device('devB');
  b.storage.set(memoryProgressKey, { 'romans-12-1': row('2026-11-02T08:00:00.000Z') });
  await synced(b);
  a.storage.set(memoryProgressKey, { 'john-3-16': row('2026-11-02T09:00:00.000Z') });
  const held = remote.hold('pullMemory');
  const run = a.engine.syncNow();
  await held.started;
  const during = row('2026-11-02T09:30:00.000Z', { stage: 'review' });
  a.storage.set(memoryProgressKey, { ...a.storage.get(memoryProgressKey), 'john-3-16': during });
  held.release();
  await run;
  expect(a.storage.get(memoryProgressKey)['john-3-16']).toEqual(during);
  expect(a.storage.get(memoryProgressKey)['romans-12-1']).toBeDefined();
  await synced(a, b);
  expect(b.storage.get(memoryProgressKey)['john-3-16']).toEqual(during);
});

test('a remote Memory document the device cannot store is ignored, and the device’s own data stays', async () => {
  const a = device('devA');
  const mine = { 'john-3-16': row('2026-11-02T09:00:00.000Z') };
  a.storage.set(memoryProgressKey, mine);
  remote.putMemory({
    deviceId: 'devZ',
    // A stage the storage schema refuses.
    progress: { 'romans-12-1': { ...row('2026-11-02T09:00:00.000Z'), stage: 'mastered' as VerseProgress['stage'] } },
    history: { startedOn: '2026-11-01', completedDates: ['2026-11-01'] },
    updatedAt: 5,
  });
  await synced(a);
  expect(a.storage.get(memoryProgressKey)).toEqual(mine);
});

test('signing out keeps Memory on the device', async () => {
  const a = device('devA');
  const progress = { 'john-3-16': row('2026-11-02T09:00:00.000Z') };
  a.storage.set(memoryProgressKey, progress);
  await synced(a);
  await a.engine.stop();
  expect(a.storage.get(memoryProgressKey)).toEqual(progress);
});

test('with no Memory domain, the engine never touches Memory documents', async () => {
  const a = makeDevice(remote, 'devA');
  a.storage.set(memoryProgressKey, { 'john-3-16': row('2026-11-02T09:00:00.000Z') });
  await synced(a);
  expect(remote.memory.size).toBe(0);
  expect(remote.calls).not.toContain('pullMemory');
});
