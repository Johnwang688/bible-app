// The destructive colour holds 4.5:1 as text on the account card and the sheets in every preset, and its
// on-fill colour holds 4.5:1 on the fill.
//
// Two checks, as for the other text colours (contrast.test.ts):
//  - the solid fallback of every surface (a pastel fill; a glass sheen laid over the preset's base colour,
//    with the dark sheet's tint): no exceptions;
//  - the glass sheen over every backdrop peak and orb, as contrastPairs.ts measures them. Danger text shares
//    the glass presets' known gaps (a red or teal wash peak behind a pale sheen), so those are listed and
//    the list may only shrink: the test fails if a new gap appears, and also if a listed one is fixed.
import { composite, contrastRatio, MIN_TEXT_CONTRAST, type Rgb } from '../contrast';
import { dangerColours } from '../danger';
import { GLOW_D, GLOW_L } from '../palettes';
import { getTheme } from '../presets';
import { PRESET_IDS, type PresetId } from '../types';

const rgb = (c: string): Rgb => composite(c, [255, 255, 255]);
const whiteStops = (gradient: string) => [...gradient.matchAll(/rgba\(255, 255, 255, ([\d.]+)\)/g)].map((m) => Number(m[1]));

/** Solid colours the account card ('card …') and the sheets ('sheet …') show in a preset. */
function surfaces(id: PresetId, backdrops: 'solid' | 'peaks'): Record<string, Rgb> {
  const theme = getTheme(id);
  const t = theme.canvas;
  const out: Record<string, Rgb> = {};
  if (theme.style === 'pastel') {
    out['card c3'] = rgb(t.c3 ?? t.surface);
    out['card surface'] = rgb(t.surface);
    out['sheet'] = rgb(t.sheet);
    return out;
  }
  const dark = theme.mode === 'dark';
  const p = [...GLOW_L, ...GLOW_D].find((x) => x.id === id)!;
  const base = rgb(p.base);
  const all: Record<string, Rgb> = { base };
  if (backdrops === 'peaks') {
    Object.assign(all, { a: rgb(p.a), b: rgb(p.b), c: rgb(p.c) });
    if (dark) all['orb glow'] = composite(p.glow, base);
  }
  const sheetTint = dark ? (p as (typeof GLOW_D)[number]).sheet : undefined;
  for (const [name, bg] of Object.entries(all)) {
    for (const a of whiteStops(t.surface)) out[`card ${a}>${name}`] = composite([255, 255, 255, a], bg);
    const under = sheetTint ? composite(sheetTint, bg) : bg;
    for (const a of whiteStops(t.sheet)) out[`sheet ${a}>${name}`] = composite([255, 255, 255, a], under);
  }
  return out;
}

const gapsOf = (id: PresetId) =>
  Object.entries(surfaces(id, 'peaks'))
    .map(([name, bg]) => [id, name, Number(contrastRatio(dangerColours(getTheme(id)).text, bg).toFixed(2))] as const)
    .filter(([, , ratio]) => ratio < MIN_TEXT_CONTRAST);

/** Glass surfaces where danger text is under 4.5:1 over a wash peak or orb. May only shrink. */
const KNOWN_GAPS: readonly (readonly [PresetId, string, number])[] = [
  ['liberty', 'card 0.58>a', 4.05],
  ['liberty', 'card 0.2>a', 2.57],
  ['liberty', 'card 0.34>a', 3.03],
  ['liberty', 'sheet 0.52>a', 3.77],
  ['liberty', 'card 0.58>b', 4.01],
  ['liberty', 'card 0.2>b', 2.39],
  ['liberty', 'card 0.34>b', 2.92],
  ['liberty', 'sheet 0.52>b', 3.71],
  ['liberty', 'card 0.2>c', 3.81],
  ['liberty', 'card 0.34>c', 4.21],
  ['silver', 'card 0.2>a', 4.39],
  ['silver', 'card 0.2>c', 3.91],
  ['silver', 'card 0.34>c', 4.31],
  ['northern-lights', 'card 0.17>a', 4.03],
  ['northern-lights', 'card 0.17>b', 2.55],
  ['northern-lights', 'card 0.04>b', 3.36],
  ['northern-lights', 'card 0.09>b', 3.02],
  ['northern-lights', 'card 0.17>orb glow', 2.94],
  ['northern-lights', 'card 0.04>orb glow', 4.09],
  ['northern-lights', 'card 0.09>orb glow', 3.6],
  ['graphite', 'card 0.17>a', 3.74],
  ['graphite', 'card 0.17>orb glow', 4.21],
  ['deep-blue', 'card 0.17>a', 3.91],
  ['deep-blue', 'card 0.17>orb glow', 3.75],
];

describe('danger colours', () => {
  it.each(PRESET_IDS)('%s: text holds 4.5:1 on the solid card and sheet', (id) => {
    const { text } = dangerColours(getTheme(id));
    const low = Object.entries(surfaces(id, 'solid'))
      .map(([name, bg]) => [name, Number(contrastRatio(text, bg).toFixed(2))] as const)
      .filter(([, ratio]) => ratio < MIN_TEXT_CONTRAST);
    expect(low).toEqual([]);
  });

  it.each(PRESET_IDS)('%s: over wash peaks and orbs, only the known gaps fall short', (id) => {
    expect(gapsOf(id)).toEqual(KNOWN_GAPS.filter(([gid]) => gid === id));
  });

  it.each(PRESET_IDS)('%s: the on-fill colour holds 4.5:1 on the fill', (id) => {
    const { fill, onFill } = dangerColours(getTheme(id));
    expect(contrastRatio(onFill, fill)).toBeGreaterThanOrEqual(MIN_TEXT_CONTRAST);
  });

  it('uses the approved colours: #B3261E on light presets, #FFB4AB on dark ones', () => {
    for (const id of PRESET_IDS) {
      const theme = getTheme(id);
      expect(dangerColours(theme).text).toBe(theme.mode === 'dark' ? '#FFB4AB' : '#B3261E');
    }
  });
});
