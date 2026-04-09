'use client';
import Link from 'next/link';
import { useEffect } from 'react';

export default function LandingClient() {
  useEffect(() => {
    // Scroll-reveal
    const obs = new IntersectionObserver(
      (entries) => {
        entries.forEach((e) => {
          if (e.isIntersecting) e.target.classList.add('is-visible');
        });
      },
      { threshold: 0.08, rootMargin: '0px 0px -48px 0px' }
    );
    document.querySelectorAll('[data-reveal]').forEach((el) => obs.observe(el));

    // Nav transparent → frosted on scroll
    const nav = document.querySelector<HTMLElement>('.land-nav');
    const onScroll = () => {
      nav?.classList.toggle('land-nav--scrolled', window.scrollY > 48);
    };
    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();

    return () => {
      obs.disconnect();
      window.removeEventListener('scroll', onScroll);
    };
  }, []);

  return (
    <>
      {/* ── NAV ──────────────────────────────────────────────── */}
      <nav className="land-nav">
        <Link href="/" className="land-logo" aria-label="Open Bible home">
          <img
            src="/logo/openbible-logo-black.png"
            alt=""
            width={30}
            height={30}
            className="land-logo-img"
          />
          <span className="land-logo-text">
            Open<span className="land-logo-accent"> Bible</span>
          </span>
        </Link>
        <div className="land-nav-actions">
          <Link href="/signin" className="land-btn land-btn-ghost">
            Sign In
          </Link>
          <Link href="/app" className="land-btn land-btn-nav-primary">
            Open the App
          </Link>
        </div>
      </nav>

      {/* ── HERO ─────────────────────────────────────────────── */}
      <section className="land-hero">
        {/* Dot-grid texture */}
        <div className="land-hero-grid" aria-hidden="true" />
        {/* Ambient orbs */}
        <div className="land-orb land-orb-1" aria-hidden="true" />
        <div className="land-orb land-orb-2" aria-hidden="true" />
        <div className="land-orb land-orb-3" aria-hidden="true" />

        <div className="land-hero-inner">
          <span className="land-eyebrow">Open Bible</span>
          <h1 className="land-hero-title">
            Read Scripture.<br />
            <span className="land-hero-shimmer">Understand it Deeply.</span>
          </h1>
          <p className="land-hero-sub">
            AI-powered commentary, cross-references, and study tools —
            all in one place for anyone who wants to engage more
            meaningfully with the text.
          </p>
          <div className="land-hero-actions">
            <Link href="/app" className="land-btn land-btn-gold land-btn-lg">
              Open the App
              <ArrowRight />
            </Link>
            <Link href="/signin" className="land-btn land-btn-outline-light land-btn-lg">
              Sign In
            </Link>
          </div>
          <p className="land-hero-no-acct">No account required</p>
        </div>

        <div className="land-scroll-ind" aria-hidden="true">
          <div className="land-scroll-line" />
        </div>

        {/* Fade to light section */}
        <div className="land-hero-fade" aria-hidden="true" />
      </section>

      {/* ── STATS BAR ────────────────────────────────────────── */}
      <div className="land-stats" data-reveal>
        <div className="land-stats-inner">
          <Stat num="66" label="Books" />
          <div className="land-stat-div" />
          <Stat num="31,102" label="Verses" />
          <div className="land-stat-div" />
          <Stat num="6+" label="Translations" />
          <div className="land-stat-div" />
          <Stat num="AI" label="Powered Study" />
        </div>
      </div>

      {/* ── FEATURES ─────────────────────────────────────────── */}
      <section className="land-features">
        <div className="land-features-inner">

          {/* 1 — Ask Anything */}
          <div className="land-feat-row" data-reveal>
            <div className="land-feat-copy">
              <span className="land-eyebrow-sm">Ask Anything</span>
              <h2 className="land-feat-title">
                An AI study companion that stays in the text
              </h2>
              <p className="land-feat-desc">
                Chat through any passage in plain language and get contextual
                help on background, meaning, and connections — without leaving
                your reading flow.
              </p>
              <ul className="land-feat-list">
                <li>Ask about any verse, scene, or chapter</li>
                <li>Move from quick clarification to deeper study</li>
                <li>Use as a companion for reflection, not just lookup</li>
              </ul>
            </div>
            <div className="land-feat-visual">
              <div className="land-mock-win">
                <div className="land-mock-bar">
                  <span className="dot dot-r" /><span className="dot dot-y" /><span className="dot dot-g" />
                  <span className="land-mock-title">AI Commentary</span>
                </div>
                <div className="land-mock-chat">
                  <div className="land-chat-msg land-chat-user">
                    What does "living water" mean in John 4?
                  </div>
                  <div className="land-chat-msg land-chat-ai">
                    <span className="land-chat-ai-name">Open Bible</span>
                    In John&nbsp;4, Jesus uses "living water" as a metaphor for
                    spiritual life. In Hebrew culture "living water" referred to
                    flowing springs contrasted with stagnant cisterns. Jesus
                    transforms this into a symbol for the Holy Spirit and
                    eternal life he offers to all who ask…
                  </div>
                  <div className="land-chat-cursor" aria-hidden="true" />
                </div>
              </div>
            </div>
          </div>

          {/* 2 — Read Your Way */}
          <div className="land-feat-row land-feat-row--rev" data-reveal>
            <div className="land-feat-copy">
              <span className="land-eyebrow-sm">Read Your Way</span>
              <h2 className="land-feat-title">
                A reader built for long, focused sessions
              </h2>
              <p className="land-feat-desc">
                Shape the reading experience around your eyes, your habits,
                and your pace with adjustable typography, layout, and
                visual themes.
              </p>
              <ul className="land-feat-list">
                <li>Warm parchment, dark themes, and more</li>
                <li>Tune font size and line spacing</li>
                <li>Personal instead of one-size-fits-all</li>
              </ul>
            </div>
            <div className="land-feat-visual">
              <div className="land-mock-win land-mock-win--light">
                <div className="land-mock-bar land-mock-bar--light">
                  <span className="dot dot-r" /><span className="dot dot-y" /><span className="dot dot-g" />
                  <span className="land-mock-title land-mock-title--light">Appearance</span>
                </div>
                <div className="land-mock-themes-grid">
                  {[
                    ['Default',   'swatch-default'],
                    ['Dark',      'swatch-dark'],
                    ['Parchment', 'swatch-parchment'],
                    ['Galaxy',    'swatch-galaxy'],
                    ['Teal',      'swatch-teal'],
                    ['Pink',      'swatch-pink'],
                  ].map(([name, cls]) => (
                    <div key={name} className={`land-swatch ${cls}`}>
                      <span>{name}</span>
                    </div>
                  ))}
                </div>
                <div className="land-mock-reader-preview">
                  <p className="land-mock-verse">
                    <sup>1</sup>In the beginning God created the heavens and
                    the earth. <sup>2</sup>Now the earth was formless and
                    empty, darkness was over the surface of the deep…
                  </p>
                </div>
              </div>
            </div>
          </div>

          {/* 3 — Bigger Picture */}
          <div className="land-feat-row" data-reveal>
            <div className="land-feat-copy">
              <span className="land-eyebrow-sm">See The Bigger Picture</span>
              <h2 className="land-feat-title">
                Summaries, character arcs, and theme connections
              </h2>
              <p className="land-feat-desc">
                Get chapter and book summaries that surface the movement of
                the story, recurring ideas, and the people who shape each
                passage.
              </p>
              <ul className="land-feat-list">
                <li>Trace how characters develop across scenes</li>
                <li>Spot repeated themes and their connections</li>
                <li>Turn difficult passages into clearer maps</li>
              </ul>
            </div>
            <div className="land-feat-visual">
              <div className="land-mock-win">
                <div className="land-mock-bar">
                  <span className="dot dot-r" /><span className="dot dot-y" /><span className="dot dot-g" />
                  <span className="land-mock-title">Chapter Summary</span>
                </div>
                <div className="land-mock-summary">
                  <div className="land-mock-sum-label">Genesis · Chapter 1</div>
                  <div className="land-mock-sum-title">Creation &amp; Order</div>
                  <div className="land-mock-tags">
                    {['Creation','God','Light','Sovereignty','Humanity'].map((t) => (
                      <span key={t} className="land-mock-tag">{t}</span>
                    ))}
                  </div>
                  <p className="land-mock-sum-body">
                    God speaks the cosmos into existence over six days, imposing
                    order on formless chaos. Each act builds on the last,
                    culminating in humanity made in God's image — uniquely
                    tasked with stewardship of all creation…
                  </p>
                  <div className="land-mock-people">
                    <div className="land-mock-person-chip">God</div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </section>

      {/* ── QUOTE ────────────────────────────────────────────── */}
      <section className="land-quote" data-reveal>
        <div className="land-quote-inner">
          <div className="land-quote-ornament" aria-hidden="true">"</div>
          <blockquote className="land-blockquote">
            Your word is a lamp to my feet<br />and a light to my path.
          </blockquote>
          <cite className="land-quote-cite">Psalm 119:105</cite>
        </div>
      </section>

      {/* ── CTA ──────────────────────────────────────────────── */}
      <section className="land-cta" data-reveal>
        <div className="land-cta-inner">
          <h2 className="land-cta-title">Ready to start reading?</h2>
          <p className="land-cta-sub">
            No account required. Jump right in and explore.
          </p>
          <div className="land-cta-actions">
            <Link href="/app" className="land-btn land-btn-brown land-btn-lg">
              Continue as Guest
              <ArrowRight />
            </Link>
            <Link href="/signin" className="land-btn land-btn-outline-dark land-btn-lg">
              Create an Account
            </Link>
          </div>
        </div>
      </section>

      {/* ── FOOTER ───────────────────────────────────────────── */}
      <footer className="land-footer">
        <span>© {new Date().getFullYear()} Open Bible</span>
      </footer>

      {/* ── STYLES ───────────────────────────────────────────── */}
      <style>{`
        body { overflow: auto !important; height: auto !important; }
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        /* ---- KEYFRAMES ---- */
        @keyframes orb1 {
          0%,100% { transform: translate(-50%, 0) scale(1); }
          33%      { transform: translate(calc(-50% + 50px), -40px) scale(1.07); }
          66%      { transform: translate(calc(-50% - 35px), 25px) scale(0.95); }
        }
        @keyframes orb2 {
          0%,100% { transform: translate(0, 0) scale(1); }
          40%      { transform: translate(-35px, 30px) scale(1.1); }
          72%      { transform: translate(25px, -18px) scale(0.93); }
        }
        @keyframes orb3 {
          0%,100% { transform: translate(0, 0); }
          50%      { transform: translate(22px, 32px); }
        }
        @keyframes hero-in {
          from { opacity: 0; transform: translateY(28px); }
          to   { opacity: 1; transform: translateY(0); }
        }
        @keyframes shimmer {
          from { background-position: 200% center; }
          to   { background-position: -200% center; }
        }
        @keyframes scroll-line {
          0%,100% { transform: scaleY(0); transform-origin: top; opacity: 0.6; }
          50%      { transform: scaleY(1); transform-origin: top; opacity: 1; }
        }
        @keyframes blink {
          0%,100% { opacity: 1; }
          50%      { opacity: 0; }
        }

        /* ---- SCROLL REVEAL ---- */
        [data-reveal] {
          opacity: 0;
          transform: translateY(30px);
          transition:
            opacity 0.8s cubic-bezier(0.16, 1, 0.3, 1),
            transform 0.8s cubic-bezier(0.16, 1, 0.3, 1);
        }
        [data-reveal].is-visible { opacity: 1; transform: translateY(0); }
        @media (prefers-reduced-motion: reduce) {
          [data-reveal] { opacity: 1; transform: none; transition: none; }
          .land-hero-shimmer { animation: none !important; }
          .land-orb { animation: none !important; }
          .land-scroll-line { animation: none !important; }
        }

        /* ---- NAV ---- */
        .land-nav {
          position: fixed;
          inset: 0 0 auto 0;
          z-index: 100;
          display: flex;
          align-items: center;
          justify-content: space-between;
          padding: 1rem 2.5rem;
          border-bottom: 1px solid transparent;
          transition: background 0.4s, border-color 0.4s;
        }
        .land-nav--scrolled {
          background: rgba(10, 8, 5, 0.92);
          border-color: rgba(201, 168, 120, 0.18);
          backdrop-filter: blur(24px);
          -webkit-backdrop-filter: blur(24px);
        }
        .land-logo {
          display: inline-flex;
          align-items: center;
          gap: 0.55rem;
          text-decoration: none;
          font-size: 1.12rem;
          font-weight: 700;
          letter-spacing: 0.01em;
          color: #f0e8d8;
        }
        .land-logo-img {
          width: 30px; height: 30px;
          object-fit: contain;
          filter: brightness(0) invert(1);
          flex-shrink: 0;
        }
        .land-logo-text { color: #f0e8d8; }
        .land-logo-accent { color: #c9a878; }
        .land-nav-actions {
          display: flex;
          gap: 0.7rem;
          align-items: center;
        }

        /* ---- BUTTONS ---- */
        .land-btn {
          display: inline-flex;
          align-items: center;
          gap: 0.45rem;
          padding: 0.55rem 1.15rem;
          border-radius: 9px;
          font-size: 0.875rem;
          font-weight: 600;
          text-decoration: none;
          font-family: system-ui, -apple-system, sans-serif;
          cursor: pointer;
          border: none;
          white-space: nowrap;
          transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .land-btn-lg {
          padding: 0.82rem 1.9rem;
          font-size: 1rem;
          border-radius: 11px;
        }
        /* Nav ghost (on dark) */
        .land-btn-ghost {
          background: transparent;
          color: rgba(240, 232, 216, 0.7);
          border: 1px solid rgba(240, 232, 216, 0.2);
        }
        .land-btn-ghost:hover {
          color: #f0e8d8;
          border-color: rgba(240, 232, 216, 0.4);
          background: rgba(240, 232, 216, 0.07);
        }
        /* Nav primary gold-ish (dark bg) */
        .land-btn-nav-primary {
          background: rgba(201, 168, 120, 0.18);
          color: #c9a878;
          border: 1px solid rgba(201, 168, 120, 0.35);
        }
        .land-btn-nav-primary:hover {
          background: rgba(201, 168, 120, 0.28);
          border-color: rgba(201, 168, 120, 0.55);
        }
        /* Hero gold (on dark) */
        .land-btn-gold {
          background: linear-gradient(135deg, #c9a878 0%, #a07840 100%);
          color: #1a0f00;
          font-weight: 700;
          box-shadow: 0 0 0 0 rgba(201, 168, 120, 0.4);
        }
        .land-btn-gold:hover {
          transform: translateY(-2px);
          box-shadow: 0 6px 24px rgba(201, 168, 120, 0.4);
        }
        /* Hero outline (on dark) */
        .land-btn-outline-light {
          background: transparent;
          color: rgba(240, 232, 216, 0.82);
          border: 1.5px solid rgba(240, 232, 216, 0.28);
        }
        .land-btn-outline-light:hover {
          border-color: rgba(240, 232, 216, 0.55);
          color: #f0e8d8;
          background: rgba(240, 232, 216, 0.06);
        }
        /* CTA primary (on light) */
        .land-btn-brown {
          background: linear-gradient(135deg, #7a5235 0%, #5a3a22 100%);
          color: #fff8ef;
          font-weight: 700;
          box-shadow: 0 2px 14px rgba(90, 58, 34, 0.3);
        }
        .land-btn-brown:hover {
          transform: translateY(-2px);
          box-shadow: 0 6px 24px rgba(90, 58, 34, 0.4);
        }
        /* CTA outline (on light) */
        .land-btn-outline-dark {
          background: transparent;
          color: #6d4c31;
          border: 1.5px solid rgba(109, 76, 49, 0.35);
        }
        .land-btn-outline-dark:hover {
          background: rgba(109, 76, 49, 0.06);
          border-color: rgba(109, 76, 49, 0.55);
        }

        /* ---- HERO ---- */
        .land-hero {
          position: relative;
          min-height: 100svh;
          min-height: 100vh;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          overflow: hidden;
          padding: 7rem 1.5rem 5rem;
          background: #0c0a07;
        }
        /* Subtle dot grid */
        .land-hero-grid {
          position: absolute;
          inset: 0;
          background-image: radial-gradient(
            circle,
            rgba(201, 168, 120, 0.07) 1px,
            transparent 1px
          );
          background-size: 36px 36px;
          pointer-events: none;
          z-index: 0;
        }
        /* Ambient glow orbs */
        .land-orb {
          position: absolute;
          border-radius: 50%;
          pointer-events: none;
          filter: blur(90px);
        }
        .land-orb-1 {
          width: 720px; height: 720px;
          background: radial-gradient(circle at 35%, #b07840 0%, #5c2c10 55%, transparent 72%);
          top: -220px; left: 50%;
          transform: translateX(-50%);
          opacity: 0.5;
          animation: orb1 24s ease-in-out infinite;
        }
        .land-orb-2 {
          width: 460px; height: 460px;
          background: radial-gradient(circle, #7a4820 0%, transparent 68%);
          bottom: 12%; right: -4%;
          opacity: 0.28;
          animation: orb2 30s ease-in-out infinite;
        }
        .land-orb-3 {
          width: 360px; height: 360px;
          background: radial-gradient(circle, #4a3010 0%, transparent 68%);
          top: 28%; left: -4%;
          opacity: 0.22;
          animation: orb3 21s ease-in-out infinite;
        }
        /* Hero content */
        .land-hero-inner {
          position: relative;
          z-index: 1;
          text-align: center;
          max-width: 760px;
        }
        .land-eyebrow {
          display: inline-block;
          font-size: 0.68rem;
          font-weight: 800;
          letter-spacing: 0.32em;
          text-transform: uppercase;
          color: #c9a878;
          margin-bottom: 1.3rem;
          font-family: system-ui, -apple-system, sans-serif;
          animation: hero-in 0.9s cubic-bezier(0.16, 1, 0.3, 1) 0.1s both;
        }
        .land-hero-title {
          font-size: clamp(2.8rem, 7.5vw, 5rem);
          font-weight: 800;
          line-height: 1.08;
          letter-spacing: -0.035em;
          color: #f0e8d8;
          margin-bottom: 1.5rem;
          animation: hero-in 0.9s cubic-bezier(0.16, 1, 0.3, 1) 0.22s both;
        }
        .land-hero-shimmer {
          background: linear-gradient(
            120deg,
            #f0e8d8 0%,
            #e8c878 30%,
            #c9a856 50%,
            #e8c878 70%,
            #f0e8d8 100%
          );
          background-size: 200% auto;
          -webkit-background-clip: text;
          -webkit-text-fill-color: transparent;
          background-clip: text;
          animation:
            hero-in 0.9s cubic-bezier(0.16, 1, 0.3, 1) 0.22s both,
            shimmer 6s linear 1.8s infinite;
        }
        .land-hero-sub {
          font-size: 1.1rem;
          line-height: 1.8;
          color: rgba(240, 232, 216, 0.58);
          max-width: 500px;
          margin: 0 auto 2.5rem;
          font-family: system-ui, -apple-system, sans-serif;
          animation: hero-in 0.9s cubic-bezier(0.16, 1, 0.3, 1) 0.38s both;
        }
        .land-hero-actions {
          display: flex;
          gap: 0.9rem;
          justify-content: center;
          flex-wrap: wrap;
          animation: hero-in 0.9s cubic-bezier(0.16, 1, 0.3, 1) 0.52s both;
        }
        .land-hero-no-acct {
          margin-top: 1.1rem;
          font-size: 0.76rem;
          color: rgba(240, 232, 216, 0.3);
          font-family: system-ui, -apple-system, sans-serif;
          animation: hero-in 0.9s cubic-bezier(0.16, 1, 0.3, 1) 0.66s both;
        }
        /* Scroll indicator */
        .land-scroll-ind {
          position: absolute;
          bottom: 2.8rem;
          left: 50%;
          transform: translateX(-50%);
          z-index: 3;
          animation: hero-in 0.9s cubic-bezier(0.16, 1, 0.3, 1) 1.3s both;
        }
        .land-scroll-line {
          width: 1px;
          height: 44px;
          background: linear-gradient(to bottom, rgba(201,168,120,0.65), transparent);
          animation: scroll-line 2s ease-in-out infinite;
        }
        /* Bottom fade */
        .land-hero-fade {
          position: absolute;
          bottom: 0; left: 0; right: 0;
          height: 140px;
          background: linear-gradient(to bottom, transparent, #f7f3ec);
          pointer-events: none;
          z-index: 2;
        }

        /* ---- STATS BAR ---- */
        .land-stats {
          background: #f7f3ec;
          border-bottom: 1px solid rgba(109, 76, 49, 0.1);
          padding: 2.75rem 1.5rem;
        }
        .land-stats-inner {
          max-width: 860px;
          margin: 0 auto;
          display: flex;
          align-items: center;
          justify-content: center;
          flex-wrap: wrap;
        }
        .land-stat {
          display: flex;
          flex-direction: column;
          align-items: center;
          gap: 0.2rem;
          padding: 0.65rem 2.75rem;
        }
        .land-stat-num {
          font-size: 2.1rem;
          font-weight: 800;
          color: #6d4c31;
          letter-spacing: -0.04em;
          font-family: Georgia, serif;
        }
        .land-stat-label {
          font-size: 0.68rem;
          font-weight: 700;
          letter-spacing: 0.2em;
          text-transform: uppercase;
          color: #a08870;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-stat-div {
          width: 1px;
          height: 44px;
          background: rgba(109, 76, 49, 0.18);
        }

        /* ---- FEATURES ---- */
        .land-features {
          background: #f7f3ec;
          padding: 5rem 2rem 7rem;
        }
        .land-features-inner {
          max-width: 1120px;
          margin: 0 auto;
          display: flex;
          flex-direction: column;
          gap: 7rem;
        }
        .land-feat-row {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 4.5rem;
          align-items: center;
        }
        .land-feat-row--rev .land-feat-copy  { order: 2; }
        .land-feat-row--rev .land-feat-visual { order: 1; }

        .land-feat-copy {
          display: flex;
          flex-direction: column;
        }
        .land-eyebrow-sm {
          font-size: 0.66rem;
          font-weight: 800;
          letter-spacing: 0.28em;
          text-transform: uppercase;
          color: #6d4c31;
          font-family: system-ui, -apple-system, sans-serif;
          margin-bottom: 1rem;
        }
        .land-feat-title {
          font-size: clamp(1.65rem, 3.2vw, 2.3rem);
          font-weight: 800;
          line-height: 1.12;
          letter-spacing: -0.025em;
          color: #221d16;
          margin-bottom: 1rem;
        }
        .land-feat-desc {
          font-size: 1rem;
          line-height: 1.78;
          color: #8a7a68;
          font-family: system-ui, -apple-system, sans-serif;
          margin-bottom: 1.5rem;
        }
        .land-feat-list {
          list-style: none;
          display: flex;
          flex-direction: column;
          gap: 0.65rem;
        }
        .land-feat-list li {
          display: flex;
          align-items: flex-start;
          gap: 0.7rem;
          font-size: 0.94rem;
          color: #5f4f40;
          line-height: 1.55;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-feat-list li::before {
          content: '';
          display: block;
          flex-shrink: 0;
          width: 5px; height: 5px;
          border-radius: 50%;
          background: #6d4c31;
          margin-top: 0.5em;
        }
        .land-feat-visual {
          display: flex;
          align-items: center;
          justify-content: center;
        }

        /* ---- MOCK WINDOWS ---- */
        .land-mock-win {
          width: 100%;
          max-width: 420px;
          background: #161210;
          border-radius: 14px;
          border: 1px solid rgba(255,255,255,0.08);
          overflow: hidden;
          box-shadow:
            0 32px 64px rgba(0,0,0,0.4),
            0 0 0 1px rgba(255,255,255,0.04) inset;
        }
        .land-mock-win--light {
          background: #fffdf8;
          border-color: rgba(109, 76, 49, 0.1);
          box-shadow:
            0 24px 52px rgba(88,63,38,0.14),
            0 0 0 1px rgba(255,255,255,0.8) inset;
        }
        .land-mock-bar {
          display: flex;
          align-items: center;
          gap: 0.35rem;
          padding: 0.6rem 0.85rem;
          background: rgba(255,255,255,0.04);
          border-bottom: 1px solid rgba(255,255,255,0.07);
        }
        .land-mock-bar--light {
          background: rgba(109,76,49,0.04);
          border-color: rgba(109,76,49,0.1);
        }
        .dot {
          width: 9px; height: 9px;
          border-radius: 50%;
          flex-shrink: 0;
        }
        .dot-r { background: #ff5f56; }
        .dot-y { background: #febc2e; }
        .dot-g { background: #27c93f; }
        .land-mock-title {
          margin-left: 0.4rem;
          font-size: 0.68rem;
          font-weight: 600;
          letter-spacing: 0.08em;
          color: rgba(240,232,216,0.35);
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-mock-title--light {
          color: rgba(109,76,49,0.45);
        }

        /* Chat mock body */
        .land-mock-chat {
          padding: 1rem;
          display: flex;
          flex-direction: column;
          gap: 0.7rem;
        }
        .land-chat-msg {
          padding: 0.7rem 0.9rem;
          border-radius: 10px;
          font-size: 0.8rem;
          line-height: 1.6;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-chat-user {
          background: rgba(201,168,120,0.16);
          color: #c9a878;
          align-self: flex-end;
          max-width: 84%;
          text-align: right;
        }
        .land-chat-ai {
          background: rgba(255,255,255,0.05);
          color: rgba(240,232,216,0.75);
          align-self: flex-start;
          max-width: 92%;
          border: 1px solid rgba(240,232,216,0.07);
        }
        .land-chat-ai-name {
          display: block;
          font-size: 0.63rem;
          font-weight: 700;
          letter-spacing: 0.1em;
          text-transform: uppercase;
          color: #c9a878;
          margin-bottom: 0.28rem;
        }
        .land-chat-cursor {
          width: 2px; height: 14px;
          background: #c9a878;
          border-radius: 1px;
          opacity: 0.75;
          align-self: flex-start;
          margin-top: -0.35rem;
          animation: blink 1.1s step-end infinite;
        }

        /* Themes grid mock */
        .land-mock-themes-grid {
          padding: 0.85rem;
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          gap: 0.45rem;
        }
        .land-swatch {
          height: 58px;
          border-radius: 8px;
          display: flex;
          align-items: flex-end;
          padding: 0.35rem 0.45rem;
          font-size: 0.62rem;
          font-family: system-ui, -apple-system, sans-serif;
          font-weight: 700;
          border: 1px solid rgba(255,255,255,0.08);
          cursor: pointer;
          transition: transform 0.16s;
        }
        .land-swatch:hover { transform: scale(1.05); }
        .swatch-default   { background: linear-gradient(135deg,#faf7f0,#ece4d7); color:#6d4c31; border-color:rgba(109,76,49,0.15); }
        .swatch-dark      { background: linear-gradient(135deg,#16130f,#2a2318); color:#c9956a; }
        .swatch-parchment { background: linear-gradient(135deg,#f5ead0,#e8d8b0); color:#7a5c3a; border-color:rgba(122,92,58,0.15); }
        .swatch-galaxy    { background: linear-gradient(135deg,#1a0f2e,#3d1f6e); color:#e8c478; }
        .swatch-teal      { background: linear-gradient(135deg,#0a2028,#0d3a50); color:#5aaec4; }
        .swatch-pink      { background: linear-gradient(135deg,#ffe0ea,#ffb8cc); color:#c01848; border-color:rgba(192,24,72,0.12); }

        /* Reader preview strip */
        .land-mock-reader-preview {
          border-top: 1px solid rgba(109,76,49,0.1);
          padding: 0.85rem 1rem;
        }
        .land-mock-verse {
          font-size: 0.8rem;
          line-height: 1.75;
          color: #5f4f40;
          font-family: Georgia, serif;
        }
        .land-mock-verse sup {
          font-size: 0.6em;
          color: #a08870;
          margin-right: 0.15em;
          vertical-align: super;
        }

        /* Summary mock */
        .land-mock-summary {
          padding: 1rem;
          display: flex;
          flex-direction: column;
          gap: 0.55rem;
        }
        .land-mock-sum-label {
          font-size: 0.63rem;
          font-weight: 700;
          letter-spacing: 0.15em;
          text-transform: uppercase;
          color: rgba(201,168,120,0.55);
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-mock-sum-title {
          font-size: 1rem;
          font-weight: 700;
          color: #f0e8d8;
        }
        .land-mock-tags {
          display: flex;
          flex-wrap: wrap;
          gap: 0.3rem;
        }
        .land-mock-tag {
          font-size: 0.62rem;
          font-family: system-ui, -apple-system, sans-serif;
          font-weight: 600;
          padding: 0.18rem 0.5rem;
          border-radius: 999px;
          background: rgba(201,168,120,0.14);
          color: #c9a878;
          border: 1px solid rgba(201,168,120,0.22);
        }
        .land-mock-sum-body {
          font-size: 0.78rem;
          line-height: 1.65;
          color: rgba(240,232,216,0.55);
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-mock-people {
          display: flex;
          gap: 0.35rem;
          margin-top: 0.25rem;
        }
        .land-mock-person-chip {
          font-size: 0.65rem;
          font-family: system-ui, -apple-system, sans-serif;
          font-weight: 600;
          padding: 0.2rem 0.6rem;
          border-radius: 999px;
          background: rgba(255,255,255,0.06);
          color: rgba(240,232,216,0.5);
          border: 1px solid rgba(255,255,255,0.08);
        }

        /* ---- QUOTE ---- */
        .land-quote {
          background: #0c0a07;
          padding: 7rem 2rem;
          text-align: center;
          position: relative;
          overflow: hidden;
        }
        .land-quote::before {
          content: '';
          position: absolute;
          inset: 0;
          background-image: radial-gradient(
            circle,
            rgba(201, 168, 120, 0.06) 1px,
            transparent 1px
          );
          background-size: 36px 36px;
          pointer-events: none;
        }
        .land-quote-inner {
          position: relative;
          max-width: 660px;
          margin: 0 auto;
        }
        .land-quote-ornament {
          font-size: 8rem;
          line-height: 0.6;
          color: rgba(201,168,120,0.14);
          font-family: Georgia, serif;
          margin-bottom: 0.5rem;
          user-select: none;
        }
        .land-blockquote {
          font-size: clamp(1.45rem, 3.5vw, 2.1rem);
          line-height: 1.5;
          color: rgba(240,232,216,0.85);
          font-style: italic;
          font-weight: 400;
          margin-bottom: 1.25rem;
        }
        .land-quote-cite {
          font-size: 0.75rem;
          font-weight: 700;
          letter-spacing: 0.22em;
          text-transform: uppercase;
          color: #c9a878;
          font-family: system-ui, -apple-system, sans-serif;
          font-style: normal;
        }

        /* ---- CTA ---- */
        .land-cta {
          background: #f7f3ec;
          padding: 7rem 2rem;
          text-align: center;
          border-top: 1px solid rgba(109,76,49,0.1);
        }
        .land-cta-inner { max-width: 560px; margin: 0 auto; }
        .land-cta-title {
          font-size: clamp(2.1rem, 5vw, 3.2rem);
          font-weight: 800;
          letter-spacing: -0.035em;
          color: #221d16;
          margin-bottom: 0.75rem;
        }
        .land-cta-sub {
          font-size: 1.05rem;
          color: #8a7a68;
          font-family: system-ui, -apple-system, sans-serif;
          margin-bottom: 2.25rem;
          line-height: 1.65;
        }
        .land-cta-actions {
          display: flex;
          gap: 0.85rem;
          justify-content: center;
          flex-wrap: wrap;
        }

        /* ---- FOOTER ---- */
        .land-footer {
          background: #0c0a07;
          text-align: center;
          padding: 2rem;
          color: rgba(240,232,216,0.25);
          font-size: 0.78rem;
          font-family: system-ui, -apple-system, sans-serif;
          border-top: 1px solid rgba(201,168,120,0.07);
        }

        /* ---- RESPONSIVE ---- */
        @media (max-width: 900px) {
          .land-nav { padding: 1rem 1.4rem; }
          .land-feat-row,
          .land-feat-row--rev {
            grid-template-columns: 1fr;
            gap: 2.5rem;
          }
          .land-feat-row--rev .land-feat-copy,
          .land-feat-row--rev .land-feat-visual { order: unset; }
          .land-mock-win { max-width: 100%; }
          .land-features-inner { gap: 5rem; }
          .land-features { padding: 4rem 1.25rem 5rem; }
          .land-stat { padding: 0.6rem 1.4rem; }
        }
        @media (max-width: 520px) {
          .land-stats-inner { gap: 0; justify-content: space-around; }
          .land-stat-div { display: none; }
          .land-stat { padding: 0.5rem 0.75rem; }
          .land-stat-num { font-size: 1.6rem; }
          .land-hero-title { font-size: clamp(2.2rem, 10vw, 3.2rem); }
        }
      `}</style>
    </>
  );
}

/* ── Small inline components ── */
function Stat({ num, label }: { num: string; label: string }) {
  return (
    <div className="land-stat">
      <span className="land-stat-num">{num}</span>
      <span className="land-stat-label">{label}</span>
    </div>
  );
}

function ArrowRight() {
  return (
    <svg
      width="15"
      height="15"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
    >
      <path d="M5 12h14M12 5l7 7-7 7" />
    </svg>
  );
}
