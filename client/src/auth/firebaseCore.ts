// The Firebase app and the emulator hookup shared by firebaseApp.ts (web) and firebaseApp.native.ts.
import { getApp, getApps, initializeApp, type FirebaseApp } from 'firebase/app';
import { connectAuthEmulator, type Auth } from 'firebase/auth';
import { connectFirestoreEmulator, type Firestore } from 'firebase/firestore';

import { AUTH_EMULATOR_URL, FIRESTORE_EMULATOR, firebaseEmulatorsEnabled, getFirebaseConfig } from './firebaseConfig';

let app: FirebaseApp | null = null;

/** The default Firebase app, created on first use. */
export function getFirebaseApp(): FirebaseApp {
  if (!app) app = getApps().length > 0 ? getApp() : initializeApp(getFirebaseConfig());
  return app;
}

/** Points a freshly created Auth instance at the emulator when configured. */
export function withAuthEmulator(auth: Auth): Auth {
  if (firebaseEmulatorsEnabled()) connectAuthEmulator(auth, AUTH_EMULATOR_URL, { disableWarnings: true });
  return auth;
}

/** Points a freshly created Firestore instance at the emulator when configured. */
export function withFirestoreEmulator(db: Firestore): Firestore {
  if (firebaseEmulatorsEnabled()) connectFirestoreEmulator(db, FIRESTORE_EMULATOR.host, FIRESTORE_EMULATOR.port);
  return db;
}
