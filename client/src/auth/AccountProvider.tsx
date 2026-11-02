// The account provider (R-6b): who is signed in, and the sync engine that runs for them.
//
// Concurrency: auth callbacks, user actions and AppState events arrive at any time. Every engine
// stop/start goes through one promise chain (`reconcile`), so at most one engine runs and a new one
// starts only after the previous one's stop() has resolved. An action that must keep sync off while it
// works (sign-out, delete) takes a hold; while any hold is taken `reconcile` stops the engine and
// starts none, whatever the auth callbacks say. Unmounting releases the auth, AppState and `online`
// listeners and stops the engine.
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
import { AuthError, type AccountState, type AccountStatus, type AuthBackend, type AuthUser, type SignInMethod } from './types';

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
}

// ---- dependencies --------------------------------------------------------------------------------

interface Deps {
  /** The auth backend, or null when the default one could not be created. */
  auth(): AuthBackend | null;
  storage(): Storage;
  remoteFor(uid: string): RemoteStore;
  domains: SyncDomains;
  deleteRequest(idToken: string): Promise<void>;
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
}

interface Listeners {
  onView(view: View): void;
  onSync(sync: SyncStatus | null): void;
}

type Actions = Pick<AccountState, 'signIn' | 'signUp' | 'signOut' | 'sendPasswordReset' | 'syncNow' | 'deleteAccount'>;

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
  let deleting = false;
  let running: { uid: string; engine: SyncEngine; unsubscribe: () => void } | null = null;
  /** Every engine stop/start runs on this chain, one step at a time. It never rejects. */
  let chain: Promise<void> = Promise.resolve();
  /** Sign-outs and deletes in progress (they hold sync off); syncNow waits for them to settle. */
  const busy = new Set<Promise<unknown>>();

  const emitView = () => listeners?.onView({ status: known ? (user ? 'signedIn' : 'signedOut') : 'loading', user });
  const emitSync = (sync: SyncStatus | null) => listeners?.onSync(sync);

  /** The user sync should run for right now, or null. */
  function target(): AuthUser | null {
    if (!listeners || holds > 0 || !user || user.uid === blockedUid) return null;
    return user;
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
    }
    // Things may have moved on while the old engine stopped; start for whoever is wanted now.
    const next = target();
    if (!next) return;
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
    await running?.engine.syncNow();
  }

  const actions: Actions = {
    async signIn(method: SignInMethod) {
      const auth = requireAuth();
      try {
        await auth.signIn(method);
      } catch (e) {
        throw asAuthError(e);
      }
      blockedUid = null;
      setUser(auth.currentUser());
    },

    async signUp(email: string, password: string) {
      const auth = requireAuth();
      try {
        await auth.signUp(email, password);
      } catch (e) {
        throw asAuthError(e);
      }
      blockedUid = null;
      setUser(auth.currentUser());
    },

    signOut() {
      return holding(() => signOut());
    },

    async sendPasswordReset(email: string) {
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
      try {
        await enqueue(reconcile); // stops the engine; the hold keeps it stopped
        const token = await auth.getIdToken(true);
        if (!token) throw new AuthError('unknown', 'no ID token');
        await deps.deleteRequest(token);
      } catch (e) {
        holds--;
        kick(); // nothing was deleted: sync resumes for the same user
        throw asAuthError(e);
      }
      try {
        // The account is gone. Forget its sync history (its engine is stopped and the hold keeps it
        // so), and never sync it again from this device unless it signs in afresh.
        await enqueue(() => clearSyncState(deps.storage(), who.uid));
        blockedUid = who.uid;
        try {
          await auth.signOut();
        } catch (e) {
          console.warn('[account] the account was deleted but signing out failed', e);
        }
        setUser(auth.currentUser());
      } finally {
        holds--;
        kick();
      }
    } finally {
      deleting = false;
    }
  }

  function attach(next: Listeners): () => void {
    listeners = next;
    const offs: (() => void)[] = [];
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
  const [view, setView] = useState<View>({ status: 'loading', user: null });
  const [sync, setSync] = useState<SyncStatus | null>(null);

  useEffect(
    () =>
      controller.attach({
        onView: (next) => setView((prev) => (prev.status === next.status && sameUser(prev.user, next.user) ? prev : next)),
        onSync: (next) =>
          setSync((prev) =>
            prev === next || (prev && next && prev.state === next.state && prev.lastSyncedAt === next.lastSyncedAt) ? prev : next,
          ),
      }),
    [controller],
  );

  const value = useMemo<AccountState>(
    () => ({ status: view.status, user: view.user, sync, ...controller.actions }),
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
