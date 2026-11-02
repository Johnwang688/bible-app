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
// with an email is signed in (Under 13 picked during this run), and the gate then signs that account out, the
// provider records an offer to delete it (under13Offer.ts; it survives a restart). The gate has other reasons to be
// closed (the first-run state unknown: an adult whose Keychain session survived a reinstall), so a session restored,
// or a sign-in completed, with the gate already closed is signed out with no offer, and a gate that was never open
// in this run never records one (security review 4, S4-3). An ordinary sign-out, a delete, or Under 13 picked while
// signed out records nothing; any sign-in or sign-up drops it.
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
import { SIGN_IN_OFF, type SignInGate } from './signInGate';
import { AuthError, type AccountState, type AccountStatus, type AuthBackend, type AuthUser, type SignInMethod } from './types';
import { clearUnder13Offer, readUnder13Offer, recordUnder13Offer, type Under13Offer } from './under13Offer';

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
}

interface Listeners {
  onView(view: View): void;
  onSync(sync: SyncStatus | null): void;
}

type Actions = Pick<
  AccountState,
  'signIn' | 'signUp' | 'signOut' | 'sendPasswordReset' | 'syncNow' | 'deleteAccount' | 'deleteOfferedAccount' | 'dismissUnder13Offer'
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

function sameUser(a: AuthUser | null, b: AuthUser | null): boolean {
  return a === b || (a !== null && b !== null && a.uid === b.uid && a.email === b.email);
}

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
   * The uid that was signed in when the gate last went from open to closed (Under 13 picked while signed in),
   * or null. Only the gate's sign-out of this account records an Under 13 offer (see the header: S4-3). Cleared
   * when the gate opens again and when the offer is recorded.
   */
  let closedOnUid: string | null = null;

  const gateAllowed = () => isAllowed(deps.gate);

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

  const emitView = () => {
    // While the offered delete runs, its re-auth is signed in only for the delete: the person stays signed out.
    const shown = offerRun ? null : user;
    const offer = offerNow();
    listeners?.onView({
      status: known ? (shown ? 'signedIn' : 'signedOut') : 'loading',
      user: shown,
      signInAllowed: gateAllowed(),
      under13Offer: offer ? { email: offer.email } : null,
    });
  };
  const emitSync = (sync: SyncStatus | null) => listeners?.onSync(sync);

  /** The user sync should run for right now, or null. */
  function target(): AuthUser | null {
    if (!listeners || holds > 0 || !user || user.uid === blockedUid || user.uid === unconfirmed?.uid) return null;
    if (!gateAllowed()) return null;
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
    known = true;
    if (!sameUser(user, next)) user = next ? { uid: next.uid, email: next.email } : null;
    emitView();
    kick();
    if (user && !gateAllowed()) void enforceGate();
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
            // Only for the account that was signed in when the gate closed in this run (the header: S4-3). Whether
            // `who` was deleted here comes from deletedUids, not blockedUid: this sign-out lifted that.
            if (user === null && who.uid === closedOnUid) {
              closedOnUid = null;
              offerDelete(who);
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
  function offerDelete(who: AuthUser): void {
    if (!who.email || deletedUids.has(who.uid)) return;
    try {
      recordUnder13Offer(deps.storage(), { uid: who.uid, email: who.email });
    } catch (e) {
      console.warn('[account] recording the Under 13 offer failed', e);
    }
    emitView();
  }

  /** The gate changed: show it, bring the engine in line on the chain, and sign out if it closed. */
  function onGateChange() {
    if (!listeners) return;
    const open = gateAllowed();
    // Open → closed with someone signed in (not the offered delete's own re-auth): Under 13 picked while signed in.
    if (gateWasOpen && !open && user && !offerRun) closedOnUid = user.uid;
    if (open) closedOnUid = null;
    gateWasOpen = open;
    emitView();
    kick();
    if (user && !gateAllowed()) void enforceGate();
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
    await running?.engine.syncNow();
  }

  const actions: Actions = {
    async signIn(method: SignInMethod) {
      requireAllowed();
      requireNoOfferRun();
      const auth = requireAuth();
      try {
        await auth.signIn(method);
      } catch (e) {
        throw asAuthError(e);
      }
      blockedUid = null;
      unconfirmed = null;
      dropOffer(); // a sign-in, to any account, ends the Under 13 offer
      setUser(auth.currentUser());
      await afterSignIn();
    },

    async signUp(email: string, password: string) {
      requireAllowed();
      requireNoOfferRun();
      const auth = requireAuth();
      try {
        await auth.signUp(email, password);
      } catch (e) {
        throw asAuthError(e);
      }
      blockedUid = null;
      unconfirmed = null;
      dropOffer(); // a sign-in, to any account, ends the Under 13 offer
      setUser(auth.currentUser());
      await afterSignIn();
    },

    signOut() {
      return holding(() => signOut());
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

    deleteAccount(password: string) {
      return holding(() => deleteAccount(password));
    },

    deleteOfferedAccount(password: string) {
      return holding(() => deleteOfferedAccount(password));
    },

    dismissUnder13Offer() {
      // During a running delete the delete decides what happens to the offer.
      if (offerRun) return;
      dropOffer();
      emitView();
    },
  };

  async function signOut(): Promise<void> {
    const auth = requireAuth();
    holds++;
    try {
      await enqueue(reconcile); // stops the engine
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
    deletedUids.add(uid);
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

  async function deleteAccount(password: string): Promise<void> {
    const auth = requireAuth();
    const who = auth.currentUser() ?? user;
    if (!who) throw new AuthError('unknown', 'nobody is signed in');
    if (deleting) throw new AuthError('unknown', 'a delete is already in progress');
    deleting = true;
    try {
      try {
        await auth.reauthenticate({ kind: 'password', email: who.email ?? '', password });
      } catch (e) {
        throw asAuthError(e);
      }
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
        // What the remote holds now, to tell after an ambiguous failure whether the delete reached it.
        hadData = await readHasData(who.uid);
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
  async function deleteOfferedAccount(password: string): Promise<void> {
    const offer = offerNow();
    if (!offer) throw new AuthError('not-allowed', 'there is no Under 13 offer on this device');
    if (deleting) throw new AuthError('unknown', 'a delete is already in progress');
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
          // Straight to the backend: sign-in is off (the gate), and this sign-in exists only to delete.
          reauthed = await auth.signIn({ kind: 'password', email: offer.email, password });
        } catch (e) {
          throw asAuthError(e);
        }
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
        deletedUids.add(offer.uid); // from here on nothing may offer this account again
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
      if (s === 'active') void syncNow();
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
            prev.under13Offer?.email === next.under13Offer?.email
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
      sync,
      ...controller.actions,
    }),
    [view, sync, controller],
  );

  return <AccountContext.Provider value={value}>{children}</AccountContext.Provider>;
}

/** The account state and actions. Throws outside an AccountProvider. */
export function useAccount(): AccountState {
  const ctx = useContext(AccountContext);
  if (!ctx) throw new Error('useAccount must be used inside an AccountProvider');
  return ctx;
}
