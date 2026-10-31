'use client';

import { createContext, useContext, useEffect, useMemo, useState } from 'react';
import type { Dispatch, ReactNode, SetStateAction } from 'react';
import { restoreAuthSession } from '@/lib/account';
import type { AccountProfile, AuthSession } from '@/lib/account';

interface AuthContextValue {
  authSession: AuthSession | null;
  setAuthSession: Dispatch<SetStateAction<AuthSession | null>>;
  accountProfile: AccountProfile | null;
  setAccountProfile: Dispatch<SetStateAction<AccountProfile | null>>;
  authMode: 'signin' | 'signup';
  setAuthMode: Dispatch<SetStateAction<'signin' | 'signup'>>;
  authBusy: boolean;
  setAuthBusy: Dispatch<SetStateAction<boolean>>;
  authError: string | null;
  setAuthError: Dispatch<SetStateAction<string | null>>;
}

const AuthContext = createContext<AuthContextValue | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [authSession, setAuthSession]       = useState<AuthSession | null>(null);
  const [accountProfile, setAccountProfile] = useState<AccountProfile | null>(null);
  const [authMode, setAuthMode]             = useState<'signin' | 'signup'>('signin');
  const [authBusy, setAuthBusy]             = useState(false);
  const [authError, setAuthError]           = useState<string | null>(null);

  // Child effects run before this one, so BibleAppInner's init effect has already queued its state
  // updates; both are batched into one re-render, as when the restore lived in the init effect.
  useEffect(() => {
    setAuthSession(restoreAuthSession());
  }, []);

  const value = useMemo(
    () => ({
      authSession, setAuthSession,
      accountProfile, setAccountProfile,
      authMode, setAuthMode,
      authBusy, setAuthBusy,
      authError, setAuthError,
    }),
    [authSession, accountProfile, authMode, authBusy, authError],
  );
  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth(): AuthContextValue {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be used within an AuthProvider');
  return ctx;
}
