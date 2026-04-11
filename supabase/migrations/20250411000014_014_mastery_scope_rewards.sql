-- ============================================================================
-- One-time coin rewards when a user fully masters quiz scope: book, Bible
-- section (Law, Gospels, etc.), or entire Old/New Testament.
-- Backend claims rows via service role; prevents duplicate payouts.
-- ============================================================================

CREATE TABLE IF NOT EXISTS user_mastery_scope_rewards (
    user_id       UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    milestone_key TEXT NOT NULL,
    coins_awarded INT  NOT NULL CHECK (coins_awarded > 0),
    created_at    TIMESTAMPTZ DEFAULT now(),
    PRIMARY KEY (user_id, milestone_key)
);

CREATE INDEX IF NOT EXISTS idx_mastery_scope_rewards_user
    ON user_mastery_scope_rewards (user_id);

ALTER TABLE IF EXISTS user_mastery_scope_rewards ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own mastery scope rewards" ON user_mastery_scope_rewards;
CREATE POLICY "Users can view own mastery scope rewards"
    ON user_mastery_scope_rewards FOR SELECT
    USING (auth.uid() = user_id);
