// Which parts of the old web app's data (frontend-next's localStorage) have been imported (R-7a).
// Each part imports once; a part added later (reading progress, after R-3) imports on the next launch.
import { z } from 'zod';

import type { StorageKey } from '../storage/storage';

export const LEGACY_PARTS = ['position', 'recent', 'study', 'theme', 'progress'] as const;
export type LegacyPart = (typeof LEGACY_PARTS)[number];

export const legacyImportKey: StorageKey<{ parts: LegacyPart[] }> = {
  key: 'legacy.import',
  version: 1,
  schema: z.object({ parts: z.array(z.enum(LEGACY_PARTS)) }),
  fallback: { parts: [] },
};
