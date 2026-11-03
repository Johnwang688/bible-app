// Memory voice's sign-in, from R-6b's account (`useAccount()`): the bridge from the account to the `MemoryAuth` seam.
// Signed in means the account says so; the ID token is Firebase's current user's, and only while that user is the
// account's. Firebase is reached lazily, when a token is actually asked for while signed in, so jest and the
// signed-out web app never load it from here.
import { useLayoutEffect, useMemo, useRef, type ReactNode } from 'react';

import { useAccount, type AccountState } from '../../auth';
import { MemoryAuthProvider, type MemoryAuth } from './auth';

export type AccountView = Pick<AccountState, 'status' | 'user' | 'signInAllowed'>;

export interface AccountAuthDeps {
  /** Firebase's current user and its ID token, or null when none. Rejects on a token-service failure. */
  currentToken(): Promise<{ uid: string; token: string } | null>;
  /** Opens sign-in (default: the Me tab, `router.push('/me')`, where R-6b's AccountCard lives). */
  openSignIn(): void;
}

/** Firebase's current user, loaded on first use (like AccountProvider does). */
async function firebaseCurrentToken(): Promise<{ uid: string; token: string } | null> {
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  const { getFirebaseAuth } = require('../../auth/firebaseApp') as typeof import('../../auth/firebaseApp');
  const user = getFirebaseAuth().currentUser;
  if (!user) return null;
  return { uid: user.uid, token: await user.getIdToken() };
}

function openMeTab(): void {
  void import('expo-router').then(({ router }) => router.push('/me' as never));
}

const DEFAULT_DEPS: AccountAuthDeps = { currentToken: firebaseCurrentToken, openSignIn: openMeTab };

/** Whether two views are the same signed-in session (the same uid, still signed in). */
const sameAccount = (a: AccountView, b: AccountView): boolean =>
  a.status === b.status && (a.user?.uid ?? null) === (b.user?.uid ?? null);

export function useAccountMemoryAuth(account: AccountView, deps?: Partial<AccountAuthDeps>): MemoryAuth {
  // The latest account and deps: a `getIdToken` held from an older render reads them, never its own render's.
  // `generation` counts account changes (status or uid): signed in as A, then signed out or B, then A again is two
  // changes, though the endpoints are equal, so a token fetched before them is not handed out after.
  const latest = useRef({ account, deps, generation: 0 });
  useLayoutEffect(() => {
    const was = latest.current;
    latest.current = { account, deps, generation: was.generation + (sameAccount(was.account, account) ? 0 : 1) };
  });

  const { status, signInAllowed } = account;
  const uid = account.user?.uid ?? null;
  return useMemo<MemoryAuth>(() => {
    const signedIn = status === 'signedIn';
    const getIdToken = async (): Promise<string | null> => {
      // Only while the account is still this value's session: a value held from before a sign-out or a switch of
      // account gives no token, not the next user's.
      const { account: asked, generation } = latest.current;
      if (asked.status !== 'signedIn' || asked.user === null || asked.user.uid !== uid) return null;
      const currentToken = latest.current.deps?.currentToken ?? DEFAULT_DEPS.currentToken;
      const got = await currentToken(); // a rejection propagates: the voice client reads it as an error
      // Firebase's user must be the account's when asked, and the account must not have changed at all while it
      // awaited (a sign-out or a switch, even one that came back to the same uid).
      const now = latest.current;
      if (got === null || got.uid !== asked.user.uid || now.generation !== generation || !sameAccount(asked, now.account)) return null;
      return got.token;
    };
    const value: MemoryAuth = { signedIn, user: signedIn ? uid : null, getIdToken };
    if (signInAllowed) value.signIn = () => (latest.current.deps?.openSignIn ?? DEFAULT_DEPS.openSignIn)();
    return value;
  }, [status, uid, signInAllowed]);
}

/** Memory voice signed in through R-6b's account. `AccountProvider` must be above it (the root layout mounts it). */
export function AccountMemoryAuth({ children }: { children: ReactNode }) {
  const account = useAccount();
  const auth = useAccountMemoryAuth(account);
  return <MemoryAuthProvider value={auth}>{children}</MemoryAuthProvider>;
}
