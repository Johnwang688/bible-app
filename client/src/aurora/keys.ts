// The glass presets' moving background (R-7a): which of the two animations runs.
import { z } from 'zod';

import type { StorageKey } from '../storage/storage';

/** `fluid`: the fluid simulation (the default; can be stirred). `flow`: the lighter flow shader. */
export const AURORA_STYLES = ['fluid', 'flow'] as const;
export type AuroraStyle = (typeof AURORA_STYLES)[number];

export const auroraStyleKey: StorageKey<AuroraStyle> = {
  key: 'aurora.style',
  version: 1,
  schema: z.enum(AURORA_STYLES),
  fallback: 'fluid',
};
