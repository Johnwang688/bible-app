-- Reader typography: font size in px (8–30 step 2) and line-height 1.5 / 2 / 2.5.
-- Run on top of 002_account_sync.sql. Expects CHECK constraint names
-- user_settings_font_scale_check and user_settings_line_height_check (Postgres default for
-- column CHECKs on user_settings.font_scale / user_settings.line_height). If DROP does not
-- remove a constraint, inspect \d user_settings and DROP CONSTRAINT by name, then re-run.
--
-- 006: optional, only if an older migration left line_height as 1 / 1.15 / 1.25.
-- 007: optional, only if font_scale CHECK still omits 20, 22, 26, or 28.

ALTER TABLE user_settings DROP CONSTRAINT IF EXISTS user_settings_font_scale_check;
ALTER TABLE user_settings DROP CONSTRAINT IF EXISTS user_settings_line_height_check;

UPDATE user_settings SET font_scale = '18' WHERE font_scale = 'comfortable';
UPDATE user_settings SET font_scale = '18' WHERE font_scale = 'large';
UPDATE user_settings SET font_scale = '24' WHERE font_scale = 'xlarge';

UPDATE user_settings SET line_height = '1.5' WHERE line_height = 'relaxed';
UPDATE user_settings SET line_height = '2' WHERE line_height = 'airy';

UPDATE user_settings
SET font_scale = '20'
WHERE font_scale IS NULL OR font_scale NOT IN ('8', '10', '12', '14', '16', '18', '20', '22', '24', '26', '28', '30');

UPDATE user_settings SET line_height = '1.5' WHERE line_height IN ('1', '1.15', '1.25');

UPDATE user_settings
SET line_height = '1.5'
WHERE line_height IS NULL OR line_height NOT IN ('1.5', '2', '2.5');

ALTER TABLE user_settings
  ADD CONSTRAINT user_settings_font_scale_check
  CHECK (font_scale IN ('8', '10', '12', '14', '16', '18', '20', '22', '24', '26', '28', '30'));

ALTER TABLE user_settings
  ADD CONSTRAINT user_settings_line_height_check
  CHECK (line_height IN ('1.5', '2', '2.5'));

ALTER TABLE user_settings ALTER COLUMN font_scale SET DEFAULT '20';
ALTER TABLE user_settings ALTER COLUMN line_height SET DEFAULT '2';