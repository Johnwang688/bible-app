// Stage <-> trainer-slug mapping. Ported from Little Lamb's lesson-router.ts
// (`stageDisplayName` is dropped: the UI maps stages to catalogue strings).
import type { LearnStage, StageSlug } from './types';

const STAGE_SLUGS: readonly string[] = ['chunk-order', 'fill-blank', 'full-recall'];

/** Is `s` the slug of a trainer? */
export function isStageSlug(s: string): s is StageSlug {
  return STAGE_SLUGS.includes(s);
}

/**
 * Map a stored progress stage to the URL slug whose trainer the user should
 * see next. Verses already in `review` rotate through `full-recall`: the
 * hardest test, closest to "still know it from memory".
 */
export function stageToSlug(stage: LearnStage): StageSlug {
  switch (stage) {
    case 'chunk_order':
      return 'chunk-order';
    case 'fill_blank':
      return 'fill-blank';
    case 'full_recall':
    case 'review':
      return 'full-recall';
  }
}

/** Inverse of stageToSlug: used by trainers to know which stage they're completing. */
export function slugToStage(slug: StageSlug): Exclude<LearnStage, 'review'> {
  switch (slug) {
    case 'chunk-order':
      return 'chunk_order';
    case 'fill-blank':
      return 'fill_blank';
    case 'full-recall':
      return 'full_recall';
  }
}

/** Next stage after completing the given one, monotonically. */
export function nextStageAfter(slug: StageSlug): LearnStage {
  switch (slug) {
    case 'chunk-order':
      return 'fill_blank';
    case 'fill-blank':
      return 'full_recall';
    case 'full-recall':
      return 'review';
  }
}
