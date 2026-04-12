/**
 * Client-side parsing for scripture labels like "Genesis 1:6-7".
 * Mirrors `PASSAGE_RE` / `ParsedReference` in `app/services/ai_service.py`.
 */

export interface ParsedScriptureRef {
  book: string;
  chapter: number;
  verse_start?: number;
  verse_end?: number;
}

export type ScriptureRefSegment =
  | { kind: 'text'; text: string }
  | { kind: 'ref'; text: string; book: string; chapter: number; verse_start?: number; verse_end?: number };

const TRAILING_PUNCT_RE = /[.,;:)\]]+$/u;

function escapeRegExp(s: string): string {
  return s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

/** Book names longest-first, same ordering as the Python service. */
export function sortBookNamesForMatching(names: string[]): string[] {
  const unique = [...new Set(names.filter(Boolean))];
  return unique.sort((a, b) => b.length - a.length);
}

export function buildPassageRegex(bookNamesLongestFirst: string[]): RegExp {
  const alt = bookNamesLongestFirst.map(escapeRegExp).join('|');
  return new RegExp(
    `(?<![\\w])(${alt})(?:\\s+(\\d+)(?::(\\d+)(?:\\s*[–-]\\s*(\\d+))?)?)?(?![\\w])`,
    'giu',
  );
}

function groupsToParsed(m: RegExpExecArray, bookNamesLongestFirst: string[]): ParsedScriptureRef | null {
  const rawBook = m[1];
  const canon = bookNamesLongestFirst.find(n => n.toLowerCase() === rawBook.toLowerCase());
  if (!canon) return null;
  const chapterRaw = m[2];
  if (!chapterRaw) return null;
  const chapter = parseInt(chapterRaw, 10);
  if (!Number.isFinite(chapter) || chapter < 1) return null;
  const vs = m[3] ? parseInt(m[3], 10) : undefined;
  const ve = m[4] ? parseInt(m[4], 10) : undefined;
  if (m[3] && (!Number.isFinite(vs) || (vs as number) < 1)) return null;
  if (m[4] && (!Number.isFinite(ve) || (ve as number) < 1)) return null;
  if (vs !== undefined) {
    return { book: canon, chapter, verse_start: vs, verse_end: ve ?? vs };
  }
  return { book: canon, chapter };
}

/** Parse a single reference string (e.g. chip label). Returns null if not navigable. */
export function parseReferenceLabel(
  reference: string,
  bookNamesLongestFirst: string[],
): ParsedScriptureRef | null {
  const trimmed = reference.trim();
  if (!trimmed || bookNamesLongestFirst.length === 0) return null;
  const re = buildPassageRegex(bookNamesLongestFirst);
  const tryMatch = (s: string): ParsedScriptureRef | null => {
    re.lastIndex = 0;
    const m = re.exec(s);
    if (!m || m.index !== 0 || m[0].length !== s.length) return null;
    return groupsToParsed(m, bookNamesLongestFirst);
  };
  const first = tryMatch(trimmed);
  if (first) return first;
  const stripped = trimmed.replace(TRAILING_PUNCT_RE, '').trim();
  if (!stripped || stripped === trimmed) return null;
  return tryMatch(stripped);
}

/** Split assistant prose into plain text and navigable reference spans. */
export function segmentTextWithScriptureRefs(
  text: string,
  bookNamesLongestFirst: string[],
): ScriptureRefSegment[] {
  if (!text) return [];
  if (bookNamesLongestFirst.length === 0) return [{ kind: 'text', text }];
  const re = buildPassageRegex(bookNamesLongestFirst);
  const segments: ScriptureRefSegment[] = [];
  let lastIndex = 0;
  let m: RegExpExecArray | null;
  while ((m = re.exec(text)) !== null) {
    const refStart = m.index;
    const refEnd = m.index + m[0].length;
    const hasWrappingParens =
      refStart > 0 &&
      refEnd < text.length &&
      text[refStart - 1] === '(' &&
      text[refEnd] === ')';
    const textSliceEnd = hasWrappingParens ? refStart - 1 : refStart;
    if (textSliceEnd > lastIndex) {
      segments.push({ kind: 'text', text: text.slice(lastIndex, textSliceEnd) });
    }
    const parsed = groupsToParsed(m, bookNamesLongestFirst);
    if (parsed) {
      segments.push({
        kind: 'ref',
        text: m[0],
        book: parsed.book,
        chapter: parsed.chapter,
        verse_start: parsed.verse_start,
        verse_end: parsed.verse_end,
      });
    } else {
      segments.push({ kind: 'text', text: m[0] });
    }
    lastIndex = hasWrappingParens ? refEnd + 1 : refEnd;
  }
  if (lastIndex < text.length) {
    segments.push({ kind: 'text', text: text.slice(lastIndex) });
  }
  return segments.length ? segments : [{ kind: 'text', text }];
}
