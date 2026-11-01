// Zod schemas for the FastAPI backend's responses (app/schemas/*.py, app/main.py).
// Where the Python schema and the golden fixtures disagree, the fixtures win.
// Python `X | None = None` becomes `.nullable().optional()`. Unknown keys are stripped.
import { z } from 'zod';

const nullish = <T extends z.ZodType>(schema: T) => schema.nullable().optional();

/** `/api/v1/translations` returns raw DB rows, not `TranslationInfo`. */
export const TranslationSchema = z.object({
  id: z.string(),
  name: z.string(),
  language: z.string(),
  license: z.string(),
});
export const TranslationsSchema = z.array(TranslationSchema);
export type Translation = z.infer<typeof TranslationSchema>;

export const BookInfoSchema = z.object({
  book_number: z.number(),
  name: z.string(),
  name_zh: nullish(z.string()),
  name_zh_simplified: nullish(z.string()),
  testament: z.string(),
  total_chapters: z.number(),
});
export const BooksSchema = z.array(BookInfoSchema);
export type BookInfo = z.infer<typeof BookInfoSchema>;

export const VerseOutSchema = z.object({
  id: z.number(),
  book: nullish(z.string()),
  book_number: z.number(),
  chapter: z.number(),
  verse: z.number(),
  text: z.string(),
  translation: z.string(),
});
export const VersesSchema = z.array(VerseOutSchema);
export type VerseOut = z.infer<typeof VerseOutSchema>;

export const ChapterOutSchema = z.object({
  book: z.string(),
  book_number: z.number(),
  chapter: z.number(),
  translation: z.string(),
  verses: z.array(VerseOutSchema),
  total_verses: z.number(),
});
export type ChapterOut = z.infer<typeof ChapterOutSchema>;

export const VerseWordSchema = z.object({
  english_order: z.number(),
  english: nullish(z.string()),
  english_kind: nullish(z.string()),
  original: nullish(z.string()),
  translit: nullish(z.string()),
  language: nullish(z.string()),
  strongs: nullish(z.string()),
  lemma: nullish(z.string()),
  gloss: nullish(z.string()),
  grammar: nullish(z.string()),
  parsing: nullish(z.string()),
  parsing_code: nullish(z.string()),
  footnote: nullish(z.string()),
});
export type VerseWord = z.infer<typeof VerseWordSchema>;

export const VerseWordsOutSchema = z.object({
  book: z.string(),
  book_number: z.number(),
  chapter: z.number(),
  verse: z.number(),
  translation: z.string(),
  words: z.array(VerseWordSchema),
});
export type VerseWordsOut = z.infer<typeof VerseWordsOutSchema>;

export const LexiconReferenceSchema = z.object({
  book: z.string(),
  book_number: z.number(),
  chapter: z.number(),
  verse: z.number(),
});
export type LexiconReference = z.infer<typeof LexiconReferenceSchema>;

export const LexiconEntryOutSchema = z.object({
  strongs: z.string(),
  language: nullish(z.string()),
  lemma: nullish(z.string()),
  translit: nullish(z.string()),
  gloss: nullish(z.string()),
  definition: nullish(z.string()),
  occurrences: z.number(),
  verse_count: z.number(),
  references: z.array(LexiconReferenceSchema),
  source: z.string(),
});
export type LexiconEntryOut = z.infer<typeof LexiconEntryOutSchema>;

export const SearchResultSchema = z.object({
  verse: VerseOutSchema,
  relevance: nullish(z.number()),
});
export const SearchResultsSchema = z.array(SearchResultSchema);
export type SearchResult = z.infer<typeof SearchResultSchema>;

export const SummaryEntityTagSchema = z.object({
  slug: z.string(),
  label: z.string(),
});
export type SummaryEntityTag = z.infer<typeof SummaryEntityTagSchema>;

export const CommentaryEntrySchema = z.object({
  id: z.number(),
  book_number: z.number(),
  chapter: z.number(),
  verse_start: z.number(),
  verse_end: nullish(z.number()),
  source: z.string(),
  content: z.string(),
  theme_tags: nullish(z.array(SummaryEntityTagSchema)),
  people_tags: nullish(z.array(SummaryEntityTagSchema)),
  place_tags: nullish(z.array(SummaryEntityTagSchema)),
});
export const CommentaryEntriesSchema = z.array(CommentaryEntrySchema);
export type CommentaryEntry = z.infer<typeof CommentaryEntrySchema>;

/** `/api/v1/commentary/sources` returns raw rows (`list[dict]`). */
export const CommentarySourceSchema = z.object({
  id: z.string(),
  name: z.string(),
  description: nullish(z.string()),
  license: nullish(z.string()),
});
export const CommentarySourcesSchema = z.array(CommentarySourceSchema);
export type CommentarySource = z.infer<typeof CommentarySourceSchema>;

export const SummaryEntityListItemOutSchema = z.object({
  slug: z.string(),
  label: z.string(),
});
export const SummaryEntityListSchema = z.array(SummaryEntityListItemOutSchema);
export type SummaryEntityListItemOut = z.infer<typeof SummaryEntityListItemOutSchema>;

export const SummaryEntityReferenceOutSchema = z.object({
  commentary_id: z.number(),
  book_number: z.number(),
  book_name: z.string(),
  chapter: z.number(),
});
export type SummaryEntityReferenceOut = z.infer<typeof SummaryEntityReferenceOutSchema>;

export const SummaryEntityPageOutSchema = z.object({
  kind: z.string(),
  slug: z.string(),
  label: z.string(),
  references: z.array(SummaryEntityReferenceOutSchema),
  overview: nullish(z.string()),
  timeline: nullish(z.record(z.string(), z.unknown())),
});
export type SummaryEntityPageOut = z.infer<typeof SummaryEntityPageOutSchema>;

/** `/health` returns an ad-hoc dict; only `status` is relied on. */
export const HealthSchema = z.object({
  status: z.string(),
  app: nullish(z.string()),
  environment: nullish(z.string()),
  openai_configured: nullish(z.boolean()),
  supabase_configured: nullish(z.boolean()),
});
export type Health = z.infer<typeof HealthSchema>;

export type EntityKind = 'theme' | 'person' | 'place';
