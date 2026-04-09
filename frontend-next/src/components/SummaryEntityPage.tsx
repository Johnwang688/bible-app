'use client';

import Link from 'next/link';
import { useSearchParams } from 'next/navigation';
import { useEffect, useState } from 'react';

function safeReaderReturnHref(raw: string | null): string {
  if (!raw || typeof raw !== 'string') return '/app';
  const t = raw.trim();
  if (!t.startsWith('/') || t.startsWith('//')) return '/app';
  if (t.length > 2048) return '/app';
  try {
    const u = new URL(t, 'http://reader.local');
    if (u.pathname !== '/app') return '/app';
    return `${u.pathname}${u.search}`;
  } catch {
    return '/app';
  }
}

type Reference = {
  commentary_id: number;
  book_number: number;
  book_name: string;
  chapter: number;
};

type EntityPayload = {
  kind: string;
  slug: string;
  label: string;
  references: Reference[];
};

export default function SummaryEntityPage({
  kind,
  slug,
}: {
  kind: 'theme' | 'person';
  slug: string;
}) {
  const searchParams = useSearchParams();
  const readerBackHref = safeReaderReturnHref(searchParams.get('returnTo'));
  const [data, setData] = useState<EntityPayload | null>(null);
  const [error, setError] = useState(false);

  useEffect(() => {
    let cancelled = false;
    setData(null);
    setError(false);
    fetch(`/api/v1/summary-entities/${kind}/${encodeURIComponent(slug)}`)
      .then((r) => {
        if (!r.ok) throw new Error('not found');
        return r.json() as Promise<EntityPayload>;
      })
      .then((j) => {
        if (!cancelled) setData(j);
      })
      .catch(() => {
        if (!cancelled) setError(true);
      });
    return () => {
      cancelled = true;
    };
  }, [kind, slug]);

  const title = kind === 'theme' ? 'Theme' : 'Person';

  return (
    <div className="entity-page">
      <header className="entity-page-header">
        <Link href={readerBackHref} className="entity-page-back">
          ← Reader
        </Link>
        <h1 className="entity-page-title">
          {data ? (
            <>
              <span className="entity-page-kind">{title}</span>
              {data.label}
            </>
          ) : error ? (
            'Not found'
          ) : (
            '…'
          )}
        </h1>
      </header>
      {error && <p className="entity-page-error">This {title.toLowerCase()} could not be loaded.</p>}
      {data && (
        <section className="entity-page-section" aria-label="Chapter summaries">
          <h2 className="entity-page-subheading">Appears in chapter summaries</h2>
          {data.references.length === 0 ? (
            <p className="entity-page-muted">No references indexed yet.</p>
          ) : (
            <ul className="entity-page-refs">
              {data.references.map((r) => (
                <li key={`${r.book_number}-${r.chapter}-${r.commentary_id}`}>
                  <Link
                    href={`/app?book=${encodeURIComponent(r.book_name)}&chapter=${r.chapter}`}
                    className="entity-page-ref-link"
                  >
                    {r.book_name} {r.chapter}
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </section>
      )}
    </div>
  );
}
