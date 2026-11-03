// R-6a review: ratios must be compared before display rounding.
import { appearanceCustomKey } from '../../storage/appearanceCustomKey';
import { contrastRatio } from '../contrast';
import { pairsForCanvas } from '../contrastPairs';
import { applyCustom, NO_CUSTOM, setTokenEdit, validEdits } from '../custom';
import { getTheme } from '../presets';

const ID = 'strawberry-milk';
const BOUNDARY_BG = '#D7D781';

it('F1: refuses a worsening 4.495166776:1 pair even though it displays as 4.50', () => {
  const base = getTheme(ID);
  const ratio = contrastRatio(base.colors.accent, BOUNDARY_BG);
  expect(ratio).toBeLessThan(4.5);
  expect(ratio).toBeGreaterThan(4.495);
  expect(ratio).toBeLessThan(contrastRatio(base.colors.accent, base.colors.base));
  expect(setTokenEdit(NO_CUSTOM, ID, 'bg', BOUNDARY_BG)).toMatchObject({ ok: false, reason: 'contrast' });
});

it('F1: rejects the same below-threshold edit after schema-valid storage loading', () => {
  const stored = appearanceCustomKey.schema.parse({ scriptureFont: null, edits: { [ID]: { bg: BOUNDARY_BG } } });
  expect(validEdits(stored, ID)).toEqual({});
});

it('F1: applyCustom does not apply a stored edit that worsens contrast below 4.5', () => {
  const stored = appearanceCustomKey.schema.parse({ scriptureFont: null, edits: { [ID]: { bg: BOUNDARY_BG } } });
  const theme = applyCustom(ID, stored);
  const base = getTheme(ID);
  const before = new Map(pairsForCanvas(ID, base.style, base.canvas).map((p) => [p.name, p.ratio]));
  const worsened = pairsForCanvas(ID, theme.style, theme.canvas).filter(
    (p) => p.ratio < 4.5 && p.ratio < before.get(p.name)!,
  );
  expect(worsened).toEqual([]);
});

it('F1: refuses a small deterioration of a preset gap even when both ratios round to 4.32', () => {
  const base = getTheme('liberty');
  const name = 'reader hlText/hl>b';
  const ratio = (canvas: typeof base.canvas) => pairsForCanvas('liberty', base.style, canvas).find((p) => p.name === name)!.ratio;
  const before = ratio(base.canvas);
  const after = ratio({ ...base.canvas, text: '#0A1634' });
  expect(before).toBeLessThan(4.5);
  expect(after).toBeLessThan(before);
  expect(after.toFixed(2)).toBe(before.toFixed(2));
  expect(setTokenEdit(NO_CUSTOM, 'liberty', 'text', '#0A1634')).toMatchObject({ ok: false, reason: 'contrast' });
});

it('control: stored 1:1 text is rejected as a whole', () => {
  const stored = appearanceCustomKey.schema.parse({ scriptureFont: null, edits: { [ID]: { text: '#FFF0F3' } } });
  expect(validEdits(stored, ID)).toEqual({});
});
