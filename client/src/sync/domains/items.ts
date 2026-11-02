// Study items (highlights, notes, bookmarks) ↔ RemoteItem (R-6b, CONFLICTS.md rules 1–8).
// An item is one kind on one verse, id `${kind}:${ref}`. Its signature is the part of the value that
// syncs (a highlight's colour, a note's text, a bookmark's createdAt); its own time (rule 4) is a
// highlight's or note's `updatedAt` or a bookmark's `createdAt`, except R-3's UNKNOWN_TIME.
import { z } from 'zod';

import type { StorageKey } from '../../storage/storage';
import type { Clock, RemoteSide } from '../merge';
import { UNKNOWN_TIME, type StudyItemsShape } from '../shapes';
import type { ItemKind, PulledItem, RemoteItem, RemoteItemValue } from '../types';

const FIELD = { highlight: 'highlights', note: 'notes', bookmark: 'bookmarks' } as const satisfies Record<
  ItemKind,
  keyof StudyItemsShape
>;

export interface LocalItem {
  kind: ItemKind;
  ref: string;
  sig: string;
  value: RemoteItemValue;
  own: number | null;
}

export const itemId = (kind: ItemKind, ref: string): string => `${kind}:${ref}`;

/** The kind and ref of an item id, or null when the id is not one. */
export function splitItemId(id: string): { kind: ItemKind; ref: string } | null {
  const i = id.indexOf(':');
  if (i < 0) return null;
  const kind = id.slice(0, i);
  if (kind !== 'highlight' && kind !== 'note' && kind !== 'bookmark') return null;
  return { kind, ref: id.slice(i + 1) };
}

/** Largest |ms| a Date can hold. */
const MAX_TIME = 8.64e15;

function ownTime(iso: string): number | null {
  if (iso === UNKNOWN_TIME) return null;
  const t = Date.parse(iso);
  return Number.isFinite(t) ? t : null;
}

/** Every local item by id. */
export function readLocalItems(v: StudyItemsShape): Map<string, LocalItem> {
  const out = new Map<string, LocalItem>();
  for (const [ref, h] of Object.entries(v.highlights)) {
    out.set(itemId('highlight', ref), { kind: 'highlight', ref, sig: h.colour, value: { colour: h.colour }, own: ownTime(h.updatedAt) });
  }
  for (const [ref, n] of Object.entries(v.notes)) {
    out.set(itemId('note', ref), { kind: 'note', ref, sig: n.text, value: { text: n.text }, own: ownTime(n.updatedAt) });
  }
  for (const [ref, b] of Object.entries(v.bookmarks)) {
    out.set(itemId('bookmark', ref), { kind: 'bookmark', ref, sig: b.createdAt, value: { createdAt: b.createdAt }, own: ownTime(b.createdAt) });
  }
  return out;
}

/** Signatures only (cheaper; for change detection). */
export function readLocalSigs(v: StudyItemsShape): Map<string, string> {
  const out = new Map<string, string>();
  for (const [ref, h] of Object.entries(v.highlights)) out.set(itemId('highlight', ref), h.colour);
  for (const [ref, n] of Object.entries(v.notes)) out.set(itemId('note', ref), n.text);
  for (const [ref, b] of Object.entries(v.bookmarks)) out.set(itemId('bookmark', ref), b.createdAt);
  return out;
}

const header = z.object({
  id: z.string(),
  kind: z.enum(['highlight', 'note', 'bookmark']),
  // The refKey shape ("43:3:16"); the storage schema checks the real bounds for live values.
  ref: z.string().regex(/^\d{1,3}:\d{1,3}:\d{1,3}$/),
  deleted: z.boolean(),
  value: z.unknown(),
  updatedAt: z.number().refine((t) => Number.isFinite(t) && Math.abs(t) <= MAX_TIME),
  deviceId: z.string(),
});

/** The local entry for a remote value, or null when the value is not shaped like its kind. */
function localEntry(kind: ItemKind, value: unknown, updatedAt: number): { entry: unknown; sig: string } | null {
  if (!value || typeof value !== 'object') return null;
  const v = value as Record<string, unknown>;
  switch (kind) {
    case 'highlight':
      return typeof v.colour === 'string'
        ? { entry: { colour: v.colour, updatedAt: new Date(updatedAt).toISOString() }, sig: v.colour }
        : null;
    case 'note':
      return typeof v.text === 'string' ? { entry: { text: v.text, updatedAt: new Date(updatedAt).toISOString() }, sig: v.text } : null;
    case 'bookmark':
      return typeof v.createdAt === 'string' ? { entry: { createdAt: v.createdAt }, sig: v.createdAt } : null;
  }
}

export interface CheckedItem {
  item: PulledItem;
  kind: ItemKind;
  ref: string;
  side: RemoteSide;
  /** The local entry to write when taking a live, valid item. */
  entry: unknown;
}

/**
 * Checks a pulled item. Null when it is not even an item (no usable id or clock): such a document is
 * skipped entirely. Otherwise `side.valid` says whether the device can store the value (rule 6),
 * checked against the local key's schema with a candidate holding just this entry.
 */
export function checkPulledItem(key: StorageKey<StudyItemsShape>, raw: PulledItem): CheckedItem | null {
  const h = header.safeParse(raw);
  if (!h.success || h.data.id !== itemId(h.data.kind, h.data.ref)) return null;
  const { kind, ref, deleted, updatedAt, deviceId } = h.data;
  const clock: Clock = { t: updatedAt, d: deviceId };
  if (deleted) return { item: raw, kind, ref, side: { sig: null, valid: true, clock }, entry: null };
  const local = localEntry(kind, h.data.value, updatedAt);
  let valid = false;
  if (local) {
    const candidate: StudyItemsShape = { highlights: {}, notes: {}, bookmarks: {} };
    Object.defineProperty(candidate[FIELD[kind]], ref, { value: local.entry, enumerable: true, writable: true, configurable: true });
    valid = key.schema.safeParse(candidate).success;
  }
  return { item: raw, kind, ref, side: { sig: valid ? local!.sig : null, valid, clock }, entry: valid ? local!.entry : null };
}

/** Writes (or with `entry` null, removes) one item in a local value. */
export function setLocalItem(v: StudyItemsShape, kind: ItemKind, ref: string, entry: unknown): void {
  const field = v[FIELD[kind]] as Record<string, unknown>;
  if (entry === null) delete field[ref];
  else Object.defineProperty(field, ref, { value: entry, enumerable: true, writable: true, configurable: true });
}

/** The remote document for a local item (or, with `local` undefined, its tombstone). */
export function toRemoteItem(id: string, local: LocalItem | undefined, clock: Clock): RemoteItem | null {
  const parts = splitItemId(id);
  if (!parts) return null;
  return {
    id,
    kind: parts.kind,
    ref: parts.ref,
    deleted: local === undefined,
    value: local ? local.value : null,
    updatedAt: clock.t,
    deviceId: clock.d,
  };
}
