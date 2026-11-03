// Firebase on the web (R-6b): Auth keeps its default persistence (IndexedDB, falling back to local
// storage) but has no popup/redirect resolver: `getAuth()` would add one, which loads Google's script
// (apis.google.com) on every page, signed in or not. Email sign-in needs none; Google sign-in passes
// `browserPopupRedirectResolver` to its own popup call.
// Firestore has no offline cache (the device store is the local copy). App Check starts with
// Firestore, never with Auth, so a signed-out app never loads reCAPTCHA (appCheck.ts). iOS and Android use
// firebaseApp.native.ts instead. Everything is created once, on first use.
import { browserLocalPersistence, browserSessionPersistence, indexedDBLocalPersistence, initializeAuth, type Auth } from 'firebase/auth';
import { getFirestore, type Firestore } from 'firebase/firestore';

import { ensureAppCheck } from './appCheck';
import { getFirebaseApp, withAuthEmulator, withFirestoreEmulator } from './firebaseCore';

export { getFirebaseApp };

let auth: Auth | null = null;
let db: Firestore | null = null;

export function getFirebaseAuth(): Auth {
  if (!auth)
    auth = withAuthEmulator(
      initializeAuth(getFirebaseApp(), { persistence: [indexedDBLocalPersistence, browserLocalPersistence, browserSessionPersistence] }),
    );
  return auth;
}

export function getFirebaseDb(): Firestore {
  if (!db) {
    const app = getFirebaseApp();
    ensureAppCheck(app); // before Firestore exists, so its requests carry App Check tokens
    db = withFirestoreEmulator(getFirestore(app));
  }
  return db;
}
