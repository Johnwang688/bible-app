// What the app syncs (R-6b): the storage keys wired into the sync engine on this branch.
import { appearanceKey, languageKey } from '../storage/keys';
import type { StorageKey } from '../storage/storage';
import type { SyncDomains } from './shapes';

export const DEFAULT_DOMAINS: SyncDomains = {
  // `studyItems` (studyItemsKey version 2) and `progress` (readingProgressKey) are wired when R-3
  // (study items v2 and reading progress) merges; `appearanceCustomKey` joins `settings` when R-6a
  // merges. The engine works with any subset of domains.
  settings: [appearanceKey as StorageKey<unknown>, languageKey as StorageKey<unknown>],
};
