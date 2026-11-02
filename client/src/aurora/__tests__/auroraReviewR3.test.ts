// Verifier (Sol, review r3) regression test: kills a surviving mutant (live palette upload). Passes on HEAD.
import { createAuroraRenderer } from '../renderer.web';
import type { AuroraPalette } from '../palette';

function fakeGL() {
  const c = Object.fromEntries(
    ('VERTEX_SHADER FRAGMENT_SHADER COMPILE_STATUS LINK_STATUS ACTIVE_UNIFORMS ' +
      'ARRAY_BUFFER STATIC_DRAW FLOAT TEXTURE_2D TEXTURE_MIN_FILTER TEXTURE_MAG_FILTER ' +
      'LINEAR TEXTURE_WRAP_S TEXTURE_WRAP_T CLAMP_TO_EDGE RGBA16F RGBA HALF_FLOAT ' +
      'FRAMEBUFFER COLOR_ATTACHMENT0 FRAMEBUFFER_COMPLETE COLOR_BUFFER_BIT TEXTURE0 TRIANGLE_STRIP')
      .split(' ').map((name, i) => [name, i + 1]),
  );
  const m: Record<string, jest.Mock> = Object.fromEntries(
    ('shaderSource compileShader attachShader bindAttribLocation linkProgram detachShader ' +
      'bindBuffer bufferData enableVertexAttribArray vertexAttribPointer bindTexture texParameteri ' +
      'texImage2D bindFramebuffer framebufferTexture2D viewport clearColor clear useProgram ' +
      'uniform1i uniform1f uniform2f uniform2fv activeTexture drawArrays ' +
      'deleteShader deleteProgram deleteBuffer deleteTexture deleteFramebuffer')
      .split(' ').map((name) => [name, jest.fn()]),
  );
  for (const name of ['createShader', 'createProgram', 'createBuffer', 'createTexture', 'createFramebuffer']) {
    m[name] = jest.fn(() => ({}));
  }
  const uploads: [unknown, number[]][] = [];
  const names = ['uBase', 'uC1', 'uC2', 'uC3'];
  const gl = {
    ...c, ...m,
    isContextLost: () => false,
    getParameter: () => 'Hardware GPU',
    getExtension: (name: string) => name === 'WEBGL_lose_context' ? null : {},
    getShaderParameter: () => true,
    getProgramParameter: (_p: unknown, key: number) => key === c.ACTIVE_UNIFORMS ? names.length : true,
    getActiveUniform: (_p: unknown, i: number) => ({ name: names[i] }),
    getUniformLocation: (_p: unknown, name: string) => name,
    checkFramebufferStatus: () => c.FRAMEBUFFER_COMPLETE,
    uniform3fv: (location: unknown, data: Float32Array) => uploads.push([location, Array.from(data)]),
  } as unknown as WebGL2RenderingContext;
  return { gl, m, uploads };
}

const first: AuroraPalette = {
  base: [0, 0, 0], colours: [[1, 0, 0], [0, 1, 0], [0, 0, 1]],
};
const next: AuroraPalette = {
  base: [1, 1, 1], colours: [[0, 1, 0], [0, 0, 1], [1, 0, 0]],
};

test.each(['flow', 'fluid'] as const)(
  'F1: %s palette changes upload new colours without rebuilding or drawing',
  (style) => {
    const { gl, m, uploads } = fakeGL();
    const canvas = { width: 400, height: 800, getContext: () => gl } as unknown as HTMLCanvasElement;
    const renderer = createAuroraRenderer(canvas, style, first)!;
    try {
      expect(renderer.style).toBe(style);
      const creates = ['createShader', 'createProgram', 'createBuffer', 'createTexture', 'createFramebuffer'];
      const before = creates.map((name) => m[name]!.mock.calls.length);
      const draws = m.drawArrays!.mock.calls.length;
      uploads.length = 0;
      renderer.setPalette(next);
      expect(uploads).toEqual([
        ['uBase', [1, 1, 1]], ['uC1', [0, 1, 0]], ['uC2', [0, 0, 1]], ['uC3', [1, 0, 0]],
      ]);
      expect(creates.map((name) => m[name]!.mock.calls.length)).toEqual(before);
      expect(m.drawArrays!.mock.calls.length).toBe(draws);
    } finally {
      renderer.dispose();
    }
  },
);
