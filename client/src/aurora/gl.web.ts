// WebGL2 helpers shared by the two aurora styles (R-7a): the full-screen quad, shader programs,
// and the palette GLSL, ported from the approved prototype (without its colour cap: the colours
// are not capped).
import type { AuroraPalette } from './palette';

export const CONTEXT_ATTRIBUTES: WebGLContextAttributes = {
  alpha: false,
  antialias: false,
  depth: false,
  stencil: false,
  preserveDrawingBuffer: false,
  powerPreference: 'low-power',
};

export const VS =
  '#version 300 es\nin vec2 aPos;out vec2 vUv;out vec2 vL;out vec2 vR;out vec2 vT;out vec2 vB;uniform vec2 texel;\n' +
  'void main(){vUv=aPos*0.5+0.5;vL=vUv-vec2(texel.x,0.0);vR=vUv+vec2(texel.x,0.0);vT=vUv+vec2(0.0,texel.y);vB=vUv-vec2(0.0,texel.y);gl_Position=vec4(aPos,0.0,1.0);}';

export const HEAD =
  '#version 300 es\nprecision highp float;precision highp sampler2D;in vec2 vUv;in vec2 vL;in vec2 vR;in vec2 vT;in vec2 vB;out vec4 o;\n';

/**
 * Weights for the three palette colours over the base, mixed in linear light, then back to sRGB
 * with a little dither so the soft gradients do not band. The colour uniforms are already linear
 * (converted once in `fillPalette`, not per pixel).
 */
export const PALETTE =
  'uniform vec3 uBase;uniform vec3 uC1;uniform vec3 uC2;uniform vec3 uC3;\n' +
  'vec3 toSrgb(vec3 c){c=clamp(c,0.0,1.0);return mix(c*12.92,1.055*pow(c,vec3(1.0/2.4))-0.055,step(0.0031308,c));}\n' +
  'float hash(vec2 p){p=fract(p*vec2(123.34,456.21));p+=dot(p,p+45.32);return fract(p.x*p.y);}\n' +
  'vec3 palette(vec3 w){vec3 c=uBase;c=mix(c,uC3,w.z);c=mix(c,uC2,w.y);c=mix(c,uC1,w.x);\n' +
  ' vec3 s=toSrgb(c);return s+(hash(gl_FragCoord.xy)-0.5)/255.0;}\n';

export interface Program {
  program: WebGLProgram;
  uniforms: Record<string, WebGLUniformLocation | null>;
}

/** Compiles a fragment shader body (after HEAD) against the shared vertex shader. Throws on failure. */
export function createProgram(gl: WebGL2RenderingContext, fsBody: string): Program {
  const shader = (type: number, src: string) => {
    const s = gl.createShader(type);
    if (!s) throw new Error('createShader failed');
    gl.shaderSource(s, src);
    gl.compileShader(s);
    if (!gl.getShaderParameter(s, gl.COMPILE_STATUS)) {
      const log = gl.getShaderInfoLog(s);
      gl.deleteShader(s);
      throw new Error(`Aurora shader: ${log ?? 'compile failed'}`);
    }
    return s;
  };
  const vs = shader(gl.VERTEX_SHADER, VS);
  let fs: WebGLShader;
  try {
    fs = shader(gl.FRAGMENT_SHADER, HEAD + fsBody);
  } catch (e) {
    gl.deleteShader(vs); // the vertex shader compiled; release it with the failed fragment shader
    throw e;
  }
  const program = gl.createProgram();
  if (!program) {
    gl.deleteShader(vs);
    gl.deleteShader(fs);
    throw new Error('createProgram failed');
  }
  gl.attachShader(program, vs);
  gl.attachShader(program, fs);
  gl.bindAttribLocation(program, 0, 'aPos');
  gl.linkProgram(program);
  // The program keeps the compiled code; the shaders can go.
  gl.detachShader(program, vs);
  gl.detachShader(program, fs);
  gl.deleteShader(vs);
  gl.deleteShader(fs);
  if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
    const log = gl.getProgramInfoLog(program);
    gl.deleteProgram(program);
    throw new Error(`Aurora program: ${log ?? 'link failed'}`);
  }
  const uniforms: Record<string, WebGLUniformLocation | null> = {};
  const n = gl.getProgramParameter(program, gl.ACTIVE_UNIFORMS) as number;
  for (let i = 0; i < n; i++) {
    const info = gl.getActiveUniform(program, i);
    if (info) uniforms[info.name] = gl.getUniformLocation(program, info.name);
  }
  return { program, uniforms };
}

/** The full-screen quad, bound to attribute 0. */
export function createQuad(gl: WebGL2RenderingContext): WebGLBuffer {
  const buf = gl.createBuffer();
  if (!buf) throw new Error('createBuffer failed');
  gl.bindBuffer(gl.ARRAY_BUFFER, buf);
  gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([-1, -1, 1, -1, -1, 1, 1, 1]), gl.STATIC_DRAW);
  gl.enableVertexAttribArray(0);
  gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 0, 0);
  return buf;
}

/** The palette as flat uniform arrays, reused (never reallocated per frame). */
export interface PaletteUniforms {
  base: Float32Array;
  c1: Float32Array;
  c2: Float32Array;
  c3: Float32Array;
}

export function paletteUniforms(): PaletteUniforms {
  return { base: new Float32Array(3), c1: new Float32Array(3), c2: new Float32Array(3), c3: new Float32Array(3) };
}

/** sRGB to linear light, per channel (the shader mixes in linear light). */
const toLinear = (v: number) => (v < 0.04045 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4));

function setLinear(out: Float32Array, c: readonly [number, number, number]) {
  out[0] = toLinear(c[0]);
  out[1] = toLinear(c[1]);
  out[2] = toLinear(c[2]);
}

export function fillPalette(u: PaletteUniforms, p: AuroraPalette): void {
  setLinear(u.base, p.base);
  setLinear(u.c1, p.colours[0]);
  setLinear(u.c2, p.colours[1]);
  setLinear(u.c3, p.colours[2]);
}

/** Sets the palette uniforms on the program in use. */
export function applyPalette(gl: WebGL2RenderingContext, pr: Program, u: PaletteUniforms): void {
  gl.uniform3fv(pr.uniforms.uBase ?? null, u.base);
  gl.uniform3fv(pr.uniforms.uC1 ?? null, u.c1);
  gl.uniform3fv(pr.uniforms.uC2 ?? null, u.c2);
  gl.uniform3fv(pr.uniforms.uC3 ?? null, u.c3);
}

/** One style's GPU state on a shared context. */
export interface StyleImpl {
  readonly style: 'fluid' | 'flow';
  step(dt: number): void;
  draw(): void;
  /** Uniforms only: takes effect on the next draw. */
  setPalette(p: AuroraPalette): void;
  /** False if the style cannot run at the new size (its buffers could not be rebuilt). */
  resize(w: number, h: number): boolean;
  pointer(kind: 'down' | 'move' | 'up', id: number, x: number, y: number): void;
  /** Deletes this style's GL objects (the context stays). */
  release(): void;
}
