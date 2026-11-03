// Today's lesson as the home and the week read it: the stored plan (opened and stored on first use of a new day),
// its steps as trainer links, and where the reader stands in it.
//
// Invariant: a plan is only ever written by todayLesson(now()) at the time of writing, so a stored plan is never
// replaced by an older day's. `startDailyLesson` keeps a stored record whose date is the clock's date unchanged, so
// such a write can only ever replace a plan for an earlier day. Nothing here stores a lesson held in React state or
// a ref, or calls todayLesson with a date read earlier (a screen's `date` may be a day behind while it waits for its
// midnight timer). The plan shown is derived from the stored value and the screen's date; when they disagree, an
// effect re-reads the clock, writes through todayLesson(now()) and moves the screen's date on to the clock's.
import { useEffect, useRef, useState } from 'react';

import { memoryLessonKey, memoryProgressKey } from '../../../storage/memoryKeys';
import { useStoredValue, type Storage } from '../../../storage/storage';
import { startDailyLesson, type DailyLessonRecord } from '../../dailyLesson';
import { endOfLocalDay, toLocalDateString } from '../../localDate';
import { createMemoryStore } from '../../memoryStore';
import { stepHref } from '../../session';
import type { SessionItem } from '../../types';

export interface TodayLesson {
  /** The clock as of the last local midnight, mount, or new day's plan seen in storage: what "today" is for the screen. */
  date: Date;
  lesson: DailyLessonRecord;
  items: SessionItem[];
  /** Steps ticked off. */
  done: number;
  total: number;
  /** Index of the first step not ticked, or -1 when every step is done. */
  firstIncomplete: number;
  allDone: boolean;
  /** Where Start / Continue goes: the first unfinished step; null when there is none. */
  href: string | null;
}

/** The latest `now`, for effects and timers (every clock read goes through the `now` prop). */
function useNowRef(now: () => Date) {
  const nowRef = useRef(now);
  useEffect(() => {
    nowRef.current = now;
  });
  return nowRef;
}

/**
 * The current time, held in state and moved on at each local midnight while mounted, so a screen left open past
 * midnight re-renders into the new day. One timer, set for the next midnight, re-set after it fires (or after the
 * date is moved on by `setDate`), cleared on unmount.
 */
function useLocalDateState(now: () => Date): [Date, (d: Date) => void] {
  const nowRef = useNowRef(now);
  const [date, setDate] = useState(() => now());
  useEffect(() => {
    const wait = Math.max(endOfLocalDay(date) + 1 - nowRef.current().getTime(), 0);
    const timer = setTimeout(() => setDate(nowRef.current()), wait);
    return () => clearTimeout(timer);
  }, [date, nowRef]);
  return [date, setDate];
}

export function useLocalDate(now: () => Date): Date {
  return useLocalDateState(now)[0];
}

export function useTodayLesson(storage: Storage, now: () => Date): TodayLesson {
  const nowRef = useNowRef(now);
  const [date, setDate] = useLocalDateState(now);
  const today = toLocalDateString(date);
  const [stored] = useStoredValue(storage, memoryLessonKey);
  const [progress] = useStoredValue(storage, memoryProgressKey);
  const storedDate = stored?.date ?? null;

  // The stored plan is not for the screen's day: no plan yet, yesterday's (midnight passed), or a newer day's stored
  // by another screen before this one's timer fired. Re-read the clock and write through todayLesson(now()): it
  // stores today's plan or keeps the stored one when it is today's, and never stores an older day's. If the clock
  // has moved past the screen's day, move the screen on (the timer is re-set from the new date).
  useEffect(() => {
    if (storedDate === today) return;
    const clock = nowRef.current();
    createMemoryStore(storage).todayLesson(clock);
    if (toLocalDateString(clock) !== today) setDate(clock);
  }, [storage, today, storedDate, nowRef, setDate]);

  // Any render (a practice result stored, history changed) re-reads the clock: past midnight, the screen moves on to
  // the new day now instead of waiting for its timer, which may run late (a backgrounded tab, a suspended app).
  useEffect(() => {
    const clock = nowRef.current();
    if (toLocalDateString(clock) !== today) setDate(clock);
  });

  // For rendering only (never stored): the stored plan when it is the screen's day, else what todayLesson would open
  // for it; the effect above stores the real one straight after this render.
  const lesson = stored !== null && stored.date === today ? stored : startDailyLesson(stored, progress, date);
  const items = lesson.steps.map((s) => ({ verseId: s.verseId, stage: s.stage }));
  const done = lesson.steps.filter((s) => s.completedAt !== null).length;
  const firstIncomplete = lesson.steps.findIndex((s) => s.completedAt === null);
  return {
    date,
    lesson,
    items,
    done,
    total: items.length,
    firstIncomplete,
    allDone: firstIncomplete === -1,
    href: stepHref(items, firstIncomplete),
  };
}
