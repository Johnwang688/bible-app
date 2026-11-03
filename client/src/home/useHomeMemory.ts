// What Home's Memory card shows: today's Memory lesson, read through Memory's own hooks (read-only: Home never
// changes Memory's data beyond what opening today's lesson does on Memory's home too).
import { useCallback } from 'react';

import { getMemoryVerse, TOTAL_VERSES } from '../memory/library';
import { createMemoryStore, useMemoryProgress } from '../memory/memoryStore';
import { stepHref } from '../memory/session';
import { useTodayLesson } from '../memory/ui/home/useTodayLesson';
import { useMemorySettings } from '../memory/useMemorySettings';
import { learnedCount } from '../memory/view';
import type { AppLocale } from '../i18n/types';
import type { Storage } from '../storage/storage';

/** Where the Memory card's Week button goes: the streak and the last weeks, in the Study tab's stack. */
export const MEMORY_WEEK_HREF = '/study/memory/week';

export type HomeMemoryState =
  | { kind: 'start' | 'continue'; reference: string; step: number; total: number; href: string }
  | { kind: 'done'; reference: string };

export interface HomeMemory {
  learned: number;
  total: number;
  state: HomeMemoryState;
  /**
   * Where a press on the card goes, worked out at the press from storage and the clock: a step finished since the
   * last render, or a midnight not yet noticed, must not send the reader to a stale step (the R-4 Surprise me rule).
   */
  target(): string;
}

/**
 * Today's lesson as one line: the verse the next step is on (the lesson's first verse once every step is done), the
 * step Start / Continue opens ("Step 1 of 4" again after a skipped first step), and where it goes. The reference is
 * in the app's language; in Chinese it follows Memory's script setting, as Memory's own screens do. It is '' for a
 * verse the library no longer has.
 */
export function useHomeMemory(storage: Storage, now: () => Date, locale: AppLocale): HomeMemory {
  const lesson = useTodayLesson(storage, now);
  const [progress] = useMemoryProgress(storage);
  const [settings] = useMemorySettings(storage);

  const steps = lesson.lesson.steps;
  const shownStep = lesson.allDone ? steps[0] : steps[lesson.firstIncomplete];
  const verse = shownStep ? getMemoryVerse(shownStep.verseId) : undefined;
  const reference = !verse
    ? ''
    : locale === 'en'
      ? verse.referenceEn
      : settings.script === 'traditional'
        ? verse.referenceZhHant
        : verse.referenceZh;

  let state: HomeMemoryState;
  if (lesson.allDone || lesson.href === null) {
    state = { kind: 'done', reference };
  } else {
    state = {
      kind: lesson.done === 0 ? 'start' : 'continue',
      reference,
      step: lesson.firstIncomplete + 1,
      total: lesson.total,
      href: lesson.href,
    };
  }
  // Memory's own write-through: today's stored plan, or today's opened now (never an older day's).
  const target = useCallback(() => {
    const current = createMemoryStore(storage).todayLesson(now());
    const items = current.steps.map((s) => ({ verseId: s.verseId, stage: s.stage }));
    const next = current.steps.findIndex((s) => s.completedAt === null);
    return (next === -1 ? null : stepHref(items, next)) ?? MEMORY_WEEK_HREF;
  }, [storage, now]);

  return { learned: learnedCount(progress), total: TOTAL_VERSES, state, target };
}
