'use client';

import Link from 'next/link';
import { useState } from 'react';
import CoinBoostControls from '@/components/CoinBoostControls';

type AuthMode = 'signin' | 'signup';

interface AuthPanelProps {
  isBusy: boolean;
  error: string | null;
  mode: AuthMode;
  profile: {
    email: string;
    display_name: string | null;
  } | null;
  /** Wallet balance when signed in; `null` while loading or unavailable. */
  coinBalance?: number | null;
  onModeChange: (mode: AuthMode) => void;
  onSignIn: (email: string, password: string) => Promise<void>;
  onSignUp: (email: string, password: string, displayName: string) => Promise<void>;
  onSignOut: () => Promise<void>;
}

export default function AuthPanel({
  isBusy,
  error,
  mode,
  profile,
  coinBalance = null,
  onModeChange,
  onSignIn,
  onSignUp,
  onSignOut,
}: AuthPanelProps) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [displayName, setDisplayName] = useState('');

  if (profile) {
    return (
      <div className="auth-panel">
        <div className="auth-title">{profile.display_name || 'Signed in'}</div>
        <div className="auth-copy">{profile.email}</div>
        <div className="auth-actions">
          <button className="reader-onboarding-btn" type="button" disabled={isBusy} onClick={() => void onSignOut()}>
            {isBusy ? 'Signing out...' : 'Sign out'}
          </button>
        </div>
        <div className="auth-coins-block" aria-labelledby="auth-coins-heading">
          <div id="auth-coins-heading" className="auth-coins-heading">
            Coins
          </div>
          <div className="auth-coins-row">
            <p className="auth-coins-amount" aria-live="polite">
              <span className="auth-coins-icon" aria-hidden="true">
                🪙
              </span>
              {coinBalance != null ? `${coinBalance.toLocaleString()} coins` : '…'}
            </p>
            <Link href="/app/shop" className="auth-shop-pill" aria-label="Open shop">
              Shop
            </Link>
          </div>
        </div>
        <CoinBoostControls compact />
      </div>
    );
  }

  return (
    <div className="auth-panel">
      <div className="auth-switch-row">
        <button
          className={`auth-switch-btn${mode === 'signin' ? ' active' : ''}`}
          type="button"
          onClick={() => onModeChange('signin')}
        >
          Sign in
        </button>
        <button
          className={`auth-switch-btn${mode === 'signup' ? ' active' : ''}`}
          type="button"
          onClick={() => onModeChange('signup')}
        >
          Create account
        </button>
      </div>
      {mode === 'signup' && (
        <input
          className="auth-input"
          type="text"
          placeholder="Display name"
          value={displayName}
          onChange={event => setDisplayName(event.target.value)}
        />
      )}
      <input
        className="auth-input"
        type="email"
        placeholder="Email"
        value={email}
        onChange={event => setEmail(event.target.value)}
      />
      <input
        className="auth-input"
        type="password"
        placeholder="Password"
        value={password}
        onChange={event => setPassword(event.target.value)}
      />
      {error && <div className="auth-error">{error}</div>}
      <div className="auth-actions">
        {mode === 'signin' ? (
          <button
            className="reader-onboarding-btn"
            type="button"
            disabled={isBusy || !email.trim() || !password.trim()}
            onClick={() => void onSignIn(email.trim(), password)}
          >
            {isBusy ? 'Signing in...' : 'Sign in'}
          </button>
        ) : (
          <button
            className="reader-onboarding-btn"
            type="button"
            disabled={isBusy || !email.trim() || !password.trim()}
            onClick={() => void onSignUp(email.trim(), password, displayName.trim())}
          >
            {isBusy ? 'Creating account...' : 'Create account'}
          </button>
        )}
      </div>
    </div>
  );
}
