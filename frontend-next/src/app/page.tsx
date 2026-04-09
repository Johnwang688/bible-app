import type { Metadata } from 'next';
import Link from 'next/link';

export const metadata: Metadata = {
  title: 'Open Bible — Scripture, study, and insight',
  description:
    'Open Bible is a modern Bible reader with AI-powered commentary, cross-references, translations, and study tools.',
};

export default function LandingPage() {
  return (
    <div className="landing-root">
      {/* Dynamic RGB wash overlay — fixed, sits behind all content */}
      <div className="landing-wash" aria-hidden="true" />

      {/* Nav */}
      <nav className="landing-nav">
        <Link href="/" className="landing-logo" aria-label="Open Bible home">
          <img
            className="landing-logo-img"
            src="/logo/openbible-logo.png"
            alt=""
            width={36}
            height={36}
            aria-hidden="true"
          />
          <span className="landing-logo-open">Open</span>
          <span className="landing-logo-bible"> Bible</span>
        </Link>
        <div className="landing-nav-actions">
          <Link href="/signin" className="landing-btn landing-btn-ghost">Sign In</Link>
          <Link href="/app" className="landing-btn landing-btn-primary">Continue as Guest</Link>
        </div>
      </nav>

      {/* Hero */}
      <section className="landing-hero">
        <p className="landing-hero-eyebrow">Open Bible</p>
        <h1 className="landing-hero-title">Read Scripture.<br />Understand it Deeply.</h1>
        <p className="landing-hero-sub">
          Open Bible brings AI-powered commentary, cross-references, and study tools together in one
          place — for anyone who wants to engage more meaningfully with the text.
        </p>
        <div className="landing-hero-actions">
          <Link href="/app" className="landing-btn landing-btn-primary landing-btn-lg">
            Open the App
          </Link>
        </div>
      </section>

      {/* Feature cards */}
      <section className="landing-features">
        <FeatureCard
          title="AI Commentary"
          desc="Ask questions about any passage and get thoughtful, contextual answers powered by AI. Explore historical background, literary context, and theological meaning."
        />
        <FeatureCard
          title="Multiple Translations"
          desc="Read and compare across dozens of Bible translations side by side. Switch instantly between KJV, NIV, ESV, and more without losing your place."
        />
        <FeatureCard
          title="Study Tools"
          desc="Highlight verses, add personal notes, and build a reading history that syncs across devices. Bookmark passages and return to them anytime."
        />
        <FeatureCard
          title="Reading Plans"
          desc="Follow structured reading plans to work through the Bible at your own pace. Track progress and pick up right where you left off."
        />
        <FeatureCard
          title="Themes & Customization"
          desc="Choose from a wide range of themes — from classic parchment to dark mode — and adjust font size and layout to match your reading style."
        />
        <FeatureCard
          title="Works Offline"
          desc="Once loaded, the app keeps working without an internet connection. Your notes and highlights are saved locally and sync when you're back online."
        />
      </section>

      {/* Footer CTA */}
      <section className="landing-cta">
        <h2>Ready to start reading?</h2>
        <p>No account required. Jump right in and explore.</p>
        <Link href="/app" className="landing-btn landing-btn-primary landing-btn-lg">
          Continue as Guest
        </Link>
      </section>

      <footer className="landing-footer">
        <span>© {new Date().getFullYear()} Open Bible</span>
      </footer>

      <style>{`
        body { overflow: auto !important; height: auto !important; }
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        /* ── Dynamic RGB wash keyframes ── */
        /* Mirrors the app's DYNAMIC_COLORS cycle: red→yellow→green→cyan→blue→magenta */
        /* Each color fades in then out over 6 s (DYNAMIC_CYCLE_MS); 6 colors = 36 s total */
        @keyframes landing-wash {
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

        /* Root — cream base, same as the app's default theme */
        .landing-root {
          min-height: 100vh;
          font-family: Georgia, "Times New Roman", serif;
          background: #f7f7f7;
          color: #221d16;
          display: flex;
          flex-direction: column;
          position: relative;
        }

        /* Fixed colour-wash overlay */
        .landing-wash {
          position: fixed;
          inset: 0;
          z-index: 0;
          pointer-events: none;
          animation: landing-wash 36s linear infinite;
        }
        @media (prefers-reduced-motion: reduce) {
          .landing-wash { animation: none; }
        }

        /* All content sits above the wash */
        .landing-nav,
        .landing-hero,
        .landing-features,
        .landing-cta,
        .landing-footer {
          position: relative;
          z-index: 1;
        }

        /* Nav */
        .landing-nav {
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
        .landing-logo {
          font-size: 1.2rem;
          font-weight: 700;
          letter-spacing: 0.02em;
          text-decoration: none;
          display: inline-flex;
          align-items: center;
          gap: 0.5rem;
        }
        .landing-logo-img {
          display: block;
          width: 36px;
          height: 36px;
          object-fit: contain;
          flex-shrink: 0;
        }
        .landing-logo-open {
          color: #221d16;
        }
        .landing-logo-bible {
          color: #6d4c31;
        }
        .landing-nav-actions {
          display: flex;
          gap: 0.75rem;
          align-items: center;
        }

        /* Buttons */
        .landing-btn {
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
        .landing-btn-ghost {
          background: transparent;
          color: #6d4c31;
          border: 1px solid rgba(109,76,49,0.3);
        }
        .landing-btn-ghost:hover { background: rgba(109,76,49,0.07); }
        .landing-btn-primary {
          background: #6d4c31;
          color: #fff8ef;
        }
        .landing-btn-primary:hover { opacity: 0.87; }
        .landing-btn-lg {
          padding: 0.8rem 2rem;
          font-size: 1rem;
          border-radius: 10px;
        }

        /* Hero */
        .landing-hero {
          text-align: center;
          padding: 7rem 1.5rem 5rem;
          max-width: 720px;
          margin: 0 auto;
        }
        .landing-hero-eyebrow {
          font-size: 0.72rem;
          font-weight: 700;
          letter-spacing: 0.28em;
          text-transform: uppercase;
          color: #6d4c31;
          margin-bottom: 1rem;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .landing-hero-title {
          font-size: clamp(2.4rem, 6vw, 3.6rem);
          font-weight: 800;
          line-height: 1.15;
          letter-spacing: -0.02em;
          color: #221d16;
          margin-bottom: 1.25rem;
        }
        .landing-hero-sub {
          font-size: 1.1rem;
          line-height: 1.7;
          color: #7a6554;
          max-width: 540px;
          margin: 0 auto 2.25rem;
        }
        .landing-hero-actions {
          display: flex;
          justify-content: center;
        }

        /* Features */
        .landing-features {
          display: grid;
          grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
          gap: 1.25rem;
          padding: 2rem 2.5rem 5rem;
          max-width: 1100px;
          margin: 0 auto;
          width: 100%;
        }
        .feature-card {
          background: rgba(255, 253, 248, 0.78);
          border: 1px solid rgba(221, 210, 195, 0.9);
          border-radius: 14px;
          padding: 1.75rem 1.5rem;
          transition: border-color 0.2s, background 0.2s;
          backdrop-filter: blur(6px);
        }
        .feature-card:hover {
          border-color: rgba(109,76,49,0.35);
          background: rgba(255, 253, 248, 0.92);
        }
        .feature-card h3 {
          font-size: 1.05rem;
          font-weight: 700;
          color: #6d4c31;
          margin-bottom: 0.6rem;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .feature-card p {
          font-size: 0.9rem;
          line-height: 1.65;
          color: #8a7a68;
          font-family: system-ui, -apple-system, sans-serif;
        }

        /* Footer CTA */
        .landing-cta {
          text-align: center;
          padding: 4rem 1.5rem;
          background: rgba(255, 253, 248, 0.72);
          border-top: 1px solid rgba(221,210,195,0.85);
          border-bottom: 1px solid rgba(221,210,195,0.85);
          backdrop-filter: blur(8px);
        }
        .landing-cta h2 {
          font-size: 2rem;
          font-weight: 700;
          color: #221d16;
          margin-bottom: 0.5rem;
        }
        .landing-cta p {
          color: #8a7a68;
          margin-bottom: 1.75rem;
          font-size: 1rem;
          font-family: system-ui, -apple-system, sans-serif;
        }

        /* Footer */
        .landing-footer {
          text-align: center;
          padding: 1.5rem;
          color: #9d8d7b;
          font-size: 0.8rem;
          font-family: system-ui, -apple-system, sans-serif;
        }
      `}</style>
    </div>
  );
}

function FeatureCard({ title, desc }: { title: string; desc: string }) {
  return (
    <div className="feature-card">
      <h3>{title}</h3>
      <p>{desc}</p>
    </div>
  );
}
