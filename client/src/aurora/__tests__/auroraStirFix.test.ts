// Sol review of R7a-stirfix (orchestrator-owned; do not edit): a renderer that stops being stirrable from inside its own
// pointer call (its style changes to flow, or to null as when it finds its context lost) ends the gesture there.
import type { AuroraInputs } from '../controller.web';

const mockRenderer = { style: 'fluid' as 'fluid' | 'flow' | null };
const mockPointer = jest.fn();

jest.mock('../renderer.web', () => ({
  createAuroraRenderer: () => ({
    get style() { return mockRenderer.style; },
    pointer: (...args: unknown[]) => mockPointer(...args),
    step() {}, draw: () => true, resize() {}, setStyle() {},
    setPalette() {}, contextLost() {}, restore: () => true, dispose() {},
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
  addEventListener(name: string, fn: EventListener) {
    this.listeners.set(name, fn);
  }
  removeEventListener(name: string) { this.listeners.delete(name); }
  fire(name: string, x: number) {
    this.listeners.get(name)?.({
      pointerId: 1, clientX: x, clientY: 100,
    } as unknown as Event);
  }
}

const inputs: AuroraInputs = {
  style: 'fluid', focused: true, visible: true, reduceMotion: false,
  palette: {
    base: [0, 0, 0],
    colours: [[1, 0, 0], [0, 1, 0], [0, 0, 1]],
  },
};

test.each([
  ['down', 'flow'], ['move', 'flow'], ['down', null], ['move', null],
] as const)('renderer changes during %s to %s end the gesture', (phase, style) => {
  mockRenderer.style = 'fluid';
  mockPointer.mockReset();
  mockPointer.mockImplementation((kind: string) => {
    if (kind === phase) mockRenderer.style = style;
  });

  const canvas = new ElementStub();
  const screen = new ElementStub();
  const globals: Record<string, unknown> = {
    window: { devicePixelRatio: 1 },
    document: { createElement: () => canvas },
    requestAnimationFrame: () => 1,
    cancelAnimationFrame() {},
    ResizeObserver: undefined,
  };
  const saved = Object.keys(globals).map(key =>
    [key, Object.getOwnPropertyDescriptor(globalThis, key)] as const);
  let controller: ReturnType<typeof createAuroraController> | undefined;

  try {
    for (const [key, value] of Object.entries(globals))
      Object.defineProperty(globalThis, key, {
        configurable: true, writable: true, value,
      });

    controller = createAuroraController(
      new ElementStub() as unknown as HTMLElement,
      screen as unknown as HTMLElement,
      inputs,
    );
    screen.fire('pointerdown', 100);
    screen.fire('pointermove', 120);

    const expected: unknown[][] = [['down', 1, 0.25, 0.875]];
    if (phase === 'move') expected.push(['move', 1, 0.3, 0.875]);
    if (style !== null)
      expected.push(['up', 1, phase === 'down' ? 0.25 : 0.3, 0.875]);
    expect(mockPointer.mock.calls).toEqual(expected);

    mockRenderer.style = 'fluid';
    mockPointer.mockReset();
    screen.fire('pointermove', 140);
    screen.fire('pointerup', 140);
    expect(mockPointer.mock.calls).toEqual([]);

    // Reusing the ID for a new gesture must still work.
    screen.fire('pointerdown', 100);
    screen.fire('pointermove', 120);
    screen.fire('pointerup', 140);
    expect(mockPointer.mock.calls).toEqual([
      ['down', 1, 0.25, 0.875],
      ['move', 1, 0.3, 0.875],
      ['up', 1, 0.35, 0.875],
    ]);
  } finally {
    controller?.destroy();
    for (const [key, descriptor] of saved) {
      if (descriptor) Object.defineProperty(globalThis, key, descriptor);
      else Reflect.deleteProperty(globalThis, key);
    }
  }
});
