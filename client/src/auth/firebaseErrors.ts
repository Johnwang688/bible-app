// Firebase Auth errors → AuthError (R-6b). Matched by the `code` string, not by class: bundlers and
// test runners can load more than one copy of the SDK, and an error from the other copy fails
// `instanceof`.
import { AuthError, type AuthErrorKind } from './types';

const KINDS: Record<string, AuthErrorKind> = {
  // One kind for every "who are you" failure, so nothing reveals whether an email has an account.
  'auth/invalid-credential': 'wrong-credentials',
  'auth/invalid-login-credentials': 'wrong-credentials',
  'auth/wrong-password': 'wrong-credentials',
  'auth/user-not-found': 'wrong-credentials',
  'auth/user-disabled': 'wrong-credentials',
  'auth/user-mismatch': 'wrong-credentials',
  'auth/invalid-email': 'invalid-email',
  'auth/missing-email': 'invalid-email',
  'auth/email-already-in-use': 'email-in-use',
  'auth/weak-password': 'weak-password',
  'auth/password-does-not-meet-requirements': 'weak-password',
  'auth/too-many-requests': 'too-many-requests',
  'auth/network-request-failed': 'network',
  'auth/requires-recent-login': 'requires-recent-login',
};

/** The error's Firebase Auth code (`auth/...`), or undefined. */
export function firebaseAuthCode(e: unknown): string | undefined {
  if (typeof e !== 'object' || e === null) return undefined;
  const code = (e as { code?: unknown }).code;
  return typeof code === 'string' && code.startsWith('auth/') ? code : undefined;
}

export function mapFirebaseAuthError(e: unknown): AuthError {
  if (e instanceof AuthError) return e;
  const code = firebaseAuthCode(e);
  const kind = (code !== undefined ? KINDS[code] : undefined) ?? 'unknown';
  return new AuthError(kind, code !== undefined ? `auth ${kind} (${code})` : undefined, { cause: e });
}
