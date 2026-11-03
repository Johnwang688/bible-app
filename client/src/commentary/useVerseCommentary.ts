// Matthew Henry commentary for one verse. The backend returns every entry that starts at or before the verse
// and has no end, so the entries are filtered to those that cover the verse, in reading order.
import { useQuery } from '@tanstack/react-query';

import { queryKeys, useApi, type CommentaryEntry } from '../api';
import type { BookInfo } from '../api/schemas';

export const COMMENTARY_SOURCE = 'matthew_henry';

/** The verses an entry covers. An entry with no `verse_end` covers its first verse only. */
export function entryRange(e: CommentaryEntry): { start: number; end: number } {
  return { start: e.verse_start, end: e.verse_end ?? e.verse_start };
}

export function coversVerse(e: CommentaryEntry, verse: number): boolean {
  const { start, end } = entryRange(e);
  return start <= verse && verse <= end;
}

/** The paragraphs of an entry: split on line breaks, trimmed, blank ones dropped. */
export function commentaryParagraphs(text: string): string[] {
  return text
    .split(/\r\n|\r|\n/)
    .map((p) => p.trim())
    .filter((p) => p.length > 0);
}

/** Texts longer than `max` plus this slack are shortened; shorter ones are shown whole. */
const SLACK = 200;

/**
 * A preview of at most `max` characters, cut at a sentence end (the last one ending between max/2 and max)
 * or else at the last space. `preview` is always a prefix of `text`.
 */
export function commentaryPreview(text: string, max = 700): { preview: string; truncated: boolean } {
  if (text.length <= max + SLACK) return { preview: text, truncated: false };

  let sentenceEnd = -1;
  const sentenceEndRe = /[.?!]["”’']?/g;
  let m: RegExpExecArray | null;
  while ((m = sentenceEndRe.exec(text)) !== null) {
    const end = m.index + m[0].length;
    if (end > max) break;
    if (end >= max / 2) sentenceEnd = end;
  }
  if (sentenceEnd !== -1) {
    return { preview: text.slice(0, sentenceEnd).trimEnd(), truncated: true };
  }

  let space = max;
  while (space > 0 && !/\s/.test(text.charAt(space))) space -= 1;
  // No space at all: cut hard at the limit.
  const cut = space > 0 ? space : max;
  return { preview: text.slice(0, cut).trimEnd(), truncated: true };
}

const byStartThenId = (a: CommentaryEntry, b: CommentaryEntry) => {
  const start = entryRange(a).start - entryRange(b).start;
  return start !== 0 ? start : a.id - b.id;
};

export function useVerseCommentary(book: BookInfo | undefined, chapter: number, verse: number) {
  const api = useApi();
  const name = book?.name ?? '';
  return useQuery({
    queryKey: queryKeys.commentary(name, chapter, verse, COMMENTARY_SOURCE),
    queryFn: ({ signal }) =>
      api.commentary({ book: name, chapter, verse, source: COMMENTARY_SOURCE }, { signal }),
    enabled: !!book,
    staleTime: Infinity,
    select: (rows: CommentaryEntry[]) => rows.filter((e) => coversVerse(e, verse)).sort(byStartThenId),
  });
}
