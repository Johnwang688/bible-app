import type { BookInfo } from '../api/schemas';
import { buildBookIndex, parseReference } from '../search/reference';
import type { ReaderTarget } from '../reader/target';

export interface ChapterSummary {
  title: string;
  paragraphs: string[];
  points: { text: string; target: ReaderTarget | null }[];
}

/** Sections are structural, never prose. Missing/invalid references keep their position. */
export function parseSummary(content: string, books: readonly BookInfo[]): ChapterSummary | null {
  let title = '';
  let section: 'prose' | 'tags' | 'points' | 'verses' = 'prose';
  const prose: string[] = [];
  const points: string[] = [];
  let verses: string[] = [];
  for (const raw of content.split(/\r\n|\r|\n/)) {
    const line = raw.trim();
    if (line.startsWith('TITLE::')) { title = line.slice(7).trim(); continue; }
    if (/^(Themes|Key People|Key Places):/.test(line)) { section = 'tags'; continue; }
    if (/^Key Points:\s*$/.test(line)) { section = 'points'; continue; }
    if (line.startsWith('Supporting Verses:')) {
      section = 'verses';
      verses = line.slice('Supporting Verses:'.length).split('·').map((s) => s.trim());
      continue;
    }
    if (section === 'prose') prose.push(line);
    if (section === 'points' && line) {
      if (/^[•*-]\s+/.test(line)) points.push(line.replace(/^[•*-]\s+/, ''));
      else if (points.length) points[points.length - 1] += ` ${line}`;
    }
  }
  const paragraphs = prose.join('\n').trim().split(/\n\s*\n/).map((p) => p.replace(/\n/g, ' ').trim()).filter(Boolean);
  if (!title && !paragraphs.length && !points.length) return null;
  const index = buildBookIndex(books);
  return {
    title, paragraphs,
    points: points.map((text, i) => {
      const ref = verses[i] ? parseReference(verses[i]!, index) : null;
      const target = ref?.chapter !== undefined && ref.start !== undefined && ref.end !== undefined ? { bookNumber: ref.bookNumber, chapter: ref.chapter, start: ref.start, end: ref.end } : null;
      return { text, target };
    }),
  };
}
