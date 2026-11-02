// The sign-in seam for Memory voice (team MEM, orchestrator-owned). Voice needs sign-in (the server answers
// 401 without a Firebase ID token). R-6b's auth isn't on main yet, so the default is signed out: the trainers
// show the signed-out notice and typing. When R-6b lands, its provider supplies a `MemoryAuth` here.
import { createContext, useContext, type ReactNode } from 'react';

export interface MemoryAuth {
  signedIn: boolean;
  /** The Firebase ID token, or null when signed out. */
  getIdToken(): Promise<string | null>;
  /** Opens sign-in. Absent: there is no sign-in screen yet, so the notice shows no Sign in button. */
  signIn?: () => void;
}

export const SIGNED_OUT: MemoryAuth = {
  signedIn: false,
  getIdToken: async () => null,
};

const MemoryAuthContext = createContext<MemoryAuth>(SIGNED_OUT);

export function MemoryAuthProvider({ value, children }: { value: MemoryAuth; children: ReactNode }) {
  return <MemoryAuthContext.Provider value={value}>{children}</MemoryAuthContext.Provider>;
}

export function useMemoryAuth(): MemoryAuth {
  return useContext(MemoryAuthContext);
}
