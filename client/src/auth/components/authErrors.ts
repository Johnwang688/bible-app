// Which catalogue message an auth failure shows, and whether it belongs under a field or above the button.
import type { MessageKey } from '../../i18n/translate';
import { AuthError } from '../types';

/** Where a message is drawn. */
export type ErrorPlace = 'email' | 'password' | 'form';

export interface ShownError {
  key: MessageKey;
  place: ErrorPlace;
}

/** Something@something.something: the check before any request (the server has the last word). */
const EMAIL_SHAPE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
export const isEmailShaped = (email: string) => EMAIL_SHAPE.test(email);

/** Fewer than this many characters is too short for a new password. */
export const MIN_PASSWORD_LENGTH = 8;

function kindOf(e: unknown): AuthError['kind'] {
  if (e instanceof AuthError) return e.kind;
  const kind = typeof e === 'object' && e !== null ? (e as { kind?: unknown }).kind : undefined;
  return typeof kind === 'string' ? (kind as AuthError['kind']) : 'unknown';
}

/** A failed sign-in, sign-up or reset. */
export function authError(e: unknown): ShownError {
  switch (kindOf(e)) {
    case 'invalid-email':
      return { key: 'auth.error.invalidEmail', place: 'email' };
    case 'weak-password':
      return { key: 'auth.signUp.tooShort', place: 'password' };
    case 'wrong-credentials':
      return { key: 'auth.error.wrongCredentials', place: 'form' };
    case 'email-in-use':
      return { key: 'auth.error.emailInUse', place: 'form' };
    case 'too-many-requests':
      return { key: 'auth.error.tooManyRequests', place: 'form' };
    case 'network':
      return { key: 'auth.error.network', place: 'form' };
    default:
      return { key: 'auth.error.unknown', place: 'form' };
  }
}

/** A failed delete: a wrong password, no connection, or anything else. */
export function deleteError(e: unknown): MessageKey {
  switch (kindOf(e)) {
    case 'wrong-credentials':
      return 'delete.wrongPassword';
    case 'network':
      return 'delete.error.network';
    default:
      return 'delete.error.server';
  }
}
