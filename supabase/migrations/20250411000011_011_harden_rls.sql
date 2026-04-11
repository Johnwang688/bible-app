-- ============================================================================
-- LOGOS LIGHT - RLS hardening
-- ============================================================================
-- Supabase can flag any public table that exists without RLS, especially on
-- projects where earlier migrations were only partially applied. This migration
-- re-applies RLS defensively and recreates the intended policies idempotently.

-- ============================================================================
-- 1. ENSURE RLS IS ENABLED ON EVERY APP TABLE
-- ============================================================================
ALTER TABLE IF EXISTS translations ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS books ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS verses ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS commentary_sources ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS commentaries ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS cross_references ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS highlights ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS reading_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS study_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS user_settings ENABLE ROW LEVEL SECURITY;

-- ============================================================================
-- 2. PUBLIC REFERENCE DATA: READ-ONLY
-- ============================================================================
DROP POLICY IF EXISTS "Translations are publicly readable" ON translations;
CREATE POLICY "Translations are publicly readable"
    ON translations FOR SELECT
    USING (true);

DROP POLICY IF EXISTS "Books are publicly readable" ON books;
CREATE POLICY "Books are publicly readable"
    ON books FOR SELECT
    USING (true);

DROP POLICY IF EXISTS "Bible text is publicly readable" ON verses;
CREATE POLICY "Bible text is publicly readable"
    ON verses FOR SELECT
    USING (true);

DROP POLICY IF EXISTS "Commentary sources are publicly readable" ON commentary_sources;
CREATE POLICY "Commentary sources are publicly readable"
    ON commentary_sources FOR SELECT
    USING (true);

DROP POLICY IF EXISTS "Commentaries are publicly readable" ON commentaries;
CREATE POLICY "Commentaries are publicly readable"
    ON commentaries FOR SELECT
    USING (true);

DROP POLICY IF EXISTS "Cross references are publicly readable" ON cross_references;
CREATE POLICY "Cross references are publicly readable"
    ON cross_references FOR SELECT
    USING (true);

-- ============================================================================
-- 3. USER-OWNED DATA: OWNER-ONLY
-- ============================================================================
DROP POLICY IF EXISTS "Users can view own profile" ON profiles;
CREATE POLICY "Users can view own profile"
    ON profiles FOR SELECT
    USING (auth.uid() = id);

DROP POLICY IF EXISTS "Users can insert own profile" ON profiles;
CREATE POLICY "Users can insert own profile"
    ON profiles FOR INSERT
    WITH CHECK (auth.uid() = id);

DROP POLICY IF EXISTS "Users can update own profile" ON profiles;
CREATE POLICY "Users can update own profile"
    ON profiles FOR UPDATE
    USING (auth.uid() = id)
    WITH CHECK (auth.uid() = id);

DROP POLICY IF EXISTS "Users can delete own profile" ON profiles;
CREATE POLICY "Users can delete own profile"
    ON profiles FOR DELETE
    USING (auth.uid() = id);

DROP POLICY IF EXISTS "Users can view own highlights" ON highlights;
CREATE POLICY "Users can view own highlights"
    ON highlights FOR SELECT
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can create own highlights" ON highlights;
CREATE POLICY "Users can create own highlights"
    ON highlights FOR INSERT
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update own highlights" ON highlights;
CREATE POLICY "Users can update own highlights"
    ON highlights FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete own highlights" ON highlights;
CREATE POLICY "Users can delete own highlights"
    ON highlights FOR DELETE
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can view own reading progress" ON reading_progress;
CREATE POLICY "Users can view own reading progress"
    ON reading_progress FOR SELECT
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can upsert own reading progress" ON reading_progress;
CREATE POLICY "Users can upsert own reading progress"
    ON reading_progress FOR INSERT
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update own reading progress" ON reading_progress;
CREATE POLICY "Users can update own reading progress"
    ON reading_progress FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete own reading progress" ON reading_progress;
CREATE POLICY "Users can delete own reading progress"
    ON reading_progress FOR DELETE
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can view own study items" ON study_items;
CREATE POLICY "Users can view own study items"
    ON study_items FOR SELECT
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can create own study items" ON study_items;
CREATE POLICY "Users can create own study items"
    ON study_items FOR INSERT
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update own study items" ON study_items;
CREATE POLICY "Users can update own study items"
    ON study_items FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete own study items" ON study_items;
CREATE POLICY "Users can delete own study items"
    ON study_items FOR DELETE
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can view own user settings" ON user_settings;
CREATE POLICY "Users can view own user settings"
    ON user_settings FOR SELECT
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can create own user settings" ON user_settings;
CREATE POLICY "Users can create own user settings"
    ON user_settings FOR INSERT
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update own user settings" ON user_settings;
CREATE POLICY "Users can update own user settings"
    ON user_settings FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete own user settings" ON user_settings;
CREATE POLICY "Users can delete own user settings"
    ON user_settings FOR DELETE
    USING (auth.uid() = user_id);
