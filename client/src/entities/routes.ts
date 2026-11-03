// Where the people, places and themes screens live (root stack screens above the tabs, like search).
// Orchestrator-owned (R-5 part 2). Routes: `client/src/app/entities/[kind]/index.tsx` (the list) and
// `client/src/app/entities/[kind]/[slug].tsx` (one page).
import type { EntityKind } from '../api/schemas';
import { ENTITY_KINDS } from './data';

/** The list of one kind, optionally opened already filtered (Explore's "See all"). */
export function entityListHref(kind: EntityKind, filter?: string): string {
  const q = filter?.trim();
  return q ? `/entities/${kind}?q=${encodeURIComponent(q)}` : `/entities/${kind}`;
}

/** One entity's page. */
export function entityPageHref(kind: EntityKind, slug: string): string {
  return `/entities/${kind}/${encodeURIComponent(slug)}`;
}

/** A route parameter as a kind, or null when it is not one (an old or mistyped link). */
export function parseEntityKind(param: unknown): EntityKind | null {
  const v = Array.isArray(param) ? param[0] : param;
  return typeof v === 'string' && (ENTITY_KINDS as readonly string[]).includes(v) ? (v as EntityKind) : null;
}

/** A single string route parameter ('' when missing). */
export function routeParam(param: unknown): string {
  const v = Array.isArray(param) ? param[0] : param;
  return typeof v === 'string' ? v : '';
}
