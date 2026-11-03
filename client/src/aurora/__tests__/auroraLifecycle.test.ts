// R7a-aurora-fix2 (implementer's own tests): GL object ownership and context loss, path by path.
// A fake WebGL2 context tracks every object it makes (per context generation: a restore starts a new
// one), and records misuse: GL work after the code has seen the context is lost, deleting an object
// from a dead context, deleting twice. Each path is driven exhaustively: the context is lost after
// every call, every `create*` returns null in turn, and every call throws in turn.
import { createAuroraController } from '../controller.web';
import { createFlow } from '../flow.web';
import { createFluid } from '../fluid.web';
import { createProgram, createQuad } from '../gl.web';
import { auroraPalette } from '../palette';
import { createAuroraRenderer, type WebAuroraRenderer } from '../renderer.web';
import { getTheme } from '../../theme/presets';

const CONSTANTS =
  'VERTEX_SHADER FRAGMENT_SHADER COMPILE_STATUS LINK_STATUS ACTIVE_UNIFORMS ARRAY_BUFFER STATIC_DRAW FLOAT ' +
  'TEXTURE_2D TEXTURE_MIN_FILTER TEXTURE_MAG_FILTER LINEAR TEXTURE_WRAP_S TEXTURE_WRAP_T CLAMP_TO_EDGE RGBA16F ' +
  'RGBA HALF_FLOAT FRAMEBUFFER COLOR_ATTACHMENT0 FRAMEBUFFER_COMPLETE COLOR_BUFFER_BIT TEXTURE0 TRIANGLE_STRIP';
const NOOPS =
  'shaderSource compileShader attachShader bindAttribLocation linkProgram detachShader bindBuffer bufferData ' +
  'enableVertexAttribArray vertexAttribPointer bindTexture texParameteri texImage2D framebufferTexture2D viewport ' +
  'clearColor clear useProgram uniform3fv uniform1i uniform1f uniform2f uniform2fv activeTexture';
const KINDS = ['Shader', 'Program', 'Buffer', 'Texture', 'Framebuffer'] as const;
/** What code may still call once it has seen the context is lost. */
const AFTER_LOSS = /^(getExtension|delete[A-Z]\w*)$/;

interface Obj {
  kind: string;
  gen: number;
  id: number;
}

function fakeGL() {
  const c = Object.fromEntries(CONSTANTS.split(' ').map((k, i) => [k, i + 1])) as Record<string, number>;
  const s = {
    lost: false,
    /** `isContextLost()` returned true since the loss. */
    seen: false,
    gen: 0,
    calls: 0,
    creates: 0,
    loseAfter: Infinity,
    throwAt: Infinity,
    nullAt: new Set<number>(),
    compile: true,
    link: true,
    complete: true,
    screenDraws: 0,
  };
  const live = new Set<Obj>();
  const violations: string[] = [];
  let boundFb: unknown = null;
  let serial = 0;
  const loseExt = { loseContext: jest.fn(() => void (s.lost = true)) };
  const gl: Record<string, unknown> = { ...c };
  const wrap = (name: string, body: (...args: unknown[]) => unknown) => {
    gl[name] = jest.fn((...args: unknown[]) => {
      if (s.lost && s.seen && !AFTER_LOSS.test(name)) violations.push(`${name} after the loss was seen`);
      s.calls++;
      // WebGL's delete* never throw (cleanup that throws could not be cleaned up after), so they are spared.
      if (s.calls === s.throwAt && !name.startsWith('delete')) throw new Error(`forced ${name} failure`);
      const out = body(...args);
      if (s.calls === s.loseAfter) s.lost = true;
      return out;
    });
  };
  for (const name of NOOPS.split(' ')) wrap(name, () => undefined);
  wrap('bindFramebuffer', (_t, fb) => void (boundFb = fb));
  wrap('drawArrays', () => {
    if (boundFb === null && !s.lost) s.screenDraws++;
  });
  for (const kind of KINDS) {
    wrap(`create${kind}`, () => {
      s.creates++;
      if (s.lost || s.nullAt.has(s.creates)) return null;
      const o: Obj = { kind, gen: s.gen, id: serial++ };
      live.add(o);
      return o;
    });
    wrap(`delete${kind}`, (o) => {
      if (!o) return;
      const obj = o as Obj;
      if (obj.gen !== s.gen) {
        if (!s.lost) violations.push(`deleted a ${obj.kind} from a lost context`);
        return;
      }
      if (!live.delete(obj) && !s.lost) violations.push(`deleted a ${obj.kind} twice`);
    });
  }
  wrap('getShaderParameter', () => (s.lost ? null : s.compile));
  wrap('getShaderInfoLog', () => (s.lost ? null : 'forced compile failure'));
  wrap('getProgramParameter', (_p, key) => (s.lost ? null : key === c.ACTIVE_UNIFORMS ? 0 : s.link));
  wrap('getProgramInfoLog', () => (s.lost ? null : 'forced link failure'));
  wrap('getActiveUniform', () => null);
  wrap('getUniformLocation', () => null);
  wrap('checkFramebufferStatus', () => (s.lost ? 0 : s.complete ? c.FRAMEBUFFER_COMPLETE : 0));
  wrap('getParameter', () => (s.lost ? null : 'Hardware GPU'));
  wrap('getExtension', (name) =>
    s.lost
      ? null
      : name === 'WEBGL_lose_context'
        ? loseExt
        : name === 'WEBGL_debug_renderer_info'
          ? { UNMASKED_RENDERER_WEBGL: 0x9246 }
          : {},
  );
  gl.isContextLost = () => {
    if (s.lost) s.seen = true;
    return s.lost;
  };
  return {
    gl: gl as unknown as WebGL2RenderingContext,
    s,
    loseExt,
    violations,
    /** Objects of the current context that were made and never deleted. */
    leaks: () => [...live].filter((o) => o.gen === s.gen),
    /** The browser restores the context: a fresh one, where the old objects no longer exist. */
    restore() {
      s.lost = false;
      s.seen = false;
      s.gen++;
      s.loseAfter = Infinity;
    },
  };
}
type Fake = ReturnType<typeof fakeGL>;

const palette = () => auroraPalette(getTheme('silver'))!;
const canvasFor = (gl: WebGL2RenderingContext) =>
  ({ width: 400, height: 800, getContext: () => gl }) as unknown as HTMLCanvasElement;
const range = (n: number) => Array.from({ length: n }, (_, i) => i + 1);

/** How many GL calls and object creations `phase` makes on a healthy context, after `setup`. */
function measure<T>(setup: (f: Fake) => T, phase: (f: Fake, t: T) => void) {
  const f = fakeGL();
  const t = setup(f);
  const calls = f.s.calls;
  const creates = f.s.creates;
  phase(f, t);
  return { calls: f.s.calls - calls, creates: f.s.creates - creates };
}

/** Nothing of the current context is left once `r` is disposed, and the context was never misused. */
function expectClean(f: Fake, r: WebAuroraRenderer | null) {
  r?.dispose();
  expect(f.leaks()).toEqual([]);
  expect(f.violations).toEqual([]);
}

/** With nothing running on a live context, no GL object is held either. */
function expectNothingHeldIfOff(f: Fake, r: WebAuroraRenderer) {
  if (r.style === null && !f.s.lost) expect(f.leaks()).toEqual([]);
}

/** The context is lost and seen as lost: no frame reaches the screen. */
function expectNoDrawWhileLost(f: Fake, r: WebAuroraRenderer) {
  const before = f.s.screenDraws;
  r.step(1 / 60);
  expect(r.draw()).toBe(false);
  expect(f.s.screenDraws).toBe(before);
  expect(r.style).toBeNull();
}

/** Restores the context and expects the wanted style back, drawing. */
function expectRestores(f: Fake, r: WebAuroraRenderer, style: 'fluid' | 'flow' = 'fluid') {
  f.restore();
  expect(r.restore()).toBe(true);
  expect(r.style).toBe(style);
  const before = f.s.screenDraws;
  r.step(1 / 60);
  expect(r.draw()).toBe(true);
  expect(f.s.screenDraws).toBe(before + 1);
}

// ---------------------------------------------------------------------------------------------
describe('createProgram', () => {
  const fs = 'void main(){}';
  const total = measure(() => null, (f) => createProgram(f.gl, fs));

  const run = (f: Fake) => {
    try {
      const p = createProgram(f.gl, fs);
      f.gl.deleteProgram(p.program); // the caller owns what it returns
    } catch {
      // nothing it made may remain
    }
    expect(f.leaks()).toEqual([]);
    expect(f.violations).toEqual([]);
  };

  it.each(range(total.creates))('leaves nothing when create #%i returns null', (k) => {
    const f = fakeGL();
    f.s.nullAt.add(k);
    expect(() => createProgram(f.gl, fs)).toThrow();
    run(f);
  });

  it.each(range(total.calls))('leaves nothing when call #%i throws', (n) => {
    const f = fakeGL();
    f.s.throwAt = n;
    run(f);
  });

  it.each(range(total.calls))('leaves nothing when the context is lost after call #%i', (n) => {
    const f = fakeGL();
    f.s.loseAfter = n;
    run(f);
  });

  it('leaves nothing when a compile or the link fails', () => {
    for (const key of ['compile', 'link'] as const) {
      const f = fakeGL();
      f.s[key] = false;
      expect(() => createProgram(f.gl, fs)).toThrow(`forced ${key} failure`);
      run(f);
    }
  });
});

describe('createQuad', () => {
  const total = measure(() => null, (f) => createQuad(f.gl));
  it.each(range(total.calls))('deletes its buffer when call #%i throws', (n) => {
    const f = fakeGL();
    f.s.throwAt = n;
    try {
      f.gl.deleteBuffer(createQuad(f.gl));
    } catch {
      // the buffer must be gone
    }
    expect(f.leaks()).toEqual([]);
  });
});

describe('createFlow', () => {
  const total = measure(() => null, (f) => createFlow(f.gl, palette(), 400, 800));
  const run = (f: Fake) => {
    try {
      createFlow(f.gl, palette(), 400, 800).release();
    } catch {
      // nothing it made may remain
    }
    expect(f.leaks()).toEqual([]);
    expect(f.violations).toEqual([]);
  };
  it.each(range(total.calls))('leaves nothing when call #%i throws', (n) => {
    const f = fakeGL();
    f.s.throwAt = n;
    run(f);
  });
  it.each(range(total.creates))('leaves nothing when create #%i returns null', (k) => {
    const f = fakeGL();
    f.s.nullAt.add(k);
    run(f);
  });
  it('releases once, however often it is asked', () => {
    const f = fakeGL();
    const flow = createFlow(f.gl, palette(), 400, 800);
    flow.release();
    flow.release();
    expectClean(f, null);
  });
});

describe('createFluid', () => {
  const total = measure(() => null, (f) => createFluid(f.gl, palette(), 400, 800));
  const run = (f: Fake) => {
    let fluid: ReturnType<typeof createFluid> = null;
    expect(() => (fluid = createFluid(f.gl, palette(), 400, 800))).not.toThrow();
    if (fluid === null) expect(f.leaks()).toEqual([]);
    (fluid as ReturnType<typeof createFluid>)?.release();
    expect(f.leaks()).toEqual([]);
    expect(f.violations).toEqual([]);
  };
  it.each(range(total.creates))('leaves nothing when create #%i returns null (a partial target too)', (k) => {
    const f = fakeGL();
    f.s.nullAt.add(k);
    run(f);
  });
  it.each(range(total.calls))('never throws and leaves nothing when call #%i throws', (n) => {
    const f = fakeGL();
    f.s.throwAt = n;
    run(f);
  });
  it('leaves nothing when a framebuffer is incomplete', () => {
    const f = fakeGL();
    f.s.complete = false;
    expect(createFluid(f.gl, palette(), 400, 800)).toBeNull();
    expect(f.leaks()).toEqual([]);
  });
  it('releases once, however often it is asked, and no longer draws', () => {
    const f = fakeGL();
    const fluid = createFluid(f.gl, palette(), 400, 800)!;
    fluid.release();
    fluid.release();
    const calls = f.s.calls;
    fluid.step(1 / 60);
    fluid.draw();
    expect(f.s.calls).toBe(calls);
    expectClean(f, null);
  });
});

// ---------------------------------------------------------------------------------------------
describe('renderer creation', () => {
  const total = measure(() => null, (f) => createAuroraRenderer(canvasFor(f.gl), 'fluid', palette()));

  it.each(range(total.creates))('create #%i returning null: falls back, never leaks', (k) => {
    const f = fakeGL();
    f.s.nullAt.add(k);
    const r = createAuroraRenderer(canvasFor(f.gl), 'fluid', palette())!;
    expect(r).not.toBeNull();
    expectNothingHeldIfOff(f, r);
    if (r.style !== null) expect(r.draw()).toBe(true);
    expectClean(f, r);
  });

  it.each(range(total.calls))('call #%i throwing: never throws, never leaks', (n) => {
    const f = fakeGL();
    f.s.throwAt = n;
    let r: WebAuroraRenderer | null = null;
    expect(() => (r = createAuroraRenderer(canvasFor(f.gl), 'fluid', palette()))).not.toThrow();
    expect(r).not.toBeNull();
    expectNothingHeldIfOff(f, r!);
    expectClean(f, r);
  });

  it.each(range(total.calls))('lost after call #%i: draws nothing, then restores to fluid', (n) => {
    const f = fakeGL();
    f.s.loseAfter = n;
    let r: WebAuroraRenderer | null = null;
    expect(() => (r = createAuroraRenderer(canvasFor(f.gl), 'fluid', palette()))).not.toThrow();
    expect(r).not.toBeNull();
    expectNoDrawWhileLost(f, r!);
    r!.contextLost();
    expectRestores(f, r!);
    expectClean(f, r);
  });

  it('comes back with no style on a context lost before it starts, and restores', () => {
    const f = fakeGL();
    f.s.lost = true;
    const r = createAuroraRenderer(canvasFor(f.gl), 'fluid', palette())!;
    expect(r.style).toBeNull();
    expectRestores(f, r);
    expectClean(f, r);
  });

  it('holds nothing when no style compiles, and releases the context on dispose', () => {
    const f = fakeGL();
    f.s.compile = false;
    const r = createAuroraRenderer(canvasFor(f.gl), 'fluid', palette())!;
    expect(r.style).toBeNull();
    expect(r.draw()).toBe(false);
    expect(f.leaks()).toEqual([]);
    expectClean(f, r);
    expect(f.loseExt.loseContext).toHaveBeenCalledTimes(1);
  });
});

describe('renderer resize', () => {
  const setup = (f: Fake) => createAuroraRenderer(canvasFor(f.gl), 'fluid', palette())!;
  const total = measure(setup, (_f, r) => r.resize(800, 1600));

  it.each(range(total.calls))('lost after call #%i: draws nothing, then restores to fluid', (n) => {
    const f = fakeGL();
    const r = setup(f);
    f.s.loseAfter = f.s.calls + n;
    expect(() => r.resize(800, 1600)).not.toThrow();
    expectNoDrawWhileLost(f, r);
    r.contextLost();
    expectRestores(f, r);
    expectClean(f, r);
  });

  it.each(range(total.creates))('create #%i returning null: falls back to flow, never leaks', (k) => {
    const f = fakeGL();
    const r = setup(f);
    f.s.nullAt.add(f.s.creates + k);
    r.resize(800, 1600);
    expect(r.style).toBe('flow');
    expect(r.draw()).toBe(true);
    expectClean(f, r);
  });

  it('holds nothing when neither fluid nor flow can be rebuilt, and can build again', () => {
    const f = fakeGL();
    const r = setup(f);
    f.s.complete = false;
    f.s.compile = false;
    r.resize(800, 1600);
    expect(r.style).toBeNull();
    expect(f.leaks()).toEqual([]);
    expect(r.draw()).toBe(false);
    f.s.compile = true;
    r.setStyle('flow');
    expect(r.style).toBe('flow');
    expect(r.draw()).toBe(true);
    expectClean(f, r);
  });
});

describe('renderer step and draw', () => {
  const setup = (f: Fake) => createAuroraRenderer(canvasFor(f.gl), 'fluid', palette())!;
  const total = measure(setup, (_f, r) => {
    r.step(1 / 60);
    r.draw();
  });

  it.each(range(total.calls))('lost after call #%i: never draws once the loss is seen, then restores', (n) => {
    const f = fakeGL();
    const r = setup(f);
    f.s.loseAfter = f.s.calls + n;
    expect(() => {
      r.step(1 / 60);
      r.draw();
    }).not.toThrow();
    expectNoDrawWhileLost(f, r);
    r.contextLost();
    expectRestores(f, r);
    expectClean(f, r);
  });

  it('a palette change or a stir on a lost context touches nothing', () => {
    const f = fakeGL();
    const r = setup(f);
    f.s.lost = true;
    r.contextLost();
    const calls = f.s.calls;
    r.setPalette(auroraPalette(getTheme('deep-blue'))!);
    r.pointer('down', 1, 0.5, 0.5);
    r.resize(800, 1600);
    expect(f.s.calls).toBe(calls);
    expectRestores(f, r);
    expectClean(f, r);
  });
});

describe('renderer setStyle', () => {
  const setup = (f: Fake) => createAuroraRenderer(canvasFor(f.gl), 'flow', palette())!;
  const total = measure(setup, (_f, r) => r.setStyle('fluid'));

  it.each(range(total.calls))('lost after call #%i: the restore builds the wanted style', (n) => {
    const f = fakeGL();
    const r = setup(f);
    f.s.loseAfter = f.s.calls + n;
    expect(() => r.setStyle('fluid')).not.toThrow();
    expectNoDrawWhileLost(f, r);
    r.contextLost();
    expectRestores(f, r, 'fluid');
    expectClean(f, r);
  });

  it.each(range(total.creates))('create #%i returning null: never leaks', (k) => {
    const f = fakeGL();
    const r = setup(f);
    f.s.nullAt.add(f.s.creates + k);
    r.setStyle('fluid');
    expectNothingHeldIfOff(f, r);
    expectClean(f, r);
  });

  it('switching while lost builds nothing until the restore', () => {
    const f = fakeGL();
    const r = setup(f);
    f.s.lost = true;
    r.contextLost();
    const creates = f.s.creates;
    r.setStyle('fluid');
    expect(f.s.creates).toBe(creates);
    expectRestores(f, r, 'fluid');
    expectClean(f, r);
  });
});

describe('renderer restore', () => {
  const setup = (f: Fake) => {
    const r = createAuroraRenderer(canvasFor(f.gl), 'fluid', palette())!;
    f.s.lost = true;
    r.contextLost();
    f.restore();
    return r;
  };
  const total = measure(setup, (_f, r) => r.restore());

  it.each(range(total.calls))('lost again after call #%i: fails, then the next restore works', (n) => {
    const f = fakeGL();
    const r = setup(f);
    f.s.loseAfter = f.s.calls + n;
    expect(r.restore()).toBe(false);
    expectNoDrawWhileLost(f, r);
    r.contextLost();
    expectRestores(f, r);
    expectClean(f, r);
  });

  it.each(range(total.creates))('create #%i returning null: falls back, never leaks', (k) => {
    const f = fakeGL();
    const r = setup(f);
    f.s.nullAt.add(f.s.creates + k);
    r.restore();
    expectNothingHeldIfOff(f, r);
    expectClean(f, r);
  });

  it('fails while the context is still lost, without touching it', () => {
    const f = fakeGL();
    const r = createAuroraRenderer(canvasFor(f.gl), 'fluid', palette())!;
    f.s.lost = true;
    r.contextLost();
    const calls = f.s.calls;
    expect(r.restore()).toBe(false);
    expect(f.s.calls).toBe(calls);
    expectRestores(f, r);
    expectClean(f, r);
  });

  it('rebuilding a live renderer releases what it had first', () => {
    const f = fakeGL();
    const r = createAuroraRenderer(canvasFor(f.gl), 'fluid', palette())!;
    expect(r.restore()).toBe(true);
    expect(r.style).toBe('fluid');
    expectClean(f, r);
  });
});

describe('renderer dispose', () => {
  it('on a lost context deletes nothing (the objects died with it)', () => {
    const f = fakeGL();
    const r = createAuroraRenderer(canvasFor(f.gl), 'fluid', palette())!;
    f.s.lost = true;
    r.dispose();
    expect(f.violations).toEqual([]);
    expect(r.style).toBeNull();
  });

  it('after the context came back, never deletes the dead objects', () => {
    const f = fakeGL();
    const r = createAuroraRenderer(canvasFor(f.gl), 'fluid', palette())!;
    f.s.lost = true;
    r.contextLost();
    f.restore(); // restored, but the restore event has not run yet
    r.dispose();
    expect(f.violations).toEqual([]);
  });
});

// ---------------------------------------------------------------------------------------------
// The controller, on a stub DOM.

class ElementStub {
  width = 0;
  height = 0;
  rect = { width: 400, height: 800, left: 0, top: 0 };
  style: Record<string, string> = {};
  attrs = new Map<string, string>();
  listeners = new Map<string, EventListener>();
  getContextThrows = false;
  constructor(readonly gl: WebGL2RenderingContext) {}
  getContext() {
    if (this.getContextThrows) {
      this.getContextThrows = false;
      throw new Error('forced getContext failure');
    }
    return this.gl;
  }
  getBoundingClientRect() {
    return this.rect;
  }
  setAttribute(k: string, v: string) {
    this.attrs.set(k, v);
  }
  removeAttribute(k: string) {
    this.attrs.delete(k);
  }
  appendChild() {}
  addEventListener(k: string, cb: EventListener) {
    this.listeners.set(k, cb);
  }
  removeEventListener(k: string) {
    this.listeners.delete(k);
  }
  remove() {}
  emit(k: string) {
    this.listeners.get(k)?.({ preventDefault() {} } as Event);
  }
}

interface Dom {
  f: Fake;
  canvas: ElementStub;
  host: ElementStub;
  frames: ((t: number) => void)[];
  resize(): void;
  /** Runs the pending animation frame. */
  frame(t: number): void;
  state(): string | undefined;
}

const inputs = (over: Partial<Parameters<typeof createAuroraController>[2]> = {}) => ({
  style: 'fluid' as const,
  palette: palette(),
  focused: true,
  visible: true,
  reduceMotion: false,
  ...over,
});

function withDom(run: (dom: Dom) => void, prepare?: (dom: Dom) => void) {
  const f = fakeGL();
  const canvas = new ElementStub(f.gl);
  const host = new ElementStub(f.gl);
  const frames: ((t: number) => void)[] = [];
  let observed: (() => void) | null = null;
  const dom: Dom = {
    f,
    canvas,
    host,
    frames,
    resize: () => observed?.(),
    frame(t) {
      const cb = frames.shift();
      expect(cb).toBeDefined();
      cb!(t);
    },
    state: () => canvas.attrs.get('data-aurora-state'),
  };
  prepare?.(dom);
  const globals: Record<string, unknown> = {
    window: { devicePixelRatio: 1 },
    document: { createElement: () => canvas },
    requestAnimationFrame: (cb: (t: number) => void) => frames.push(cb),
    cancelAnimationFrame: () => void frames.splice(0),
    ResizeObserver: class {
      constructor(cb: () => void) {
        observed = cb;
      }
      observe() {}
      disconnect() {}
    },
  };
  const saved = Object.keys(globals).map((key) => [key, Object.getOwnPropertyDescriptor(globalThis, key)] as const);
  for (const [key, value] of Object.entries(globals)) {
    Object.defineProperty(globalThis, key, { configurable: true, writable: true, value });
  }
  try {
    run(dom);
  } finally {
    for (const [key, descriptor] of saved) {
      if (descriptor) Object.defineProperty(globalThis, key, descriptor);
      else Reflect.deleteProperty(globalThis, key);
    }
  }
}

/** The browser's loss and restore events, then the aurora must be back in `state`. */
function loseAndRestore(dom: Dom, state = 'running') {
  dom.canvas.emit('webglcontextlost');
  expect(dom.state()).toBe('off');
  dom.f.restore();
  dom.canvas.emit('webglcontextrestored');
  expect(dom.state()).toBe(state);
  expect(dom.canvas.attrs.get('data-aurora-style')).toBe('fluid');
}

describe('controller', () => {
  const createCalls = measure(
    () => null,
    (f) => createAuroraRenderer(canvasFor(f.gl), 'fluid', palette()),
  ).calls;

  it.each(range(createCalls))('lost after call #%i while creating: off, then restores and runs', (n) => {
    withDom(
      (dom) => {
        const c = createAuroraController(dom.host as unknown as HTMLElement, null, inputs());
        expect(dom.state()).toBe('off');
        loseAndRestore(dom);
        const draws = dom.f.s.screenDraws;
        dom.frame(16);
        expect(dom.f.s.screenDraws).toBe(draws + 1);
        c.destroy();
        expect(dom.f.leaks()).toEqual([]);
        expect(dom.f.violations).toEqual([]);
      },
      (dom) => (dom.f.s.loseAfter = n),
    );
  });

  it('with no renderer from creation, the restore creates one', () => {
    withDom(
      (dom) => {
        const c = createAuroraController(dom.host as unknown as HTMLElement, null, inputs());
        expect(dom.state()).toBe('off');
        dom.canvas.emit('webglcontextrestored');
        expect(dom.state()).toBe('running');
        expect(dom.canvas.attrs.get('data-aurora-style')).toBe('fluid');
        c.destroy();
        expect(dom.f.leaks()).toEqual([]);
      },
      (dom) => (dom.canvas.getContextThrows = true),
    );
  });

  it('with nothing that compiles: off, no style, and the context released on destroy', () => {
    withDom(
      (dom) => {
        const c = createAuroraController(dom.host as unknown as HTMLElement, null, inputs());
        expect(dom.state()).toBe('off');
        expect(dom.canvas.attrs.has('data-aurora-style')).toBe(false);
        c.destroy();
        expect(dom.f.leaks()).toEqual([]);
        expect(dom.f.loseExt.loseContext).toHaveBeenCalledTimes(1);
      },
      (dom) => (dom.f.s.compile = false),
    );
  });

  const resizeCalls = (() => {
    let calls = 0;
    withDom((dom) => {
      createAuroraController(dom.host as unknown as HTMLElement, null, inputs());
      const start = dom.f.s.calls;
      dom.host.rect = { ...dom.host.rect, width: 600, height: 900 };
      dom.resize();
      calls = dom.f.s.calls - start;
    });
    return calls;
  })();

  it.each(range(resizeCalls))('lost after call #%i of a resize: off, never throws, then restores', (n) => {
    withDom((dom) => {
      const c = createAuroraController(dom.host as unknown as HTMLElement, null, inputs());
      expect(dom.state()).toBe('running');
      dom.f.s.loseAfter = dom.f.s.calls + n;
      dom.host.rect = { ...dom.host.rect, width: 600, height: 900 };
      expect(() => dom.resize()).not.toThrow();
      // Once the renderer has seen the loss, the aurora is off and hidden at once (a loss during the
      // redraw that ends the resize is only seen at the next check, or by the loss event).
      if (dom.f.s.seen) {
        expect(dom.state()).toBe('off');
        expect(dom.canvas.style.visibility).toBe('hidden');
      }
      loseAndRestore(dom);
      c.destroy();
      expect(dom.f.leaks()).toEqual([]);
      expect(dom.f.violations).toEqual([]);
    });
  });

  const frameCalls = (() => {
    let calls = 0;
    withDom((dom) => {
      createAuroraController(dom.host as unknown as HTMLElement, null, inputs());
      const start = dom.f.s.calls;
      dom.frame(16);
      calls = dom.f.s.calls - start;
    });
    return calls;
  })();

  it.each(range(frameCalls))('lost after call #%i of a frame: no draw once seen, then restores', (n) => {
    withDom((dom) => {
      const c = createAuroraController(dom.host as unknown as HTMLElement, null, inputs());
      dom.f.s.loseAfter = dom.f.s.calls + n;
      expect(() => dom.frame(16)).not.toThrow();
      // Until the loss event arrives, frames keep coming and draw nothing.
      const draws = dom.f.s.screenDraws;
      if (dom.frames.length) dom.frame(32);
      expect(dom.f.s.screenDraws).toBe(draws);
      loseAndRestore(dom);
      c.destroy();
      expect(dom.f.leaks()).toEqual([]);
      expect(dom.f.violations).toEqual([]);
    });
  });

  const stillCalls = (() => {
    let calls = 0;
    withDom((dom) => {
      const c = createAuroraController(dom.host as unknown as HTMLElement, null, inputs({ reduceMotion: true }));
      const start = dom.f.s.calls;
      c.update(inputs({ reduceMotion: true, palette: auroraPalette(getTheme('deep-blue'))! }));
      calls = dom.f.s.calls - start;
    });
    return calls;
  })();

  it.each(range(stillCalls))('lost after call #%i of a still frame: never throws, then restores still', (n) => {
    withDom((dom) => {
      const c = createAuroraController(dom.host as unknown as HTMLElement, null, inputs({ reduceMotion: true }));
      expect(dom.state()).toBe('still');
      dom.f.s.loseAfter = dom.f.s.calls + n;
      expect(() =>
        c.update(inputs({ reduceMotion: true, palette: auroraPalette(getTheme('deep-blue'))! })),
      ).not.toThrow();
      loseAndRestore(dom, 'still');
      c.destroy();
      expect(dom.f.leaks()).toEqual([]);
      expect(dom.f.violations).toEqual([]);
    });
  });

  it('a style switch during the loss is built by the restore', () => {
    withDom((dom) => {
      const c = createAuroraController(dom.host as unknown as HTMLElement, null, inputs());
      dom.f.s.lost = true;
      dom.canvas.emit('webglcontextlost');
      c.update(inputs({ style: 'flow' }));
      expect(dom.state()).toBe('off');
      dom.f.restore();
      dom.canvas.emit('webglcontextrestored');
      expect(dom.state()).toBe('running');
      expect(dom.canvas.attrs.get('data-aurora-style')).toBe('flow');
      c.destroy();
      expect(dom.f.leaks()).toEqual([]);
      expect(dom.f.violations).toEqual([]);
    });
  });
});
