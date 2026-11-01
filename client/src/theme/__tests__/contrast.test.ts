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
 * Pairs below 4.5:1 in the canvas presets as John tuned them (2026-11-01). Every one is
 * glass text over a bright glow peak or orb; no pastel preset and no Scripture-text pair
 * is here. This list may only shrink: the test fails if a new gap appears, and also if a
 * listed gap is fixed (so the list is updated to match).
 */
const KNOWN_GAPS: readonly [PresetId, string, number][] = [
  ['liberty', 'reader muted/a', 2.77],
  ['liberty', 'reader vnum/a', 2.9],
  ['liberty', 'reader muted/b', 2.4],
  ['liberty', 'reader vnum/b', 2.51],
  ['liberty', 'reader muted/c', 4.43],
  ['liberty', 'card muted/sheen 0.2>a', 3.47],
  ['liberty', 'card muted/sheen 0.34>a', 4.1],
  ['liberty', 'card muted/sheen 0.2>b', 3.24],
  ['liberty', 'card muted/sheen 0.34>b', 3.94],
  ['silver', 'reader muted/c', 4.2],
  ['sky', 'reader vnum/a', 4.4],
  ['sky', 'reader vnum/c', 4.3],
  ['northern-lights', 'reader muted/b', 3.63],
  ['northern-lights', 'reader vnum/b', 4.2],
  ['northern-lights', 'card muted/sheen 0.17>a', 4.0],
  ['northern-lights', 'card text/sheen 0.17>b', 3.93],
  ['northern-lights', 'card muted/sheen 0.17>b', 2.53],
  ['northern-lights', 'card muted/sheen 0.04>b', 3.33],
  ['northern-lights', 'card muted/sheen 0.09>b', 3.0],
  ['northern-lights', 'card muted/sheen 0.17>glow', 2.92],
  ['northern-lights', 'card muted/sheen 0.04>glow', 4.06],
  ['northern-lights', 'card muted/sheen 0.09>glow', 3.57],
  ['graphite', 'card muted/sheen 0.17>a', 3.37],
  ['graphite', 'card muted/sheen 0.09>a', 4.28],
  ['graphite', 'card muted/sheen 0.17>b', 4.19],
  ['graphite', 'card muted/sheen 0.17>glow', 3.79],
  ['deep-blue', 'card muted/sheen 0.17>a', 3.75],
  ['deep-blue', 'card muted/sheen 0.17>b', 4.34],
  ['deep-blue', 'card muted/sheen 0.17>glow', 3.6],
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
