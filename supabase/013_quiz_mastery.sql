-- ============================================================================
-- LOGOS LIGHT — Quiz & Chapter Mastery System
-- ============================================================================
-- Adds 4 tables:
--   quiz_question_bank    — questions per chapter per difficulty stage
--   user_chapter_progress — one row per (user, book, chapter); tracks mastery
--   quiz_attempts         — append-only log of every quiz submission
--   user_wallet           — simple coin balance per user
-- All user tables are protected by Row Level Security.
-- Migration is idempotent: uses IF NOT EXISTS / DROP IF EXISTS patterns.
-- ============================================================================

-- ============================================================================
-- 1. QUIZ QUESTION BANK
-- ============================================================================
CREATE TABLE IF NOT EXISTS quiz_question_bank (
    id                  BIGSERIAL PRIMARY KEY,
    book_number         INT  NOT NULL REFERENCES books(book_number),
    chapter             INT  NOT NULL,
    difficulty_stage    INT  NOT NULL CHECK (difficulty_stage BETWEEN 1 AND 5),
    question_type       TEXT NOT NULL DEFAULT 'multiple_choice',
    prompt              TEXT NOT NULL,
    choices_json        JSONB NOT NULL,         -- array of option strings, e.g. ["A","B","C","D"]
    correct_answer      TEXT NOT NULL,          -- must match one of the choices exactly
    explanation         TEXT,
    source_verse_start  INT,
    source_verse_end    INT,
    created_at          TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_qb_chapter
    ON quiz_question_bank (book_number, chapter, difficulty_stage);

-- ============================================================================
-- 2. USER CHAPTER PROGRESS
-- ============================================================================
CREATE TABLE IF NOT EXISTS user_chapter_progress (
    user_id         UUID    NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    book_number     INT     NOT NULL REFERENCES books(book_number),
    chapter         INT     NOT NULL,
    mastery_stage   INT     NOT NULL DEFAULT 0 CHECK (mastery_stage BETWEEN 0 AND 5),
    mastery_percent INT     NOT NULL DEFAULT 0,
    total_attempts  INT     NOT NULL DEFAULT 0,
    total_passes    INT     NOT NULL DEFAULT 0,
    highest_score   INT     NOT NULL DEFAULT 0,
    is_completed    BOOLEAN NOT NULL DEFAULT false,
    is_mastered     BOOLEAN NOT NULL DEFAULT false,
    last_attempt_at TIMESTAMPTZ,
    PRIMARY KEY (user_id, book_number, chapter)
);

-- ============================================================================
-- 3. QUIZ ATTEMPTS
-- ============================================================================
CREATE TABLE IF NOT EXISTS quiz_attempts (
    id                  BIGSERIAL PRIMARY KEY,
    user_id             UUID    NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    book_number         INT     NOT NULL,
    chapter             INT     NOT NULL,
    stage_attempted     INT     NOT NULL,
    score               INT     NOT NULL,
    total_questions     INT     NOT NULL,
    passed              BOOLEAN NOT NULL,
    mastery_before      INT     NOT NULL,
    mastery_after       INT     NOT NULL,
    currency_awarded    INT     NOT NULL DEFAULT 0,
    perfect_score_bonus INT     NOT NULL DEFAULT 0,
    created_at          TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_qa_user_chapter
    ON quiz_attempts (user_id, book_number, chapter);

-- ============================================================================
-- 4. USER WALLET
-- ============================================================================
CREATE TABLE IF NOT EXISTS user_wallet (
    user_id     UUID PRIMARY KEY REFERENCES profiles(id) ON DELETE CASCADE,
    balance     INT         NOT NULL DEFAULT 0,
    updated_at  TIMESTAMPTZ DEFAULT now()
);

-- ============================================================================
-- 5. ROW LEVEL SECURITY
-- ============================================================================

-- quiz_question_bank: public read-only (no user data)
ALTER TABLE IF EXISTS quiz_question_bank ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Quiz questions are publicly readable" ON quiz_question_bank;
CREATE POLICY "Quiz questions are publicly readable"
    ON quiz_question_bank FOR SELECT
    USING (true);

-- user_chapter_progress: owner-only
ALTER TABLE IF EXISTS user_chapter_progress ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own chapter progress" ON user_chapter_progress;
CREATE POLICY "Users can view own chapter progress"
    ON user_chapter_progress FOR SELECT
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can insert own chapter progress" ON user_chapter_progress;
CREATE POLICY "Users can insert own chapter progress"
    ON user_chapter_progress FOR INSERT
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update own chapter progress" ON user_chapter_progress;
CREATE POLICY "Users can update own chapter progress"
    ON user_chapter_progress FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- quiz_attempts: owner-only
ALTER TABLE IF EXISTS quiz_attempts ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own quiz attempts" ON quiz_attempts;
CREATE POLICY "Users can view own quiz attempts"
    ON quiz_attempts FOR SELECT
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can insert own quiz attempts" ON quiz_attempts;
CREATE POLICY "Users can insert own quiz attempts"
    ON quiz_attempts FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- user_wallet: owner-only
ALTER TABLE IF EXISTS user_wallet ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own wallet" ON user_wallet;
CREATE POLICY "Users can view own wallet"
    ON user_wallet FOR SELECT
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can insert own wallet" ON user_wallet;
CREATE POLICY "Users can insert own wallet"
    ON user_wallet FOR INSERT
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update own wallet" ON user_wallet;
CREATE POLICY "Users can update own wallet"
    ON user_wallet FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);
