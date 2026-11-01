// Shared theme types. Owned by the orchestrator (R-0): builders and screens code against these.

export type ThemeStyle = 'pastel' | 'glass';
export type ThemeMode = 'light' | 'dark';

export const PRESET_IDS = [
  'strawberry-milk',
  'matcha-latte',
  'lavender-haze',
  'bubblegum-night',
  'matcha-night',
  'grape-soda',
  'liberty',
  'silver',
  'sky',
  'northern-lights',
  'graphite',
  'deep-blue',
] as const;
export type PresetId = (typeof PRESET_IDS)[number];

/** Skipping the look picker gives Silver in light mode and Graphite in dark mode. */
export const DEFAULT_PRESET: Record<ThemeMode, PresetId> = { light: 'silver', dark: 'graphite' };

/** A CSS colour: `#RRGGBB` or `rgba(r, g, b, a)`. */
export type Color = string;

/**
 * A design-canvas background: either one colour, or CSS gradient layers that may end in a
 * colour layer (exactly the CSS `background` value the canvas uses).
 */
export type Paint = string;

/**
 * The design canvas tokens for one preset, exactly as the canvas builders return them
 * (CSS strings: "16px", "2.5px solid #1B1B1F", font stacks). Optional keys exist in only
 * some builders.
 */
export interface CanvasTokens {
  bg: Paint;
  readerBg?: Paint;
  text: Color;
  muted: Color;
  surface: Paint;
  border: string;
  radius: string;
  shadow: string;
  blur: string;
  accent: Color;
  onAccent: Color;
  cta?: Color;
  onCta?: Color;
  ctaShadow: string;
  hl: Color;
  hlText?: Color;
  vnum: Color;
  ui: string;
  head: string;
  scripture: string;
  headW: string;
  headSize: string;
  headLs: string;
  chip: Paint;
  chipText: Color;
  track: Color;
  bar?: Color;
  btnRadius: string;
  btnBorder?: string;
  c1?: Color;
  c1t?: Color;
  c1m?: Color;
  c2?: Color;
  c3?: Color;
  c3t?: Color;
  c3m?: Color;
  tabBg: Paint;
  tabBorder: string;
  tabOn: Color;
  tabOff: Color;
  tabPill?: Color;
  tabShadow?: string;
  float?: boolean;
  sheet: Paint;
  sheetBorder: string;
  sheetRadius: string;
  sheetShadow: string;
  btn: Paint;
  btnText?: Color;
  swatchRadius?: string;
  grabber?: Color;
}

/** Font families registered by src/fonts (the names passed to `fontFamily`). */
export type UiFontFamily = 'SpaceGrotesk' | 'PlusJakartaSans';
export type ScriptureFontFamily = 'Literata' | 'SourceSerif4';

export interface Border {
  width: number;
  color: Color;
}

/**
 * A React Native background. `backgroundColor` is always set (the colour layer, or the
 * base colour under the gradients); `backgroundImage` holds the CSS gradient layers, if any.
 */
export interface Background {
  backgroundColor: Color;
  backgroundImage?: string;
}

/** Solid colours, with fallbacks resolved so every preset has every key. */
export interface ThemeColors {
  /** The solid base colour of the screen: pastel `bg`, glass `base`. */
  base: Color;
  text: Color;
  muted: Color;
  accent: Color;
  onAccent: Color;
  /** Pastel `cta`; glass has none and uses `accent`. */
  cta: Color;
  /** Pastel `onCta`; glass uses `onAccent`. */
  onCta: Color;
  hl: Color;
  /** Text on a highlight: `hlText`, else `text`. */
  hlText: Color;
  vnum: Color;
  chipText: Color;
  track: Color;
  tabOn: Color;
  tabOff: Color;
  /** Text on a plain button: `btnText`, else `text`. */
  btnText: Color;
}

/** The React Native form of a preset. Built from CanvasTokens by src/theme/build.ts. */
export interface Theme {
  id: PresetId;
  style: ThemeStyle;
  mode: ThemeMode;
  /** The exact canvas tokens this theme was built from. */
  canvas: CanvasTokens;
  colors: ThemeColors;
  backgrounds: {
    /** Behind Home and other screens (glass: the orbs plus the wash). */
    app: Background;
    /** Behind Scripture: `readerBg`, else `bg` (glass: the wash only, never the orbs). */
    reader: Background;
    surface: Background;
    chip: Background;
    tabBar: Background;
    sheet: Background;
    button: Background;
  };
  borders: {
    card: Border;
    /** `btnBorder`; null when the canvas gives none (glass). */
    button: Border | null;
    tabBar: Border;
    sheet: Border;
  };
  /** CSS box-shadow strings for React Native's `boxShadow` style; null for "none". */
  shadows: {
    card: string | null;
    cta: string;
    tabBar: string | null;
    sheet: string | null;
  };
  radii: { card: number; button: number; sheet: number; swatch: number };
  /** The canvas backdrop filter; null for "none". `radius` is the blur in px (0 for none). */
  blur: { css: string | null; radius: number };
  type: {
    ui: UiFontFamily;
    head: UiFontFamily;
    scripture: ScriptureFontFamily;
    headWeight: '700' | '800';
    headSize: number;
    headLetterSpacing: number;
  };
  /** Glass floats the tab bar above the content; pastel docks it. */
  floatingTabBar: boolean;
}

/** Light/dark: follow the phone, or fixed. */
export type ModePreference = 'system' | ThemeMode;

/** What the reader picked in Appearance. `preset: null` means the look picker was skipped. */
export interface AppearanceChoice {
  preset: PresetId | null;
  mode: ModePreference;
}
