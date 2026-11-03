// The account provider (R-6b): who is signed in, and the sync engine that runs for them.
//
// Concurrency: auth callbacks, user actions and AppState events arrive at any time. Every engine
// stop/start goes through one promise chain (`reconcile`), so at most one engine runs and a new one
// starts only after the previous one's stop() has resolved. An action that must keep sync off while it
// works (sign-out, delete) takes a hold; while any hold is taken `reconcile` stops the engine and
// starts none, whatever the auth callbacks say. Unmounting releases the auth, AppState and `online`
// listeners and stops the engine.
//
// A delete whose request may have reached the server (it failed with `network`: a timeout or a lost
// connection) is ambiguous: the server may have wiped the account, or be wiping it still. Resuming
// sync then would re-upload what the server just deleted. So the account goes "unconfirmed": its
// sync stays stopped (status `error`) until a probe settles it. The probe forces a token refresh
// (it fails once the user is deleted or its tokens are revoked: the delete is done; a failure that does
// not prove that, such as a transient token-service error, leaves the account unconfirmed) and compares the
// remote with what it held before the request (emptied: the delete reached the server). The probe
// runs right after the failure and again on every syncNow (foreground, `online`) until it settles.
//
// The sign-in gate (first run's Under 13 age choice) turns sign-in and sync off. While it is closed,
// `target()` wants no engine (it reads the gate live, so no reconcile step on the chain can start one),
// signIn/signUp/sendPasswordReset reject with 'not-allowed' before reaching the auth backend, and any
// signed-in user (a restored session, one signed in when the gate closes, or one whose sign-in raced the
// gate) is signed out through the normal path once in-flight sign-outs and deletes have settled: the
// engine stops on the chain first, then auth signs out. Opening the gate again does nothing by itself.
//
// The Under 13 offer (FOLLOW-UP item 2, John 2026-11-02): when the gate goes from open to closed while an account
// with an email is signed in (Under 13 picked while it was signed in), and the gate then signs that account out, the
// provider records an offer to delete it (under13Offer.ts; it survives a restart). The gate has other reasons to be
// closed (the first-run state unknown: an adult whose Keychain session survived a reinstall), so a session restored,
// or a sign-in completed, with the gate already closed is signed out with no offer unless a stored closing names
// that account (below), and a gate closing never seen open records none (security review 4, S4-3). An ordinary
// sign-out, a delete, or Under 13 picked while signed out records nothing; any sign-in or sign-up drops it.
//
// The closing (security review 5, S5-6; Sol round 2, U13-R2-1): "the gate closed on this signed-in account" is stored
// (under13Offer.ts, `account.under13Closing`) in the same turn as the gate change, because the gate's sign-out first
// waits for in-flight work and the engine's stop (the sync run in flight: seconds), and may fail. It ends in the offer
// when that account is signed out behind the closed gate: by enforceGate's own sign-out, or as auth reports it
// (setUser(null) replacing that account, or nobody at the launch's FIRST auth report: the app was closed after auth
// persisted the gate's sign-out but before the offer was written; a later null report that replaces nobody records
// nothing, Sol AUTH-R1-1). So a close of the app before the sign-out (the next launch restores the session behind the
// closed gate and signs it out) or right after it still records the offer. It is dropped when the gate opens again
// (also when the provider attaches with the gate open), when any sign-in or sign-up resolves, when an ordinary
// sign-out starts (the person ended the closing themselves: a later restore of that session behind the closed gate
// records nothing), when the account is deleted, and when it becomes the offer. Another account signed out behind
// the closed gate leaves it alone. The stored value is the truth and is read fresh wherever it decides something, so
// an ordinary sign-out in another tab (another provider over the same device store) retires this tab's closing too
// (AUTH-R1-2). A device store that cannot be read, or that missed this provider's last write of it, falls back to
// the provider's own copy: it then holds for this run only.
//
// Deliberately skipped: a session restored while the age is unknown, whose user then picks Under 13 in the intro.
// The gate was never open for them, so they are signed out with no offer: the account and its synced data stay on
// the server (as for any sign-out) and the card does not offer to delete them. Telling that apart from an adult's
// restored session would need the provider to know why the gate is closed; instead a parallel native change wipes
// a reinstall's Keychain session, so this restored-session case should not arise from a reinstall.
// `deleteOfferedAccount` runs while sign-in is off, so it signs in again itself (the delete endpoint needs a
// recent sign-in) straight through the auth backend, bypassing the gate check. It runs as a hold, like
// `deleteAccount`: no engine starts during it whatever the gate or the auth callbacks say, enforceGate waits for
// it instead of signing out underneath it, and the view keeps showing "signed out" while the re-auth is signed
// in (the flow's own step, not a sign-in the person made). It always ends signed out.
//
// Google (GOOGLE, board 11-03 row 7; web only, behind EXPO_PUBLIC_GOOGLE_SIGN_IN): a Google sign-in is
// `signIn({ kind: 'google' })`, the same path as an email sign-in: the gate check before (nothing reaches Google while
// sign-in is off), and afterSignIn, the offer and the closing dropped after, as for any sign-in. A first Google sign-in
// creates the account (no separate sign-up). An account with Google and no password proves itself for a delete through
// Google's window instead of a password (`reauthKindFor`); its closing and offer carry `method: 'google'`, and the
// offered delete's re-auth then uses Google's window with `existingOnly` (it never creates an account, and must land
// on the offered uid, like the password re-auth). While Google's window is open the person can give up (`signal`):
// the delete rejects 'cancelled' at once, before the engine stops or anything is sent, and stops holding the provider
// (security review G-2); the window's late result is ignored. The offered delete does not start while a sign-in waits
// on the backend (G-3).
//
// Email verification (11-03, prototype design/proposed/r6b-verify.html): with a backend that verifies emails (Firebase),
// sync runs only for a user whose email is confirmed. `target()` wants no engine while `emailVerified` is anything but
// true, so the Firestore rules (which refuse unverified tokens) never see a request from an unconfirmed account. Sign-up
// sends the verification email; Send again, I've confirmed (checkVerified: reload, then a forced token refresh so
// Firestore gets the claim) and Change email (verifyBeforeUpdateEmail) are actions here. The app comes to the front:
// an unconfirmed account checks once. The cooldown and a pending change of address are kept per uid on the device
// (verifyStore.ts); an ordinary sign-out forgets the pending address. A check that finds the session ended (an email
// change revokes every session, and so does a delete; decided on the error code alone, since for some codes the SDK
// has signed out inside reload already) drops the account's record, shows the "email changed" notice when a change
// was pending, and signs that account out if auth still has it (never another account another tab switched to).
// Delete works as before, except that it reads nothing remote for an unconfirmed account (the rules refuse it).
//
// A confirmation is not enough to start the engine: the claim lives in the ID token, and the SDK's reload() ends by
// notifying the auth listeners, so setUser sees the account confirmed while its token still says email_verified:
// false. An account that became confirmed in this run is held (`tokenStale`: from the start of a check, or from
// setUser seeing it go unconfirmed → confirmed) until a forced refresh (`getIdToken(true)`) has succeeded for it
// after that; `target()` wants no engine meanwhile. A failed refresh (offline) keeps the hold, and the next check
// (I've confirmed, the app coming to the front, the sheet's timer, syncNow) refreshes again instead of answering
// true. A confirmation seen outside a check (another tab) starts one. An account already confirmed when first
// reported (a restored session, a sign-in) is not held.
//
// Google meets email verification: Firebase marks a Gmail address that signs in with Google verified (a trusted
// provider), and the popup's new ID token already carries email_verified: true. So a Google sign-in reports the user
// confirmed and never sees "Confirm your email". Sync follows the rules above unchanged: confirmed when first reported,
// it is not held; landing on an account this run saw unconfirmed (the same uid), it is held by `tokenStale` until a
// forced refresh succeeds (googleVerify.unit.test.tsx). A Google sign-in that came back unconfirmed would be held like
// any other (fail closed). Not here yet: the backend "seal" that ends a squatter's older sessions (r6b-verify.html),
// which must land before the flag is turned on.
//
// The injected dependencies are read once, when the provider mounts; the defaults (Firebase, device
// storage, the Firestore remote, the account API) are created on first use, never at import.
import { createContext, useContext, useEffect, useMemo, useState, type ReactNode } from 'react';
import { AppState, Platform } from 'react-native';

import { getApiBaseUrl } from '../api/config';
import { getStorage, type Storage } from '../storage/storage';
import { clearSyncState, createSyncEngine, getDeviceId } from '../sync/engine';
import { DEFAULT_DOMAINS } from '../sync/registry';
import type { SyncDomains } from '../sync/shapes';
import type { RemoteStore, SyncEngine, SyncStatus } from '../sync/types';
import { createAccountApi } from './accountApi';
import { firebaseAuthCode } from './firebaseErrors';
import { syncStateKey } from '../sync/state';
import { SIGN_IN_OFF, type SignInGate } from './signInGate';
import {
  AuthError,
  reauthKindFor,
  type AccountNotice,
  type AccountState,
  type AccountStatus,
  type AuthBackend,
  type AuthProviderKind,
  type AccountSignIn,
  type AuthUser,
  type DeleteOptions,
  type DeleteProof,
  type EmailActionOptions,
  type SignUpResult,
  type VerifyState,
} from './types';
import { clearVerifyRecord, readVerifyRecord, RESEND_COOLDOWN_MS, TOO_MANY_HOLD_MS, writeVerifyRecord } from './verifyStore';
import {
  clearUnder13Closing,
  clearUnder13Offer,
  loadUnder13Closing,
  readUnder13Offer,
  recordUnder13Closing,
  recordUnder13Offer,
  type Under13Closing,
  type Under13Offer,
} from './under13Offer';

export interface AccountProviderProps {
  children?: ReactNode;
  /** Default: Firebase Auth (firebaseAuth.ts over firebaseApp.ts). */
  auth?: AuthBackend;
  /** Default: the device store (storage.ts `getStorage`). */
  storage?: Storage;
  /** Default: the Firestore remote for that user. */
  remoteFor?: (uid: string) => RemoteStore;
  /** Default: registry.ts `DEFAULT_DOMAINS`. */
  domains?: SyncDomains;
  /** Default: the backend's DELETE /api/v1/account at `getApiBaseUrl()`. */
  deleteAccountRequest?: (idToken: string) => Promise<void>;
  /**
   * Whether sign-in and sync are allowed on this device (first run's Under 13 age choice turns them off).
   * Default: `SIGN_IN_OFF` (fail closed). `_layout.tsx` passes R-7a's `signInGateFor()` once PR #33 merges.
   */
  signInGate?: SignInGate;
  /** Where the verification link continues to. Default: this web origin's `/me?verified=1`, else the web app's. */
  continueUrl?: string;
  /** The client clock (ms). Default: Date.now. */
  now?: () => number;
}

/** The web app's address, for a link sent from a native build (it has no origin of its own). */
const WEB_APP_CONTINUE_URL = 'https://bible-app-492520.web.app/me?verified=1';

/**
 * Accounts made before verification shipped were never sent a link: their card says "Sync is paused". Accounts made
 * after it by this app's sign-up are marked fresh on that device; an account seen first on another device after the
 * cutoff counts as new. The client ships 11-03 (CST); midnight after that, in UTC.
 */
export const VERIFY_SHIPPED_AT = Date.parse('2026-11-04T06:00:00Z');

function defaultContinueUrl(): string {
  if (Platform.OS === 'web' && typeof window !== 'undefined') {
    const origin = window.location?.origin;
    if (typeof origin === 'string' && /^https?:\/\//.test(origin)) return `${origin}/me?verified=1`;
  }
  return WEB_APP_CONTINUE_URL;
}

/** Firebase's language code for an email in the app's language. */
export function emailLanguage(locale: string | undefined): string {
  return locale === 'zh-Hans' ? 'zh-CN' : 'en';
}

// ---- dependencies --------------------------------------------------------------------------------

interface Deps {
  /** The auth backend, or null when the default one could not be created. */
  auth(): AuthBackend | null;
  storage(): Storage;
  remoteFor(uid: string): RemoteStore;
  domains: SyncDomains;
  deleteRequest(idToken: string): Promise<void>;
  gate: SignInGate;
  continueUrl(): string;
  now(): number;
}

function createDeps(p: AccountProviderProps): Deps {
  let auth: AuthBackend | null | undefined = p.auth;
  let storage: Storage | undefined = p.storage;
  let deleteRequest = p.deleteAccountRequest;
  return {
    auth() {
      if (auth === undefined) {
        try {
          // Loaded on first use so tests and tools that inject a backend never load Firebase.
          /* eslint-disable @typescript-eslint/no-require-imports */
          const { getFirebaseAuth } = require('./firebaseApp') as typeof import('./firebaseApp');
          const { createFirebaseAuthBackend } = require('./firebaseAuth') as typeof import('./firebaseAuth');
          /* eslint-enable @typescript-eslint/no-require-imports */
          auth = createFirebaseAuthBackend(getFirebaseAuth());
        } catch (e) {
          console.warn('[account] Firebase Auth is unavailable; staying signed out.', e);
          auth = null;
        }
      }
      return auth;
    },
    storage() {
      storage ??= getStorage();
      return storage;
    },
    remoteFor(uid) {
      if (p.remoteFor) return p.remoteFor(uid);
      /* eslint-disable @typescript-eslint/no-require-imports */
      const { getFirebaseDb } = require('./firebaseApp') as typeof import('./firebaseApp');
      const { createFirestoreRemote } = require('../sync/firestoreRemote') as typeof import('../sync/firestoreRemote');
      /* eslint-enable @typescript-eslint/no-require-imports */
      return createFirestoreRemote(getFirebaseDb(), uid);
    },
    domains: p.domains ?? DEFAULT_DOMAINS,
    gate: p.signInGate ?? SIGN_IN_OFF,
    continueUrl: () => p.continueUrl ?? defaultContinueUrl(),
    now: p.now ?? (() => Date.now()),
    deleteRequest(idToken) {
      if (!deleteRequest) {
        const api = createAccountApi({ baseUrl: getApiBaseUrl() });
        deleteRequest = (token) => api.deleteAccount(token);
      }
      return deleteRequest(idToken);
    },
  };
}

// ---- the controller (no React) -------------------------------------------------------------------

interface View {
  status: AccountStatus;
  user: AuthUser | null;
  signInAllowed: boolean;
  under13Offer: AccountState['under13Offer'];
  verify: VerifyState | null;
  notice: AccountNotice | null;
}

interface Listeners {
  onView(view: View): void;
  onSync(sync: SyncStatus | null): void;
}

type Actions = Pick<
  AccountState,
  | 'signIn'
  | 'signUp'
  | 'signOut'
  | 'sendPasswordReset'
  | 'syncNow'
  | 'deleteAccount'
  | 'deleteOfferedAccount'
  | 'dismissUnder13Offer'
  | 'sendVerification'
  | 'checkVerified'
  | 'changeEmail'
  | 'keepOldEmail'
  | 'dismissNotice'
>;

interface Controller {
  /** Starts listening (auth, AppState, `online`). Returns the detach, which also stops sync. */
  attach(listeners: Listeners): () => void;
  actions: Actions;
}

function isAuthError(e: unknown): e is AuthError {
  if (e instanceof AuthError) return true;
  return typeof e === 'object' && e !== null && (e as { name?: unknown }).name === 'AuthError' && typeof (e as { kind?: unknown }).kind === 'string';
}

function asAuthError(e: unknown): AuthError {
  return isAuthError(e) ? e : new AuthError('unknown', undefined, { cause: e });
}

/**
 * Firebase codes of a refresh failure that prove the account is gone or its tokens revoked. Anything else
 * (auth/internal-error, auth/quota-exceeded, auth/network-request-failed, a non-Firebase exception) says
 * nothing about the account: the delete stays unconfirmed and is probed again later.
 */
const ACCOUNT_GONE_CODES: readonly string[] = ['auth/user-not-found', 'auth/user-disabled', 'auth/user-token-expired', 'auth/invalid-user-token'];

/**
 * For an AuthError without a Firebase code (another AuthBackend, or a test fake), the kinds that stand
 * for those codes. The Firebase adapter only gives these kinds from a code, so a code always decides there.
 * Never 'unknown': that is the catch-all for failures that prove nothing.
 */
const ACCOUNT_GONE_KINDS: readonly AuthError['kind'][] = ['wrong-credentials', 'requires-recent-login'];

/** Whether a forced token refresh failed in a way that proves the account is gone or its tokens revoked. */
function provesAccountGone(e: unknown): boolean {
  const code = isAuthError(e) ? e.code : firebaseAuthCode(e);
  if (code !== undefined) return ACCOUNT_GONE_CODES.includes(code);
  return isAuthError(e) && ACCOUNT_GONE_KINDS.includes(e.kind);
}

/** The `sub` claim of a JWT, or null when the token is not a decodable JWT. */
export function tokenSubject(token: string): string | null {
  const parts = token.split('.');
  const payload = parts[1];
  const atob = (globalThis as { atob?: (s: string) => string }).atob;
  if (parts.length !== 3 || !payload || typeof atob !== 'function') return null;
  try {
    const b64 = payload.replace(/-/g, '+').replace(/_/g, '/');
    const json = atob(b64 + '='.repeat((4 - (b64.length % 4)) % 4));
    const sub = (JSON.parse(json) as { sub?: unknown }).sub;
    return typeof sub === 'string' ? sub : null;
  } catch {
    return null;
  }
}

/** Whether the remote holds any of the account's documents (the small collections first; items only if they are empty). */
async function remoteHasData(remote: RemoteStore): Promise<boolean> {
  const [devices, settings] = await Promise.all([remote.pullDevices(), remote.pullSettings()]);
  if (devices.length > 0 || settings.length > 0) return true;
  return (await remote.pullItems(null)).items.length > 0;
}

/** What a probe after an ambiguous delete found. */
type ProbeOutcome =
  | 'alive' // the account exists and its data is still there: sync may resume
  | 'deleted' // the token refresh failed as for a deleted account: the delete is done
  | 'wiped' // the account still refreshes but its data is gone: the delete reached the server
  | 'unreachable' // the probe could not tell (offline): ask again later
  | 'switched'; // a different user (or none) is signed in now: nothing to decide for this one

/** Whether the gate allows sign-in now. Fails closed: a gate that throws keeps sign-in and sync off. */
function isAllowed(gate: SignInGate): boolean {
  try {
    return gate.allowed();
  } catch (e) {
    console.warn('[account] the sign-in gate failed; treating sign-in as not allowed', e);
    return false;
  }
}

/** How many times the offered delete tries to sign its re-auth out before leaving it to enforceGate. */
const OFFER_SIGN_OUT_TRIES = 3;

function sameProviders(a: AuthUser, b: AuthUser): boolean {
  return (a.providers ?? []).join(',') === (b.providers ?? []).join(',');
}

function sameUser(a: AuthUser | null, b: AuthUser | null): boolean {
  return (
    a === b ||
    (a !== null &&
      b !== null &&
      a.uid === b.uid &&
      a.email === b.email &&
      sameProviders(a, b) &&
      a.emailVerified === b.emailVerified &&
      a.createdAt === b.createdAt)
  );
}

/** The sign-in that proves `email`'s account with `proof`. */
function proofMethod(proof: DeleteProof, email: string, existingOnly = false): AccountSignIn {
  if (typeof proof === 'string') return { kind: 'password', email, password: proof };
  return { kind: 'google', ...(email ? { loginHint: email } : {}), ...(existingOnly ? { existingOnly: true } : {}) };
}

function proofKind(proof: DeleteProof): AuthProviderKind {
  return typeof proof === 'string' ? 'password' : 'google';
}

/**
 * `p`, or a 'cancelled' rejection as soon as `signal` aborts (security review G-2: giving up must not wait for Google's
 * window). The late result of `p` is ignored.
 */
function abortable<T>(p: Promise<T>, signal: DeleteOptions['signal'], onAbandoned?: (late: Promise<T>) => void): Promise<T> {
  if (!signal || typeof signal.addEventListener !== 'function') return p;
  const cancelled = () => new AuthError('cancelled', 'the delete was cancelled');
  if (signal.aborted) {
    p.catch(() => undefined);
    onAbandoned?.(p);
    return Promise.reject(cancelled());
  }
  return new Promise<T>((resolve, reject) => {
    const onAbort = () => {
      p.catch(() => undefined);
      onAbandoned?.(p);
      reject(cancelled());
    };
    signal.addEventListener!('abort', onAbort);
    const off = () => signal.removeEventListener?.('abort', onAbort);
    p.then(
      (v) => {
        off();
        resolve(v);
      },
      (e: unknown) => {
        off();
        reject(e);
      },
    );
  });
}

/** Signs in through the backend: a password, or Google's window (refused by a backend without it). */
function backendSignIn(auth: AuthBackend, method: AccountSignIn): Promise<AuthUser> {
  if (method.kind === 'password') return auth.signIn(method);
  if (!auth.signInWithGoogle) return Promise.reject(new AuthError('unknown', 'Google sign-in is not available'));
  return auth.signInWithGoogle({
    ...(method.loginHint !== undefined ? { loginHint: method.loginHint } : {}),
    ...(method.existingOnly ? { existingOnly: true } : {}),
  });
}

/** Proves the signed-in user again: a password, or Google's window. */
function backendReauth(auth: AuthBackend, method: AccountSignIn): Promise<void> {
  if (method.kind === 'password') return auth.reauthenticate(method);
  if (!auth.reauthenticateWithGoogle) return Promise.reject(new AuthError('unknown', 'Google sign-in is not available'));
  return auth.reauthenticateWithGoogle(method.loginHint);
}

/** A copy of `u` with only its own fields (undefined ones left out). */
function copyUser(u: AuthUser): AuthUser {
  return {
    uid: u.uid,
    email: u.email,
    ...(u.providers ? { providers: [...u.providers] } : {}),
    ...(u.emailVerified !== undefined ? { emailVerified: u.emailVerified } : {}),
    ...(u.createdAt !== undefined ? { createdAt: u.createdAt } : {}),
  };
}

function sameVerify(a: VerifyState | null, b: VerifyState | null): boolean {
  return (
    a === b ||
    (a !== null && b !== null && a.kind === b.kind && a.sent === b.sent && a.resendAt === b.resendAt && a.pendingEmail === b.pendingEmail)
  );
}

function sameNotice(a: AccountNotice | null, b: AccountNotice | null): boolean {
  if (a === null || b === null) return a === b;
  return a.kind === b.kind && (a.kind !== 'emailChanged' || (b.kind === 'emailChanged' && a.email === b.email));
}

/** An ID token from a session that is gone (an email change or a delete revokes it): sign out. */
const SESSION_GONE_CODES: readonly string[] = ['auth/user-token-expired', 'auth/invalid-user-token', 'auth/user-not-found', 'auth/user-disabled'];

function createController(deps: Deps): Controller {
  let listeners: Listeners | null = null;
  /** Whether auth has reported at least once (until then the status is `loading`). */
  let known = false;
  /** The signed-in user as auth last reported it. */
  let user: AuthUser | null = null;
  /** Actions in progress that keep sync off (sign-out, delete). */
  let holds = 0;
  /** An account deleted on this device whose local sign-out failed: never sync it until it signs in afresh. */
  let blockedUid: string | null = null;
  /**
   * Every account whose delete succeeded (or was proven) on this device while the provider ran. Unlike
   * `blockedUid`, nothing lifts it (signing out lifts the block): a deleted uid never comes back, and the gate's
   * sign-out of a deleted account that is still signed in (its own sign-out failed) must not offer to delete it
   * again.
   */
  const deletedUids = new Set<string>();
  /** A delete (`deleteAccount` or `deleteOfferedAccount`) is running: a second one rejects. */
  let deleting = false;
  /** `deleteOfferedAccount` is running: its re-auth's user is not shown, and enforceGate leaves it alone. */
  let offerRun = false;
  /**
   * Sign-ins and sign-ups waiting on the backend (Google's window can stay open for minutes, with the sheet closed).
   * The offered delete refuses to start meanwhile: the sign-in would end the offer under it, and the delete would sign
   * the new session out (security review G-3).
   */
  let signingIn = 0;
  /** Counts every sign-in and sign-up the person starts (the abandoned re-auth below compares against it). */
  let signInGen = 0;
  /**
   * An offered delete given up while Google's window was open (security review delta D-1): until that window's late
   * result settles, whatever it signs in is the abandoned re-auth's, not a sign-in the person made. While it is pending
   * and no sign-in has started since (`gen`), nobody is shown signed in and no engine starts; when it settles, its
   * account is signed out (whether or not the gate reopened meanwhile).
   */
  let abandoned: { gen: number } | null = null;
  const abandonedNow = () => abandoned !== null && abandoned.gen === signInGen;
  /**
   * An account whose delete may have reached the server (see the header): sync stays off for it until
   * a probe settles it. `hadData`: whether the remote held anything before the request (null: unknown).
   */
  let unconfirmed: { uid: string; hadData: boolean | null; lastSyncedAt: number | null } | null = null;
  /** The probe in flight for `unconfirmed`, so concurrent syncNow calls share one. */
  let probing: Promise<void> | null = null;
  /** The last sync time of each uid's most recently stopped engine (shown while unconfirmed). */
  const lastSynced = new Map<string, number | null>();
  let running: { uid: string; engine: SyncEngine; unsubscribe: () => void } | null = null;
  /** Every engine stop/start runs on this chain, one step at a time. It never rejects. */
  let chain: Promise<void> = Promise.resolve();
  /** Sign-outs and deletes in progress (they hold sync off); syncNow waits for them to settle. */
  const busy = new Set<Promise<unknown>>();

  /** A run of `enforceGate` in progress, and whether another pass was asked for meanwhile. */
  let gateCheck: Promise<void> | null = null;
  let gateAgain = false;

  /** Whether the gate was open when last looked at (set on attach, updated on every gate change). */
  let gateWasOpen = false;
  /**
   * The closing (under13Offer.ts): the account that was signed in when the gate went from open to closed (Under 13
   * picked while signed in) and that the gate has not signed out yet, or null. Only the gate's sign-out of this
   * account records an Under 13 offer (see the header: S4-3). The stored value is the truth, across launches and
   * across providers over the same device store (another tab's ordinary sign-out drops it there: AUTH-R1-2), so it is
   * read fresh wherever it decides something (`closingNow`). This is the provider's own copy: written with every
   * change and refreshed by every read, and used only when the store cannot be read, or when this provider's own
   * last write of it failed (`closingUnstored`: the store is then stale, and the copy keeps this run's answer).
   */
  let closing: Under13Closing | null = null;
  let closingUnstored = false;

  /** The card's one-time news (confirmed, email changed), or null. */
  let notice: AccountNotice | null = null;
  /** The check in flight (I've confirmed, the app coming to the front, the sheet's timer share one). */
  let checking: Promise<boolean> | null = null;
  /**
   * Accounts whose confirmed email is not yet backed by a refreshed ID token (see the header): a uid is added when a
   * check starts for it, and when auth reports it going from unconfirmed to confirmed in this run; it leaves only
   * after a forced token refresh succeeded for it after that (checkVerifiedNow). `target()` wants no engine for them.
   * Cleared when the signed-in account changes: a new session's token is minted with the current claim.
   */
  const tokenStale = new Set<string>();

  const gateAllowed = () => isAllowed(deps.gate);

  /** The closing as stored now; this provider's copy when the store cannot be read or missed its last write. */
  function closingNow(): Under13Closing | null {
    if (closingUnstored) return closing;
    try {
      closing = loadUnder13Closing(deps.storage());
    } catch (e) {
      console.warn('[account] the device store is unavailable; using this run\'s copy of the Under 13 closing', e);
    }
    return closing;
  }

  /** Stores the closing for `who` (synchronously: a close of the app right after must not lose it). Never throws. */
  function setClosing(who: Under13Closing): void {
    closing = { uid: who.uid, email: who.email, ...(who.method === 'google' ? { method: 'google' as const } : {}) };
    try {
      recordUnder13Closing(deps.storage(), closing);
      closingUnstored = false;
    } catch (e) {
      closingUnstored = true;
      console.warn('[account] storing the Under 13 closing failed; it is kept for this run only', e);
    }
  }

  /** Drops the closing (only when it is `uid`'s, when given). A failure is logged, never thrown. */
  function dropClosing(uid?: string): void {
    const current = closingNow();
    if (uid !== undefined && current?.uid !== uid) return;
    closing = null;
    try {
      const storage = deps.storage();
      // A copy the store missed may differ from what it holds: clear it then whatever it says.
      if (closingUnstored || loadUnder13Closing(storage)) clearUnder13Closing(storage);
      closingUnstored = false;
    } catch (e) {
      closingUnstored = true;
      console.warn('[account] dropping the Under 13 closing failed; it is dropped for this run only', e);
    }
  }

  /** `uid`'s delete succeeded (or was proven): it is never offered again, and its closing goes. */
  function markDeleted(uid: string): void {
    deletedUids.add(uid);
    dropClosing(uid);
  }

  /** The stored Under 13 offer, or null (also when the device store cannot be read). */
  function offerNow(): Under13Offer | null {
    try {
      return readUnder13Offer(deps.storage());
    } catch (e) {
      console.warn('[account] the device store is unavailable; no Under 13 offer', e);
      return null;
    }
  }

  /** Drops the Under 13 offer. A failure is logged, never thrown: it must not fail a sign-in or a finished delete. */
  function dropOffer(): void {
    try {
      if (offerNow()) clearUnder13Offer(deps.storage());
    } catch (e) {
      console.warn('[account] dropping the Under 13 offer failed', e);
    }
  }

  /** Whether `u` must confirm its email before it syncs: the backend verifies emails, and it is not confirmed. */
  function needsVerify(u: AuthUser | null): boolean {
    if (!u) return false;
    const auth = deps.auth();
    return auth?.verifiesEmail === true && u.emailVerified !== true;
  }

  /** Whether `uid` synced on this device before (its sync history has a pull cursor). Never throws. */
  function hasSyncHistory(uid: string): boolean {
    try {
      return deps.storage().get(syncStateKey(uid)).items.cursor !== null;
    } catch {
      return false;
    }
  }

  /** What the card shows for `u`'s unconfirmed email, or null. */
  function verifyStateFor(u: AuthUser | null): VerifyState | null {
    if (!u || !needsVerify(u)) return null;
    let rec = null;
    try {
      rec = readVerifyRecord(deps.storage(), u.uid);
    } catch {
      rec = null;
    }
    const older = (u.createdAt !== undefined && u.createdAt < VERIFY_SHIPPED_AT) || hasSyncHistory(u.uid);
    return {
      kind: rec?.fresh ? 'new' : older ? 'paused' : 'new',
      sent: rec?.sent ?? false,
      resendAt: rec && rec.resendAt > 0 ? rec.resendAt : null,
      pendingEmail: rec?.pending ?? null,
    };
  }

  const emitView = () => {
    // While the offered delete runs, its re-auth is signed in only for the delete: the person stays signed out.
    const shown = offerRun || abandonedNow() ? null : user;
    const offer = offerNow();
    listeners?.onView({
      status: known ? (shown ? 'signedIn' : 'signedOut') : 'loading',
      user: shown,
      signInAllowed: gateAllowed(),
      under13Offer: offer ? (offer.method === 'google' ? { email: offer.email, method: 'google' } : { email: offer.email }) : null,
      verify: gateAllowed() ? verifyStateFor(shown) : null,
      notice,
    });
  };
  const emitSync = (sync: SyncStatus | null) => listeners?.onSync(sync);

  /** The user sync should run for right now, or null. */
  function target(): AuthUser | null {
    if (!listeners || holds > 0 || !user || user.uid === blockedUid || user.uid === unconfirmed?.uid) return null;
    if (abandonedNow()) return null; // the abandoned re-auth's late sign-in (D-1) never syncs
    if (!gateAllowed()) return null;
    // An unconfirmed email: nothing syncs (the rules would refuse it) until checkVerified sees it confirmed.
    if (needsVerify(user)) return null;
    // Confirmed in this run, but the ID token may still carry email_verified: false until a forced refresh.
    if (tokenStale.has(user.uid)) return null;
    return user;
  }

  /** The sync status to show while no engine runs: `error` for an unconfirmed account, else none. */
  function stoppedSync(): SyncStatus | null {
    if (!listeners || holds > 0 || !user || !unconfirmed || user.uid !== unconfirmed.uid) return null;
    return { state: 'error', lastSyncedAt: unconfirmed.lastSyncedAt };
  }

  /** Brings the running engine in line with `target()`: stops the old engine (awaited), then starts the new one. */
  async function reconcile(): Promise<void> {
    const want = target();
    if (running && want && running.uid === want.uid) return;
    if (running) {
      const old = running;
      running = null;
      old.unsubscribe();
      emitSync(null);
      await old.engine.stop();
      lastSynced.set(old.uid, old.engine.status().lastSyncedAt);
    }
    // Things may have moved on while the old engine stopped; start for whoever is wanted now.
    const next = target();
    if (!next) {
      const shown = stoppedSync();
      if (shown) emitSync(shown);
      return;
    }
    const storage = deps.storage();
    const engine = createSyncEngine({
      uid: next.uid,
      storage,
      remote: deps.remoteFor(next.uid),
      domains: deps.domains,
      deviceId: getDeviceId(storage),
    });
    const unsubscribe = engine.subscribe(() => {
      if (running?.engine === engine) emitSync(engine.status());
    });
    running = { uid: next.uid, engine, unsubscribe };
    emitSync(engine.status());
    engine.start();
  }

  /** Runs `step` on the chain after every step queued before it. Resolves when it has run; never rejects. */
  function enqueue(step: () => Promise<void> | void): Promise<void> {
    chain = chain.then(step).catch((e: unknown) => {
      console.warn('[account] sync handover failed', e);
    });
    return chain;
  }

  const kick = () => void enqueue(reconcile);

  function setUser(next: AuthUser | null) {
    // A different account (or none) lifts the block on a deleted one.
    if (next?.uid !== blockedUid) blockedUid = null;
    const before = user;
    const firstReport = !known;
    known = true;
    if (!sameUser(user, next)) user = next ? copyUser(next) : null;
    // Another account (or none): a stale-token hold belonged to the session that ended.
    if (!next || before?.uid !== next.uid) tokenStale.clear();
    let refresh = false;
    // Confirmed: this device no longer needs the cooldown or a pending change for it.
    if (next && next.emailVerified === true && before?.uid === next.uid && before.emailVerified !== true) {
      dropVerifyRecord(next.uid);
      // The SDK reports the confirmation (reload ends by notifying the listeners) before any token refresh: hold
      // the engine until one succeeds, and ask for a check: it shares the one in flight (the usual case), and outside
      // one (another tab confirmed) it is the refresh.
      if (deps.auth()?.verifiesEmail === true) {
        tokenStale.add(next.uid);
        refresh = true;
      }
    }
    if (!next) offerClosedSignedOut(firstReport, before);
    emitView();
    kick();
    if (user && !gateAllowed()) void enforceGate();
    // After this turn, so a check that is starting has registered itself and is shared.
    if (refresh) queueMicrotask(() => void actions.checkVerified().catch(() => undefined));
  }

  /**
   * While the gate is closed, signs out whoever is signed in through the normal path (the engine stops on the
   * chain, then auth signs out), after in-flight sign-outs and deletes have settled. Concurrent calls share one
   * run; a call during a run asks for one more pass. Never rejects. If the sign-out fails the user stays signed
   * in but no engine starts (`target()` reads the gate); the next auth or gate change tries again.
   */
  function enforceGate(): Promise<void> {
    if (gateCheck) {
      gateAgain = true;
      return gateCheck;
    }
    gateCheck = (async () => {
      do {
        gateAgain = false;
        try {
          while (busy.size > 0) await Promise.all(busy);
          await chain;
          // An offered delete signs its own re-auth out (busy holds this pass back, but the delete may have
          // started after the wait above).
          if (listeners && user && !gateAllowed() && !offerRun) {
            const who = user;
            await holding(() => signOut());
            // Only for the account the stored closing names (the gate closed on it while it was signed in: the header,
            // S4-3); usually setUser's report of the sign-out has done this already. A different account signed out
            // here leaves the closing alone. Whether `who` was deleted here comes from deletedUids, not blockedUid:
            // this sign-out lifted that.
            if (user === null && who.uid === closingNow()?.uid) {
              offerDelete(who);
              dropClosing(who.uid);
            }
          }
        } catch (e) {
          console.warn('[account] signing out after sign-in was turned off failed', e);
        }
      } while (gateAgain);
    })().finally(() => {
      gateCheck = null;
    });
    return gateCheck;
  }

  /**
   * The gate signed `who` out: offer to delete the account (if it has an email to re-auth with, and is not an
   * account already deleted on this device). Never throws.
   */
  function offerDelete(who: AuthUser | Under13Closing): void {
    if (!who.email || deletedUids.has(who.uid)) return;
    // A closing carries its method; a user's comes from its sign-in methods.
    const method = 'method' in who ? who.method : 'providers' in who ? reauthKindFor(who) : undefined;
    try {
      recordUnder13Offer(deps.storage(), { uid: who.uid, email: who.email, ...(method === 'google' ? { method } : {}) });
    } catch (e) {
      console.warn('[account] recording the Under 13 offer failed', e);
    }
    emitView();
  }

  /**
   * Auth reports nobody signed in. `firstReport`: this is auth's first report of the launch (nobody was known
   * before it); otherwise `before` is the user it replaces (null: auth already reported nobody, so this report signs
   * nobody out). If the gate is closed and the stored closing (read fresh) names `before`, the closing's account is
   * signed out behind the closed gate: turn it into the offer. This is the gate's sign-out as auth reports it. On the
   * launch's first report only, a stored closing is turned into the offer whoever it names: that is the gate's
   * sign-out that persisted just before the app was closed (it happened, the offer was not written yet). A later null
   * report after a null one (signOut's own setUser after the listener's report, AUTH-R1-1) replaces nobody, so it
   * records nothing. An ordinary sign-out cleared the closing before it started (in any tab: the store is read
   * fresh), a delete cleared it for its account (markDeleted), and while a delete runs (the offered delete's re-auth
   * signs in and out) nothing is decided here. Another account signed out leaves the closing alone. Never throws.
   */
  function offerClosedSignedOut(firstReport: boolean, before: AuthUser | null): void {
    if (offerRun || deleting || gateAllowed()) return;
    if (!firstReport && before === null) return;
    const c = closingNow();
    if (!c) return;
    if (!firstReport && before?.uid !== c.uid) return;
    // The offer first, then the closing: a close of the app between the two records the same offer again next time.
    offerDelete(c);
    dropClosing(c.uid);
  }

  /** The gate changed: show it, bring the engine in line on the chain, and sign out if it closed. */
  function onGateChange() {
    if (!listeners) return;
    const open = gateAllowed();
    // Open → closed with someone signed in (not the offered delete's own re-auth): Under 13 picked while signed in.
    // Stored now, in the same turn as the gate change, before the sign-out waits for anything.
    if (gateWasOpen && !open && user && !offerRun) {
      if (user.email) setClosing({ uid: user.uid, email: user.email, ...(reauthKindFor(user) === 'google' ? { method: 'google' as const } : {}) });
      else dropClosing(); // no email: nothing could re-auth for the offer
    }
    if (open) dropClosing();
    gateWasOpen = open;
    emitView();
    kick();
    if (user && !gateAllowed()) void enforceGate();
  }

  function dropVerifyRecord(uid: string): void {
    try {
      clearVerifyRecord(deps.storage(), uid);
    } catch (e) {
      console.warn('[account] clearing the verification record failed', e);
    }
  }

  function writeVerify(uid: string, change: Parameters<typeof writeVerifyRecord>[2]): void {
    try {
      writeVerifyRecord(deps.storage(), uid, change, deps.now());
    } catch (e) {
      console.warn('[account] storing the verification record failed', e);
    }
  }

  /** Sets `uid`'s pending change of address to null (the cooldown, `sent` and `fresh` stay). Never throws. */
  function forgetPendingEmail(uid: string): void {
    try {
      if (readVerifyRecord(deps.storage(), uid)?.pending) writeVerify(uid, { pending: null });
    } catch (e) {
      console.warn('[account] forgetting the pending email failed', e);
    }
  }

  function actionOptions(languageCode: string | undefined): EmailActionOptions {
    return { url: deps.continueUrl(), languageCode: languageCode ?? 'en' };
  }

  /**
   * Sends the verification link (to the pending new address while a change of address waits) for the signed-in,
   * unconfirmed `who`, and starts the cooldown. too-many-requests holds Send again for 5 minutes. Rejects with AuthError.
   */
  async function sendVerificationFor(auth: AuthBackend, who: AuthUser, languageCode: string | undefined): Promise<void> {
    const rec = readVerifyRecord(deps.storage(), who.uid);
    if (rec && rec.resendAt > deps.now()) throw new AuthError('unknown', 'send again is cooling down');
    const options = actionOptions(languageCode);
    try {
      if (rec?.pending) {
        if (!auth.verifyBeforeUpdateEmail) throw new AuthError('unknown', 'this backend cannot change the email');
        await auth.verifyBeforeUpdateEmail(rec.pending, options);
      } else {
        if (!auth.sendEmailVerification) throw new AuthError('unknown', 'this backend sends no verification email');
        await auth.sendEmailVerification(options);
      }
    } catch (e) {
      const err = asAuthError(e);
      if (err.kind === 'too-many-requests') writeVerify(who.uid, { resendAt: deps.now() + TOO_MANY_HOLD_MS });
      emitView();
      throw err;
    }
    writeVerify(who.uid, { resendAt: deps.now() + RESEND_COOLDOWN_MS, sent: true });
    emitView();
  }

  /** The signed-in user if it has an email to confirm; else throws. */
  function requireUnconfirmed(auth: AuthBackend): AuthUser {
    const who = auth.currentUser();
    if (!who || who.uid !== user?.uid) throw new AuthError('unknown', 'nobody is signed in');
    if (!needsVerify(user)) throw new AuthError('unknown', 'the email is already confirmed');
    return user;
  }

  /** checkVerified's body (see types.ts). Concurrent calls share one run. */
  async function checkVerifiedNow(): Promise<boolean> {
    const auth = deps.auth();
    const who = user;
    if (!auth || !who || offerRun) return false;
    if (!needsVerify(who)) {
      // Confirmed. If no forced refresh has succeeded since (it failed, or the confirmation came from another tab),
      // this check is that refresh.
      return tokenStale.has(who.uid) ? refreshAfterConfirm(auth, who, who) : true;
    }
    if (!auth.reload) throw new AuthError('unknown', 'this backend cannot reload the user');
    // A confirmation this check finds holds the engine until the token is refreshed: the SDK's reload notifies the
    // auth listeners (setUser: confirmed) before it resolves, so the hold must be in place before reload starts.
    tokenStale.add(who.uid);
    let fresh: AuthUser | null;
    try {
      fresh = await auth.reload();
    } catch (e) {
      const code = isAuthError(e) ? e.code : firebaseAuthCode(e);
      // The session is gone: an email change (the new link was opened) or a delete revokes every session. Decided on
      // the code alone: for some codes the SDK has signed out already, inside reload.
      if (code !== undefined && SESSION_GONE_CODES.includes(code)) {
        await sessionGone(auth, who);
        return false;
      }
      throw asAuthError(e);
    }
    if (!fresh || fresh.uid !== who.uid || user?.uid !== who.uid) {
      setUser(auth.currentUser());
      return false;
    }
    if (fresh.emailVerified !== true) {
      setUser(fresh);
      return false;
    }
    return refreshAfterConfirm(auth, who, fresh);
  }

  /**
   * `who`'s email is confirmed (`fresh`: auth's user after the reload): force a new ID token, so Firestore (the rules
   * read email_verified from the token) sees the claim before the engine's first request; then lift the hold, show
   * the "confirmed" notice and let reconcile start the engine. A failed refresh keeps the hold (the next check
   * retries) and rejects. False when the signed-in account changed meanwhile (the hold stays with `who`).
   */
  async function refreshAfterConfirm(auth: AuthBackend, who: AuthUser, fresh: AuthUser): Promise<boolean> {
    if (auth.currentUser()?.uid !== who.uid) return false;
    try {
      await auth.getIdToken(true);
    } catch (e) {
      // Show what auth knows (confirmed); the engine stays off: the uid is still in tokenStale.
      if (user?.uid === who.uid && auth.currentUser()?.uid === who.uid) setUser(auth.currentUser() ?? fresh);
      throw asAuthError(e);
    }
    if (user?.uid !== who.uid || auth.currentUser()?.uid !== who.uid) return false;
    notice = { kind: 'confirmed' };
    // The user first (a confirmation setUser sees now finds the uid held already), then the hold goes.
    setUser(auth.currentUser() ?? fresh);
    tokenStale.delete(who.uid);
    kick();
    return true;
  }

  /**
   * A check found `who`'s session gone. Its verify record goes (with the "email changed" notice when a change of
   * address was pending); if auth still has `who` signed in, it is signed out through the normal path (never another
   * account another tab switched to). Rejects only when that sign-out fails.
   */
  async function sessionGone(auth: AuthBackend, who: AuthUser): Promise<void> {
    let pending: string | null = null;
    try {
      pending = readVerifyRecord(deps.storage(), who.uid)?.pending ?? null;
    } catch {
      pending = null;
    }
    dropVerifyRecord(who.uid);
    if (pending) notice = { kind: 'emailChanged', email: pending };
    try {
      if (auth.currentUser()?.uid === who.uid) {
        dropClosing();
        await holding(() => signOut(who.uid));
      }
    } finally {
      setUser(auth.currentUser());
    }
  }

  /** Throws 'not-allowed' (before anything reaches the auth backend) while the gate is closed. */
  function requireAllowed(): void {
    if (!gateAllowed()) throw new AuthError('not-allowed', 'sign-in is off on this device');
  }

  /** Throws while the offered delete runs: a sign-in now would switch the account under its re-auth. */
  function requireNoOfferRun(): void {
    if (offerRun) throw new AuthError('unknown', 'a delete is in progress');
  }

  /** After a sign-in or sign-up resolved: if the gate closed meanwhile, sign the user out again and reject. */
  async function afterSignIn(): Promise<void> {
    if (gateAllowed()) return;
    await enforceGate();
    throw new AuthError('not-allowed', 'sign-in is off on this device');
  }

  function requireAuth(): AuthBackend {
    const auth = deps.auth();
    if (!auth) throw new AuthError('unknown', 'Firebase Auth is unavailable');
    return auth;
  }

  /** Runs `op` as a sync-holding action that syncNow waits for. */
  function holding<T>(op: () => Promise<T>): Promise<T> {
    const p = op();
    const settled = p.then(
      () => undefined,
      () => undefined,
    );
    busy.add(settled);
    void settled.then(() => busy.delete(settled));
    return p;
  }

  async function syncNow(): Promise<void> {
    // Let a sign-out or delete in progress settle, then any pending handover, so the sync runs for
    // whoever is signed in afterwards (or not at all).
    while (busy.size > 0) await Promise.all(busy);
    await chain;
    // An unconfirmed delete for the signed-in account: ask again before anything syncs.
    if (unconfirmed && user?.uid === unconfirmed.uid) {
      probing ??= settleUnconfirmed().finally(() => (probing = null));
      await probing;
      await chain;
    }
    // Confirmed, but its token refresh has not succeeded yet (it failed: offline): try it again first.
    if (user && !needsVerify(user) && tokenStale.has(user.uid)) {
      await actions.checkVerified().catch(() => undefined);
      await chain;
    }
    await running?.engine.syncNow();
  }

  const actions: Actions = {
    async signIn(method: AccountSignIn) {
      requireAllowed();
      requireNoOfferRun();
      const auth = requireAuth();
      // An ordinary Google sign-in may create the account; only the offered delete's re-auth uses existingOnly.
      const how: AccountSignIn = method.kind === 'google' ? { kind: 'google' } : method;
      signingIn++;
      signInGen++;
      try {
        await backendSignIn(auth, how);
      } catch (e) {
        throw asAuthError(e);
      } finally {
        signingIn--;
      }
      blockedUid = null;
      unconfirmed = null;
      notice = null; // "sign in with your new email" is done
      dropOffer(); // a sign-in, to any account, ends the Under 13 offer
      dropClosing(); // ...and any closing: the gate's later sign-out of this session is not Under 13 picked on it
      setUser(auth.currentUser());
      await afterSignIn();
    },

    async signUp(email: string, password: string, languageCode?: string): Promise<SignUpResult> {
      requireAllowed();
      requireNoOfferRun();
      const auth = requireAuth();
      signingIn++;
      signInGen++;
      try {
        await auth.signUp(email, password);
      } catch (e) {
        throw asAuthError(e);
      } finally {
        signingIn--;
      }
      blockedUid = null;
      unconfirmed = null;
      notice = null;
      dropOffer(); // a sign-in, to any account, ends the Under 13 offer
      dropClosing(); // ...and any closing: the gate's later sign-out of this session is not Under 13 picked on it
      const created = auth.currentUser();
      // Made here by this sign-up: a new account (sent a link now), never a paused one.
      if (created && needsVerify(created)) writeVerify(created.uid, { fresh: true });
      setUser(created);
      await afterSignIn();
      // The account exists either way; a failed send is reported, and Send again retries it.
      let sendError: AuthError | null = null;
      const who = auth.currentUser();
      const confirm = !!who && !!created && who.uid === created.uid && needsVerify(user);
      if (confirm) {
        try {
          await sendVerificationFor(auth, who, languageCode);
        } catch (e) {
          sendError = asAuthError(e);
        }
      }
      return { confirm, sendError };
    },

    async sendVerification(languageCode?: string) {
      requireAllowed();
      requireNoOfferRun();
      const auth = requireAuth();
      await sendVerificationFor(auth, requireUnconfirmed(auth), languageCode);
    },

    checkVerified() {
      if (!gateAllowed()) return Promise.resolve(false);
      checking ??= checkVerifiedNow().finally(() => (checking = null));
      return checking;
    },

    async changeEmail(newEmail: string, password: string, languageCode?: string) {
      requireAllowed();
      requireNoOfferRun();
      const auth = requireAuth();
      const who = auth.currentUser();
      if (!who || who.uid !== user?.uid) throw new AuthError('unknown', 'nobody is signed in');
      const address = newEmail.trim();
      if (!auth.verifyBeforeUpdateEmail) throw new AuthError('unknown', 'this backend cannot change the email');
      try {
        // verifyBeforeUpdateEmail needs a recent sign-in.
        await auth.reauthenticate({ kind: 'password', email: who.email ?? '', password });
      } catch (e) {
        throw asAuthError(e);
      }
      if (auth.currentUser()?.uid !== who.uid) throw new AuthError('unknown', 'the signed-in account changed');
      try {
        await auth.verifyBeforeUpdateEmail(address, actionOptions(languageCode));
      } catch (e) {
        const err = asAuthError(e);
        if (err.kind === 'too-many-requests') writeVerify(who.uid, { resendAt: deps.now() + TOO_MANY_HOLD_MS });
        emitView();
        throw err;
      }
      writeVerify(who.uid, { pending: address, resendAt: deps.now() + RESEND_COOLDOWN_MS });
      emitView();
    },

    keepOldEmail() {
      const who = user;
      if (!who) return;
      writeVerify(who.uid, { pending: null });
      emitView();
    },

    dismissNotice() {
      if (notice === null) return;
      notice = null;
      emitView();
    },

    signOut() {
      // An ordinary sign-out ends a closing the gate could not finish (its sign-out failed): the person signed out
      // themselves, and a later restore of that session behind the closed gate is not Under 13 picked on it (U13-R2-1).
      // Dropped before auth.signOut() is called: auth may report nobody before signOut's continuation runs.
      dropClosing();
      const who = user;
      return holding(async () => {
        await signOut();
        // A pending change of address is an address the person typed: it does not stay on the device signed out.
        if (who) forgetPendingEmail(who.uid);
      });
    },

    async sendPasswordReset(email: string) {
      // Off behind the gate too: it would send a typed-in email address to the auth backend.
      requireAllowed();
      const auth = requireAuth();
      try {
        await auth.sendPasswordReset(email);
      } catch (e) {
        throw asAuthError(e);
      }
    },

    syncNow,

    deleteAccount(proof: DeleteProof, options?: DeleteOptions) {
      return holding(() => deleteAccount(proof, options));
    },

    deleteOfferedAccount(proof: DeleteProof, options?: DeleteOptions) {
      return holding(() => deleteOfferedAccount(proof, options));
    },

    dismissUnder13Offer() {
      // During a running delete the delete decides what happens to the offer.
      if (offerRun) return;
      dropOffer();
      emitView();
    },
  };

  /** Stops sync, then signs out. `onlyUid`: only if that account is still the signed-in one when auth would sign out. */
  async function signOut(onlyUid?: string): Promise<void> {
    const auth = requireAuth();
    holds++;
    try {
      await enqueue(reconcile); // stops the engine
      // Another tab may have switched the account while the engine stopped: never sign that one out.
      if (onlyUid !== undefined && auth.currentUser()?.uid !== onlyUid) {
        setUser(auth.currentUser());
        return;
      }
      await auth.signOut();
      setUser(auth.currentUser());
    } catch (e) {
      throw asAuthError(e);
    } finally {
      holds--;
      kick(); // signed out: nothing starts; a failed sign-out resumes sync
    }
  }

  /** Throws (before anything reaches the backend) unless `uid` is still the signed-in user. */
  function requireStillSignedIn(auth: AuthBackend, uid: string): void {
    if (auth.currentUser()?.uid !== uid) throw new AuthError('unknown', 'the signed-in account changed during the delete');
  }

  /** Whether `uid`'s remote holds anything, or null when it cannot be read. */
  async function readHasData(uid: string): Promise<boolean | null> {
    try {
      return await remoteHasData(deps.remoteFor(uid));
    } catch {
      return null;
    }
  }

  /** After an ambiguous delete: is `uid`'s account still there? Never rejects. */
  async function probe(uid: string, hadData: boolean | null): Promise<ProbeOutcome> {
    const auth = deps.auth();
    if (!auth || auth.currentUser()?.uid !== uid) return 'switched';
    let token: string | null;
    try {
      token = await auth.getIdToken(true);
    } catch (e) {
      // Design limit (U2): 'deleted' proves the account's tokens were revoked (the backend revokes and
      // disables the user before touching any data), not that the wipe finished. That is safe: the backend
      // writes the deletedUsers/{uid} marker before the wipe, so a half-finished delete takes no more
      // writes from existing tokens, and a retry (sign in again → delete) completes it. If the backend
      // failed after disabling the user, signing in again is refused until the delete is finished
      // server-side.
      return provesAccountGone(e) ? 'deleted' : 'unreachable';
    }
    if (!token || auth.currentUser()?.uid !== uid) return 'switched';
    if (hadData) {
      const hasData = await readHasData(uid);
      if (hasData === null) return 'unreachable';
      if (!hasData) return 'wiped';
    }
    return 'alive';
  }

  /**
   * The account is gone: forget its sync history (after its engine has stopped: it is blocked, and
   * held while a delete runs), never sync it again from this device unless it signs in afresh, and
   * sign it out (only if it is still the signed-in user: never sign out someone else).
   */
  async function finishDeleted(auth: AuthBackend, uid: string): Promise<void> {
    blockedUid = uid;
    markDeleted(uid);
    dropVerifyRecord(uid);
    if (unconfirmed?.uid === uid) unconfirmed = null;
    await enqueue(reconcile);
    await enqueue(() => clearSyncState(deps.storage(), uid));
    if (auth.currentUser()?.uid === uid) {
      try {
        await auth.signOut();
      } catch (e) {
        console.warn('[account] the account was deleted but signing out failed', e);
      }
    }
    setUser(auth.currentUser());
  }

  /** Probes the unconfirmed account again and acts on the answer. Never rejects. */
  async function settleUnconfirmed(): Promise<void> {
    const pending = unconfirmed;
    const auth = deps.auth();
    if (!pending || !auth) return;
    try {
      const outcome = await probe(pending.uid, pending.hadData);
      if (unconfirmed !== pending) return; // settled meanwhile (a fresh sign-in)
      if (outcome === 'alive') {
        unconfirmed = null;
        kick();
      } else if (outcome === 'deleted') {
        await finishDeleted(auth, pending.uid);
      }
      // wiped, unreachable, switched: it stays unconfirmed and the next syncNow asks again.
    } catch (e) {
      console.warn('[account] checking an unconfirmed delete failed', e);
    }
  }

  /** After the re-auth: an abort asked for while Google's window was open ends the delete here, before anything. */
  function provenOrAborted(options: DeleteOptions | undefined): void {
    if (options?.signal?.aborted) throw new AuthError('cancelled', 'the delete was cancelled');
    options?.onProven?.();
  }

  async function deleteAccount(proof: DeleteProof, options?: DeleteOptions): Promise<void> {
    const auth = requireAuth();
    const who = auth.currentUser() ?? user;
    if (!who) throw new AuthError('unknown', 'nobody is signed in');
    if (deleting) throw new AuthError('unknown', 'a delete is already in progress');
    // Google proves only an account that signs in with Google (a password-only account keeps its password).
    if (proofKind(proof) === 'google' && !who.providers?.includes('google')) throw new AuthError('unknown', 'this account does not sign in with Google');
    deleting = true;
    try {
      try {
        await abortable(backendReauth(auth, proofMethod(proof, who.email ?? '')), options?.signal);
      } catch (e) {
        throw asAuthError(e);
      }
      provenOrAborted(options);
      holds++;
      let requested = false;
      let hadData: boolean | null = null;
      try {
        await enqueue(reconcile); // stops the engine; the hold keeps it stopped
        // Another tab (or the SDK) may switch the user while the engine stops: the token must be the
        // re-authenticated account's, or this password would delete someone else's account.
        requireStillSignedIn(auth, who.uid);
        const token = await auth.getIdToken(true);
        if (!token) throw new AuthError('unknown', 'no ID token');
        requireStillSignedIn(auth, who.uid);
        const sub = tokenSubject(token);
        if (sub !== null && sub !== who.uid) throw new AuthError('unknown', 'the ID token is for another account');
        // What the remote holds now, to tell after an ambiguous failure whether the delete reached it. Not for an
        // unconfirmed email: the rules refuse its reads (hadData stays unknown).
        if (!needsVerify(who)) hadData = await readHasData(who.uid);
        requested = true;
        await deps.deleteRequest(token);
      } catch (e) {
        const err = asAuthError(e);
        if (requested && err.kind === 'network') {
          // The request may have reached the server: sync must not resume until we know.
          const outcome = await probe(who.uid, hadData);
          if (outcome === 'deleted') {
            try {
              await finishDeleted(auth, who.uid);
            } finally {
              holds--;
              kick();
            }
            return;
          }
          if (outcome !== 'alive') unconfirmed = { uid: who.uid, hadData, lastSyncedAt: lastSynced.get(who.uid) ?? null };
        }
        holds--;
        kick(); // nothing was deleted: sync resumes for the same user (an unconfirmed one stays stopped)
        throw err;
      }
      try {
        await finishDeleted(auth, who.uid);
      } finally {
        holds--;
        kick();
      }
    } finally {
      deleting = false;
    }
  }

  /**
   * The Under 13 offer's delete (see the header and types.ts). Order: re-auth (a sign-in with the offered email,
   * no engine: the hold and the closed gate keep `target()` null), check it is the offered account, a fresh ID
   * token (its subject checked), the delete request, then forget the sync history and sign out (finishDeleted),
   * then drop the offer. Any failure deletes nothing locally, keeps the offer and ends signed out. A delete that
   * succeeded drops the offer whatever fails after it, and still ends signed out.
   */
  async function deleteOfferedAccount(proof: DeleteProof, options?: DeleteOptions): Promise<void> {
    const offer = offerNow();
    if (!offer) throw new AuthError('not-allowed', 'there is no Under 13 offer on this device');
    if (deleting) throw new AuthError('unknown', 'a delete is already in progress');
    if (signingIn > 0) throw new AuthError('unknown', 'a sign-in is in progress');
    // The proof must be the offer's own method: Google proves only an offer recorded for a Google-only account.
    if (proofKind(proof) !== (offer.method ?? 'password')) throw new AuthError('unknown', 'that is not how the offered account signs in');
    const auth = requireAuth();
    const before = auth.currentUser();
    // The panel shows only while signed out; never sign someone else out (or in over them) to delete this one.
    if (before && before.uid !== offer.uid) throw new AuthError('unknown', 'another account is signed in');
    deleting = true;
    offerRun = true;
    holds++;
    let failure: AuthError | null = null;
    let deleted = false;
    try {
      try {
        await enqueue(reconcile); // whatever ran stops; the hold keeps every engine off until the end
        let reauthed: AuthUser;
        try {
          // Straight to the backend: sign-in is off (the gate), and this sign-in exists only to delete. Google's window
          // may never create an account here (existingOnly).
          reauthed = await abortable(backendSignIn(auth, proofMethod(proof, offer.email, true)), options?.signal, (late) =>
            watchAbandoned(auth, late),
          );
        } catch (e) {
          throw asAuthError(e);
        }
        provenOrAborted(options);
        // The password must have proven the offered account itself. The sign-in's own result says whom it
        // authenticated; currentUser does not: the email may now sign in to another account while another tab
        // restores the offered uid's older session. Never delete on a password that proved someone else.
        if (reauthed?.uid !== offer.uid) throw new AuthError('unknown', 'the offered email signed in to another account');
        // And the session the token comes from must still be that account (another tab may switch it).
        requireStillSignedIn(auth, offer.uid);
        const token = await auth.getIdToken(true);
        if (!token) throw new AuthError('unknown', 'no ID token');
        requireStillSignedIn(auth, offer.uid);
        const sub = tokenSubject(token);
        if (sub !== null && sub !== offer.uid) throw new AuthError('unknown', 'the ID token is for another account');
        // A network failure from here on is ambiguous: the server may have deleted the account. The offer is
        // kept either way (no sync runs for it while it is signed out): a retry's re-auth then fails if the
        // delete went through, and "Not now" drops the offer. Nothing local is deleted.
        await deps.deleteRequest(token);
        deleted = true;
        markDeleted(offer.uid); // from here on nothing may offer this account again
      } catch (e) {
        failure = asAuthError(e);
      }
      if (deleted) {
        try {
          await finishDeleted(auth, offer.uid); // forgets the sync history, then signs out
        } finally {
          await signOutOfferRun(auth);
          dropOffer();
        }
      } else {
        await signOutOfferRun(auth);
      }
    } finally {
      holds--;
      offerRun = false;
      deleting = false;
      setUser(auth.currentUser()); // shows the real state again; kicks; asks enforceGate if still signed in
    }
    if (failure) throw failure;
  }

  /**
   * The offered delete was given up while Google's window was open (D-1): when the window's late result arrives, sign
   * out what it signed in, unless the person has started a sign-in of their own since. Until then `abandonedNow()`
   * keeps that account hidden and unsynced. Never rejects.
   */
  function watchAbandoned(auth: AuthBackend, late: Promise<AuthUser>): void {
    const mark = { gen: signInGen };
    abandoned = mark;
    void late
      .then(
        (u) => u,
        () => null,
      )
      .then(async (u) => {
        if (mark.gen === signInGen && u && auth.currentUser()?.uid === u.uid) {
          try {
            await holding(() => signOut());
          } catch (e) {
            console.warn('[account] signing out the abandoned Google re-auth failed', e);
          }
        }
      })
      .finally(() => {
        if (abandoned === mark) abandoned = null;
        emitView();
        kick();
        if (user && !gateAllowed()) void enforceGate();
      });
  }

  /**
   * The offered delete's last step in every outcome: sign out whoever its re-auth left signed in, trying again on
   * a failure. The flow ends signed out by itself rather than counting on enforceGate: the provider may have been
   * torn down meanwhile (no listeners: enforceGate does nothing). Never throws. If every try fails (a persistent
   * local failure), setUser afterwards asks enforceGate while mounted (no engine starts meanwhile: the gate is
   * closed); after a teardown, the next mount's restored session is signed out by the gate as usual.
   */
  async function signOutOfferRun(auth: AuthBackend): Promise<void> {
    for (let attempt = 1; auth.currentUser() !== null && attempt <= OFFER_SIGN_OUT_TRIES; attempt++) {
      try {
        await auth.signOut();
      } catch (e) {
        console.warn(`[account] signing out after the Under 13 delete failed (try ${attempt} of ${OFFER_SIGN_OUT_TRIES})`, e);
      }
    }
  }

  function attach(next: Listeners): () => void {
    listeners = next;
    gateWasOpen = gateAllowed();
    closingNow(); // this provider's copy, used if the store later cannot be read
    // The gate is open (an age was picked that allows sign-in): any closing from an earlier run is over.
    if (gateWasOpen) dropClosing();
    const offs: (() => void)[] = [];
    offs.push(deps.gate.subscribe(onGateChange));
    const auth = deps.auth();
    if (auth) {
      offs.push(auth.onAuthStateChanged((u) => setUser(u)));
    } else {
      known = true;
      user = null;
    }
    emitView();

    const appState = AppState.addEventListener('change', (s) => {
      if (s !== 'active') return;
      // Back at the front with an unconfirmed email: it may have been confirmed meanwhile (decision 4).
      if (needsVerify(user) && gateAllowed()) void actions.checkVerified().catch(() => undefined);
      else void syncNow();
    });
    offs.push(() => appState.remove());
    if (Platform.OS === 'web' && typeof window !== 'undefined' && typeof window.addEventListener === 'function') {
      const onOnline = () => void syncNow();
      window.addEventListener('online', onOnline);
      offs.push(() => window.removeEventListener('online', onOnline));
    }
    kick();

    return () => {
      listeners = null;
      for (const off of offs) off();
      kick(); // no listeners: stops the engine
    };
  }

  return { attach, actions };
}

// ---- React ---------------------------------------------------------------------------------------

const AccountContext = createContext<AccountState | null>(null);

export function AccountProvider({ children, ...props }: AccountProviderProps) {
  const [controller] = useState(() => createController(createDeps(props)));
  const [view, setView] = useState<View>(() => ({
    status: 'loading',
    user: null,
    signInAllowed: isAllowed(props.signInGate ?? SIGN_IN_OFF),
    under13Offer: null,
    verify: null,
    notice: null,
  }));
  const [sync, setSync] = useState<SyncStatus | null>(null);

  useEffect(
    () =>
      controller.attach({
        onView: (next) =>
          setView((prev) =>
            prev.status === next.status &&
            sameUser(prev.user, next.user) &&
            prev.signInAllowed === next.signInAllowed &&
            prev.under13Offer?.email === next.under13Offer?.email &&
            prev.under13Offer?.method === next.under13Offer?.method &&
            sameVerify(prev.verify, next.verify) &&
            sameNotice(prev.notice, next.notice)
              ? prev
              : next,
          ),
        onSync: (next) =>
          setSync((prev) =>
            prev === next || (prev && next && prev.state === next.state && prev.lastSyncedAt === next.lastSyncedAt) ? prev : next,
          ),
      }),
    [controller],
  );

  const value = useMemo<AccountState>(
    () => ({
      status: view.status,
      user: view.user,
      signInAllowed: view.signInAllowed,
      under13Offer: view.under13Offer,
      verify: view.verify,
      notice: view.notice,
      sync,
      ...controller.actions,
    }),
    [view, sync, controller],
  );

  return <AccountContext.Provider value={value}>{children}</AccountContext.Provider>;
}

/** The account state and actions, or null outside an AccountProvider (Home's banner, in screens tested bare). */
export function useOptionalAccount(): AccountState | null {
  return useContext(AccountContext);
}

/** The account state and actions. Throws outside an AccountProvider. */
export function useAccount(): AccountState {
  const ctx = useContext(AccountContext);
  if (!ctx) throw new Error('useAccount must be used inside an AccountProvider');
  return ctx;
}
