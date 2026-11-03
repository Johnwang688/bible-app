// The AuthBackend over Firebase Auth's modular SDK (R-6b). Every rejection is an AuthError (through
// mapFirebaseAuthError). Emails are trimmed; passwords and tokens are never logged. Google and Apple
// join later as new SignInMethod kinds in `credentialFor` and `signIn`.
import {
  createUserWithEmailAndPassword,
  EmailAuthProvider,
  getIdToken as firebaseGetIdToken,
  onAuthStateChanged as firebaseOnAuthStateChanged,
  onIdTokenChanged as firebaseOnIdTokenChanged,
  reauthenticateWithCredential,
  reload as firebaseReload,
  sendEmailVerification as firebaseSendEmailVerification,
  sendPasswordResetEmail,
  verifyBeforeUpdateEmail as firebaseVerifyBeforeUpdateEmail,
  signInWithEmailAndPassword,
  signOut as firebaseSignOut,
  type Auth,
  type AuthCredential,
  type User,
} from 'firebase/auth';

import { firebaseAuthCode, mapFirebaseAuthError } from './firebaseErrors';
import { AuthError, type AuthBackend, type AuthUser, type EmailActionOptions, type SignInMethod } from './types';

/** Deliberately lenient: something@something, no spaces. The server does the real check. */
const LOOKS_LIKE_EMAIL = /^[^\s@]+@[^\s@]+$/;

function toAuthUser(user: User): AuthUser {
  const created = Date.parse(user.metadata?.creationTime ?? '');
  // emailVerified is always a boolean here (anything but true is unconfirmed): this backend verifies emails.
  return { uid: user.uid, email: user.email, emailVerified: user.emailVerified === true, ...(Number.isFinite(created) ? { createdAt: created } : {}) };
}

/** Firebase's settings for an email action: the continue URL, and the email's language. */
function actionSettings(auth: Auth, options: EmailActionOptions) {
  auth.languageCode = options.languageCode;
  return { url: options.url };
}

function credentialFor(method: SignInMethod): AuthCredential {
  switch (method.kind) {
    case 'password':
      return EmailAuthProvider.credential(method.email.trim(), method.password);
  }
}

/** Runs `fn`, turning any rejection into an AuthError. */
async function mapped<T>(fn: () => Promise<T>): Promise<T> {
  try {
    return await fn();
  } catch (e) {
    throw mapFirebaseAuthError(e);
  }
}

export function createFirebaseAuthBackend(auth: Auth): AuthBackend {
  return {
    currentUser() {
      return auth.currentUser ? toAuthUser(auth.currentUser) : null;
    },

    onAuthStateChanged(listener) {
      const offState = firebaseOnAuthStateChanged(auth, (user) => listener(user ? toAuthUser(user) : null));
      // reload() does not fire onAuthStateChanged, but it ends by notifying this one (before it resolves, and before
      // any token refresh: the provider holds sync for a newly confirmed user until its forced refresh), and so does a
      // new ID token. A user whose email was confirmed shows as soon as either happens. Sign-in and sign-out come
      // from the first.
      const offToken = firebaseOnIdTokenChanged(auth, (user) => {
        if (user) listener(toAuthUser(user));
      });
      return () => {
        offState();
        offToken();
      };
    },

    verifiesEmail: true,

    reload() {
      return mapped(async () => {
        const user = auth.currentUser;
        if (!user) return null;
        await firebaseReload(user);
        return auth.currentUser ? toAuthUser(auth.currentUser) : null;
      });
    },

    sendEmailVerification(options) {
      return mapped(async () => {
        const user = auth.currentUser;
        if (!user) throw new AuthError('unknown', 'sendEmailVerification: nobody is signed in');
        await firebaseSendEmailVerification(user, actionSettings(auth, options));
      });
    },

    verifyBeforeUpdateEmail(newEmail, options) {
      return mapped(async () => {
        const user = auth.currentUser;
        if (!user) throw new AuthError('unknown', 'verifyBeforeUpdateEmail: nobody is signed in');
        await firebaseVerifyBeforeUpdateEmail(user, newEmail.trim(), actionSettings(auth, options));
      });
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

    getIdToken(forceRefresh) {
      return mapped(async () => {
        const user = auth.currentUser;
        return user ? firebaseGetIdToken(user, forceRefresh) : null;
      });
    },
  };
}
