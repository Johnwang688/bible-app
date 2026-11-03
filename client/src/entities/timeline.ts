// An entity's "life and times": the profile's `timeline.events`, read defensively (the API types it as an
// open record), with each development's trailing reference parsed so it can open in the reader.
// Orchestrator-owned (R-5 part 2): the entity page builds on this shape.
import type { BookInfo } from '../api/schemas';
import type { AppLocale } from '../i18n/types';
import { bookNameForLocale } from '../reader/books';
import { parseReference, type BookIndex } from '../search/reference';
import type { PassageRef } from '../search/types';

export interface TimelineDevelopment {
  /** The sentence without its trailing "(Genesis 12:1)". */
  text: string;
  /** The reference as written in the data, e.g. "Genesis 12:1" or "Exodus 20 / Deuteronomy 6". Null if none. */
  refText: string | null;
  /** The first part of `refText` that parses as a passage (with a chapter), or null. */
  ref: PassageRef | null;
}

export interface TimelineEvent {
  /** Where it happens, as written ("Genesis 12", "Exodus 3 / 34"). May be empty. */
  era: string;
  /** The first part of `era` that parses as a passage with a chapter, for a localised label; else null. */
  eraRef: PassageRef | null;
  title: string;
  summary: string;
  significance: string | null;
  developments: TimelineDevelopment[];
}

const str = (v: unknown): string => (typeof v === 'string' ? v.trim() : '');

/** The first `/`- or `;`-separated part of `text` that parses as a passage with a chapter. */
export function firstPassage(text: string, index: BookIndex): PassageRef | null {
  for (const part of text.split(/[/;]/)) {
    const ref = parseReference(part.trim(), index);
    if (ref && ref.chapter !== undefined) return ref;
  }
  return null;
}

/** Splits "He leaves Haran (Genesis 12:4)" into the sentence and the reference. */
export function splitDevelopment(raw: string, index: BookIndex): TimelineDevelopment {
  const text = raw.trim();
  const m = /^(.*?)\s*\(([^()]+)\)\s*[.;,]?$/.exec(text);
  if (!m || !m[1]) return { text, refText: null, ref: null };
  const refText = m[2]!.trim();
  const ref = firstPassage(refText, index);
  // A parenthesis that is not a reference ("(the Lord)") stays part of the sentence.
  if (!ref) return { text, refText: null, ref: null };
  return { text: m[1].trim(), refText, ref };
}

/**
 * The events of `timeline` (the API's `timeline` field), in order. Events without a title are dropped; a
 * missing or malformed timeline gives []. Developments that are not strings are dropped.
 */
export function parseTimeline(timeline: unknown, index: BookIndex): TimelineEvent[] {
  if (!timeline || typeof timeline !== 'object') return [];
  const events = (timeline as { events?: unknown }).events;
  if (!Array.isArray(events)) return [];
  const out: TimelineEvent[] = [];
  for (const e of events) {
    if (!e || typeof e !== 'object') continue;
    const o = e as Record<string, unknown>;
    const title = str(o.title);
    if (!title) continue;
    const era = str(o.era);
    const developments = Array.isArray(o.developments)
      ? o.developments.filter((d): d is string => typeof d === 'string' && d.trim() !== '').map((d) => splitDevelopment(d, index))
      : [];
    out.push({
      era,
      eraRef: era ? firstPassage(era, index) : null,
      title,
      summary: str(o.summary),
      significance: str(o.significance) || null,
      developments,
    });
  }
  return out;
}

/**
 * `text` (an era such as "Exodus 20 / Leviticus 19", as the data writes it) with every full English book name
 * replaced by its name in the interface language, longest names first so "1 John" wins over "John". English
 * text comes back unchanged.
 */
export function localiseEra(text: string, books: readonly BookInfo[], locale: AppLocale): string {
  if (locale === 'en' || !text) return text;
  const sorted = [...books].sort((a, b) => b.name.length - a.name.length);
  const escape = (s: string) => s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const byName = new Map(sorted.map((b) => [b.name.toLowerCase(), b]));
  const re = new RegExp(`(?<![\\p{L}\\d])(${sorted.map((b) => escape(b.name)).join('|')})(?![\\p{L}])`, 'giu');
  return text.replace(re, (name) => {
    const book = byName.get(name.toLowerCase());
    return book ? bookNameForLocale(book, locale) : name;
  });
}
