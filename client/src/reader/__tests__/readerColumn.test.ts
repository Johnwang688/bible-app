import { readerColumn } from '../readerColumn';

it.each([
  [1440, 208, 0, false, 464, 720, 'beside'],
  [1440, 208, 344, false, 292, 720, 'beside'],
  [1320, 208, 344, false, 232, 720, 'header'],
  [1280, 208, 344, false, 232, 680, 'header'],
  [1024, 88, 316, false, 112, 572, 'header'],
  [1440, 208, 0, true, 264, 1120, 'header'],
] as const)('matches the frame at %i with dock %i', (width, rail, dock, parallel, left, columnWidth, arrows) => {
  expect(readerColumn({ width, rail, dock, parallel })).toEqual({ left, columnWidth, arrows });
});

it.each([767, 768, 820, 847])('keeps the end row without 64px gutters (%i)', (width) => {
  expect(readerColumn({ width, rail: 0, dock: 0, parallel: false }).arrows).toBe('row');
});

it.each([848, 900, 1023])('keeps tablet arrows beside the single column (%i)', (width) => {
  expect(readerColumn({ width, rail: 0, dock: 0, parallel: false })).toEqual({ left: (width - 720) / 2, columnWidth: 720, arrows: 'beside' });
});

it('keeps tablet parallel navigation in the end row', () => {
  expect(readerColumn({ width: 1023, rail: 0, dock: 0, parallel: true })).toEqual({ left: 40, columnWidth: 943, arrows: 'row' });
});
