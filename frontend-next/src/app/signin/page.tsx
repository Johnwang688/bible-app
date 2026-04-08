'use client';

import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useState } from 'react';
import { persistAuthSession, signIn, signUp } from '@/lib/account';

type Mode = 'signin' | 'signup';

export default function SignInPage() {
  const router = useRouter();
  const [mode, setMode] = useState<Mode>('signin');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [displayName, setDisplayName] = useState('');
  const [rememberMe, setRememberMe] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError(null);
    setBusy(true);
    try {
      const session =
        mode === 'signin'
          ? await signIn(email.trim(), password)
          : await signUp(email.trim(), password, displayName.trim() || undefined);
      persistAuthSession(session, mode === 'signin' ? rememberMe : true);
      router.replace('/app');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Something went wrong.');
    } finally {
      setBusy(false);
    }
  }

  return (
    <div className="si-root">
      <nav className="si-nav">
        <Link href="/" className="si-logo">BibleApp</Link>
      </nav>

      <main className="si-main">
        <div className="si-card">
          <h1 className="si-heading">
            {mode === 'signin' ? 'Welcome back' : 'Create an account'}
          </h1>
          {mode === 'signup' && (
            <p className="si-sub">Join to save your study across devices.</p>
          )}

          <div className="si-tab-row">
            <button
              type="button"
              className={`si-tab${mode === 'signin' ? ' active' : ''}`}
              onClick={() => { setMode('signin'); setError(null); }}
            >
              Sign in
            </button>
            <button
              type="button"
              className={`si-tab${mode === 'signup' ? ' active' : ''}`}
              onClick={() => { setMode('signup'); setError(null); }}
            >
              Create account
            </button>
          </div>

          <form className="si-form" onSubmit={e => void handleSubmit(e)}>
            {mode === 'signup' && (
              <div className="si-field">
                <label className="si-label" htmlFor="displayName">Display name</label>
                <input
                  id="displayName"
                  className="si-input"
                  type="text"
                  placeholder="Your name"
                  autoComplete="name"
                  value={displayName}
                  onChange={e => setDisplayName(e.target.value)}
                />
              </div>
            )}

            <div className="si-field">
              <label className="si-label" htmlFor="email">Email</label>
              <input
                id="email"
                className="si-input"
                type="email"
                placeholder="you@example.com"
                autoComplete="email"
                required
                value={email}
                onChange={e => setEmail(e.target.value)}
              />
            </div>

            <div className="si-field">
              <label className="si-label" htmlFor="password">Password</label>
              <input
                id="password"
                className="si-input"
                type="password"
                placeholder="••••••••"
                autoComplete={mode === 'signin' ? 'current-password' : 'new-password'}
                required
                value={password}
                onChange={e => setPassword(e.target.value)}
              />
            </div>

            {mode === 'signin' && (
              <label className="si-remember">
                <input
                  type="checkbox"
                  checked={rememberMe}
                  onChange={e => setRememberMe(e.target.checked)}
                />
                <span>Remember me on this device</span>
              </label>
            )}

            {error && <div className="si-error">{error}</div>}

            <button
              type="submit"
              className="si-submit"
              disabled={busy || !email.trim() || !password.trim()}
            >
              {busy
                ? mode === 'signin' ? 'Signing in…' : 'Creating account…'
                : mode === 'signin' ? 'Sign in' : 'Create account'}
            </button>
          </form>

          <div className="si-divider"><span>or</span></div>

          <Link href="/app" className="si-guest">
            Continue as Guest
          </Link>
        </div>
      </main>

      <style>{`
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        .si-root {
          min-height: 100vh;
          font-family: system-ui, -apple-system, sans-serif;
          background: #0f0f14;
          color: #e8e8f0;
          display: flex;
          flex-direction: column;
        }

        .si-nav {
          padding: 1.2rem 2.5rem;
          border-bottom: 1px solid rgba(255,255,255,0.07);
        }
        .si-logo {
          font-size: 1.2rem;
          font-weight: 700;
          letter-spacing: 0.02em;
          color: #c8a97e;
          text-decoration: none;
        }

        .si-main {
          flex: 1;
          display: flex;
          align-items: center;
          justify-content: center;
          padding: 3rem 1.5rem;
        }

        .si-card {
          background: rgba(255,255,255,0.04);
          border: 1px solid rgba(255,255,255,0.09);
          border-radius: 16px;
          padding: 2.5rem 2rem;
          width: 100%;
          max-width: 420px;
        }

        .si-heading {
          font-size: 1.6rem;
          font-weight: 700;
          color: #f0ead8;
          margin-bottom: 0.4rem;
        }
        .si-sub {
          font-size: 0.88rem;
          color: #7878a0;
          margin-bottom: 1.75rem;
          line-height: 1.5;
        }

        .si-tab-row {
          display: flex;
          gap: 0;
          background: rgba(0,0,0,0.3);
          border-radius: 8px;
          padding: 3px;
          margin-bottom: 1.5rem;
        }
        .si-tab {
          flex: 1;
          padding: 0.5rem;
          border: none;
          background: transparent;
          color: #7878a0;
          font-size: 0.88rem;
          font-weight: 600;
          border-radius: 6px;
          cursor: pointer;
          transition: background 0.15s, color 0.15s;
        }
        .si-tab.active {
          background: rgba(200,169,126,0.15);
          color: #c8a97e;
        }

        .si-form {
          display: flex;
          flex-direction: column;
          gap: 1rem;
        }

        .si-field {
          display: flex;
          flex-direction: column;
          gap: 0.35rem;
        }
        .si-label {
          font-size: 0.8rem;
          font-weight: 600;
          color: #9898b8;
          letter-spacing: 0.02em;
        }
        .si-input {
          background: rgba(0,0,0,0.35);
          border: 1px solid rgba(255,255,255,0.1);
          border-radius: 8px;
          padding: 0.7rem 0.9rem;
          color: #e8e8f0;
          font-size: 0.95rem;
          outline: none;
          transition: border-color 0.15s;
          width: 100%;
        }
        .si-input::placeholder { color: #505068; }
        .si-input:focus { border-color: rgba(200,169,126,0.5); }

        .si-remember {
          display: flex;
          align-items: center;
          gap: 0.55rem;
          cursor: pointer;
          font-size: 0.85rem;
          font-weight: 500;
          color: #9898b8;
          user-select: none;
        }
        .si-remember input {
          width: 1rem;
          height: 1rem;
          flex-shrink: 0;
          accent-color: #c8a97e;
          cursor: pointer;
        }

        .si-error {
          background: rgba(220,60,60,0.12);
          border: 1px solid rgba(220,60,60,0.3);
          border-radius: 8px;
          padding: 0.6rem 0.8rem;
          color: #f08888;
          font-size: 0.85rem;
        }

        .si-submit {
          margin-top: 0.25rem;
          padding: 0.75rem;
          background: #c8a97e;
          color: #1a1208;
          border: none;
          border-radius: 8px;
          font-size: 0.95rem;
          font-weight: 700;
          cursor: pointer;
          transition: opacity 0.15s;
          width: 100%;
        }
        .si-submit:disabled { opacity: 0.5; cursor: not-allowed; }
        .si-submit:not(:disabled):hover { opacity: 0.88; }

        .si-divider {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          margin: 1.25rem 0;
          color: #404060;
          font-size: 0.8rem;
        }
        .si-divider::before, .si-divider::after {
          content: '';
          flex: 1;
          height: 1px;
          background: rgba(255,255,255,0.08);
        }

        .si-guest {
          display: block;
          text-align: center;
          padding: 0.7rem;
          border: 1px solid rgba(255,255,255,0.1);
          border-radius: 8px;
          color: #9898b8;
          font-size: 0.9rem;
          font-weight: 600;
          text-decoration: none;
          transition: border-color 0.15s, color 0.15s;
        }
        .si-guest:hover {
          border-color: rgba(200,169,126,0.3);
          color: #c8a97e;
        }
      `}</style>
    </div>
  );
}
