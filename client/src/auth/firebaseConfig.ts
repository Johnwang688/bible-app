// The Firebase web app's public config (R-6b). Not a secret: the Firestore security rules protect the
// data. Each value can be overridden with an EXPO_PUBLIC_FIREBASE_* env var. Expo inlines only static
// `process.env.EXPO_PUBLIC_*` reads, so each one is spelled out.
import type { FirebaseOptions } from 'firebase/app';

function pick(value: string | undefined, fallback: string): string {
  return value && value.trim() !== '' ? value.trim() : fallback;
}

export function getFirebaseConfig(): FirebaseOptions {
  return {
    apiKey: pick(process.env.EXPO_PUBLIC_FIREBASE_API_KEY, 'AIzaSyApR7OouIzj9sSiZCpFo7FFijlOUTq6_X4'),
    authDomain: pick(process.env.EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN, 'bible-app-492520.firebaseapp.com'),
    projectId: pick(process.env.EXPO_PUBLIC_FIREBASE_PROJECT_ID, 'bible-app-492520'),
    storageBucket: pick(process.env.EXPO_PUBLIC_FIREBASE_STORAGE_BUCKET, 'bible-app-492520.firebasestorage.app'),
    messagingSenderId: pick(process.env.EXPO_PUBLIC_FIREBASE_MESSAGING_SENDER_ID, '593497511935'),
    appId: pick(process.env.EXPO_PUBLIC_FIREBASE_APP_ID, '1:593497511935:web:89b4144b659881044ef9ca'),
  };
}

export const AUTH_EMULATOR_URL = 'http://127.0.0.1:9180';
export const FIRESTORE_EMULATOR = { host: '127.0.0.1', port: 8180 } as const;

/** Whether to talk to the local emulators: `EXPO_PUBLIC_FIREBASE_EMULATORS=1`, in development builds only. */
export function firebaseEmulatorsEnabled(): boolean {
  const dev = typeof __DEV__ !== 'undefined' && __DEV__;
  return dev && process.env.EXPO_PUBLIC_FIREBASE_EMULATORS === '1';
}

/** The public reCAPTCHA Enterprise site key the web app's App Check uses (score-based; not a secret). */
export const DEFAULT_APP_CHECK_SITE_KEY = '6Lf1Yg0uAAAAAOFcnwDwi4LNyGO0_MgrmjAa4duG';

/**
 * The App Check site key, or null when App Check is off: `EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY` overrides
 * the default, the value `off` (or one that is empty after a trim) turns it off, and it is always off while
 * the Firebase emulators are on (they have no App Check). Read on each call.
 */
export function getAppCheckSiteKey(): string | null {
  if (firebaseEmulatorsEnabled()) return null;
  const raw = process.env.EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY;
  if (raw === undefined) return DEFAULT_APP_CHECK_SITE_KEY;
  const key = raw.trim();
  return key === '' || key.toLowerCase() === 'off' ? null : key;
}
