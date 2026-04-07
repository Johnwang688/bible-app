-- Narrow line_height to 1.5 / 2 / 2.5 (drop 1, 1.15, 1.25; add 2.5).
-- Safe to run after 005, or standalone after 002 (maps relaxed/airy before the catch-all).

ALTER TABLE user_settings DROP CONSTRAINT IF EXISTS user_settings_line_height_check;

UPDATE user_settings SET line_height = '1.5' WHERE line_height = 'relaxed';
UPDATE user_settings SET line_height = '2' WHERE line_height = 'airy';
UPDATE user_settings SET line_height = '1.5' WHERE line_height IN ('1', '1.15', '1.25');
UPDATE user_settings
SET line_height = '1.5'
WHERE line_height IS NULL OR line_height NOT IN ('1.5', '2', '2.5');

ALTER TABLE user_settings
  ADD CONSTRAINT user_settings_line_height_check
  CHECK (line_height IN ('1.5', '2', '2.5'));

ALTER TABLE user_settings ALTER COLUMN line_height SET DEFAULT '2';
