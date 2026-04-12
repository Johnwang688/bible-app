export type ThemeTier = 'free' | 'standard' | 'premium' | 'legendary';

export interface AppThemeDef {
  id: string;
  name: string;
  swatches: string[];
  /** Matches `--logo-color` in globals.css. */
  logoColor: 'white' | 'dark';
  shop: {
    tier: ThemeTier;
    price: number;
    description: string;
    specialEffect?: string;
  };
}

export const APP_THEMES: AppThemeDef[] = [
  {
    id: 'default',
    name: 'Default',
    swatches: ['#faf7f0', '#efdfcb', '#6d4c31', '#221d16'],
    logoColor: 'dark',
    shop: {
      tier: 'free',
      price: 0,
      description: 'Warm parchment with the classic Open Bible look.',
    },
  },
  {
    id: 'dark',
    name: 'Dark',
    swatches: ['#16130f', '#342618', '#c9956a', '#ede8df'],
    logoColor: 'white',
    shop: {
      tier: 'free',
      price: 0,
      description: 'Low-glare dark reading with warm bronze accents.',
    },
  },
  {
    id: 'dynamic',
    name: 'Dynamic',
    swatches: ['#FBDED8', '#FBF8D8', '#E1F8D8', '#E1F8F2', '#E1DEF2', '#FBDEF2'],
    logoColor: 'dark',
    shop: {
      tier: 'premium',
      price: 1200,
      description: 'A rotating palette that keeps the app feeling alive.',
      specialEffect: 'Animated color cycling',
    },
  },
  {
    id: 'pink',
    name: 'Pastel Pink',
    swatches: ['#ffe4eb', '#ffd4e0', '#c01848', '#14060c'],
    logoColor: 'dark',
    shop: {
      tier: 'standard',
      price: 400,
      description: 'Soft rose tones with a playful reading feel.',
      specialEffect: 'Floating heart particles',
    },
  },
  {
    id: 'blue',
    name: 'Pastel Blue',
    swatches: ['#d9e7f5', '#cddff2', '#185088', '#040a14'],
    logoColor: 'dark',
    shop: {
      tier: 'standard',
      price: 400,
      description: 'Cool sky blues for a calm, airy layout.',
    },
  },
  {
    id: 'green',
    name: 'Pastel Green',
    swatches: ['#e1f9e1', '#cbf5cb', '#0c5c0c', '#030c04'],
    logoColor: 'dark',
    shop: {
      tier: 'standard',
      price: 400,
      description: 'Fresh green tones that stay easy on the eyes.',
    },
  },
  {
    id: 'yellow',
    name: 'Pastel Yellow',
    swatches: ['#faf8e4', '#fff2c4', '#886000', '#181400'],
    logoColor: 'dark',
    shop: {
      tier: 'standard',
      price: 400,
      description: 'Sunlit paper tones with gentle contrast.',
    },
  },
  {
    id: 'purple',
    name: 'Pastel Purple',
    swatches: ['#e8e1f1', '#dacfe9', '#5c2888', '#0c0418'],
    logoColor: 'dark',
    shop: {
      tier: 'standard',
      price: 400,
      description: 'Muted lavender with a soft study-room feel.',
    },
  },
  {
    id: 'orange',
    name: 'Pastel Orange',
    swatches: ['#fcefe3', '#ffe1cc', '#a84018', '#140802'],
    logoColor: 'dark',
    shop: {
      tier: 'standard',
      price: 400,
      description: 'Warm apricot tones with a little extra energy.',
    },
  },
  {
    id: 'gold',
    name: 'Gold & Silver',
    swatches: ['#c9a84c', '#b89030', '#5c3e08', '#5a6068'],
    logoColor: 'dark',
    shop: {
      tier: 'premium',
      price: 900,
      description: 'Metallic gold paired with cool silver contrast.',
    },
  },
  {
    id: 'midnight',
    name: 'Midnight Blue',
    swatches: ['#003366', '#002b55', '#4d9fe0', '#f5f5f5'],
    logoColor: 'white',
    shop: {
      tier: 'premium',
      price: 900,
      description: 'Deep ocean blues with bright text and accents.',
    },
  },
  {
    id: 'rebecca',
    name: 'Indigo',
    swatches: ['#3c3c8c', '#2e2e72', '#9fa8ff', '#f5f5f5'],
    logoColor: 'white',
    shop: {
      tier: 'premium',
      price: 900,
      description: 'Rich indigo surfaces with a cool luminous edge.',
    },
  },
  {
    id: 'galaxy',
    name: 'Galaxy',
    swatches: ['#301058', '#9a90b0', '#e8c478', '#f4f0ff'],
    logoColor: 'white',
    shop: {
      tier: 'legendary',
      price: 3500,
      description: 'A cosmic purple palette built for dramatic reading.',
      specialEffect: 'Nebula and comet particles',
    },
  },
  {
    id: 'parchment',
    name: 'Parchment Gold',
    swatches: ['#f5e7a1', '#edd878', '#5a4200', '#3a3a3a'],
    logoColor: 'dark',
    shop: {
      tier: 'premium',
      price: 900,
      description: 'A brighter parchment finish with gold trim.',
    },
  },
  {
    id: 'teal',
    name: 'Deep Teal',
    swatches: ['#0f4c5c', '#0a3848', '#5ee8f0', '#d9f3f4'],
    logoColor: 'white',
    shop: {
      tier: 'premium',
      price: 900,
      description: 'Dark teal panels with crisp aqua highlights.',
    },
  },
  {
    id: 'forest',
    name: 'Forest Rose',
    swatches: ['#283618', '#1e2a12', '#FFB5A7', '#ffd6cc'],
    logoColor: 'white',
    shop: {
      tier: 'premium',
      price: 900,
      description: 'Earthy green balanced by a soft rose accent.',
    },
  },
  {
    id: 'magenta',
    name: 'Magenta Aqua',
    swatches: ['#4A1942', '#5c2254', '#48cae4', '#90E0EF'],
    logoColor: 'white',
    shop: {
      tier: 'premium',
      price: 900,
      description: 'Dark magenta with bright aqua contrast.',
    },
  },
  {
    id: 'emerald',
    name: 'Emerald Gold',
    swatches: ['#0B3D2E', '#144d3a', '#f0c040', '#F4D35E'],
    logoColor: 'white',
    shop: {
      tier: 'premium',
      price: 900,
      description: 'A jewel-toned green theme with golden highlights.',
    },
  },
  {
    id: 'canyon',
    name: 'Canyon Mint',
    swatches: ['#4C1D06', '#5e2608', '#8ee8cc', '#B8F2E6'],
    logoColor: 'white',
    shop: {
      tier: 'premium',
      price: 900,
      description: 'Terracotta warmth paired with cool mint contrast.',
    },
  },
  {
    id: 'neonrose',
    name: 'Pink',
    swatches: ['#000000', '#F77FBE', '#FF71CD', '#FF71CD'],
    logoColor: 'white',
    shop: {
      tier: 'premium',
      price: 900,
      description: 'High-contrast black and neon pink for a bold look.',
    },
  },
];

export const LEGACY_THEME_ID_MAP: Record<string, string> = {
  'Galaxy Metallic': 'galaxy',
  'galaxy metallic': 'galaxy',
};

export const LEGACY_SHOP_THEME_ID_MAP: Record<string, string> = {
  'theme-dawn': 'default',
  'theme-olive': 'green',
  'theme-nocturne': 'dark',
  'theme-crimson': 'canyon',
};

export function normalizeThemeId(rawTheme: string | null | undefined) {
  if (!rawTheme) return 'default';
  const mappedTheme = LEGACY_THEME_ID_MAP[rawTheme] ?? rawTheme;
  return APP_THEMES.some((theme) => theme.id === mappedTheme) ? mappedTheme : 'default';
}
