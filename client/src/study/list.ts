// The Study tab's "Saved" list, as pure functions: study items become entries, which are filtered and sorted.
//
// One entry per saved action: neighbouring verses in one chapter with the same kind, the same value (the
// colour, for highlights) and the same time were saved together (a range from the verse sheet), so they show
// as one entry, "John 3:16–18". A verse with a highlight and a note shows in both lists.
import type { StudyItems } from '../storage/keys';
import type { HighlightId } from '../theme/highlights';

export type StudyKind = 'highlight' | 'note' | 'bookmark';

export interface StudyEntry {
  /** Unique and stable: `"highlight:43:3:16-18"`. */
  id: string;
  kind: StudyKind;
  bookNumber: number;
  chapter: number;
  start: number;
  end: number;
  /** ISO time it was saved (a highlight's colour set, a note's last edit, a bookmark made). */
  time: string;
  colour: HighlightId | null;
  /** The note's text, for notes. */
  note: string | null;
}

interface Item {
  kind: StudyKind;
  bookNumber: number;
  chapter: number;
  verse: number;
  time: string;
  colour: HighlightId | null;
  note: string | null;
}

function parse(key: string): [number, number, number] {
  return key.split(':').map(Number) as [number, number, number];
}

export function buildStudyList(items: StudyItems): StudyEntry[] {
  const all: Item[] = [];
  for (const [k, h] of Object.entries(items.highlights)) {
    const [bookNumber, chapter, verse] = parse(k);
    all.push({ kind: 'highlight', bookNumber, chapter, verse, time: h.updatedAt, colour: h.colour, note: null });
  }
  for (const [k, n] of Object.entries(items.notes)) {
    const [bookNumber, chapter, verse] = parse(k);
    all.push({ kind: 'note', bookNumber, chapter, verse, time: n.updatedAt, colour: null, note: n.text });
  }
  for (const [k, b] of Object.entries(items.bookmarks)) {
    const [bookNumber, chapter, verse] = parse(k);
    all.push({ kind: 'bookmark', bookNumber, chapter, verse, time: b.createdAt, colour: null, note: null });
  }
  all.sort((a, b) => a.kind.localeCompare(b.kind) || a.bookNumber - b.bookNumber || a.chapter - b.chapter || a.verse - b.verse);

  const entries: StudyEntry[] = [];
  let open: StudyEntry | null = null;
  for (const it of all) {
    const joins =
      open !== null &&
      it.kind !== 'note' && // notes belong to one verse
      open.kind === it.kind &&
      open.bookNumber === it.bookNumber &&
      open.chapter === it.chapter &&
      open.end + 1 === it.verse &&
      open.colour === it.colour &&
      open.time === it.time;
    if (joins && open) {
      open.end = it.verse;
      continue;
    }
    open = {
      id: '',
      kind: it.kind,
      bookNumber: it.bookNumber,
      chapter: it.chapter,
      start: it.verse,
      end: it.verse,
      time: it.time,
      colour: it.colour,
      note: it.note,
    };
    entries.push(open);
  }
  for (const e of entries) e.id = `${e.kind}:${e.bookNumber}:${e.chapter}:${e.start}-${e.end}`;
  return sortStudyList(entries);
}

/** Newest first; ties in canon order, then highlight, note, bookmark. */
export function sortStudyList(entries: StudyEntry[]): StudyEntry[] {
  const order: Record<StudyKind, number> = { highlight: 0, note: 1, bookmark: 2 };
  return [...entries].sort(
    (a, b) =>
      b.time.localeCompare(a.time) ||
      a.bookNumber - b.bookNumber ||
      a.chapter - b.chapter ||
      a.start - b.start ||
      order[a.kind] - order[b.kind],
  );
}

export interface StudyFilter {
  kind: StudyKind | 'all';
  /** Only highlights in this colour (so nothing else) when set. */
  colour: HighlightId | null;
  bookNumber: number | null;
}

export const NO_FILTER: StudyFilter = { kind: 'all', colour: null, bookNumber: null };

export function filterStudyList(entries: readonly StudyEntry[], f: StudyFilter): StudyEntry[] {
  return entries.filter(
    (e) =>
      (f.kind === 'all' || e.kind === f.kind) &&
      (f.colour === null || (e.kind === 'highlight' && e.colour === f.colour)) &&
      (f.bookNumber === null || e.bookNumber === f.bookNumber),
  );
}

/** The books that have any entry, in canon order (the book filter offers only these). */
export function booksWithEntries(entries: readonly StudyEntry[]): number[] {
  return [...new Set(entries.map((e) => e.bookNumber))].sort((a, b) => a - b);
}
