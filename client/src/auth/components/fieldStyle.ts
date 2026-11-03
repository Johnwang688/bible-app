// The look of a text field in the account sheets. The presets' own field edges (a translucent white rim on
// the glass presets) are far below the 3:1 a control's boundary needs, so a field gets a solid border colour
// computed here from the theme: the first of `muted` and `text` that holds 3:1 against the field's own
// background and the sheet behind it, in the worst case the preset can put there.
import { composite, contrastRatio, type Rgb } from '../../theme/contrast';
import { GLOW_D, GLOW_L } from '../../theme/palettes';
import { SCRIM } from '../../theme/overlays';
import type { Theme } from '../../theme/types';

/** WCAG 2.x non-text contrast for a control's boundary. */
export const MIN_BORDER_CONTRAST = 3;

/** Alphas of the white stops in a canvas gradient (`rgba(255, 255, 255, a)`), in order. */
function whiteStops(gradient: string): number[] {
  return [...gradient.matchAll(/rgba\(255, 255, 255, ([\d.]+)\)/g)].map((m) => Number(m[1]));
}

/** Trailing `rgba(...)` tint layer of a dark glass sheet (the last colour in the value), if any. */
function trailingTint(paint: string): string | undefined {
  const m = /,\s*(rgba\([^)]*\))\s*$/.exec(paint);
  return m ? m[1] : undefined;
}

const hex = (c: string): Rgb => composite(c, [255, 255, 255]);

/**
 * Solid colours the sheet and the field can show in this preset: pastel presets have one of each; the glass
 * presets show a sheen over whatever lies behind them (every wash peak and orb, with and without the scrim).
 */
export function fieldSurfaces(theme: Theme): { sheet: Rgb[]; field: Rgb[] } {
  const c = theme.canvas;
  if (theme.style === 'pastel') return { sheet: [hex(c.sheet)], field: [hex(c.surface)] };
  const palette = [...GLOW_L, ...GLOW_D].find((p) => p.id === theme.id);
  if (!palette) return { sheet: [], field: [] };
  const base = hex(palette.base);
  const dark = theme.mode === 'dark';
  const glow = dark ? composite(palette.glow, base) : hex(palette.c);
  const wash = [base, hex(palette.a), hex(palette.b), hex(palette.c), glow];
  const dim = wash.map((rgb) => composite(SCRIM, rgb));
  const tint = trailingTint(c.sheet);
  const sheet: Rgb[] = [];
  const field: Rgb[] = [];
  for (const behind of [...wash, ...dim]) {
    const under = tint ? composite(tint, behind) : behind;
    for (const a of whiteStops(c.sheet)) {
      const s = composite([255, 255, 255, a], under);
      sheet.push(s);
      for (const f of whiteStops(c.surface)) field.push(composite([255, 255, 255, f], s));
    }
  }
  return { sheet, field };
}

/** The solid border colour for a field in this theme. */
export function fieldBorderColour(theme: Theme): string {
  const { sheet, field } = fieldSurfaces(theme);
  const surfaces = [...sheet, ...field];
  for (const candidate of [theme.colors.muted, theme.colors.text]) {
    if (surfaces.every((s) => contrastRatio(candidate, s) >= MIN_BORDER_CONTRAST)) return candidate;
  }
  return theme.colors.text;
}

/** The border width of a field: the preset's own card edge on the pastel presets, a firmer hairline on glass. */
export function fieldBorderWidth(theme: Theme): number {
  return theme.style === 'pastel' ? theme.borders.card.width : 1.5;
}
