// Acceptance (orchestrator-owned): the day's lesson and the streak, ported from Little Lamb's
// start_daily_lesson / complete_lesson_step / daily_lesson_streak (migration 0003) and
// daily-completion.ts, to run on the device.
import {
  completeLessonStep,
  currentWeekDates,
  dailyStreak,
  startDailyLesson,
  type DailyLessonRecord,
} from '../dailyLesson';
import { weekStrip } from '../dailyLesson';
import { MAX_LESSON_STEPS } from '../lessonPlan';
import type { ProgressMap } from '../types';

const now = new Date(2026, 10, 4, 8, 0); // Wed 4 Nov 2026, 08:00 local
const later = new Date(2026, 10, 4, 21, 0);

const BEGINNER_STEPS = [
  { verseId: '2-corinthians-5-17', stage: 'chunk-order', completedAt: null },
  { verseId: '2-corinthians-5-17', stage: 'fill-blank', completedAt: null },
  { verseId: 'galatians-2-20', stage: 'chunk-order', completedAt: null },
  { verseId: 'galatians-2-20', stage: 'fill-blank', completedAt: null },
];

describe('startDailyLesson', () => {
  it('builds a new reader the beginner plan for today', () => {
    expect(startDailyLesson(null, {}, now)).toEqual({ date: '2026-11-04', steps: BEGINNER_STEPS, completedAt: null });
  });

  it('freezes the plan for the day: a later open returns it unchanged even after progress moved', () => {
    const first = startDailyLesson(null, {}, now);
    const moved: ProgressMap = {
      '2-corinthians-5-17': {
        stage: 'review', successes: 5, failures: 0, masteryScore: 60,
        nextDueAt: null, lastReviewedAt: null, lapsedAt: null,
      },
    };
    expect(startDailyLesson(first, moved, later)).toEqual(first);
  });

  it('plans afresh on a new day', () => {
    const old: DailyLessonRecord = { date: '2026-11-03', steps: [], completedAt: null };
    expect(startDailyLesson(old, {}, now).date).toBe('2026-11-04');
    expect(startDailyLesson(old, {}, now).steps).toEqual(BEGINNER_STEPS);
  });

  it('never plans more than MAX_LESSON_STEPS steps', () => {
    expect(startDailyLesson(null, {}, now).steps.length).toBeLessThanOrEqual(MAX_LESSON_STEPS);
  });
});

describe('completeLessonStep', () => {
  const lesson = () => startDailyLesson(null, {}, now);

  it('records a matching step', () => {
    const before = lesson();
    const copy = JSON.parse(JSON.stringify(before));
    const out = completeLessonStep(before, 1, '2-corinthians-5-17', 'fill-blank', now);
    expect(out.recorded).toBe(true);
    expect(out.dayCompleted).toBe(false);
    expect(out.lesson.steps[1].completedAt).toBe(now.toISOString());
    expect(out.lesson.steps.filter((s) => s.completedAt).length).toBe(1);
    expect(out.lesson.completedAt).toBeNull();
    expect(before).toEqual(copy);
  });

  it.each([
    ['wrong verse', 1, 'galatians-2-20', 'fill-blank'],
    ['wrong stage', 1, '2-corinthians-5-17', 'chunk-order'],
    ['index past the end', 4, 'galatians-2-20', 'fill-blank'],
    ['negative index', -1, '2-corinthians-5-17', 'chunk-order'],
    ['fractional index', 0.5, '2-corinthians-5-17', 'chunk-order'],
  ] as const)('records nothing for a %s', (_label, index, verseId, stage) => {
    const before = lesson();
    const out = completeLessonStep(before, index, verseId, stage, now);
    expect(out.recorded).toBe(false);
    expect(out.dayCompleted).toBe(false);
    expect(out.lesson).toEqual(before);
  });

  it('completes the day once every step is done, and keeps the first timestamps', () => {
    let l = lesson();
    BEGINNER_STEPS.forEach((s, i) => {
      const out = completeLessonStep(l, i, s.verseId, s.stage as 'chunk-order' | 'fill-blank', now);
      expect(out.dayCompleted).toBe(i === BEGINNER_STEPS.length - 1);
      l = out.lesson;
    });
    expect(l.completedAt).toBe(now.toISOString());
    const again = completeLessonStep(l, 0, '2-corinthians-5-17', 'chunk-order', later);
    expect(again.recorded).toBe(true);
    expect(again.dayCompleted).toBe(true);
    expect(again.lesson.steps[0].completedAt).toBe(now.toISOString());
    expect(again.lesson.completedAt).toBe(now.toISOString());
  });
});

describe('dailyStreak (daily_lesson_streak)', () => {
  it('counts back from today when today is done', () => {
    expect(dailyStreak(['2026-11-04', '2026-11-03', '2026-11-02', '2026-10-31'], '2026-11-04')).toBe(3);
  });
  it('counts back from yesterday while today is not done yet', () => {
    expect(dailyStreak(['2026-11-03', '2026-11-02'], '2026-11-04')).toBe(2);
  });
  it('is 0 when neither today nor yesterday is done', () => {
    expect(dailyStreak(['2026-11-02', '2026-11-01'], '2026-11-04')).toBe(0);
    expect(dailyStreak([], '2026-11-04')).toBe(0);
  });
  it('crosses month and year boundaries and ignores duplicates and order', () => {
    expect(dailyStreak(['2026-01-01', '2025-12-31', '2026-01-01', '2025-12-30'], '2026-01-01')).toBe(3);
    expect(dailyStreak(['2026-03-01', '2026-02-28'], '2026-03-01')).toBe(2);
  });
});

describe('the week strip', () => {
  it('currentWeekDates runs Sunday to Saturday around today', () => {
    expect(currentWeekDates(now)).toEqual([
      '2026-11-01', '2026-11-02', '2026-11-03', '2026-11-04', '2026-11-05', '2026-11-06', '2026-11-07',
    ]);
    expect(currentWeekDates(new Date(2026, 10, 1, 0, 5))[0]).toBe('2026-11-01');
    expect(currentWeekDates(new Date(2026, 10, 7, 23, 55))[6]).toBe('2026-11-07');
  });

  it('marks done, missed, today, future and the days before the reader started', () => {
    expect(weekStrip(['2026-11-03'], now, '2026-11-02').map((d) => d.state)).toEqual([
      'before-start', 'missed', 'done', 'today', 'future', 'future', 'future',
    ]);
    expect(weekStrip(['2026-11-03'], now, '2026-11-02').map((d) => d.date)).toEqual(currentWeekDates(now));
  });

  it('shows today as done once it is completed, and past gaps as missed without a start date', () => {
    expect(weekStrip(['2026-11-04'], now, null).map((d) => d.state)).toEqual([
      'missed', 'missed', 'missed', 'done', 'future', 'future', 'future',
    ]);
  });
});
