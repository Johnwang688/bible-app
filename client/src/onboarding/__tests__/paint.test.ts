// Acceptance (orchestrator-owned, R-7a UI, GO-AHEAD "Major 1" and "Major 4"): the contrast of everything the
// first-run screens and the aurora option put on the moving aurora, measured over the aurora's own colours
// (every one of the three, and the base), not just the base.
import { auroraPalette, type Rgb } from '../../aurora/palette';
import { auroraTextShadow, shadowedContrast } from '../../aurora/textShadow';
import { composite, contrastRatio, MIN_TEXT_CONTRAST, parseColor } from '../../theme/contrast';
import { getTheme } from '../../theme/presets';
import { PRESET_IDS, type Background, type Theme } from '../../theme/types';
import { chipEdge, textCardBackground, textCardBorder } from '../paint';

const MIN_NON_TEXT = 3;
const glass = PRESET_IDS.filter((id) => getTheme(id).style === 'glass');
const pastel = PRESET_IDS.filter((id) => getTheme(id).style === 'pastel');

const to255 = (c: Rgb): Rgb => [c[0] * 255, c[1] * 255, c[2] * 255];

/** Every colour the aurora shows under the text: the base and its three colours, opaque, 0..255. */
function auroraBackdrops(theme: Theme): [string, Rgb][] {
  const p = auroraPalette(theme);
  if (!p) throw new Error(`${theme.id}: no aurora palette`);
  return [
    ['base', to255(p.base)],
    ['colour 1', to255(p.colours[0])],
    ['colour 2', to255(p.colours[1])],
    ['colour 3', to255(p.colours[2])],
  ];
}

/** The colour stops of a background's gradient layers (any CSS colour inside them). */
function gradientStops(bg: Background): string[] {
  if (!bg.backgroundImage) return [];
  return bg.backgroundImage.match(/rgba?\([^)]*\)|#[0-9a-fA-F]{3,8}\b/g) ?? [];
}

/**
 * What text on the card sees over `under`: the card's colour layer, then each gradient stop (the gradient
 * runs between its stops, so the extremes bound it). One colour per stop, or the colour layer alone.
 */
function seenThrough(bg: Background, under: Rgb): Rgb[] {
  const layer = composite(bg.backgroundColor, under);
  const stops = gradientStops(bg);
  return stops.length === 0 ? [layer] : stops.map((s) => composite(s, layer));
}

describe('text cards on the aurora (glass)', () => {
  it('covers the six glass presets, and the card is the sheet paint', () => {
    expect(glass).toHaveLength(6);
    for (const id of glass) {
      const t = getTheme(id);
      expect(textCardBackground(t)).toEqual(t.backgrounds.sheet);
      expect(textCardBorder(t)).toEqual(t.borders.sheet);
    }
  });

  it.each(glass)('%s: text and muted text on a text card pass 4.5:1 over every aurora colour', (id) => {
    const t = getTheme(id);
    const fails: string[] = [];
    for (const [name, under] of auroraBackdrops(t)) {
      for (const seen of seenThrough(textCardBackground(t), under)) {
        for (const [role, colour] of [
          ['text', t.colors.text],
          ['muted', t.colors.muted],
        ] as const) {
          const r = contrastRatio(colour, seen);
          if (r < MIN_TEXT_CONTRAST) fails.push(`${role} over ${name}: ${r.toFixed(2)}`);
        }
      }
    }
    expect(fails).toEqual([]);
  });

  it.each(glass)('%s: a heading on the aurora (text colour, soft shadow) passes 4.5:1 over every aurora colour', (id) => {
    const t = getTheme(id);
    const shadow = auroraTextShadow(t);
    expect(shadow.textShadowColor).toBe(t.colors.base);
    for (const [name, under] of auroraBackdrops(t)) {
      const unit: Rgb = [under[0] / 255, under[1] / 255, under[2] / 255];
      expect([name, shadowedContrast(t.colors.text, String(shadow.textShadowColor), unit) >= MIN_TEXT_CONTRAST]).toEqual([
        name,
        true,
      ]);
    }
  });

  it.each(glass)('%s: an unselected chip edge is 3:1 or better against every aurora colour', (id) => {
    const t = getTheme(id);
    const edge = chipEdge(t);
    expect(edge.width).toBeGreaterThanOrEqual(1);
    for (const [name, under] of auroraBackdrops(t)) {
      const seen = composite(edge.color, under);
      expect([name, contrastRatio(seen, under) >= MIN_NON_TEXT]).toEqual([name, true]);
    }
  });

  it.each(glass)('%s: a selected chip (accent fill) is readable and stands out from every aurora colour', (id) => {
    const t = getTheme(id);
    expect(parseColor(t.colors.accent)[3]).toBe(1);
    expect(contrastRatio(t.colors.onAccent, t.colors.accent)).toBeGreaterThanOrEqual(MIN_TEXT_CONTRAST);
  });
});

describe('text cards (pastel)', () => {
  it.each(pastel)('%s: text and muted on the card pass 4.5:1; the chip edge is 3:1 against the screen', (id) => {
    const t = getTheme(id);
    const base = composite(t.colors.base, [255, 255, 255]);
    for (const seen of seenThrough(textCardBackground(t), base)) {
      expect(contrastRatio(t.colors.text, seen)).toBeGreaterThanOrEqual(MIN_TEXT_CONTRAST);
      expect(contrastRatio(t.colors.muted, seen)).toBeGreaterThanOrEqual(MIN_TEXT_CONTRAST);
    }
    expect(contrastRatio(composite(chipEdge(t).color, base), base)).toBeGreaterThanOrEqual(MIN_NON_TEXT);
    expect(contrastRatio(t.colors.onCta, t.colors.cta)).toBeGreaterThanOrEqual(MIN_TEXT_CONTRAST);
  });
});
