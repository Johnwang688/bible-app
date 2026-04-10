-- Curated overview + timeline for person/place/theme entity pages (from repo JSON upserts).
-- Extends kind to allow place rows in summary_entities (enables place mention indexing).

ALTER TABLE summary_entities
    ADD COLUMN IF NOT EXISTS profile JSONB;

ALTER TABLE summary_entities DROP CONSTRAINT IF EXISTS summary_entities_kind_check;
ALTER TABLE summary_entities ADD CONSTRAINT summary_entities_kind_check
    CHECK (kind IN ('theme', 'person', 'place'));
