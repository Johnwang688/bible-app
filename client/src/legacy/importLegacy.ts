// Imports the old web app's localStorage into the new app's storage, once per part (R-7a).
// Read-only on the old keys (the old frontend keeps serving the site until the cut-over), never throws,
// and never overwrites anything the new app already holds.
import { TRANSLATION_IDS, type TranslationId } from '../reader/translations';
import {
  NOTE_MAX_LENGTH,
  RECENT_LIMIT,
  appearanceKey,
  readerPositionKey,
  recentPassagesKey,
  refKey,
  studyItemsKey,
  type ReaderPosition,
  type StudyItems,
} from '../storage/keys';
import type { Storage } from '../storage/storage';
import type { HighlightId } from '../theme/highlights';
import { bookNumberByName, isChapterOf } from './books';
import { legacyImportKey, type LegacyPart } from './keys';
import { isFiniteNumber, isPlainObject, isPositiveInteger, isVerse, readJson, readRaw, stringArray } from './parse';
import type { LegacySource } from './source';

/** The parts imported today. 'progress' waits for R-3 (see progress.ts). */
export const IMPORTED_PARTS: readonly LegacyPart[] = ['position', 'recent', 'study', 'theme'];

export interface ImportOptions {
  storage: Storage;
  source: LegacySource | null;
  now?: () => Date;
}

type PartImporter = (storage: Storage, source: LegacySource, now: () => Date) => void;

export function importLegacyDataOnce(opts: ImportOptions): { imported: LegacyPart[] } {
  const { storage, source } = opts;
  if (!source) return { imported: [] };
  const now = opts.now ?? (() => new Date());

  let done: LegacyPart[] = [];
  try {
    done = storage.get(legacyImportKey).parts;
  } catch {
    // Unreadable record: treat as nothing imported yet (existing data always wins anyway).
  }

  const imported: LegacyPart[] = [];
  for (const part of IMPORTED_PARTS) {
    if (done.includes(part)) continue;
    try {
      PART_IMPORTERS[part]?.(storage, source, now);
    } catch {
      // Corrupt data, a throwing source or a schema failure: this part writes nothing, and still counts as run.
    }
    imported.push(part);
  }

  if (imported.length > 0) {
    try {
      storage.set(legacyImportKey, { parts: [...done, ...imported] });
    } catch {
      // Could not record: the parts run again next launch, which is harmless.
    }
  }
  return { imported };
}

// ---- position and recent passages ----

function translationOf(raw: unknown): TranslationId {
  if (typeof raw === 'string') {
    const wanted = raw.trim().toUpperCase();
    const hit = TRANSLATION_IDS.find((id) => id === wanted);
    if (hit) return hit;
  }
  return 'BSB';
}

/** `{ book, chapter, translation? }` → a position, or null when it names no real chapter. */
function positionOf(value: unknown): ReaderPosition | null {
  if (!isPlainObject(value)) return null;
  const bookNumber = bookNumberByName(value.book);
  if (bookNumber === null || !isChapterOf(bookNumber, value.chapter)) return null;
  return { bookNumber, chapter: value.chapter, translation: translationOf(value.translation) };
}

function importPosition(storage: Storage, source: LegacySource): void {
  if (storage.get(readerPositionKey) !== null) return;
  const position = positionOf(readJson(source, 'bible-app-last-position'));
  if (position) storage.set(readerPositionKey, position);
}

function importRecent(storage: Storage, source: LegacySource): void {
  if (storage.get(recentPassagesKey).length > 0) return;
  const raw = readJson(source, 'bible-app-recent-passages');
  if (!Array.isArray(raw)) return;

  const entries: { position: ReaderPosition; savedAt: number }[] = [];
  for (const item of raw) {
    const position = positionOf(item);
    const savedAt = isPlainObject(item) ? item.savedAt : undefined;
    if (position && isFiniteNumber(savedAt)) entries.push({ position, savedAt });
  }
  entries.sort((a, b) => b.savedAt - a.savedAt);

  const seen = new Set<string>();
  const recent: ReaderPosition[] = [];
  for (const { position } of entries) {
    const key = `${position.bookNumber}:${position.chapter}`;
    if (seen.has(key)) continue;
    seen.add(key);
    recent.push(position);
    if (recent.length === RECENT_LIMIT) break;
  }
  if (recent.length > 0) storage.set(recentPassagesKey, recent);
}

// ---- study items ----

/** The old reader had one highlight colour for every highlight; its seven ids map onto the new six. */
const COLOUR_MAP: Record<string, HighlightId> = {
  yellow: 'yellow',
  amber: 'orange',
  green: 'green',
  blue: 'blue',
  pink: 'pink',
  lavender: 'purple',
  mint: 'green',
};

function oldHighlightColour(source: LegacySource): HighlightId {
  const settings = readJson(source, 'bible-app-reader-settings');
  const id = isPlainObject(settings) ? settings.highlightColor : undefined;
  return typeof id === 'string' && Object.prototype.hasOwnProperty.call(COLOUR_MAP, id) ? COLOUR_MAP[id]! : 'yellow';
}

/**
 * The stored highlight value, in R-3's shape `{ colour, updatedAt }`. The one place the import builds it.
 * The old app stored no time for a highlight, so it is timed at the import, as bookmarks are.
 */
function highlightValue(colour: HighlightId, importedAt: Date): StudyItems['highlights'][string] {
  return { colour, updatedAt: importedAt.toISOString() };
}

function refOf(book: unknown, chapter: unknown, verse: unknown): string | null {
  const bookNumber = bookNumberByName(book);
  if (bookNumber === null || !isChapterOf(bookNumber, chapter) || !isVerse(verse)) return null;
  return refKey({ bookNumber, chapter, verse });
}

/** `book::chapter::verse` (lowercase book name, which may contain spaces) → the new reference key, or null. */
function refKeyOfOld(key: string): string | null {
  const parts = key.split('::');
  if (parts.length !== 3 || !/^\d+$/.test(parts[1]!) || !/^\d+$/.test(parts[2]!)) return null;
  return refOf(parts[0], Number(parts[1]), Number(parts[2]));
}

/** Cuts to the limit without splitting a surrogate pair. */
function cutNote(text: string): string {
  if (text.length <= NOTE_MAX_LENGTH) return text;
  const lastKept = text.charCodeAt(NOTE_MAX_LENGTH - 1);
  return text.slice(0, lastKept >= 0xd800 && lastKept <= 0xdbff ? NOTE_MAX_LENGTH - 1 : NOTE_MAX_LENGTH);
}

function importStudy(storage: Storage, source: LegacySource, now: () => Date): void {
  const importedAt = now();
  const colour = oldHighlightColour(source);
  const found: StudyItems = { highlights: {}, notes: {}, bookmarks: {} };

  for (const key of stringArray(readJson(source, 'bible-app-highlights'))) {
    const ref = refKeyOfOld(key);
    if (ref) found.highlights[ref] = highlightValue(colour, importedAt);
  }

  for (const key of stringArray(readJson(source, 'bible-app-bookmarks'))) {
    const ref = refKeyOfOld(key);
    if (ref) found.bookmarks[ref] = { createdAt: importedAt.toISOString() };
  }

  const notes = readJson(source, 'bible-app-notes');
  if (isPlainObject(notes)) {
    for (const [key, value] of Object.entries(notes)) {
      // The old app's isVerseNote check, plus value.key === key.
      if (
        !isPlainObject(value) ||
        typeof value.key !== 'string' ||
        typeof value.book !== 'string' ||
        !isPositiveInteger(value.chapter) ||
        !isPositiveInteger(value.verse) ||
        typeof value.text !== 'string' ||
        !isFiniteNumber(value.updatedAt) ||
        value.key !== key
      ) {
        continue;
      }
      const ref = refOf(value.book, value.chapter, value.verse);
      if (!ref || value.text.trim() === '') continue;
      const when = new Date(value.updatedAt);
      found.notes[ref] = {
        text: cutNote(value.text),
        // A time outside the Date range cannot be written as ISO; keep the note, dated at the import.
        updatedAt: (Number.isFinite(when.getTime()) ? when : importedAt).toISOString(),
      };
    }
  }

  // Per entry, what the new app already has wins.
  const existing = storage.get(studyItemsKey);
  const merged: StudyItems = {
    highlights: { ...found.highlights, ...existing.highlights },
    notes: { ...found.notes, ...existing.notes },
    bookmarks: { ...found.bookmarks, ...existing.bookmarks },
  };
  const grew =
    Object.keys(merged.highlights).length > Object.keys(existing.highlights).length ||
    Object.keys(merged.notes).length > Object.keys(existing.notes).length ||
    Object.keys(merged.bookmarks).length > Object.keys(existing.bookmarks).length;
  if (grew) storage.set(studyItemsKey, merged);
}

// ---- theme ----

/** The old `THEME_MIGRATION`, reduced to what the new app keeps: a light/dark mode. Auto/default/unknown are absent. */
const THEME_MODE: Record<string, 'light' | 'dark'> = {
  paper: 'light',
  dark: 'dark',
  midnight: 'dark',
  rebecca: 'dark',
  galaxy: 'dark',
  'Galaxy Metallic': 'dark',
  'galaxy metallic': 'dark',
  teal: 'dark',
  forest: 'dark',
  magenta: 'dark',
  emerald: 'dark',
  canyon: 'dark',
  neonrose: 'dark',
  parchment: 'light',
  gold: 'light',
  light: 'light',
  dynamic: 'light',
  pink: 'light',
  blue: 'light',
  green: 'light',
  yellow: 'light',
  purple: 'light',
  orange: 'light',
};

function importTheme(storage: Storage, source: LegacySource): void {
  const current = storage.get(appearanceKey);
  if (current.preset !== appearanceKey.fallback.preset || current.mode !== appearanceKey.fallback.mode) return;
  const raw = readRaw(source, 'theme');
  // Missing, unknown, 'system' and the old 'default' all mean Auto: nothing to write.
  if (!raw || !Object.prototype.hasOwnProperty.call(THEME_MODE, raw)) return;
  storage.set(appearanceKey, { preset: null, mode: THEME_MODE[raw]! });
}

const PART_IMPORTERS: Partial<Record<LegacyPart, PartImporter>> = {
  position: importPosition,
  recent: importRecent,
  study: importStudy,
  theme: importTheme,
};
