export interface AppThemeDef {
  id: string;
  name: string;
  swatches: string[];
  /** Matches `--logo-color` in globals.css. */
  logoColor: 'white' | 'dark';
}

export const APP_THEMES: AppThemeDef[] = [
  {
    id: 'default',
    name: 'Default',
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
    id: 'dynamic',
    name: 'Dynamic',
    swatches: ['#FBDED8', '#FBF8D8', '#E1F8D8', '#E1F8F2', '#E1DEF2', '#FBDEF2'],
    logoColor: 'dark',
  },
  {
    id: 'pink',
    name: 'Pastel Pink',
    swatches: ['#ffe4eb', '#ffd4e0', '#c01848', '#14060c'],
    logoColor: 'dark',
  },
  {
    id: 'blue',
    name: 'Pastel Blue',
    swatches: ['#d9e7f5', '#cddff2', '#185088', '#040a14'],
    logoColor: 'dark',
  },
  {
    id: 'green',
    name: 'Pastel Green',
    swatches: ['#e1f9e1', '#cbf5cb', '#0c5c0c', '#030c04'],
    logoColor: 'dark',
  },
  {
    id: 'yellow',
    name: 'Pastel Yellow',
    swatches: ['#faf8e4', '#fff2c4', '#886000', '#181400'],
    logoColor: 'dark',
  },
  {
    id: 'purple',
    name: 'Pastel Purple',
    swatches: ['#e8e1f1', '#dacfe9', '#5c2888', '#0c0418'],
    logoColor: 'dark',
  },
  {
    id: 'orange',
    name: 'Pastel Orange',
    swatches: ['#fcefe3', '#ffe1cc', '#a84018', '#140802'],
    logoColor: 'dark',
  },
  {
    id: 'gold',
    name: 'Gold & Silver',
    swatches: ['#c9a84c', '#b89030', '#5c3e08', '#5a6068'],
    logoColor: 'dark',
  },
  {
    id: 'midnight',
    name: 'Midnight Blue',
    swatches: ['#003366', '#002b55', '#4d9fe0', '#f5f5f5'],
    logoColor: 'white',
  },
  {
    id: 'rebecca',
    name: 'Indigo',
    swatches: ['#3c3c8c', '#2e2e72', '#9fa8ff', '#f5f5f5'],
    logoColor: 'white',
  },
  {
    id: 'galaxy',
    name: 'Galaxy',
    swatches: ['#301058', '#9a90b0', '#e8c478', '#f4f0ff'],
    logoColor: 'white',
  },
  {
    id: 'parchment',
    name: 'Parchment Gold',
    swatches: ['#f5e7a1', '#edd878', '#5a4200', '#3a3a3a'],
    logoColor: 'dark',
  },
  {
    id: 'teal',
    name: 'Deep Teal',
    swatches: ['#0f4c5c', '#0a3848', '#5ee8f0', '#d9f3f4'],
    logoColor: 'white',
  },
  {
    id: 'forest',
    name: 'Forest Rose',
    swatches: ['#283618', '#1e2a12', '#FFB5A7', '#ffd6cc'],
    logoColor: 'white',
  },
  {
    id: 'magenta',
    name: 'Magenta Aqua',
    swatches: ['#4A1942', '#5c2254', '#48cae4', '#90E0EF'],
    logoColor: 'white',
  },
  {
    id: 'emerald',
    name: 'Emerald Gold',
    swatches: ['#0B3D2E', '#144d3a', '#f0c040', '#F4D35E'],
    logoColor: 'white',
  },
  {
    id: 'canyon',
    name: 'Canyon Mint',
    swatches: ['#4C1D06', '#5e2608', '#8ee8cc', '#B8F2E6'],
    logoColor: 'white',
  },
  {
    id: 'neonrose',
    name: 'Pink',
    swatches: ['#000000', '#F77FBE', '#FF71CD', '#FF71CD'],
    logoColor: 'white',
  },
];

export const LEGACY_THEME_ID_MAP: Record<string, string> = {
  'Galaxy Metallic': 'galaxy',
  'galaxy metallic': 'galaxy',
};

export function normalizeThemeId(rawTheme: string | null | undefined) {
  if (!rawTheme) return 'default';
  const mappedTheme = LEGACY_THEME_ID_MAP[rawTheme] ?? rawTheme;
  return APP_THEMES.some((theme) => theme.id === mappedTheme) ? mappedTheme : 'default';
}
