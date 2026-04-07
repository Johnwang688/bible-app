ALTER TABLE user_settings
    ADD COLUMN IF NOT EXISTS page_flip_enabled BOOLEAN NOT NULL DEFAULT true;
