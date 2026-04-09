import type { Metadata } from 'next';
import Link from 'next/link';
import LandingHero from '@/components/LandingHero';

export const metadata: Metadata = {
  title: 'Open Bible - Scripture, study, and insight',
  description:
    'Open Bible is a modern Bible reader with AI-powered commentary, cross-references, translations, and study tools.',
};

export default function LandingPage() {
  const useCases = [
    {
      eyebrow: 'Immersive Reading',
      title: 'Stay in the flow, not the footnotes.',
      desc:
        'A reading experience built to keep you moving — tools appear when you need them and disappear when you don\'t.',
      bullets: [
        'Pick up exactly where you left off, every time.',
        'Commentary opens beside the passage — no tab-switching.',
        'Tune the layout and typography to match how you like to read.',
      ],
    },
    {
      eyebrow: 'Intelligent Context',
      title: 'Ask anything. Stay in the passage.',
      desc:
        'Your AI study companion lives inside the reader. Ask about a verse or a theme mid-chapter — and keep going without losing your thread.',
      bullets: [
        'Ask in-context questions without leaving the chapter.',
        'Go from a quick clarification to deep theological insight.',
        'Every answer stays anchored to what you\'re reading.',
      ],
      align: 'right' as const,
    },
    {
      eyebrow: 'Daily Practice',
      title: 'Build a reading habit worth keeping.',
      desc:
        'Small signals, steady progress. Open Bible makes it easy to return — and even easier to want to.',
      bullets: [
        'Your streak, daily goal, and verse of the day — always visible.',
        'Never hunt for your place. Always know your next chapter.',
        'Watch your mastery grow as you move through Scripture.',
      ],
    },
  ];

  return (
    <div className="landing-root">
      {/* Dynamic RGB wash overlay - fixed, sits behind all content */}
      <div className="landing-wash" aria-hidden="true" />

      {/* Nav */}
      <nav className="landing-nav">
        <Link href="/" className="landing-logo" aria-label="Open Bible home">
          <img
            className="landing-logo-img"
            src="/logo/openbible-logo-black.png"
            alt=""
            width={36}
            height={36}
            aria-hidden="true"
          />
          <span className="landing-logo-open">Open</span>
          <span className="landing-logo-bible"> Bible</span>
        </Link>
        <div className="landing-nav-actions">
          <Link href="/signin" className="landing-btn landing-btn-ghost">
            Sign In
          </Link>
          <Link href="/app" className="landing-btn landing-btn-primary">
            Continue as Guest
          </Link>
        </div>
      </nav>

      <LandingHero />

      {/* Use cases */}
      <section className="landing-features">
        <div className="landing-section-heading">
          <p className="landing-section-eyebrow">How it helps</p>
          <h2 className="landing-section-title">Built around the way people actually read and study.</h2>
        </div>
        {useCases.map((item) => (
          <FeatureSection
            key={item.title}
            eyebrow={item.eyebrow}
            title={item.title}
            desc={item.desc}
            bullets={item.bullets}
            align={item.align}
          />
        ))}
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
        <span>&copy; {new Date().getFullYear()} Open Bible</span>
      </footer>

      <style>{`
        body { overflow: auto !important; height: auto !important; }
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

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

        .landing-root {
          --landing-nav-height: 4.65rem;
          min-height: 100vh;
          font-family: Georgia, "Times New Roman", serif;
          background: #f7f7f7;
          color: #221d16;
          display: flex;
          flex-direction: column;
          position: relative;
        }

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

        .landing-nav,
        .landing-features,
        .landing-cta,
        .landing-footer {
          position: relative;
          z-index: 1;
        }

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

        .landing-features {
          display: flex;
          flex-direction: column;
          gap: 1.25rem;
          padding: 2rem 2rem 5rem;
          max-width: 1120px;
          margin: 0 auto;
          width: 100%;
        }
        .landing-section-heading {
          max-width: 50rem;
          margin: 0 auto;
          padding: 0 0.25rem 1.25rem;
          text-align: center;
        }
        .landing-section-eyebrow {
          font-size: 0.74rem;
          font-weight: 800;
          letter-spacing: 0.18em;
          text-transform: uppercase;
          color: #6d4c31;
          margin-bottom: 0.85rem;
          font-family: system-ui, -apple-system, sans-serif;
          opacity: 0.8;
        }
        .landing-section-title {
          font-size: clamp(2rem, 4.2vw, 3.35rem);
          line-height: 1.02;
          letter-spacing: -0.04em;
          color: #221d16;
          margin: 0 auto 1rem;
          max-width: 13ch;
          text-wrap: balance;
        }
        .landing-section-copy {
          font-size: 0.98rem;
          line-height: 1.7;
          color: #8a7a68;
          font-family: system-ui, -apple-system, sans-serif;
          max-width: 40rem;
          margin: 0 auto;
          text-wrap: pretty;
        }
        .feature-section {
          position: relative;
          overflow: hidden;
          min-height: 420px;
          display: grid;
          grid-template-columns: minmax(0, 1.3fr) minmax(280px, 0.7fr);
          gap: 3rem;
          align-items: center;
          background:
            radial-gradient(circle at top right, rgba(214, 185, 140, 0.22), transparent 34%),
            linear-gradient(135deg, rgba(255, 253, 248, 0.92), rgba(247, 240, 225, 0.86));
          border: 1px solid rgba(221, 210, 195, 0.9);
          border-radius: 32px;
          padding: 3.5rem 4rem;
          transition: border-color 0.2s, transform 0.2s;
          backdrop-filter: blur(10px);
          box-shadow: 0 24px 60px rgba(88, 63, 38, 0.1);
        }
        .feature-section:hover {
          border-color: rgba(109,76,49,0.35);
          transform: translateY(-2px);
        }
        .feature-section::after {
          content: '';
          position: absolute;
          inset: auto -4rem -5rem auto;
          width: 15rem;
          height: 15rem;
          border-radius: 999px;
          background: rgba(109, 76, 49, 0.08);
          filter: blur(6px);
          pointer-events: none;
        }
        .feature-section[data-align="right"] {
          grid-template-columns: minmax(260px, 0.8fr) minmax(0, 1.2fr);
        }
        .feature-section-copy,
        .feature-section-aside {
          position: relative;
          z-index: 1;
        }
        .feature-section-copy {
          display: flex;
          flex-direction: column;
          justify-content: center;
          max-width: 44rem;
        }
        .feature-section-eyebrow {
          display: inline-block;
          margin-bottom: 1rem;
        }
        .feature-section h3 {
          font-size: clamp(2rem, 3.2vw, 2.9rem);
          line-height: 1.06;
          letter-spacing: -0.035em;
          color: #221d16;
          margin-bottom: 1.1rem;
        }
        .feature-section p {
          font-size: 1.05rem;
          line-height: 1.8;
          color: #8a7a68;
          max-width: 36rem;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .feature-section-aside {
          display: flex;
          align-items: center;
          justify-content: center;
        }
        .feature-section-points {
          list-style: none;
          width: 100%;
          max-width: 26rem;
          display: grid;
          gap: 1rem;
        }
        .feature-section-points li {
          padding: 1.1rem 1.25rem;
          border-radius: 18px;
          border: 1px solid rgba(109, 76, 49, 0.13);
          background: rgba(255, 250, 241, 0.65);
          color: #5f4f40;
          line-height: 1.6;
          font-size: 0.97rem;
          font-family: system-ui, -apple-system, sans-serif;
          box-shadow: inset 0 1px 0 rgba(255,255,255,0.5), 0 2px 8px rgba(88,63,38,0.04);
        }

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

        .landing-footer {
          text-align: center;
          padding: 1.5rem;
          color: #9d8d7b;
          font-size: 0.8rem;
          font-family: system-ui, -apple-system, sans-serif;
        }

        @media (max-width: 860px) {
          .landing-nav {
            padding: 1rem;
          }
          .landing-features {
            padding-left: 1rem;
            padding-right: 1rem;
          }
          .feature-section,
          .feature-section[data-align="right"] {
            grid-template-columns: 1fr;
            min-height: auto;
            padding: 2rem;
            gap: 1.75rem;
          }
          .feature-section-copy,
          .feature-section-aside,
          .feature-section-points {
            max-width: none;
          }
        }
      `}</style>
    </div>
  );
}

function FeatureSection({
  eyebrow,
  title,
  desc,
  bullets,
  align = 'left',
}: {
  eyebrow: string;
  title: string;
  desc: string;
  bullets: string[];
  align?: 'left' | 'right';
}) {
  return (
    <article className="feature-section" data-align={align}>
      <div className="feature-section-copy">
        <span className="feature-section-eyebrow">{eyebrow}</span>
        <h3>{title}</h3>
        <p>{desc}</p>
      </div>
      <div className="feature-section-aside">
        <ul className="feature-section-points">
          {bullets.map((bullet) => (
            <li key={bullet}>{bullet}</li>
          ))}
        </ul>
      </div>
    </article>
  );
}
