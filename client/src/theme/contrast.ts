// WCAG 2.x contrast for the colour formats the presets use (#RRGGBB, #RGB, rgb(), rgba()).

export type Rgb = readonly [number, number, number];
export type Rgba = readonly [number, number, number, number];

/** Parses a CSS colour. Throws on anything else, so a typo in a preset fails loudly. */
export function parseColor(input: string): Rgba {
  const s = input.trim();
  const hex = /^#([0-9a-f]{3}|[0-9a-f]{6})$/i.exec(s);
  if (hex) {
    const h = hex[1]!.length === 3 ? [...hex[1]!].map((ch) => ch + ch).join('') : hex[1]!;
    return [parseInt(h.slice(0, 2), 16), parseInt(h.slice(2, 4), 16), parseInt(h.slice(4, 6), 16), 1];
  }
  const fn = /^rgba?\(\s*([\d.]+)\s*,\s*([\d.]+)\s*,\s*([\d.]+)\s*(?:,\s*([\d.]+)\s*)?\)$/i.exec(s);
  if (fn) {
    const [r, g, b] = [Number(fn[1]), Number(fn[2]), Number(fn[3])];
    const a = fn[4] === undefined ? 1 : Number(fn[4]);
    if ([r, g, b].every((v) => v >= 0 && v <= 255) && a >= 0 && a <= 1) return [r, g, b, a];
  }
  throw new Error(`Unsupported colour: ${input}`);
}

/** Composites `top` (which may be translucent) over an opaque `bottom`. */
export function composite(top: string | Rgba, bottom: string | Rgb): Rgb {
  const t = typeof top === 'string' ? parseColor(top) : top;
  const b = typeof bottom === 'string' ? opaque(bottom) : bottom;
  const a = t[3];
  return [t[0] * a + b[0] * (1 - a), t[1] * a + b[1] * (1 - a), t[2] * a + b[2] * (1 - a)];
}

function opaque(color: string): Rgb {
  const c = parseColor(color);
  if (c[3] !== 1) throw new Error(`Expected an opaque colour, got ${color}`);
  return [c[0], c[1], c[2]];
}

export function relativeLuminance([r, g, b]: Rgb): number {
  const lin = (v: number) => {
    const c = v / 255;
    return c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
  };
  return 0.2126 * lin(r) + 0.7152 * lin(g) + 0.0722 * lin(b);
}

/** The contrast ratio of `fg` over `bg`. A translucent `fg` is composited over `bg` first. */
export function contrastRatio(fg: string | Rgb, bg: string | Rgb): number {
  const back = typeof bg === 'string' ? opaque(bg) : bg;
  const front = typeof fg === 'string' ? composite(fg, back) : fg;
  const l1 = relativeLuminance(front);
  const l2 = relativeLuminance(back);
  return (Math.max(l1, l2) + 0.05) / (Math.min(l1, l2) + 0.05);
}

/** The minimum ratio for body text (WCAG AA). */
export const MIN_TEXT_CONTRAST = 4.5;
