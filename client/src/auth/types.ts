// The auth layer's contracts (R-6b, orchestrator-owned). Email and password today; Google and Apple
// plug in later as new SignInMethod kinds, with no change to the account provider or the UI shape.
import type { SyncStatus } from '../sync/types';

/** A way an account signs in (Firebase's providerData, reduced to the ones the app knows). */
export type AuthProviderKind = 'password' | 'google';

export interface AuthUser {
  uid: string;
  email: string | null;
  /**
   * The sign-in methods linked to the account, when known (the Firebase adapter always sets it). Absent means
   * "password" for every decision (older test fakes and stored state predate Google sign-in).
   */
  providers?: readonly AuthProviderKind[];
}

/** How the account proves itself again (delete): a password, unless it has none and has Google. */
export function reauthKindFor(user: Pick<AuthUser, 'providers'> | null | undefined): AuthProviderKind {
  const p = user?.providers;
  if (!p || p.length === 0 || p.includes('password')) return 'password';
  return p.includes('google') ? 'google' : 'password';
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
  | 'cancelled' // Google's window was closed, a newer press replaced it, or the person cancelled the wait
  | 'popup-blocked' // the browser blocked Google's window
  | 'account-exists' // the Google email already has an account that signs in another way (no linking)
  | 'unknown';

export class AuthError extends Error {
  readonly kind: AuthErrorKind;
  /** The Firebase Auth code (`auth/...`) it was mapped from, when there was one. */
  readonly code?: string;
  /** 'account-exists' only: the email Google reported, to fill in the email form. */
  readonly email?: string;
  constructor(kind: AuthErrorKind, message?: string, options?: { cause?: unknown; code?: string; email?: string }) {
    super(message ?? `auth ${kind}`, options);
    this.name = 'AuthError';
    this.kind = kind;
    if (options?.code !== undefined) this.code = options.code;
    if (options?.email !== undefined) this.email = options.email;
  }
}

/**
 * How to sign in with the AuthBackend's `signIn`: email and password. Google (web only, behind `EXPO_PUBLIC_GOOGLE_SIGN_IN`) opens Google's window; a first Google
 * sign-in creates the account. `loginHint` pre-selects that Google account. `existingOnly`: never create one (the
 * Under 13 offer's re-auth): a Google account with no app account yet is refused with 'wrong-credentials', and the
 * account Firebase just created for it is deleted again. Later: `{ kind: 'apple' }`.
 */
export type SignInMethod = { kind: 'password'; email: string; password: string };

/** Google's window (see SignInMethod's note). The backend's optional `signInWithGoogle` runs it. */
export interface GoogleSignIn {
  kind: 'google';
  loginHint?: string;
  existingOnly?: boolean;
}

/** Every way the account provider signs in. */
export type AccountSignIn = SignInMethod | GoogleSignIn;

/** What proves the account again before a delete: its password, or Google's window (a Google-only account). */
export type DeleteProof = string | { kind: 'google' };

/** Options of a delete. */
export interface DeleteOptions {
  /**
   * Google proof only: abort it (an AbortController's signal) while Google's window is open to give up (the person
   * pressed Cancel). The delete then rejects 'cancelled' at once and deletes nothing; it no longer holds the provider
   * (sync, the gate's sign-out, "Not now" and another delete go on), and the window's late result is ignored (a late
   * sign-in of the offered delete's re-auth is signed out by the closed gate). A signal without events (a plain
   * `{ aborted }`) is read once the re-auth resolves instead. Once `onProven` has been called it has no effect
   * (security review G-2).
   */
  signal?: { readonly aborted: boolean; addEventListener?(type: 'abort', listener: () => void): void; removeEventListener?(type: 'abort', listener: () => void): void };
  /** Called once the account is proven (and not aborted), just before the delete proper starts. */
  onProven?(): void;
}

/** Firebase Auth behind a small interface (firebaseAuth.ts), so tests and new providers swap it. */
export interface AuthBackend {
  currentUser(): AuthUser | null;
  /** Calls back with the restored user (or null) once known, then on every change. Returns the unsubscribe. */
  onAuthStateChanged(listener: (user: AuthUser | null) => void): () => void;
  signIn(method: SignInMethod): Promise<AuthUser>;
  /** Google's window (GoogleSignIn). Optional: a backend without it refuses Google sign-in. */
  signInWithGoogle?(options?: Omit<GoogleSignIn, 'kind'>): Promise<AuthUser>;
  signUp(email: string, password: string): Promise<AuthUser>;
  signOut(): Promise<void>;
  /** Resolves whether or not an account uses the email (no enumeration); rejects only on invalid-email, network or too-many-requests. */
  sendPasswordReset(email: string): Promise<void>;
  /**
   * Proves the signed-in user again (for delete); afterwards the ID token carries a fresh auth_time. Google: the
   * window must sign in to the same account, or it rejects 'wrong-credentials' (Firebase's user-mismatch).
   */
  reauthenticate(method: SignInMethod): Promise<void>;
  /** Proves the signed-in user again through Google's window; another Google account rejects 'wrong-credentials'. */
  reauthenticateWithGoogle?(loginHint?: string): Promise<void>;
  /** The signed-in user's ID token, or null when signed out. */
  getIdToken(forceRefresh?: boolean): Promise<string | null>;
}

export type AccountStatus = 'loading' | 'signedOut' | 'signedIn';

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
  signIn(method: AccountSignIn): Promise<void>;
  signUp(email: string, password: string): Promise<void>;
  /** Stops sync, then signs out. Data on the device stays. */
  signOut(): Promise<void>;
  sendPasswordReset(email: string): Promise<void>;
  syncNow(): Promise<void>;
  /**
   * Deletes the account and its synced data: re-authenticates with `proof` (the password, or Google's window for an
   * account with Google and no password: `reauthKindFor(user)`), stops sync, calls the backend's DELETE
   * /api/v1/account with a fresh ID token, forgets this account's sync history, and signs out. Data on the device
   * stays. On failure nothing is deleted locally and sync resumes. A Google proof for an account without Google is
   * refused before anything happens.
   */
  deleteAccount(proof: DeleteProof, options?: DeleteOptions): Promise<void>;
  /**
   * The offer to delete an account that was signed out because Under 13 was picked while it was signed in
   * (FOLLOW-UP item 2, John 2026-11-02), or null. Recorded only when the sign-in gate went from open to closed
   * while that account was signed in, in this run of the provider; never for a session restored, or a sign-in
   * completed, while the gate was already closed (the gate is also closed while the age is unknown, e.g. after a
   * reinstall: security review 4, S4-3). It is kept on the device (it survives a restart) until the user deletes
   * the account, picks "Not now", or signs in again. `email` is the account's, for the re-auth.
   */
  under13Offer: { email: string; /** Absent: a password. */ method?: AuthProviderKind } | null;
  /**
   * Deletes the offered account while sign-in is off: re-authenticates first (signs in again with the offered
   * email and the password, or for an offer whose `method` is 'google' through Google's window with `existingOnly`;
   * the proof must match the offer's method; with no sync engine started), checks it is the same account (uid), calls the backend's
   * DELETE /api/v1/account with a fresh ID token, forgets the account's sync history and signs out. Clears the offer
   * only on success. On any failure nothing is deleted locally, the user ends signed out, the offer stays, and it
   * rejects with AuthError ('not-allowed' when there is no offer).
   */
  deleteOfferedAccount(proof: DeleteProof, options?: DeleteOptions): Promise<void>;
  /** "Not now": drops the offer (the account and its synced data stay on the server). */
  dismissUnder13Offer(): void;
}
