import { pressSelection } from '../selection';

const key = '43:3:WEB';
const one = { key, anchor: 16, start: 16, end: 16, open: true };

it('desktop clicks select, move, and close the one selected verse', () => {
  expect(pressSelection(null, key, 16, true, false)).toEqual(one);
  expect(pressSelection(one, key, 18, true, false)).toEqual({ ...one, anchor: 18, start: 18, end: 18 });
  expect(pressSelection(one, key, 16, true, false)).toBeNull();
  expect(pressSelection({ ...one, end: 18 }, key, 16, true, false)).toEqual(one);
});

it('Shift extends in either direction from the original anchor, including Shift on itself', () => {
  const extended = pressSelection(one, key, 19, true, true);
  expect(extended).toEqual({ ...one, end: 19 });
  expect(pressSelection(extended, key, 12, true, true)).toEqual({ ...one, start: 12 });
  expect(pressSelection(one, key, 16, true, true)).toEqual(one);
});

it('below 1024, tapping extends exactly as before and never toggles closed', () => {
  expect(pressSelection(one, key, 18, false, false)).toEqual({ ...one, end: 18 });
  expect(pressSelection(one, key, 12, false, false)).toEqual({ ...one, start: 12 });
  expect(pressSelection(one, key, 16, false, false)).toEqual(one);
});

it('closed and other-chapter selections start fresh', () => {
  expect(pressSelection({ ...one, open: false }, key, 18, true, true)).toEqual({ ...one, anchor: 18, start: 18, end: 18 });
  expect(pressSelection(one, '43:4:WEB', 2, true, true)).toEqual({ key: '43:4:WEB', anchor: 2, start: 2, end: 2, open: true });
});
