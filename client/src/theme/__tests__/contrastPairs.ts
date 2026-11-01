// The text/background pairs each preset puts on screen, for the contrast test.
// Backdrops come from the canvas: glass text can sit over any glow peak of the wash (the reader)
// or over the orbs behind the glass cards (Home), so every peak is checked, not an average.
import { composite, contrastRatio, type Rgb } from '../contrast';
import type { GlassDarkPalette, GlassLightPalette } from '../palettes';
import type { CanvasTokens } from '../types';

export interface Pair {
  name: string;
  ratio: number;
}

const rgb = (c: string): Rgb => composite(c, [255, 255, 255]);

function pair(name: string, fg: string, bg: string | Rgb): Pair {
  return { name, ratio: contrastRatio(fg, typeof bg === 'string' ? rgb(bg) : bg) };
}

/** Alphas of the white stops in a canvas linear-gradient sheen. */
function whiteStops(gradient: string): number[] {
  return [...gradient.matchAll(/rgba\(255, 255, 255, ([\d.]+)\)/g)].map((m) => Number(m[1]));
}

export function pastelPairs(t: CanvasTokens): Pair[] {
  const out: Pair[] = [];
  const solid = (fg: string | undefined, bgs: Record<string, string | undefined>, label: string) => {
    if (!fg) return;
    for (const [bgName, bg] of Object.entries(bgs)) if (bg) out.push(pair(`${label}/${bgName}`, fg, bg));
  };
  solid(t.text, { bg: t.bg, surface: t.surface, sheet: t.sheet }, 'text');
  solid(t.muted, { bg: t.bg, surface: t.surface }, 'muted');
  solid(t.c1t, { c1: t.c1 }, 'c1t');
  solid(t.c1m, { c1: t.c1 }, 'c1m');
  solid(t.c3t, { c3: t.c3 }, 'c3t');
  solid(t.c3m, { c3: t.c3 }, 'c3m');
  solid(t.chipText, { chip: t.chip }, 'chipText');
  solid(t.hlText ?? t.text, { hl: t.hl }, 'hlText');
  solid(t.onAccent, { accent: t.accent }, 'onAccent');
  solid(t.onCta, { cta: t.cta }, 'onCta');
  solid(t.vnum, { bg: t.bg, surface: t.surface }, 'vnum');
  solid(t.accent, { bg: t.bg, surface: t.surface }, 'accent');
  solid(t.tabOn, { tabPill: t.tabPill }, 'tabOn');
  solid(t.tabOff, { tabBg: t.tabBg }, 'tabOff');
  solid(t.btnText ?? t.text, { btn: t.btn }, 'btnText');
  return out;
}

export function glassPairs(t: CanvasTokens, p: GlassLightPalette | GlassDarkPalette, dark: boolean): Pair[] {
  const out: Pair[] = [];
  const base = rgb(p.base);
  // The wash behind the reader peaks at a, b and c over the base colour.
  const wash: Record<string, Rgb> = { base, a: rgb(p.a), b: rgb(p.b), c: rgb(p.c) };
  // The orbs behind the Home cards: light uses (b, a, c), dark uses (b, a, glow over base).
  const orbs: Record<string, Rgb> = dark
    ? { a: rgb(p.a), b: rgb(p.b), glow: composite(p.glow, base) }
    : { a: rgb(p.a), b: rgb(p.b), c: rgb(p.c) };

  // Every backdrop glass sits over: the wash peaks (the reader, the tab bar over the reader) and
  // the orbs (Home). Floating bars and sheets can sit over any of them.
  const backdrops: Record<string, Rgb> = { ...wash };
  for (const [k, v] of Object.entries(orbs)) {
    if (!Object.values(backdrops).some((w) => w.every((c, i) => Math.abs(c - v[i]!) < 1e-9))) backdrops[`orb ${k}`] = v;
  }

  for (const [name, bg] of Object.entries(wash)) {
    out.push(pair(`reader text/${name}`, t.text, bg));
    out.push(pair(`reader muted/${name}`, t.muted, bg));
    out.push(pair(`reader vnum/${name}`, t.vnum, bg));
    out.push(pair(`reader hlText/hl>${name}`, t.hlText ?? t.text, composite(t.hl, bg)));
  }

  out.push(pair('onAccent/accent', t.onAccent, t.accent));

  /** Text over a white-sheen layer (every stop), optionally over a tint, over every backdrop. */
  const layered = (label: string, fgs: Record<string, string>, gradient: string, tint?: string) => {
    for (const [bgName, bg] of Object.entries(backdrops)) {
      const under = tint ? composite(tint, bg) : bg;
      for (const a of whiteStops(gradient)) {
        const surface = composite(`rgba(255, 255, 255, ${a})`, under);
        for (const [fgName, fg] of Object.entries(fgs)) out.push(pair(`${label} ${fgName}/${a}>${bgName}`, fg, surface));
      }
    }
  };
  const dp = p as GlassDarkPalette;
  layered('card', { text: t.text, muted: t.muted }, t.surface);
  layered('chip', { chipText: t.chipText }, t.chip);
  layered('button', { btnText: t.btnText ?? t.text }, t.btn);
  layered('tab', { tabOn: t.tabOn, tabOff: t.tabOff }, t.tabBg, dark ? dp.tab : undefined);
  layered('sheet', { text: t.text, muted: t.muted }, t.sheet, dark ? dp.sheet : undefined);
  return out;
}
