// Where the old data is read from: the old web app's localStorage, read-only.
import { Platform } from 'react-native';

export interface LegacySource {
  getItem(key: string): string | null;
}

/**
 * `window.localStorage` on the web, with every read guarded (a blocked or throwing localStorage reads as
 * null). Null on native, or when localStorage is missing or blocked outright.
 */
export function webLegacySource(): LegacySource | null {
  if (Platform.OS !== 'web') return null;
  let ls: Pick<Storage, 'getItem'> | undefined;
  try {
    ls = typeof window === 'undefined' ? undefined : window.localStorage;
  } catch {
    return null; // Some browsers throw on the access itself.
  }
  if (!ls || typeof ls.getItem !== 'function') return null;
  const local = ls;
  return {
    getItem(key) {
      try {
        return local.getItem(key);
      } catch {
        return null;
      }
    },
  };
}
