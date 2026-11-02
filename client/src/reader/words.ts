// Original-language words for a verse, and lexicon entries by Strong's number. Both are keyed by their
// target, so a late response for another verse can never show; cancellation goes through `signal`.
import { useQuery } from '@tanstack/react-query';

import { queryKeys, useApi } from '../api';
import type { BookInfo, VerseWord } from '../api/schemas';

export function useVerseWords(book: BookInfo | undefined, chapter: number, verse: number | null) {
  const api = useApi();
  return useQuery({
    queryKey: queryKeys.words(book?.name ?? '', chapter, verse ?? 0),
    queryFn: ({ signal }) => api.words(book!.name, chapter, verse!, { signal }),
    enabled: !!book && verse !== null,
    staleTime: Infinity,
  });
}

export function useLexicon(strongs: string | null) {
  const api = useApi();
  return useQuery({
    queryKey: queryKeys.lexicon(strongs ?? ''),
    queryFn: ({ signal }) => api.lexicon(strongs!, { signal }),
    enabled: !!strongs,
    staleTime: Infinity,
  });
}

export interface WordRow {
  key: string;
  english: string | null;
  kind: 'text' | 'untranslated' | 'elsewhere';
  words: VerseWord[];
}

/** One row per aligned English phrase, in English order. A `continues` word joins the row before it. */
export function groupWordRows(words: VerseWord[]): WordRow[] {
  const rows: WordRow[] = [];
  const used = new Set<string>();
  for (const word of [...words].sort((a, b) => a.english_order - b.english_order)) {
    const last = rows[rows.length - 1];
    if (word.english_kind === 'continues' && last) {
      last.words.push(word);
      continue;
    }
    let key = String(word.english_order);
    for (let n = 2; used.has(key); n++) key = `${word.english_order}-${n}`;
    used.add(key);
    const kind = word.english_kind === 'untranslated' || word.english_kind === 'elsewhere' ? word.english_kind : 'text';
    rows.push({ key, english: word.english ?? null, kind, words: [word] });
  }
  return rows;
}

export function languageOf(words: VerseWord[]): 'greek' | 'hebrew' | 'aramaic' | null {
  const language = words[0]?.language?.toLowerCase();
  return language === 'greek' || language === 'hebrew' || language === 'aramaic' ? language : null;
}
