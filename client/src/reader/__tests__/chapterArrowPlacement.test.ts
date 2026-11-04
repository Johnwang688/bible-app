import { chapterArrowPlacement } from '../chapterArrowPlacement';

it.each([767, 768, 820, 847])('keeps the end row without 64px gutters (%i)', (width) => {
  expect(chapterArrowPlacement(width, false)).toEqual({ kind: 'row' });
});

it.each([[848, 0], [1024, 88], [1440, 296], [1920, 536]])('places single-translation arrows beside the column (%i)', (width, offset) => {
  expect(chapterArrowPlacement(width, false)).toEqual({ kind: 'outside', offset });
});

it('always retains the end row in parallel', () => {
  expect(chapterArrowPlacement(1920, true)).toEqual({ kind: 'row' });
});

it('accepts a different available width and column size', () => {
  expect(chapterArrowPlacement(800, false, 640)).toEqual({ kind: 'outside', offset: 16 });
  expect(chapterArrowPlacement(767, false, 400)).toEqual({ kind: 'row' });
});
