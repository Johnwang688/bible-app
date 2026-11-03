// The reader's Appearance customisation (R-6a): reading font and per-preset colour edits.
// Owned by the orchestrator. Kept out of keys.ts so it rebases cleanly beside R-3's key changes.
// The schema checks the shape and colour format; src/theme/custom.ts checks editability and contrast
// when the edits are applied.
import { z } from 'zod';

import { COLOR_TOKENS, HEX_COLOR, NO_CUSTOM, type AppearanceCustom } from '../theme/custom';
import { PRESET_IDS } from '../theme/types';
import type { StorageKey } from './storage';

export const appearanceCustomKey: StorageKey<AppearanceCustom> = {
  key: 'appearance.custom',
  version: 1,
  schema: z.object({
    scriptureFont: z.enum(['Literata', 'SourceSerif4']).nullable(),
    edits: z.partialRecord(z.enum(PRESET_IDS), z.partialRecord(z.enum(COLOR_TOKENS), z.string().regex(HEX_COLOR))),
  }),
  fallback: NO_CUSTOM,
};
