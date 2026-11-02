// The auth layer's contracts (R-6b, orchestrator-owned). Email and password today; Google and Apple
// plug in later as new SignInMethod kinds, with no change to the account provider or the UI shape.
import type { SyncStatus } from '../sync/types';

export interface AuthUser {
  uid: string;
  email: string | null;
}

export type AuthErrorKind =
  | 'invalid-email'
  | 'wrong-credentials' // wrong password, unknown email or a disabled account: one message, no enumeration
  | 'email-in-use'
  | 'weak-password'
  | 'too-many-requests'
  | 'network'
  | 'requires-recent-login'
  | 'unknown';

export class AuthError extends Error {
  readonly kind: AuthErrorKind;
  constructor(kind: AuthErrorKind, message?: string, options?: { cause?: unknown }) {
    super(message ?? `auth ${kind}`, options);
    this.name = 'AuthError';
    this.kind = kind;
  }
}

/** How to sign in. Later: `{ kind: 'google' }`, `{ kind: 'apple' }`. */
export type SignInMethod = { kind: 'password'; email: string; password: string };

/** Firebase Auth behind a small interface (firebaseAuth.ts), so tests and new providers swap it. */
export interface AuthBackend {
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

/** What `useAccount()` returns. Every action rejects with AuthError on failure. */
export interface AccountState {
  status: AccountStatus;
  user: AuthUser | null;
  /** Null while signed out or loading. */
  sync: SyncStatus | null;
  signIn(method: SignInMethod): Promise<void>;
  signUp(email: string, password: string): Promise<void>;
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
}
