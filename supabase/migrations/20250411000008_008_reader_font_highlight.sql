-- Reader font stack + verse highlight color (synced preferences).

ALTER TABLE user_settings
  ADD COLUMN IF NOT EXISTS reader_font TEXT NOT NULL DEFAULT 'georgia';

ALTER TABLE user_settings
  ADD COLUMN IF NOT EXISTS highlight_color TEXT NOT NULL DEFAULT 'yellow';

ALTER TABLE user_settings DROP CONSTRAINT IF EXISTS user_settings_reader_font_check;
ALTER TABLE user_settings
  ADD CONSTRAINT user_settings_reader_font_check
  CHECK (reader_font IN ('georgia', 'charter', 'palatino', 'garamond', 'times', 'sans'));

ALTER TABLE user_settings DROP CONSTRAINT IF EXISTS user_settings_highlight_color_check;
ALTER TABLE user_settings
  ADD CONSTRAINT user_settings_highlight_color_check
  CHECK (highlight_color IN ('yellow', 'amber', 'green', 'blue', 'pink', 'lavender', 'mint'));

UPDATE user_settings SET reader_font = 'georgia'
  WHERE reader_font IS NULL OR reader_font NOT IN ('georgia', 'charter', 'palatino', 'garamond', 'times', 'sans');

UPDATE user_settings SET highlight_color = 'yellow'
  WHERE highlight_color IS NULL OR highlight_color NOT IN ('yellow', 'amber', 'green', 'blue', 'pink', 'lavender', 'mint');

ALTER TABLE user_settings ALTER COLUMN reader_font SET DEFAULT 'georgia';
ALTER TABLE user_settings ALTER COLUMN highlight_color SET DEFAULT 'yellow';
