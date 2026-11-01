// Acceptance (orchestrator-owned): 4.5:1 text contrast over every preset.
import { contrastRatio, composite, parseColor, MIN_TEXT_CONTRAST } from '../contrast';
import { GLOW_D, GLOW_L, POP_D, POP_L } from '../palettes';
import { getTheme } from '../presets';
import { PRESET_IDS, type PresetId } from '../types';
import { glassPairs, pastelPairs, type Pair } from './contrastPairs';

describe('contrast maths', () => {
  it('matches the WCAG reference values', () => {
    expect(contrastRatio('#000000', '#FFFFFF')).toBeCloseTo(21, 5);
    expect(contrastRatio('#FFFFFF', '#FFFFFF')).toBeCloseTo(1, 5);
    expect(contrastRatio('#777777', '#FFFFFF')).toBeCloseTo(4.48, 2);
    expect(contrastRatio('#FFF', '#000')).toBeCloseTo(21, 5);
  });

  it('composites translucent colours before measuring', () => {
    expect(composite('rgba(0, 0, 0, 0.5)', '#FFFFFF')).toEqual([127.5, 127.5, 127.5]);
    expect(contrastRatio('rgba(0, 0, 0, 0)', '#FFFFFF')).toBeCloseTo(1, 5);
  });

  it('rejects colours it cannot read', () => {
    expect(() => parseColor('transparent')).toThrow();
    expect(() => parseColor('#12345')).toThrow();
    expect(() => parseColor('rgba(300, 0, 0, 1)')).toThrow();
    expect(() => contrastRatio('#000000', 'rgba(255, 255, 255, 0.5)')).toThrow();
  });
});

/**
 * Pairs below 4.5:1 in the canvas presets as John tuned them (2026-11-01). Every one is glass
 * text over a bright glow peak or orb: mostly secondary text (muted, verse numbers, inactive
 * tabs); also highlighted verses over peak b in Liberty and Northern lights, and Northern lights
 * card text over peak b. No pastel preset is here, and plain Scripture text passes on every
 * reader background. This list may only shrink: the test fails if a new gap appears, and also
 * if a listed gap is fixed (so the list is updated to match). John decides whether to tune the
 * glass presets (plan doc, Open).
 */
const KNOWN_GAPS: readonly [PresetId, string, number][] = [
  ['liberty', 'reader muted/a', 2.77],
  ['liberty', 'reader vnum/a', 2.9],
  ['liberty', 'reader muted/b', 2.4],
  ['liberty', 'reader vnum/b', 2.51],
  ['liberty', 'reader hlText/hl>b', 4.32],
  ['liberty', 'reader muted/c', 4.43],
  ['liberty', 'card muted/0.2>a', 3.47],
  ['liberty', 'card muted/0.34>a', 4.1],
  ['liberty', 'card muted/0.2>b', 3.24],
  ['liberty', 'card muted/0.34>b', 3.94],
  ['liberty', 'tab tabOn/0.3>a', 4.08],
  ['liberty', 'tab tabOff/0.3>a', 3.91],
  ['liberty', 'tab tabOn/0.3>b', 3.9],
  ['liberty', 'tab tabOff/0.3>b', 3.73],
  ['silver', 'reader muted/c', 4.2],
  ['sky', 'reader vnum/a', 4.4],
  ['sky', 'reader vnum/c', 4.3],
  ['northern-lights', 'reader muted/b', 3.63],
  ['northern-lights', 'reader vnum/b', 4.2],
  ['northern-lights', 'reader hlText/hl>b', 3.66],
  ['northern-lights', 'card muted/0.17>a', 4],
  ['northern-lights', 'card text/0.17>b', 3.93],
  ['northern-lights', 'card muted/0.17>b', 2.53],
  ['northern-lights', 'card muted/0.04>b', 3.33],
  ['northern-lights', 'card muted/0.09>b', 3],
  ['northern-lights', 'card muted/0.17>orb glow', 2.92],
  ['northern-lights', 'card muted/0.04>orb glow', 4.06],
  ['northern-lights', 'card muted/0.09>orb glow', 3.57],
  ['northern-lights', 'chip chipText/0.17>b', 3.93],
  ['northern-lights', 'button btnText/0.18>b', 3.85],
  ['northern-lights', 'button btnText/0.18>orb glow', 4.44],
  ['northern-lights', 'tab tabOff/0.18>b', 4.35],
  ['graphite', 'card muted/0.17>a', 3.37],
  ['graphite', 'card muted/0.09>a', 4.28],
  ['graphite', 'card muted/0.17>b', 4.19],
  ['graphite', 'card muted/0.17>orb glow', 3.79],
  ['graphite', 'tab tabOff/0.18>a', 4.47],
  ['deep-blue', 'card muted/0.17>a', 3.75],
  ['deep-blue', 'card muted/0.17>b', 4.34],
  ['deep-blue', 'card muted/0.17>orb glow', 3.6],
  ['deep-blue', 'tab tabOn/0.18>a', 4.16],
  ['deep-blue', 'tab tabOn/0.18>b', 4.41],
  ['deep-blue', 'tab tabOn/0.18>orb glow', 4.08],
];

function pairsFor(id: PresetId): Pair[] {
  const t = getTheme(id).canvas;
  const gl = GLOW_L.find((p) => p.id === id);
  if (gl) return glassPairs(t, gl, false);
  const gd = GLOW_D.find((p) => p.id === id);
  if (gd) return glassPairs(t, gd, true);
  return pastelPairs(t);
}

describe('preset contrast', () => {
  it('covers all 12 presets', () => {
    expect([...POP_L, ...POP_D, ...GLOW_L, ...GLOW_D]).toHaveLength(PRESET_IDS.length);
  });

  it.each(PRESET_IDS)('%s: checks a full set of pairs', (id) => {
    const pairs = pairsFor(id);
    expect(pairs.length).toBeGreaterThanOrEqual(getTheme(id).style === 'glass' ? 30 : 20);
    const names = pairs.map((p) => p.name);
    expect(new Set(names).size).toBe(names.length);
  });

  it.each(PRESET_IDS)('%s: every text pair is at least 4.5:1, apart from the known gaps', (id) => {
    const gaps = pairsFor(id)
      .filter((p) => p.ratio < MIN_TEXT_CONTRAST)
      .map((p) => [id, p.name, Number(p.ratio.toFixed(2))]);
    expect(gaps).toEqual(KNOWN_GAPS.filter(([gid]) => gid === id));
  });

  it.each(PRESET_IDS)('%s: Scripture text passes on the reader background everywhere', (id) => {
    const reader = pairsFor(id).filter((p) => /^(reader )?text\//.test(p.name));
    expect(reader.length).toBeGreaterThan(0);
    for (const p of reader) expect([p.name, p.ratio >= MIN_TEXT_CONTRAST]).toEqual([p.name, true]);
  });
});

// Verifier round 1 on the orchestrator's code (GPT-6.1 Sol): pairs the first helper skipped.
describe('contrast pairs cover every glass surface', () => {
  const has = (pairs: Pair[], ratio: number) => pairs.some((p) => Math.abs(p.ratio - ratio) < 1e-10);

  it.each([GLOW_L[0]!, GLOW_D[0]!])('measures highlighted Scripture over peak b: $id', (palette) => {
    const t = getTheme(palette.id).canvas;
    const ratio = contrastRatio(t.hlText ?? t.text, composite(t.hl, palette.b));
    expect(has(glassPairs(t, palette, 'onAccent' in palette), ratio)).toBe(true);
  });

  it('measures highlighted Scripture over the base', () => {
    const palette = GLOW_L[1]!;
    const t = getTheme(palette.id).canvas;
    expect(has(glassPairs(t, palette, false), contrastRatio(t.hlText ?? t.text, composite(t.hl, palette.base)))).toBe(true);
  });

  it('measures inactive tabs over peak b', () => {
    const palette = GLOW_L[0]!;
    const t = getTheme(palette.id).canvas;
    const ratio = contrastRatio(t.tabOff, composite('rgba(255, 255, 255, 0.3)', palette.b));
    expect(has(glassPairs(t, palette, false), ratio)).toBe(true);
  });

  it.each(['chipText', 'btnText'] as const)('includes the %s token', (key) => {
    const palette = GLOW_L[1]!;
    const t = getTheme(palette.id).canvas;
    expect(glassPairs({ ...t, [key]: '#FFFFFF' }, palette, false)).not.toEqual(glassPairs(t, palette, false));
  });
});

// Verifier round 2 on the orchestrator's code (GPT-6.1 Sol): a mutant-killing coverage check.
it.each([...GLOW_L, ...GLOW_D])('$id: highlighted Scripture is measured over every wash backdrop', (palette) => {
  const names = glassPairs(getTheme(palette.id).canvas, palette, 'onAccent' in palette).map((p) => p.name);
  expect(names).toEqual(expect.arrayContaining(['base', 'a', 'b', 'c'].map((b) => `reader hlText/hl>${b}`)));
});
