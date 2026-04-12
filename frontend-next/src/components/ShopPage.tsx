'use client';

import Link from 'next/link';
import { useEffect, useMemo, useRef, useState } from 'react';
import CurrencyIcon from '@/components/CurrencyIcon';
import {
  persistAuthSession,
  refreshSession,
  restoreAuthSession,
  type AuthSession,
} from '@/lib/account';
import { getWallet } from '@/lib/quiz';
import {
  SHOP_THEMES,
  SHOP_COMPANIONS,
  SHOP_SCROLLS,
  SHOP_BOOSTS,
  COMPANION_RARITY_ASC,
  RARITY_COLOR,
  RARITY_GLOW,
  RARITY_LABEL,
  TIER_COLOR,
  TIER_LABEL,
  nextCompanionRarity,
  type ThemeItem,
  type CompanionItem,
  type ScrollType,
} from '@/lib/shopItems';
import {
  getInventory,
  getLocalBalance,
  purchaseTheme,
  purchaseBoost,
  pullCompanions,
  equipCompanion,
  isThemeUnlocked,
  getBoostQuantity,
  getCompanionQuantity,
  tradeUpCompanions,
  TRADE_UP_COPIES_REQUIRED,
  SHOP_INVENTORY_RESET_EVENT,
  type Inventory,
  type GachaPull,
  type TradeUpSelection,
  type OwnedCompanion,
} from '@/lib/shopInventory';
import CoinBoostControls from '@/components/CoinBoostControls';

// ── Types ─────────────────────────────────────────────────────────────────────

type Tab = 'themes' | 'cards' | 'boosts';

const TAB_LABEL: Record<Tab, string> = {
  themes: 'Themes',
  cards: 'Character cards',
  boosts: 'Boosts',
};

type GachaState =
  | { phase: 'idle' }
  | { phase: 'revealing'; pulls: GachaPull[]; revealed: number }
  | { phase: 'done'; pulls: GachaPull[] };

type ConfirmDialog = {
  title: string;
  message: string;
  confirmLabel?: string;
  onConfirm: () => void;
} | null;

// ── Sub-components ────────────────────────────────────────────────────────────

function CoinDisplay({ balance }: { balance: number | null }) {
  return (
    <div className="sp-balance">
      <CurrencyIcon className="sp-balance-coin" size={20} />
      <span className="sp-balance-amount">
        {balance != null ? balance.toLocaleString() : '—'}
      </span>
      <span className="sp-balance-label">coins</span>
    </div>
  );
}

function ThemeSwatches({ swatches }: { swatches: string[] }) {
  return (
    <div className="sp-theme-swatches">
      {swatches.slice(0, 4).map((color, i) => (
        <span key={i} className="sp-theme-swatch" style={{ background: color }} />
      ))}
    </div>
  );
}

function TierBadge({ tier }: { tier: ThemeItem['tier'] }) {
  return (
    <span className="sp-tier-badge" style={{ color: TIER_COLOR[tier], borderColor: TIER_COLOR[tier] + '44', background: TIER_COLOR[tier] + '12' }}>
      {TIER_LABEL[tier]}
    </span>
  );
}

function RarityBadge({ rarity }: { rarity: CompanionItem['rarity'] }) {
  return (
    <span className="sp-rarity-badge" style={{ color: RARITY_COLOR[rarity], borderColor: RARITY_COLOR[rarity] + '44', background: RARITY_COLOR[rarity] + '14' }}>
      {RARITY_LABEL[rarity]}
    </span>
  );
}

function PriceTag({ price, owned, canAfford }: { price: number; owned?: boolean; canAfford?: boolean }) {
  if (owned) return <span className="sp-price sp-price--owned">✓ Owned</span>;
  if (price === 0) return <span className="sp-price sp-price--free">Free</span>;
  return (
    <span className={`sp-price${canAfford === false ? ' sp-price--locked' : ''}`}><CurrencyIcon className="sp-inline-coin" size={15} /> {price.toLocaleString()}</span>
  );
}

// ── Gacha Card ─────────────────────────────────────────────────────────────────

function GachaRevealCard({ pull, revealed, index }: { pull: GachaPull; revealed: boolean; index: number }) {
  const companion = pull.companion;
  const color = RARITY_COLOR[companion.rarity];
  const glow = RARITY_GLOW[companion.rarity];

  return (
    <div
      className={`gacha-card${revealed ? ' gacha-card--revealed' : ''}`}
      style={{ animationDelay: `${index * 0.08}s` }}
    >
      <div className="gacha-card-inner">
        {/* Back face */}
        <div className="gacha-card-back">
          <span className="gacha-card-back-icon">📜</span>
        </div>
        {/* Front face */}
        <div
          className="gacha-card-front"
          style={{
            borderColor: color,
            boxShadow: revealed ? `0 0 24px ${glow}, 0 0 0 1px ${color}40` : undefined,
          }}
        >
          <div className="gacha-card-emoji">{companion.emoji}</div>
          <div className="gacha-card-name">{companion.name}</div>
          <RarityBadge rarity={companion.rarity} />
          {!pull.isNew && (
            <div className="gacha-card-dupe">
              Duplicate ×{pull.quantityAfter}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

// ── Gacha Modal ───────────────────────────────────────────────────────────────

function GachaModal({ state, onReveal, onClose }: {
  state: GachaState;
  onReveal: () => void;
  onClose: () => void;
}) {
  if (state.phase === 'idle') return null;

  const pulls = state.phase === 'revealing' ? state.pulls : (state as { phase: 'done'; pulls: GachaPull[] }).pulls;
  const revealedCount = state.phase === 'revealing' ? state.revealed : pulls.length;
  const isDone = state.phase === 'done';
  const isBundle = pulls.length > 1;

  return (
    <div className="gacha-overlay" onClick={isDone ? onClose : undefined}>
      <div className="gacha-modal" onClick={e => e.stopPropagation()}>
        <div className={`gacha-cards-grid${isBundle ? ' gacha-cards-grid--bundle' : ''}`}>
          {pulls.map((pull, i) => (
            <GachaRevealCard
              key={`${pull.companion.id}-${i}`}
              pull={pull}
              revealed={i < revealedCount}
              index={i}
            />
          ))}
        </div>

        <div className="gacha-actions">
          {!isDone ? (
            <button className="gacha-btn gacha-btn--reveal" onClick={onReveal}>
              {revealedCount === 0 ? 'Reveal' : revealedCount < pulls.length ? 'Next' : 'Done'}
            </button>
          ) : (
            <>
              {pulls.length === 1 && (
                <p className="gacha-result-detail">
                  {pulls[0].companion.title} · {pulls[0].companion.book}
                </p>
              )}
              <button className="gacha-btn gacha-btn--done" onClick={onClose}>
                Claim {pulls.length > 1 ? `${pulls.length} character cards` : pulls[0].companion.name}
              </button>
            </>
          )}
        </div>
      </div>
    </div>
  );
}

// ── Confirm dialog ──────────────────────────────────────────────────────────────

function ConfirmModal({ dialog, onDismiss }: { dialog: ConfirmDialog; onDismiss: () => void }) {
  if (!dialog) return null;
  return (
    <div
      className="shop-confirm-overlay shop-confirm-overlay--top"
      role="dialog"
      aria-modal="true"
      aria-labelledby="shop-confirm-title"
      onClick={onDismiss}
    >
      <div className="shop-confirm-modal" onClick={e => e.stopPropagation()}>
        <h2 id="shop-confirm-title" className="shop-confirm-title">{dialog.title}</h2>
        <p className="shop-confirm-message">{dialog.message}</p>
        <div className="shop-confirm-actions">
          <button type="button" className="shop-confirm-btn shop-confirm-btn--cancel" onClick={onDismiss}>
            Cancel
          </button>
          <button
            type="button"
            className="shop-confirm-btn shop-confirm-btn--ok"
            onClick={() => {
              dialog.onConfirm();
              onDismiss();
            }}
          >
            {dialog.confirmLabel ?? 'Confirm'}
          </button>
        </div>
      </div>
    </div>
  );
}

// ── Trade up modal ────────────────────────────────────────────────────────────

function TradeUpModal({
  inventory,
  onClose,
  onRequestConfirm,
}: {
  inventory: Inventory;
  onClose: () => void;
  onRequestConfirm: (lines: TradeUpSelection) => void;
}) {
  const ownedRows = inventory.companions.filter(c => c.quantity > 0);
  const [draft, setDraft] = useState<Record<string, number>>({});

  useEffect(() => {
    const init: Record<string, number> = {};
    ownedRows.forEach(r => { init[r.id] = 0; });
    setDraft(init);
  }, [inventory]);

  const setQty = (id: string, q: number) => {
    const max = inventory.companions.find(c => c.id === id)?.quantity ?? 0;
    setDraft(d => ({ ...d, [id]: Math.max(0, Math.min(max, Math.floor(q))) }));
  };

  const validation = useMemo(() => {
    const lines: TradeUpSelection = Object.entries(draft)
      .filter(([, q]) => q > 0)
      .map(([companionId, quantity]) => ({ companionId, quantity }));
    const total = lines.reduce((s, l) => s + l.quantity, 0);

    if (lines.length === 0) {
      return {
        lines,
        total,
        ok: false,
        hint: 'Choose how many copies of each character card to trade.',
        previewLabel: null as string | null,
      };
    }

    const rarities = new Set(
      lines.map(l => SHOP_COMPANIONS.find(c => c.id === l.companionId)?.rarity).filter(Boolean),
    );
    if (rarities.size > 1) {
      return {
        lines,
        total,
        ok: false,
        hint: 'All selected copies must be the same rarity. Clear one rarity before selecting another.',
        previewLabel: null as string | null,
      };
    }

    const fromR = [...rarities][0]!;
    const nextR = nextCompanionRarity(fromR);
    if (!nextR) {
      return {
        lines,
        total,
        ok: false,
        hint: 'This tier cannot be traded up.',
        previewLabel: null as string | null,
      };
    }

    if (total < TRADE_UP_COPIES_REQUIRED) {
      return {
        lines,
        total,
        ok: false,
        hint: `Select ${TRADE_UP_COPIES_REQUIRED - total} more ${RARITY_LABEL[fromR].toLowerCase()} ${TRADE_UP_COPIES_REQUIRED - total === 1 ? 'copy' : 'copies'}.`,
        previewLabel: `1 random ${RARITY_LABEL[nextR]}`,
      };
    }
    if (total > TRADE_UP_COPIES_REQUIRED) {
      return {
        lines,
        total,
        ok: false,
        hint: `Remove ${total - TRADE_UP_COPIES_REQUIRED} ${total - TRADE_UP_COPIES_REQUIRED === 1 ? 'copy' : 'copies'} from the selection.`,
        previewLabel: null as string | null,
      };
    }

    return {
      lines,
      total,
      ok: true,
      hint: null as string | null,
      previewLabel: `1 random ${RARITY_LABEL[nextR]}`,
    };
  }, [draft]);

  const grouped = useMemo(() => {
    return COMPANION_RARITY_ASC.map(rarity => {
      const items = ownedRows
        .map(row => {
          const def = SHOP_COMPANIONS.find(c => c.id === row.id);
          return def?.rarity === rarity ? { row, def } : null;
        })
        .filter((x): x is { row: OwnedCompanion; def: CompanionItem } => x != null);
      return { rarity, items };
    }).filter(g => g.items.length > 0);
  }, [ownedRows]);

  return (
    <div className="shop-confirm-overlay" role="dialog" aria-modal="true" aria-labelledby="tradeup-title" onClick={onClose}>
      <div className="sp-tradeup-modal" onClick={e => e.stopPropagation()}>
        <div className="sp-tradeup-modal-head">
          <h2 id="tradeup-title" className="sp-tradeup-modal-title">Trade up</h2>
          <button type="button" className="sp-tradeup-modal-close" onClick={onClose} aria-label="Close">
            ×
          </button>
        </div>
        <p className="sp-tradeup-modal-lead">
          Select exactly {TRADE_UP_COPIES_REQUIRED} copies from one rarity. You receive one random character card from the next tier.
        </p>

        {ownedRows.length === 0 ? (
          <p className="sp-tradeup-modal-empty">You need at least one character card to trade.</p>
        ) : (
          <>
            <div className="sp-tradeup-pick-list">
              {grouped.map(({ rarity, items }) => (
                <div key={rarity} className="sp-tradeup-rarity-block">
                  <div className="sp-tradeup-rarity-label" style={{ color: RARITY_COLOR[rarity] }}>
                    {RARITY_LABEL[rarity]}
                  </div>
                  {items.map(({ row, def }) => {
                    const q = draft[def.id] ?? 0;
                    return (
                      <div key={def.id} className="sp-tradeup-pick-row">
                        <span className="sp-tradeup-pick-emoji" aria-hidden="true">{def.emoji}</span>
                        <div className="sp-tradeup-pick-meta">
                          <span className="sp-tradeup-pick-name">{def.name}</span>
                          <span className="sp-tradeup-pick-owned">Own {row.quantity}</span>
                        </div>
                        <div className="sp-tradeup-stepper">
                          <button
                            type="button"
                            className="sp-tradeup-step"
                            onClick={() => setQty(def.id, q - 1)}
                            disabled={q <= 0}
                            aria-label={`Remove one ${def.name}`}
                          >
                            −
                          </button>
                          <span className="sp-tradeup-step-val">{q}</span>
                          <button
                            type="button"
                            className="sp-tradeup-step"
                            onClick={() => setQty(def.id, q + 1)}
                            disabled={q >= row.quantity}
                            aria-label={`Add one ${def.name}`}
                          >
                            +
                          </button>
                        </div>
                      </div>
                    );
                  })}
                </div>
              ))}
            </div>

            <div className="sp-tradeup-footer">
              <div className="sp-tradeup-summary">
                <span className="sp-tradeup-count-pill">
                  {validation.total} / {TRADE_UP_COPIES_REQUIRED} copies
                </span>
                {validation.previewLabel && (
                  <span className="sp-tradeup-preview">
                    → <strong>{validation.previewLabel}</strong>
                  </span>
                )}
              </div>
              {validation.hint && (
                <p className={`sp-tradeup-hint-msg${validation.ok ? ' sp-tradeup-hint-msg--ok' : ''}`}>
                  {validation.hint}
                </p>
              )}
              <div className="sp-tradeup-modal-actions">
                <button type="button" className="shop-confirm-btn shop-confirm-btn--cancel" onClick={onClose}>
                  Cancel
                </button>
                <button
                  type="button"
                  className="shop-confirm-btn shop-confirm-btn--ok"
                  disabled={!validation.ok}
                  onClick={() => validation.ok && onRequestConfirm(validation.lines)}
                >
                  Review trade
                </button>
              </div>
            </div>
          </>
        )}
      </div>
    </div>
  );
}

// ── Themes Tab ────────────────────────────────────────────────────────────────

function ThemesTab({
  inventory,
  balance,
  onRequestPurchase,
}: {
  inventory: Inventory;
  balance: number | null;
  onRequestPurchase: (theme: ThemeItem) => void;
}) {
  const tiers: ThemeItem['tier'][] = ['free', 'standard', 'premium', 'legendary'];

  return (
    <div className="sp-section">
      {tiers.map(tier => {
        const items = SHOP_THEMES.filter(t => t.tier === tier);
        return (
          <div key={tier} className="sp-group">
            <div className="sp-group-header">
              <span className="sp-group-label" style={{ color: TIER_COLOR[tier] }}>
                {TIER_LABEL[tier]}
              </span>
              {tier === 'legendary' && <span className="sp-group-tag">✨ Special Effects</span>}
            </div>
            <div className="sp-theme-grid">
              {items.map(theme => {
                const owned = isThemeUnlocked(theme.id, inventory);
                const affordable = balance != null && balance >= theme.price;
                return (
                  <button
                    key={theme.id}
                    className={`sp-theme-card${owned ? ' sp-theme-card--owned' : ''}${theme.specialEffect ? ' sp-theme-card--special' : ''}`}
                    onClick={() => !owned && onRequestPurchase(theme)}
                    disabled={owned || balance == null || (!affordable && theme.price > 0)}
                    title={theme.description}
                  >
                    <ThemeSwatches swatches={theme.swatches} />
                    <div className="sp-theme-card-info">
                      <span className="sp-theme-name">{theme.name}</span>
                      {theme.specialEffect && (
                        <span className="sp-theme-effect">✦ {theme.specialEffect}</span>
                      )}
                    </div>
                    <PriceTag price={theme.price} owned={owned} canAfford={affordable} />
                  </button>
                );
              })}
            </div>
          </div>
        );
      })}
    </div>
  );
}

// ── Character cards tab (scroll gacha) ────────────────────────────────────────

function CharacterCardsTab({
  inventory,
  balance,
  onRequestSummon,
  onEquip,
  onOpenTradeUp,
}: {
  inventory: Inventory;
  balance: number | null;
  onRequestSummon: (scrollType: ScrollType) => void;
  onEquip: (id: string | null) => void;
  onOpenTradeUp: () => void;
}) {
  const ownedSet = new Set(inventory.companions.map(c => c.id));
  const equipped = inventory.equippedCompanion;
  const rarityOrder: CompanionItem['rarity'][] = [
    'legendary',
    'mythic',
    'epic',
    'rare',
    'uncommon',
  ];

  return (
    <div className="sp-section">
      {/* Summon scrolls */}
      <div className="sp-group">
        <div className="sp-group-header">
          <span className="sp-group-label">Summon Scrolls</span>
          <span className="sp-group-sub">{SHOP_COMPANIONS.length} character cards to collect</span>
        </div>
        <div className="sp-scroll-list">
          {SHOP_SCROLLS.map(scroll => {
            const affordable = balance != null && balance >= scroll.price;
            return (
              <div key={scroll.id} className="sp-scroll-card">
                <div className="sp-scroll-left">
                  <span className="sp-scroll-emoji">{scroll.emoji}</span>
                  <div className="sp-scroll-info">
                    <div className="sp-scroll-name-row">
                      <span className="sp-scroll-name">{scroll.name}</span>
                      {scroll.discountPercentOff != null && (
                        <span className="sp-scroll-discount-badge">
                          {scroll.discountPercentOff}% off
                        </span>
                      )}
                    </div>
                    <span className="sp-scroll-guarantee">{scroll.guarantee}</span>
                    <span className="sp-scroll-flavour">{scroll.flavour}</span>
                  </div>
                </div>
                <button
                  type="button"
                  className={`sp-scroll-btn${!affordable ? ' sp-scroll-btn--locked' : ''}`}
                  onClick={() => onRequestSummon(scroll.id)}
                  disabled={balance == null || !affordable}
                  aria-label={
                    scroll.compareAtPrice != null
                      ? `${scroll.name}, ${scroll.price.toLocaleString()} coins (list ${scroll.compareAtPrice.toLocaleString()}). ${scroll.pulls > 1 ? `${scroll.pulls}-pull bundle` : 'Summon'}.`
                      : undefined
                  }
                >
                  <span className="sp-scroll-btn-prices">
                    {scroll.compareAtPrice != null && (
                      <span className="sp-scroll-price-was" aria-hidden="true"><CurrencyIcon className="sp-inline-coin" size={14} /> {scroll.compareAtPrice.toLocaleString()}</span>
                    )}
                    <span><CurrencyIcon className="sp-inline-coin" size={14} /> {scroll.price.toLocaleString()}</span>
                  </span>
                  <span className="sp-scroll-btn-label">{scroll.pulls > 1 ? `×${scroll.pulls}` : 'Summon'}</span>
                </button>
              </div>
            );
          })}
        </div>
      </div>

      {/* Trade up */}
      <div className="sp-group">
        <div className="sp-group-header">
          <span className="sp-group-label">Trade Up</span>
          <span className="sp-group-sub">
            {TRADE_UP_COPIES_REQUIRED} copies of one rarity → 1 random card of the next rarity
          </span>
        </div>
        <p className="sp-tradeup-hint">
          Pick how many copies of each card to spend. The result tier is chosen automatically from your selection.
        </p>
        <button type="button" className="sp-tradeup-open-btn" onClick={onOpenTradeUp}>
          Trade up cards
        </button>
      </div>

      {/* Collection */}
      <div className="sp-group">
        <div className="sp-group-header">
          <span className="sp-group-label">Your Collection</span>
          <span className="sp-group-sub">
            {ownedSet.size} / {SHOP_COMPANIONS.length} discovered
          </span>
        </div>
        {ownedSet.size === 0 ? (
          <div className="sp-empty">
            <span className="sp-empty-icon">📜</span>
            <p className="sp-empty-text">Summon a scroll to reveal your first character card.</p>
          </div>
        ) : (
          <div className="sp-companion-grid">
            {rarityOrder.flatMap(rarity =>
              SHOP_COMPANIONS.filter(c => c.rarity === rarity && ownedSet.has(c.id)).map(companion => (
                <CompanionCard
                  key={companion.id}
                  companion={companion}
                  quantity={getCompanionQuantity(companion.id, inventory)}
                  isEquipped={equipped === companion.id}
                  onEquip={() => onEquip(equipped === companion.id ? null : companion.id)}
                />
              ))
            )}
          </div>
        )}

        {/* Locked preview */}
        {SHOP_COMPANIONS.filter(c => !ownedSet.has(c.id)).length > 0 && (
          <div className="sp-locked-companions">
            <p className="sp-locked-label">Not yet discovered</p>
            <div className="sp-locked-dots">
              {SHOP_COMPANIONS.filter(c => !ownedSet.has(c.id)).map(c => (
                <span
                  key={c.id}
                  className="sp-locked-dot"
                  style={{ background: RARITY_COLOR[c.rarity] + '50' }}
                  title={`??? (${RARITY_LABEL[c.rarity]})`}
                />
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

function CompanionCard({
  companion,
  quantity,
  isEquipped,
  onEquip,
}: {
  companion: CompanionItem;
  quantity: number;
  isEquipped: boolean;
  onEquip: () => void;
}) {
  const color = RARITY_COLOR[companion.rarity];
  const glow = RARITY_GLOW[companion.rarity];

  return (
    <div
      className={`sp-companion-card${isEquipped ? ' sp-companion-card--equipped' : ''}`}
      style={{
        borderColor: color + '60',
        boxShadow: isEquipped ? `0 0 16px ${glow}` : undefined,
      }}
    >
      <div className="sp-companion-top">
        <div className="sp-companion-emoji" style={{ color }}>{companion.emoji}</div>
        {quantity > 1 && (
          <span className="sp-companion-qty" style={{ background: color }}>
            ×{quantity}
          </span>
        )}
      </div>
      <div className="sp-companion-name">{companion.name}</div>
      <div className="sp-companion-title">{companion.title}</div>
      <RarityBadge rarity={companion.rarity} />
      <button
        className={`sp-companion-equip${isEquipped ? ' sp-companion-equip--active' : ''}`}
        style={isEquipped ? { background: color, borderColor: color } : { borderColor: color + '80', color }}
        onClick={onEquip}
      >
        {isEquipped ? 'Equipped' : 'Equip'}
      </button>
    </div>
  );
}

// ── Boosts Tab ────────────────────────────────────────────────────────────────

function BoostsTab({
  inventory,
  balance,
  onRequestPurchase,
  onInventoryChange,
}: {
  inventory: Inventory;
  balance: number | null;
  onRequestPurchase: (boostId: string, price: number) => void;
  onInventoryChange: (inv: Inventory) => void;
}) {
  return (
    <div className="sp-section">
      <div className="sp-group sp-group--coin-boosts">
        <CoinBoostControls inventory={inventory} onInventoryChange={onInventoryChange} />
      </div>
      <div className="sp-group">
        <div className="sp-group-header">
          <span className="sp-group-label">Power-Ups</span>
          <span className="sp-group-sub">Buy consumables — coin boosts are set in the section above</span>
        </div>
        <div className="sp-boost-grid">
          {SHOP_BOOSTS.map(boost => {
            const qty = getBoostQuantity(boost.id, inventory);
            const affordable = balance != null && balance >= boost.price;
            return (
              <div key={boost.id} className="sp-boost-card">
                <div className="sp-boost-top">
                  <span className="sp-boost-emoji" style={{ filter: `drop-shadow(0 0 6px ${boost.color}66)` }}>
                    {boost.emoji}
                  </span>
                  {qty > 0 && (
                    <span className="sp-boost-qty" style={{ background: boost.color }}>×{qty}</span>
                  )}
                </div>
                <div className="sp-boost-name">{boost.name}</div>
                <div className="sp-boost-desc">{boost.description}</div>
                <div className="sp-boost-detail">{boost.detail}</div>
                <button
                  className={`sp-boost-btn${!affordable ? ' sp-boost-btn--locked' : ''}`}
                  style={affordable ? { borderColor: boost.color + '80', color: boost.color } : undefined}
                  onClick={() => onRequestPurchase(boost.id, boost.price)}
                  disabled={balance == null || !affordable}
                >
                  <CurrencyIcon className="sp-inline-coin" size={15} /> {boost.price.toLocaleString()}
                </button>
              </div>
            );
          })}
        </div>
      </div>

      <div className="sp-boost-note">
        <p>
          Turn on coin boosts from the section above or from your profile. In a quiz, use Hint and Grace Shield on the
          same attempt if you like (one of each per quiz).
        </p>
      </div>
    </div>
  );
}

// ── Toast ─────────────────────────────────────────────────────────────────────

function Toast({ message, visible }: { message: string; visible: boolean }) {
  return (
    <div className={`sp-toast${visible ? ' sp-toast--visible' : ''}`} aria-live="assertive">
      {message}
    </div>
  );
}

function describeTradeUpLines(lines: TradeUpSelection): string {
  const cleaned = lines.filter(l => l.quantity > 0);
  const parts = cleaned.map(l => {
    const c = SHOP_COMPANIONS.find(x => x.id === l.companionId);
    return `${l.quantity}× ${c?.name ?? l.companionId}`;
  });
  const first = SHOP_COMPANIONS.find(c => c.id === cleaned[0]?.companionId);
  const toR = first ? nextCompanionRarity(first.rarity) : null;
  const tail = toR
    ? `for 1 random ${RARITY_LABEL[toR]} character card? This cannot be undone.`
    : '?';
  return `Trade ${parts.join(', ')} (${TRADE_UP_COPIES_REQUIRED} total) ${tail}`;
}

// ── Main ShopPage ─────────────────────────────────────────────────────────────

export default function ShopPage() {
  const [session, setSession] = useState<AuthSession | null>(null);
  const [serverBalance, setServerBalance] = useState<number | null>(null);
  const [inventory, setInventory] = useState<Inventory>(() => getInventory());
  const [tab, setTab] = useState<Tab>('themes');
  const [gachaState, setGachaState] = useState<GachaState>({ phase: 'idle' });
  const [toast, setToast] = useState<{ msg: string; visible: boolean }>({ msg: '', visible: false });
  const [confirm, setConfirm] = useState<ConfirmDialog>(null);
  const [tradeUpOpen, setTradeUpOpen] = useState(false);
  const toastTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  // ── Load session + wallet ──────────────────────────────────────────────────

  useEffect(() => {
    let cancelled = false;
    const load = async () => {
      let s = restoreAuthSession();
      if (!s) { setSession(null); setServerBalance(null); return; }
      setSession(s);
      try {
        const w = await getWallet(s);
        if (!cancelled) setServerBalance(w.balance);
      } catch {
        try {
          const r = await refreshSession(s);
          persistAuthSession(r);
          if (!cancelled) setSession(r);
          const w = await getWallet(r);
          if (!cancelled) setServerBalance(w.balance);
        } catch {
          if (!cancelled) setServerBalance(null);
        }
      }
    };
    void load();
    return () => { cancelled = true; };
  }, []);

  useEffect(() => {
    const onReset = () => setInventory(getInventory());
    window.addEventListener(SHOP_INVENTORY_RESET_EVENT, onReset);
    return () => window.removeEventListener(SHOP_INVENTORY_RESET_EVENT, onReset);
  }, []);

  // ── Displayed balance ──────────────────────────────────────────────────────

  const balance = serverBalance != null ? getLocalBalance(serverBalance, inventory) : null;

  // ── Toast helper ───────────────────────────────────────────────────────────

  const showToast = (msg: string) => {
    if (toastTimerRef.current) clearTimeout(toastTimerRef.current);
    setToast({ msg, visible: true });
    toastTimerRef.current = setTimeout(() => setToast(t => ({ ...t, visible: false })), 2800);
  };

  // ── Purchase handlers (execute after confirm) ──────────────────────────────

  const handleThemePurchase = (theme: ThemeItem) => {
    if (serverBalance == null) return;
    if (theme.price === 0) {
      const updated = purchaseTheme(theme.id, 0, serverBalance);
      if (updated) setInventory(updated);
      return;
    }
    if (balance == null || balance < theme.price) {
      showToast('Not enough coins.');
      return;
    }
    const updated = purchaseTheme(theme.id, theme.price, serverBalance);
    if (updated) {
      setInventory(updated);
      showToast(`${theme.name} unlocked!`);
    }
  };

  const requestThemePurchase = (theme: ThemeItem) => {
    if (serverBalance == null) return;
    const owned = isThemeUnlocked(theme.id, inventory);
    if (owned) return;
    if (theme.price > 0) {
      if (balance == null || balance < theme.price) {
        showToast('Not enough coins.');
        return;
      }
      setConfirm({
        title: 'Buy theme?',
        message: `Buy "${theme.name}" for ${theme.price.toLocaleString()} coins?`,
        onConfirm: () => handleThemePurchase(theme),
      });
      return;
    }
    setConfirm({
      title: 'Unlock theme?',
      message: `Unlock "${theme.name}" for free?`,
      onConfirm: () => handleThemePurchase(theme),
    });
  };

  const handleBoostPurchase = (boostId: string, price: number) => {
    if (serverBalance == null || balance == null || balance < price) {
      showToast('Not enough coins.');
      return;
    }
    const boost = SHOP_BOOSTS.find(b => b.id === boostId);
    const updated = purchaseBoost(boostId, price, serverBalance);
    if (updated) {
      setInventory(updated);
      showToast(`${boost?.name ?? 'Power-up'} added!`);
    }
  };

  const requestBoostPurchase = (boostId: string, price: number) => {
    if (serverBalance == null || balance == null || balance < price) {
      showToast('Not enough coins.');
      return;
    }
    const boost = SHOP_BOOSTS.find(b => b.id === boostId);
    setConfirm({
      title: 'Buy power-up?',
      message: `Buy "${boost?.name ?? 'power-up'}" for ${price.toLocaleString()} coins?`,
      onConfirm: () => handleBoostPurchase(boostId, price),
    });
  };

  const handleSummon = (scrollType: ScrollType) => {
    if (serverBalance == null || balance == null) return;
    const scroll = SHOP_SCROLLS.find(s => s.id === scrollType)!;
    if (balance < scroll.price) { showToast('Not enough coins.'); return; }

    const result = pullCompanions(scrollType, scroll.price, serverBalance);
    if (!result) { showToast('Not enough coins.'); return; }

    setInventory(result.inventory);
    setGachaState({ phase: 'revealing', pulls: result.pulls, revealed: 0 });
  };

  const requestSummon = (scrollType: ScrollType) => {
    if (serverBalance == null || balance == null) return;
    const scroll = SHOP_SCROLLS.find(s => s.id === scrollType)!;
    if (balance < scroll.price) {
      showToast('Not enough coins.');
      return;
    }
    const pullWord = scroll.pulls === 1 ? 'character card' : `${scroll.pulls} character cards`;
    setConfirm({
      title: 'Summon character cards?',
      message: `Spend ${scroll.price.toLocaleString()} coins on ${scroll.name} (${pullWord})?`,
      onConfirm: () => handleSummon(scrollType),
    });
  };

  const handleTradeUpConfirm = (lines: TradeUpSelection) => {
    const result = tradeUpCompanions(lines);
    if (!result) {
      showToast('Could not complete trade. Check your selection.');
      return;
    }
    setTradeUpOpen(false);
    setInventory(result.inventory);
    setGachaState({ phase: 'revealing', pulls: [result.pull], revealed: 0 });
  };

  const requestTradeUpReview = (lines: TradeUpSelection) => {
    setConfirm({
      title: 'Confirm trade up?',
      message: describeTradeUpLines(lines),
      confirmLabel: 'Trade',
      onConfirm: () => handleTradeUpConfirm(lines),
    });
  };

  const handleGachaReveal = () => {
    setGachaState(prev => {
      if (prev.phase !== 'revealing') return prev;
      const next = prev.revealed + 1;
      if (next >= prev.pulls.length) return { phase: 'done', pulls: prev.pulls };
      return { ...prev, revealed: next };
    });
  };

  const handleGachaClose = () => {
    setGachaState({ phase: 'idle' });
    setInventory(getInventory());
  };

  const handleEquip = (id: string | null) => {
    const updated = equipCompanion(id);
    setInventory(updated);
    const name = id ? SHOP_COMPANIONS.find(c => c.id === id)?.name : null;
    showToast(name ? `${name} equipped!` : 'Character card unequipped.');
  };

  // ── Render ─────────────────────────────────────────────────────────────────

  return (
    <div className="shop-page">
      {/* Wave background */}
      <div id="wave-bg" aria-hidden="true">
        <svg className="wave-svg wv-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
          <path fill="var(--muted)" d="M0,100 C180,30 540,190 720,100 C900,30 1260,190 1440,100 L1440,320 L0,320 Z" />
        </svg>
        <svg className="wave-svg wv-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
          <path fill="var(--muted)" d="M0,130 C200,55 520,210 720,130 C920,55 1240,210 1440,130 L1440,320 L0,320 Z" />
        </svg>
        <svg className="wave-svg wv-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
          <path fill="var(--muted)" d="M0,90 C160,15 560,175 720,90 C880,5 1280,175 1440,90 L1440,320 L0,320 Z" />
        </svg>
      </div>

      {/* Header */}
      <header className="shop-page-header">
        <Link href="/app" className="shop-page-back">← Bible</Link>
        <h1 className="shop-page-title">Treasury</h1>
        {session ? (
          <CoinDisplay balance={balance} />
        ) : (
          <p className="shop-page-balance shop-page-balance--muted">
            Sign in from the Bible app to earn coins from quizzes.
          </p>
        )}
      </header>

      {/* Tab bar */}
      <div className="sp-tabs-wrap">
        <div className="sp-tabs">
          {(['themes', 'cards', 'boosts'] as Tab[]).map(t => (
            <button
              key={t}
              className={`sp-tab${tab === t ? ' sp-tab--active' : ''}`}
              onClick={() => setTab(t)}
            >
              {t === 'themes' && '🎨 '}
              {t === 'cards' && '⭐ '}
              {t === 'boosts' && '⚡ '}
              {TAB_LABEL[t]}
            </button>
          ))}
        </div>
      </div>

      {/* Tab content */}
      <main className="shop-page-main">
        {tab === 'themes' && (
          <ThemesTab inventory={inventory} balance={balance} onRequestPurchase={requestThemePurchase} />
        )}
        {tab === 'cards' && (
          <CharacterCardsTab
            inventory={inventory}
            balance={balance}
            onRequestSummon={requestSummon}
            onEquip={handleEquip}
            onOpenTradeUp={() => setTradeUpOpen(true)}
          />
        )}
        {tab === 'boosts' && (
          <BoostsTab
            inventory={inventory}
            balance={balance}
            onRequestPurchase={requestBoostPurchase}
            onInventoryChange={setInventory}
          />
        )}
      </main>

      {/* Gacha modal */}
      {gachaState.phase !== 'idle' && (
        <GachaModal
          state={gachaState}
          onReveal={handleGachaReveal}
          onClose={handleGachaClose}
        />
      )}

      {tradeUpOpen && (
        <TradeUpModal
          inventory={inventory}
          onClose={() => setTradeUpOpen(false)}
          onRequestConfirm={lines => {
            requestTradeUpReview(lines);
          }}
        />
      )}

      <ConfirmModal dialog={confirm} onDismiss={() => setConfirm(null)} />

      {/* Toast */}
      <Toast message={toast.msg} visible={toast.visible} />
    </div>
  );
}






