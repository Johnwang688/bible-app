// The time-of-day greeting key, by the local clock. Pure: the caller passes the Date.
import type { MessageKey } from '../i18n/messages/en';

export function greetingKey(now: Date): Extract<MessageKey, `home.greeting.${string}`> {
  const hour = now.getHours();
  if (hour >= 5 && hour <= 11) return 'home.greeting.morning';
  if (hour >= 12 && hour <= 16) return 'home.greeting.afternoon';
  return 'home.greeting.evening';
}

/** The local hours at which the greeting changes (morning, afternoon, evening), in order. */
export const GREETING_BOUNDARY_HOURS = [5, 12, 17] as const;

/**
 * The greeting band `date` falls in: how many of `GREETING_BOUNDARY_HOURS` have passed today (0 before 5:00, 3 from
 * 17:00). Two times in the same band and on the same day show the same greeting.
 */
export function greetingBand(date: Date): number {
  const hour = date.getHours();
  return GREETING_BOUNDARY_HOURS.filter((h) => hour >= h).length;
}
