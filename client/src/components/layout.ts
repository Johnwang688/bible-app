export const BREAKPOINT = { tablet: 768, rail: 1024, railLabels: 1280 } as const;
export const COLUMN = { text: 720, wide: 1040, parallel: 1120, lesson: 640, welcome: 560 } as const;
export const BOTTOM_BAR_MAX_WIDTH = 560;
export const RAIL = { compact: 88, full: 208 } as const;

export function railWidthFor(windowWidth: number): number {
  return windowWidth < BREAKPOINT.rail ? 0 : windowWidth < BREAKPOINT.railLabels ? RAIL.compact : RAIL.full;
}
