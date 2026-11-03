// People, places and themes: the lists and pages from `/summary-entities`, and the name matching for search.
import { useQuery } from '@tanstack/react-query';

import { queryKeys, useApi } from '../api';
import type { EntityKind, SummaryEntityListItemOut, SummaryEntityReferenceOut } from '../api/schemas';

export const ENTITY_KINDS = ['person', 'place', 'theme'] as const;

export function useEntityList(kind: EntityKind, opts?: { enabled?: boolean }) {
  const api = useApi();
  return useQuery({
    queryKey: queryKeys.entities(kind),
    queryFn: ({ signal }) => api.entities(kind, { signal }),
    staleTime: Infinity,
    enabled: opts?.enabled !== false,
  });
}

export function useEntityPage(kind: EntityKind, slug: string) {
  const api = useApi();
  return useQuery({
    queryKey: queryKeys.entity(kind, slug),
    queryFn: ({ signal }) => api.entity(kind, slug, { signal }),
    staleTime: Infinity,
  });
}

/** The chapters an entity appears in, grouped by book in canon order; chapters ascending and unique. */
export function groupReferencesByBook(
  refs: SummaryEntityReferenceOut[],
): { bookNumber: number; chapters: number[] }[] {
  const byBook = new Map<number, Set<number>>();
  for (const r of refs) {
    let chapters = byBook.get(r.book_number);
    if (!chapters) byBook.set(r.book_number, (chapters = new Set()));
    chapters.add(r.chapter);
  }
  return [...byBook.keys()]
    .sort((a, b) => a - b)
    .map((bookNumber) => ({
      bookNumber,
      chapters: [...byBook.get(bookNumber)!].sort((a, b) => a - b),
    }));
}

export interface EntityMatch {
  kind: EntityKind;
  slug: string;
  label: string;
}

/** 0 exact, 1 label starts with the query, 2 a word starts with it, null no match. */
function matchRank(label: string, query: string): number | null {
  const lower = label.toLowerCase();
  if (lower === query) return 0;
  if (lower.startsWith(query)) return 1;
  if (lower.split(/[\s-]+/).some((word) => word.startsWith(query))) return 2;
  return null;
}

/**
 * Entities whose label matches `query` (at least two characters, case-insensitive), at most `limitPerKind`
 * per kind. Within a kind: exact, then prefix, then word prefix; shorter labels first; then by label.
 */
export function matchEntities(
  lists: Partial<Record<EntityKind, SummaryEntityListItemOut[]>>,
  query: string,
  limitPerKind = 3,
): EntityMatch[] {
  const q = query.trim().toLowerCase();
  if (q.length < 2) return [];

  const out: EntityMatch[] = [];
  for (const kind of ENTITY_KINDS) {
    const list = lists[kind];
    if (!list) continue;
    const ranked = list
      .map((item) => ({ item, rank: matchRank(item.label, q) }))
      .filter((r): r is { item: SummaryEntityListItemOut; rank: number } => r.rank !== null)
      .sort(
        (a, b) =>
          a.rank - b.rank ||
          a.item.label.length - b.item.label.length ||
          (a.item.label < b.item.label ? -1 : a.item.label > b.item.label ? 1 : 0),
      );
    for (const { item } of ranked.slice(0, limitPerKind)) {
      out.push({ kind, slug: item.slug, label: item.label });
    }
  }
  return out;
}
