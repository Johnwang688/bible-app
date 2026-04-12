// Centralised localStorage key registry.
// All keys are prefixed with 'bible-app-' to avoid collisions with other
// apps running on the same origin.

export const STORAGE_KEYS = {
  LAST_POSITION:     'bible-app-last-position',
  RECENT_PASSAGES:   'bible-app-recent-passages',
  HIGHLIGHTS:        'bible-app-highlights',
  BOOKMARKS:         'bible-app-bookmarks',
  NOTES:             'bible-app-notes',
  READING_PROGRESS:  'bible-app-reading-progress',
  DAILY_GOAL:        'bible-app-daily-goal-minutes',
  READER_SETTINGS:   'bible-app-reader-settings',
  ONBOARDING:        'bible-app-onboarding-complete',
  AI_SIDEBAR:        'bible-app-ai-sidebar',
  AI_PERSONALITY:    'bible-app-ai-personality',
  SHOP_INVENTORY:    'bible-app-shop-inventory',
} as const;

export type StorageKey = typeof STORAGE_KEYS[keyof typeof STORAGE_KEYS];
