import { memoryHistoryKey, memoryLessonKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import type { DailyLessonRecord } from '../dailyLesson';
import { createMemoryStore } from '../memoryStore';
import { nextHrefAfter, stepHref } from '../session';
import { getVoiceSession, recordVoiceOutcome, resetVoiceSessionForTesting, subscribeVoiceSession, voiceGate } from '../voice/availability';
import type { VoiceGateInput } from '../voice/types';

const READY: VoiceGateInput = {
  voiceOn: true, supported: true, signedIn: true, online: true, serviceDown: false,
  limitedUntil: null, now: 1000, permission: 'prompt',
};

it('uses the first failing gate for every combination and lifts limits exactly at the deadline', () => {
  const notices = ['voice-off', 'unsupported', 'signed-out', 'offline', 'no-service', 'limit', 'denied'];
  for (let bits = 0; bits < 128; bits++) {
    const failures = Array.from({ length: 7 }, (_, i) => !!(bits & (1 << i)));
    const input: VoiceGateInput = {
      ...READY, voiceOn: !failures[0], supported: !failures[1], signedIn: !failures[2], online: !failures[3],
      serviceDown: failures[4]!, limitedUntil: failures[5] ? READY.now + 1 : null,
      permission: failures[6] ? 'denied' : 'granted',
    };
    const failed = failures.indexOf(true);
    expect(voiceGate(input)).toEqual(failed < 0 ? { kind: 'ready' }
      : { kind: 'notice', notice: notices[failed], ...(failed === 5 ? { retryAfterS: 1 } : {}) });
  }
  for (const remaining of [1, 999, 1000, 1001, 86399999]) {
    expect(voiceGate({ ...READY, limitedUntil: READY.now + remaining }))
      .toEqual({ kind: 'notice', notice: 'limit', retryAfterS: Math.ceil(remaining / 1000) });
  }
  for (const remaining of [0, -1]) expect(voiceGate({ ...READY, limitedUntil: READY.now + remaining })).toEqual({ kind: 'ready' });
});

it('notifies session subscribers only on changes, preserves snapshots and respects unsubscription', () => {
  resetVoiceSessionForTesting();
  const before = getVoiceSession();
  const listener = jest.fn();
  const unsubscribe = subscribeVoiceSession(listener);
  try {
    recordVoiceOutcome({ kind: 'text', text: '神' }, 0);
    expect(getVoiceSession()).toBe(before);
    expect(listener).not.toHaveBeenCalled();
    recordVoiceOutcome({ kind: 'limit', retryAfterS: 1, window: 'minute' }, 1000);
    const limited = getVoiceSession();
    expect(limited).not.toBe(before);
    expect(before).toEqual({ serviceDown: false, limitedUntil: null });
    expect(listener).toHaveBeenCalledTimes(1);
    recordVoiceOutcome({ kind: 'limit', retryAfterS: 1, window: 'minute' }, 1000);
    expect(getVoiceSession()).toBe(limited);
    expect(listener).toHaveBeenCalledTimes(1);
    expect(voiceGate({ ...READY, ...limited, now: 2000 })).toEqual({ kind: 'ready' });
    recordVoiceOutcome({ kind: 'no-service' }, 2000);
    expect(listener).toHaveBeenCalledTimes(2);
    recordVoiceOutcome({ kind: 'no-service' }, 2001);
    expect(listener).toHaveBeenCalledTimes(2);
    unsubscribe();
    recordVoiceOutcome({ kind: 'limit', retryAfterS: 61, window: 'day' }, 3000);
    expect(listener).toHaveBeenCalledTimes(2);
  } finally { unsubscribe(); resetVoiceSessionForTesting(); }
});

it('navigates to the first later incomplete step for every six-step completion pattern', () => {
  const ids = ['2-corinthians-5-17', 'galatians-2-20'];
  for (let mask = 0; mask < 64; mask++) {
    const lesson: DailyLessonRecord = {
      date: '2026-11-02', completedAt: null,
      steps: Array.from({ length: 6 }, (_, i) => ({
        verseId: ids[i % 2]!, stage: 'chunk-order', completedAt: mask & (1 << i) ? '2026-11-02T12:00:00.000Z' : null,
      })),
    };
    const before = JSON.stringify(lesson);
    expect(nextHrefAfter(lesson, null)).toBe('/study/memory');
    for (let i = 0; i < 6; i++) {
      const next = lesson.steps.findIndex((step, j) => j > i && step.completedAt === null);
      expect(nextHrefAfter(lesson, i)).toBe(next < 0 ? '/memory/complete' : stepHref(lesson.steps, next));
    }
    expect(JSON.stringify(lesson)).toBe(before);
  }
  expect(nextHrefAfter(null, 0)).toBe('/study/memory');
  expect(nextHrefAfter({ date: '2026-11-02', steps: [], completedAt: null }, 0)).toBe('/memory/complete');
});

it.each(['progress', 'lesson', 'history'])('keeps the earlier startedOn and nested completion across a %s notification', (phase) => {
  const storage = createStorage(memoryBackend());
  const store = createMemoryStore(storage);
  const firstVerse = '2-corinthians-5-17';
  const secondVerse = 'galatians-2-20';
  const now = new Date(2026, 10, 2, 23, 59, 59, 999);
  const later = new Date(now.getTime() + 1);
  storage.set(memoryLessonKey, {
    date: '2026-11-02', steps: [{ verseId: firstVerse, stage: 'chunk-order', completedAt: null }], completedAt: null,
  });
  let unsubscribe = () => {};
  const nested = () => {
    unsubscribe();
    storage.set(memoryLessonKey, {
      date: '2026-11-03', steps: [{ verseId: secondVerse, stage: 'chunk-order', completedAt: null }], completedAt: null,
    });
    store.submitStep({ index: 0, verseId: secondVerse, stage: 'chunk-order', passed: true, now: later });
  };
  unsubscribe = phase === 'progress' ? storage.subscribe(memoryProgressKey, nested)
    : phase === 'lesson' ? storage.subscribe(memoryLessonKey, nested) : storage.subscribe(memoryHistoryKey, nested);
  try {
    store.submitStep({ index: 0, verseId: firstVerse, stage: 'chunk-order', passed: true, now });
    expect(storage.get(memoryHistoryKey)).toEqual({
      startedOn: '2026-11-02', completedDates: phase === 'progress' ? ['2026-11-03'] : ['2026-11-02', '2026-11-03'],
    });
    expect(storage.get(memoryProgressKey)[firstVerse]?.successes).toBe(1);
    expect(storage.get(memoryProgressKey)[secondVerse]?.successes).toBe(1);
    expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-03');
    expect(storage.get(memoryLessonKey)?.completedAt).toBe(later.toISOString());
  } finally { unsubscribe(); }
});

it('never moves startedOn later across year boundaries or repeated attempts', () => {
  const storage = createStorage(memoryBackend());
  const store = createMemoryStore(storage);
  for (const now of [new Date(2026, 0, 1, 12), new Date(2027, 0, 1, 12), new Date(2025, 11, 31, 12), new Date(2028, 0, 1, 12)]) {
    const before = storage.get(memoryHistoryKey).startedOn;
    store.submitStep({ index: null, verseId: '2-corinthians-5-17', stage: 'chunk-order', passed: false, now });
    const after = storage.get(memoryHistoryKey).startedOn!;
    if (before !== null) expect(after <= before).toBe(true);
  }
  expect(storage.get(memoryHistoryKey).startedOn).toBe('2025-12-31');
});