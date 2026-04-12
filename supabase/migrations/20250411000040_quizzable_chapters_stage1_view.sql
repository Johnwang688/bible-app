-- ============================================================================
-- View: one row per (book_number, chapter) that has enough stage-1 questions
-- to unlock a quiz (same rule as quiz_service._quizzable_chapters_stage1).
-- Lets the API list quizzable chapters without scanning every question row
-- (PostgREST caps responses at ~1000 rows per request).
-- ============================================================================

CREATE OR REPLACE VIEW public.quizzable_chapters_stage1 AS
SELECT
  qb.book_number,
  qb.chapter
FROM public.quiz_question_bank qb
WHERE qb.difficulty_stage = 1
GROUP BY qb.book_number, qb.chapter
HAVING COUNT(*) >= 5;

COMMENT ON VIEW public.quizzable_chapters_stage1 IS
  'Chapters with at least 5 difficulty_stage=1 questions (chapter quiz unlock).';

GRANT SELECT ON public.quizzable_chapters_stage1 TO anon, authenticated, service_role;
