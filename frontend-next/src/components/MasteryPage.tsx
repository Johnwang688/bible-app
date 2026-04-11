'use client';

import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useCallback, useEffect, useState } from 'react';
import MasteryOverviewPanel from '@/components/MasteryOverviewPanel';
import { restoreAuthSession, type AuthSession } from '@/lib/account';
import { STORAGE_KEYS } from '@/lib/storageKeys';

function usePreferredTranslation(): string {
  const [t, setT] = useState('WEB');
  useEffect(() => {
    try {
      const raw = typeof window !== 'undefined' ? window.localStorage.getItem(STORAGE_KEYS.LAST_POSITION) : null;
      const p = raw ? (JSON.parse(raw) as { translation?: string }) : null;
      if (p?.translation && typeof p.translation === 'string') setT(p.translation);
    } catch {
      /* ignore */
    }
  }, []);
  return t;
}

export default function MasteryPage() {
  const router = useRouter();
  const translation = usePreferredTranslation();
  const [session, setSession] = useState<AuthSession | null>(null);

  useEffect(() => {
    setSession(restoreAuthSession());
  }, []);

  const onChapterSelect = useCallback(
    (_bookNumber: number, chapter: number, _nextTranslation: string, bookName?: string) => {
      const name = bookName?.trim();
      if (!name) return;
      router.push(`/app?book=${encodeURIComponent(name)}&chapter=${String(chapter)}`);
    },
    [router],
  );

  return (
    <div className="shop-page mastery-page">
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
        <h1 className="shop-page-title">Mastery</h1>
        <p className="shop-page-balance shop-page-balance--muted">
          Your chapter quiz progress across the Bible. Tap a chapter to open it in the reader.
        </p>
      </header>

      <main className="shop-page-main">
        <MasteryOverviewPanel
          variant="accordion"
          session={session}
          translation={translation}
          onChapterSelect={onChapterSelect}
        />
      </main>
    </div>
  );
}
