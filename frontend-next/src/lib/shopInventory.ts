import { STORAGE_KEYS } from '@/lib/storageKeys';
import {
  SHOP_BOOSTS,
  SHOP_COMPANIONS,
  SHOP_SCROLLS,
  SHOP_THEMES,
  type CompanionItem,
  type CompanionRarity,
  nextCompanionRarity,
} from '@/lib/shopItems';
import { LEGACY_SHOP_THEME_ID_MAP } from '@/lib/themes';

// ── Types ─────────────────────────────────────────────────────────────────────

export type OwnedCompanion = { id: string; quantity: number };

export type TradeUpSelection = { companionId: string; quantity: number }[];

export type GachaPull = {
  companion: CompanionItem;
  isNew: boolean;
  quantityAfter: number;
};

export type QuizCoinMultiplier = 'none' | 'blessing' | 'coin_rush';

export type Inventory = {
  unlockedThemes: string[];
  companions: OwnedCompanion[];
  equippedCompanion: string | null;
  boosts: Record<string, number>;
  coinRushArmed: boolean;
  blessingExpiresAt: number | null;
  /** Coins marked as spent locally against the last known server wallet (session UX). */
  coinsSpent: number;
};

export const SHOP_INVENTORY_RESET_EVENT = 'bible-app-shop-inventory-reset';

export const TRADE_UP_COPIES_REQUIRED = 5;

// ── Storage ───────────────────────────────────────────────────────────────────

function defaultInventory(): Inventory {
  return {
    unlockedThemes: ['default'],
    companions: [],
    equippedCompanion: null,
    boosts: Object.fromEntries(SHOP_BOOSTS.map((b) => [b.id, 0])) as Record<string, number>,
    coinRushArmed: false,
    blessingExpiresAt: null,
    coinsSpent: 0,
  };
}

function normalize(inv: Partial<Inventory> | null | undefined): Inventory {
  const base = defaultInventory();
  if (!inv || typeof inv !== 'object') return base;
  const boosts = { ...base.boosts, ...(inv.boosts ?? {}) };
  const validThemeIds = new Set(SHOP_THEMES.map((theme) => theme.id));
  for (const b of SHOP_BOOSTS) {
    if (typeof boosts[b.id] !== 'number' || boosts[b.id]! < 0) boosts[b.id] = 0;
  }
  const unlockedThemes = Array.isArray(inv.unlockedThemes)
    ? Array.from(
        new Set(
          inv.unlockedThemes
            .map((themeId) => LEGACY_SHOP_THEME_ID_MAP[themeId] ?? themeId)
            .filter((themeId) => validThemeIds.has(themeId)),
        ),
      )
    : base.unlockedThemes;
  return {
    unlockedThemes: unlockedThemes.length > 0 ? unlockedThemes : base.unlockedThemes,
    companions: Array.isArray(inv.companions)
      ? inv.companions.filter((c) => c && typeof c.id === 'string' && typeof c.quantity === 'number' && c.quantity > 0)
      : [],
    equippedCompanion: typeof inv.equippedCompanion === 'string' || inv.equippedCompanion === null
      ? inv.equippedCompanion
      : null,
    boosts,
    coinRushArmed: Boolean(inv.coinRushArmed),
    blessingExpiresAt: typeof inv.blessingExpiresAt === 'number' ? inv.blessingExpiresAt : null,
    coinsSpent: typeof inv.coinsSpent === 'number' && inv.coinsSpent >= 0 ? inv.coinsSpent : 0,
  };
}

function readRaw(): Inventory {
  if (typeof window === 'undefined') return defaultInventory();
  try {
    const raw = localStorage.getItem(STORAGE_KEYS.SHOP_INVENTORY);
    if (!raw) return defaultInventory();
    return normalize(JSON.parse(raw) as Partial<Inventory>);
  } catch {
    return defaultInventory();
  }
}

function save(inv: Inventory): void {
  if (typeof window === 'undefined') return;
  localStorage.setItem(STORAGE_KEYS.SHOP_INVENTORY, JSON.stringify(inv));
}

export function getInventory(): Inventory {
  return readRaw();
}

export function getLocalBalance(serverBalance: number, inventory: Inventory): number {
  return Math.max(0, serverBalance - inventory.coinsSpent);
}

export function getBoostQuantity(boostId: string, inventory: Inventory): number {
  const q = inventory.boosts[boostId];
  return typeof q === 'number' && q >= 0 ? q : 0;
}

export function getCompanionQuantity(companionId: string, inventory: Inventory): number {
  return inventory.companions.find((c) => c.id === companionId)?.quantity ?? 0;
}

export function isThemeUnlocked(themeId: string, inventory: Inventory): boolean {
  return inventory.unlockedThemes.includes(themeId);
}

export function isStudyBlessingActive(inventory: Inventory): boolean {
  return inventory.blessingExpiresAt != null && inventory.blessingExpiresAt > Date.now();
}

export function getQuizCoinMultiplier(inventory: Inventory): QuizCoinMultiplier {
  if (isStudyBlessingActive(inventory)) return 'blessing';
  if (inventory.coinRushArmed && getBoostQuantity('coin-rush', inventory) > 0) return 'coin_rush';
  return 'none';
}

function decBoost(inv: Inventory, boostId: string): Inventory {
  const q = getBoostQuantity(boostId, inv);
  if (q < 1) return inv;
  return { ...inv, boosts: { ...inv.boosts, [boostId]: q - 1 } };
}

function addCompanion(
  inv: Inventory,
  def: CompanionItem,
): { inv: Inventory; isNew: boolean; quantityAfter: number } {
  const idx = inv.companions.findIndex((c) => c.id === def.id);
  if (idx < 0) {
    return {
      inv: { ...inv, companions: [...inv.companions, { id: def.id, quantity: 1 }] },
      isNew: true,
      quantityAfter: 1,
    };
  }
  const next = [...inv.companions];
  const q = next[idx]!.quantity + 1;
  next[idx] = { id: def.id, quantity: q };
  return { inv: { ...inv, companions: next }, isNew: false, quantityAfter: q };
}

export function setCoinRushArmed(want: boolean, inv: Inventory): Inventory | null {
  if (!want) {
    const next = { ...inv, coinRushArmed: false };
    save(next);
    return next;
  }
  if (isStudyBlessingActive(inv)) return null;
  if (getBoostQuantity('coin-rush', inv) < 1) return null;
  const next = { ...inv, coinRushArmed: true };
  save(next);
  return next;
}

export function activateStudyBlessing(inv: Inventory): Inventory | null {
  if (isStudyBlessingActive(inv)) return null;
  if (getBoostQuantity('blessing', inv) < 1) return null;
  let next = decBoost(inv, 'blessing');
  next = { ...next, blessingExpiresAt: Date.now() + 24 * 60 * 60 * 1000, coinRushArmed: false };
  save(next);
  return next;
}

export function consumeCoinRushCharge(inv: Inventory): Inventory | null {
  if (getBoostQuantity('coin-rush', inv) < 1) return null;
  let next = decBoost(inv, 'coin-rush');
  next = { ...next, coinRushArmed: false };
  save(next);
  return next;
}

export function consumeGraceShield(inv: Inventory): Inventory | null {
  if (getBoostQuantity('shield', inv) < 1) return null;
  const next = decBoost(inv, 'shield');
  save(next);
  return next;
}

export function consumeHintToken(): Inventory | null {
  const inv = getInventory();
  if (getBoostQuantity('hint-token', inv) < 1) return null;
  const next = decBoost(inv, 'hint-token');
  save(next);
  return next;
}

export function equipCompanion(id: string | null): Inventory {
  const next = { ...getInventory(), equippedCompanion: id };
  save(next);
  return next;
}

export function purchaseTheme(themeId: string, price: number, serverBalance: number): Inventory | null {
  const inv = getInventory();
  if (isThemeUnlocked(themeId, inv)) return null;
  const theme = SHOP_THEMES.find((t) => t.id === themeId);
  if (!theme || theme.price !== price) return null;
  if (getLocalBalance(serverBalance, inv) < price) return null;
  const next: Inventory = {
    ...inv,
    coinsSpent: inv.coinsSpent + price,
    unlockedThemes: [...inv.unlockedThemes, themeId],
  };
  save(next);
  return next;
}

export function purchaseBoost(boostId: string, price: number, serverBalance: number): Inventory | null {
  const inv = getInventory();
  if (!SHOP_BOOSTS.some((b) => b.id === boostId)) return null;
  const boost = SHOP_BOOSTS.find((b) => b.id === boostId)!;
  if (boost.price !== price) return null;
  if (getLocalBalance(serverBalance, inv) < price) return null;
  const next: Inventory = {
    ...inv,
    coinsSpent: inv.coinsSpent + price,
    boosts: { ...inv.boosts, [boostId]: getBoostQuantity(boostId, inv) + 1 },
  };
  save(next);
  return next;
}

function weightedPick(
  companions: CompanionItem[],
  rates: Partial<Record<CompanionRarity, number>>,
): CompanionItem {
  const roll = Math.random() * 100;
  let cumulative = 0;
  for (const [rarity, weight] of Object.entries(rates) as [CompanionRarity, number][]) {
    cumulative += weight;
    if (roll < cumulative) {
      const rarityPool = companions.filter((c) => c.rarity === rarity);
      if (rarityPool.length > 0) return rarityPool[Math.floor(Math.random() * rarityPool.length)]!;
    }
  }
  return companions[Math.floor(Math.random() * companions.length)]!;
}

export function pullCompanions(
  scrollType: string,
  price: number,
  serverBalance: number,
): { inventory: Inventory; pulls: GachaPull[] } | null {
  const scroll = SHOP_SCROLLS.find((s) => s.id === scrollType);
  if (!scroll || scroll.price !== price) return null;
  let inv = getInventory();
  if (getLocalBalance(serverBalance, inv) < scroll.price) return null;

  inv = { ...inv, coinsSpent: inv.coinsSpent + scroll.price };

  const allRarities = new Set([
    ...Object.keys(scroll.dropRates),
    ...Object.keys(scroll.sacredDropRates ?? {}),
  ]) as Set<CompanionRarity>;
  const pool = SHOP_COMPANIONS.filter((c) => allRarities.has(c.rarity));
  if (pool.length === 0) return null;

  const sacredStart = scroll.pulls - (scroll.sacredPulls ?? 0);
  const pulls: GachaPull[] = [];
  for (let i = 0; i < scroll.pulls; i++) {
    const rates = i >= sacredStart && scroll.sacredDropRates ? scroll.sacredDropRates : scroll.dropRates;
    const pick = weightedPick(pool, rates);
    const added = addCompanion(inv, pick);
    inv = added.inv;
    pulls.push({
      companion: pick,
      isNew: added.isNew,
      quantityAfter: added.quantityAfter,
    });
  }
  save(inv);
  return { inventory: inv, pulls };
}

function applyTradeSpend(inv: Inventory, lines: TradeUpSelection): Inventory | null {
  const next = inv.companions.map((c) => ({ ...c }));
  for (const line of lines) {
    const idx = next.findIndex((x) => x.id === line.companionId);
    if (idx < 0) return null;
    const row = next[idx]!;
    if (row.quantity < line.quantity) return null;
    const q = row.quantity - line.quantity;
    if (q === 0) next.splice(idx, 1);
    else next[idx] = { id: row.id, quantity: q };
  }
  return { ...inv, companions: next };
}

export function tradeUpCompanions(lines: TradeUpSelection): { inventory: Inventory; pull: GachaPull } | null {
  const cleaned = lines.filter((l) => l.quantity > 0);
  const total = cleaned.reduce((s, l) => s + l.quantity, 0);
  if (total !== TRADE_UP_COPIES_REQUIRED || cleaned.length === 0) return null;

  const rarities = new Set(
    cleaned.map((l) => SHOP_COMPANIONS.find((c) => c.id === l.companionId)?.rarity).filter(Boolean),
  ) as Set<CompanionRarity>;
  if (rarities.size !== 1) return null;
  const fromR = [...rarities][0]!;
  const toR = nextCompanionRarity(fromR);
  if (!toR) return null;

  let inv = getInventory();
  const spent = applyTradeSpend(inv, cleaned);
  if (!spent) return null;
  inv = spent;

  const pool = SHOP_COMPANIONS.filter((c) => c.rarity === toR);
  if (pool.length === 0) return null;
  const pick = pool[Math.floor(Math.random() * pool.length)]!;
  const added = addCompanion(inv, pick);
  inv = added.inv;
  save(inv);
  return { inventory: inv, pull: { companion: pick, isNew: added.isNew, quantityAfter: added.quantityAfter } };
}

export function resetDevShopAfterAuth(): void {
  if (typeof window === 'undefined') return;
  localStorage.removeItem(STORAGE_KEYS.SHOP_INVENTORY);
  window.dispatchEvent(new CustomEvent(SHOP_INVENTORY_RESET_EVENT));
}
