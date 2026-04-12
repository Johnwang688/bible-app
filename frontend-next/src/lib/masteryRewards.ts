/** Mirrors `app/services/quiz_service.py` one-time scope completion bonuses. */
export const MASTERY_REWARD_BOOK = 500;
export const MASTERY_REWARD_SECTION = 3000;
export const MASTERY_REWARD_TESTAMENT = 25000;

/** e.g. 1000 → "1k", 10000 → "10k", 500 → "500" */
export function formatMasteryRewardCoins(amount: number): string {
  if (amount >= 1000 && amount % 1000 === 0) {
    return `${amount / 1000}k`;
  }
  return String(amount);
}
