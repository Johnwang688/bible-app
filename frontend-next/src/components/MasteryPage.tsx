'use client';

import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useCallback, useEffect, useState } from 'react';
import MasteryOverviewPanel from '@/components/MasteryOverviewPanel';
import { restoreAuthSession, type AuthSession } from '@/lib/account';
import { DEFAULT_TRANSLATION } from '@/features/reader/translations';
import { STORAGE_KEYS } from '@/lib/storageKeys';

function usePreferredTranslation(): string {
  const [t, setT] = useState(DEFAULT_TRANSLATION);
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
