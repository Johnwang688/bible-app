// Verifier (Sol, review r1) counterexamples, confirmed failing by the orchestrator (5a). Orchestrator-owned.
import { render } from '@testing-library/react-native';
import { Animated } from 'react-native';
import * as themeModule from '../../theme/ThemeProvider';
import { getTheme } from '../../theme/presets';
import { AuroraBackground } from '../AuroraBackground';
import { createProgram } from '../gl.web';
import { createAuroraLoop, type AuroraLoop } from '../loop';
import { auroraPalette } from '../palette';
import { createAuroraRenderer } from '../renderer.web';

jest.mock('../../reader/components/useReduceMotion', () => ({
  useReduceMotion: () => false,
}));
jest.mock('../../reader/components/useTabFocused', () => ({
  useTabFocused: () => true,
}));
jest.mock('../usePageVisible', () => ({ usePageVisible: () => true }));

afterEach(() => jest.restoreAllMocks());

test('F1: a native drift loop can repeat entirely on the UI thread', async () => {
  const real = jest.requireActual(
    'react-native/Libraries/Animated/AnimatedImplementation',
  ).default;
  jest.spyOn(themeModule, 'useTheme').mockReturnValue(getTheme('silver'));
  jest.spyOn(Animated, 'sequence').mockImplementation(real.sequence);
  jest.spyOn(Animated, 'timing').mockImplementation(real.timing);
  const loops = jest.spyOn(Animated, 'loop').mockImplementation(() => ({
    start: jest.fn(), stop: jest.fn(), reset: jest.fn(),
  }));
  const ui = await render(<AuroraBackground />);
  try {
    expect(loops).toHaveBeenCalledTimes(6);
    for (const [animation] of loops.mock.calls) {
      expect(
        (animation as unknown as {
          _isUsingNativeDriver(): boolean;
        })._isUsingNativeDriver(),
      ).toBe(true);
    }
  } finally {
    ui.unmount();
  }
});

test.each(['destroy', 'off'] as const)(
  'F2: still does not draw after %s during step',
  (action) => {
    let loop: AuroraLoop;
    const draw = jest.fn();
    loop = createAuroraLoop({
      step: () => action === 'destroy'
        ? loop.destroy()
        : loop.setState('off'),
      draw,
    }, {
      request: jest.fn(() => 1),
      cancel: jest.fn(),
    });
    loop.setState('still');
    expect(draw).not.toHaveBeenCalled();
    expect(loop.frames()).toBe(0);
  },
);

test('F3: an unreadable first stop cannot become the second stop', () => {
  const theme = getTheme('silver');
  const layer = 'radial-gradient(hsl(0, 100%, 50%) 0%, #00ff00 100%)';
  expect(auroraPalette({
    ...theme,
    backgrounds: {
      ...theme.backgrounds,
      app: {
        backgroundColor: '#000000',
        backgroundImage: [layer, layer, layer].join(', '),
      },
    },
  })).toBeNull();
});

function fakeGL() {
  const constants = Object.fromEntries(
    ('VERTEX_SHADER FRAGMENT_SHADER COMPILE_STATUS LINK_STATUS ' +
     'ACTIVE_UNIFORMS ARRAY_BUFFER STATIC_DRAW FLOAT TEXTURE_2D ' +
     'TEXTURE_MIN_FILTER TEXTURE_MAG_FILTER LINEAR TEXTURE_WRAP_S ' +
     'TEXTURE_WRAP_T CLAMP_TO_EDGE RGBA16F RGBA HALF_FLOAT FRAMEBUFFER ' +
     'COLOR_ATTACHMENT0 FRAMEBUFFER_COMPLETE COLOR_BUFFER_BIT ' +
     'TEXTURE0 TRIANGLE_STRIP')
      .split(' ').map((s, i) => [s, i + 1]),
  );
  const methods = Object.fromEntries(
    ('shaderSource compileShader attachShader bindAttribLocation linkProgram ' +
     'detachShader bindBuffer bufferData enableVertexAttribArray ' +
     'vertexAttribPointer bindTexture texParameteri texImage2D bindFramebuffer ' +
     'framebufferTexture2D viewport clearColor clear useProgram uniform3fv ' +
     'uniform1i uniform1f uniform2f uniform2fv activeTexture drawArrays ' +
     'deleteShader deleteProgram deleteBuffer deleteTexture deleteFramebuffer')
      .split(' ').map((s) => [s, jest.fn()]),
  );
  const status = jest.fn(() => constants.FRAMEBUFFER_COMPLETE);
  const compile = jest.fn(() => true);
  const shaders = jest.fn((type: number) => ({ type }));
  const deletes = methods.deleteShader!;
  const gl = {
    ...constants, ...methods,
    createShader: shaders,
    getShaderParameter: compile,
    getShaderInfoLog: () => 'forced compile failure',
    createProgram: () => ({}),
    getProgramParameter: (_p: unknown, key: number) =>
      key === constants.ACTIVE_UNIFORMS ? 0 : true,
    createBuffer: () => ({}),
    createTexture: () => ({}),
    createFramebuffer: () => ({}),
    checkFramebufferStatus: status,
    isContextLost: () => false,
    getExtension: (name: string) =>
      name === 'WEBGL_lose_context' ? null : {},
  } as unknown as WebGL2RenderingContext;
  return { gl, status, compile, shaders, deletes };
}

test('F4: incomplete framebuffers after resize fall back to flow', () => {
  const { gl, status } = fakeGL();
  const canvas = {
    width: 400, height: 800, getContext: () => gl,
  } as unknown as HTMLCanvasElement;
  const renderer = createAuroraRenderer(
    canvas, 'fluid', auroraPalette(getTheme('silver'))!,
  )!;
  expect(renderer.style).toBe('fluid');
  try {
    status.mockReturnValue(0);
    renderer.resize(800, 1600);
    expect(renderer.style).toBe('flow');
  } finally {
    renderer.dispose();
  }
});

test('F5: fragment compile failure releases the already compiled vertex shader', () => {
  const { gl, compile, shaders, deletes } = fakeGL();
  compile.mockReturnValueOnce(true).mockReturnValueOnce(false);
  expect(() => createProgram(gl, 'void main(){}'))
    .toThrow('forced compile failure');
  expect(deletes).toHaveBeenCalledWith(shaders.mock.results[0]!.value);
});
