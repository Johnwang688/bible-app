// Acceptance (orchestrator-owned): the daily goal, as pure rules over the stored reading progress.
import { readingProgressKey, MAX_GOAL_MINUTES, MIN_GOAL_MINUTES, type ReadingProgress } from '../../storage/keys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { clampGoal, GOAL_CHOICES, GOAL_STEP, setDailyGoal, stepGoal } from '../goal';

const TODAY = '2026-11-04';
const min = (n: number) => n * 60_000;

function storageWith(p: Partial<ReadingProgress>): Storage {
  const s = createStorage(memoryBackend());
  s.set(readingProgressKey, { ...s.get(readingProgressKey), ...p });
  return s;
}

describe('clampGoal', () => {
  it('rounds to the nearest 5 and keeps it within 5–120', () => {
    expect(GOAL_STEP).toBe(5);
    expect(MIN_GOAL_MINUTES).toBe(5);
    expect(MAX_GOAL_MINUTES).toBe(120);
    expect(clampGoal(10)).toBe(10);
    expect(clampGoal(12)).toBe(10);
    expect(clampGoal(13)).toBe(15);
    expect(clampGoal(0)).toBe(5);
    expect(clampGoal(-40)).toBe(5);
    expect(clampGoal(500)).toBe(120);
    expect(clampGoal(Number.NaN)).toBe(10);
    expect(clampGoal(Number.POSITIVE_INFINITY)).toBe(10);
  });
});

describe('stepGoal', () => {
  it('moves by one step and stops at the ends', () => {
    expect(stepGoal(10, 1)).toBe(15);
    expect(stepGoal(10, -1)).toBe(5);
    expect(stepGoal(5, -1)).toBe(5);
    expect(stepGoal(120, 1)).toBe(120);
  });
});

describe('GOAL_CHOICES', () => {
  it('are valid goals in increasing order, and include the default', () => {
    expect(GOAL_CHOICES.length).toBeGreaterThanOrEqual(4);
    expect([...GOAL_CHOICES].sort((a, b) => a - b)).toEqual([...GOAL_CHOICES]);
    for (const c of GOAL_CHOICES) expect(clampGoal(c)).toBe(c);
    expect(GOAL_CHOICES).toContain(10);
  });
});

describe('setDailyGoal', () => {
  it('stores the clamped goal and keeps everything else', () => {
    const s = storageWith({ activeMs: { '2026-11-03': min(3) }, chaptersRead: { '43:3': 'x' } });
    setDailyGoal(s, 22, TODAY);
    const p = s.get(readingProgressKey);
    expect(p.goalMinutes).toBe(20);
    expect(p.activeMs).toEqual({ '2026-11-03': min(3) });
    expect(p.chaptersRead).toEqual({ '43:3': 'x' });
    expect(p.goalMetDays).toEqual([]);
  });

  it('lowering the goal to what was already read today counts today as met', () => {
    const s = storageWith({ goalMinutes: 20, activeMs: { [TODAY]: min(12) }, goalMetDays: ['2026-11-05', '2026-11-01'].sort() });
    setDailyGoal(s, 10, TODAY);
    expect(s.get(readingProgressKey).goalMetDays).toEqual(['2026-11-01', TODAY, '2026-11-05']);
  });

  it('raising the goal never takes away a day already met', () => {
    const s = storageWith({ goalMinutes: 10, activeMs: { [TODAY]: min(11) }, goalMetDays: [TODAY] });
    setDailyGoal(s, 30, TODAY);
    const p = s.get(readingProgressKey);
    expect(p.goalMinutes).toBe(30);
    expect(p.goalMetDays).toEqual([TODAY]);
  });

  it('does not count today when less was read than the new goal, and never repeats a day', () => {
    const s = storageWith({ goalMinutes: 20, activeMs: { [TODAY]: min(4) } });
    setDailyGoal(s, 5, TODAY);
    expect(s.get(readingProgressKey).goalMetDays).toEqual([]);
    const t = storageWith({ goalMinutes: 20, activeMs: { [TODAY]: min(6) }, goalMetDays: [TODAY] });
    setDailyGoal(t, 5, TODAY);
    expect(t.get(readingProgressKey).goalMetDays).toEqual([TODAY]);
  });

  it('reads the latest stored progress, so it never undoes a write made since the caller rendered', () => {
    const s = storageWith({ goalMinutes: 10 });
    const before = s.get(readingProgressKey);
    s.set(readingProgressKey, { ...before, activeMs: { [TODAY]: min(7) } });
    setDailyGoal(s, 15, TODAY);
    expect(s.get(readingProgressKey).activeMs).toEqual({ [TODAY]: min(7) });
  });

  it('writes nothing when nothing changes', () => {
    const s = storageWith({ goalMinutes: 15 });
    const set = jest.spyOn(s, 'set');
    setDailyGoal(s, 15, TODAY);
    expect(set).not.toHaveBeenCalled();
  });
});
