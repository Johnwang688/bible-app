-- Explicit RLS for shared public reference tables.
-- These tables are intended to stay publicly readable, but only via policies.

-- ============================================================================
-- 1. ENABLE RLS
-- ============================================================================
ALTER TABLE translations ENABLE ROW LEVEL SECURITY;
ALTER TABLE books ENABLE ROW LEVEL SECURITY;
ALTER TABLE commentary_sources ENABLE ROW LEVEL SECURITY;
ALTER TABLE cross_references ENABLE ROW LEVEL SECURITY;

-- ============================================================================
-- 2. PUBLIC READ POLICIES
-- ============================================================================
DROP POLICY IF EXISTS "Translations are publicly readable" ON translations;
CREATE POLICY "Translations are publicly readable"
    ON translations FOR SELECT
    USING (true);

DROP POLICY IF EXISTS "Books are publicly readable" ON books;
CREATE POLICY "Books are publicly readable"
    ON books FOR SELECT
    USING (true);

DROP POLICY IF EXISTS "Commentary sources are publicly readable" ON commentary_sources;
CREATE POLICY "Commentary sources are publicly readable"
    ON commentary_sources FOR SELECT
    USING (true);

DROP POLICY IF EXISTS "Cross references are publicly readable" ON cross_references;
CREATE POLICY "Cross references are publicly readable"
    ON cross_references FOR SELECT
    USING (true);
