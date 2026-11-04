import { BREAKPOINT, COLUMN } from '../components/layout';

export interface ReaderColumn { columnWidth: number; left: number; arrows: 'beside' | 'header' | 'row' }

/** Shared geometry for text, header and player; dock includes the panel's outer inset. */
export function readerColumn({ width, rail, dock, parallel }: { width: number; rail: number; dock: number; parallel: boolean }): ReaderColumn {
  if (width < BREAKPOINT.rail) {
    const columnWidth = Math.min(parallel ? COLUMN.parallel : COLUMN.text, width - (parallel && width >= BREAKPOINT.tablet ? 80 : 44));
    return { columnWidth, left: (width - columnWidth) / 2,
      arrows: width >= BREAKPOINT.tablet && !parallel && (width - COLUMN.text) / 2 >= 64 ? 'beside' : 'row' };
  }
  const space = width - rail - dock;
  const columnWidth = Math.min(parallel ? COLUMN.parallel : COLUMN.text, space - 48);
  return { columnWidth, left: rail + (space - columnWidth) / 2, arrows: (space - columnWidth) / 2 >= 64 ? 'beside' : 'header' };
}
