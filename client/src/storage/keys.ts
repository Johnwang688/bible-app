// Every value the app keeps on the device, with its schema. Owned by the orchestrator (R-0).
import { z } from 'zod';

import type { LanguagePreference } from '../i18n/types';
import { PRESET_IDS, type AppearanceChoice } from '../theme/types';
import type { StorageKey } from './storage';

export const appearanceKey: StorageKey<AppearanceChoice> = {
  key: 'appearance',
  version: 1,
  schema: z.object({
    preset: z.enum(PRESET_IDS).nullable(),
    mode: z.enum(['system', 'light', 'dark']),
  }),
  fallback: { preset: null, mode: 'system' },
};

export const languageKey: StorageKey<LanguagePreference> = {
  key: 'language',
  version: 1,
  schema: z.enum(['system', 'en', 'zh-Hans']),
  fallback: 'system',
};
