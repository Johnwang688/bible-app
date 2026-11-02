// Drives one web aurora (R-7a): the canvas, its renderer and frame loop, sizing at half
// resolution, GPU context loss and restore, stirring, and the data attributes the e2e tests read.
// Nothing here touches React state: the animation never re-renders anything.
import type { AuroraStyle } from './keys';
import { auroraState, createAuroraLoop, type AuroraClock, type AuroraRenderer, type AuroraState } from './loop';
import { samePalette, type AuroraPalette } from './palette';
import { createAuroraRenderer, type WebAuroraRenderer } from './renderer.web';

export interface AuroraInputs {
  style: AuroraStyle;
  palette: AuroraPalette;
  reduceMotion: boolean;
  focused: boolean;
  visible: boolean;
}

export interface AuroraController {
  update(next: AuroraInputs): void;
  destroy(): void;
}

/** The background is soft, so it renders at half the device resolution and scales up. */
const RESOLUTION = 0.5;
/** How often, at most, a running aurora writes its frame count to the canvas. */
const REPORT_MS = 250;
/** How far (CSS px) a pointer must move from where it went down before it stirs. */
const STIR_SLOP_PX = 10;

/** The canvas backing size for its CSS size, or null while it has no size (a hidden tab). */
function backingSize(el: HTMLElement): { w: number; h: number } | null {
  const r = el.getBoundingClientRect();
  if (r.width < 1 || r.height < 1) return null;
  const scale = Math.min(window.devicePixelRatio || 1, 2) * RESOLUTION;
  return { w: Math.max(2, Math.round(r.width * scale)), h: Math.max(2, Math.round(r.height * scale)) };
}

/**
 * Creates the canvas inside `host` and starts it. `screen` is the element whose pointer events
 * stir the fluid (the screen behind which the aurora sits).
 */
export function createAuroraController(host: HTMLElement, screen: HTMLElement | null, first: AuroraInputs): AuroraController {
  let inputs = first;
  let state: AuroraState | null = null;
  let lost = false;
  let shown = false;
  let destroyed = false;
  let lastReport = -Infinity;

  // A fresh canvas per controller: a canvas whose context was released cannot get another one.
  const canvas = document.createElement('canvas');
  canvas.setAttribute('data-testid', 'aurora-canvas');
  canvas.style.display = 'block';
  canvas.style.width = '100%';
  canvas.style.height = '100%';
  canvas.style.visibility = 'hidden';
  host.appendChild(canvas);
  const initial = backingSize(host);
  if (initial) {
    canvas.width = initial.w;
    canvas.height = initial.h;
  }

  // Null only without WebGL2. A renderer whose context was lost while it was being built comes back
  // with no style (state off) and rebuilds on `webglcontextrestored`.
  let renderer: WebAuroraRenderer | null = createAuroraRenderer(canvas, inputs.style, inputs.palette);

  const show = (on: boolean) => {
    if (shown === on) return;
    shown = on;
    canvas.style.visibility = on ? 'visible' : 'hidden';
  };

  const delegate: AuroraRenderer = {
    step: (dt) => renderer?.step(dt),
    draw: () => {
      // Shown only once a frame is really on it (the renderer never draws on a lost context).
      if (renderer && !lost && renderer.draw()) show(true);
    },
  };

  // requestAnimationFrame, with the frame count reported after each frame. One frame is pending at
  // a time, so one wrapper (made once) is enough: no allocation per frame.
  let inner: ((t: number) => void) | null = null;
  const outer = (t: number) => {
    const cb = inner;
    inner = null;
    cb?.(t);
    if (!destroyed && state === 'running' && t - lastReport >= REPORT_MS) {
      lastReport = t;
      reportFrames();
    }
  };
  const clock: AuroraClock = {
    request(cb) {
      inner = cb;
      return requestAnimationFrame(outer);
    },
    cancel(id) {
      inner = null;
      cancelAnimationFrame(id);
    },
  };
  const loop = createAuroraLoop(delegate, clock);

  function reportFrames() {
    canvas.setAttribute('data-aurora-frames', String(loop.frames()));
  }

  const reportStyle = () => {
    const s = renderer?.style ?? null;
    if (s === null) canvas.removeAttribute('data-aurora-style');
    else canvas.setAttribute('data-aurora-style', s);
  };

  const apply = () => {
    if (destroyed) return;
    const next = auroraState({
      glass: true,
      supported: renderer !== null && renderer.style !== null && !lost,
      reduceMotion: inputs.reduceMotion,
      focused: inputs.focused,
      visible: inputs.visible,
    });
    if (next !== state) {
      state = next;
      if (next === 'off') show(false);
      loop.setState(next);
      canvas.setAttribute('data-aurora-state', next);
      reportFrames();
    }
    // Every change that can end stirring (state, style, loss, the renderer) ends here.
    settleStir();
  };

  /** After the canvas content was lost (resize, restore, new style): put a frame back if it is still. */
  const refresh = () => {
    if (state === 'still') {
      loop.redraw();
      reportFrames();
    } else if (state === 'running') {
      // Draw now (the loop draws again next frame), so a resize never shows an empty canvas.
      delegate.draw();
    } else {
      // Paused or off: show the still CSS paint until the next frame.
      show(false);
    }
  };

  // ---- sizing ----
  const resize = () => {
    const size = backingSize(host);
    if (!size || (size.w === canvas.width && size.h === canvas.height)) return;
    canvas.width = size.w;
    canvas.height = size.h;
    if (!renderer || lost) return;
    const before = renderer.style;
    renderer.resize(size.w, size.h);
    if (renderer.style !== before) {
      // Fluid could not rebuild its buffers at this size and fell back to flow (or nothing could run).
      reportStyle();
      const prev = state;
      apply();
      if (prev !== state) return; // the new state drew (still) or stopped as it should
    }
    refresh();
  };
  const observer = typeof ResizeObserver === 'function' ? new ResizeObserver(resize) : null;
  observer?.observe(host);

  // ---- context loss ----
  const onLost = (e: Event) => {
    e.preventDefault(); // without this the browser never restores the context
    if (destroyed) return;
    lost = true;
    renderer?.contextLost();
    apply();
  };
  // Rebuild whatever state creation (or an earlier restore) left: with no renderer, create one.
  const onRestored = () => {
    if (destroyed) return;
    // A restore always follows an interruption, even one this controller never heard of.
    releasePointers();
    if (renderer) lost = !renderer.restore();
    else {
      renderer = createAuroraRenderer(canvas, inputs.style, inputs.palette);
      lost = renderer?.style == null;
    }
    reportStyle();
    if (lost) {
      apply(); // could not rebuild: nothing runs (and nothing stirs)
      return;
    }
    show(false);
    const prev = state;
    apply();
    if (prev === state) refresh();
  };
  canvas.addEventListener('webglcontextlost', onLost);
  canvas.addEventListener('webglcontextrestored', onRestored);

  // ---- stirring (fluid only) ----
  // Only a deliberate drag stirs: a pointer sends nothing until it has moved STIR_SLOP_PX from where it
  // went down. `touch-action: pan-y pinch-zoom` lets a vertical drag scroll and keeps pinch-zoom (the browser then cancels the pointer).
  const savedTouchAction = screen ? screen.style.touchAction : '';
  if (screen) screen.style.touchAction = 'pan-y pinch-zoom';
  //
  // A gesture belongs to one uninterrupted stirrable stretch. Whenever the aurora stops being stirrable
  // (paused, hidden, unfocused, Reduce Motion, a style other than fluid, context loss, the renderer gone),
  // every tracked pointer is forgotten (`settleStir`, reached from `apply`, plus `onRestored` and `destroy`):
  // one that was stirring gets its 'up' (if the renderer can still take it), so the fluid keeps no stuck
  // splat. A forgotten pointer is never tracked again; only a new pointerdown while stirrable is.
  /** Per pointer id: where it went down, whether it has started stirring, and the last point sent. */
  const downs = new Map<number, { x: number; y: number; stirring: boolean; ux: number; uy: number }>();
  const toUnit = (r: DOMRect, x: number, y: number) => [(x - r.left) / r.width, 1 - (y - r.top) / r.height] as const;
  const canStir = () => !!renderer && !lost && state === 'running' && renderer.style === 'fluid';
  /** Forgets every tracked pointer, ending (with an 'up' at its last point) any that was stirring. */
  function releasePointers() {
    if (downs.size === 0) return;
    const ups = [...downs].filter(([, d]) => d.stirring);
    downs.clear();
    // A lost renderer (or one with nothing built) has no splats to end.
    if (!renderer || lost || renderer.style === null) return;
    for (const [id, d] of ups) renderer.pointer('up', id, d.ux, d.uy);
  }
  /** Pointers are tracked only while the aurora can be stirred. */
  function settleStir() {
    if (!canStir()) releasePointers();
  }
  const onDown = (ev: PointerEvent) => {
    // A pointer that went down while the aurora could not be stirred never stirs, whatever changes later.
    if (!canStir()) {
      releasePointers();
      return;
    }
    downs.set(ev.pointerId, { x: ev.clientX, y: ev.clientY, stirring: false, ux: 0, uy: 0 });
  };
  const onMove = (ev: PointerEvent) => {
    const d = downs.get(ev.pointerId);
    if (!d) return;
    if (!renderer || !canStir()) {
      // Stirring ended without a change seen here (the renderer found its context lost): the gesture is over.
      releasePointers();
      return;
    }
    const r = canvas.getBoundingClientRect();
    if (r.width < 1 || r.height < 1) return;
    if (!d.stirring) {
      if (Math.hypot(ev.clientX - d.x, ev.clientY - d.y) < STIR_SLOP_PX) return;
      d.stirring = true;
      const [x, y] = toUnit(r, d.x, d.y);
      // The down point is the last point sent, so an 'up' from an interruption inside this call lands on it.
      d.ux = x;
      d.uy = y;
      renderer.pointer('down', ev.pointerId, x, y);
      // The call may have ended the stretch (paused, destroyed): then this gesture is forgotten; send nothing more.
      if (downs.get(ev.pointerId) !== d || !renderer || !canStir()) return;
    }
    const [x, y] = toUnit(r, ev.clientX, ev.clientY);
    d.ux = x;
    d.uy = y;
    renderer.pointer('move', ev.pointerId, x, y);
  };
  const onUp = (ev: PointerEvent) => {
    const d = downs.get(ev.pointerId);
    downs.delete(ev.pointerId);
    if (!d?.stirring || !renderer || lost || renderer.style === null) return;
    const r = canvas.getBoundingClientRect();
    if (r.width < 1 || r.height < 1) return;
    const [x, y] = toUnit(r, ev.clientX, ev.clientY);
    renderer.pointer('up', ev.pointerId, x, y);
  };
  const passive: AddEventListenerOptions = { passive: true };
  screen?.addEventListener('pointerdown', onDown, passive);
  screen?.addEventListener('pointermove', onMove, passive);
  screen?.addEventListener('pointerup', onUp, passive);
  screen?.addEventListener('pointercancel', onUp, passive);

  reportStyle();
  apply();

  return {
    update(next) {
      if (destroyed) return;
      const prev = inputs;
      inputs = next;
      if (renderer && next.style !== prev.style) {
        renderer.setStyle(next.style);
        reportStyle();
        if (renderer.style !== null) refresh();
      }
      if (renderer && !samePalette(next.palette, prev.palette)) {
        renderer.setPalette(next.palette);
        // A palette change while paused only updates the uniforms; a still frame is drawn again.
        if (state === 'still') {
          loop.redraw();
          reportFrames();
        }
      }
      apply();
    },
    destroy() {
      if (destroyed) return;
      destroyed = true;
      loop.destroy();
      observer?.disconnect();
      canvas.removeEventListener('webglcontextlost', onLost);
      canvas.removeEventListener('webglcontextrestored', onRestored);
      screen?.removeEventListener('pointerdown', onDown, passive);
      screen?.removeEventListener('pointermove', onMove, passive);
      screen?.removeEventListener('pointerup', onUp, passive);
      screen?.removeEventListener('pointercancel', onUp, passive);
      releasePointers();
      if (screen) screen.style.touchAction = savedTouchAction;
      renderer?.dispose();
      renderer = null;
      canvas.remove();
    },
  };
}
