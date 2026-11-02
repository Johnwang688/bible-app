// The web aurora renderer (R-7a): one WebGL2 context per canvas, running the fluid simulation or
// the flow shader. Fluid falls back to flow on a software renderer, when the GPU cannot render to
// half-float targets, or when its buffers cannot be (re)built.
import type { AuroraStyle } from './keys';
import type { AuroraRenderer } from './loop';
import type { AuroraPalette } from './palette';
import { createFlow } from './flow.web';
import { createFluid } from './fluid.web';
import { CONTEXT_ATTRIBUTES, createQuad, type StyleImpl } from './gl.web';

export type PointerKind = 'down' | 'move' | 'up';

export interface WebAuroraRenderer extends AuroraRenderer {
  /** The style actually running (fluid falls back to flow), or null if neither could start. */
  readonly style: AuroraStyle | null;
  setStyle(style: AuroraStyle): void;
  setPalette(palette: AuroraPalette): void;
  /**
   * The canvas backing size changed (the caller set `canvas.width/height`). If fluid cannot rebuild its
   * buffers at the new size it falls back to flow: read `style` afterwards.
   */
  resize(w: number, h: number): void;
  /** Stirring (fluid only). `x`, `y` are 0..1 over the canvas, `y` up. */
  pointer(kind: PointerKind, id: number, x: number, y: number): void;
  /** Rebuilds every GL object after `webglcontextrestored`. False if it could not. */
  restore(): boolean;
  dispose(): void;
}

export function createAuroraRenderer(
  canvas: HTMLCanvasElement,
  style: AuroraStyle,
  palette: AuroraPalette,
): WebAuroraRenderer | null {
  let gl: WebGL2RenderingContext | null = null;
  try {
    gl = canvas.getContext('webgl2', CONTEXT_ATTRIBUTES);
  } catch {
    gl = null;
  }
  if (!gl || gl.isContextLost()) return null;
  const ctx = gl;

  let wanted = style;
  let colours = palette;
  let quad: WebGLBuffer | null = null;
  let impl: StyleImpl | null = null;
  let disposed = false;

  const build = (): StyleImpl | null => {
    const w = Math.max(1, canvas.width);
    const h = Math.max(1, canvas.height);
    try {
      if (wanted === 'fluid') {
        const fluid = createFluid(ctx, colours, w, h);
        if (fluid) return fluid;
      }
      return createFlow(ctx, colours, w, h);
    } catch {
      return null;
    }
  };

  const buildAll = (): boolean => {
    try {
      quad = createQuad(ctx);
    } catch {
      quad = null;
      return false;
    }
    impl = build();
    return impl !== null;
  };

  if (!buildAll()) {
    if (quad) ctx.deleteBuffer(quad);
    return null;
  }

  const live = () => !disposed && impl !== null && !ctx.isContextLost();

  return {
    get style() {
      return impl?.style ?? null;
    },
    setStyle(s) {
      if (disposed || s === wanted) return;
      wanted = s;
      if (ctx.isContextLost()) return; // the restore builds the wanted style
      impl?.release();
      impl = build();
    },
    setPalette(p) {
      colours = p;
      if (live()) impl!.setPalette(p);
    },
    resize(w, h) {
      if (!live() || impl!.resize(w, h)) return;
      // The fluid buffers could not be rebuilt at this size: fall back to flow, as at creation.
      impl!.release();
      impl = null;
      if (ctx.isContextLost()) return; // the restore builds the wanted style again
      try {
        impl = createFlow(ctx, colours, Math.max(1, w), Math.max(1, h));
      } catch {
        impl = null;
      }
    },
    pointer(kind, id, x, y) {
      if (live()) impl!.pointer(kind, id, x, y);
    },
    step(dt) {
      if (live()) impl!.step(dt);
    },
    draw() {
      if (live()) impl!.draw();
    },
    restore() {
      if (disposed || ctx.isContextLost()) return false;
      // Every object from before the loss is gone with it; build afresh.
      impl = null;
      quad = null;
      return buildAll();
    },
    dispose() {
      if (disposed) return;
      disposed = true;
      if (!ctx.isContextLost()) {
        impl?.release();
        if (quad) ctx.deleteBuffer(quad);
      }
      impl = null;
      quad = null;
      ctx.getExtension('WEBGL_lose_context')?.loseContext();
    },
  };
}
