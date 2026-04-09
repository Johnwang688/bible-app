-- ============================================================================
-- Summary entities: themes & key people from Chapter Summaries (source = summary)
-- ============================================================================

CREATE TABLE IF NOT EXISTS summary_entities (
    id          BIGSERIAL PRIMARY KEY,
    kind        TEXT NOT NULL CHECK (kind IN ('theme', 'person')),
    slug        TEXT NOT NULL,
    label       TEXT NOT NULL,
    created_at  TIMESTAMPTZ DEFAULT now(),
    UNIQUE (kind, slug),
    UNIQUE (kind, label)
);

CREATE TABLE IF NOT EXISTS commentary_entity_mentions (
    commentary_id BIGINT NOT NULL REFERENCES commentaries(id) ON DELETE CASCADE,
    entity_id     BIGINT NOT NULL REFERENCES summary_entities(id) ON DELETE CASCADE,
    sort_order    INT NOT NULL DEFAULT 0,
    PRIMARY KEY (commentary_id, entity_id)
);

CREATE INDEX IF NOT EXISTS idx_mentions_entity_id
    ON commentary_entity_mentions (entity_id);

CREATE INDEX IF NOT EXISTS idx_mentions_commentary_id
    ON commentary_entity_mentions (commentary_id);

ALTER TABLE IF EXISTS summary_entities ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS commentary_entity_mentions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Summary entities are publicly readable" ON summary_entities;
CREATE POLICY "Summary entities are publicly readable"
    ON summary_entities FOR SELECT
    USING (true);

DROP POLICY IF EXISTS "Commentary entity mentions are publicly readable" ON commentary_entity_mentions;
CREATE POLICY "Commentary entity mentions are publicly readable"
    ON commentary_entity_mentions FOR SELECT
    USING (true);
