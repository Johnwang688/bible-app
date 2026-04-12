'use client';
import Link from 'next/link';
import { useEffect, useRef } from 'react';
import SiteLogo from '@/components/SiteLogo';

export default function LandingClient() {
  const navRef = useRef<HTMLElement>(null);

  useEffect(() => {
    // Nav scroll effect
    const onScroll = () => {
      navRef.current?.classList.toggle('land-nav--scrolled', window.scrollY > 60);
    };
    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();

    // Scroll reveal
    const obs = new IntersectionObserver(
      (entries) => {
        entries.forEach((e) => {
          if (e.isIntersecting) e.target.classList.add('is-visible');
        });
      },
      { threshold: 0.07, rootMargin: '0px 0px -40px 0px' }
    );
    document.querySelectorAll('[data-reveal]').forEach((el) => obs.observe(el));

    // Animated counters
    const countEls = document.querySelectorAll<HTMLElement>('[data-count]');
    const countObs = new IntersectionObserver(
      (entries) => {
        entries.forEach((e) => {
          if (!e.isIntersecting) return;
          const el = e.target as HTMLElement;
          const target = parseFloat(el.dataset.count || '0');
          const suffix = el.dataset.suffix || '';
          const prefix = el.dataset.prefix || '';
          const duration = 1800;
          const start = performance.now();
          const isInt = Number.isInteger(target);
          const animate = (now: number) => {
            const t = Math.min((now - start) / duration, 1);
            const val = target * (1 - Math.pow(1 - t, 3));
            el.textContent = prefix + (isInt ? Math.round(val).toLocaleString() : val.toFixed(0)) + suffix;
            if (t < 1) requestAnimationFrame(animate);
          };
          requestAnimationFrame(animate);
          countObs.unobserve(el);
        });
      },
      { threshold: 0.5 }
    );
    countEls.forEach((el) => countObs.observe(el));

    return () => {
      window.removeEventListener('scroll', onScroll);
      obs.disconnect();
      countObs.disconnect();
    };
  }, []);

  // Bible book — cursor-driven page flip + parallax tilt
  useEffect(() => {
    // Cache DOM refs once — never query inside the loop
    const book       = document.getElementById('bf-book')        as HTMLElement | null;
    const flipA      = document.getElementById('bf-flip-a')      as HTMLElement | null;
    const flipB      = document.getElementById('bf-flip-b')      as HTMLElement | null;
    const flipShadow = document.getElementById('bf-flip-shadow') as HTMLElement | null;
    const rightShadow= document.getElementById('bf-right-shadow')as HTMLElement | null;
    if (!book || !flipA || !flipB) return;
    const bookEl = book;
    const flipElA = flipA;
    const flipElB = flipB;

    let raf: number;
    let prevShowA = false; // tracks last visibility state so handoffs bypass the moved guard
    let tFlip = -8, cFlip = -8;
    let tTiltX = 9, cTiltX = 9;
    let tTiltY = -12, cTiltY = -12;
    let tLift = 0, cLift = 0;
    let tDriftX = 0, cDriftX = 0;
    let tRoll = 0, cRoll = 0;
    let mFlip = -8;
    let mTiltX = 9;
    let mTiltY = -12;
    let mLift = 0;
    let mDriftX = 0;
    let mRoll = 0;
    let mProximity = 0;
    let autoTurn = 0.05;
    let lastTime = performance.now();
    let lastMouse = 0;
    const isTouch = window.matchMedia('(hover: none)').matches;
    const clamp = (v: number, min: number, max: number) => Math.min(max, Math.max(min, v));
    // easeInOutCubic: slow start → fast middle → slow landing (natural page-turn feel)
    const easeInOutCubic = (x: number) => x < 0.5 ? 4 * x * x * x : 1 - Math.pow(-2 * x + 2, 3) / 2;
    // Each page turns from -8° (resting on right) to -180° (fully on left) over its visible half-cycle.
    // At -180° the front face is hidden (backface-visibility), so the handoff to the next page is seamless.
    const turnAngle = (progress: number) => -8 - easeInOutCubic(progress) * 172;
    const turnCurl = (progress: number) => Math.sin(progress * Math.PI);

    const updateFromBookSpace = (clientX: number, clientY: number) => {
      const rect = bookEl.getBoundingClientRect();
      const expandX = rect.width * 0.34;
      const expandY = rect.height * 0.34;
      const inExpandedBounds =
        clientX >= rect.left - expandX &&
        clientX <= rect.right + expandX &&
        clientY >= rect.top - expandY &&
        clientY <= rect.bottom + expandY;

      const localX = clamp((clientX - rect.left) / rect.width, 0, 1);
      const localY = clamp((clientY - rect.top) / rect.height, 0, 1);
      const nx = (localX - 0.5) * 2;
      const ny = (localY - 0.5) * 2;

      // Strong when over book, soft falloff slightly outside it.
      const outsideDx = Math.max(rect.left - clientX, 0, clientX - rect.right);
      const outsideDy = Math.max(rect.top - clientY, 0, clientY - rect.bottom);
      const outsideDist = Math.hypot(outsideDx / (rect.width * 0.28), outsideDy / (rect.height * 0.28));
      const proximity = inExpandedBounds ? clamp(1 - outsideDist, 0, 1) : 0;

      // Cursor drag: right side = early turn, left side = near full turn.
      mProximity = proximity;
      mFlip = -4 - (1 - localX) * 224;
      mTiltX = 8 + ny * 26;
      mTiltY = -11 - nx * 34;
      mLift = -ny * 11;
      mDriftX = nx * 12;
      mRoll = (-nx * ny) * 8;
    };

    function onMove(e: MouseEvent) {
      lastMouse = Date.now();
      updateFromBookSpace(e.clientX, e.clientY);
    }

    function tick() {
      // Time-based advancement: frame-rate independent (60Hz, 120Hz, etc.)
      const now = performance.now();
      const dt = Math.min((now - lastTime) / 1000, 0.1); // seconds, clamped against tab-hidden gaps
      lastTime = now;
      autoTurn += dt * 0.15; // 0.15 turns/sec → ~6.7 s per full page turn

      const autoPhaseA = autoTurn % 1;
      // A is visible during [0, 0.5): local phase 0→1 maps to a complete -8°→-180° turn.
      // At phase 0.5 A has reached -180° (front face hidden) and B starts fresh at -8°.
      const showA = autoPhaseA < 0.5;
      const localPhase = showA ? autoPhaseA * 2 : (autoPhaseA - 0.5) * 2;
      const autoFlip = turnAngle(localPhase); // tracks whichever page is visible — no wrap-jump
      const autoTiltX = 6 + Math.sin(autoTurn * Math.PI * 2 * 0.78) * 7.2;
      const autoTiltY = -10 + Math.cos(autoTurn * Math.PI * 2 * 0.58) * 8.8;
      const autoLift = Math.sin(autoTurn * Math.PI * 2 * 1.05) * 6.2;
      const autoDriftX = Math.cos(autoTurn * Math.PI * 2 * 0.62) * 8.6;
      const autoRoll = Math.sin(autoTurn * Math.PI * 2 * 0.76) * 3.2;

      const mouseAge = Date.now() - lastMouse;
      const mouseRecent = isTouch ? 0 : clamp(1 - mouseAge / 1700, 0, 1);
      const mouseWeight = clamp(mProximity * mouseRecent * 1.45, 0, 1);
      const autoWeight = 1 - mouseWeight;

      tFlip = autoFlip * autoWeight + mFlip * mouseWeight;
      tTiltX = autoTiltX * autoWeight + mTiltX * mouseWeight;
      tTiltY = autoTiltY * autoWeight + mTiltY * mouseWeight;
      tLift = autoLift * autoWeight + mLift * mouseWeight;
      tDriftX = autoDriftX * autoWeight + mDriftX * mouseWeight;
      tRoll = autoRoll * autoWeight + mRoll * mouseWeight;

      const prevFlip = cFlip, prevTiltX = cTiltX, prevTiltY = cTiltY, prevLift = cLift, prevDriftX = cDriftX, prevRoll = cRoll;
      cFlip  += (tFlip  - cFlip)  * 0.22;
      cTiltX += (tTiltX - cTiltX) * 0.2;
      cTiltY += (tTiltY - cTiltY) * 0.2;
      cLift  += (tLift  - cLift)  * 0.2;
      cDriftX += (tDriftX - cDriftX) * 0.2;
      cRoll += (tRoll - cRoll) * 0.2;

      const handoff = showA !== prevShowA;
      prevShowA = showA;

      // Skip DOM writes when nothing has moved meaningfully, but always write on page handoff.
      const moved = handoff
        || Math.abs(cFlip - prevFlip) > 0.02
        || Math.abs(cTiltX - prevTiltX) > 0.02
        || Math.abs(cTiltY - prevTiltY) > 0.02
        || Math.abs(cLift - prevLift) > 0.02
        || Math.abs(cDriftX - prevDriftX) > 0.02
        || Math.abs(cRoll - prevRoll) > 0.02;
      if (moved) {
        bookEl.style.transform = `translate3d(${cDriftX.toFixed(2)}px, ${cLift.toFixed(2)}px, 0) rotateX(${cTiltX.toFixed(2)}deg) rotateY(${cTiltY.toFixed(2)}deg) rotateZ(${cRoll.toFixed(2)}deg)`;

        let shadowAngleDeg = cFlip;

        if (mouseWeight > 0.02) {
          // User interaction: one direct, fluid page controlled by cursor.
          const userProgress = clamp((Math.abs(cFlip) - 8) / 224, 0, 1);
          const userCurl = turnCurl(userProgress);
          flipElA.style.visibility = 'visible';
          flipElB.style.visibility = 'hidden';
          flipElA.style.transform = `translateZ(${(userCurl * 2.2).toFixed(2)}px) rotateX(${(userCurl * 2.6).toFixed(2)}deg) rotateY(${cFlip.toFixed(2)}deg)`;
        } else {
          // Idle mode: only the active page's transform is computed and written.
          const curl = turnCurl(localPhase);
          const angle = turnAngle(localPhase);
          flipElA.style.visibility = showA ? 'visible' : 'hidden';
          flipElB.style.visibility = showA ? 'hidden' : 'visible';
          if (showA) {
            flipElA.style.transform = `translateZ(${(curl * 2.2 + 0.6).toFixed(2)}px) rotateX(${(curl * 2.6).toFixed(2)}deg) rotateY(${angle.toFixed(2)}deg)`;
            // On handoff, snap the newly-hidden B back to start so it's ready for its next turn.
            if (handoff) flipElB.style.transform = `translateZ(0.2px) rotateX(0deg) rotateY(-8deg)`;
          } else {
            flipElB.style.transform = `translateZ(${(curl * 2.2 + 0.2).toFixed(2)}px) rotateX(${(curl * 2.6).toFixed(2)}deg) rotateY(${angle.toFixed(2)}deg)`;
            if (handoff) flipElA.style.transform = `translateZ(0.6px) rotateX(0deg) rotateY(-8deg)`;
          }
          shadowAngleDeg = angle;
        }

        if (flipShadow || rightShadow) {
          const t = clamp((Math.abs(shadowAngleDeg) - 8) / 172, 0, 1);
          if (flipShadow)  flipShadow.style.opacity  = (Math.sin(t * Math.PI) * 0.6).toFixed(3);
          if (rightShadow) rightShadow.style.opacity = ((1 - t) * 0.32).toFixed(3);
        }
      }

      raf = requestAnimationFrame(tick);
    }

    window.addEventListener('mousemove', onMove, { passive: true });
    raf = requestAnimationFrame(tick);
    return () => {
      window.removeEventListener('mousemove', onMove);
      cancelAnimationFrame(raf);
    };
  }, []);

  return (
    <>
      {/* ── NAV ──────────────────────────────────────────────── */}
      <nav className="land-nav" ref={navRef}>
        <SiteLogo className="land-logo" />
        <div className="land-nav-actions">
          <Link href="/signin" className="land-btn land-btn-ghost">Sign In</Link>
          <Link href="/app" className="land-btn land-btn-nav-cta">Start Reading</Link>
        </div>
      </nav>

      {/* ── HERO ─────────────────────────────────────────────── */}
      <section className="land-hero">
        <div className="land-hero-grid" aria-hidden="true" />
        <div className="land-orb land-orb-1" aria-hidden="true" />
        <div className="land-orb land-orb-2" aria-hidden="true" />
        <div className="land-orb land-orb-3" aria-hidden="true" />

        <div className="land-hero-split">
          {/* Text column */}
          <div className="land-hero-inner">
            <span className="land-eyebrow">Open Bible</span>
            <h1 className="land-hero-title">
              The Bible is meant
              <br />
              to be <span className="land-hero-accent">understood.</span>
            </h1>
            <p className="land-hero-sub">
              AI-powered commentary, immersive reading, chapter summaries,
              and a study companion — so you actually finish what you start.
            </p>
            <div className="land-hero-actions">
              <Link href="/app" className="land-btn land-btn-gold land-btn-lg">
                Start Reading Free
                <ArrowRight />
              </Link>
              <Link href="/signin" className="land-btn land-btn-outline-light land-btn-lg">
                Sign In
              </Link>
            </div>
            <p className="land-hero-no-acct">No account required · Always free to start</p>
          </div>

          {/* Bible book column */}
          <div className="land-hero-book-col" aria-hidden="true">
            <BibleBook />
          </div>
        </div>

        <div className="land-scroll-ind" aria-hidden="true">
          <div className="land-scroll-line" />
        </div>
        <div className="land-hero-fade" aria-hidden="true" />
      </section>

      {/* ── REALITY CHECK ────────────────────────────────────── */}
      <section className="land-reality" data-reveal>
        <div className="land-reality-inner">
          <div className="land-reality-copy">
            <p className="land-eyebrow-sm land-eyebrow-sm--light">The Problem</p>
            <h2 className="land-reality-title">
              The world&apos;s most owned book
              <br />is also the least read.
            </h2>
            <p className="land-reality-desc">
              Surveys show that most people who own a Bible rarely open it — not
              because they don&apos;t care, but because reading it alone is hard.
              The language is dense, the context is lost, and there&apos;s no one
              to ask when you&apos;re confused. Open Bible fixes that.
            </p>
          </div>
          <div className="land-stats-grid">
            <div className="land-stat-card" data-reveal>
              <div className="land-stat-num" data-count="93" data-suffix="%">93%</div>
              <div className="land-stat-label">of American homes own a Bible</div>
            </div>
            <div className="land-stat-card land-stat-card--accent" data-reveal>
              <div className="land-stat-num" data-count="11" data-suffix="%">11%</div>
              <div className="land-stat-label">read it daily</div>
            </div>
            <div className="land-stat-card" data-reveal>
              <div className="land-stat-num" data-count="65" data-suffix="%">65%</div>
              <div className="land-stat-label">say they rarely or never open it</div>
            </div>
            <div className="land-stat-card land-stat-card--accent" data-reveal>
              <div className="land-stat-num">0</div>
              <div className="land-stat-label">chapters read avg. per week by non-daily readers</div>
            </div>
          </div>
        </div>
      </section>

      {/* ── FEATURES ─────────────────────────────────────────── */}
      <section className="land-features">
        <div className="land-features-hd" data-reveal>
          <p className="land-eyebrow-sm">Features</p>
          <h2 className="land-features-title">Everything you need to go deeper.</h2>
        </div>

        <div className="land-features-inner">

          {/* 1 — Ask Anything */}
          <div className="land-feat-row" data-reveal>
            <div className="land-feat-copy">
              <span className="land-eyebrow-sm">AI Commentary</span>
              <h3 className="land-feat-title">Ask anything. Stay in the passage.</h3>
              <p className="land-feat-desc">
                Your study companion lives inside the reader. Ask about a verse,
                a character, a historical detail — and get a real answer without
                leaving your chapter.
              </p>
              <ul className="land-feat-list">
                <li>Contextual answers anchored to what you&apos;re reading</li>
                <li>From quick clarification to deep theological insight</li>
                <li>Reflects, questions, and reasons with you</li>
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
                    What does &ldquo;living water&rdquo; mean in John 4?
                  </div>
                  <div className="land-chat-msg land-chat-ai">
                    <span className="land-chat-ai-name">Open Bible</span>
                    In John&nbsp;4, Jesus uses &ldquo;living water&rdquo; as a metaphor for
                    spiritual life — a gift he uniquely offers. In Hebrew culture,
                    &ldquo;living water&rdquo; meant flowing spring water (as opposed to
                    stagnant cisterns), but Jesus reframes it as the Holy Spirit
                    and eternal life available to anyone who asks&hellip;
                  </div>
                  <div className="land-chat-cursor" aria-hidden="true" />
                </div>
              </div>
            </div>
          </div>

          {/* 2 — Beautiful Reader */}
          <div className="land-feat-row land-feat-row--rev" data-reveal>
            <div className="land-feat-copy">
              <span className="land-eyebrow-sm">Immersive Reading</span>
              <h3 className="land-feat-title">A reader built for long, focused sessions.</h3>
              <p className="land-feat-desc">
                Tools that appear when you need them and disappear when you
                don&apos;t. Six visual themes, adjustable typography, and a
                layout designed to keep you in flow — not in footnotes.
              </p>
              <ul className="land-feat-list">
                <li>Warm parchment, deep dark, galaxy, and more themes</li>
                <li>Adjust font size and line spacing to match how you read</li>
                <li>Cross-references and commentary inline, not in another tab</li>
              </ul>
            </div>
            <div className="land-feat-visual">
              <div className="land-mock-win land-mock-win--light">
                <div className="land-mock-bar land-mock-bar--light">
                  <span className="dot dot-r" /><span className="dot dot-y" /><span className="dot dot-g" />
                  <span className="land-mock-title land-mock-title--light">Appearance</span>
                </div>
                <div className="land-mock-themes-grid">
                  {([
                    ['Default',   'swatch-default'],
                    ['Dark',      'swatch-dark'],
                    ['Parchment', 'swatch-parchment'],
                    ['Galaxy',    'swatch-galaxy'],
                    ['Teal',      'swatch-teal'],
                    ['Pink',      'swatch-pink'],
                  ] as [string, string][]).map(([name, cls]) => (
                    <div key={name} className={`land-swatch ${cls}`}>
                      <span>{name}</span>
                    </div>
                  ))}
                </div>
                <div className="land-mock-reader-preview">
                  <p className="land-mock-verse">
                    <sup>1</sup>In the beginning God created the heavens and the
                    earth. <sup>2</sup>Now the earth was formless and empty,
                    darkness was over the surface of the deep&hellip;
                  </p>
                </div>
              </div>
            </div>
          </div>

          {/* 3 — Chapter Summaries */}
          <div className="land-feat-row" data-reveal>
            <div className="land-feat-copy">
              <span className="land-eyebrow-sm">See the Bigger Picture</span>
              <h3 className="land-feat-title">Summaries, people, and theme maps.</h3>
              <p className="land-feat-desc">
                Every chapter comes with an AI-generated summary that surfaces
                the movement of the story, recurring themes, and the key people
                who shape each passage.
              </p>
              <ul className="land-feat-list">
                <li>Chapter and book-level summaries on demand</li>
                <li>Character profiles and how they connect across Scripture</li>
                <li>Recurring themes traced across books and testaments</li>
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
                    {['Creation', 'God', 'Light', 'Sovereignty', 'Humanity'].map((t) => (
                      <span key={t} className="land-mock-tag">{t}</span>
                    ))}
                  </div>
                  <p className="land-mock-sum-body">
                    God speaks the cosmos into existence over six days, imposing
                    order on formless chaos. Each act builds on the last,
                    culminating in humanity made in God&apos;s image — uniquely
                    tasked with stewardship of all creation&hellip;
                  </p>
                  <div className="land-mock-people">
                    <div className="land-mock-person-chip">God</div>
                    <div className="land-mock-person-chip">Adam</div>
                    <div className="land-mock-person-chip">Eve</div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* 4 — Quiz & Mastery */}
          <div className="land-feat-row land-feat-row--rev" data-reveal>
            <div className="land-feat-copy">
              <span className="land-eyebrow-sm">Track Your Progress</span>
              <h3 className="land-feat-title">Build a habit that actually sticks.</h3>
              <p className="land-feat-desc">
                Reading streaks, mastery tracking, and chapter quizzes that
                reinforce what you&apos;ve read — turning passive reading into
                active understanding.
              </p>
              <ul className="land-feat-list">
                <li>Short quizzes after each chapter to lock in what you learned</li>
                <li>Visual mastery map across every book of the Bible</li>
                <li>Streak tracking and daily goals to build consistency</li>
              </ul>
            </div>
            <div className="land-feat-visual">
              <div className="land-mock-win land-mock-win--light">
                <div className="land-mock-bar land-mock-bar--light">
                  <span className="dot dot-r" /><span className="dot dot-y" /><span className="dot dot-g" />
                  <span className="land-mock-title land-mock-title--light">Your Progress</span>
                </div>
                <div className="land-mock-mastery">
                  <div className="land-mock-mastery-hd">
                    <span className="land-mock-mastery-book">John</span>
                    <span className="land-mock-mastery-pct">62% mastered</span>
                  </div>
                  <div className="land-mock-mastery-bar">
                    <div className="land-mock-mastery-fill" />
                  </div>
                  <div className="land-mock-mastery-grid">
                    {Array.from({ length: 21 }, (_, i) => (
                      <div
                        key={i}
                        className={`land-mock-ch ${i < 13 ? 'ch-done' : i < 16 ? 'ch-partial' : ''}`}
                        title={`Chapter ${i + 1}`}
                      />
                    ))}
                  </div>
                  <div className="land-mock-quiz-preview">
                    <div className="land-mock-quiz-q">
                      What does Jesus tell Nicodemus in John 3:16?
                    </div>
                    <div className="land-mock-quiz-opts">
                      <div className="land-mock-quiz-opt land-mock-quiz-opt--correct">
                        God so loved the world he gave his only Son
                      </div>
                      <div className="land-mock-quiz-opt">
                        Follow me and I will make you fishers of men
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </section>

      {/* ── TIMELINE FEATURE ─────────────────────────────────── */}
      <section className="land-timeline-section">
        <div className="land-timeline-inner">
          <div className="land-timeline-hd" data-reveal>
            <p className="land-eyebrow-sm">People &amp; Places</p>
            <h2 className="land-features-title">
              Follow every character&apos;s journey<br />through Scripture.
            </h2>
            <p className="land-timeline-desc">
              Open Bible builds a chronological timeline for every major person and place in the Bible —
              so you can see exactly how their story unfolds from Genesis to Revelation.
            </p>
          </div>

          <div className="land-timeline-demo" data-reveal>
            {/* Mock person header */}
            <div className="land-tl-person-hd">
              <div className="land-tl-person-avatar" aria-hidden="true">M</div>
              <div>
                <div className="land-tl-person-name">Moses</div>
                <div className="land-tl-person-meta">Person · Old Testament</div>
              </div>
              <div className="land-tl-person-chip">14 milestones</div>
            </div>

            {/* Vertical timeline mock */}
            <div className="land-tl-wrap" aria-label="Timeline preview">
              <div className="land-tl-line" aria-hidden="true" />

              {([
                { side: 'left',  era: 'c. 1526 BC', title: 'Birth &amp; Hidden in Egypt', note: 'Born during Pharaoh\'s decree to kill Hebrew infants; placed in a basket on the Nile.' },
                { side: 'right', era: 'c. 1486 BC', title: 'Called at the Burning Bush', note: 'God appears and commissions Moses to lead Israel out of Egypt.' },
                { side: 'left',  era: 'c. 1446 BC', title: 'The Ten Plagues &amp; Exodus', note: 'Moses confronts Pharaoh through ten plagues, culminating in the Passover and departure.' },
                { side: 'right', era: 'c. 1446 BC', title: 'Receiving the Law at Sinai', note: 'Moses ascends Mt. Sinai and receives the Ten Commandments and covenant law.' },
                { side: 'left',  era: 'c. 1406 BC', title: 'Death on Mt. Nebo', note: 'Moses sees the Promised Land from afar and dies; Joshua assumes leadership of Israel.' },
              ] as { side: string; era: string; title: string; note: string }[]).map((item, i) => (
                <div key={i} className={`land-tl-row land-tl-row--${item.side}`}>
                  <div className="land-tl-card">
                    <div className="land-tl-card-label">Milestone {i + 1}</div>
                    <div className="land-tl-card-era">{item.era}</div>
                    <div className="land-tl-card-title" dangerouslySetInnerHTML={{ __html: item.title }} />
                    <div className="land-tl-card-note">{item.note}</div>
                  </div>
                  <div className="land-tl-dot" aria-hidden="true" />
                  <div className="land-tl-gap" aria-hidden="true" />
                </div>
              ))}
            </div>

            <div className="land-tl-footer">
              <span>+ 9 more milestones in the full timeline</span>
            </div>
          </div>
        </div>
      </section>

      {/* ── QUOTE ────────────────────────────────────────────── */}
      <section className="land-quote" data-reveal>
        <div className="land-quote-inner">
          <div className="land-quote-ornament" aria-hidden="true">&ldquo;</div>
          <blockquote className="land-blockquote">
            Your word is a lamp to my feet<br />and a light to my path.
          </blockquote>
          <cite className="land-quote-cite">Psalm 119:105</cite>
        </div>
      </section>

      {/* ── CTA ──────────────────────────────────────────────── */}
      <section className="land-cta" data-reveal>
        <div className="land-cta-inner">
          <p className="land-eyebrow-sm">Get Started</p>
          <h2 className="land-cta-title">Start reading. Right now.</h2>
          <p className="land-cta-sub">
            No account needed. Open any book, ask any question, and
            discover what you&apos;ve been missing.
          </p>
          <div className="land-cta-actions">
            <Link href="/app" className="land-btn land-btn-brown land-btn-lg">
              Open the App Free
              <ArrowRight />
            </Link>
            <Link href="/signin" className="land-btn land-btn-outline-dark land-btn-lg">
              Create an Account
            </Link>
          </div>
          <p className="land-cta-note">Free forever · No credit card</p>
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
          35%      { transform: translate(calc(-50% + 55px), -50px) scale(1.08); }
          68%      { transform: translate(calc(-50% - 40px), 30px) scale(0.94); }
        }
        @keyframes orb2 {
          0%,100% { transform: translate(0, 0) scale(1); }
          42%      { transform: translate(-40px, 35px) scale(1.11); }
          74%      { transform: translate(28px, -22px) scale(0.92); }
        }
        @keyframes orb3 {
          0%,100% { transform: translate(0, 0); }
          50%      { transform: translate(26px, 38px); }
        }
        @keyframes hero-in {
          from { opacity: 0; transform: translateY(24px); }
          to   { opacity: 1; transform: translateY(0); }
        }
        @keyframes shimmer {
          from { background-position: 200% center; }
          to   { background-position: -200% center; }
        }
        @keyframes scroll-line {
          0%,100% { transform: scaleY(0); transform-origin: top; opacity: 0; }
          30%,70%  { opacity: 1; }
          50%      { transform: scaleY(1); transform-origin: top; }
        }
        @keyframes blink {
          0%,100% { opacity: 1; }
          50%      { opacity: 0; }
        }
        @keyframes mastery-fill {
          from { width: 0; }
          to   { width: 62%; }
        }

        /* ---- SCROLL REVEAL ---- */
        [data-reveal] {
          opacity: 0;
          transform: translateY(28px);
          transition:
            opacity 0.75s cubic-bezier(0.16, 1, 0.3, 1),
            transform 0.75s cubic-bezier(0.16, 1, 0.3, 1);
        }
        [data-reveal].is-visible { opacity: 1; transform: translateY(0); }
        @media (prefers-reduced-motion: reduce) {
          [data-reveal] { opacity: 1; transform: none; transition: none; }
          .land-hero-accent { animation: none !important; }
          .land-orb { animation: none !important; }
          .land-scroll-line { animation: none !important; }
          .land-mock-mastery-fill { animation: none !important; }
        }

        /* ---- NAV ---- */
        .land-nav {
          position: fixed;
          inset: 0 0 auto 0;
          z-index: 100;
          display: flex;
          align-items: center;
          justify-content: space-between;
          padding: 1.1rem 2.5rem;
          border-bottom: 1px solid transparent;
          transition: background 0.35s, border-color 0.35s, box-shadow 0.35s;
        }
        .land-nav--scrolled {
          background: rgba(8, 6, 4, 0.92);
          border-color: rgba(201, 168, 120, 0.15);
          backdrop-filter: blur(24px);
          -webkit-backdrop-filter: blur(24px);
          box-shadow: 0 1px 0 rgba(255,255,255,0.04);
        }
        .land-logo {
          display: inline-flex;
          align-items: center;
          gap: 0.55rem;
          text-decoration: none;
          font-size: 1.08rem;
          font-weight: 700;
          letter-spacing: 0.01em;
          color: #f0e8d8;
        }
        .land-logo-img {
          width: 28px; height: 28px;
          object-fit: contain;
          filter: brightness(0) invert(1);
          flex-shrink: 0;
        }
        .land-logo-text { color: #f0e8d8; font-family: Georgia, serif; }
        .land-logo-accent { color: #c9a878; }
        .land-nav-actions { display: flex; gap: 0.65rem; align-items: center; }

        /* ---- BUTTONS ---- */
        .land-btn {
          display: inline-flex;
          align-items: center;
          gap: 0.4rem;
          padding: 0.52rem 1.1rem;
          border-radius: 9px;
          font-size: 0.875rem;
          font-weight: 600;
          text-decoration: none;
          font-family: system-ui, -apple-system, sans-serif;
          cursor: pointer;
          border: none;
          white-space: nowrap;
          transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
          letter-spacing: 0.005em;
        }
        .land-btn-lg { padding: 0.8rem 1.85rem; font-size: 0.975rem; border-radius: 11px; }
        .land-btn-ghost {
          background: transparent;
          color: rgba(240, 232, 216, 0.65);
          border: 1px solid rgba(240, 232, 216, 0.18);
        }
        .land-btn-ghost:hover { color: #f0e8d8; border-color: rgba(240,232,216,0.38); background: rgba(240,232,216,0.06); }
        .land-btn-nav-cta {
          background: rgba(201,168,120,0.16);
          color: #c9a878;
          border: 1px solid rgba(201,168,120,0.32);
        }
        .land-btn-nav-cta:hover { background: rgba(201,168,120,0.26); border-color: rgba(201,168,120,0.52); }
        .land-btn-gold {
          background: linear-gradient(135deg, #c9a878 0%, #9e7a3c 100%);
          color: #1a0f00;
          font-weight: 700;
          box-shadow: 0 2px 18px rgba(201,168,120,0.25);
        }
        .land-btn-gold:hover { transform: translateY(-2px); box-shadow: 0 8px 28px rgba(201,168,120,0.38); }
        .land-btn-outline-light {
          background: transparent;
          color: rgba(240, 232, 216, 0.78);
          border: 1.5px solid rgba(240, 232, 216, 0.24);
        }
        .land-btn-outline-light:hover { border-color: rgba(240,232,216,0.5); color: #f0e8d8; background: rgba(240,232,216,0.05); }
        .land-btn-brown {
          background: linear-gradient(135deg, #7a5235 0%, #573520 100%);
          color: #fff8ef;
          font-weight: 700;
          box-shadow: 0 2px 16px rgba(90,58,34,0.28);
        }
        .land-btn-brown:hover { transform: translateY(-2px); box-shadow: 0 8px 28px rgba(90,58,34,0.38); }
        .land-btn-outline-dark {
          background: transparent;
          color: #6d4c31;
          border: 1.5px solid rgba(109,76,49,0.32);
        }
        .land-btn-outline-dark:hover { background: rgba(109,76,49,0.06); border-color: rgba(109,76,49,0.52); }

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
          padding: 8rem 1.5rem 6rem;
          background: radial-gradient(ellipse 120% 80% at 50% -10%, #1e1004 0%, #080604 55%, #050403 100%);
        }
        .land-hero-grid {
          position: absolute;
          inset: 0;
          background-image: radial-gradient(circle, rgba(201,168,120,0.065) 1px, transparent 1px);
          background-size: 34px 34px;
          pointer-events: none;
          z-index: 0;
        }
        .land-orb {
          position: absolute;
          border-radius: 50%;
          pointer-events: none;
          filter: blur(88px);
          z-index: 0;
        }
        .land-orb-1 {
          width: 780px; height: 780px;
          background: radial-gradient(circle at 38%, #b07840 0%, #5c2c10 52%, transparent 70%);
          top: -260px; left: 50%;
          transform: translateX(-50%);
          opacity: 0.45;
          animation: orb1 22s ease-in-out infinite;
        }
        .land-orb-2 {
          width: 500px; height: 500px;
          background: radial-gradient(circle, #7a4820 0%, transparent 68%);
          bottom: 8%; right: -6%;
          opacity: 0.22;
          animation: orb2 28s ease-in-out infinite;
        }
        .land-orb-3 {
          width: 380px; height: 380px;
          background: radial-gradient(circle, #2a1a08 0%, transparent 70%);
          top: 30%; left: -5%;
          opacity: 0.35;
          animation: orb3 19s ease-in-out infinite;
        }
        /* Split hero layout */
        .land-hero-split {
          position: relative;
          z-index: 1;
          width: 100%;
          max-width: 1180px;
          margin: 0 auto;
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 3rem;
          align-items: center;
          padding: 0 2rem;
        }
        .land-hero-inner {
          position: relative;
          z-index: 1;
          text-align: left;
        }
        .land-hero-book-col {
          position: relative;
          z-index: 1;
          display: flex;
          align-items: center;
          justify-content: center;
          animation: hero-in 0.9s cubic-bezier(0.16, 1, 0.3, 1) 0.6s both;
        }
        .land-eyebrow {
          display: inline-block;
          font-size: 0.65rem;
          font-weight: 800;
          letter-spacing: 0.34em;
          text-transform: uppercase;
          color: #c9a878;
          margin-bottom: 1.4rem;
          font-family: system-ui, -apple-system, sans-serif;
          animation: hero-in 0.85s cubic-bezier(0.16, 1, 0.3, 1) 0.1s both;
        }
        .land-hero-title {
          font-size: clamp(2.9rem, 7.8vw, 5.2rem);
          font-weight: 800;
          line-height: 1.05;
          letter-spacing: -0.038em;
          color: #f0e8d8;
          margin-bottom: 1.5rem;
          font-family: Georgia, "Times New Roman", serif;
          animation: hero-in 0.85s cubic-bezier(0.16, 1, 0.3, 1) 0.22s both;
        }
        .land-hero-accent {
          background: linear-gradient(120deg, #f5e8c8 0%, #e8c060 28%, #c9a040 50%, #e8c060 72%, #f5e8c8 100%);
          background-size: 220% auto;
          -webkit-background-clip: text;
          -webkit-text-fill-color: transparent;
          background-clip: text;
          animation:
            hero-in 0.85s cubic-bezier(0.16, 1, 0.3, 1) 0.22s both,
            shimmer 5s linear 1.5s infinite;
        }
        .land-hero-sub {
          font-size: clamp(1.02rem, 2.2vw, 1.15rem);
          line-height: 1.8;
          color: rgba(240,232,216,0.52);
          max-width: 480px;
          margin: 0 0 2.6rem;
          font-family: system-ui, -apple-system, sans-serif;
          animation: hero-in 0.85s cubic-bezier(0.16, 1, 0.3, 1) 0.38s both;
        }
        .land-hero-actions {
          display: flex;
          gap: 0.85rem;
          justify-content: flex-start;
          flex-wrap: wrap;
          animation: hero-in 0.85s cubic-bezier(0.16, 1, 0.3, 1) 0.52s both;
        }
        .land-hero-no-acct {
          margin-top: 1.15rem;
          font-size: 0.73rem;
          color: rgba(240,232,216,0.28);
          font-family: system-ui, -apple-system, sans-serif;
          animation: hero-in 0.85s cubic-bezier(0.16, 1, 0.3, 1) 0.66s both;
          letter-spacing: 0.02em;
        }
        .land-scroll-ind {
          position: absolute;
          bottom: 3rem;
          left: 50%;
          transform: translateX(-50%);
          z-index: 3;
          animation: hero-in 0.9s cubic-bezier(0.16, 1, 0.3, 1) 1.4s both;
        }
        .land-scroll-line {
          width: 1px;
          height: 48px;
          background: linear-gradient(to bottom, rgba(201,168,120,0.7), transparent);
          animation: scroll-line 2.2s ease-in-out infinite;
        }
        .land-hero-fade {
          position: absolute;
          bottom: 0; left: 0; right: 0;
          height: 180px;
          background: linear-gradient(to bottom, transparent, #f7f3ec);
          pointer-events: none;
          z-index: 2;
        }

        /* ---- BIBLE BOOK ---- */
        .bf-scene {
          perspective: 1100px;
          perspective-origin: 52% 44%;
          width: 100%;
          max-width: 460px;
          user-select: none;
          isolation: isolate;
          -webkit-transform: translateZ(0);
          transform: translateZ(0);
        }
        .bf-book {
          transform-style: preserve-3d;
          position: relative;
          width: 380px;
          height: 268px;
          /* JS overrides this each frame */
          transform: translate3d(0, 0, 0) rotateX(7deg) rotateY(-10deg);
          margin: 0 auto;
        }

        /* ── Shared page base ── */
        .bf-page, .bf-flip-page {
          position: absolute;
          top: 0;
          height: 268px;
          width: 190px;
        }

        /* ── Back board (book thickness illusion) ── */
        .bf-back-board {
          position: absolute;
          inset: 0;
          border-radius: 10px;
          background: linear-gradient(135deg, #1a0e06 0%, #2d1c0a 55%, #1a0e06 100%);
          transform: translateZ(-16px);
          box-shadow: 0 20px 60px rgba(0,0,0,0.75), 0 4px 16px rgba(0,0,0,0.5);
        }

        /* ── Page stack (visible edges) ── */
        .bf-page-stack {
          position: absolute;
          top: 4px; bottom: 4px;
          left: 4px; right: 4px;
          background: repeating-linear-gradient(
            to bottom,
            #e2daca 0px, #e2daca 1px,
            #f2ede4 1px, #f2ede4 3px
          );
          transform: translateZ(-3px);
          border-radius: 6px 8px 8px 6px;
        }
        .bf-page-mid,
        .bf-page-deep {
          left: 190px;
          background: linear-gradient(262deg, #ece6d8 0%, #f7f3eb 100%);
          border-radius: 0 8px 8px 0;
          pointer-events: none;
          box-shadow: inset 0 0 0 1px rgba(109,76,49,0.04);
        }
        .bf-page-mid {
          transform: translateX(-3px) translateZ(-1px) rotateY(-6deg);
          opacity: 0.94;
        }
        .bf-page-deep {
          transform: translateX(-6px) translateZ(-2px) rotateY(-11deg);
          opacity: 0.88;
        }

        /* ── Left page (static) ── */
        .bf-left-page {
          left: 0;
          background: linear-gradient(98deg, #ede8d8 0%, #f8f4ed 100%);
          border-radius: 8px 0 0 8px;
          box-shadow: inset -8px 0 18px rgba(0,0,0,0.08);
          overflow: hidden;
        }
        .bf-left-shadow {
          position: absolute;
          top: 0; right: 0; bottom: 0;
          width: 32px;
          background: linear-gradient(to right, transparent, rgba(0,0,0,0.07));
          pointer-events: none;
        }

        /* ── Right static page (revealed under flip) ── */
        .bf-right-static {
          left: 190px;
          background: linear-gradient(262deg, #ede8d8 0%, #f5f1ea 100%);
          border-radius: 0 8px 8px 0;
          overflow: hidden;
        }
        .bf-right-inner-shadow {
          position: absolute;
          top: 0; left: 0; bottom: 0;
          width: 32px;
          background: linear-gradient(to left, transparent, rgba(0,0,0,0.1));
          pointer-events: none;
        }

        /* ── Flipping page ── */
        .bf-flip-page {
          left: 190px;
          transform-style: preserve-3d;
          transform-origin: 0% 50%;
          transform: rotateY(-28deg);
          cursor: default;
          pointer-events: none;
          opacity: 1;
          /* No opacity transition — RAF + transition caused ghosting / afterimages */
        }
        .bf-flip-page--under {
          z-index: 0;
        }
        .bf-flip-page--top {
          z-index: 1;
        }
        .bf-flip-front, .bf-flip-back {
          position: absolute;
          inset: 0;
          backface-visibility: hidden;
          -webkit-backface-visibility: hidden;
          overflow: hidden;
          -webkit-transform: translateZ(0.01px);
          transform: translateZ(0.01px);
        }
        .bf-flip-front {
          background: linear-gradient(262deg, #e8e2d2 0%, #f5f1ea 100%);
          border-radius: 0 8px 8px 0;
        }
        .bf-flip-back {
          transform: rotateY(180deg);
          background: linear-gradient(98deg, #e8e2d2 0%, #f5f1ea 100%);
          border-radius: 8px 0 0 8px;
          box-shadow: inset -6px 0 14px rgba(0,0,0,0.07);
        }
        /* Spine-side shading simulates page curl */
        .bf-flip-front::after {
          content: '';
          position: absolute;
          inset: 0;
          background: linear-gradient(to right, rgba(0,0,0,0.06), transparent 28%);
          pointer-events: none;
        }
        /* Dynamic shadow cast by turning page (opacity driven by JS) */
        .bf-flip-shadow {
          position: absolute;
          inset: 0;
          background: linear-gradient(to right, rgba(0,0,0,0.45) 0%, transparent 80%);
          pointer-events: none;
          opacity: 0;
        }
        /* Darkening overlay on right static page as flip page lifts over it */
        .bf-right-shadow-overlay {
          position: absolute;
          inset: 0;
          background: linear-gradient(to left, transparent 20%, rgba(0,0,0,0.28) 100%);
          pointer-events: none;
          opacity: 0.3;
        }

        /* ── Spine ── */
        .bf-spine {
          position: absolute;
          top: 0; bottom: 0;
          left: 187px;
          width: 6px;
          z-index: 10;
          background: linear-gradient(90deg,
            rgba(0,0,0,0.25) 0%,
            rgba(201,168,120,0.5) 30%,
            rgba(201,168,120,0.7) 50%,
            rgba(201,168,120,0.5) 70%,
            rgba(0,0,0,0.2) 100%
          );
          pointer-events: none;
        }

        /* ── Top/bottom cover boards ── */
        .bf-top-board {
          position: absolute;
          left: -4px; right: -4px;
          height: 7px;
          background: linear-gradient(180deg, #2e1d0c 0%, #3d2a14 100%);
          top: -4px;
          border-radius: 3px 3px 0 0;
          transform: translateZ(-1px) rotateX(-90deg);
          transform-origin: center top;
          box-shadow: 0 -2px 8px rgba(0,0,0,0.5);
        }
        .bf-bottom-board {
          position: absolute;
          left: -4px; right: -4px;
          height: 7px;
          background: linear-gradient(0deg, #2e1d0c 0%, #3d2a14 100%);
          bottom: -4px;
          border-radius: 0 0 3px 3px;
          transform: translateZ(-1px) rotateX(90deg);
          transform-origin: center bottom;
          box-shadow: 0 2px 8px rgba(0,0,0,0.5);
        }

        /* ── Decorative text lines (illegible, visual only) ── */
        .bf-lines {
          padding: 11px 12px 9px;
          height: 100%;
          display: flex;
          flex-direction: column;
          gap: 4px;
          overflow: hidden;
          box-sizing: border-box;
        }
        .bf-line {
          height: 3px;
          border-radius: 2px;
          background: rgba(58,38,18,0.16);
          flex-shrink: 0;
        }
        .bf-lines--diagonal .bf-line {
          background:
            repeating-linear-gradient(
              -18deg,
              rgba(58,38,18,0.18) 0 3px,
              rgba(58,38,18,0.07) 3px 6px
            );
        }
        .bf-line--header {
          width: 55% !important;
          height: 4px;
          background: rgba(109,76,49,0.35);
          margin-bottom: 4px;
        }
        .bf-line--gap {
          height: 6px;
          background: transparent;
        }
        .bf-line--num {
          width: 18% !important;
          background: rgba(58,38,18,0.1);
          align-self: center;
          margin-top: auto;
        }

        /* ── Glow under the book ── */
        .bf-glow {
          position: absolute;
          bottom: -40px;
          left: 50%;
          transform: translateX(-50%);
          width: 300px;
          height: 60px;
          background: radial-gradient(ellipse, rgba(201,168,120,0.2) 0%, transparent 70%);
          filter: blur(12px);
          pointer-events: none;
        }

        /* Responsive: collapse to stacked on narrower screens */
        @media (max-width: 900px) {
          .land-hero-split {
            grid-template-columns: 1fr;
            text-align: center;
          }
          .land-hero-inner { text-align: center; }
          .land-hero-sub { margin: 0 auto 2.6rem; }
          .land-hero-actions { justify-content: center; }
          .land-hero-book-col { order: -1; }
          .bf-scene { max-width: 340px; }
          .bf-book { width: 300px; height: 212px; }
          .bf-page, .bf-flip-page { height: 212px; width: 150px; }
          .bf-right-static, .bf-flip-page { left: 150px; }
          .bf-spine { left: 147px; }
          .bf-pg-text p { font-size: 0.5rem; }
        }
        @media (max-width: 540px) {
          .land-hero-book-col { display: none; }
        }

        /* ---- REALITY CHECK ---- */
        .land-reality {
          background: #f7f3ec;
          padding: 6rem 2rem;
          border-bottom: 1px solid rgba(109,76,49,0.1);
        }
        .land-reality-inner {
          max-width: 1120px;
          margin: 0 auto;
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 5rem;
          align-items: center;
        }
        .land-reality-title {
          font-size: clamp(1.8rem, 3.8vw, 2.8rem);
          font-weight: 800;
          line-height: 1.1;
          letter-spacing: -0.03em;
          color: #1a1410;
          margin-bottom: 1.2rem;
          font-family: Georgia, serif;
        }
        .land-reality-desc {
          font-size: 1rem;
          line-height: 1.8;
          color: #7a6a58;
          font-family: system-ui, -apple-system, sans-serif;
          max-width: 42rem;
        }
        .land-stats-grid {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 1rem;
        }
        .land-stat-card {
          background: #fff;
          border: 1px solid rgba(109,76,49,0.1);
          border-radius: 20px;
          padding: 1.75rem 1.5rem;
          display: flex;
          flex-direction: column;
          gap: 0.45rem;
          box-shadow: 0 4px 20px rgba(88,63,38,0.06);
          transition: transform 0.2s, box-shadow 0.2s;
        }
        .land-stat-card:hover { transform: translateY(-2px); box-shadow: 0 8px 30px rgba(88,63,38,0.1); }
        .land-stat-card--accent {
          background: linear-gradient(135deg, #6d4c31 0%, #4a3020 100%);
          border-color: transparent;
          box-shadow: 0 8px 32px rgba(88,63,38,0.22);
        }
        .land-stat-card--accent .land-stat-num { color: #f5e0b8; }
        .land-stat-card--accent .land-stat-label { color: rgba(245,224,184,0.6); }
        .land-stat-num {
          font-size: 2.8rem;
          font-weight: 800;
          color: #6d4c31;
          letter-spacing: -0.05em;
          font-family: Georgia, serif;
          line-height: 1;
        }
        .land-stat-label {
          font-size: 0.82rem;
          line-height: 1.45;
          color: #8a7060;
          font-family: system-ui, -apple-system, sans-serif;
          font-weight: 500;
        }

        /* ---- FEATURES ---- */
        .land-features {
          background: #f7f3ec;
          padding: 5rem 2rem 8rem;
        }
        .land-features-hd {
          text-align: center;
          max-width: 600px;
          margin: 0 auto 5.5rem;
        }
        .land-features-title {
          font-size: clamp(1.9rem, 4vw, 2.9rem);
          font-weight: 800;
          line-height: 1.1;
          letter-spacing: -0.03em;
          color: #1a1410;
          margin-top: 0.8rem;
          font-family: Georgia, serif;
        }
        .land-features-inner {
          max-width: 1120px;
          margin: 0 auto;
          display: flex;
          flex-direction: column;
          gap: 8rem;
        }
        .land-feat-row {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 5rem;
          align-items: center;
        }
        .land-feat-row--rev .land-feat-copy  { order: 2; }
        .land-feat-row--rev .land-feat-visual { order: 1; }
        .land-feat-copy { display: flex; flex-direction: column; }
        .land-eyebrow-sm {
          font-size: 0.64rem;
          font-weight: 800;
          letter-spacing: 0.3em;
          text-transform: uppercase;
          color: #6d4c31;
          font-family: system-ui, -apple-system, sans-serif;
          margin-bottom: 1rem;
        }
        .land-eyebrow-sm--light { color: #8a6a48; }
        .land-feat-title {
          font-size: clamp(1.6rem, 3vw, 2.2rem);
          font-weight: 800;
          line-height: 1.12;
          letter-spacing: -0.028em;
          color: #1a1410;
          margin-bottom: 1rem;
          font-family: Georgia, serif;
        }
        .land-feat-desc {
          font-size: 1rem;
          line-height: 1.8;
          color: #8a7a68;
          font-family: system-ui, -apple-system, sans-serif;
          margin-bottom: 1.5rem;
        }
        .land-feat-list {
          list-style: none;
          display: flex;
          flex-direction: column;
          gap: 0.6rem;
        }
        .land-feat-list li {
          display: flex;
          align-items: flex-start;
          gap: 0.7rem;
          font-size: 0.92rem;
          color: #5c4c3c;
          line-height: 1.55;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-feat-list li::before {
          content: '';
          display: block;
          flex-shrink: 0;
          width: 5px; height: 5px;
          border-radius: 50%;
          background: #c9a878;
          margin-top: 0.52em;
        }
        .land-feat-visual { display: flex; align-items: center; justify-content: center; }

        /* ---- MOCK WINDOWS ---- */
        .land-mock-win {
          width: 100%;
          max-width: 430px;
          background: #12100d;
          border-radius: 14px;
          border: 1px solid rgba(255,255,255,0.07);
          overflow: hidden;
          box-shadow: 0 36px 72px rgba(0,0,0,0.45), 0 0 0 1px rgba(255,255,255,0.04) inset;
        }
        .land-mock-win--light {
          background: #fffdf8;
          border-color: rgba(109,76,49,0.1);
          box-shadow: 0 24px 56px rgba(88,63,38,0.14), 0 0 0 1px rgba(255,255,255,0.85) inset;
        }
        .land-mock-bar {
          display: flex;
          align-items: center;
          gap: 0.32rem;
          padding: 0.55rem 0.8rem;
          background: rgba(255,255,255,0.035);
          border-bottom: 1px solid rgba(255,255,255,0.065);
        }
        .land-mock-bar--light {
          background: rgba(109,76,49,0.035);
          border-color: rgba(109,76,49,0.09);
        }
        .dot { width: 9px; height: 9px; border-radius: 50%; flex-shrink: 0; }
        .dot-r { background: #ff5f56; }
        .dot-y { background: #febc2e; }
        .dot-g { background: #27c93f; }
        .land-mock-title {
          margin-left: 0.4rem;
          font-size: 0.67rem;
          font-weight: 600;
          letter-spacing: 0.09em;
          color: rgba(240,232,216,0.3);
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-mock-title--light { color: rgba(109,76,49,0.42); }

        /* Chat */
        .land-mock-chat { padding: 1rem; display: flex; flex-direction: column; gap: 0.7rem; }
        .land-chat-msg {
          padding: 0.68rem 0.88rem;
          border-radius: 10px;
          font-size: 0.79rem;
          line-height: 1.62;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-chat-user {
          background: rgba(201,168,120,0.15);
          color: #c9a878;
          align-self: flex-end;
          max-width: 82%;
          text-align: right;
          border-radius: 10px 10px 4px 10px;
        }
        .land-chat-ai {
          background: rgba(255,255,255,0.045);
          color: rgba(240,232,216,0.72);
          align-self: flex-start;
          max-width: 92%;
          border: 1px solid rgba(240,232,216,0.065);
          border-radius: 10px 10px 10px 4px;
        }
        .land-chat-ai-name {
          display: block;
          font-size: 0.6rem;
          font-weight: 700;
          letter-spacing: 0.12em;
          text-transform: uppercase;
          color: #c9a878;
          margin-bottom: 0.25rem;
        }
        .land-chat-cursor {
          width: 2px; height: 13px;
          background: #c9a878;
          border-radius: 1px;
          opacity: 0.7;
          align-self: flex-start;
          margin-top: -0.3rem;
          animation: blink 1.1s step-end infinite;
        }

        /* Themes */
        .land-mock-themes-grid {
          padding: 0.8rem;
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          gap: 0.4rem;
        }
        .land-swatch {
          height: 56px;
          border-radius: 8px;
          display: flex;
          align-items: flex-end;
          padding: 0.3rem 0.4rem;
          font-size: 0.6rem;
          font-family: system-ui, -apple-system, sans-serif;
          font-weight: 700;
          border: 1px solid rgba(255,255,255,0.07);
          cursor: pointer;
          transition: transform 0.16s;
          user-select: none;
        }
        .land-swatch:hover { transform: scale(1.05); }
        .swatch-default   { background: linear-gradient(135deg,#faf7f0,#ece4d7); color:#6d4c31; border-color:rgba(109,76,49,0.15); }
        .swatch-dark      { background: linear-gradient(135deg,#16130f,#2a2318); color:#c9956a; }
        .swatch-parchment { background: linear-gradient(135deg,#f5ead0,#e8d8b0); color:#7a5c3a; border-color:rgba(122,92,58,0.15); }
        .swatch-galaxy    { background: linear-gradient(135deg,#1a0f2e,#3d1f6e); color:#e8c478; }
        .swatch-teal      { background: linear-gradient(135deg,#0a2028,#0d3a50); color:#5aaec4; }
        .swatch-pink      { background: linear-gradient(135deg,#ffe0ea,#ffb8cc); color:#c01848; border-color:rgba(192,24,72,0.12); }
        .land-mock-reader-preview {
          border-top: 1px solid rgba(109,76,49,0.1);
          padding: 0.85rem 1rem;
        }
        .land-mock-verse {
          font-size: 0.8rem;
          line-height: 1.78;
          color: #5f4f40;
          font-family: Georgia, serif;
        }
        .land-mock-verse sup { font-size: 0.6em; color: #a08870; margin-right: 0.12em; vertical-align: super; }

        /* Summary */
        .land-mock-summary { padding: 1rem; display: flex; flex-direction: column; gap: 0.52rem; }
        .land-mock-sum-label {
          font-size: 0.62rem; font-weight: 700; letter-spacing: 0.15em;
          text-transform: uppercase; color: rgba(201,168,120,0.5);
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-mock-sum-title { font-size: 0.98rem; font-weight: 700; color: #f0e8d8; }
        .land-mock-tags { display: flex; flex-wrap: wrap; gap: 0.28rem; }
        .land-mock-tag {
          font-size: 0.61rem; font-family: system-ui, -apple-system, sans-serif;
          font-weight: 600; padding: 0.16rem 0.48rem; border-radius: 999px;
          background: rgba(201,168,120,0.13); color: #c9a878;
          border: 1px solid rgba(201,168,120,0.2);
        }
        .land-mock-sum-body {
          font-size: 0.78rem; line-height: 1.65;
          color: rgba(240,232,216,0.52); font-family: system-ui, -apple-system, sans-serif;
        }
        .land-mock-people { display: flex; gap: 0.3rem; margin-top: 0.2rem; }
        .land-mock-person-chip {
          font-size: 0.64rem; font-family: system-ui, -apple-system, sans-serif;
          font-weight: 600; padding: 0.18rem 0.58rem; border-radius: 999px;
          background: rgba(255,255,255,0.055); color: rgba(240,232,216,0.48);
          border: 1px solid rgba(255,255,255,0.07);
        }

        /* Mastery */
        .land-mock-mastery { padding: 1rem 1rem 0.75rem; display: flex; flex-direction: column; gap: 0.65rem; }
        .land-mock-mastery-hd { display: flex; justify-content: space-between; align-items: baseline; }
        .land-mock-mastery-book {
          font-size: 0.88rem; font-weight: 700; color: #2a1c10;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-mock-mastery-pct {
          font-size: 0.68rem; font-weight: 700; color: #6d4c31;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-mock-mastery-bar {
          height: 5px; background: rgba(109,76,49,0.12); border-radius: 999px; overflow: hidden;
        }
        .land-mock-mastery-fill {
          height: 100%; background: linear-gradient(90deg, #c9a878, #7a5235);
          border-radius: 999px; width: 0;
          animation: mastery-fill 1.6s cubic-bezier(0.16,1,0.3,1) 0.4s forwards;
        }
        .land-mock-mastery-grid {
          display: flex;
          flex-wrap: wrap;
          gap: 4px;
        }
        .land-mock-ch {
          width: 18px; height: 18px; border-radius: 4px;
          background: rgba(109,76,49,0.1);
          border: 1px solid rgba(109,76,49,0.1);
          font-size: 0;
        }
        .ch-done { background: #6d4c31; border-color: #6d4c31; }
        .ch-partial { background: rgba(201,168,120,0.5); border-color: rgba(201,168,120,0.5); }
        .land-mock-quiz-preview {
          border-top: 1px solid rgba(109,76,49,0.1);
          padding-top: 0.65rem;
          display: flex;
          flex-direction: column;
          gap: 0.4rem;
        }
        .land-mock-quiz-q {
          font-size: 0.75rem; font-weight: 600; color: #2a1c10;
          font-family: system-ui, -apple-system, sans-serif;
          line-height: 1.45;
        }
        .land-mock-quiz-opts { display: flex; flex-direction: column; gap: 0.3rem; }
        .land-mock-quiz-opt {
          font-size: 0.71rem; padding: 0.38rem 0.6rem; border-radius: 7px;
          font-family: system-ui, -apple-system, sans-serif;
          background: rgba(109,76,49,0.07); color: #5c4c3c;
          border: 1px solid rgba(109,76,49,0.1);
        }
        .land-mock-quiz-opt--correct {
          background: rgba(34,120,60,0.1); color: #276338;
          border-color: rgba(34,120,60,0.22);
          font-weight: 600;
        }

        /* ---- TIMELINE SECTION ---- */
        .land-timeline-section {
          background: #0c0a07;
          padding: 7rem 2rem;
          position: relative;
          overflow: hidden;
        }
        .land-timeline-section::before {
          content: '';
          position: absolute;
          inset: 0;
          background-image: radial-gradient(circle, rgba(201,168,120,0.055) 1px, transparent 1px);
          background-size: 34px 34px;
          pointer-events: none;
        }
        .land-timeline-section::after {
          content: '';
          position: absolute;
          top: 0; left: 50%;
          transform: translateX(-50%);
          width: 800px; height: 400px;
          background: radial-gradient(ellipse, rgba(100,65,30,0.22) 0%, transparent 68%);
          pointer-events: none;
        }
        .land-timeline-inner {
          position: relative;
          z-index: 1;
          max-width: 900px;
          margin: 0 auto;
          display: flex;
          flex-direction: column;
          align-items: center;
          gap: 3.5rem;
        }
        .land-timeline-hd {
          text-align: center;
          max-width: 640px;
        }
        .land-timeline-hd .land-features-title { color: #f0e8d8; }
        .land-timeline-desc {
          margin-top: 1rem;
          font-size: 1rem;
          line-height: 1.78;
          color: rgba(240,232,216,0.48);
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-timeline-hd .land-eyebrow-sm { color: #c9a878; }

        /* Person header */
        .land-timeline-demo {
          width: 100%;
          background: rgba(20,16,10,0.65);
          border: 1px solid rgba(255,255,255,0.075);
          border-radius: 24px;
          overflow: hidden;
          box-shadow: 0 40px 80px rgba(0,0,0,0.4), 0 0 0 1px rgba(255,255,255,0.04) inset;
          backdrop-filter: blur(12px);
        }
        .land-tl-person-hd {
          display: flex;
          align-items: center;
          gap: 1rem;
          padding: 1.5rem 1.75rem;
          border-bottom: 1px solid rgba(255,255,255,0.065);
          background: rgba(255,255,255,0.025);
        }
        .land-tl-person-avatar {
          width: 44px; height: 44px;
          border-radius: 50%;
          background: linear-gradient(135deg, #c9a878 0%, #7a5235 100%);
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 1.1rem;
          font-weight: 800;
          color: #1a0f00;
          font-family: Georgia, serif;
          flex-shrink: 0;
        }
        .land-tl-person-name {
          font-size: 1.05rem;
          font-weight: 700;
          color: #f0e8d8;
          font-family: Georgia, serif;
        }
        .land-tl-person-meta {
          font-size: 0.73rem;
          color: rgba(240,232,216,0.38);
          font-family: system-ui, -apple-system, sans-serif;
          margin-top: 0.1rem;
          letter-spacing: 0.04em;
        }
        .land-tl-person-chip {
          margin-left: auto;
          font-size: 0.68rem;
          font-weight: 700;
          padding: 0.22rem 0.65rem;
          border-radius: 999px;
          background: rgba(201,168,120,0.14);
          color: #c9a878;
          border: 1px solid rgba(201,168,120,0.22);
          font-family: system-ui, -apple-system, sans-serif;
          letter-spacing: 0.04em;
          white-space: nowrap;
        }

        /* Timeline */
        .land-tl-wrap {
          position: relative;
          padding: 2rem 1.5rem;
          display: flex;
          flex-direction: column;
          gap: 12px;
        }
        .land-tl-line {
          position: absolute;
          top: 28px;
          bottom: 28px;
          left: 50%;
          width: 1px;
          transform: translateX(-50%);
          background: linear-gradient(180deg, rgba(201,168,120,0.5) 0%, rgba(201,168,120,0.08) 100%);
        }
        .land-tl-row {
          position: relative;
          display: grid;
          grid-template-columns: minmax(0,1fr) 36px minmax(0,1fr);
          align-items: start;
          z-index: 1;
        }
        .land-tl-row--left .land-tl-card  { grid-column: 1; padding-right: 16px; }
        .land-tl-row--left .land-tl-dot   { grid-column: 2; }
        .land-tl-row--left .land-tl-gap   { grid-column: 3; }
        .land-tl-row--right .land-tl-gap  { grid-column: 1; }
        .land-tl-row--right .land-tl-dot  { grid-column: 2; }
        .land-tl-row--right .land-tl-card { grid-column: 3; padding-left: 16px; }

        .land-tl-card {
          background: rgba(255,255,255,0.04);
          border: 1px solid rgba(255,255,255,0.075);
          border-radius: 14px;
          padding: 0.85rem 1rem;
          display: flex;
          flex-direction: column;
          gap: 4px;
          transition: border-color 0.18s, background 0.18s;
        }
        .land-tl-card:hover {
          border-color: rgba(201,168,120,0.3);
          background: rgba(201,168,120,0.06);
        }
        .land-tl-card-label {
          font-size: 0.6rem;
          font-weight: 700;
          letter-spacing: 0.12em;
          text-transform: uppercase;
          color: rgba(201,168,120,0.55);
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-tl-card-era {
          font-size: 0.78rem;
          font-weight: 700;
          color: #c9a878;
          font-family: system-ui, -apple-system, sans-serif;
        }
        .land-tl-card-title {
          font-size: 0.88rem;
          font-weight: 700;
          color: #f0e8d8;
          line-height: 1.3;
          font-family: Georgia, serif;
        }
        .land-tl-card-note {
          font-size: 0.75rem;
          line-height: 1.55;
          color: rgba(240,232,216,0.42);
          font-family: system-ui, -apple-system, sans-serif;
          margin-top: 2px;
        }
        .land-tl-dot {
          justify-self: center;
          margin-top: 14px;
          width: 11px; height: 11px;
          border-radius: 50%;
          background: rgba(201,168,120,0.65);
          border: 2px solid #0c0a07;
          box-shadow: 0 0 0 2px rgba(201,168,120,0.3);
          flex-shrink: 0;
        }
        .land-tl-footer {
          text-align: center;
          padding: 1rem 1.75rem 1.5rem;
          border-top: 1px solid rgba(255,255,255,0.055);
          font-size: 0.78rem;
          color: rgba(240,232,216,0.3);
          font-family: system-ui, -apple-system, sans-serif;
          letter-spacing: 0.03em;
        }

        @media (max-width: 600px) {
          .land-tl-row {
            grid-template-columns: 20px minmax(0,1fr);
            gap: 0;
          }
          .land-tl-row--left .land-tl-card,
          .land-tl-row--right .land-tl-card {
            grid-column: 2;
            grid-row: 1;
            padding-left: 12px;
            padding-right: 0;
          }
          .land-tl-row--left .land-tl-dot,
          .land-tl-row--right .land-tl-dot {
            grid-column: 1;
            grid-row: 1;
            justify-self: center;
          }
          .land-tl-row--left .land-tl-gap,
          .land-tl-row--right .land-tl-gap { display: none; }
          .land-tl-line { left: calc(1.5rem + 10px); }
          .land-tl-wrap { padding: 2rem 1.25rem; }
          .land-tl-person-hd { padding: 1.1rem 1.25rem; gap: 0.75rem; }
          .land-tl-person-chip { display: none; }
        }

        /* ---- QUOTE ---- */
        .land-quote {
          background: #0c0a07;
          padding: 8rem 2rem;
          text-align: center;
          position: relative;
          overflow: hidden;
        }
        .land-quote::before {
          content: '';
          position: absolute; inset: 0;
          background-image: radial-gradient(circle, rgba(201,168,120,0.055) 1px, transparent 1px);
          background-size: 34px 34px;
          pointer-events: none;
        }
        .land-quote::after {
          content: '';
          position: absolute;
          top: 50%; left: 50%;
          transform: translate(-50%, -50%);
          width: 600px; height: 600px;
          border-radius: 50%;
          background: radial-gradient(circle, rgba(100,65,30,0.18) 0%, transparent 68%);
          pointer-events: none;
        }
        .land-quote-inner { position: relative; z-index: 1; max-width: 680px; margin: 0 auto; }
        .land-quote-ornament {
          font-size: 9rem; line-height: 0.55;
          color: rgba(201,168,120,0.12); font-family: Georgia, serif;
          margin-bottom: 0.6rem; user-select: none;
        }
        .land-blockquote {
          font-size: clamp(1.5rem, 3.8vw, 2.2rem);
          line-height: 1.52; color: rgba(240,232,216,0.82);
          font-style: italic; font-weight: 400;
          font-family: Georgia, serif;
          margin-bottom: 1.35rem;
        }
        .land-quote-cite {
          font-size: 0.73rem; font-weight: 700; letter-spacing: 0.24em;
          text-transform: uppercase; color: #c9a878;
          font-family: system-ui, -apple-system, sans-serif; font-style: normal;
        }

        /* ---- CTA ---- */
        .land-cta {
          background: #faf7f2;
          padding: 8rem 2rem;
          text-align: center;
          border-top: 1px solid rgba(109,76,49,0.09);
        }
        .land-cta-inner { max-width: 560px; margin: 0 auto; }
        .land-cta-title {
          font-size: clamp(2rem, 4.5vw, 3rem);
          font-weight: 800; line-height: 1.1;
          letter-spacing: -0.03em; color: #1a1410;
          margin: 0.8rem 0 1rem;
          font-family: Georgia, serif;
        }
        .land-cta-sub {
          font-size: 1.05rem; line-height: 1.75; color: #8a7a68;
          font-family: system-ui, -apple-system, sans-serif;
          margin-bottom: 2.2rem;
        }
        .land-cta-actions { display: flex; gap: 0.8rem; justify-content: center; flex-wrap: wrap; }
        .land-cta-note {
          margin-top: 1.2rem; font-size: 0.72rem;
          color: #b8a898; font-family: system-ui, -apple-system, sans-serif;
          letter-spacing: 0.02em;
        }

        /* ---- FOOTER ---- */
        .land-footer {
          text-align: center;
          padding: 1.5rem;
          background: #f7f3ec;
          color: #b8a898;
          font-size: 0.78rem;
          font-family: system-ui, -apple-system, sans-serif;
          border-top: 1px solid rgba(109,76,49,0.08);
        }

        /* ---- RESPONSIVE ---- */
        @media (max-width: 960px) {
          .land-reality-inner { grid-template-columns: 1fr; gap: 3rem; }
          .land-feat-row, .land-feat-row--rev { grid-template-columns: 1fr; gap: 2.5rem; }
          .land-feat-row--rev .land-feat-copy  { order: 0; }
          .land-feat-row--rev .land-feat-visual { order: 1; }
          .land-mock-win, .land-mock-win--light { max-width: 100%; }
        }
        @media (max-width: 640px) {
          .land-nav { padding: 0.9rem 1.25rem; }
          .land-stats-grid { grid-template-columns: 1fr 1fr; }
          .land-features-inner { gap: 5rem; }
          .land-reality { padding: 4rem 1.25rem; }
          .land-features { padding: 4rem 1.25rem 6rem; }
        }
        @media (max-width: 420px) {
          .land-stats-grid { grid-template-columns: 1fr; }
        }
      `}</style>
    </>
  );
}

// Decorative text lines — illegible squiggles that look like scripture text
function PageLines({ side, diagonal = false }: { side: 'left' | 'right'; diagonal?: boolean }) {
  const widths = side === 'left'
    ? [82,65,90,55,78,88,42,70,84,60,76,50,88,64,72,38,80,68,55,85,48,74]
    : [76,88,52,82,66,90,44,70,86,58,80,48,78,62,88,36,74,82,56,68,90,50];
  return (
    <div className={`bf-lines${diagonal ? ' bf-lines--diagonal' : ''}`}>
      <div className="bf-line bf-line--header" />
      <div className="bf-line bf-line--gap" />
      {widths.map((w, i) => (
        <div key={i} className="bf-line" style={{ width: `${w}%` }} />
      ))}
      <div className="bf-line bf-line--num" />
    </div>
  );
}

function BibleBook() {
  return (
    <div className="bf-scene">
      <div id="bf-book" className="bf-book">
        <div className="bf-back-board" />
        <div className="bf-page-stack" />

        <div className="bf-page bf-left-page">
          <PageLines side="left" />
          <div className="bf-left-shadow" />
        </div>

        <div className="bf-page bf-right-static">
          <PageLines side="right" />
          <div id="bf-right-shadow" className="bf-right-shadow-overlay" />
          <div className="bf-right-inner-shadow" />
        </div>

        <div className="bf-page bf-page-mid">
          <PageLines side="right" diagonal />
        </div>

        <div className="bf-page bf-page-deep">
          <PageLines side="right" diagonal />
        </div>

        <div id="bf-flip-b" className="bf-flip-page bf-flip-page--under" aria-hidden="true">
          <div className="bf-flip-front">
            <PageLines side="right" />
          </div>
          <div className="bf-flip-back">
            <PageLines side="left" />
          </div>
        </div>

        <div id="bf-flip-a" className="bf-flip-page bf-flip-page--top">
          <div className="bf-flip-front">
            <PageLines side="right" />
            <div id="bf-flip-shadow" className="bf-flip-shadow" />
          </div>
          <div className="bf-flip-back">
            <PageLines side="left" />
          </div>
        </div>

        <div className="bf-spine" />
        <div className="bf-top-board" />
        <div className="bf-bottom-board" />
      </div>
      <div className="bf-glow" aria-hidden="true" />
    </div>
  );
}

function ArrowRight() {
  return (
    <svg width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true">
      <path d="M8.5 3L13 7.5M13 7.5L8.5 12M13 7.5H2" stroke="currentColor" strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  );
}
