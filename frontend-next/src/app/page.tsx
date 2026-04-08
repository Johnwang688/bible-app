import Link from 'next/link';

export default function LandingPage() {
  return (
    <div className="landing-root">
      {/* Nav */}
      <nav className="landing-nav">
        <span className="landing-logo">BibleApp</span>
        <div className="landing-nav-actions">
          <Link href="/signin" className="landing-btn landing-btn-ghost">Sign In</Link>
          <Link href="/app" className="landing-btn landing-btn-primary">Continue as Guest</Link>
        </div>
      </nav>

      {/* Hero */}
      <section className="landing-hero">
        <h1 className="landing-hero-title">Read Scripture.<br />Understand it Deeply.</h1>
        <p className="landing-hero-sub">
          A modern Bible reader with AI-powered commentary, cross-references, and study tools —
          built for anyone who wants to engage more meaningfully with the text.
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
        <span>© {new Date().getFullYear()} BibleApp</span>
      </footer>

      <style>{`
        body { overflow: auto !important; height: auto !important; }
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        .landing-root {
          min-height: 100vh;
          font-family: system-ui, -apple-system, sans-serif;
          background: #0f0f14;
          color: #e8e8f0;
          display: flex;
          flex-direction: column;
        }

        /* Nav */
        .landing-nav {
          display: flex;
          align-items: center;
          justify-content: space-between;
          padding: 1.2rem 2.5rem;
          border-bottom: 1px solid rgba(255,255,255,0.07);
          position: sticky;
          top: 0;
          background: rgba(15,15,20,0.92);
          backdrop-filter: blur(10px);
          z-index: 100;
        }
        .landing-logo {
          font-size: 1.2rem;
          font-weight: 700;
          letter-spacing: 0.02em;
          color: #c8a97e;
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
        }
        .landing-btn-ghost {
          background: transparent;
          color: #c8c8d8;
          border: 1px solid rgba(255,255,255,0.15);
        }
        .landing-btn-ghost:hover { background: rgba(255,255,255,0.06); }
        .landing-btn-primary {
          background: #c8a97e;
          color: #1a1208;
        }
        .landing-btn-primary:hover { opacity: 0.88; }
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
        .landing-hero-title {
          font-size: clamp(2.4rem, 6vw, 3.6rem);
          font-weight: 800;
          line-height: 1.15;
          letter-spacing: -0.02em;
          color: #f0ead8;
          margin-bottom: 1.25rem;
        }
        .landing-hero-sub {
          font-size: 1.1rem;
          line-height: 1.7;
          color: #9898b0;
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
          background: rgba(255,255,255,0.04);
          border: 1px solid rgba(255,255,255,0.08);
          border-radius: 14px;
          padding: 1.75rem 1.5rem;
          transition: border-color 0.2s;
        }
        .feature-card:hover { border-color: rgba(200,169,126,0.35); }
        .feature-card h3 {
          font-size: 1.05rem;
          font-weight: 700;
          color: #c8a97e;
          margin-bottom: 0.6rem;
        }
        .feature-card p {
          font-size: 0.9rem;
          line-height: 1.65;
          color: #8888a0;
        }

        /* Footer CTA */
        .landing-cta {
          text-align: center;
          padding: 4rem 1.5rem;
          background: rgba(200,169,126,0.06);
          border-top: 1px solid rgba(200,169,126,0.12);
          border-bottom: 1px solid rgba(200,169,126,0.12);
        }
        .landing-cta h2 {
          font-size: 2rem;
          font-weight: 700;
          color: #f0ead8;
          margin-bottom: 0.5rem;
        }
        .landing-cta p {
          color: #8888a0;
          margin-bottom: 1.75rem;
          font-size: 1rem;
        }

        /* Footer */
        .landing-footer {
          text-align: center;
          padding: 1.5rem;
          color: #505060;
          font-size: 0.8rem;
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
