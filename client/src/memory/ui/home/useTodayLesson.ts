// Today's lesson as the home and the week read it: the stored plan (opened and stored on first use of a new day),
// its steps as trainer links, and where the reader stands in it.
import { useEffect, useState } from 'react';

import { memoryLessonKey } from '../../../storage/memoryKeys';
import { useStoredValue, type Storage } from '../../../storage/storage';
import type { DailyLessonRecord } from '../../dailyLesson';
import { toLocalDateString } from '../../localDate';
import { createMemoryStore } from '../../memoryStore';
import { stepHref } from '../../session';
import type { SessionItem } from '../../types';

export interface TodayLesson {
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

export function useTodayLesson(storage: Storage, now: () => Date): TodayLesson {
  const today = toLocalDateString(now());
  // The first read of a new day stores the plan. It is done once, here, not on every render.
  const [initial] = useState(() => createMemoryStore(storage).todayLesson(now()));
  const [stored] = useStoredValue(storage, memoryLessonKey);
  const current = stored !== null && stored.date === today ? stored : null;

  // The day rolled over while this was mounted: open the new day's plan (the write comes back through the hook).
  useEffect(() => {
    if (current === null) createMemoryStore(storage).todayLesson(now());
    // eslint-disable-next-line react-hooks/exhaustive-deps -- `now` is a fresh function each render; the date is what matters
  }, [storage, today, current === null]);

  const lesson = current ?? initial;
  const items = lesson.steps.map((s) => ({ verseId: s.verseId, stage: s.stage }));
  const done = lesson.steps.filter((s) => s.completedAt !== null).length;
  const firstIncomplete = lesson.steps.findIndex((s) => s.completedAt === null);
  return {
    lesson,
    items,
    done,
    total: items.length,
    firstIncomplete,
    allDone: firstIncomplete === -1,
    href: stepHref(items, firstIncomplete),
  };
}
