// Firebase on the web (R-6b): Auth keeps its default persistence (IndexedDB, falling back to local
// storage); Firestore has no offline cache (the device store is the local copy). iOS and Android use
// firebaseApp.native.ts instead. Everything is created once, on first use.
import { getAuth, type Auth } from 'firebase/auth';
import { getFirestore, type Firestore } from 'firebase/firestore';

import { getFirebaseApp, withAuthEmulator, withFirestoreEmulator } from './firebaseCore';

export { getFirebaseApp };

let auth: Auth | null = null;
let db: Firestore | null = null;

export function getFirebaseAuth(): Auth {
  if (!auth) auth = withAuthEmulator(getAuth(getFirebaseApp()));
  return auth;
}

export function getFirebaseDb(): Firestore {
  if (!db) db = withFirestoreEmulator(getFirestore(getFirebaseApp()));
  return db;
}
