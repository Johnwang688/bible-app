import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { importLegacyDataOnce } from '..';

it.each(['light', 'dark'] as const)(
  'does not overwrite an explicit new-app %s mode with no preset',
  (mode) => {
    const storage = createStorage(memoryBackend());
    const choice = { preset: null, mode };
    storage.set(appearanceKey, choice);
    importLegacyDataOnce({
      storage,
      source: {
        getItem: (key) => key === 'theme' ? (mode === 'light' ? 'dark' : 'light') : null,
      },
    });
    expect(storage.get(appearanceKey)).toEqual(choice);
  },
);
