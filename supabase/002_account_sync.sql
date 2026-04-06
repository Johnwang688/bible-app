-- ============================================================================
-- LOGOS LIGHT — Account Sync Extensions
-- ============================================================================

-- Track a single timestamp update policy for user-owned tables.
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- ============================================================================
-- 1. STUDY ITEMS — highlights, bookmarks, and notes in one synced table
-- ============================================================================
CREATE TABLE IF NOT EXISTS study_items (
    id              BIGSERIAL PRIMARY KEY,
    user_id         UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    translation     TEXT NOT NULL REFERENCES translations(id),
    book_number     INT NOT NULL REFERENCES books(book_number),
    chapter         INT NOT NULL,
    verse_start     INT NOT NULL,
    verse_end       INT,
    kind            TEXT NOT NULL CHECK (kind IN ('highlight', 'bookmark', 'note')),
    color           TEXT,
    note            TEXT,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_study_items_user
    ON study_items (user_id, book_number, chapter, verse_start);

CREATE UNIQUE INDEX IF NOT EXISTS idx_study_items_unique
    ON study_items (user_id, translation, book_number, chapter, verse_start, COALESCE(verse_end, verse_start), kind);

DROP TRIGGER IF EXISTS set_study_items_updated_at ON study_items;
CREATE TRIGGER set_study_items_updated_at
    BEFORE UPDATE ON study_items
    FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


-- ============================================================================
-- 2. USER SETTINGS — synced reader preferences and recent passages
-- ============================================================================
CREATE TABLE IF NOT EXISTS user_settings (
    user_id             UUID PRIMARY KEY REFERENCES profiles(id) ON DELETE CASCADE,
    theme               TEXT NOT NULL DEFAULT 'default',
    font_scale          TEXT NOT NULL DEFAULT 'comfortable' CHECK (font_scale IN ('comfortable', 'large', 'xlarge')),
    line_height         TEXT NOT NULL DEFAULT 'relaxed' CHECK (line_height IN ('relaxed', 'airy')),
    reduced_motion      BOOLEAN NOT NULL DEFAULT false,
    high_contrast       BOOLEAN NOT NULL DEFAULT false,
    default_panel       TEXT NOT NULL DEFAULT 'none' CHECK (default_panel IN ('none', 'commentary', 'ai', 'study')),
    recent_passages     JSONB NOT NULL DEFAULT '[]'::jsonb,
    updated_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

DROP TRIGGER IF EXISTS set_user_settings_updated_at ON user_settings;
CREATE TRIGGER set_user_settings_updated_at
    BEFORE UPDATE ON user_settings
    FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


-- ============================================================================
-- 3. PROFILE TIMESTAMP MAINTENANCE
-- ============================================================================
DROP TRIGGER IF EXISTS set_profiles_updated_at ON profiles;
CREATE TRIGGER set_profiles_updated_at
    BEFORE UPDATE ON profiles
    FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


-- ============================================================================
-- 4. RLS
-- ============================================================================
ALTER TABLE study_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_settings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own study items"
    ON study_items FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can create own study items"
    ON study_items FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own study items"
    ON study_items FOR UPDATE
    USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own study items"
    ON study_items FOR DELETE
    USING (auth.uid() = user_id);

CREATE POLICY "Users can view own user settings"
    ON user_settings FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can create own user settings"
    ON user_settings FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own user settings"
    ON user_settings FOR UPDATE
    USING (auth.uid() = user_id);
