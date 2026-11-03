// Unsaved note drafts, one per verse reference, kept for as long as the app is running.
//
// The note editor lives inside the verse sheet, and the sheet closes whenever the selection is dropped (a chapter
// or translation change, the tab bar, a search result). The draft must outlive the sheet, so it lives here, keyed
// by reference (not translation: notes attach to the reference). The editor writes every change through, so there
// is nothing to catch at unmount: the text typed so far is always here. Opening that verse's note again restores
// it; a save or a delete of that note clears it. A draft that matches the saved note (or is empty with no note)
// is not a draft and is dropped.
//
// Memory only, by design: a draft is a moment's typing, not data. It is not stored on the device or synced.
import type { VerseRef } from '../storage/keys';

/** The text, and the saved note's time when the draft began (null: there was no note then). */
interface Draft {
  text: string;
  base: string | null;
}

/** The saved note as the study items hold it. */
type SavedNote = { text: string; updatedAt: string } | null;

const drafts = new Map<string, Draft>();

const keyOf = (ref: VerseRef) => `${ref.bookNumber}:${ref.chapter}:${ref.verse}`;

/**
 * The unsaved draft for this verse's note, or undefined. Given the saved note: once the note has been saved since
 * the draft began (here, or elsewhere and synced), the saved note is newer and the draft is dropped; so is a draft
 * that matches it. (Dropping it here is a cache clean-up, safe to repeat in a render.)
 */
export function noteDraftOf(ref: VerseRef, saved?: SavedNote): string | undefined {
  const draft = drafts.get(keyOf(ref));
  if (!draft || saved === undefined) return draft?.text;
  if ((saved?.updatedAt ?? null) !== draft.base || draft.text === (saved?.text ?? '')) {
    drafts.delete(keyOf(ref));
    return undefined;
  }
  return draft.text;
}

/** Keeps `text` as the draft, unless it is the saved note (or '' with no note), which drops it. */
export function keepNoteDraft(ref: VerseRef, text: string, saved: SavedNote): void {
  const key = keyOf(ref);
  if (text === (saved?.text ?? '')) {
    drafts.delete(key);
    return;
  }
  const existing = drafts.get(key);
  drafts.set(key, { text, base: existing ? existing.base : (saved?.updatedAt ?? null) });
}

/** The note was saved or deleted: its draft is gone. */
export function clearNoteDraft(ref: VerseRef): void {
  drafts.delete(keyOf(ref));
}

/** Test-only: forget every draft. */
export function resetNoteDrafts(): void {
  drafts.clear();
}
