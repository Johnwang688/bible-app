// The sign-in seam for Memory voice (team MEM, orchestrator-owned). Voice needs sign-in (the server answers
// 401 without a Firebase ID token). Without a provider the default is signed out: the trainers show the signed-out
// notice and typing. The app mounts R-6b's account through `AccountMemoryAuth` (accountAuth.tsx).
import { createContext, useContext, type ReactNode } from 'react';

export interface MemoryAuth {
  signedIn: boolean;
  /**
   * The signed-in user's id (the Firebase uid), or null / absent when unknown. Together with `signedIn` it is the
   * auth generation: a change of either ends the voice attempt in progress (nothing it sends back is shown, graded or
   * recorded).
   */
  user?: string | null;
  /** The Firebase ID token, or null when signed out. */
  getIdToken(): Promise<string | null>;
  /**
   * Opens sign-in. Absent: there is no sign-in screen yet, so the notice shows no Sign in button. It may return a
   * promise that settles when sign-in is over: a server 401's notice is lifted only if it resolves and `getIdToken`
   * then gives a different, non-null token (or `signedIn` goes false -> true).
   */
  signIn?: () => void;
}

export const SIGNED_OUT: MemoryAuth = {
  signedIn: false,
  user: null,
  getIdToken: async () => null,
};

const MemoryAuthContext = createContext<MemoryAuth>(SIGNED_OUT);

export function MemoryAuthProvider({ value, children }: { value: MemoryAuth; children: ReactNode }) {
  return <MemoryAuthContext.Provider value={value}>{children}</MemoryAuthContext.Provider>;
}

export function useMemoryAuth(): MemoryAuth {
  return useContext(MemoryAuthContext);
}
