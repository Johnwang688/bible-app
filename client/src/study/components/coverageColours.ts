// Colours for the coverage map (Study → Progress). The design mixes the accent over the track at about
// 25 / 45 / 70 / 100 %; there is no mixing helper in the theme, so this is one: a pure function over the
// theme's own colour strings (hex or rgba), with no colour of its own.
import type { CoverageLevel } from '../../progress';
import { composite, contrastRatio, parseColor, type Rgba } from '../../theme/contrast';
import type { Theme } from '../../theme/types';

/** Share of the accent in each level's fill (level 0 is the bare track). */
export const COVERAGE_SHARE: Record<CoverageLevel, number> = { 0: 0, 1: 0.25, 2: 0.45, 3: 0.7, 4: 1 };

const hex2 = (v: number) => Math.round(Math.min(255, Math.max(0, v))).toString(16).padStart(2, '0');

/**
 * `top` over `bottom` at `share` (0–1) in sRGB, like CSS `color-mix(in srgb, top share%, bottom)`:
 * premultiplied by alpha, so a translucent track (the glass presets) stays translucent.
 */
export function mixRgba(top: string, bottom: string, share: number): Rgba {
  const a = parseColor(top);
  const b = parseColor(bottom);
  const wa = share;
  const wb = 1 - share;
  const alpha = a[3] * wa + b[3] * wb;
  if (alpha <= 0) return [0, 0, 0, 0];
  const mix = (i: 0 | 1 | 2) => (a[i] * a[3] * wa + b[i] * b[3] * wb) / alpha;
  return [mix(0), mix(1), mix(2), alpha];
}

/** `#rrggbb`, or `#rrggbbaa` when translucent (React Native and the web both read both). */
export function toHex([r, g, b, a]: Rgba): string {
  return '#' + hex2(r) + hex2(g) + hex2(b) + (a >= 1 ? '' : hex2(a * 255));
}

export const mixColours = (top: string, bottom: string, share: number): string => toHex(mixRgba(top, bottom, share));

/** The fill of a square (and the legend swatch) at a coverage level. */
export function coverageFillRgba(theme: Theme, level: CoverageLevel): Rgba {
  return mixRgba(theme.colors.accent, theme.colors.track, COVERAGE_SHARE[level]);
}

export const coverageFill = (theme: Theme, level: CoverageLevel): string => toHex(coverageFillRgba(theme, level));

/** The least contrast an abbreviation may have on its fill (large-ish bold text). */
export const MIN_MAP_CONTRAST = 3;

/**
 * The abbreviation's colour on that fill. As drawn: muted on the pale levels, on-accent on the strong
 * ones. Where that falls under 3:1 in a preset (the dark glass ones, at the middle levels), the theme's own
 * text or on-accent colour is used instead, whichever reads best.
 */
export function coverageText(theme: Theme, level: CoverageLevel): string {
  const drawn = level >= 3 ? theme.colors.onAccent : theme.colors.muted;
  const fill = composite(coverageFillRgba(theme, level), theme.colors.base);
  if (contrastRatio(drawn, fill) >= MIN_MAP_CONTRAST) return drawn;
  return [theme.colors.text, theme.colors.onAccent].reduce((best, c) => (contrastRatio(c, fill) > contrastRatio(best, fill) ? c : best), drawn);
}
