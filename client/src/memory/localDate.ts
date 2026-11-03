/**
 * Local-calendar date helpers. The whole app's notion of "a day" is the user's
 * *local* calendar day, never UTC — a session at 11pm local on Saturday counts
 * as Saturday, and the daily lesson, streak, and verse-of-the-day all roll over
 * at local midnight. Route every "what day is it" decision through here so those
 * boundaries stay consistent (see daily-completion, mock-lesson, session).
 *
 * Pure module: no React, no browser-only APIs, safe on both server and client.
 */

/** Local date as `YYYY-MM-DD` (e.g. '2026-06-01'). */
export function toLocalDateString(d: Date = new Date()): string {
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return `${y}-${m}-${day}`;
}

/**
 * Integer count of *local* days since the Unix epoch. Flips at local midnight —
 * unlike `Math.floor(getTime() / 86_400_000)`, which flips at UTC midnight.
 * Use for day-parity / alternating-day logic.
 */
export function localDayIndex(d: Date = new Date()): number {
  return Math.floor((d.getTime() - d.getTimezoneOffset() * 60_000) / 86_400_000);
}

/**
 * End of the local calendar day `d` falls in (23:59:59.999 local), as epoch ms.
 *
 * This is the app's single "is that verse due today?" cutoff, and BOTH sides of
 * the review schedule have to use the same one. `selectReviewIds` draws a verse
 * whose `next_due_at` is at or before it; `record_verse_attempt` credits a pass
 * only on a verse due at or before it, and stamps the next date from it. When
 * the two disagree the user is handed a verse the server then refuses to credit
 * — a pass that buys nothing, on a verse that comes straight back tomorrow,
 * with no signal anywhere that anything went wrong.
 *
 * It must therefore be computed where the user's timezone actually is — the
 * browser — and carried to the server, never re-derived there. `new Date(y, m,
 * d)` on Vercel is a UTC date, so a server-side recomputation is the end of the
 * *server's* day: for a user at UTC-5 a verse due 20:00 local is 01:00 UTC and
 * would be held a day late; east of UTC the error runs the other way and pulls
 * tomorrow's verses into today's plan.
 */
export function endOfLocalDay(d: Date = new Date()): number {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate(), 23, 59, 59, 999).getTime();
}

/**
 * Is `dateKey` (a `YYYY-MM-DD` local date, as produced by `toLocalDateString`)
 * strictly before the local day the account was created on?
 *
 * The week strip on /learn paints every past day with no completion as a red ✗.
 * Days before the account existed are not misses, so they get a neutral
 * placeholder instead — this is the predicate that decides which is which.
 *
 * `createdAt` is Supabase's `user.created_at`, an ISO UTC instant. It is
 * converted to the *user's local* day before the comparison: an account created
 * 23:30 local on Monday is already a UTC-Tuesday instant, and comparing UTC
 * dates would blank out Monday — a real day the user could have practised.
 *
 * Missing, empty or unparseable input returns `false`: never hide a real miss
 * because the signup date was unavailable.
 *
 * Both sides are zero-padded `YYYY-MM-DD`, so lexical order is calendar order.
 * Pure and dependency-free — see tests/daily-lesson.ts (F6–F9).
 */
export function isPreSignupDay(dateKey: string, createdAt: string | null | undefined): boolean {
  if (!createdAt) return false;
  const created = new Date(createdAt);
  if (Number.isNaN(created.getTime())) return false;
  return dateKey < toLocalDateString(created);
}

/**
 * `instantMs` moved `days` calendar days later, at the same local wall-clock time.
 *
 * Adding `days * 86_400_000` is wrong across a daylight-saving change: the day is 23 or 25 hours
 * long, so the result lands an hour off the end-of-day it is meant to be. The review schedule is
 * stamped as `endOfLocalDay + n days`, so it goes through the calendar instead.
 */
export function addLocalDays(instantMs: number, days: number): number {
  const d = new Date(instantMs);
  return new Date(
    d.getFullYear(),
    d.getMonth(),
    d.getDate() + days,
    d.getHours(),
    d.getMinutes(),
    d.getSeconds(),
    d.getMilliseconds(),
  ).getTime();
}
