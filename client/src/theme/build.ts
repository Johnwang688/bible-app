// Builds the typed theme for each preset: a literal port of the design-canvas builders
// (src/theme/__tests__/canvas-themes.js), then the React Native tokens derived from them.
import {
  GLOW_D,
  GLOW_L,
  POP_D,
  POP_L,
  type GlassDarkPalette,
  type GlassLightPalette,
  type PastelDarkPalette,
  type PastelLightPalette,
} from './palettes';
import type {
  Background,
  Border,
  CanvasTokens,
  Paint,
  PresetId,
  ScriptureFontFamily,
  Theme,
  ThemeColors,
  ThemeMode,
  ThemeStyle,
  UiFontFamily,
} from './types';

const POP_UI = "'Space Grotesk', system-ui, sans-serif";
const GLOW_UI = "'Plus Jakarta Sans', system-ui, sans-serif";

export function popLight(p: PastelLightPalette): CanvasTokens {
  const ink = '#1B1B1F';
  const line = '2.5px solid ' + ink;
  return {
    bg: p.bg, text: ink, muted: '#45434D', surface: '#FFFFFF', border: line, radius: '16px',
    shadow: '4px 4px 0 ' + ink, blur: 'none',
    accent: p.ink, onAccent: '#FFFFFF', cta: p.cta, onCta: ink, ctaShadow: '3px 3px 0 ' + ink,
    hl: p.hl, vnum: p.ink,
    ui: POP_UI, head: POP_UI, scripture: 'Literata, Georgia, serif', headW: '700', headSize: '34px', headLs: '-1px',
    chip: p.c1, chipText: ink, track: p.bg, bar: ink, btnRadius: '12px', btnBorder: line,
    c1: p.c1, c1t: ink, c1m: '#3A3640', c2: '#FFFFFF', c3: p.c3, c3t: ink, c3m: '#3A3640',
    tabBg: '#FFFFFF', tabBorder: line, tabOn: ink, tabOff: '#55525C', tabPill: p.cta,
    sheet: '#FFFFFF', sheetBorder: line, sheetRadius: '22px', sheetShadow: 'none', btn: p.bg,
    swatchRadius: '12px', grabber: ink,
  };
}

export function popDark(p: PastelDarkPalette): CanvasTokens {
  const ink = '#17161C';
  const line = '2.5px solid ' + p.line;
  return {
    bg: p.bg, text: '#FBF6EF', muted: '#CFC9D2', surface: p.surface, border: line, radius: '16px',
    shadow: '4px 4px 0 ' + p.pop, blur: 'none',
    accent: p.pop, onAccent: ink, cta: p.pop, onCta: ink, ctaShadow: '3px 3px 0 ' + p.line,
    hl: p.hl, hlText: p.cardText, vnum: p.pop,
    ui: POP_UI, head: POP_UI, scripture: 'Literata, Georgia, serif', headW: '700', headSize: '34px', headLs: '-1px',
    chip: p.c1, chipText: p.cardText, track: p.bg, bar: p.pop, btnRadius: '12px', btnBorder: line,
    c1: p.c1, c1t: p.cardText, c1m: p.cardMuted, c2: p.surface, c3: p.c3, c3t: p.cardText, c3m: p.cardMuted,
    tabBg: p.bg, tabBorder: line, tabOn: ink, tabOff: '#BDB6C2', tabPill: p.pop,
    sheet: p.surface, sheetBorder: line, sheetRadius: '22px', sheetShadow: 'none', btn: p.bg, btnText: '#FBF6EF',
    swatchRadius: '12px', grabber: p.line,
  };
}

export function sky(p: { a: string; b: string; c: string; base: string }): Paint {
  return (
    'radial-gradient(90% 55% at 0% 0%, ' + p.a + ' 0%, transparent 70%), ' +
    'radial-gradient(80% 50% at 100% 42%, ' + p.b + ' 0%, transparent 70%), ' +
    'radial-gradient(90% 50% at 15% 100%, ' + p.c + ' 0%, transparent 70%), ' + p.base
  );
}

// Colour behind the glass, so the panes have something to bend and blur. Home only;
// the reader keeps the plain wash so Scripture never sits on the orbs.
export function orbs(x: string, y: string, z: string): Paint {
  return (
    'radial-gradient(circle 130px at 86% 19%, ' + x + ' 0%, ' + x + ' 55%, transparent 100%), ' +
    'radial-gradient(circle 150px at 6% 50%, ' + y + ' 0%, ' + y + ' 55%, transparent 100%), ' +
    'radial-gradient(circle 120px at 80% 76%, ' + z + ' 0%, ' + z + ' 55%, transparent 100%)'
  );
}

export function glowLight(p: GlassLightPalette): CanvasTokens {
  const sheen = 'linear-gradient(135deg, rgba(255, 255, 255, 0.58) 0%, rgba(255, 255, 255, 0.20) 45%, rgba(255, 255, 255, 0.34) 100%)';
  const rim = 'inset 1px 1px 0 rgba(255, 255, 255, 0.95), inset -1px -1px 0 rgba(255, 255, 255, 0.40), inset 0 0 22px rgba(255, 255, 255, 0.28), 0 14px 34px ' + p.glow;
  const edge = '1px solid rgba(255, 255, 255, 0.7)';
  return {
    bg: orbs(p.b, p.a, p.c) + ', ' + sky(p), readerBg: sky(p), text: p.text, muted: p.muted,
    surface: sheen, border: edge, radius: '28px', shadow: rim, blur: 'blur(14px) saturate(200%) brightness(1.04)',
    accent: p.accent, onAccent: '#FFFFFF',
    ctaShadow: 'inset 0 1px 0 rgba(255, 255, 255, 0.5), inset 0 -3px 8px rgba(0, 0, 0, 0.12), 0 8px 20px ' + p.glow,
    hl: p.hl, vnum: p.accent,
    ui: GLOW_UI, head: GLOW_UI, scripture: "'Source Serif 4', Georgia, serif", headW: '700', headSize: '32px', headLs: '-0.8px',
    chip: sheen, chipText: p.text, track: 'rgba(255, 255, 255, 0.6)', btnRadius: '999px',
    tabBg: 'linear-gradient(135deg, rgba(255, 255, 255, 0.62) 0%, rgba(255, 255, 255, 0.30) 100%)', tabBorder: edge,
    tabOn: p.accent, tabOff: p.muted, tabShadow: rim, float: true,
    sheet: 'linear-gradient(160deg, rgba(255, 255, 255, 0.78) 0%, rgba(255, 255, 255, 0.52) 100%)', sheetBorder: edge, sheetRadius: '34px',
    sheetShadow: 'inset 1px 1px 0 rgba(255, 255, 255, 0.95), inset 0 0 26px rgba(255, 255, 255, 0.3), 0 -12px 40px ' + p.glow,
    btn: 'linear-gradient(135deg, rgba(255, 255, 255, 0.66) 0%, rgba(255, 255, 255, 0.28) 100%)',
  };
}

export function glowDark(p: GlassDarkPalette): CanvasTokens {
  const sheen = 'linear-gradient(135deg, rgba(255, 255, 255, 0.17) 0%, rgba(255, 255, 255, 0.04) 45%, rgba(255, 255, 255, 0.09) 100%)';
  const rim = 'inset 1px 1px 0 rgba(255, 255, 255, 0.38), inset -1px -1px 0 rgba(255, 255, 255, 0.09), inset 0 0 22px rgba(255, 255, 255, 0.06), 0 18px 40px rgba(0, 0, 0, 0.4)';
  const edge = '1px solid rgba(255, 255, 255, 0.22)';
  return {
    bg: orbs(p.b, p.a, p.glow) + ', ' + sky(p), readerBg: sky(p), text: p.text, muted: p.muted,
    surface: sheen, border: edge, radius: '28px', shadow: rim, blur: 'blur(14px) saturate(190%)',
    accent: p.accent, onAccent: p.onAccent,
    ctaShadow: 'inset 0 1px 0 rgba(255, 255, 255, 0.55), inset 0 -3px 8px rgba(0, 0, 0, 0.18), 0 0 24px ' + p.glow,
    hl: p.hl, vnum: p.accent,
    ui: GLOW_UI, head: GLOW_UI, scripture: "'Source Serif 4', Georgia, serif", headW: '800', headSize: '31px', headLs: '-0.8px',
    chip: sheen, chipText: p.text, track: 'rgba(255, 255, 255, 0.14)', btnRadius: '999px',
    tabBg: 'linear-gradient(135deg, rgba(255, 255, 255, 0.18) 0%, rgba(255, 255, 255, 0.05) 100%), ' + p.tab, tabBorder: edge,
    tabOn: p.accent, tabOff: p.muted, tabShadow: rim, float: true,
    sheet: 'linear-gradient(160deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.03) 45%), ' + p.sheet, sheetBorder: edge, sheetRadius: '34px',
    sheetShadow: 'inset 1px 1px 0 rgba(255, 255, 255, 0.32), inset 0 0 26px rgba(255, 255, 255, 0.05), 0 -12px 40px rgba(0, 0, 0, 0.45)',
    btn: 'linear-gradient(135deg, rgba(255, 255, 255, 0.18) 0%, rgba(255, 255, 255, 0.05) 100%)',
  };
}

type Source =
  | { style: 'pastel'; mode: 'light'; palette: PastelLightPalette }
  | { style: 'pastel'; mode: 'dark'; palette: PastelDarkPalette }
  | { style: 'glass'; mode: 'light'; palette: GlassLightPalette }
  | { style: 'glass'; mode: 'dark'; palette: GlassDarkPalette };

function findSource(id: PresetId): Source {
  const popL = POP_L.find((p) => p.id === id);
  if (popL) return { style: 'pastel', mode: 'light', palette: popL };
  const popD = POP_D.find((p) => p.id === id);
  if (popD) return { style: 'pastel', mode: 'dark', palette: popD };
  const glowL = GLOW_L.find((p) => p.id === id);
  if (glowL) return { style: 'glass', mode: 'light', palette: glowL };
  const glowD = GLOW_D.find((p) => p.id === id);
  if (glowD) return { style: 'glass', mode: 'dark', palette: glowD };
  throw new Error(`Unknown preset: ${String(id)}`);
}

export function buildCanvasTokens(id: PresetId): CanvasTokens {
  const s = findSource(id);
  if (s.style === 'pastel') return s.mode === 'light' ? popLight(s.palette) : popDark(s.palette);
  return s.mode === 'light' ? glowLight(s.palette) : glowDark(s.palette);
}

// ---- Canvas tokens -> React Native tokens ----

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

const TRANSPARENT = 'rgba(0, 0, 0, 0)';
const isGradient = (layer: string) => /^(linear|radial)-gradient\(/.test(layer);

function toBackground(paint: Paint): Background {
  const layers = splitTopLevel(paint);
  // A colour layer, if any, must be the last one (CSS paints the colour under all the images).
  const last = layers[layers.length - 1]!;
  const colour = isGradient(last) ? null : last;
  const gradients = colour === null ? layers : layers.slice(0, -1);
  if (!gradients.every(isGradient)) throw new Error(`Unsupported paint: ${paint}`);
  const backgroundColor = colour ?? TRANSPARENT;
  return gradients.length > 0 ? { backgroundColor, backgroundImage: gradients.join(', ') } : { backgroundColor };
}

function toBorder(css: string): Border {
  const m = /^([\d.]+)px solid (.+)$/.exec(css.trim());
  if (!m) throw new Error(`Unsupported border: ${css}`);
  return { width: Number(m[1]), color: m[2]!.trim() };
}

const toShadow = (css: string | undefined): string | null => (css === undefined || css === 'none' ? null : css);

function px(css: string): number {
  const m = /^(-?[\d.]+)px$/.exec(css.trim());
  if (!m) throw new Error(`Unsupported length: ${css}`);
  return Number(m[1]);
}

function toBlur(css: string): { css: string | null; radius: number } {
  if (css === 'none') return { css: null, radius: 0 };
  const m = /blur\(\s*([\d.]+)px\s*\)/.exec(css);
  if (!m) throw new Error(`Unsupported blur: ${css}`);
  return { css, radius: Number(m[1]) };
}

function uiFamily(stack: string): UiFontFamily {
  if (stack.includes('Space Grotesk')) return 'SpaceGrotesk';
  if (stack.includes('Plus Jakarta Sans')) return 'PlusJakartaSans';
  throw new Error(`Unknown font stack: ${stack}`);
}

function scriptureFamily(stack: string): ScriptureFontFamily {
  if (stack.startsWith('Literata')) return 'Literata';
  if (stack.includes('Source Serif 4')) return 'SourceSerif4';
  throw new Error(`Unknown font stack: ${stack}`);
}

function headWeight(w: string): '700' | '800' {
  if (w === '700' || w === '800') return w;
  throw new Error(`Unsupported heading weight: ${w}`);
}

export function toTheme(id: PresetId, canvas: CanvasTokens): Theme {
  const s = findSource(id);
  const style: ThemeStyle = s.style;
  const mode: ThemeMode = s.mode;
  const base = s.style === 'pastel' ? s.palette.bg : s.palette.base;
  const colors: ThemeColors = {
    base,
    text: canvas.text,
    muted: canvas.muted,
    accent: canvas.accent,
    onAccent: canvas.onAccent,
    cta: canvas.cta ?? canvas.accent,
    onCta: canvas.onCta ?? canvas.onAccent,
    hl: canvas.hl,
    hlText: canvas.hlText ?? canvas.text,
    vnum: canvas.vnum,
    chipText: canvas.chipText,
    track: canvas.track,
    tabOn: canvas.tabOn,
    tabOff: canvas.tabOff,
    btnText: canvas.btnText ?? canvas.text,
  };
  return {
    id,
    style,
    mode,
    canvas,
    colors,
    backgrounds: {
      app: toBackground(canvas.bg),
      reader: toBackground(canvas.readerBg ?? canvas.bg),
      surface: toBackground(canvas.surface),
      chip: toBackground(canvas.chip),
      tabBar: toBackground(canvas.tabBg),
      sheet: toBackground(canvas.sheet),
      button: toBackground(canvas.btn),
    },
    borders: {
      card: toBorder(canvas.border),
      button: canvas.btnBorder === undefined ? null : toBorder(canvas.btnBorder),
      tabBar: toBorder(canvas.tabBorder),
      sheet: toBorder(canvas.sheetBorder),
    },
    shadows: {
      card: toShadow(canvas.shadow),
      cta: canvas.ctaShadow,
      tabBar: toShadow(canvas.tabShadow),
      sheet: toShadow(canvas.sheetShadow),
    },
    radii: {
      card: px(canvas.radius),
      button: px(canvas.btnRadius),
      sheet: px(canvas.sheetRadius),
      swatch: px(canvas.swatchRadius ?? canvas.btnRadius),
    },
    blur: toBlur(canvas.blur),
    type: {
      ui: uiFamily(canvas.ui),
      head: uiFamily(canvas.head),
      scripture: scriptureFamily(canvas.scripture),
      headWeight: headWeight(canvas.headW),
      headSize: px(canvas.headSize),
      headLetterSpacing: px(canvas.headLs),
    },
    floatingTabBar: canvas.float === true,
  };
}
