-- Expand font_scale to 8–30 (step 2) and set font default 20px.
-- Run if you already applied an older 005 that omitted 20/22/26/28 or used font default 16.
-- Does not change line_height (see 005/006); avoids ALTER line_height DEFAULT on 002's CHECK,
-- which only allows relaxed/airy and would reject DEFAULT '2'.

ALTER TABLE user_settings DROP CONSTRAINT IF EXISTS user_settings_font_scale_check;

UPDATE user_settings SET font_scale = '18' WHERE font_scale = 'comfortable';
UPDATE user_settings SET font_scale = '18' WHERE font_scale = 'large';
UPDATE user_settings SET font_scale = '24' WHERE font_scale = 'xlarge';

UPDATE user_settings
SET font_scale = '20'
WHERE font_scale IS NULL OR font_scale NOT IN ('8', '10', '12', '14', '16', '18', '20', '22', '24', '26', '28', '30');

ALTER TABLE user_settings
  ADD CONSTRAINT user_settings_font_scale_check
  CHECK (font_scale IN ('8', '10', '12', '14', '16', '18', '20', '22', '24', '26', '28', '30'));

ALTER TABLE user_settings ALTER COLUMN font_scale SET DEFAULT '20';
