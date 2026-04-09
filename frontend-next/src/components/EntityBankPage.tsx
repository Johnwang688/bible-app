'use client';

import Link from 'next/link';
import { useSearchParams } from 'next/navigation';
import { useEffect, useMemo, useState } from 'react';

type EntityItem = { slug: string; label: string };

const KIND_META = {
  theme:  { label: 'Themes',    singular: 'Theme',    basePath: '/themes',  color: 'theme'  },
  person: { label: 'People',    singular: 'Person',   basePath: '/people',  color: 'person' },
  place:  { label: 'Places',    singular: 'Place',    basePath: '/places',  color: 'place'  },
} as const;

export default function EntityBankPage({ kind }: { kind: 'theme' | 'person' | 'place' }) {
  const searchParams = useSearchParams();
  const returnTo = searchParams.get('returnTo') ?? '';
  const meta = KIND_META[kind];

  const [items, setItems] = useState<EntityItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);
  const [query, setQuery] = useState('');

  const backHref = (() => {
    if (!returnTo) return '/app';
    const t = returnTo.trim();
    if (!t.startsWith('/') || t.startsWith('//') || t.length > 2048) return '/app';
    try {
      const u = new URL(t, 'http://reader.local');
      return u.pathname !== '/app' ? '/app' : `${u.pathname}${u.search}`;
    } catch { return '/app'; }
  })();

  const entitySuffix = returnTo ? `?returnTo=${encodeURIComponent(returnTo)}` : '';

  useEffect(() => {
    setLoading(true);
    setError(false);
    fetch(`/api/v1/summary-entities/list/${kind}`)
      .then(r => { if (!r.ok) throw new Error(); return r.json() as Promise<EntityItem[]>; })
      .then(j => { setItems(j); })
      .catch(() => setError(true))
      .finally(() => setLoading(false));
  }, [kind]);

  const filtered = useMemo(() => {
    if (!query.trim()) return items;
    const q = query.toLowerCase();
    return items.filter(it => it.label.toLowerCase().includes(q));
  }, [items, query]);

  // Group alphabetically
  const grouped = useMemo(() => {
    const map: Record<string, EntityItem[]> = {};
    for (const item of filtered) {
      const letter = item.label[0]?.toUpperCase() ?? '#';
      (map[letter] ??= []).push(item);
    }
    return Object.entries(map).sort(([a], [b]) => a.localeCompare(b));
  }, [filtered]);

  return (
    <div className={`bank-page bank-page--${kind}`}>
    <div className="bank-page-inner">
      <header className="bank-page-header">
        <Link href={backHref} className="entity-page-back">← Reader</Link>
        <h1 className="bank-page-title">{meta.label}</h1>
        <p className="bank-page-subtitle">
          {loading ? '…' : `${items.length} ${meta.label.toLowerCase()} indexed across the Bible`}
        </p>
      </header>

      {!loading && !error && items.length > 6 && (
        <div className="bank-search-wrap">
          <input
            className="bank-search"
            type="search"
            placeholder={`Search ${meta.label.toLowerCase()}…`}
            value={query}
            onChange={e => setQuery(e.target.value)}
          />
        </div>
      )}

      {loading && (
        <div className="state-msg">
          <span className="spinner" />
          <span>Loading…</span>
        </div>
      )}
      {error && <p className="entity-page-error">Could not load {meta.label.toLowerCase()}.</p>}

      {!loading && !error && filtered.length === 0 && (
        <p className="entity-page-muted">{query ? 'No matches.' : 'Nothing indexed yet.'}</p>
      )}

      {!loading && !error && grouped.map(([letter, group]) => (
        <div key={letter} className="bank-letter-group">
          <div className="bank-letter">{letter}</div>
          <div className="bank-items">
            {group.map(item => (
              <Link
                key={item.slug}
                href={`${meta.basePath}/${encodeURIComponent(item.slug)}${entitySuffix}`}
                className={`bank-item bank-item--${kind}`}
              >
                {item.label}
              </Link>
            ))}
          </div>
        </div>
      ))}
    </div>
    </div>
  );
}
