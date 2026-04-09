'use client';

import Link from 'next/link';
import { useEffect, useState } from 'react';
import styles from './LandingHero.module.css';

export default function LandingHero() {
  const [progress, setProgress] = useState(0);
  const [reducedMotion, setReducedMotion] = useState(false);

  useEffect(() => {
    const mq = window.matchMedia('(prefers-reduced-motion: reduce)');
    const updateMotion = () => setReducedMotion(mq.matches);
    updateMotion();
    mq.addEventListener('change', updateMotion);

    const onScroll = () => {
      if (mq.matches) {
        setProgress(1);
        return;
      }
      const y = window.scrollY;
      setProgress((prev) => (y > 0 ? 1 : prev));
    };

    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();

    return () => {
      mq.removeEventListener('change', updateMotion);
      window.removeEventListener('scroll', onScroll);
    };
  }, []);

  const p = reducedMotion ? 1 : progress;

  return (
    <section className={styles.heroOuter}>
      <div
        className={styles.bgLayer}
        style={{ '--hero-p': p } as React.CSSProperties}
        aria-hidden
      >
        <img
          className={styles.bgImg}
          src="/landing-page-images/john-3.png"
          alt=""
          width={1680}
          height={1100}
          draggable={false}
        />
        <div className={styles.vignette} />
      </div>
      <div className={styles.frost} aria-hidden />
      <div className={styles.heroInner}>
        <div className={styles.content}>
          <p className={styles.eyebrow}>Open Bible</p>
          <h1 className={styles.title}>
            Fall in love with
            <br />
            Scripture. Again.
          </h1>
          <p className={styles.sub}>
            Open Bible wraps every passage in intelligent context — commentary, cross-references, and
            a study companion that keeps up with your curiosity. Reading hasn&apos;t felt this good in
            a long time.
          </p>
          <div className={styles.actions}>
            <Link href="/app" className="landing-btn landing-btn-primary landing-btn-lg">
              Start Reading
            </Link>
          </div>
        </div>
      </div>
    </section>
  );
}
