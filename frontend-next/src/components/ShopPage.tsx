'use client';

import Link from 'next/link';
import { useEffect, useState } from 'react';
import {
  persistAuthSession,
  refreshSession,
  restoreAuthSession,
  type AuthSession,
} from '@/lib/account';
import { getWallet } from '@/lib/quiz';

export default function ShopPage() {
  const [session, setSession] = useState<AuthSession | null>(null);
  const [balance, setBalance] = useState<number | null>(null);

  useEffect(() => {
    let cancelled = false;
    const load = async () => {
      let s = restoreAuthSession();
      if (!s) {
        setSession(null);
        setBalance(null);
        return;
      }
      setSession(s);
      try {
        const w = await getWallet(s);
        if (!cancelled) setBalance(w.balance);
      } catch {
        try {
          const r = await refreshSession(s);
          persistAuthSession(r);
          if (!cancelled) setSession(r);
          const w = await getWallet(r);
          if (!cancelled) setBalance(w.balance);
        } catch {
          if (!cancelled) {
            setBalance(null);
          }
        }
      }
    };
    void load();
    return () => {
      cancelled = true;
    };
  }, []);

  return (
    <div className="shop-page">
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

      <header className="shop-page-header">
        <Link href="/app" className="shop-page-back">
          ← Bible
        </Link>
        <h1 className="shop-page-title">Shop</h1>
        {session ? (
          <p className="shop-page-balance" aria-live="polite">
            <span className="shop-page-coin" aria-hidden="true">
              🪙
            </span>
            {balance != null ? `${balance.toLocaleString()} coins` : '…'}
          </p>
        ) : (
          <p className="shop-page-balance shop-page-balance--muted">Sign in from the Bible app to earn coins from quizzes.</p>
        )}
      </header>

      <main className="shop-page-main">
        <div className="shop-pane-empty">
          <p className="shop-pane-lead">Spend coins you earn from chapter quizzes.</p>
          <p className="shop-pane-body">Cosmetic items will show up here in a future update.</p>
        </div>
      </main>
    </div>
  );
}
