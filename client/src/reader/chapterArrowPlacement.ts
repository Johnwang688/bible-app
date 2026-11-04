import { BREAKPOINT, COLUMN } from '../components/layout';

/** Available width is explicit so a future reader pane can supply its own bounds. */
export function chapterArrowPlacement(width: number, parallel: boolean, columnWidth: number = COLUMN.text):
  { kind: 'row' } | { kind: 'outside'; offset: number } {
  const gutter = (width - columnWidth) / 2;
  return width >= BREAKPOINT.tablet && !parallel && gutter >= 64
    ? { kind: 'outside', offset: gutter - 64 }
    : { kind: 'row' };
}
