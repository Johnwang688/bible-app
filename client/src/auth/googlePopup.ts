// Google's sign-in window on the web (GOOGLE, board 11-03 row 7). Firebase's popup resolver is passed here, to
// the popup call itself, and nowhere else: Auth is created without one (firebaseApp.ts), so Google's script
// (apis.google.com) loads only when the person presses "Continue with Google" (or confirms a delete with Google),
// never for a signed-out visit. iOS and Android use googlePopup.native.ts (not supported there yet: it needs EAS
// builds and a native Google sign-in module).
import {
  browserPopupRedirectResolver,
  GoogleAuthProvider,
  reauthenticateWithPopup,
  signInWithPopup,
  type Auth,
  type User,
  type UserCredential,
} from 'firebase/auth';

/** Google's window behind a small interface, so tests (and the Auth emulator suite) can swap it. */
export interface GoogleFlow {
  /** Opens Google's window and signs in with the chosen Google account (a first sign-in creates the app account). */
  signIn(auth: Auth, loginHint?: string): Promise<UserCredential>;
  /** Opens Google's window to prove `user` again. Firebase rejects auth/user-mismatch for another Google account. */
  reauthenticate(user: User, loginHint?: string): Promise<UserCredential>;
}

function provider(loginHint?: string): GoogleAuthProvider {
  const google = new GoogleAuthProvider();
  // Always show the account chooser: never sign in silently with whichever Google account the browser holds.
  google.setCustomParameters(loginHint ? { prompt: 'select_account', login_hint: loginHint } : { prompt: 'select_account' });
  return google;
}

export const googlePopupFlow: GoogleFlow = {
  signIn: (auth, loginHint) => signInWithPopup(auth, provider(loginHint), browserPopupRedirectResolver),
  reauthenticate: (user, loginHint) => reauthenticateWithPopup(user, provider(loginHint), browserPopupRedirectResolver),
};
