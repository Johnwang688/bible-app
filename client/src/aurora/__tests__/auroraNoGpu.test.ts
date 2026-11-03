// R-7a follow-up (John, 11-02, r7a/FOLLOW-UP.md item 3). Orchestrator-owned acceptance tests; do not edit.
// With no GPU (a software renderer) the aurora keeps animating, at 30 fps instead of 60, rather than a still
// gradient. With a GPU nothing changes (60 fps). Reduce Motion still draws one still frame.
import { getTheme } from '../../theme/presets';
import type { AuroraInputs } from '../controller.web';
import { createAuroraLoop, type AuroraRenderer } from '../loop';
import { auroraPalette } from '../palette';

// ---- the loop's frame cap ----

function loopHarness() {
  const calls: { kind: 'step' | 'draw'; dt?: number }[] = [];
  const renderer: AuroraRenderer = {
    step: (dt) => void calls.push({ kind: 'step', dt }),
    draw: () => void calls.push({ kind: 'draw' }),
  };
  let next = 1;
  const pending = new Map<number, (t: number) => void>();
  const clock = {
    request: (cb: (t: number) => void) => {
      const id = next++;
      pending.set(id, cb);
      return id;
    },
    cancel: (id: number) => void pending.delete(id),
  };
  const tick = (t: number) => {
    const cbs = [...pending.values()];
    pending.clear();
    cbs.forEach((cb) => cb(t));
  };
  /** Ticks the display at `hz` for `seconds`, starting at `from` ms, with up to ±`jitter` ms per tick. */
  const run = (hz: number, seconds: number, from = 1000, jitter = 0) => {
    const n = Math.round(hz * seconds);
    for (let i = 0; i < n; i++) tick(from + (i * 1000) / hz + (i % 2 === 0 ? jitter : -jitter));
  };
  const loop = createAuroraLoop(renderer, clock);
  const draws = () => calls.filter((c) => c.kind === 'draw').length;
  return { loop, calls, pending, tick, run, draws };
}

describe('the loop at a 30 fps cap', () => {
  it.each([60, 120, 144])('draws about 30 frames a second on a %i Hz display', (hz) => {
    const h = loopHarness();
    h.loop.setMaxFps(30);
    h.loop.setState('running');
    h.run(hz, 2);
    expect(h.draws()).toBeGreaterThanOrEqual(56);
    expect(h.draws()).toBeLessThanOrEqual(62);
  });

  it('keeps 30 fps on a 60 Hz display whose frames arrive a little early or late', () => {
    const h = loopHarness();
    h.loop.setMaxFps(30);
    h.loop.setState('running');
    h.run(60, 2, 1000, 1.5);
    expect(h.draws()).toBeGreaterThanOrEqual(56);
    expect(h.draws()).toBeLessThanOrEqual(62);
  });

  it('steps the simulation by the time between drawn frames, and skips a tick with no step and no draw', () => {
    const h = loopHarness();
    h.loop.setMaxFps(30);
    h.loop.setState('running');
    h.run(60, 1);
    const steps = h.calls.filter((c) => c.kind === 'step');
    expect(steps.length).toBe(h.draws());
    // After the first frame, every step is about 1/30 s (two 60 Hz ticks).
    for (const s of steps.slice(1)) expect(s.dt!).toBeCloseTo(1 / 30, 2);
    // Steps and draws alternate: a skipped tick does neither.
    h.calls.forEach((c, i) => expect(c.kind).toBe(i % 2 === 0 ? 'step' : 'draw'));
  });

  it('keeps exactly one frame pending through skipped ticks', () => {
    const h = loopHarness();
    h.loop.setMaxFps(30);
    h.loop.setState('running');
    for (let i = 0; i < 10; i++) {
      h.tick(1000 + i * 16.67);
      expect(h.pending.size).toBe(1);
    }
  });

  it('draws 60 frames a second at 60 Hz with no cap, and after the cap is lifted', () => {
    const h = loopHarness();
    h.loop.setState('running');
    h.run(60, 1);
    expect(h.draws()).toBe(60);
    h.loop.setMaxFps(30);
    h.loop.setMaxFps(null);
    h.run(60, 1, 3000);
    expect(h.draws()).toBe(120);
  });

  it('still draws one still frame under the cap, and nothing more', () => {
    const h = loopHarness();
    h.loop.setMaxFps(30);
    h.loop.setState('still');
    expect(h.draws()).toBe(1);
    expect(h.pending.size).toBe(0);
    h.loop.redraw();
    expect(h.draws()).toBe(2);
  });

  it('draws the first frame after a restart at once, under the cap', () => {
    const h = loopHarness();
    h.loop.setMaxFps(30);
    h.loop.setState('running');
    h.tick(1000);
    h.loop.setState('paused');
    h.loop.setState('running');
    h.tick(1005);
    expect(h.draws()).toBe(2);
  });
});

// ---- the renderer says whether it renders in software ----

const DEBUG_RENDERER = 0x9246;

function fakeGL(renderer: string) {
  const constants = Object.fromEntries(
    (
      'VERTEX_SHADER FRAGMENT_SHADER COMPILE_STATUS LINK_STATUS ACTIVE_UNIFORMS ARRAY_BUFFER STATIC_DRAW FLOAT ' +
      'TEXTURE_2D TEXTURE_MIN_FILTER TEXTURE_MAG_FILTER LINEAR TEXTURE_WRAP_S TEXTURE_WRAP_T CLAMP_TO_EDGE RGBA16F ' +
      'RGBA HALF_FLOAT FRAMEBUFFER COLOR_ATTACHMENT0 FRAMEBUFFER_COMPLETE COLOR_BUFFER_BIT TEXTURE0 TRIANGLE_STRIP'
    )
      .split(' ')
      .map((s, i) => [s, i + 1]),
  );
  const methods = Object.fromEntries(
    (
      'shaderSource compileShader attachShader bindAttribLocation linkProgram detachShader bindBuffer bufferData ' +
      'enableVertexAttribArray vertexAttribPointer bindTexture texParameteri texImage2D bindFramebuffer ' +
      'framebufferTexture2D viewport clearColor clear useProgram uniform3fv uniform1i uniform1f uniform2f ' +
      'uniform2fv activeTexture drawArrays deleteShader deleteProgram deleteBuffer deleteTexture deleteFramebuffer'
    )
      .split(' ')
      .map((s) => [s, jest.fn()]),
  );
  return {
    ...constants,
    ...methods,
    createShader: (type: number) => ({ type }),
    getShaderParameter: () => true,
    getShaderInfoLog: () => '',
    getProgramInfoLog: () => '',
    createProgram: () => ({}),
    getProgramParameter: (_p: unknown, key: number) => (key === constants.ACTIVE_UNIFORMS ? 0 : true),
    createBuffer: () => ({}),
    createTexture: () => ({}),
    createFramebuffer: () => ({}),
    checkFramebufferStatus: () => constants.FRAMEBUFFER_COMPLETE,
    isContextLost: () => false,
    getParameter: (key: number) => (key === DEBUG_RENDERER ? renderer : null),
    getExtension: (name: string) =>
      name === 'WEBGL_lose_context' ? null : name === 'WEBGL_debug_renderer_info' ? { UNMASKED_RENDERER_WEBGL: DEBUG_RENDERER } : {},
  } as unknown as WebGL2RenderingContext;
}

describe('the renderer reports a software renderer', () => {
  const canvasFor = (gl: WebGL2RenderingContext) =>
    ({ width: 400, height: 800, getContext: () => gl }) as unknown as HTMLCanvasElement;
  const silver = () => auroraPalette(getTheme('silver'))!;
  // Required lazily so the controller tests below can mock the renderer module.
  const real = () => jest.requireActual<typeof import('../renderer.web')>('../renderer.web');

  it.each([
    ['ANGLE (Google, Vulkan 1.3.0 (SwiftShader Device (Subzero) (0x0000C0DE)), SwiftShader driver)', true],
    ['llvmpipe (LLVM 15.0.7, 256 bits)', true],
    ['ANGLE (Intel, Intel(R) UHD Graphics Direct3D11 vs_5_0 ps_5_0, D3D11)', false],
  ])('%s → software %s', (name, software) => {
    for (const style of ['fluid', 'flow'] as const) {
      const r = real().createAuroraRenderer(canvasFor(fakeGL(name)), style, silver())!;
      expect(r.software).toBe(software);
      r.dispose();
    }
  });
});

// ---- the controller caps a software renderer at 30 fps ----

const mockRenderer = { software: false, draws: 0 };

jest.mock('../renderer.web', () => ({
  createAuroraRenderer: () => ({
    get style() {
      return mockRenderer.software ? 'flow' : 'fluid';
    },
    get software() {
      return mockRenderer.software;
    },
    step() {},
    draw: () => {
      mockRenderer.draws++;
      return true;
    },
    setStyle() {},
    setPalette() {},
    resize() {},
    pointer() {},
    contextLost() {},
    restore: () => true,
    dispose() {},
  }),
}));

// eslint-disable-next-line import/first
import { createAuroraController } from '../controller.web';

class ElementStub {
  style: Record<string, string> = {};
  width = 0;
  height = 0;
  attrs = new Map<string, string>();
  getBoundingClientRect() {
    return { left: 0, top: 0, width: 400, height: 800 };
  }
  setAttribute(k: string, v: string) {
    this.attrs.set(k, v);
  }
  removeAttribute(k: string) {
    this.attrs.delete(k);
  }
  appendChild() {}
  remove() {}
  addEventListener() {}
  removeEventListener() {}
}

const inputs: AuroraInputs = {
  style: 'fluid',
  palette: { base: [0, 0, 0], colours: [[1, 0, 0], [0, 1, 0], [0, 0, 1]] },
  focused: true,
  visible: true,
  reduceMotion: false,
};

/** Runs a controller with `software`, ticks a 60 Hz display for one second, and returns the draws. */
function controllerDraws(software: boolean, first: AuroraInputs = inputs): { draws: number; state: string | undefined } {
  mockRenderer.software = software;
  mockRenderer.draws = 0;
  const canvas = new ElementStub();
  let rafs = new Map<number, (t: number) => void>();
  let next = 1;
  const globals: Record<string, unknown> = {
    window: { devicePixelRatio: 1 },
    document: { createElement: () => canvas },
    requestAnimationFrame: (cb: (t: number) => void) => {
      const id = next++;
      rafs.set(id, cb);
      return id;
    },
    cancelAnimationFrame: (id: number) => void rafs.delete(id),
    ResizeObserver: undefined,
  };
  const saved = Object.keys(globals).map((key) => [key, Object.getOwnPropertyDescriptor(globalThis, key)] as const);
  for (const [key, value] of Object.entries(globals)) {
    Object.defineProperty(globalThis, key, { configurable: true, writable: true, value });
  }
  try {
    const c = createAuroraController(new ElementStub() as unknown as HTMLElement, null, first);
    for (let i = 0; i < 60; i++) {
      const cbs = [...rafs.values()];
      rafs = new Map();
      cbs.forEach((cb) => cb(1000 + (i * 1000) / 60));
    }
    const state = canvas.attrs.get('data-aurora-state');
    c.destroy();
    return { draws: mockRenderer.draws, state };
  } finally {
    for (const [key, descriptor] of saved) {
      if (descriptor) Object.defineProperty(globalThis, key, descriptor);
      else Reflect.deleteProperty(globalThis, key);
    }
  }
}

describe('the controller', () => {
  it('keeps a software renderer animating, at about 30 fps', () => {
    const { draws, state } = controllerDraws(true);
    expect(state).toBe('running');
    expect(draws).toBeGreaterThanOrEqual(28);
    expect(draws).toBeLessThanOrEqual(31);
  });

  it('runs a GPU renderer at 60 fps', () => {
    const { draws, state } = controllerDraws(false);
    expect(state).toBe('running');
    expect(draws).toBe(60);
  });

  it('draws one still frame under Reduce Motion on a software renderer', () => {
    const { draws, state } = controllerDraws(true, { ...inputs, reduceMotion: true });
    expect(state).toBe('still');
    expect(draws).toBe(1);
  });
});
