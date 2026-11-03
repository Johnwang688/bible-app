// What the account card's sync line says, and which glyph goes with it. Pure, so the card only renders it.
import type { MessageKey } from '../../i18n/translate';
import type { SyncStatus } from '../../sync/types';

export type SyncGlyph = 'check' | 'sync' | 'offline' | 'alert';

export interface SyncLine {
  key: MessageKey;
  glyph: SyncGlyph;
  /** `{n}` of the minutes / hours messages. */
  n?: number;
  /** `{date}` of `account.sync.on`. */
  date?: Date;
  /** The line is a warning (draws its glyph in the danger colour). */
  warn: boolean;
}

const MINUTE = 60_000;
const HOUR = 60 * MINUTE;
const DAY = 24 * HOUR;

/** The current client time in ms. The sync line deliberately reads it at render time (a status that just arrived is aged from now). */
export function clockNow(): number {
  return Date.now();
}

/** `now` is the current client time in ms. A last-sync time in the future (clock skew) reads as just now. */
export function syncLine(sync: SyncStatus | null, now: number): SyncLine {
  switch (sync?.state) {
    case 'syncing':
      return { key: 'account.sync.syncing', glyph: 'sync', warn: false };
    case 'offline':
      return { key: 'account.sync.offline', glyph: 'offline', warn: false };
    case 'error':
      return { key: 'account.sync.error', glyph: 'alert', warn: true };
    default: {
      const at = sync?.lastSyncedAt ?? null;
      if (at === null) return { key: 'account.sync.never', glyph: 'check', warn: false };
      const age = Math.max(0, now - at);
      if (age < MINUTE) return { key: 'account.sync.justNow', glyph: 'check', warn: false };
      if (age < HOUR) return { key: 'account.sync.minutesAgo', glyph: 'check', n: Math.floor(age / MINUTE), warn: false };
      if (age < DAY) return { key: 'account.sync.hoursAgo', glyph: 'check', n: Math.floor(age / HOUR), warn: false };
      return { key: 'account.sync.on', glyph: 'check', date: new Date(at), warn: false };
    }
  }
}

/** How soon the line can change by itself (the next minute or hour boundary), or null when it cannot. */
export function nextSyncLineChange(sync: SyncStatus | null, now: number): number | null {
  if (!sync || sync.state !== 'idle' || sync.lastSyncedAt === null) return null;
  const age = Math.max(0, now - sync.lastSyncedAt);
  if (age >= DAY) return null;
  const step = age < HOUR ? MINUTE : HOUR;
  return step - (age % step) + 50;
}
