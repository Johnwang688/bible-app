// R7a-ui-option-fix2: a gesture belongs to one uninterrupted stirrable stretch. Every way the aurora stops
// being stirrable (hidden, unfocused, Reduce Motion, fluid to flow, a resize fallback, context loss, a renderer
// that found its context lost on its own, destroy) forgets every tracked pointer; one that was stirring gets its
// 'up' if the renderer can still take it. A forgotten pointer never stirs again; a new pointerdown does.
// Same fixture pattern as auroraStirReview.test.ts.
import type { AuroraInputs } from '../controller.web';

const mockPointer = jest.fn();
/** The mock renderer's style; tests change it to stand for setStyle, a resize fallback or a lost context. */
const mockRenderer = { style: 'fluid' as 'fluid' | 'flow' | null, resizeFallsBack: false };

jest.mock('../renderer.web', () => ({
  createAuroraRenderer: () => ({
    get style() {
      return mockRenderer.style;
    },
    step() {},
    draw: () => true,
    setStyle(s: 'fluid' | 'flow') {
      mockRenderer.style = s;
    },
    setPalette() {},
    resize() {
      if (mockRenderer.resizeFallsBack) mockRenderer.style = 'flow';
    },
    pointer: (...args: unknown[]) => mockPointer(...args),
    contextLost() {
      mockRenderer.style = null;
    },
    restore() {
      mockRenderer.style = 'fluid';
      return true;
    },
    dispose() {},
  }),
}));

// eslint-disable-next-line import/first
import { createAuroraController } from '../controller.web';

class ElementStub {
  style: Record<string, string> = {};
  width = 0;
  height = 0;
  rect = { left: 0, top: 0, width: 400, height: 800 };
  listeners = new Map<string, EventListener>();

  getBoundingClientRect() {
    return this.rect;
  }
  setAttribute() {}
  removeAttribute() {}
  appendChild() {}
  remove() {}
  addEventListener(name: string, listener: EventListener) {
    this.listeners.set(name, listener);
  }
  removeEventListener(name: string) {
    this.listeners.delete(name);
  }
  fire(name: string, x: number, y: number, pointerId = 1) {
    this.listeners.get(name)?.({ pointerId, clientX: x, clientY: y } as unknown as Event);
  }
  fireGl(name: string) {
    this.listeners.get(name)?.({ preventDefault() {} } as unknown as Event);
  }
}

const inputs: AuroraInputs = {
  style: 'fluid',
  palette: { base: [0, 0, 0], colours: [[1, 0, 0], [0, 1, 0], [0, 0, 1]] },
  focused: true,
  visible: true,
  reduceMotion: false,
};

interface Fixture {
  screen: ElementStub;
  canvas: ElementStub;
  host: ElementStub;
  controller: ReturnType<typeof createAuroraController>;
  /** Runs the ResizeObserver callback (as the browser would after the host resized). */
  resized: () => void;
}

function withController(run: (f: Fixture) => void, { destroyAfter = true } = {}) {
  mockPointer.mockClear();
  mockRenderer.style = 'fluid';
  mockRenderer.resizeFallsBack = false;
  const canvas = new ElementStub();
  const screen = new ElementStub();
  const host = new ElementStub();
  let observed: (() => void) | null = null;
  class ResizeObserverStub {
    constructor(cb: () => void) {
      observed = cb;
    }
    observe() {}
    disconnect() {}
  }
  const globals: Record<string, unknown> = {
    window: { devicePixelRatio: 1 },
    document: { createElement: () => canvas },
    requestAnimationFrame: () => 1,
    cancelAnimationFrame: () => undefined,
    ResizeObserver: ResizeObserverStub,
  };
  const saved = Object.keys(globals).map((key) => [key, Object.getOwnPropertyDescriptor(globalThis, key)] as const);
  for (const [key, value] of Object.entries(globals)) {
    Object.defineProperty(globalThis, key, { configurable: true, writable: true, value });
  }

  let controller: ReturnType<typeof createAuroraController> | undefined;
  try {
    controller = createAuroraController(host as unknown as HTMLElement, screen as unknown as HTMLElement, inputs);
    run({ screen, canvas, host, controller, resized: () => observed?.() });
  } finally {
    if (destroyAfter) controller?.destroy();
    for (const [key, descriptor] of saved) {
      if (descriptor) Object.defineProperty(globalThis, key, descriptor);
      else Reflect.deleteProperty(globalThis, key);
    }
  }
}

const kinds = () => mockPointer.mock.calls.map(([kind, id]) => `${kind}:${id}`);

/** Starts pointer `id` stirring: down at (100, 100), then a move past the slop to (100, 120). */
function stir(screen: ElementStub, id = 1) {
  screen.fire('pointerdown', 100, 100, id);
  screen.fire('pointermove', 100, 120, id);
}

/** After an interruption and a resume, the old pointers' moves and ups send nothing. */
function expectForgotten(screen: ElementStub, ids: number[]) {
  mockPointer.mockClear();
  for (const id of ids) {
    screen.fire('pointermove', 150, 200, id);
    screen.fire('pointermove', 200, 300, id);
    screen.fire('pointerup', 200, 300, id);
  }
  expect(mockPointer.mock.calls).toEqual([]);
}

/** A new gesture after resuming stirs as usual. */
function expectNewGestureStirs(screen: ElementStub) {
  mockPointer.mockClear();
  stir(screen, 7);
  screen.fire('pointerup', 100, 130, 7);
  expect(kinds()).toEqual(['down:7', 'move:7', 'up:7']);
}

type Interruption = [name: string, stop: (f: Fixture) => void, resume: (f: Fixture) => void];
const interruptions: Interruption[] = [
  ['the tab hidden', (f) => f.controller.update({ ...inputs, visible: false }), (f) => f.controller.update(inputs)],
  ['the window unfocused', (f) => f.controller.update({ ...inputs, focused: false }), (f) => f.controller.update(inputs)],
  ['Reduce Motion on', (f) => f.controller.update({ ...inputs, reduceMotion: true }), (f) => f.controller.update(inputs)],
  ['fluid to flow', (f) => f.controller.update({ ...inputs, style: 'flow' }), (f) => f.controller.update(inputs)],
];

describe.each(interruptions)('%s, then back', (_name, stop, resume) => {
  it("ends a stirring pointer with an 'up' at its last point, and it never stirs again", () => {
    withController((f) => {
      stir(f.screen);
      expect(kinds()).toEqual(['down:1', 'move:1']);
      const last = mockPointer.mock.calls[1]!.slice(2);
      stop(f);
      expect(kinds()).toEqual(['down:1', 'move:1', 'up:1']);
      expect(mockPointer.mock.calls[2]!.slice(2)).toEqual(last);
      resume(f);
      expectForgotten(f.screen, [1]);
      expectNewGestureStirs(f.screen);
    });
  });

  it('forgets a pointer still inside the slop: no deferred down after resuming', () => {
    withController((f) => {
      f.screen.fire('pointerdown', 100, 100);
      f.screen.fire('pointermove', 104, 100);
      stop(f);
      resume(f);
      expectForgotten(f.screen, [1]);
      expectNewGestureStirs(f.screen);
    });
  });
});

it("sends 'up' only for the pointers that were stirring", () => {
  withController((f) => {
    stir(f.screen, 1);
    f.screen.fire('pointerdown', 50, 50, 2); // inside the slop
    stir(f.screen, 3);
    f.controller.update({ ...inputs, visible: false });
    expect(kinds()).toEqual(['down:1', 'move:1', 'down:3', 'move:3', 'up:1', 'up:3']);
    f.controller.update(inputs);
    expectForgotten(f.screen, [1, 2, 3]);
  });
});

it('a pointer forgotten across an interruption stays forgotten through a second one', () => {
  withController((f) => {
    f.screen.fire('pointerdown', 100, 100);
    f.controller.update({ ...inputs, focused: false });
    f.controller.update(inputs);
    f.controller.update({ ...inputs, visible: false });
    f.controller.update(inputs);
    expectForgotten(f.screen, [1]);
  });
});

it("context loss forgets every pointer without an 'up' (the renderer is lost); after the restore they never stir", () => {
  withController((f) => {
    stir(f.screen, 1);
    f.screen.fire('pointerdown', 100, 100, 2);
    mockPointer.mockClear();
    f.canvas.fireGl('webglcontextlost');
    expect(mockPointer.mock.calls).toEqual([]);
    f.canvas.fireGl('webglcontextrestored');
    expectForgotten(f.screen, [1, 2]);
    expectNewGestureStirs(f.screen);
  });
});

it('a renderer that found its context lost before the event: the gesture ends on its next move, and stays over', () => {
  withController((f) => {
    stir(f.screen);
    mockRenderer.style = null; // the renderer saw the loss first; no webglcontextlost yet
    mockPointer.mockClear();
    f.screen.fire('pointermove', 100, 140);
    expect(mockPointer.mock.calls).toEqual([]);
    mockRenderer.style = 'fluid'; // its context came back before the controller heard of any loss
    expectForgotten(f.screen, [1]);
  });
});

it('a restore with no loss seen first still ends every gesture', () => {
  withController((f) => {
    f.screen.fire('pointerdown', 100, 100);
    f.canvas.fireGl('webglcontextrestored');
    expectForgotten(f.screen, [1]);
    expectNewGestureStirs(f.screen);
  });
});

it("a resize that drops fluid to flow ends a stirring pointer with an 'up'", () => {
  withController((f) => {
    stir(f.screen);
    mockRenderer.resizeFallsBack = true;
    f.host.rect = { left: 0, top: 0, width: 300, height: 600 };
    f.resized();
    expect(kinds()).toEqual(['down:1', 'move:1', 'up:1']);
    f.controller.update({ ...inputs, style: 'flow' });
    f.controller.update(inputs); // fluid again
    expectForgotten(f.screen, [1]);
  });
});

it("destroy ends a stirring pointer with an 'up', and removes the listeners", () => {
  withController(
    (f) => {
      stir(f.screen);
      f.controller.destroy();
      expect(kinds()).toEqual(['down:1', 'move:1', 'up:1']);
      expect(f.screen.listeners.size).toBe(0);
    },
    { destroyAfter: false },
  );
});

it("destroy while the context is lost sends no 'up'", () => {
  withController(
    (f) => {
      stir(f.screen);
      f.canvas.fireGl('webglcontextlost');
      f.controller.destroy();
      expect(kinds()).toEqual(['down:1', 'move:1']);
    },
    { destroyAfter: false },
  );
});

it('a change that keeps the aurora stirrable (a palette change) keeps the gesture', () => {
  withController((f) => {
    stir(f.screen);
    f.controller.update({ ...inputs, palette: { base: [0.1, 0, 0], colours: inputs.palette.colours } });
    f.screen.fire('pointermove', 100, 140);
    f.screen.fire('pointerup', 100, 140);
    expect(kinds()).toEqual(['down:1', 'move:1', 'move:1', 'up:1']);
  });
});

// Sol review r3 (orchestrator-owned). F1 and F2 are contract-level: the real renderer never calls back into the
// controller from `pointer`, and it ignores every call once its context is lost (`renderer.web.ts`, `live()`), so
// neither is reachable in the app. Per the 5a loop (caught after an implementer-hard fix) they waited for John, who
// chose to fix them (r7a/FOLLOW-UP.md, 11-02): they are plain tests now.
test('r3 F1: an interruption during the deferred down ends the gesture at the down point', () => {
  withController((f) => {
    mockPointer.mockImplementationOnce(() => f.controller.update({ ...inputs, focused: false }));
    f.screen.fire('pointerdown', 100, 100);
    f.screen.fire('pointermove', 120, 100);
    expect(mockPointer.mock.calls).toEqual([
      ['down', 1, 0.25, 0.875],
      ['up', 1, 0.25, 0.875],
    ]);
  });
});

test('r3 F1: destroy during the deferred down does not crash or send a move', () => {
  withController((f) => {
    mockPointer.mockImplementationOnce(() => f.controller.destroy());
    f.screen.fire('pointerdown', 100, 100);
    expect(() => f.screen.fire('pointermove', 120, 100)).not.toThrow();
    expect(kinds()).toEqual(['down:1', 'up:1']);
  });
});

test.each(['pointerup', 'pointercancel'])('r3 F2: %s never reaches a renderer that found its context lost', (event) => {
  withController((f) => {
    stir(f.screen);
    mockRenderer.style = null;
    mockPointer.mockClear();
    f.screen.fire(event, 100, 140);
    expect(mockPointer.mock.calls).toEqual([]);
  });
});

test.each(['pointerup', 'pointercancel'])('r3 F3: %s converts its own coordinates with y up', (event) => {
  withController((f) => {
    stir(f.screen);
    mockPointer.mockClear();
    f.screen.fire(event, 180, 240);
    expect(mockPointer.mock.calls).toEqual([['up', 1, 0.45, 0.7]]);
  });
});
