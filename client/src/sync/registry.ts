// What the app syncs (R-6b): the storage keys wired into the sync engine.
import { appearanceCustomKey } from '../storage/appearanceCustomKey';
import { appearanceKey, languageKey, readingProgressKey, studyItemsKey } from '../storage/keys';
import { memoryHistoryKey, memoryProgressKey } from '../storage/memoryKeys';
import type { StorageKey } from '../storage/storage';
import type { ProgressShape, StudyItemsShape, SyncDomains } from './shapes';

// The typecheck proves R-3's keys match the shapes the engine was built against (shapes.ts).
const studyItems: StorageKey<StudyItemsShape> = studyItemsKey;
const progress: StorageKey<ProgressShape> = readingProgressKey;

export const DEFAULT_DOMAINS: SyncDomains = {
  studyItems,
  progress,
  // The look, the language and the Appearance customisation sync. The age choice (first run) is never synced.
  settings: [appearanceKey as StorageKey<unknown>, languageKey as StorageKey<unknown>, appearanceCustomKey as StorageKey<unknown>],
  // Memory progress and history sync (CONFLICTS.md "Memory"). Not synced: `memory.lesson` (the day's
  // frozen plan, rebuilt from the synced progress on each device) and `memory.settings` (it carries the
  // voice consent, which stays a per-device answer).
  memory: { progress: memoryProgressKey, history: memoryHistoryKey },
};
