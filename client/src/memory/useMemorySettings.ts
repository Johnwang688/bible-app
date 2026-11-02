// The Memory settings as React state: a patch merges into the latest stored value, so two quick changes never lose one.
import { useCallback } from 'react';

import { memorySettingsKey, type MemorySettings } from '../storage/memoryKeys';
import { getStorage, useStoredValue, type Storage } from '../storage/storage';

export function useMemorySettings(
  storageProp?: Storage,
): [MemorySettings, (patch: Partial<MemorySettings>) => void] {
  const storage = storageProp ?? getStorage();
  const [settings] = useStoredValue(storage, memorySettingsKey);
  const patch = useCallback(
    (change: Partial<MemorySettings>) => storage.set(memorySettingsKey, { ...storage.get(memorySettingsKey), ...change }),
    [storage],
  );
  return [settings, patch];
}
