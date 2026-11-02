// The aurora's colours, read from the theme's app paint (R-7a). The glass app paint is
// `orbs(b, a, c-or-glow), sky(a, b, c, base)`, so the first three radial layers hold b, a and the
// third colour, and the colour layer is the base. Reading the paint (never a preset id) means a
// customised theme follows.
import { composite, parseColor } from '../theme/contrast';
import type { Color, Theme } from '../theme/types';

/** An sRGB colour, each channel 0..1. */
export type Rgb = readonly [number, number, number];

export interface AuroraPalette {
  base: Rgb;
  /** The three aurora colours, in the order [a, b, third]. */
  colours: readonly [Rgb, Rgb, Rgb];
}

/** Splits at commas that are not inside parentheses. */
function splitTopLevel(css: string): string[] {
  const parts: string[] = [];
  let depth = 0;
  let start = 0;
  for (let i = 0; i < css.length; i++) {
    const ch = css[i];
    if (ch === '(') depth++;
    else if (ch === ')') depth--;
    else if (ch === ',' && depth === 0) {
      parts.push(css.slice(start, i).trim());
      start = i + 1;
    }
  }
  parts.push(css.slice(start).trim());
  return parts;
}

/** The CSS colour at the start of a colour stop (`#RRGGBB 0%`, `rgba(...) 55%`), if it parses. */
function stopColour(stop: string): string | null {
  const m = /^(\w+\([^)]*\)|#\w+)/.exec(stop);
  if (!m) return null;
  try {
    parseColor(m[1]!);
    return m[1]!;
  } catch {
    return null;
  }
}

const RADIAL = /^radial-gradient\((.*)\)$/s;

/** The first colour stop of a radial gradient layer, or null. */
function firstStop(layer: string): string | null {
  const m = RADIAL.exec(layer.trim());
  if (!m) return null;
  const parts = splitTopLevel(m[1]!);
  // The first part is the shape and position unless it is already a colour stop.
  return stopColour(parts[0]!) ?? (parts.length > 1 ? stopColour(parts[1]!) : null);
}

/** The aurora colours as the theme writes them (CSS colours; the three may be translucent). */
export interface AuroraColours {
  base: Color;
  colours: readonly [Color, Color, Color];
}

/** The base and the aurora colours from the theme's app paint; null for pastel or a paint it cannot read. */
export function auroraColours(theme: Theme): AuroraColours | null {
  if (theme.style !== 'glass') return null;
  const { backgroundColor, backgroundImage } = theme.backgrounds.app;
  if (backgroundImage === undefined) return null;
  try {
    if (parseColor(backgroundColor)[3] !== 1) return null;
  } catch {
    return null;
  }
  const radials = splitTopLevel(backgroundImage).filter((l) => l.startsWith('radial-gradient('));
  if (radials.length < 3) return null;
  const a = firstStop(radials[1]!);
  const b = firstStop(radials[0]!);
  const c = firstStop(radials[2]!);
  if (a === null || b === null || c === null) return null;
  return { base: backgroundColor, colours: [a, b, c] };
}

const unit = (c: readonly [number, number, number]): Rgb => [c[0] / 255, c[1] / 255, c[2] / 255];

export function auroraPalette(theme: Theme): AuroraPalette | null {
  const css = auroraColours(theme);
  if (!css) return null;
  const base = composite(css.base, [0, 0, 0]);
  const [a, b, c] = css.colours.map((s) => unit(composite(s, base)));
  return { base: unit(base), colours: [a!, b!, c!] };
}

/** Whether two palettes hold the same colours. */
export function samePalette(a: AuroraPalette, b: AuroraPalette): boolean {
  const eq = (x: Rgb, y: Rgb) => x[0] === y[0] && x[1] === y[1] && x[2] === y[2];
  return eq(a.base, b.base) && a.colours.every((c, i) => eq(c, b.colours[i]!));
}
