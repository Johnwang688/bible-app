'use client';

import Link from 'next/link';
import { useRouter } from 'next/navigation';
import SiteLogo from '@/components/SiteLogo';
import { useState } from 'react';
import { persistAuthSession, signIn, signUp } from '@/lib/account';
import { resetDevShopAfterAuth } from '@/lib/shopInventory';

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
      resetDevShopAfterAuth();
      persistAuthSession(session);
      router.replace('/app');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Something went wrong.');
    } finally {
      setBusy(false);
    }
  }

  return (
    <div className="si-root">
      {/* Background elements */}
      <div className="si-grid" aria-hidden="true" />
      <div className="si-orb si-orb-1" aria-hidden="true" />
      <div className="si-orb si-orb-2" aria-hidden="true" />

      {/* Nav */}
      <nav className="si-nav">
        <SiteLogo className="si-logo" />
        <div className="si-nav-actions">
          <Link href="/" className="si-btn si-btn-ghost">← Back</Link>
          <Link href="/app" className="si-btn si-btn-outline">Continue as Guest</Link>
        </div>
      </nav>

      <main className="si-main">
        {/* Left brand panel */}
        <div className="si-brand">
          <p className="si-brand-eyebrow">Open Bible</p>
          <h1 className="si-brand-title">
            Your study,<br />your progress,<br />
            <span className="si-brand-accent">everywhere.</span>
          </h1>
          <p className="si-brand-desc">
            Sign in to sync your reading streaks, mastery, and study notes
            across all your devices — and pick up exactly where you left off.
          </p>
          <blockquote className="si-brand-quote">
            <span className="si-brand-quote-mark">&ldquo;</span>
            Blessed is the one who reads aloud the words of this prophecy.
            <cite>— Revelation 1:3</cite>
          </blockquote>
        </div>

        {/* Right form panel */}
        <div className="si-panel">
          <div className="si-card">
            <div className="si-card-hd">
              <h2 className="si-heading">
                {mode === 'signin' ? 'Welcome back' : 'Create account'}
              </h2>
              {mode === 'signup' && (
                <p className="si-sub">Save your study across all devices.</p>
              )}
            </div>

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

              {error && <div className="si-error" role="alert">{error}</div>}

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

            <Link href="/app" className="si-guest">Continue as Guest</Link>
          </div>
        </div>
      </main>

      <style>{`
        body { overflow: auto !important; height: auto !important; }
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        @keyframes si-orb1 {
          0%,100% { transform: translate(-50%,-50%) scale(1); }
          50%      { transform: translate(calc(-50% + 40px), calc(-50% - 30px)) scale(1.06); }
        }
        @keyframes si-orb2 {
          0%,100% { transform: scale(1); }
          50%      { transform: scale(1.08) translate(20px, 15px); }
        }
        @keyframes si-fadein {
          from { opacity: 0; transform: translateY(16px); }
          to   { opacity: 1; transform: translateY(0); }
        }
        @keyframes si-accent-shimmer {
          from { background-position: 200% center; }
          to   { background-position: -200% center; }
        }

        .si-root {
          min-height: 100vh;
          background: radial-gradient(ellipse 110% 70% at 40% -5%, #1e1004 0%, #080604 50%, #050403 100%);
          color: #f0e8d8;
          display: flex;
          flex-direction: column;
          position: relative;
          overflow: hidden;
        }

        /* Background texture */
        .si-grid {
          position: fixed;
          inset: 0;
          background-image: radial-gradient(circle, rgba(201,168,120,0.055) 1px, transparent 1px);
          background-size: 34px 34px;
          pointer-events: none;
          z-index: 0;
        }
        .si-orb {
          position: fixed;
          border-radius: 50%;
          pointer-events: none;
          filter: blur(80px);
          z-index: 0;
        }
        .si-orb-1 {
          width: 700px; height: 700px;
          background: radial-gradient(circle at 38%, #b07840 0%, #5c2c10 52%, transparent 70%);
          top: 50%; left: 22%;
          transform: translate(-50%,-50%);
          opacity: 0.28;
          animation: si-orb1 20s ease-in-out infinite;
        }
        .si-orb-2 {
          width: 420px; height: 420px;
          background: radial-gradient(circle, #7a4820 0%, transparent 68%);
          bottom: -80px; right: -60px;
          opacity: 0.18;
          animation: si-orb2 26s ease-in-out infinite;
        }
        @media (prefers-reduced-motion: reduce) {
          .si-orb { animation: none !important; }
          .si-brand-accent { animation: none !important; }
        }

        /* Nav */
        .si-nav {
          position: relative;
          z-index: 10;
          display: flex;
          align-items: center;
          justify-content: space-between;
          padding: 1.1rem 2.5rem;
          border-bottom: 1px solid rgba(255,255,255,0.055);
          background: rgba(8,6,4,0.55);
          backdrop-filter: blur(14px);
          -webkit-backdrop-filter: blur(14px);
          flex-shrink: 0;
        }
        .si-logo {
          display: inline-flex;
          align-items: center;
          gap: 0.55rem;
          text-decoration: none;
          font-size: 1.05rem;
          font-weight: 700;
          font-family: Georgia, serif;
          letter-spacing: 0.01em;
        }
        .si-logo-img {
          width: 26px; height: 26px;
          object-fit: contain;
          filter: brightness(0) invert(1);
          flex-shrink: 0;
        }
        .si-logo-text { color: #f0e8d8; }
        .si-logo-accent { color: #c9a878; }
        .si-nav-actions { display: flex; gap: 0.6rem; align-items: center; }
        .si-btn {
          display: inline-flex;
          align-items: center;
          padding: 0.48rem 1rem;
          border-radius: 8px;
          font-size: 0.85rem;
          font-weight: 600;
          text-decoration: none;
          font-family: system-ui, -apple-system, sans-serif;
          cursor: pointer;
          border: none;
          transition: all 0.18s;
        }
        .si-btn-ghost {
          background: transparent;
          color: rgba(240,232,216,0.55);
          border: 1px solid rgba(240,232,216,0.14);
        }
        .si-btn-ghost:hover { color: #f0e8d8; border-color: rgba(240,232,216,0.3); background: rgba(240,232,216,0.05); }
        .si-btn-outline {
          background: rgba(201,168,120,0.12);
          color: #c9a878;
          border: 1px solid rgba(201,168,120,0.28);
        }
        .si-btn-outline:hover { background: rgba(201,168,120,0.22); border-color: rgba(201,168,120,0.48); }

        /* Main layout */
        .si-main {
          position: relative;
          z-index: 1;
          flex: 1;
          display: grid;
          grid-template-columns: 1fr 1fr;
          max-width: 1080px;
          width: 100%;
          margin: 0 auto;
          padding: 3rem 2.5rem;
          gap: 4rem;
          align-items: center;
        }

        /* Brand panel */
        .si-brand {
          display: flex;
          flex-direction: column;
          gap: 1.5rem;
          animation: si-fadein 0.7s cubic-bezier(0.16,1,0.3,1) 0.1s both;
        }
        .si-brand-eyebrow {
          font-size: 0.64rem;
          font-weight: 800;
          letter-spacing: 0.34em;
          text-transform: uppercase;
          color: #c9a878;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .si-brand-title {
          font-size: clamp(2.2rem, 4.5vw, 3.4rem);
          font-weight: 800;
          line-height: 1.1;
          letter-spacing: -0.03em;
          color: #f0e8d8;
          font-family: Georgia, "Times New Roman", serif;
        }
        .si-brand-accent {
          background: linear-gradient(120deg, #f5e8c8 0%, #e8c060 28%, #c9a040 50%, #e8c060 72%, #f5e8c8 100%);
          background-size: 220% auto;
          -webkit-background-clip: text;
          -webkit-text-fill-color: transparent;
          background-clip: text;
          animation: si-accent-shimmer 5s linear 0.5s infinite;
        }
        .si-brand-desc {
          font-size: 1rem;
          line-height: 1.78;
          color: rgba(240,232,216,0.5);
          font-family: system-ui, -apple-system, sans-serif;
          max-width: 38rem;
        }
        .si-brand-quote {
          border-left: 2px solid rgba(201,168,120,0.3);
          padding: 0.6rem 0 0.6rem 1.25rem;
          font-style: italic;
          font-size: 0.92rem;
          line-height: 1.65;
          color: rgba(240,232,216,0.42);
          font-family: Georgia, serif;
        }
        .si-brand-quote-mark {
          display: block;
          font-size: 2rem;
          line-height: 0.6;
          color: rgba(201,168,120,0.25);
          margin-bottom: 0.5rem;
          font-style: normal;
        }
        .si-brand-quote cite {
          display: block;
          margin-top: 0.55rem;
          font-style: normal;
          font-size: 0.72rem;
          font-weight: 700;
          letter-spacing: 0.14em;
          text-transform: uppercase;
          color: rgba(201,168,120,0.45);
          font-family: system-ui, -apple-system, sans-serif;
        }

        /* Form card */
        .si-panel {
          display: flex;
          align-items: center;
          justify-content: center;
          animation: si-fadein 0.7s cubic-bezier(0.16,1,0.3,1) 0.22s both;
        }
        .si-card {
          background: rgba(20,16,10,0.72);
          border: 1px solid rgba(255,255,255,0.08);
          border-radius: 22px;
          padding: 2.25rem 2rem;
          width: 100%;
          max-width: 400px;
          box-shadow:
            0 32px 64px rgba(0,0,0,0.35),
            0 0 0 1px rgba(255,255,255,0.04) inset;
          backdrop-filter: blur(20px);
          -webkit-backdrop-filter: blur(20px);
        }
        .si-card-hd { margin-bottom: 1.5rem; }
        .si-heading {
          font-size: 1.55rem;
          font-weight: 800;
          letter-spacing: -0.025em;
          color: #f0e8d8;
          font-family: Georgia, serif;
          margin-bottom: 0.3rem;
        }
        .si-sub {
          font-size: 0.88rem;
          color: rgba(240,232,216,0.45);
          line-height: 1.5;
          font-family: system-ui, -apple-system, sans-serif;
        }

        /* Tabs */
        .si-tab-row {
          display: flex;
          gap: 0;
          background: rgba(255,255,255,0.04);
          border: 1px solid rgba(255,255,255,0.08);
          border-radius: 10px;
          padding: 3px;
          margin-bottom: 1.5rem;
        }
        .si-tab {
          flex: 1;
          padding: 0.48rem;
          border: none;
          background: transparent;
          color: rgba(240,232,216,0.4);
          font-size: 0.85rem;
          font-weight: 600;
          font-family: system-ui, -apple-system, sans-serif;
          border-radius: 8px;
          cursor: pointer;
          transition: background 0.15s, color 0.15s;
        }
        .si-tab.active {
          background: rgba(201,168,120,0.16);
          color: #c9a878;
        }

        /* Form */
        .si-form { display: flex; flex-direction: column; gap: 1rem; }
        .si-field { display: flex; flex-direction: column; gap: 0.32rem; }
        .si-label {
          font-size: 0.77rem;
          font-weight: 600;
          color: rgba(240,232,216,0.55);
          letter-spacing: 0.03em;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .si-input {
          background: rgba(255,255,255,0.055);
          border: 1px solid rgba(255,255,255,0.1);
          border-radius: 10px;
          padding: 0.68rem 0.9rem;
          color: #f0e8d8;
          font-size: 0.93rem;
          font-family: system-ui, -apple-system, sans-serif;
          outline: none;
          transition: border-color 0.15s, box-shadow 0.15s;
          width: 100%;
        }
        .si-input::placeholder { color: rgba(240,232,216,0.22); }
        .si-input:focus {
          border-color: rgba(201,168,120,0.5);
          box-shadow: 0 0 0 3px rgba(201,168,120,0.1);
        }

        .si-remember {
          display: flex;
          align-items: center;
          gap: 0.52rem;
          cursor: pointer;
          font-size: 0.83rem;
          font-weight: 500;
          color: rgba(240,232,216,0.45);
          font-family: system-ui, -apple-system, sans-serif;
          user-select: none;
        }
        .si-remember input {
          width: 1rem; height: 1rem;
          flex-shrink: 0;
          accent-color: #c9a878;
          cursor: pointer;
        }

        .si-error {
          background: rgba(200,60,60,0.1);
          border: 1px solid rgba(200,60,60,0.25);
          border-radius: 9px;
          padding: 0.58rem 0.78rem;
          color: #e88888;
          font-size: 0.83rem;
          font-family: system-ui, -apple-system, sans-serif;
          line-height: 1.45;
        }

        .si-submit {
          margin-top: 0.2rem;
          padding: 0.75rem;
          background: linear-gradient(135deg, #c9a878 0%, #9e7a3c 100%);
          color: #1a0f00;
          border: none;
          border-radius: 10px;
          font-size: 0.93rem;
          font-weight: 700;
          font-family: system-ui, -apple-system, sans-serif;
          cursor: pointer;
          transition: opacity 0.15s, transform 0.15s, box-shadow 0.15s;
          width: 100%;
          box-shadow: 0 2px 14px rgba(201,168,120,0.2);
        }
        .si-submit:disabled { opacity: 0.4; cursor: not-allowed; }
        .si-submit:not(:disabled):hover { opacity: 0.9; transform: translateY(-1px); box-shadow: 0 6px 22px rgba(201,168,120,0.3); }

        .si-divider {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          margin: 1.2rem 0;
          color: rgba(240,232,216,0.25);
          font-size: 0.78rem;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .si-divider::before, .si-divider::after {
          content: '';
          flex: 1;
          height: 1px;
          background: rgba(255,255,255,0.07);
        }

        .si-guest {
          display: block;
          text-align: center;
          padding: 0.68rem;
          border: 1px solid rgba(255,255,255,0.1);
          border-radius: 10px;
          color: rgba(240,232,216,0.55);
          font-size: 0.88rem;
          font-weight: 600;
          font-family: system-ui, -apple-system, sans-serif;
          text-decoration: none;
          transition: border-color 0.15s, color 0.15s, background 0.15s;
        }
        .si-guest:hover {
          border-color: rgba(255,255,255,0.2);
          color: rgba(240,232,216,0.78);
          background: rgba(255,255,255,0.04);
        }

        /* Responsive */
        @media (max-width: 760px) {
          .si-main {
            grid-template-columns: 1fr;
            gap: 2rem;
            padding: 2rem 1.25rem 3rem;
            align-items: start;
          }
          .si-brand {
            text-align: center;
            align-items: center;
          }
          .si-brand-quote { text-align: left; }
          .si-brand-title { font-size: clamp(1.9rem, 7vw, 2.6rem); }
          .si-card { max-width: 100%; }
        }
        @media (max-width: 480px) {
          .si-nav { padding: 0.9rem 1.1rem; }
          .si-nav-actions .si-btn:first-child { display: none; }
        }
      `}</style>
    </div>
  );
}
