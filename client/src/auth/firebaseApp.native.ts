// Firebase on iOS and Android (R-6b). Auth persists the session with getReactNativePersistence over an
// MMKV store of its own (no AsyncStorage dependency). Firestore auto-detects long polling (some
// networks break its streaming transport on React Native) and has no offline cache: the device store
// is the local copy. Everything is created once, on first use.
import { initializeAuth, type Auth, type Persistence, type ReactNativeAsyncStorage } from 'firebase/auth';
import { initializeFirestore, type Firestore } from 'firebase/firestore';

import { getFirebaseApp, withAuthEmulator, withFirestoreEmulator } from './firebaseCore';

export { getFirebaseApp };

let auth: Auth | null = null;
let db: Firestore | null = null;

function mmkvAuthStorage(): ReactNativeAsyncStorage {
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  const { createMMKV } = require('react-native-mmkv') as typeof import('react-native-mmkv');
  const mmkv = createMMKV({ id: 'bible-app-auth' });
  return {
    getItem: async (key) => mmkv.getString(key) ?? null,
    setItem: async (key, value) => mmkv.set(key, value),
    removeItem: async (key) => void mmkv.remove(key),
  };
}

export function getFirebaseAuth(): Auth {
  if (!auth) {
    // `getReactNativePersistence` exists only in the React Native build of @firebase/auth, which Metro
    // resolves on iOS and Android. TypeScript sees the web typings (the RN ones are in
    // @firebase/auth/dist/rn/index.rn.d.ts), so its signature is declared here.
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    const { getReactNativePersistence } = require('firebase/auth') as {
      getReactNativePersistence(storage: ReactNativeAsyncStorage): Persistence;
    };
    const persistence = getReactNativePersistence(mmkvAuthStorage());
    auth = withAuthEmulator(initializeAuth(getFirebaseApp(), { persistence }));
  }
  return auth;
}

export function getFirebaseDb(): Firestore {
  if (!db) db = withFirestoreEmulator(initializeFirestore(getFirebaseApp(), { experimentalAutoDetectLongPolling: true }));
  return db;
}
