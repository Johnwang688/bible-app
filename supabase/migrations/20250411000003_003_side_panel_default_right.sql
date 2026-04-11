-- Align column default with app default (002 used 'left' on older deployments).
ALTER TABLE user_settings ALTER COLUMN side_panel_position SET DEFAULT 'right';
