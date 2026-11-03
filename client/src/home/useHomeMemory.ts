// What Home's Memory card shows: today's Memory lesson, read through Memory's own hooks (read-only: Home never
// changes Memory's data beyond what opening today's lesson does on Memory's home too).
import { getMemoryVerse, TOTAL_VERSES } from '../memory/library';
import { useMemoryProgress } from '../memory/memoryStore';
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
  return { learned: learnedCount(progress), total: TOTAL_VERSES, state };
}
