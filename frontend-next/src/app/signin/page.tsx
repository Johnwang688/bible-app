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
      <div className="si-wash" aria-hidden="true" />

      <nav className="si-nav">
        <Link href="/" className="si-logo" aria-label="Open Bible home">
          <img
            className="si-logo-img"
            src="/logo/openbible-logo-black.png"
            alt=""
            width={36}
            height={36}
            aria-hidden="true"
          />
          <span className="si-logo-open">Open</span>
          <span className="si-logo-bible"> Bible</span>
        </Link>
        <div className="si-nav-actions">
          <Link href="/" className="si-btn si-btn-ghost">
            Home
          </Link>
          <Link href="/app" className="si-btn si-btn-primary">
            Continue as Guest
          </Link>
        </div>
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
        body { overflow: auto !important; height: auto !important; }
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        @keyframes si-wash {
          0%      { background-color: rgba(255,   0,   0, 0);    }
          8.333%  { background-color: rgba(255,   0,   0, 0.32); }
          16.666% { background-color: rgba(255,   0,   0, 0);    }
          16.667% { background-color: rgba(255, 255,   0, 0);    }
          25%     { background-color: rgba(255, 255,   0, 0.32); }
          33.333% { background-color: rgba(255, 255,   0, 0);    }
          33.334% { background-color: rgba(  0, 255,   0, 0);    }
          41.667% { background-color: rgba(  0, 255,   0, 0.32); }
          50%     { background-color: rgba(  0, 255,   0, 0);    }
          50.001% { background-color: rgba(  0, 255, 255, 0);    }
          58.333% { background-color: rgba(  0, 255, 255, 0.32); }
          66.666% { background-color: rgba(  0, 255, 255, 0);    }
          66.667% { background-color: rgba(  0,   0, 255, 0);    }
          75%     { background-color: rgba(  0,   0, 255, 0.32); }
          83.333% { background-color: rgba(  0,   0, 255, 0);    }
          83.334% { background-color: rgba(255,   0, 255, 0);    }
          91.667% { background-color: rgba(255,   0, 255, 0.32); }
          100%    { background-color: rgba(255,   0, 255, 0);    }
        }

        .si-root {
          min-height: 100vh;
          font-family: Georgia, "Times New Roman", serif;
          background: #f7f7f7;
          color: #221d16;
          display: flex;
          flex-direction: column;
          position: relative;
        }

        .si-wash {
          position: fixed;
          inset: 0;
          z-index: 0;
          pointer-events: none;
          animation: si-wash 36s linear infinite;
        }
        @media (prefers-reduced-motion: reduce) {
          .si-wash { animation: none; }
        }

        .si-nav,
        .si-main {
          position: relative;
          z-index: 1;
        }

        .si-nav {
          display: flex;
          align-items: center;
          justify-content: space-between;
          padding: 1.2rem 2.5rem;
          border-bottom: 1px solid rgba(109,76,49,0.14);
          position: sticky;
          top: 0;
          background: rgba(255, 253, 248, 0.88);
          backdrop-filter: blur(12px);
          z-index: 100;
        }
        .si-logo {
          font-size: 1.2rem;
          font-weight: 700;
          letter-spacing: 0.02em;
          text-decoration: none;
          display: inline-flex;
          align-items: center;
          gap: 0.5rem;
        }
        .si-logo-img {
          display: block;
          width: 36px;
          height: 36px;
          object-fit: contain;
          flex-shrink: 0;
        }
        .si-logo-open {
          color: #221d16;
        }
        .si-logo-bible {
          color: #6d4c31;
        }
        .si-nav-actions {
          display: flex;
          gap: 0.75rem;
          align-items: center;
        }
        .si-btn {
          display: inline-flex;
          align-items: center;
          justify-content: center;
          padding: 0.55rem 1.25rem;
          border-radius: 8px;
          font-size: 0.9rem;
          font-weight: 600;
          text-decoration: none;
          cursor: pointer;
          transition: opacity 0.15s, background 0.15s;
          border: none;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .si-btn-ghost {
          background: transparent;
          color: #6d4c31;
          border: 1px solid rgba(109,76,49,0.3);
        }
        .si-btn-ghost:hover { background: rgba(109,76,49,0.07); }
        .si-btn-primary {
          background: #6d4c31;
          color: #fff8ef;
        }
        .si-btn-primary:hover { opacity: 0.87; }

        .si-main {
          flex: 1;
          display: flex;
          align-items: center;
          justify-content: center;
          padding: 3rem 1.5rem;
        }

        .si-card {
          background:
            radial-gradient(circle at top right, rgba(214, 185, 140, 0.22), transparent 34%),
            linear-gradient(135deg, rgba(255, 253, 248, 0.92), rgba(247, 240, 225, 0.86));
          border: 1px solid rgba(221, 210, 195, 0.9);
          border-radius: 24px;
          padding: 2.5rem 2rem;
          width: 100%;
          max-width: 420px;
          box-shadow: 0 18px 44px rgba(88, 63, 38, 0.08);
        }

        .si-heading {
          font-size: 1.65rem;
          font-weight: 800;
          letter-spacing: -0.02em;
          color: #221d16;
          margin-bottom: 0.4rem;
        }
        .si-sub {
          font-size: 0.9rem;
          color: #8a7a68;
          margin-bottom: 1.75rem;
          line-height: 1.55;
          font-family: system-ui, -apple-system, sans-serif;
        }

        .si-tab-row {
          display: flex;
          gap: 0;
          background: rgba(255, 250, 241, 0.85);
          border: 1px solid rgba(109, 76, 49, 0.12);
          border-radius: 10px;
          padding: 4px;
          margin-bottom: 1.5rem;
        }
        .si-tab {
          flex: 1;
          padding: 0.5rem;
          border: none;
          background: transparent;
          color: #8a7a68;
          font-size: 0.88rem;
          font-weight: 600;
          font-family: system-ui, -apple-system, sans-serif;
          border-radius: 8px;
          cursor: pointer;
          transition: background 0.15s, color 0.15s;
        }
        .si-tab.active {
          background: rgba(109, 76, 49, 0.12);
          color: #6d4c31;
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
          color: #5f4f40;
          letter-spacing: 0.02em;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .si-input {
          background: rgba(255, 250, 241, 0.85);
          border: 1px solid rgba(109, 76, 49, 0.18);
          border-radius: 10px;
          padding: 0.7rem 0.9rem;
          color: #221d16;
          font-size: 0.95rem;
          font-family: system-ui, -apple-system, sans-serif;
          outline: none;
          transition: border-color 0.15s, box-shadow 0.15s;
          width: 100%;
          box-shadow: inset 0 1px 0 rgba(255,255,255,0.45);
        }
        .si-input::placeholder { color: #9d8d7b; }
        .si-input:focus {
          border-color: rgba(109, 76, 49, 0.45);
          box-shadow: inset 0 1px 0 rgba(255,255,255,0.5), 0 0 0 3px rgba(109, 76, 49, 0.12);
        }

        .si-remember {
          display: flex;
          align-items: center;
          gap: 0.55rem;
          cursor: pointer;
          font-size: 0.85rem;
          font-weight: 500;
          color: #5f4f40;
          font-family: system-ui, -apple-system, sans-serif;
          user-select: none;
        }
        .si-remember input {
          width: 1rem;
          height: 1rem;
          flex-shrink: 0;
          accent-color: #6d4c31;
          cursor: pointer;
        }

        .si-error {
          background: rgba(200, 60, 60, 0.08);
          border: 1px solid rgba(180, 50, 50, 0.28);
          border-radius: 10px;
          padding: 0.6rem 0.8rem;
          color: #8b2e2e;
          font-size: 0.85rem;
          font-family: system-ui, -apple-system, sans-serif;
        }

        .si-submit {
          margin-top: 0.25rem;
          padding: 0.75rem;
          background: #6d4c31;
          color: #fff8ef;
          border: none;
          border-radius: 10px;
          font-size: 0.95rem;
          font-weight: 700;
          font-family: system-ui, -apple-system, sans-serif;
          cursor: pointer;
          transition: opacity 0.15s;
          width: 100%;
        }
        .si-submit:disabled { opacity: 0.5; cursor: not-allowed; }
        .si-submit:not(:disabled):hover { opacity: 0.87; }

        .si-divider {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          margin: 1.25rem 0;
          color: #9d8d7b;
          font-size: 0.8rem;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .si-divider::before, .si-divider::after {
          content: '';
          flex: 1;
          height: 1px;
          background: rgba(109, 76, 49, 0.14);
        }

        .si-guest {
          display: block;
          text-align: center;
          padding: 0.7rem;
          border: 1px solid rgba(109,76,49,0.3);
          border-radius: 10px;
          color: #6d4c31;
          font-size: 0.9rem;
          font-weight: 600;
          font-family: system-ui, -apple-system, sans-serif;
          text-decoration: none;
          transition: border-color 0.15s, background 0.15s;
        }
        .si-guest:hover {
          border-color: rgba(109,76,49,0.45);
          background: rgba(109,76,49,0.07);
        }

        @media (max-width: 640px) {
          .si-nav {
            padding: 1rem;
            flex-wrap: wrap;
            gap: 0.75rem;
          }
          .si-nav-actions {
            width: 100%;
            justify-content: flex-end;
          }
        }
      `}</style>
    </div>
  );
}
