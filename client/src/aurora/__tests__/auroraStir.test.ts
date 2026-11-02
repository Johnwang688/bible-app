// Acceptance (orchestrator-owned, R-7a UI, GO-AHEAD "Major 5"): stirring the fluid never gets in the way of
// scrolling. The stir surface allows vertical panning (`touch-action: pan-y`, so a vertical drag scrolls and
// the browser cancels the pointer), and only a deliberate drag stirs: nothing reaches the renderer until the
// pointer has moved 10 CSS px from where it went down. The implementer may not edit this file.
import type { AuroraPalette } from '../palette';
import type { PointerKind, WebAuroraRenderer } from '../renderer.web';

const mockCalls: [PointerKind, number, number, number][] = [];

jest.mock('../renderer.web', () => ({
  createAuroraRenderer: (): WebAuroraRenderer => ({
    style: 'fluid',
    software: false,
    step: () => undefined,
    draw: () => true,
    setStyle: () => undefined,
    setPalette: () => undefined,
    resize: () => undefined,
    pointer: (kind: PointerKind, id: number, x: number, y: number) => void mockCalls.push([kind, id, x, y]),
    contextLost: () => undefined,
    restore: () => true,
    dispose: () => undefined,
  }),
}));

// eslint-disable-next-line import/first
import { createAuroraController } from '../controller.web';

type Listener = (ev: PointerEvent) => void;

class El {
  style: Record<string, string> = {};
  attrs = new Map<string, string>();
  listeners = new Map<string, Set<Listener>>();
  width = 0;
  height = 0;
  getBoundingClientRect() {
    return { left: 0, top: 0, width: 400, height: 800, right: 400, bottom: 800, x: 0, y: 0 };
  }
  setAttribute(k: string, v: string) {
    this.attrs.set(k, v);
  }
  removeAttribute(k: string) {
    this.attrs.delete(k);
  }
  appendChild() {}
  remove() {}
  addEventListener(k: string, cb: Listener) {
    if (!this.listeners.has(k)) this.listeners.set(k, new Set());
    this.listeners.get(k)!.add(cb);
  }
  removeEventListener(k: string, cb: Listener) {
    this.listeners.get(k)?.delete(cb);
  }
  fire(k: string, pointerId: number, clientX: number, clientY: number) {
    for (const cb of this.listeners.get(k) ?? []) cb({ pointerId, clientX, clientY } as PointerEvent);
  }
}

const palette: AuroraPalette = {
  base: [0.95, 0.95, 0.96],
  colours: [
    [0.77, 0.79, 0.82],
    [0.85, 0.86, 0.89],
    [0.71, 0.73, 0.78],
  ],
};

function withController(run: (screen: El, destroy: () => void) => void, screenStyle: Record<string, string> = {}) {
  const canvas = new El();
  const host = new El();
  const screen = new El();
  screen.style = { ...screenStyle };
  const globals: Record<string, unknown> = {
    window: { devicePixelRatio: 1 },
    document: { createElement: () => canvas },
    requestAnimationFrame: () => 1,
    cancelAnimationFrame: () => undefined,
  };
  const saved = Object.keys(globals).map((key) => [key, Object.getOwnPropertyDescriptor(globalThis, key)] as const);
  for (const [key, value] of Object.entries(globals)) {
    Object.defineProperty(globalThis, key, { configurable: true, writable: true, value });
  }
  try {
    const c = createAuroraController(host as unknown as HTMLElement, screen as unknown as HTMLElement, {
      style: 'fluid',
      palette,
      reduceMotion: false,
      focused: true,
      visible: true,
    });
    run(screen, () => c.destroy());
  } finally {
    for (const [key, descriptor] of saved) {
      if (descriptor) Object.defineProperty(globalThis, key, descriptor);
      else Reflect.deleteProperty(globalThis, key);
    }
  }
}

beforeEach(() => void mockCalls.splice(0));

describe('stirring', () => {
  it('lets the stir surface pan vertically (and pinch-zoom) while mounted, and puts the old value back on destroy', () => {
    withController(
      (screen, destroy) => {
        expect(screen.style.touchAction).toBe('pan-y pinch-zoom');
        destroy();
        expect(screen.style.touchAction).toBe('manipulation');
      },
      { touchAction: 'manipulation' },
    );
  });

  it('a tap, or a drag shorter than 10 px, never stirs', () => {
    withController((screen) => {
      screen.fire('pointerdown', 1, 100, 100);
      screen.fire('pointermove', 1, 106, 104); // 7.2 px
      screen.fire('pointerup', 1, 106, 104);
      expect(mockCalls.filter(([k]) => k !== 'up')).toEqual([]);
    });
  });

  it('a drag stirs once it has gone 10 px, starting where it went down', () => {
    withController((screen) => {
      screen.fire('pointerdown', 7, 100, 100);
      screen.fire('pointermove', 7, 105, 100);
      expect(mockCalls).toEqual([]);
      screen.fire('pointermove', 7, 112, 100);
      expect(mockCalls.map(([k, id]) => [k, id])).toEqual([
        ['down', 7],
        ['move', 7],
      ]);
      // The down is at the start point (0..1 over the canvas, y up).
      expect(mockCalls[0]![2]).toBeCloseTo(100 / 400, 5);
      expect(mockCalls[0]![3]).toBeCloseTo(1 - 100 / 800, 5);
      expect(mockCalls[1]![2]).toBeCloseTo(112 / 400, 5);
      screen.fire('pointermove', 7, 114, 101);
      expect(mockCalls.at(-1)![0]).toBe('move');
      screen.fire('pointerup', 7, 114, 101);
      expect(mockCalls.at(-1)![0]).toBe('up');
    });
  });

  it('a pointer the browser takes for scrolling (pointercancel) stops stirring, and its later moves do nothing', () => {
    withController((screen) => {
      screen.fire('pointerdown', 3, 100, 100);
      screen.fire('pointermove', 3, 100, 130);
      screen.fire('pointercancel', 3, 100, 130);
      const before = mockCalls.length;
      expect(mockCalls.at(-1)![0]).toBe('up');
      screen.fire('pointermove', 3, 100, 200);
      expect(mockCalls.length).toBe(before);
    });
  });

  it('a cancelled pointer that never stirred sends nothing at all', () => {
    withController((screen) => {
      screen.fire('pointerdown', 4, 100, 100);
      screen.fire('pointermove', 4, 100, 104);
      screen.fire('pointercancel', 4, 100, 104);
      expect(mockCalls.filter(([k]) => k !== 'up')).toEqual([]);
    });
  });

  it('two pointers each need their own 10 px', () => {
    withController((screen) => {
      screen.fire('pointerdown', 1, 0, 0);
      screen.fire('pointerdown', 2, 200, 200);
      screen.fire('pointermove', 1, 20, 0);
      screen.fire('pointermove', 2, 203, 200);
      expect(mockCalls.filter(([, id]) => id === 2)).toEqual([]);
      expect(mockCalls.filter(([, id]) => id === 1).map(([k]) => k)).toEqual(['down', 'move']);
    });
  });
});
