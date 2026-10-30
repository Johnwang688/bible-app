import type { TutorialRect } from '@/features/reader/types';

/** Verse Tools tutorial always uses John 3 and this verse for the spotlight (same passage every time). */
export const TUTORIAL_VERSE_TOOLS_VERSE = 16;

export function boundsToTutorialRect(b: { top: number; left: number; width: number; height: number }): TutorialRect {
  return {
    top: `${Math.max(0, b.top)}px`,
    left: `${Math.max(0, b.left)}px`,
    width: `${Math.max(0, b.width)}px`,
    height: `${Math.max(0, b.height)}px`,
  };
}
