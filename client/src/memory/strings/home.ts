// Memory strings: home, library, week, settings (owned by the home worker). Keys are `memory.*`.
export const homeEn = {
  'memory.title': 'Memory',
} as const;

export const homeZhHans: Record<keyof typeof homeEn, string> = {
  'memory.title': '背诵',
};
