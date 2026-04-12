// Shop catalog: themes, companions, scrolls, boosts - pure data + display helpers.

import { APP_THEMES, type ThemeTier } from '@/lib/themes';

export interface ThemeItem {
  id: string;
  name: string;
  tier: ThemeTier;
  price: number;
  description: string;
  swatches: string[];
  specialEffect?: string;
}

export type CompanionRarity = 'uncommon' | 'rare' | 'epic' | 'legendary' | 'mythic';

export interface CompanionItem {
  id: string;
  name: string;
  title: string;
  book: string;
  emoji: string;
  rarity: CompanionRarity;
}

export interface ShopScroll {
  id: string;
  name: string;
  price: number;
  pulls: number;
  guarantee: string;
  flavour: string;
  emoji: string;
  discountPercentOff?: number;
  compareAtPrice?: number;
  /** Drop rates per rarity (values should sum to 100). */
  dropRates: Partial<Record<CompanionRarity, number>>;
  /** How many of the final pulls use sacredDropRates instead (e.g. Oracle Bundle's 1 Sacred pull). */
  sacredPulls?: number;
  /** Drop rates for the sacred sub-pulls (if sacredPulls > 0). */
  sacredDropRates?: Partial<Record<CompanionRarity, number>>;
}

export type ScrollType = (typeof SHOP_SCROLLS)[number]['id'];

export interface ShopBoost {
  id: string;
  name: string;
  description: string;
  detail: string;
  emoji: string;
  color: string;
  price: number;
}

export const TIER_LABEL: Record<ThemeTier, string> = {
  free: 'Free',
  standard: 'Standard',
  premium: 'Premium',
  legendary: 'Legendary',
};

export const TIER_COLOR: Record<ThemeTier, string> = {
  free: '#94a3b8',
  standard: '#38bdf8',
  premium: '#a78bfa',
  legendary: '#fbbf24',
};

export const RARITY_LABEL: Record<CompanionRarity, string> = {
  uncommon: 'Uncommon',
  rare: 'Rare',
  epic: 'Epic',
  legendary: 'Legendary',
  mythic: 'Mythic',
};

export const RARITY_COLOR: Record<CompanionRarity, string> = {
  uncommon: '#22c55e',
  rare: '#3b82f6',
  epic: '#a855f7',
  legendary: '#f59e0b',
  mythic: '#ec4899',
};

export const RARITY_GLOW: Record<CompanionRarity, string> = {
  uncommon: 'rgba(34, 197, 94, 0.55)',
  rare: 'rgba(59, 130, 246, 0.55)',
  epic: 'rgba(168, 85, 247, 0.55)',
  legendary: 'rgba(245, 158, 11, 0.55)',
  mythic: 'rgba(236, 72, 153, 0.6)',
};

/** Ascending order used for trade-up grouping (low → high). */
export const COMPANION_RARITY_ASC: CompanionRarity[] = [
  'uncommon',
  'rare',
  'epic',
  'legendary',
  'mythic',
];

const RARITY_ORDER: Record<CompanionRarity, number> = {
  uncommon: 0,
  rare: 1,
  epic: 2,
  legendary: 3,
  mythic: 4,
};

export function nextCompanionRarity(r: CompanionRarity): CompanionRarity | null {
  const i = RARITY_ORDER[r];
  if (i >= COMPANION_RARITY_ASC.length - 1) return null;
  return COMPANION_RARITY_ASC[i + 1] ?? null;
}


export const SHOP_THEMES: ThemeItem[] = APP_THEMES.map((theme) => ({
  id: theme.id,
  name: theme.name,
  tier: theme.shop.tier,
  price: theme.shop.price,
  description: theme.shop.description,
  swatches: theme.swatches,
  specialEffect: theme.shop.specialEffect,
}));

export const SHOP_COMPANIONS: CompanionItem[] = [
  { id: 'c-ruth', name: 'Ruth', title: 'Loyal heart', book: 'Ruth', emoji: '🌾', rarity: 'uncommon' },
  { id: 'c-david', name: 'David', title: 'Shepherd poet', book: 'Psalms', emoji: '🎵', rarity: 'uncommon' },
  { id: 'c-deborah', name: 'Deborah', title: 'Judge & prophet', book: 'Judges', emoji: '⚔️', rarity: 'uncommon' },
  { id: 'c-daniel', name: 'Daniel', title: 'Faith in exile', book: 'Daniel', emoji: '🦁', rarity: 'rare' },
  { id: 'c-mary', name: 'Mary', title: 'Mother of the Messiah', book: 'Luke', emoji: '✨', rarity: 'rare' },
  { id: 'c-peter', name: 'Peter', title: 'Rock of faith', book: 'Acts', emoji: '⛵', rarity: 'rare' },
  { id: 'c-paul', name: 'Paul', title: 'Apostle to nations', book: 'Romans', emoji: '📜', rarity: 'epic' },
  { id: 'c-john', name: 'John', title: 'Beloved disciple', book: 'John', emoji: '🕊️', rarity: 'epic' },
  { id: 'c-esther', name: 'Esther', title: 'For such a time', book: 'Esther', emoji: '👑', rarity: 'epic' },
  { id: 'c-moses', name: 'Moses', title: 'Lawgiver', book: 'Exodus', emoji: '🏔️', rarity: 'legendary' },
  { id: 'c-elijah', name: 'Elijah', title: 'Prophet of fire', book: '1 Kings', emoji: '🔥', rarity: 'legendary' },
  { id: 'c-johnb', name: 'John the Baptist', title: 'Voice in wilderness', book: 'Matthew', emoji: '💧', rarity: 'legendary' },
  { id: 'c-jesus', name: 'Jesus', title: 'Christ the Lord', book: 'Revelation', emoji: '✝️', rarity: 'mythic' },
];

/** Ancient Scroll drop rates: 50% Uncommon · 30% Rare · 15% Epic · 4.7% Mythic · 0.3% Legendary */
const ANCIENT_DROP_RATES: Partial<Record<CompanionRarity, number>> = {
  uncommon: 50,
  rare: 30,
  epic: 15.8,
  legendary: 4.0,
  mythic: 0.2,
};

/** Sacred Scroll drop rates (no Uncommon): 50% Rare · 35% Epic · 10% Legendary · 5% Mythic */
const SACRED_DROP_RATES: Partial<Record<CompanionRarity, number>> = {
  rare: 55,
  epic: 34,
  legendary: 10,
  mythic: 1.0,
};

export const SHOP_SCROLLS: ShopScroll[] = [
  {
    id: 'scroll-novice',
    name: 'Ancient Scroll',
    price: 80,
    pulls: 1,
    guarantee: 'Uncommon or higher guranteed',
    flavour: 'A gentle start for your collection.',
    emoji: '📜',
    dropRates: ANCIENT_DROP_RATES,
  },
  {
    id: 'scroll-scholar',
    name: 'Sacred Scroll',
    price: 240,
    pulls: 1,
    guarantee: 'Rare or higher guranteed',
    flavour: 'Better odds toward epic finds.',
    emoji: '📘',
    dropRates: SACRED_DROP_RATES,
  },
  {
    id: 'scroll-oracle',
    name: 'Oracle Bundle',
    price: 800,
    pulls: 10,
    guarantee: '',
    flavour: 'Bundle of 9 Ancient scrolls and 1 Sacred scroll.',
    emoji: '🔮',
    discountPercentOff: 17,
    compareAtPrice: 960,
    dropRates: ANCIENT_DROP_RATES,
    sacredPulls: 1,
    sacredDropRates: SACRED_DROP_RATES,
  },
];

export const SHOP_BOOSTS: ShopBoost[] = [
  {
    id: 'hint-token',
    name: 'Hint Token',
    description: 'Reveal the correct answer once per quiz.',
    detail: 'Consumes one token when you tap Hint.',
    emoji: '💡',
    color: '#fbbf24',
    price: 10,
  },
  {
    id: 'shield',
    name: 'Grace Shield',
    description: 'Pass a quiz even if you get all questions wrong. ',
    detail: 'One use per quiz attempt when enabled.',
    emoji: '🛡️',
    color: '#38bdf8',
    price: 20,
  },
  {
    id: 'coin-rush',
    name: 'Coin Rush',
    description: '2× quiz coins on your next graded quiz.',
    detail: 'Use before opening a quiz. Each quiz consumes one charge.',
    emoji: '⚡',
    color: '#f97316',
    price: 20,
  },
  {
    id: 'blessing',
    name: 'Study Blessing',
    description: '24 hours of 2× quiz coins.',
    detail: 'Does not stack with Coin Rush — blessing takes priority.',
    emoji: '🙏',
    color: '#a855f7',
    price: 200,
  },
];
