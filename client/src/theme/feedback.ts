import type { Theme } from './types';

const controls = ':is([role="button"], [role="link"], [role="tab"], [role="radio"]):not([aria-disabled="true"]):not([data-hover="none"])';

/** One web stylesheet for every ordinary control. Tokens follow the approved desktop canvas. */
export function feedbackStyles(theme: Theme): string {
  const dark = theme.mode === 'dark';
  const hover = dark ? 'rgba(255,255,255,.10)' : 'rgba(255,255,255,.38)';
  const press = dark ? 'rgba(0,0,0,.14)' : 'rgba(0,0,0,.06)';
  const edge = dark ? 'rgba(255,255,255,.38)' : 'rgba(255,255,255,.95)';
  const ink = theme.colors.text;
  const flat = `${controls}[data-hover="flat"]:not([aria-current="page"])`;
  const raised = `${controls}:not([data-hover="flat"]):not([aria-current="page"])`;
  return `
@media (min-width: 768px) and (hover: hover) {
  ${controls} { transition: transform 120ms ease, box-shadow 120ms ease, filter 120ms ease, background-color 120ms ease; }
  ${controls}:focus-visible { outline: 3px solid ${ink} !important; outline-offset: 2px !important; }
  ${controls}:hover { filter: brightness(1.18); }
  ${controls}:active { filter: brightness(.88); }
  ${theme.style === 'glass' ? `
  :where(${controls}) { position: relative; }
  ${controls}::after { content: ''; position: absolute; inset: 0; pointer-events: none; border-radius: inherit; }
  ${controls}:hover::after { background: ${hover}; box-shadow: inset 0 0 0 1px ${edge}; }
  ${controls}:active::after { background: ${press}; }
  ` : `
  ${raised}:hover { transform: translate(-1px,-1px); box-shadow: 5px 5px 0 ${ink} !important; }
  ${raised}:active { transform: translate(2px,2px); box-shadow: 1px 1px 0 ${ink} !important; }
  ${flat}:hover { background: ${theme.canvas.c3 ?? theme.colors.hl} !important; }
  ${flat}:active { background: ${theme.canvas.c1 ?? theme.colors.hl} !important; }
  `}
  @media (prefers-reduced-motion: reduce) { ${controls} { transition: none !important; } }
}
@media (min-width: 1024px) {
  [data-reader-column="1"] { transition: margin-left 200ms ease; }
  @media (prefers-reduced-motion: reduce) { [data-reader-column="1"] { transition: none !important; } }
}
@media (min-width: 1024px) and (hover: hover) {
  [data-pointer-moved] [data-verse="1"]:hover { cursor: pointer; box-shadow: inset 0 0 0 999px color-mix(in srgb, ${theme.colors.hl} 50%, transparent); }
}`;
}

/** Pointer movement enables verse hover; scrolling invalidates the stale pointer location. */
export function watchVersePointer(doc: Document): () => void {
  const move = () => doc.documentElement.setAttribute('data-pointer-moved', '');
  const clear = () => doc.documentElement.removeAttribute('data-pointer-moved');
  doc.addEventListener('mousemove', move, { passive: true });
  doc.addEventListener('scroll', clear, { capture: true, passive: true });
  doc.addEventListener('wheel', clear, { passive: true });
  return () => {
    clear();
    doc.removeEventListener('mousemove', move);
    doc.removeEventListener('scroll', clear, true);
    doc.removeEventListener('wheel', clear);
  };
}
