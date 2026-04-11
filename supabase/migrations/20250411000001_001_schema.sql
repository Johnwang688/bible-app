-- ============================================================================
-- LOGOS LIGHT — Database Schema
-- ============================================================================
-- Design principles:
--   1. Translations are stored in a SINGLE `verses` table but indexed by
--      (translation, book_number, chapter, verse) so queries always filter
--      by translation FIRST — Postgres skips irrelevant rows instantly.
--   2. Full-text search uses a pre-computed tsvector column with a GIN index,
--      scoped per-translation, so searches never scan across all translations.
--   3. Commentaries are a separate table keyed by book/chapter/verse range.
--   4. All user data (highlights, bookmarks, reading progress) is protected
--      by Row Level Security (RLS) — users can only see their own data.
-- ============================================================================

-- ============================================================================
-- 1. TRANSLATIONS — metadata about each Bible version
-- ============================================================================
-- Safe to run multiple times: tables/indexes/policies use IF NOT EXISTS /
-- DROP IF EXISTS patterns; seeds use ON CONFLICT DO NOTHING.
CREATE TABLE IF NOT EXISTS translations (
    id          TEXT PRIMARY KEY,            -- e.g. 'WEB', 'CUV', 'ASV'
    name        TEXT NOT NULL,               -- 'King James Version'
    language    TEXT NOT NULL DEFAULT 'en',   -- ISO 639-1 code
    license     TEXT NOT NULL DEFAULT 'Public Domain',
    description TEXT,
    created_at  TIMESTAMPTZ DEFAULT now()
);

-- Seed the MVP translations
INSERT INTO translations (id, name, language, license, description) VALUES
    ('WEB', 'World English Bible', 'en', 'Public Domain',
     'A modern public domain translation based on the ASV.'),
    ('CUV', 'Chinese Union Version (1919)', 'zh', 'Public Domain',
     '和合本 — The most widely used Chinese Bible translation.')
ON CONFLICT (id) DO NOTHING;


-- ============================================================================
-- 2. BOOKS — canonical book list (shared across all translations)
-- ============================================================================
CREATE TABLE IF NOT EXISTS books (
    book_number     INT PRIMARY KEY,
    name_en         TEXT NOT NULL,           -- English canonical name
    name_zh         TEXT,                    -- Chinese name (for CUV users)
    abbreviation    TEXT NOT NULL,           -- 'Gen', 'Exo', 'Mat', etc.
    testament       TEXT NOT NULL CHECK (testament IN ('OT', 'NT')),
    total_chapters  INT NOT NULL
);

-- Seed all 66 books (abbreviated list shown — full insert below)
INSERT INTO books (book_number, name_en, name_zh, abbreviation, testament, total_chapters) VALUES
    (1,  'Genesis',         '创世记',    'Gen',  'OT', 50),
    (2,  'Exodus',          '出埃及记',  'Exo',  'OT', 40),
    (3,  'Leviticus',       '利未记',    'Lev',  'OT', 27),
    (4,  'Numbers',         '民数记',    'Num',  'OT', 36),
    (5,  'Deuteronomy',     '申命记',    'Deu',  'OT', 34),
    (6,  'Joshua',          '约书亚记',  'Jos',  'OT', 24),
    (7,  'Judges',          '士师记',    'Jdg',  'OT', 21),
    (8,  'Ruth',            '路得记',    'Rut',  'OT', 4),
    (9,  '1 Samuel',        '撒母耳记上','1Sa',  'OT', 31),
    (10, '2 Samuel',        '撒母耳记下','2Sa',  'OT', 24),
    (11, '1 Kings',         '列王纪上',  '1Ki',  'OT', 22),
    (12, '2 Kings',         '列王纪下',  '2Ki',  'OT', 25),
    (13, '1 Chronicles',    '历代志上',  '1Ch',  'OT', 29),
    (14, '2 Chronicles',    '历代志下',  '2Ch',  'OT', 36),
    (15, 'Ezra',            '以斯拉记',  'Ezr',  'OT', 10),
    (16, 'Nehemiah',        '尼希米记',  'Neh',  'OT', 13),
    (17, 'Esther',          '以斯帖记',  'Est',  'OT', 10),
    (18, 'Job',             '约伯记',    'Job',  'OT', 42),
    (19, 'Psalms',          '诗篇',      'Psa',  'OT', 150),
    (20, 'Proverbs',        '箴言',      'Pro',  'OT', 31),
    (21, 'Ecclesiastes',    '传道书',    'Ecc',  'OT', 12),
    (22, 'Song of Solomon', '雅歌',      'Sng',  'OT', 8),
    (23, 'Isaiah',          '以赛亚书',  'Isa',  'OT', 66),
    (24, 'Jeremiah',        '耶利米书',  'Jer',  'OT', 52),
    (25, 'Lamentations',    '耶利米哀歌','Lam',  'OT', 5),
    (26, 'Ezekiel',         '以西结书',  'Ezk',  'OT', 48),
    (27, 'Daniel',          '但以理书',  'Dan',  'OT', 12),
    (28, 'Hosea',           '何西阿书',  'Hos',  'OT', 14),
    (29, 'Joel',            '约珥书',    'Jol',  'OT', 3),
    (30, 'Amos',            '阿摩司书',  'Amo',  'OT', 9),
    (31, 'Obadiah',         '俄巴底亚书','Oba',  'OT', 1),
    (32, 'Jonah',           '约拿书',    'Jon',  'OT', 4),
    (33, 'Micah',           '弥迦书',    'Mic',  'OT', 7),
    (34, 'Nahum',           '那鸿书',    'Nam',  'OT', 3),
    (35, 'Habakkuk',        '哈巴谷书',  'Hab',  'OT', 3),
    (36, 'Zephaniah',       '西番雅书',  'Zep',  'OT', 3),
    (37, 'Haggai',          '哈该书',    'Hag',  'OT', 2),
    (38, 'Zechariah',       '撒迦利亚书','Zec',  'OT', 14),
    (39, 'Malachi',         '玛拉基书',  'Mal',  'OT', 4),
    (40, 'Matthew',         '马太福音',  'Mat',  'NT', 28),
    (41, 'Mark',            '马可福音',  'Mrk',  'NT', 16),
    (42, 'Luke',            '路加福音',  'Luk',  'NT', 24),
    (43, 'John',            '约翰福音',  'Jhn',  'NT', 21),
    (44, 'Acts',            '使徒行传',  'Act',  'NT', 28),
    (45, 'Romans',          '罗马书',    'Rom',  'NT', 16),
    (46, '1 Corinthians',   '哥林多前书','1Co',  'NT', 16),
    (47, '2 Corinthians',   '哥林多后书','2Co',  'NT', 13),
    (48, 'Galatians',       '加拉太书',  'Gal',  'NT', 6),
    (49, 'Ephesians',       '以弗所书',  'Eph',  'NT', 6),
    (50, 'Philippians',     '腓立比书',  'Php',  'NT', 4),
    (51, 'Colossians',      '歌罗西书',  'Col',  'NT', 4),
    (52, '1 Thessalonians', '帖撒罗尼迦前书','1Th','NT', 5),
    (53, '2 Thessalonians', '帖撒罗尼迦后书','2Th','NT', 3),
    (54, '1 Timothy',       '提摩太前书','1Ti',  'NT', 6),
    (55, '2 Timothy',       '提摩太后书','2Ti',  'NT', 4),
    (56, 'Titus',           '提多书',    'Tit',  'NT', 3),
    (57, 'Philemon',        '腓利门书',  'Phm',  'NT', 1),
    (58, 'Hebrews',         '希伯来书',  'Heb',  'NT', 13),
    (59, 'James',           '雅各书',    'Jas',  'NT', 5),
    (60, '1 Peter',         '彼得前书',  '1Pe',  'NT', 5),
    (61, '2 Peter',         '彼得后书',  '2Pe',  'NT', 3),
    (62, '1 John',          '约翰一书',  '1Jn',  'NT', 5),
    (63, '2 John',          '约翰二书',  '2Jn',  'NT', 1),
    (64, '3 John',          '约翰三书',  '3Jn',  'NT', 1),
    (65, 'Jude',            '犹大书',    'Jud',  'NT', 1),
    (66, 'Revelation',      '启示录',    'Rev',  'NT', 22)
ON CONFLICT (book_number) DO NOTHING;


-- ============================================================================
-- 3. VERSES — the core Bible text table
-- ============================================================================
-- Key design: the composite index on (translation, book_number, chapter, verse)
-- means every query FIRST filters by translation, then by location.
-- Postgres will never scan KJV rows when you're querying WEB.
-- ============================================================================
CREATE TABLE IF NOT EXISTS verses (
    id              BIGSERIAL PRIMARY KEY,
    translation     TEXT NOT NULL REFERENCES translations(id),
    book_number     INT NOT NULL REFERENCES books(book_number),
    chapter         INT NOT NULL,
    verse           INT NOT NULL,
    text            TEXT NOT NULL,

    -- Pre-computed full-text search vector for fast searching
    text_search     TSVECTOR GENERATED ALWAYS AS (
        to_tsvector('english', text)
    ) STORED,

    UNIQUE (translation, book_number, chapter, verse)
);

-- PRIMARY lookup index: every Bible read query uses this
-- "Show me John 3:16 in WEB" → hits this index directly
CREATE INDEX IF NOT EXISTS idx_verses_lookup
    ON verses (translation, book_number, chapter, verse);

-- CHAPTER loading: "Show me all of Genesis 1 in KJV"
-- The lookup index above covers this too (leftmost columns match)

-- FULL-TEXT SEARCH index: scoped by translation
-- "Search for 'love' in WEB" → uses GIN index, filtered to WEB only
CREATE INDEX IF NOT EXISTS idx_verses_fts
    ON verses USING GIN (text_search);

-- Composite index for translation-scoped text search
-- This lets Postgres combine the translation filter with FTS efficiently
CREATE INDEX IF NOT EXISTS idx_verses_translation_fts
    ON verses (translation) INCLUDE (text_search);


-- ============================================================================
-- 4. COMMENTARY SOURCES — metadata about each commentary
-- ============================================================================
CREATE TABLE IF NOT EXISTS commentary_sources (
    id          TEXT PRIMARY KEY,            -- e.g. 'matthew_henry'
    name        TEXT NOT NULL,
    license     TEXT NOT NULL,
    description TEXT,
    created_at  TIMESTAMPTZ DEFAULT now()
);

INSERT INTO commentary_sources (id, name, license, description) VALUES
    ('matthew_henry', 'Matthew Henry''s Concise Commentary', 'Public Domain',
     'A classic concise commentary covering the entire Bible, written 1706-1721.'),
    ('treasury_scripture', 'Treasury of Scripture Knowledge', 'Public Domain',
     'Over 500,000 cross-references linking related Bible passages.')
ON CONFLICT (id) DO NOTHING;


-- ============================================================================
-- 5. COMMENTARIES — commentary text keyed by passage
-- ============================================================================
CREATE TABLE IF NOT EXISTS commentaries (
    id              BIGSERIAL PRIMARY KEY,
    source          TEXT NOT NULL REFERENCES commentary_sources(id),
    book_number     INT NOT NULL REFERENCES books(book_number),
    chapter         INT NOT NULL,
    verse_start     INT NOT NULL,
    verse_end       INT,                    -- NULL = single verse commentary
    content         TEXT NOT NULL,

    -- FTS for commentary text too
    content_search  TSVECTOR GENERATED ALWAYS AS (
        to_tsvector('english', content)
    ) STORED
);

-- Fast commentary lookup: "Show me Matthew Henry on Romans 8:28"
CREATE INDEX IF NOT EXISTS idx_commentaries_lookup
    ON commentaries (source, book_number, chapter, verse_start);

-- FTS on commentary content
CREATE INDEX IF NOT EXISTS idx_commentaries_fts
    ON commentaries USING GIN (content_search);


-- ============================================================================
-- 6. CROSS REFERENCES — links between related passages
-- ============================================================================
CREATE TABLE IF NOT EXISTS cross_references (
    id                  BIGSERIAL PRIMARY KEY,
    from_book_number    INT NOT NULL REFERENCES books(book_number),
    from_chapter        INT NOT NULL,
    from_verse          INT NOT NULL,
    to_book_number      INT NOT NULL REFERENCES books(book_number),
    to_chapter          INT NOT NULL,
    to_verse_start      INT NOT NULL,
    to_verse_end        INT,
    votes               INT DEFAULT 0,       -- for ranking relevance
    source              TEXT DEFAULT 'treasury_scripture'
);

CREATE INDEX IF NOT EXISTS idx_xref_from
    ON cross_references (from_book_number, from_chapter, from_verse);

CREATE INDEX IF NOT EXISTS idx_xref_to
    ON cross_references (to_book_number, to_chapter, to_verse_start);


-- ============================================================================
-- 7. USER PROFILES — extends Supabase auth.users
-- ============================================================================
CREATE TABLE IF NOT EXISTS profiles (
    id                      UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email                   TEXT,
    display_name            TEXT,
    avatar_url              TEXT,
    preferred_translation   TEXT DEFAULT 'WEB' REFERENCES translations(id),
    preferred_language      TEXT DEFAULT 'en',
    created_at              TIMESTAMPTZ DEFAULT now(),
    updated_at              TIMESTAMPTZ DEFAULT now()
);

-- Auto-create profile on signup via trigger
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.profiles (id, email, display_name)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'full_name', split_part(NEW.email, '@', 1))
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


-- ============================================================================
-- 8. HIGHLIGHTS — user highlights and bookmarks
-- ============================================================================
CREATE TABLE IF NOT EXISTS highlights (
    id              BIGSERIAL PRIMARY KEY,
    user_id         UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    translation     TEXT NOT NULL REFERENCES translations(id),
    book_number     INT NOT NULL REFERENCES books(book_number),
    chapter         INT NOT NULL,
    verse_start     INT NOT NULL,
    verse_end       INT,                    -- NULL = single verse
    color           TEXT DEFAULT '#FFEB3B', -- highlight color hex
    note            TEXT,                   -- user's personal note
    created_at      TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_highlights_user
    ON highlights (user_id, book_number, chapter);


-- ============================================================================
-- 9. READING PROGRESS — track where each user is
-- ============================================================================
CREATE TABLE IF NOT EXISTS reading_progress (
    id              BIGSERIAL PRIMARY KEY,
    user_id         UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    translation     TEXT NOT NULL REFERENCES translations(id),
    book_number     INT NOT NULL REFERENCES books(book_number),
    chapter         INT NOT NULL,
    last_verse      INT DEFAULT 1,
    updated_at      TIMESTAMPTZ DEFAULT now(),

    UNIQUE (user_id, translation, book_number)
);

CREATE INDEX IF NOT EXISTS idx_reading_progress_user
    ON reading_progress (user_id);


-- ============================================================================
-- 10. ROW LEVEL SECURITY (RLS)
-- ============================================================================
-- Bible text & commentaries: readable by everyone (no auth needed)
-- User data: only the owner can read/write

ALTER TABLE verses ENABLE ROW LEVEL SECURITY;
ALTER TABLE commentaries ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE highlights ENABLE ROW LEVEL SECURITY;
ALTER TABLE reading_progress ENABLE ROW LEVEL SECURITY;

-- Public read access to Bible text
DROP POLICY IF EXISTS "Bible text is publicly readable" ON verses;
CREATE POLICY "Bible text is publicly readable"
    ON verses FOR SELECT
    USING (true);

-- Public read access to commentaries
DROP POLICY IF EXISTS "Commentaries are publicly readable" ON commentaries;
CREATE POLICY "Commentaries are publicly readable"
    ON commentaries FOR SELECT
    USING (true);

-- Profiles: users can read/update only their own
DROP POLICY IF EXISTS "Users can view own profile" ON profiles;
CREATE POLICY "Users can view own profile"
    ON profiles FOR SELECT
    USING (auth.uid() = id);

DROP POLICY IF EXISTS "Users can update own profile" ON profiles;
CREATE POLICY "Users can update own profile"
    ON profiles FOR UPDATE
    USING (auth.uid() = id);

-- Highlights: users can CRUD only their own
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
    USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete own highlights" ON highlights;
CREATE POLICY "Users can delete own highlights"
    ON highlights FOR DELETE
    USING (auth.uid() = user_id);

-- Reading progress: users can CRUD only their own
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
    USING (auth.uid() = user_id);


-- ============================================================================
-- 11. HELPER FUNCTIONS — used by the API and agents
-- ============================================================================

-- Fast verse lookup function (used by AI agents)
CREATE OR REPLACE FUNCTION get_passage(
    p_translation TEXT,
    p_book_number INT,
    p_chapter INT,
    p_verse_start INT DEFAULT 1,
    p_verse_end INT DEFAULT 999
)
RETURNS TABLE (
    verse_number INT,
    verse_text TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT v.verse, v.text
    FROM verses v
    WHERE v.translation = p_translation
      AND v.book_number = p_book_number
      AND v.chapter = p_chapter
      AND v.verse >= p_verse_start
      AND v.verse <= p_verse_end
    ORDER BY v.verse;
END;
$$ LANGUAGE plpgsql STABLE;

-- Translation-scoped full-text search
CREATE OR REPLACE FUNCTION search_bible(
    p_query TEXT,
    p_translation TEXT DEFAULT 'WEB',
    p_book_number INT DEFAULT NULL,
    p_limit INT DEFAULT 20
)
RETURNS TABLE (
    book_num INT,
    chapter_num INT,
    verse_num INT,
    verse_text TEXT,
    rank REAL
) AS $$
DECLARE
    tsquery_val TSQUERY;
BEGIN
    tsquery_val := websearch_to_tsquery('english', p_query);

    RETURN QUERY
    SELECT
        v.book_number,
        v.chapter,
        v.verse,
        v.text,
        ts_rank(v.text_search, tsquery_val) AS rank
    FROM verses v
    WHERE v.translation = p_translation
      AND v.text_search @@ tsquery_val
      AND (p_book_number IS NULL OR v.book_number = p_book_number)
    ORDER BY rank DESC
    LIMIT p_limit;
END;
$$ LANGUAGE plpgsql STABLE;

-- Search commentary
CREATE OR REPLACE FUNCTION search_commentary(
    p_query TEXT,
    p_source TEXT DEFAULT NULL,
    p_limit INT DEFAULT 10
)
RETURNS TABLE (
    commentary_source TEXT,
    book_num INT,
    chapter_num INT,
    verse_start_num INT,
    content_text TEXT,
    rank REAL
) AS $$
DECLARE
    tsquery_val TSQUERY;
BEGIN
    tsquery_val := websearch_to_tsquery('english', p_query);

    RETURN QUERY
    SELECT
        c.source,
        c.book_number,
        c.chapter,
        c.verse_start,
        c.content,
        ts_rank(c.content_search, tsquery_val) AS rank
    FROM commentaries c
    WHERE c.content_search @@ tsquery_val
      AND (p_source IS NULL OR c.source = p_source)
    ORDER BY rank DESC
    LIMIT p_limit;
END;
$$ LANGUAGE plpgsql STABLE;