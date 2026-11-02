// The Memory section's block of the message catalogue (team MEM). The strings live with the screens in
// `src/memory/strings/`; this file joins them, and `en.ts` / `zh-Hans.ts` spread it in one line each.
import { homeEn, homeZhHans } from '../../memory/strings/home';
import { trainerEn, trainerZhHans } from '../../memory/strings/trainer';

export const memoryEn = { ...homeEn, ...trainerEn } as const;

export const memoryZhHans: Record<keyof typeof memoryEn, string> = { ...homeZhHans, ...trainerZhHans };
