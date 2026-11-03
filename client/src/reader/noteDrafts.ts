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

const drafts = new Map<string, string>();

const keyOf = (ref: VerseRef) => `${ref.bookNumber}:${ref.chapter}:${ref.verse}`;

/**
 * The unsaved draft for this verse's note, or undefined. Given the saved note, a draft that matches it (the note was
 * saved with that text somewhere else meanwhile) is no draft.
 */
export function noteDraftOf(ref: VerseRef, saved?: string | null): string | undefined {
  const draft = drafts.get(keyOf(ref));
  return saved !== undefined && draft === (saved ?? '') ? undefined : draft;
}

/** Keeps `text` as the draft, unless it is the saved note (`saved`, or '' with no note), which drops it. */
export function keepNoteDraft(ref: VerseRef, text: string, saved: string | null): void {
  if (text === (saved ?? '')) drafts.delete(keyOf(ref));
  else drafts.set(keyOf(ref), text);
}

/** The note was saved or deleted: its draft is gone. */
export function clearNoteDraft(ref: VerseRef): void {
  drafts.delete(keyOf(ref));
}

/** Test-only: forget every draft. */
export function resetNoteDrafts(): void {
  drafts.clear();
}
