import type { CSSProperties } from 'react';
import { APP_THEMES, type AppThemeDef } from '@/lib/themes';

export const THEMES: AppThemeDef[] = APP_THEMES;
export const THEME_GRID_PREVIEW_COUNT = 5;

/** When collapsed, show the first N themes; if the active theme is not among them, swap it in so selection stays visible. */
export function themesForCollapsedPicker(currentThemeId: string, previewCount: number): AppThemeDef[] {
  const preview = THEMES.slice(0, previewCount);
  if (preview.some(t => t.id === currentThemeId)) return preview;
  const current = THEMES.find(t => t.id === currentThemeId);
  if (!current) return preview;
  const rest = THEMES.filter(t => t.id !== currentThemeId).slice(0, previewCount - 1);
  return [current, ...rest];
}

export function getThemeCardStyle(theme: AppThemeDef): CSSProperties {
  const [bg, border, accent, text] = theme.id === 'dynamic'
    ? [DYNAMIC_PREVIEW_BG, DYNAMIC_PREVIEW_BORDER, DYNAMIC_PREVIEW_ACCENT, '#221d16']
    : theme.swatches;
  return {
    '--theme-card-bg': bg,
    '--theme-card-border': border,
    '--theme-card-hover': accent,
    '--theme-card-accent': accent,
    '--theme-card-text': text,
  } as CSSProperties;
}

export const DYNAMIC_BASE_THEME    = 'default';

export const THEME_LOGO_SRC: Record<'white' | 'dark', string> = {
  white: '/logo/openbible-logo-white.png',
  dark: '/logo/openbible-logo-black.png',
};

export function logoSrcForTheme(themeId: string): string {
  const id = themeId === 'dynamic' ? DYNAMIC_BASE_THEME : themeId;
  const def = THEMES.find(t => t.id === id);
  return THEME_LOGO_SRC[def?.logoColor ?? 'dark'];
}
export const DYNAMIC_COLORS        = ['#FF0000', '#FFFF00', '#00FF00', '#00FFFF', '#0000FF', '#FF00FF'];
export const DYNAMIC_FADE_MS       = 3000;
export const DYNAMIC_CYCLE_MS      = DYNAMIC_FADE_MS * 2;
export const DYNAMIC_PREVIEW_BG    = '#f7f7f7';
export const DYNAMIC_PREVIEW_BORDER = '#ddd2c3';
export const DYNAMIC_PREVIEW_ACCENT = '#d8cce8';

export function hexToRgb(hex: string) {
  const n = parseInt(hex.replace('#', ''), 16);
  return { r: (n >> 16) & 255, g: (n >> 8) & 255, b: n & 255 };
}
