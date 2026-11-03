// R7a-aurora-fix1 (implementer's own tests): the software-renderer fallback, colour-stop reading,
// shader cleanup on a failed link, the resize fallback's GL hygiene, and the native drift's loops.
import { act, render } from '@testing-library/react-native';
import { Animated } from 'react-native';

import * as themeModule from '../../theme/ThemeProvider';
import { getTheme } from '../../theme/presets';
import { AuroraBackground } from '../AuroraBackground';
import { isSoftwareRenderer } from '../fluid.web';
import { createProgram } from '../gl.web';
import { auroraPalette } from '../palette';
import { createAuroraRenderer } from '../renderer.web';

let mockFocused = true;
jest.mock('../../reader/components/useReduceMotion', () => ({ useReduceMotion: () => false }));
jest.mock('../../reader/components/useTabFocused', () => ({ useTabFocused: () => mockFocused }));
jest.mock('../usePageVisible', () => ({ usePageVisible: () => true }));

afterEach(() => {
  jest.restoreAllMocks();
  jest.useRealTimers();
  mockFocused = true;
});

const DEBUG_RENDERER = 0x9246;

function fakeGL(opts: { renderer?: string | (() => never); debugExt?: boolean } = {}) {
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
  const status = jest.fn(() => constants.FRAMEBUFFER_COMPLETE);
  const link = jest.fn(() => true);
  const program = jest.fn(() => ({}) as object | null);
  let nextTexture = 0;
  const gl = {
    ...constants,
    ...methods,
    createShader: jest.fn((type: number) => ({ type })),
    getShaderParameter: () => true,
    getShaderInfoLog: () => '',
    getProgramInfoLog: () => 'forced link failure',
    createProgram: program,
    getProgramParameter: (_p: unknown, key: number) => (key === constants.ACTIVE_UNIFORMS ? 0 : link()),
    createBuffer: () => ({}),
    createTexture: () => ({ texture: nextTexture++ }),
    createFramebuffer: () => ({}),
    checkFramebufferStatus: status,
    isContextLost: () => false,
    getParameter: (key: number) => {
      if (key !== DEBUG_RENDERER) return null;
      const r = opts.renderer ?? 'ANGLE (NVIDIA, NVIDIA GeForce RTX 3060 Direct3D11 vs_5_0 ps_5_0, D3D11)';
      return typeof r === 'function' ? r() : r;
    },
    getExtension: (name: string) => {
      if (name === 'WEBGL_lose_context') return null;
      if (name === 'WEBGL_debug_renderer_info') return opts.debugExt === false ? null : { UNMASKED_RENDERER_WEBGL: DEBUG_RENDERER };
      return {};
    },
  } as unknown as WebGL2RenderingContext;
  const m = methods as Record<string, jest.Mock>;
  return { gl, status, link, program, m };
}

const canvasFor = (gl: WebGL2RenderingContext) =>
  ({ width: 400, height: 800, getContext: () => gl }) as unknown as HTMLCanvasElement;

const silver = () => auroraPalette(getTheme('silver'))!;

describe('software renderer', () => {
  it.each([
    'ANGLE (Google, Vulkan 1.3.0 (SwiftShader Device (Subzero) (0x0000C0DE)), SwiftShader driver)',
    'llvmpipe (LLVM 15.0.7, 256 bits)',
    'softpipe',
    'Microsoft Basic Render Driver',
    'Some Software Rasterizer',
  ])('treats %s as software, and runs flow instead of fluid', (name) => {
    const { gl } = fakeGL({ renderer: name });
    expect(isSoftwareRenderer(gl)).toBe(true);
    const r = createAuroraRenderer(canvasFor(gl), 'fluid', silver())!;
    expect(r.style).toBe('flow');
    r.dispose();
  });

  it('runs fluid on a hardware renderer', () => {
    const { gl } = fakeGL();
    expect(isSoftwareRenderer(gl)).toBe(false);
    const r = createAuroraRenderer(canvasFor(gl), 'fluid', silver())!;
    expect(r.style).toBe('fluid');
    r.dispose();
  });

  it('assumes hardware without the debug extension, or when reading it fails', () => {
    expect(isSoftwareRenderer(fakeGL({ debugExt: false }).gl)).toBe(false);
    const throwing = fakeGL({
      renderer: () => {
        throw new Error('blocked');
      },
    });
    expect(isSoftwareRenderer(throwing.gl)).toBe(false);
  });
});

describe('resize fallback', () => {
  it('releases the fluid buffers and programs, and keeps flow after later resizes', () => {
    const { gl, status, m } = fakeGL();
    const r = createAuroraRenderer(canvasFor(gl), 'fluid', silver())!;
    const programsBefore = m.deleteProgram!.mock.calls.length;
    status.mockReturnValue(0);
    r.resize(800, 1600);
    expect(r.style).toBe('flow');
    // Every fluid program (10) was deleted with the failed fluid style.
    expect(m.deleteProgram!.mock.calls.length - programsBefore).toBe(10);
    status.mockReturnValue(5);
    r.resize(400, 800);
    expect(r.style).toBe('flow');
    m.drawArrays!.mockClear();
    r.step(1 / 60);
    r.draw();
    expect(m.drawArrays).toHaveBeenCalledTimes(1);
    r.dispose();
  });
});

describe('createProgram cleanup', () => {
  it('deletes both shaders and the program when the link fails', () => {
    const { gl, link, m } = fakeGL();
    link.mockReturnValue(false);
    expect(() => createProgram(gl, 'void main(){}')).toThrow('forced link failure');
    const deleted = m.deleteShader!.mock.calls.map(([s]) => (s as { type: number }).type).sort();
    expect(deleted).toEqual([1, 2]);
    expect(m.deleteProgram).toHaveBeenCalledTimes(1);
  });

  it('deletes both shaders when the program cannot be created', () => {
    const { gl, program, m } = fakeGL();
    program.mockReturnValue(null);
    expect(() => createProgram(gl, 'void main(){}')).toThrow('createProgram failed');
    expect(m.deleteShader).toHaveBeenCalledTimes(2);
  });
});

describe('colour stops', () => {
  const withLayers = (layer: string) => {
    const theme = getTheme('silver');
    return auroraPalette({
      ...theme,
      backgrounds: {
        ...theme.backgrounds,
        app: { backgroundColor: '#000000', backgroundImage: [layer, layer, layer].join(', ') },
      },
    });
  };

  it('reads a first stop with no shape before it', () => {
    expect(withLayers('radial-gradient(#ff0000 0%, #00ff00 100%)')?.colours[0]).toEqual([1, 0, 0]);
  });

  it.each(['circle 130px at 86% 19%', 'ellipse at center', 'at 50% 50%', '90% 55% at 0% 0%', 'closest-side'])(
    'skips the shape %s and reads the stop after it',
    (shape) => {
      expect(withLayers(`radial-gradient(${shape}, #ff0000 0%, #00ff00 100%)`)?.colours[0]).toEqual([1, 0, 0]);
    },
  );

  it('is null when the stop after the shape cannot be read', () => {
    expect(withLayers('radial-gradient(circle at 50% 50%, hsl(0, 100%, 50%) 0%, #00ff00 100%)')).toBeNull();
  });
});

describe('native drift loops', () => {
  type Config = { toValue: number; duration: number; useNativeDriver: boolean };

  function spy() {
    const real = jest.requireActual('react-native/Libraries/Animated/AnimatedImplementation').default;
    jest.spyOn(themeModule, 'useTheme').mockReturnValue(getTheme('silver'));
    const timings: { value: Animated.Value; config: Config; done?: (r: { finished: boolean }) => void }[] = [];
    jest.spyOn(Animated, 'timing').mockImplementation((value, config) => {
      const rec: (typeof timings)[number] = { value: value as Animated.Value, config: config as Config };
      timings.push(rec);
      const anim = real.timing(value, config);
      return {
        ...anim,
        _isUsingNativeDriver: () => anim._isUsingNativeDriver(),
        start: (cb?: (r: { finished: boolean }) => void) => void (rec.done = cb),
        stop: jest.fn(),
        reset: jest.fn(),
      };
    });
    const loops = jest.spyOn(Animated, 'loop').mockImplementation(() => ({
      start: jest.fn(),
      stop: jest.fn(),
      reset: jest.fn(),
    }));
    return { timings, loops };
  }

  it('loops one native 12 to 20 s timing per axis, from phase 0 to 1', async () => {
    const { timings, loops } = spy();
    const ui = await render(<AuroraBackground />);
    expect(loops).toHaveBeenCalledTimes(6);
    expect(timings).toHaveLength(6);
    for (const t of timings) {
      expect(t.config.toValue).toBe(1);
      expect(t.config.useNativeDriver).toBe(true);
      expect(t.config.duration).toBeGreaterThanOrEqual(12000);
      expect(t.config.duration).toBeLessThanOrEqual(20000);
    }
    ui.unmount();
  });

  it('resumes from where it paused, finishing that loop before looping again', async () => {
    jest.useFakeTimers({ now: 1_000_000 });
    const { timings, loops } = spy();
    const ui = await render(<AuroraBackground />);
    const period = timings[0]!.config.duration;
    jest.setSystemTime(1_000_000 + period * 2.25);
    mockFocused = false;
    await act(async () => ui.rerender(<AuroraBackground />));
    timings.length = 0;
    loops.mockClear();
    mockFocused = true;
    await act(async () => ui.rerender(<AuroraBackground />));
    // A partial leg first (no loop yet), lasting the rest of the interrupted loop.
    expect(loops).not.toHaveBeenCalled();
    expect(timings).toHaveLength(6);
    const first = timings[0]!;
    expect(first.config.duration).toBeCloseTo(period * 0.75, 0);
    expect(first.config.useNativeDriver).toBe(true);
    // When it finishes, the native loop starts.
    act(() => first.done?.({ finished: true }));
    expect(loops).toHaveBeenCalledTimes(1);
    ui.unmount();
  });
});
