// The part of a verse a search result card shows: the card clamps the text to three lines, so a long verse whose
// first match sits further in is cut to start just before that match (GO-AHEAD 5). Pure, no UI.
import { hasCjk } from './searchTranslation';

/** A regular expression that finds any of `terms` (case-insensitive, literally), longest first; null when none. */
export function termsPattern(terms: readonly string[], flags: string): RegExp | null {
  const words = [...new Set(terms.filter((term) => term !== ''))].sort((a, b) => b.length - a.length);
  if (words.length === 0) return null;
  return new RegExp(words.map((w) => w.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')).join('|'), flags);
}

/**
 * `text`, or when the first match of any of `terms` starts further than `lead` characters in, the text from just
 * before that match with a leading ellipsis. Latin text is cut at a word start (a character after whitespace) at
 * or after `match - lead`, else at the match itself; Chinese text, which has no spaces, at `match - lead / 2`.
 */
export function excerptAround(text: string, terms: string[], lead = 40): string {
  const pattern = termsPattern(terms, 'iu');
  const match = pattern ? pattern.exec(text) : null;
  if (!match || match.index <= lead) return text;
  const at = match.index;
  if (hasCjk(text)) return `…${text.slice(at - Math.floor(lead / 2))}`;
  let start = at;
  for (let i = Math.max(1, at - lead); i < at; i++) {
    if (/\s/.test(text.charAt(i - 1)) && !/\s/.test(text.charAt(i))) {
      start = i;
      break;
    }
  }
  return `…${text.slice(start)}`;
}

/** `text` split into plain and marked pieces: every case-insensitive occurrence of any of `terms` is its own piece. */
export function splitMarked(text: string, terms: readonly string[]): { text: string; hit: boolean }[] {
  const pattern = termsPattern(terms, 'giu');
  if (!pattern) return [{ text, hit: false }];
  const out: { text: string; hit: boolean }[] = [];
  let last = 0;
  for (const m of text.matchAll(pattern)) {
    if (m.index > last) out.push({ text: text.slice(last, m.index), hit: false });
    out.push({ text: m[0], hit: true });
    last = m.index + m[0].length;
  }
  if (last < text.length) out.push({ text: text.slice(last), hit: false });
  return out;
}
