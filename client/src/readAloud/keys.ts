// What read aloud keeps on this device: speed, auto-advance, and one voice per language group.
// Never synced: voices are per device, and so is the choice of one.
import { z } from 'zod';

import type { StorageKey } from '../storage/storage';
import { DEFAULT_RATE, RATES } from './types';

export interface ReadAloudPrefs {
  rate: number;
  /** Read straight on into the next chapter (decision 9: off by default). */
  autoAdvance: boolean;
  /** The chosen voice id per group (`en`, `zh-Hans`, `zh-Hant`). */
  voices: { en?: string; 'zh-Hans'?: string; 'zh-Hant'?: string };
}

export const DEFAULT_PREFS: ReadAloudPrefs = { rate: DEFAULT_RATE, autoAdvance: false, voices: {} };

const voiceId = z.string().min(1).max(512).optional();

export const readAloudPrefsKey: StorageKey<ReadAloudPrefs> = {
  key: 'readAloud.prefs',
  version: 1,
  schema: z.object({
    rate: z.number().refine((r) => (RATES as readonly number[]).includes(r)),
    autoAdvance: z.boolean(),
    voices: z.object({ en: voiceId, 'zh-Hans': voiceId, 'zh-Hant': voiceId }),
  }),
  fallback: DEFAULT_PREFS,
};
