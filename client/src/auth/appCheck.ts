// Firebase App Check on the web (R-6b follow-up): reCAPTCHA Enterprise, score-based, with the public site
// key from firebaseConfig.ts. `ensureAppCheck` runs from `getFirebaseDb()` (before Firestore exists), never
// from `getFirebaseAuth()`, so a signed-out app (and the e2e suite) never loads reCAPTCHA. Firestore then
// attaches App Check tokens itself; `getAppCheckToken` serves the backend call (accountApi.ts). The backend
// and Firestore are in monitor mode (docs/app-check.md). iOS and Android use appCheck.native.ts.
import type { FirebaseApp } from 'firebase/app';
import { getToken, initializeAppCheck, ReCaptchaEnterpriseProvider, type AppCheck } from 'firebase/app-check';

import { getAppCheckSiteKey } from './firebaseConfig';

let appCheck: AppCheck | null = null;
let settled = false;

/** Initialises App Check on `app` once (later calls do nothing). Off: does nothing. Never throws. */
export function ensureAppCheck(app: FirebaseApp): void {
  if (settled) return;
  settled = true;
  const siteKey = getAppCheckSiteKey();
  if (!siteKey) return;
  try {
    appCheck = initializeAppCheck(app, { provider: new ReCaptchaEnterpriseProvider(siteKey), isTokenAutoRefreshEnabled: true });
  } catch {
    // App Check cannot start (for example it was initialised elsewhere with other options): run without it.
    appCheck = null;
  }
}

/** A current App Check token, or null (before `ensureAppCheck`, when off, or on any failure). Never rejects. */
export async function getAppCheckToken(): Promise<string | null> {
  const instance = appCheck;
  if (!instance) return null;
  try {
    const result = await getToken(instance, false);
    return typeof result?.token === 'string' && result.token !== '' ? result.token : null;
  } catch {
    return null;
  }
}
