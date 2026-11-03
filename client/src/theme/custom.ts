// Appearance customisation (R-6a): the reader's own tweaks on top of a preset.
// Owned by the orchestrator. Screens code against these functions; they never edit tokens directly.
//
// - Colour edits are kept per preset, so a light preset and its dark partner each keep their own.
//   The accent tweak is a pair of edits (accent + a readable onAccent).
// - Only tokens whose preset value is a plain colour can be edited (gradients, borders and shadows
//   stay the preset's).
// - The contrast guard: an edit is refused when any text pair the preset puts on screen
//   (src/theme/contrastPairs.ts) falls below 4.5:1 and is lower than the preset's own ratio.
//   The presets' known gaps (glass text over bright glow peaks) are allowed as they are, never worse.
// - Stored edits are checked again when applied: a set that fails (an older build, a hand edit, a
//   preset retuned by John) is ignored as a whole, so the reader always gets a readable theme.
import { contrastRatio, MIN_TEXT_CONTRAST, parseColor } from './contrast';
import { pairsForCanvas, type Pair } from './contrastPairs';
import { toTheme } from './build';
import { getTheme } from './presets';
import type { CanvasTokens, Color, PresetId, ScriptureFontFamily, Theme } from './types';

/** Every canvas token that can hold a plain colour. Which ones a preset can edit: `editableTokens`. */
export const COLOR_TOKENS = [
  'bg',
  'readerBg',
  'text',
  'muted',
  'surface',
  'accent',
  'onAccent',
  'cta',
  'onCta',
  'hl',
  'hlText',
  'vnum',
  'chip',
  'chipText',
  'track',
  'bar',
  'c1',
  'c1t',
  'c1m',
  'c2',
  'c3',
  'c3t',
  'c3m',
  'tabBg',
  'tabOn',
  'tabOff',
  'tabPill',
  'sheet',
  'btn',
  'btnText',
  'grabber',
] as const satisfies readonly (keyof CanvasTokens)[];
export type ColorToken = (typeof COLOR_TOKENS)[number];

/** An edited colour: `#RRGGBB`, stored upper-case. */
export const HEX_COLOR = /^#[0-9A-F]{6}$/;

export type PresetEdits = Partial<Record<ColorToken, Color>>;

export interface AppearanceCustom {
  /** The reading font for Latin-script Scripture; null keeps the preset's (pastel: Literata, glass: Source Serif 4). */
  scriptureFont: ScriptureFontFamily | null;
  /** Colour edits per preset. */
  edits: Partial<Record<PresetId, PresetEdits>>;
}

export const NO_CUSTOM: AppearanceCustom = { scriptureFont: null, edits: {} };

export const SCRIPTURE_FONTS: readonly ScriptureFontFamily[] = ['Literata', 'SourceSerif4'];

/** The fixed accent choices (Customise → Accent), after "Preset accent". */
export const ACCENT_CHOICES = [
  { id: 'blue', color: '#1F5FAE' },
  { id: 'green', color: '#2F6B3A' },
  { id: 'rose', color: '#A62B55' },
  { id: 'violet', color: '#4E35B8' },
  { id: 'rust', color: '#A2482A' },
] as const;
export type AccentChoiceId = (typeof ACCENT_CHOICES)[number]['id'];

/** Shown instead of a fixed choice that repeats the preset's own accent (the design's rule). */
export const ACCENT_STAND_IN = '#5B6472';

/** Text on an edited accent: white or near-black, whichever reads better. */
export const ON_ACCENT_LIGHT = '#FFFFFF';
export const ON_ACCENT_DARK = '#111418';

/** Upper-cases a `#rrggbb` string; returns null for anything else. */
export function normalizeHex(input: string): Color | null {
  const s = input.trim().toUpperCase();
  return HEX_COLOR.test(s) ? s : null;
}

function isPlainColor(value: unknown): value is string {
  if (typeof value !== 'string') return false;
  try {
    parseColor(value);
    return true;
  } catch {
    return false;
  }
}

const editableCache = new Map<PresetId, readonly ColorToken[]>();

/** The tokens this preset can edit: those its canvas sets to a plain colour, in COLOR_TOKENS order. */
export function editableTokens(id: PresetId): readonly ColorToken[] {
  let list = editableCache.get(id);
  if (!list) {
    const canvas = getTheme(id).canvas;
    list = COLOR_TOKENS.filter((k) => isPlainColor(canvas[k]));
    editableCache.set(id, list);
  }
  return list;
}

const basePairsCache = new Map<PresetId, ReadonlyMap<string, number>>();

function basePairs(id: PresetId): ReadonlyMap<string, number> {
  let map = basePairsCache.get(id);
  if (!map) {
    const theme = getTheme(id);
    map = new Map(pairsForCanvas(id, theme.style, theme.canvas).map((p) => [p.name, p.ratio]));
    basePairsCache.set(id, map);
  }
  return map;
}

/** Float noise allowed when comparing a pair with the preset's own ratio (an unchanged pair is never flagged). */
const RATIO_EPSILON = 1e-9;

/** The preset's canvas with these edits on top. */
export function editedCanvas(id: PresetId, edits: PresetEdits): CanvasTokens {
  return { ...getTheme(id).canvas, ...edits };
}

/**
 * The text pairs these edits make unreadable: below 4.5:1 and lower than the preset's own ratio
 * for the same pair. Empty means the edits are allowed.
 */
export function contrastFailures(id: PresetId, edits: PresetEdits): Pair[] {
  const theme = getTheme(id);
  const base = basePairs(id);
  return pairsForCanvas(id, theme.style, editedCanvas(id, edits)).filter((p) => {
    // Raw ratios: 4.495:1 is below 4.5:1 even though it displays as 4.50 (Sol, R-6a round 1).
    if (p.ratio >= MIN_TEXT_CONTRAST) return false;
    const before = base.get(p.name);
    return before === undefined || p.ratio < before - RATIO_EPSILON;
  });
}

export type EditResult =
  | { ok: true; custom: AppearanceCustom }
  | { ok: false; reason: 'invalid-color' | 'not-editable' }
  | { ok: false; reason: 'contrast'; failures: Pair[] };

function withEdits(custom: AppearanceCustom, id: PresetId, edits: PresetEdits): AppearanceCustom {
  const next = { ...custom.edits };
  if (Object.keys(edits).length === 0) delete next[id];
  else next[id] = edits;
  return { ...custom, edits: next };
}

function check(custom: AppearanceCustom, id: PresetId, edits: PresetEdits): EditResult {
  const failures = contrastFailures(id, edits);
  if (failures.length > 0) return { ok: false, reason: 'contrast', failures };
  return { ok: true, custom: withEdits(custom, id, edits) };
}

/** Sets one token (a `#rrggbb` string) or clears it back to the preset's value (null). */
export function setTokenEdit(
  custom: AppearanceCustom,
  id: PresetId,
  token: ColorToken,
  color: string | null,
): EditResult {
  if (!editableTokens(id).includes(token)) return { ok: false, reason: 'not-editable' };
  const edits: PresetEdits = { ...custom.edits[id] };
  if (color === null) {
    delete edits[token];
  } else {
    const hex = normalizeHex(color);
    if (!hex) return { ok: false, reason: 'invalid-color' };
    edits[token] = hex;
  }
  return check(custom, id, edits);
}

/** The readable text colour for an accent. */
export function onAccentFor(accent: Color): Color {
  return contrastRatio(ON_ACCENT_LIGHT, accent) >= contrastRatio(ON_ACCENT_DARK, accent) ? ON_ACCENT_LIGHT : ON_ACCENT_DARK;
}

/** Sets the accent (with its onAccent), or goes back to the preset's accent (null). */
export function setAccent(custom: AppearanceCustom, id: PresetId, color: string | null): EditResult {
  const edits: PresetEdits = { ...custom.edits[id] };
  if (color === null) {
    delete edits.accent;
    delete edits.onAccent;
  } else {
    const hex = normalizeHex(color);
    if (!hex) return { ok: false, reason: 'invalid-color' };
    edits.accent = hex;
    edits.onAccent = onAccentFor(hex);
  }
  return check(custom, id, edits);
}

/** The accent the reader picked for this preset, or null when it is the preset's own. */
export function editedAccent(custom: AppearanceCustom, id: PresetId): Color | null {
  return custom.edits[id]?.accent ?? null;
}

/** Whether a fixed accent choice can be used on this preset (false: it fails the contrast guard). */
export function accentAllowed(custom: AppearanceCustom, id: PresetId, color: Color): boolean {
  return setAccent(custom, id, color).ok;
}

/** Drops every colour edit for this preset (Customise → Reset). The reading font is kept. */
export function resetPreset(custom: AppearanceCustom, id: PresetId): AppearanceCustom {
  return withEdits(custom, id, {});
}

/** The edits that apply to this preset: none if any is not editable or the set fails the guard. */
export function validEdits(custom: AppearanceCustom, id: PresetId): PresetEdits {
  const edits = custom.edits[id];
  if (!edits) return {};
  const allowed = editableTokens(id);
  for (const [k, v] of Object.entries(edits)) {
    if (!allowed.includes(k as ColorToken) || typeof v !== 'string' || !HEX_COLOR.test(v)) return {};
  }
  return contrastFailures(id, edits).length === 0 ? edits : {};
}

/** The theme the reader sees: the preset, their valid colour edits and their reading font. */
export function applyCustom(id: PresetId, custom: AppearanceCustom): Theme {
  const base = getTheme(id);
  const edits = validEdits(custom, id);
  const hasEdits = Object.keys(edits).length > 0;
  const font = custom.scriptureFont;
  if (!hasEdits && (font === null || font === base.type.scripture)) return base;
  const theme = hasEdits ? toTheme(id, editedCanvas(id, edits)) : base;
  return font === null || font === theme.type.scripture ? theme : { ...theme, type: { ...theme.type, scripture: font } };
}
