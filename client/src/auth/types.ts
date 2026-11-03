// The auth layer's contracts (R-6b, orchestrator-owned). Email and password today; Google and Apple
// plug in later as new SignInMethod kinds, with no change to the account provider or the UI shape.
import type { SyncStatus } from '../sync/types';

export interface AuthUser {
  uid: string;
  email: string | null;
  /**
   * Whether the email is confirmed (email verification, 11-03). A backend that verifies emails (`verifiesEmail`,
   * the Firebase one) always sets it; for such a backend anything but `true` holds sync off (fail closed). Absent
   * only from backends that do not verify emails (test fakes, the inert preview).
   */
  emailVerified?: boolean;
  /** When the account was created (client ms), when the backend knows. */
  createdAt?: number;
}

export type AuthErrorKind =
  | 'invalid-email'
  | 'wrong-credentials' // wrong password, unknown email or a disabled account: one message, no enumeration
  | 'email-in-use'
  | 'weak-password'
  | 'too-many-requests'
  | 'network'
  | 'requires-recent-login'
  | 'not-allowed' // sign-in is off on this device (the Under 13 age choice)
  | 'unknown';

export class AuthError extends Error {
  readonly kind: AuthErrorKind;
  /** The Firebase Auth code (`auth/...`) it was mapped from, when there was one. */
  readonly code?: string;
  constructor(kind: AuthErrorKind, message?: string, options?: { cause?: unknown; code?: string }) {
    super(message ?? `auth ${kind}`, options);
    this.name = 'AuthError';
    this.kind = kind;
    if (options?.code !== undefined) this.code = options.code;
  }
}

/** How to sign in. Later: `{ kind: 'google' }`, `{ kind: 'apple' }`. */
export type SignInMethod = { kind: 'password'; email: string; password: string };

/** What a verification or change-of-address email needs: where its link continues to, and its language. */
export interface EmailActionOptions {
  /** The continue URL (an authorized domain): `/me?verified=1` on the web app. */
  url: string;
  /** Firebase's `languageCode` for the email and its page: `zh-CN` or `en`. */
  languageCode: string;
}

/** Firebase Auth behind a small interface (firebaseAuth.ts), so tests and new providers swap it. */
export interface AuthBackend {
  /**
   * The backend verifies emails (Firebase): sync runs only for a user whose `emailVerified` is exactly true, and the
   * verification actions below are required. Absent: the backend has no such step (test fakes), and every user syncs.
   */
  verifiesEmail?: true;
  /**
   * Fetches the signed-in user again (Firebase `reload()`), so a confirmation made elsewhere shows. Resolves with the
   * fresh user (null when signed out). Rejects with AuthError; a session ended by an email change or a delete
   * rejects with the Firebase code (`auth/user-token-expired`, `auth/user-not-found`, ...).
   */
  reload?(): Promise<AuthUser | null>;
  /** Sends the verification email to the signed-in user's address. */
  sendEmailVerification?(options: EmailActionOptions): Promise<void>;
  /** Firebase `verifyBeforeUpdateEmail`: emails a link to `newEmail`; the address changes when it is opened. */
  verifyBeforeUpdateEmail?(newEmail: string, options: EmailActionOptions): Promise<void>;
  currentUser(): AuthUser | null;
  /** Calls back with the restored user (or null) once known, then on every change. Returns the unsubscribe. */
  onAuthStateChanged(listener: (user: AuthUser | null) => void): () => void;
  signIn(method: SignInMethod): Promise<AuthUser>;
  signUp(email: string, password: string): Promise<AuthUser>;
  signOut(): Promise<void>;
  /** Resolves whether or not an account uses the email (no enumeration); rejects only on invalid-email, network or too-many-requests. */
  sendPasswordReset(email: string): Promise<void>;
  /** Proves the signed-in user again (for delete); afterwards the ID token carries a fresh auth_time. */
  reauthenticate(method: SignInMethod): Promise<void>;
  /** The signed-in user's ID token, or null when signed out. */
  getIdToken(forceRefresh?: boolean): Promise<string | null>;
}

export type AccountStatus = 'loading' | 'signedOut' | 'signedIn';

/**
 * The signed-in account's unconfirmed email (email verification, 11-03), or null when there is nothing to confirm
 * (signed out, confirmed, or a backend without verification).
 */
export interface VerifyState {
  /**
   * `new`: an account made with this change (it was sent a link at sign-up). `paused`: an account that synced before
   * verification existed (it has sync history on this device, or was made before the change shipped): its sync is
   * paused until it confirms.
   */
  kind: 'new' | 'paused';
  /** A link was sent from this device (at sign-up or by Send again). */
  sent: boolean;
  /** Client ms before which Send again is held (the 60 s cooldown, or 5 min after too-many-requests), or null. */
  resendAt: number | null;
  /** A change of address waiting for its link (Change email), or null. */
  pendingEmail: string | null;
}

/** News the account card shows once, as its banner (email verification, 11-03). */
export type AccountNotice = { kind: 'confirmed' } | { kind: 'emailChanged'; email: string };

/** What a sign-up reports: the account exists; whether its verification email went out. */
export interface SignUpResult {
  /** Why the verification email could not be sent, or null when it was (or the backend sends none). */
  sendError: AuthError | null;
}

/** What `useAccount()` returns. Every action rejects with AuthError on failure. */
export interface AccountState {
  status: AccountStatus;
  user: AuthUser | null;
  /**
   * False when sign-in is off on this device (first run's Under 13 age choice, John 2026-11-02): no sign-in,
   * no sync; signIn/signUp reject with 'not-allowed'; a signed-in user is signed out when it turns false.
   */
  signInAllowed: boolean;
  /** Null while signed out or loading. */
  sync: SyncStatus | null;
  signIn(method: SignInMethod): Promise<void>;
  /**
   * Creates the account and signs in, then sends the verification email (its failure does not fail the sign-up: it
   * is reported in the result, and Send again retries). `languageCode`: the email's language (`zh-CN` or `en`).
   */
  signUp(email: string, password: string, languageCode?: string): Promise<SignUpResult>;
  /** The signed-in account's unconfirmed email, or null (see VerifyState). */
  verify: VerifyState | null;
  /** The card's one-time news (confirmed, email changed), or null. */
  notice: AccountNotice | null;
  dismissNotice(): void;
  /**
   * Sends the verification link again (to the pending new address while a change of address waits). Rejects with
   * AuthError ('too-many-requests' also holds Send again for 5 minutes; 'unknown' while the cooldown runs).
   */
  sendVerification(languageCode?: string): Promise<void>;
  /**
   * Asks Firebase whether the email is confirmed now (reload). Resolves true when it is (the ID token is then
   * refreshed, so Firestore sees the claim, and sync starts), false when not yet. A session the email change ended
   * signs out (with the `emailChanged` notice). Rejects with AuthError (network).
   */
  checkVerified(): Promise<boolean>;
  /** Re-authenticates with `password`, then emails a link to `newEmail` (verifyBeforeUpdateEmail). */
  changeEmail(newEmail: string, password: string, languageCode?: string): Promise<void>;
  /** "Keep the old email": forgets the pending change of address on this device. */
  keepOldEmail(): void;
  /** Stops sync, then signs out. Data on the device stays. */
  signOut(): Promise<void>;
  sendPasswordReset(email: string): Promise<void>;
  syncNow(): Promise<void>;
  /**
   * Deletes the account and its synced data: re-authenticates with `password`, stops sync, calls the
   * backend's DELETE /api/v1/account with a fresh ID token, forgets this account's sync history, and
   * signs out. Data on the device stays. On failure nothing is deleted locally and sync resumes.
   */
  deleteAccount(password: string): Promise<void>;
  /**
   * The offer to delete an account that was signed out because Under 13 was picked while it was signed in
   * (FOLLOW-UP item 2, John 2026-11-02), or null. Recorded only when the sign-in gate went from open to closed
   * while that account was signed in, in this run of the provider; never for a session restored, or a sign-in
   * completed, while the gate was already closed (the gate is also closed while the age is unknown, e.g. after a
   * reinstall: security review 4, S4-3). It is kept on the device (it survives a restart) until the user deletes
   * the account, picks "Not now", or signs in again. `email` is the account's, for the re-auth.
   */
  under13Offer: { email: string } | null;
  /**
   * Deletes the offered account while sign-in is off: re-authenticates first (signs in again with the offered
   * email and `password`, with no sync engine started), checks it is the same account (uid), calls the backend's
   * DELETE /api/v1/account with a fresh ID token, forgets the account's sync history and signs out. Clears the offer
   * only on success. On any failure nothing is deleted locally, the user ends signed out, the offer stays, and it
   * rejects with AuthError ('not-allowed' when there is no offer).
   */
  deleteOfferedAccount(password: string): Promise<void>;
  /** "Not now": drops the offer (the account and its synced data stay on the server). */
  dismissUnder13Offer(): void;
}
