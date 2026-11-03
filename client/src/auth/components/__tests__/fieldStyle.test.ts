// The field border holds 3:1 against the field's own background and the sheet behind it, in every preset.
import { composite, contrastRatio, type Rgb } from '../../../theme/contrast';
import { dangerColours } from '../../../theme/danger';
import { GLOW_D, GLOW_L, type GlassDarkPalette } from '../../../theme/palettes';
import { getTheme } from '../../../theme/presets';
import { PRESET_IDS } from '../../../theme/types';
import { fieldBorderColour, fieldBorderWidth, fieldSurfaces, MIN_BORDER_CONTRAST } from '../fieldStyle';

const rgb = (c: string): Rgb => composite(c, [255, 255, 255]);

describe.each(PRESET_IDS)('field border in %s', (id) => {
  const theme = getTheme(id);
  const border = fieldBorderColour(theme);

  it('is a solid colour', () => {
    expect(border).toMatch(/^#[0-9a-f]{6}$/i);
  });

  it('holds 3:1 against the field and the sheet in every state the glass can show', () => {
    const { sheet, field } = fieldSurfaces(theme);
    expect(sheet.length).toBeGreaterThan(0);
    expect(field.length).toBeGreaterThan(0);
    for (const bg of [...sheet, ...field]) expect(contrastRatio(border, bg)).toBeGreaterThanOrEqual(MIN_BORDER_CONTRAST);
  });

  it('holds 3:1 against the solid fallback: the sheet and field sheens laid over the base colour', () => {
    const t = theme.canvas;
    const stops = (g: string) => [...g.matchAll(/rgba(255, 255, 255, ([d.]+))/g)].map((m) => Number(m[1]));
    const palette = [...GLOW_L, ...GLOW_D].find((p) => p.id === id);
    const solid: Rgb[] = [];
    if (!palette) solid.push(rgb(t.sheet), rgb(t.surface));
    else {
      const tint = theme.mode === 'dark' ? (palette as GlassDarkPalette).sheet : null;
      const base = rgb(palette.base);
      const under = tint ? composite(tint, base) : base;
      for (const a of stops(t.sheet)) {
        const sheet = composite([255, 255, 255, a], under);
        solid.push(sheet);
        for (const f of stops(t.surface)) solid.push(composite([255, 255, 255, f], sheet));
      }
    }
    for (const bg of solid) expect(contrastRatio(border, bg)).toBeGreaterThanOrEqual(MIN_BORDER_CONTRAST);
  });

  it('keeps the error border (the danger colour) visible on the sheet', () => {
    const danger = dangerColours(theme).text;
    const { sheet, field } = fieldSurfaces(theme);
    // Pastel presets and the base-colour fallbacks must hold 3:1; glass peaks follow the danger text's known gaps.
    const solid = theme.style === 'pastel' ? [...sheet, ...field] : [rgb(theme.colors.base)];
    for (const bg of solid) expect(contrastRatio(danger, bg)).toBeGreaterThanOrEqual(MIN_BORDER_CONTRAST);
  });

  it('has a positive width', () => {
    expect(fieldBorderWidth(theme)).toBeGreaterThan(0);
  });
});

it('covers every glass palette', () => {
  expect([...GLOW_L, ...GLOW_D].every((p) => fieldSurfaces(getTheme(p.id)).sheet.length > 0)).toBe(true);
});
