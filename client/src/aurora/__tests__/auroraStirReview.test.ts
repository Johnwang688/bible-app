// Verifier round 1 on R7a-ui-option (GPT-6.1 Sol): F1 (a down while paused must not stir after resuming, the
// guard the old code had) and F2 (exactly 10 px starts stirring; kills a `<=` mutant). Orchestrator-owned.
import type { AuroraInputs } from '../controller.web';

const mockPointer = jest.fn();

jest.mock('../renderer.web', () => ({
  createAuroraRenderer: () => ({
    style: 'fluid',
    step() {},
    draw: () => true,
    setStyle() {},
    setPalette() {},
    resize() {},
    pointer: (...args: unknown[]) => mockPointer(...args),
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
  listeners = new Map<string, EventListener>();

  getBoundingClientRect() {
    return { left: 0, top: 0, width: 400, height: 800 };
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
  fire(name: string, x: number, y: number) {
    this.listeners.get(name)?.({
      pointerId: 1,
      clientX: x,
      clientY: y,
    } as unknown as Event);
  }
}

const inputs: AuroraInputs = {
  style: 'fluid',
  palette: {
    base: [0, 0, 0],
    colours: [[1, 0, 0], [0, 1, 0], [0, 0, 1]],
  },
  focused: true,
  visible: true,
  reduceMotion: false,
};

function withController(
  initial: Partial<AuroraInputs>,
  run: (
    screen: ElementStub,
    controller: ReturnType<typeof createAuroraController>,
  ) => void,
) {
  mockPointer.mockClear();
  const canvas = new ElementStub();
  const screen = new ElementStub();
  const globals: Record<string, unknown> = {
    window: { devicePixelRatio: 1 },
    document: { createElement: () => canvas },
    requestAnimationFrame: () => 1,
    cancelAnimationFrame: () => undefined,
    ResizeObserver: undefined,
  };
  const saved = Object.keys(globals).map(
    key => [key, Object.getOwnPropertyDescriptor(globalThis, key)] as const,
  );
  for (const [key, value] of Object.entries(globals)) {
    Object.defineProperty(globalThis, key, {
      configurable: true, writable: true, value,
    });
  }

  let controller: ReturnType<typeof createAuroraController> | undefined;
  try {
    controller = createAuroraController(
      new ElementStub() as unknown as HTMLElement,
      screen as unknown as HTMLElement,
      { ...inputs, ...initial },
    );
    run(screen, controller);
  } finally {
    controller?.destroy();
    for (const [key, descriptor] of saved) {
      if (descriptor) Object.defineProperty(globalThis, key, descriptor);
      else Reflect.deleteProperty(globalThis, key);
    }
  }
}

test('a down while paused is ignored after resuming', () => {
  withController({ focused: false }, (screen, controller) => {
    screen.fire('pointerdown', 100, 100);
    controller.update(inputs);
    screen.fire('pointermove', 120, 100);
    expect(mockPointer.mock.calls).toEqual([]);
  });
});

test('exactly 10 CSS px starts stirring, including diagonally', () => {
  withController({}, screen => {
    screen.fire('pointerdown', 100, 100);
    screen.fire('pointermove', 106, 108);
    expect(mockPointer.mock.calls.map(([kind]) => kind))
      .toEqual(['down', 'move']);
  });
});

// Acceptance (orchestrator-owned, Sol review r2 F1 and F2).
test('a move while paused cannot become a deferred down after resuming', () => {
  withController({}, (screen, controller) => {
    screen.fire('pointerdown', 100, 100);
    controller.update({ ...inputs, focused: false });
    screen.fire('pointermove', 120, 100);
    controller.update(inputs);
    screen.fire('pointermove', 121, 100);
    expect(mockPointer.mock.calls).toEqual([]);
  });
});

test('tap and sub-slop cancellation send no up to the renderer', () => {
  withController({}, screen => {
    screen.fire('pointerdown', 100, 100);
    screen.fire('pointerup', 100, 100);

    screen.fire('pointerdown', 100, 100);
    screen.fire('pointermove', 106, 104);
    screen.fire('pointercancel', 106, 104);

    expect(mockPointer.mock.calls).toEqual([]);
  });
});
