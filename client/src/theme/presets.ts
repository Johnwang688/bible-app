// The 12 presets: their registry (order, light/dark pairs, message keys) and the built themes.
import { buildCanvasTokens, toTheme } from './build';
import { PRESET_IDS, type PresetId, type Theme, type ThemeMode, type ThemeStyle } from './types';

export interface PresetMeta {
  id: PresetId;
  style: ThemeStyle;
  mode: ThemeMode;
  /** The matched preset in the other mode, or null for a standalone one. */
  pair: PresetId | null;
  nameKey: `preset.${PresetId}`;
}

const meta = (id: PresetId, style: ThemeStyle, mode: ThemeMode, pair: PresetId | null): PresetMeta => ({
  id,
  style,
  mode,
  pair,
  nameKey: `preset.${id}`,
});

/** In canvas order: pastel light, pastel dark, glass light, glass dark. */
export const PRESETS: readonly PresetMeta[] = [
  meta('strawberry-milk', 'pastel', 'light', 'bubblegum-night'),
  meta('matcha-latte', 'pastel', 'light', 'matcha-night'),
  meta('lavender-haze', 'pastel', 'light', 'grape-soda'),
  meta('bubblegum-night', 'pastel', 'dark', 'strawberry-milk'),
  meta('matcha-night', 'pastel', 'dark', 'matcha-latte'),
  meta('grape-soda', 'pastel', 'dark', 'lavender-haze'),
  meta('liberty', 'glass', 'light', null),
  meta('silver', 'glass', 'light', 'graphite'),
  meta('sky', 'glass', 'light', 'deep-blue'),
  meta('northern-lights', 'glass', 'dark', null),
  meta('graphite', 'glass', 'dark', 'silver'),
  meta('deep-blue', 'glass', 'dark', 'sky'),
];

export const THEMES: Readonly<Record<PresetId, Theme>> = Object.fromEntries(
  PRESET_IDS.map((id) => [id, toTheme(id, buildCanvasTokens(id))]),
) as Record<PresetId, Theme>;

export function getTheme(id: PresetId): Theme {
  return THEMES[id];
}
