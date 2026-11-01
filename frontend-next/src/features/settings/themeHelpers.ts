import type { CSSProperties } from 'react';
import { APP_THEMES, type AppliedTheme, type AppThemeDef } from '@/lib/themes';

export const THEMES: AppThemeDef[] = APP_THEMES;

export function getThemeCardStyle(theme: AppThemeDef): CSSProperties {
  const [bg, border, swatchAccent, text] = theme.swatches;
  const accent = theme.cardAccent ?? swatchAccent;
  return {
    '--theme-card-bg': bg,
    '--theme-card-border': border,
    '--theme-card-hover': accent,
    '--theme-card-accent': accent,
    '--theme-card-text': text,
  } as CSSProperties;
}

export const THEME_LOGO_SRC: Record<'white' | 'dark', string> = {
  white: '/logo/openbible-logo-white.png',
  dark: '/logo/openbible-logo-black.png',
};

/** The logo follows the applied mode (not the preference): white on dark, black otherwise. */
export function logoSrcForTheme(appliedTheme: AppliedTheme): string {
  const def = THEMES.find(t => t.id === appliedTheme);
  return THEME_LOGO_SRC[def?.logoColor ?? 'dark'];
}
