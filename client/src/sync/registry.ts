// What the app syncs (R-6b): the storage keys wired into the sync engine.
import { appearanceKey, languageKey, readingProgressKey, studyItemsKey } from '../storage/keys';
import type { StorageKey } from '../storage/storage';
import type { ProgressShape, StudyItemsShape, SyncDomains } from './shapes';

// The typecheck proves R-3's keys match the shapes the engine was built against (shapes.ts).
const studyItems: StorageKey<StudyItemsShape> = studyItemsKey;
const progress: StorageKey<ProgressShape> = readingProgressKey;

export const DEFAULT_DOMAINS: SyncDomains = {
  studyItems,
  progress,
  // `appearanceCustomKey` joins `settings` when R-6a merges. The age choice (first run) is never synced.
  settings: [appearanceKey as StorageKey<unknown>, languageKey as StorageKey<unknown>],
};
