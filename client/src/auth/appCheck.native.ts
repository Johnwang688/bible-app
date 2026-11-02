// Firebase App Check on iOS and Android (R-6b follow-up): no attestation provider yet, so no token.
// Native attestation (App Attest on iOS, Play Integrity on Android) needs a native module
// (@react-native-firebase/app-check, a new dependency John has not approved), native Firebase apps
// registered for iOS and Android, and an EAS build to verify it. Until then the native app sends no App
// Check token, which the backend's and Firestore's monitor mode allow; enforcing before native attestation
// exists would break native sync (docs/app-check.md). The web uses appCheck.ts.
import type { FirebaseApp } from 'firebase/app';

/** No-op on native (no provider yet). */
export function ensureAppCheck(_app: FirebaseApp): void {}

/** Always null on native (no provider yet). */
export async function getAppCheckToken(): Promise<string | null> {
  return null;
}

/** Always null on native (no provider yet); nothing is started. */
export async function getAppCheckTokenForRequest(): Promise<string | null> {
  return null;
}
