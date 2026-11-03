// A fake AuthBackend that verifies emails (email verification tests): `server` is what Firebase holds; reload()
// copies it into the session's user. By default that fires no auth-state event; with `reloadNotifies` it notifies the
// listeners with the reloaded user before resolving, as the Firebase SDK's reload does (through onIdTokenChanged).
import { VERIFY_SHIPPED_AT } from '../AccountProvider';
import { AuthError, type AuthBackend, type AuthUser, type EmailActionOptions } from '../types';

export const NEW_ACCOUNT_AT = VERIFY_SHIPPED_AT + 86_400_000;

export interface VerifyFake extends AuthBackend {
  emit(user: AuthUser | null): void;
  log: string[];
  /** What the server holds: reload() copies it into the session's user. */
  server: { emailVerified: boolean; sessionGone: boolean };
  sendFails: AuthError | null;
  /** reload() notifies the listeners with the reloaded user before it resolves (the SDK's behaviour). */
  reloadNotifies: boolean;
  /** Runs at the start of reload() (after it is logged): e.g. the SDK signing itself out, or another tab switching. */
  onReload: (() => void) | null;
  /** getIdToken(true) rejects with this (logged as `token:forced:failed`). */
  refreshFails: AuthError | null;
}

export function verifyingAuth(initial: AuthUser | null): VerifyFake {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const log: string[] = [];
  const emit = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const fake: VerifyFake = {
    emit,
    log,
    server: { emailVerified: initial?.emailVerified === true, sessionGone: false },
    sendFails: null,
    reloadNotifies: false,
    onReload: null,
    refreshFails: null,
    verifiesEmail: true,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m) {
      const u = { uid: m.email.split('@')[0]!, email: m.email, emailVerified: fake.server.emailVerified, createdAt: NEW_ACCOUNT_AT };
      emit(u);
      return u;
    },
    async signUp(email) {
      fake.server.emailVerified = false;
      const u = { uid: email.split('@')[0]!, email, emailVerified: false, createdAt: NEW_ACCOUNT_AT };
      emit(u);
      return u;
    },
    async signOut() {
      log.push('signOut');
      emit(null);
    },
    async sendPasswordReset() {},
    async reauthenticate(m) {
      log.push(`reauth:${m.email}`);
      if (m.password !== 'pw') throw new AuthError('wrong-credentials');
    },
    async getIdToken(force) {
      if (force && fake.refreshFails) {
        log.push('token:forced:failed');
        throw fake.refreshFails;
      }
      log.push(force ? 'token:forced' : 'token');
      return user ? `token-${user.uid}` : null;
    },
    async reload() {
      log.push('reload');
      fake.onReload?.();
      if (fake.server.sessionGone) throw new AuthError('requires-recent-login', undefined, { code: 'auth/user-token-expired' });
      if (!user) return null;
      // reload() updates the user in place; the SDK then notifies the ID-token listeners before resolving.
      user = { ...user, emailVerified: fake.server.emailVerified };
      if (fake.reloadNotifies) {
        await Promise.resolve();
        emit(user);
        // Resolves a little later, so anything the notification set off has run by then.
        await new Promise((r) => setTimeout(r, 0));
      }
      return user;
    },
    async sendEmailVerification(options: EmailActionOptions) {
      log.push(`send:${options.languageCode}:${options.url}`);
      if (fake.sendFails) throw fake.sendFails;
    },
    async verifyBeforeUpdateEmail(newEmail: string, options: EmailActionOptions) {
      log.push(`change:${newEmail}:${options.languageCode}`);
      if (fake.sendFails) throw fake.sendFails;
    },
  };
  return fake;
}

export const unconfirmed = (uid: string, createdAt = NEW_ACCOUNT_AT): AuthUser => ({ uid, email: `${uid}@example.com`, emailVerified: false, createdAt });
