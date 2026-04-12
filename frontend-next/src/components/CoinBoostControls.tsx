'use client';

import { useEffect, useState } from 'react';
import {
  activateStudyBlessing,
  getBoostQuantity,
  getInventory,
  getQuizCoinMultiplier,
  isStudyBlessingActive,
  setCoinRushArmed,
  SHOP_INVENTORY_RESET_EVENT,
  type Inventory,
} from '@/lib/shopInventory';

function formatBlessingEnd(ts: number): string {
  return new Date(ts).toLocaleString(undefined, { dateStyle: 'short', timeStyle: 'short' });
}

type Props = {
  /** When set, inventory is controlled by the parent (e.g. Shop). */
  inventory?: Inventory;
  onInventoryChange?: (inv: Inventory) => void;
  /** Tighter copy for the account panel. */
  compact?: boolean;
};

export default function CoinBoostControls({
  inventory: controlled,
  onInventoryChange,
  compact = false,
}: Props) {
  const [inv, setInv] = useState<Inventory>(() => controlled ?? getInventory());
  const [rushMsg, setRushMsg] = useState('');

  useEffect(() => {
    if (controlled) setInv(controlled);
  }, [controlled]);

  useEffect(() => {
    if (controlled) return;
    const sync = () => setInv(getInventory());
    const id = window.setInterval(sync, 20000);
    window.addEventListener(SHOP_INVENTORY_RESET_EVENT, sync);
    return () => {
      clearInterval(id);
      window.removeEventListener(SHOP_INVENTORY_RESET_EVENT, sync);
    };
  }, [controlled]);

  const push = (next: Inventory) => {
    setInv(next);
    onInventoryChange?.(next);
  };

  const blessingActive = isStudyBlessingActive(inv);
  const rushQty = getBoostQuantity('coin-rush', inv);
  const blessingQty = getBoostQuantity('blessing', inv);
  const armed = inv.coinRushArmed && rushQty > 0;
  const nextMult = getQuizCoinMultiplier(inv);

  const onToggleRush = () => {
    setRushMsg('');
    const want = !armed;
    if (!want) {
      const u = setCoinRushArmed(false, inv);
      if (u) push(u);
      return;
    }
    const u = setCoinRushArmed(true, inv);
    if (!u) {
      setRushMsg(
        blessingActive
          ? 'Study Blessing is already active.'
          : 'No Coin Rush charges in your bag.',
      );
      return;
    }
    push(u);
  };

  const onStartBlessing = () => {
    setRushMsg('');
    const u = activateStudyBlessing(inv);
    if (u) push(u);
  };

  return (
    <div className={`coin-boost-controls${compact ? ' coin-boost-controls--compact' : ''}`}>
      <div className="coin-boost-heading">Quiz coin boosts</div>
      <p className="coin-boost-lede">
        {compact
          ? 'Set coin boosts before you open a quiz. Blessing timer beats Coin Rush.'
          : 'Choose before you start a quiz. Study Blessing and Coin Rush never stack — the blessing timer takes priority.'}
      </p>
      <div className="coin-boost-status" aria-live="polite">
        Next quiz:{' '}
        <strong>
          {nextMult === 'blessing'
            ? '2× (Study Blessing)'
            : nextMult === 'coin_rush'
              ? '2× (Coin Rush — one charge)'
              : 'Normal'}
        </strong>
      </div>
      {blessingActive && inv.blessingExpiresAt != null && (
        <p className="coin-boost-line coin-boost-line--active">
          Study Blessing active until {formatBlessingEnd(inv.blessingExpiresAt)}
        </p>
      )}
      {!blessingActive && blessingQty > 0 && (
        <div className="coin-boost-row">
          <button type="button" className="coin-boost-btn reader-onboarding-btn" onClick={onStartBlessing}>
            Start Study Blessing (24h)
          </button>
          <span className="coin-boost-meta">Uses 1 blessing — 2× coins on quizzes until it ends.</span>
        </div>
      )}
      {!blessingActive && blessingQty < 1 && (
        <p className="coin-boost-line coin-boost-line--muted">
          {compact
            ? 'No Study Blessings in your bag — open the Treasury shop to buy more.'
            : 'No Study Blessings in your bag — buy them in this tab.'}
        </p>
      )}
      <div className="coin-boost-row coin-boost-row--toggle">
        <button
          type="button"
          className={`coin-boost-toggle${armed ? ' coin-boost-toggle--on' : ''}`}
          disabled={blessingActive || rushQty < 1}
          onClick={onToggleRush}
          aria-pressed={armed}
        >
          <span className="coin-boost-toggle-track" aria-hidden="true">
            <span className="coin-boost-toggle-knob" />
          </span>
          <span className="coin-boost-toggle-label">
            Coin Rush on next quiz ({rushQty} charge{rushQty === 1 ? '' : 's'})
          </span>
        </button>
      </div>
      {blessingActive && (
        <p className="coin-boost-line coin-boost-line--muted">Coin Rush is unavailable while Study Blessing is active.</p>
      )}
      {rushMsg && <p className="coin-boost-err">{rushMsg}</p>}
    </div>
  );
}
