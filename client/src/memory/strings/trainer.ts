// Memory strings: the trainers, voice, results and the lesson's end (owned by the trainer worker). Keys are
// `memory.*`.
export const trainerEn = {
  'memory.back': 'Back to Memory',
} as const;

export const trainerZhHans: Record<keyof typeof trainerEn, string> = {
  'memory.back': '返回背诵',
};
