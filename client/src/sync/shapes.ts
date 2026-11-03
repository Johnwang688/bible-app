// The local values the sync layer reads and writes (R-6b, orchestrator-owned). Structural copies of
// R-3's storage shapes (`studyItemsKey` version 2 and `readingProgressKey` in storage/keys.ts), so
// the sync layer builds on main before R-3 merges; the registry wires the real keys, and the
// typecheck proves they match.
import type { ProgressMap } from '../memory/types';
import type { MemoryHistory } from '../storage/memoryKeys';
import type { StorageKey } from '../storage/storage';
import type { HighlightId } from '../theme/highlights';

export interface StudyItemsShape {
  highlights: Record<string, { colour: HighlightId; updatedAt: string }>;
  notes: Record<string, { text: string; updatedAt: string }>;
  bookmarks: Record<string, { createdAt: string }>;
}

export interface ProgressShape {
  goalMinutes: number;
  activeMs: Record<string, number>;
  goalMetDays: string[];
  chaptersRead: Record<string, string>;
  /** Device-local: never synced. */
  evidence: { day: string; chapters: Record<string, { furthestVerse: number; engagedMs: number }> };
}

/** R-3's marker for a highlight saved before highlights had a time. */
export const UNKNOWN_TIME = '1970-01-01T00:00:00.000Z';

/** What the engine syncs. Each part is optional, so a domain whose key is not on main yet is left out. */
export interface SyncDomains {
  studyItems?: StorageKey<StudyItemsShape>;
  progress?: StorageKey<ProgressShape>;
  /** Keys whose `key` is a SettingKey (types.ts). The whole value syncs, last writer wins. */
  settings?: readonly StorageKey<unknown>[];
  /**
   * Memory (the verse trainer): per-verse progress and the completed days, merged as a join across
   * devices (domains/memory.ts, CONFLICTS.md "Memory"). The day's lesson plan and the Memory settings
   * are not part of it: they stay on the device.
   */
  memory?: { progress: StorageKey<ProgressMap>; history: StorageKey<MemoryHistory> };
  /**
   * Which verse ids this device's Memory library knows: a pulled Memory row of any other verse is ignored
   * (CONFLICTS.md rule 24; the library is what bounds the local progress). Absent: any verse id is taken.
   */
  memoryVerses?: (id: string) => boolean;
}
