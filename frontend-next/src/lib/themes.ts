/** What the user chose (stored in `localStorage['theme']` and synced to the account). */
export type ThemePreference = 'system' | 'default' | 'dark' | 'paper';

/** What is painted (`<html data-theme>`). */
export type AppliedTheme = 'default' | 'dark' | 'paper';

export interface AppThemeDef {
  id: ThemePreference;
  name: string;
  swatches: string[];
  /** Overrides the swatch accent used for the card's hover and selected border. */
  cardAccent?: string;
  /** Matches `--logo-color` in globals.css. Auto has none: its logo follows the applied mode. */
  logoColor?: 'white' | 'dark';
}

export const APP_THEMES: AppThemeDef[] = [
  {
    id: 'system',
    name: 'Auto',
    swatches: ['#faf7f0', '#efdfcb', '#342618', '#16130f'],
    cardAccent: '#8a6a4a',
  },
  {
    id: 'default',
    name: 'Light',
    swatches: ['#faf7f0', '#efdfcb', '#6d4c31', '#221d16'],
    logoColor: 'dark',
  },
  {
    id: 'dark',
    name: 'Dark',
    swatches: ['#16130f', '#342618', '#c9956a', '#ede8df'],
    logoColor: 'white',
  },
  {
    id: 'paper',
    name: 'Paper',
    swatches: ['#f4ecd8', '#d9caa8', '#8a5a2b', '#3b2f20'],
    logoColor: 'dark',
  },
];

/**
 * Every theme id the app has ever written, mapped to the preference that replaces it.
 * The pre-paint script in `src/app/layout.tsx` carries an inline copy: keep them in step.
 */
const THEME_MIGRATION: Record<string, ThemePreference> = {
  system: 'system',
  paper: 'paper',
  dark: 'dark',
  midnight: 'dark',
  rebecca: 'dark',
  galaxy: 'dark',
  'Galaxy Metallic': 'dark',
  'galaxy metallic': 'dark',
  teal: 'dark',
  forest: 'dark',
  magenta: 'dark',
  emerald: 'dark',
  canyon: 'dark',
  neonrose: 'dark',
  parchment: 'paper',
  gold: 'paper',
  // Pastel and animated themes become an explicit Light.
  dynamic: 'default',
  pink: 'default',
  blue: 'default',
  green: 'default',
  yellow: 'default',
  purple: 'default',
  orange: 'default',
};

const CURRENT_PREFERENCES: readonly string[] = ['system', 'default', 'dark', 'paper'];

/**
 * The one migration: turns any stored, synced or legacy theme id into a current preference.
 * Missing, unknown and `'default'` all become Auto: the old app wrote `'default'` for everyone
 * who never chose, so a legacy `'default'` cannot be told apart from "no choice".
 *
 * Once a value has been migrated (`localStorage['theme-version']` is `'2'`, written by the
 * pre-paint script), `'default'` means an explicit Light, so pass `alreadyMigrated` to keep it.
 */
export function normalizeThemeId(rawTheme: string | null | undefined, alreadyMigrated = false): ThemePreference {
  if (!rawTheme) return 'system';
  if (alreadyMigrated && CURRENT_PREFERENCES.includes(rawTheme)) return rawTheme as ThemePreference;
  if (!Object.prototype.hasOwnProperty.call(THEME_MIGRATION, rawTheme)) return 'system';
  return THEME_MIGRATION[rawTheme];
}

/** Resolves a preference to the mode that is painted; Auto follows the device. */
export function resolveAppliedTheme(pref: ThemePreference, prefersDark: boolean): AppliedTheme {
  if (pref === 'system') return prefersDark ? 'dark' : 'default';
  return pref;
}
