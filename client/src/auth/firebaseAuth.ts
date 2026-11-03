// The AuthBackend over Firebase Auth's modular SDK (R-6b). Every rejection is an AuthError (through
// mapFirebaseAuthError). Emails are trimmed; passwords and tokens are never logged. Google (GOOGLE, web only)
// goes through Google's window (googlePopup.ts), which is injectable for tests; Apple joins later the same way.
import {
  createUserWithEmailAndPassword,
  deleteUser,
  EmailAuthProvider,
  getAdditionalUserInfo,
  getIdToken as firebaseGetIdToken,
  onAuthStateChanged as firebaseOnAuthStateChanged,
  reauthenticateWithCredential,
  sendPasswordResetEmail,
  signInWithEmailAndPassword,
  signOut as firebaseSignOut,
  type Auth,
  type AuthCredential,
  type User,
} from 'firebase/auth';

import { firebaseAuthCode, mapFirebaseAuthError } from './firebaseErrors';
import { googlePopupFlow, type GoogleFlow } from './googlePopup';
import { AuthError, type AuthBackend, type AuthProviderKind, type AuthUser, type SignInMethod } from './types';

/** Deliberately lenient: something@something, no spaces. The server does the real check. */
const LOOKS_LIKE_EMAIL = /^[^\s@]+@[^\s@]+$/;

const PROVIDER_KINDS: Record<string, AuthProviderKind> = { password: 'password', 'google.com': 'google' };

function providersOf(user: User): AuthProviderKind[] {
  const kinds = new Set<AuthProviderKind>();
  for (const info of user.providerData ?? []) {
    const kind = PROVIDER_KINDS[info?.providerId ?? ''];
    if (kind) kinds.add(kind);
  }
  return [...kinds].sort();
}

function toAuthUser(user: User): AuthUser {
  const providers = providersOf(user);
  return providers.length > 0 ? { uid: user.uid, email: user.email, providers } : { uid: user.uid, email: user.email };
}

function credentialFor(method: SignInMethod): AuthCredential {
  return EmailAuthProvider.credential(method.email.trim(), method.password);
}

/** The browser says it is offline: Google's window would only open onto an error, so it is not opened. */
function offline(): boolean {
  return typeof navigator !== 'undefined' && (navigator as { onLine?: boolean }).onLine === false;
}

/** Runs `fn`, turning any rejection into an AuthError. */
async function mapped<T>(fn: () => Promise<T>): Promise<T> {
  try {
    return await fn();
  } catch (e) {
    throw mapFirebaseAuthError(e);
  }
}

/** `google`: Google's window (default: the popup on the web; refused on iOS and Android). */
export function createFirebaseAuthBackend(auth: Auth, google: GoogleFlow = googlePopupFlow): AuthBackend {
  return {
    currentUser() {
      return auth.currentUser ? toAuthUser(auth.currentUser) : null;
    },

    onAuthStateChanged(listener) {
      return firebaseOnAuthStateChanged(auth, (user) => listener(user ? toAuthUser(user) : null));
    },

    signIn(method) {
      return mapped(async () => {
        switch (method.kind) {
          case 'password': {
            const cred = await signInWithEmailAndPassword(auth, method.email.trim(), method.password);
            return toAuthUser(cred.user);
          }
        }
      });
    },

    signInWithGoogle(options) {
      return mapped(async () => {
        if (offline()) throw new AuthError('network', 'offline: Google sign-in not started');
        // Nothing may wait before this call: the window must open from the press itself (popup blockers).
        const cred = await google.signIn(auth, options?.loginHint);
        if (options?.existingOnly && getAdditionalUserInfo(cred)?.isNewUser) {
          // Firebase has just created an account for a Google account that had none. This sign-in exists only to
          // prove an existing account (the Under 13 offer), so undo it: delete that empty account, then sign out.
          try {
            await deleteUser(cred.user);
          } catch (e) {
            console.warn('[account] removing the account a Google re-auth created failed', firebaseAuthCode(e));
          }
          try {
            await firebaseSignOut(auth);
          } catch {
            // the caller signs out again in every outcome
          }
          throw new AuthError('wrong-credentials', 'that Google account has no account here');
        }
        return toAuthUser(cred.user);
      });
    },

    signUp(email, password) {
      return mapped(async () => {
        const cred = await createUserWithEmailAndPassword(auth, email.trim(), password);
        return toAuthUser(cred.user);
      });
    },

    signOut() {
      return mapped(() => firebaseSignOut(auth));
    },

    async sendPasswordReset(email) {
      const address = email.trim();
      // The server answers "no such user" for some malformed addresses too, which reads as success
      // below; catch the obviously malformed ones here.
      if (!LOOKS_LIKE_EMAIL.test(address)) throw new AuthError('invalid-email');
      try {
        await sendPasswordResetEmail(auth, address);
      } catch (e) {
        // No enumeration: an unknown email looks the same as a known one.
        if (firebaseAuthCode(e) === 'auth/user-not-found') return;
        throw mapFirebaseAuthError(e);
      }
    },

    reauthenticate(method) {
      return mapped(async () => {
        const user = auth.currentUser;
        if (!user) throw new AuthError('unknown', 'reauthenticate: nobody is signed in');
        await reauthenticateWithCredential(user, credentialFor(method));
      });
    },

    reauthenticateWithGoogle(loginHint) {
      return mapped(async () => {
        const user = auth.currentUser;
        if (!user) throw new AuthError('unknown', 'reauthenticate: nobody is signed in');
        if (offline()) throw new AuthError('network', 'offline: Google re-auth not started');
        const cred = await google.reauthenticate(user, loginHint);
        // Firebase already refuses another Google account (auth/user-mismatch); this checks it again.
        if (cred.user.uid !== user.uid) throw new AuthError('wrong-credentials', 'Google proved another account');
      });
    },

    getIdToken(forceRefresh) {
      return mapped(async () => {
        const user = auth.currentUser;
        return user ? firebaseGetIdToken(user, forceRefresh) : null;
      });
    },
  };
}
