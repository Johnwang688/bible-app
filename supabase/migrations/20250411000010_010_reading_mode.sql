-- Reading layout (continuous vs paged / single vs spread) synced with account preferences.

ALTER TABLE user_settings
  ADD COLUMN IF NOT EXISTS reading_mode TEXT;

UPDATE user_settings SET reading_mode = 'single' WHERE reading_mode IS NULL;

ALTER TABLE user_settings
  ALTER COLUMN reading_mode SET DEFAULT 'single',
  ALTER COLUMN reading_mode SET NOT NULL;

ALTER TABLE user_settings DROP CONSTRAINT IF EXISTS user_settings_reading_mode_check;
ALTER TABLE user_settings
  ADD CONSTRAINT user_settings_reading_mode_check
  CHECK (reading_mode IN ('single', 'book', 'paged-single', 'paged-double'));
