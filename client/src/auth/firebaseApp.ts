// Firebase on the web (R-6b): Auth keeps its default persistence (IndexedDB, falling back to local
// storage); Firestore has no offline cache (the device store is the local copy). App Check starts with
// Firestore, never with Auth, so a signed-out app never loads reCAPTCHA (appCheck.ts). iOS and Android use
// firebaseApp.native.ts instead. Everything is created once, on first use.
import { getAuth, type Auth } from 'firebase/auth';
import { getFirestore, type Firestore } from 'firebase/firestore';

import { ensureAppCheck } from './appCheck';
import { getFirebaseApp, withAuthEmulator, withFirestoreEmulator } from './firebaseCore';

export { getFirebaseApp };

let auth: Auth | null = null;
let db: Firestore | null = null;

export function getFirebaseAuth(): Auth {
  if (!auth) auth = withAuthEmulator(getAuth(getFirebaseApp()));
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
