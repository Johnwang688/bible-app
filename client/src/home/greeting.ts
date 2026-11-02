// The time-of-day greeting key, by the local clock. Pure: the caller passes the Date.
import type { MessageKey } from '../i18n/messages/en';

export function greetingKey(now: Date): Extract<MessageKey, `home.greeting.${string}`> {
  const hour = now.getHours();
  if (hour >= 5 && hour <= 11) return 'home.greeting.morning';
  if (hour >= 12 && hour <= 16) return 'home.greeting.afternoon';
  return 'home.greeting.evening';
}
