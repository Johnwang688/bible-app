// Verifier (Sol, review r2) counterexamples, confirmed failing by the orchestrator (5a). Orchestrator-owned.
import { createAuroraController } from '../controller.web';
import { auroraPalette } from '../palette';
import { createAuroraRenderer } from '../renderer.web';
import { getTheme } from '../../theme/presets';

function fakeGL() {
  const constants = Object.fromEntries(
    ('VERTEX_SHADER FRAGMENT_SHADER COMPILE_STATUS LINK_STATUS ACTIVE_UNIFORMS ' +
      'ARRAY_BUFFER STATIC_DRAW FLOAT TEXTURE_2D TEXTURE_MIN_FILTER TEXTURE_MAG_FILTER ' +
      'LINEAR TEXTURE_WRAP_S TEXTURE_WRAP_T CLAMP_TO_EDGE RGBA16F RGBA HALF_FLOAT ' +
      'FRAMEBUFFER COLOR_ATTACHMENT0 FRAMEBUFFER_COMPLETE COLOR_BUFFER_BIT TEXTURE0 TRIANGLE_STRIP')
      .split(' ').map((s, i) => [s, i + 1]),
  );
  const calls: Record<string, jest.Mock> = Object.fromEntries(
    ('shaderSource compileShader attachShader bindAttribLocation linkProgram detachShader ' +
      'bindBuffer bufferData enableVertexAttribArray vertexAttribPointer bindTexture texParameteri ' +
      'texImage2D bindFramebuffer framebufferTexture2D viewport clearColor clear useProgram ' +
      'uniform3fv uniform1i uniform1f uniform2f uniform2fv activeTexture drawArrays ' +
      'deleteShader deleteProgram deleteBuffer deleteTexture deleteFramebuffer')
      .split(' ').map((s) => [s, jest.fn()]),
  );
  const state = { lost: false };
  let serial = 0;
  for (const name of ['createShader', 'createProgram', 'createBuffer', 'createTexture', 'createFramebuffer']) {
    calls[name] = jest.fn(() => state.lost ? null : { id: serial++ });
  }
  calls.getParameter = jest.fn(() => 'Hardware GPU');
  const gl = {
    ...constants, ...calls,
    isContextLost: () => state.lost,
    getExtension: (name: string) => state.lost || name === 'WEBGL_lose_context'
      ? null : name === 'WEBGL_debug_renderer_info' ? { UNMASKED_RENDERER_WEBGL: 0x9246 } : {},
    getShaderParameter: () => !state.lost,
    getProgramParameter: (_p: unknown, key: number) => key === constants.ACTIVE_UNIFORMS ? 0 : !state.lost,
    checkFramebufferStatus: () => constants.FRAMEBUFFER_COMPLETE,
  } as unknown as WebGL2RenderingContext;
  return { gl, calls, state };
}
const palette = () => auroraPalette(getTheme('silver'))!;
const canvasFor = (gl: WebGL2RenderingContext) =>
  ({ width: 400, height: 800, getContext: () => gl }) as unknown as HTMLCanvasElement;

test.each(['createTexture', 'createFramebuffer'])('F2: %s failure releases the other allocated object', (allocation) => {
  const { gl, calls } = fakeGL();
  calls[allocation]!.mockReturnValueOnce(null);
  const renderer = createAuroraRenderer(canvasFor(gl), 'fluid', palette())!;
  expect(renderer.style).toBe('flow');
  renderer.dispose();
  for (const [create, remove] of [
    ['createTexture', 'deleteTexture'], ['createFramebuffer', 'deleteFramebuffer'],
  ]) {
    for (const result of calls[create!]!.mock.results) {
      if (result.value !== null) expect(calls[remove!]!).toHaveBeenCalledWith(result.value);
    }
  }
});

class ElementStub {
  width = 0;
  height = 0;
  style: Record<string, string> = {};
  attrs = new Map<string, string>();
  children: ElementStub[] = [];
  listeners = new Map<string, EventListener>();
  constructor(readonly gl: WebGL2RenderingContext) {}
  getContext() { return this.gl; }
  getBoundingClientRect() { return { width: 400, height: 800, left: 0, top: 0 }; }
  setAttribute(k: string, v: string) { this.attrs.set(k, v); }
  removeAttribute(k: string) { this.attrs.delete(k); }
  appendChild(c: ElementStub) { this.children.push(c); }
  addEventListener(k: string, cb: EventListener) { this.listeners.set(k, cb); }
  removeEventListener(k: string) { this.listeners.delete(k); }
  remove() {}
  emit(k: string) { this.listeners.get(k)?.({ preventDefault() {} } as Event); }
}

test('F1: loss during the software-renderer check can restore and resume', () => {
  const { gl, calls, state } = fakeGL();
  calls.getParameter!.mockImplementationOnce(() => { state.lost = true; return null; });
  const canvas = new ElementStub(gl);
  const globals: Record<string, unknown> = {
    window: { devicePixelRatio: 1 },
    document: { createElement: () => canvas },
    requestAnimationFrame: jest.fn(() => 1),
    cancelAnimationFrame: jest.fn(),
    ResizeObserver: class { observe() {} disconnect() {} },
  };
  const saved = Object.keys(globals).map((key) => [key, Object.getOwnPropertyDescriptor(globalThis, key)] as const);
  for (const [key, value] of Object.entries(globals)) {
    Object.defineProperty(globalThis, key, { configurable: true, writable: true, value });
  }
  let controller: ReturnType<typeof createAuroraController> | undefined;
  try {
    controller = createAuroraController(
      new ElementStub(gl) as unknown as HTMLElement, null,
      { style: 'fluid', palette: palette(), focused: true, visible: true, reduceMotion: false },
    );
    canvas.emit('webglcontextlost');
    expect(canvas.attrs.get('data-aurora-state')).toBe('off');
    state.lost = false;
    canvas.emit('webglcontextrestored');
    expect(canvas.attrs.get('data-aurora-state')).toBe('running');
  } finally {
    controller?.destroy();
    for (const [key, descriptor] of saved) {
      if (descriptor) Object.defineProperty(globalThis, key, descriptor);
      else Reflect.deleteProperty(globalThis, key);
    }
  }
});

