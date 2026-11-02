// B, the stable-fluids simulation (R-7a), the default style: splat, curl, vorticity, divergence,
// pressure (20 Jacobi passes), gradient subtraction, then advection of velocity and dye. Sim 128 and
// dye 320 on the short side, half-float targets, three looping emitters (one per palette colour),
// a seeded first frame, and stirring with a pointer. Ported from the approved prototype with its
// tuning constants.
import {
  applyPalette,
  createProgram,
  fillPalette,
  PALETTE,
  paletteUniforms,
  type Program,
  type StyleImpl,
} from './gl.web';
import type { AuroraPalette } from './palette';

const SHADERS = {
  splat:
    'uniform sampler2D uTarget;uniform float uAspect;uniform vec3 uColor;uniform vec2 uPoint;uniform float uRadius;\n' +
    'void main(){vec2 p=vUv-uPoint;p.x*=uAspect;vec3 s=exp(-dot(p,p)/uRadius)*uColor;o=vec4(texture(uTarget,vUv).xyz+s,1.0);}',
  // The three emitters in one pass: the same sum as three splats in a row.
  splat3:
    'uniform sampler2D uTarget;uniform float uAspect;uniform vec3 uColors[3];uniform vec2 uPoints[3];uniform float uRadius;\n' +
    'void main(){vec3 s=vec3(0.0);for(int i=0;i<3;i++){vec2 p=vUv-uPoints[i];p.x*=uAspect;s+=exp(-dot(p,p)/uRadius)*uColors[i];}\n' +
    ' o=vec4(texture(uTarget,vUv).xyz+s,1.0);}',
  advect:
    'uniform sampler2D uVelocity;uniform sampler2D uSource;uniform vec2 uSimTexel;uniform float uDt;uniform float uDiss;\n' +
    'void main(){vec2 c=vUv-uDt*texture(uVelocity,vUv).xy*uSimTexel;o=texture(uSource,c)/(1.0+uDiss*uDt);}',
  curl:
    'uniform sampler2D uVelocity;\n' +
    'void main(){float L=texture(uVelocity,vL).y,R=texture(uVelocity,vR).y,T=texture(uVelocity,vT).x,B=texture(uVelocity,vB).x;o=vec4(0.5*(R-L-T+B),0.0,0.0,1.0);}',
  vort:
    'uniform sampler2D uVelocity;uniform sampler2D uCurl;uniform float uCurlK;uniform float uDt;\n' +
    'void main(){float L=texture(uCurl,vL).x,R=texture(uCurl,vR).x,T=texture(uCurl,vT).x,B=texture(uCurl,vB).x,C=texture(uCurl,vUv).x;\n' +
    ' vec2 f=0.5*vec2(abs(T)-abs(B),abs(R)-abs(L));f/=length(f)+0.0001;f*=uCurlK*C;f.y*=-1.0;\n' +
    ' vec2 v=texture(uVelocity,vUv).xy+f*uDt;o=vec4(clamp(v,-1000.0,1000.0),0.0,1.0);}',
  div:
    'uniform sampler2D uVelocity;\n' +
    'void main(){float L=texture(uVelocity,vL).x,R=texture(uVelocity,vR).x,T=texture(uVelocity,vT).y,B=texture(uVelocity,vB).y;vec2 C=texture(uVelocity,vUv).xy;\n' +
    ' if(vL.x<0.0)L=-C.x;if(vR.x>1.0)R=-C.x;if(vT.y>1.0)T=-C.y;if(vB.y<0.0)B=-C.y;o=vec4(0.5*(R-L+T-B),0.0,0.0,1.0);}',
  clear: 'uniform sampler2D uTex;uniform float uValue;void main(){o=uValue*texture(uTex,vUv);}',
  press:
    'uniform sampler2D uPressure;uniform sampler2D uDivergence;\n' +
    'void main(){float L=texture(uPressure,vL).x,R=texture(uPressure,vR).x,T=texture(uPressure,vT).x,B=texture(uPressure,vB).x;\n' +
    ' o=vec4((L+R+B+T-texture(uDivergence,vUv).x)*0.25,0.0,0.0,1.0);}',
  grad:
    'uniform sampler2D uPressure;uniform sampler2D uVelocity;\n' +
    'void main(){float L=texture(uPressure,vL).x,R=texture(uPressure,vR).x,T=texture(uPressure,vT).x,B=texture(uPressure,vB).x;\n' +
    ' vec2 v=texture(uVelocity,vUv).xy-vec2(R-L,T-B);o=vec4(v,0.0,1.0);}',
  show:
    PALETTE +
    'uniform sampler2D uDye;void main(){vec3 w=max(texture(uDye,vUv).rgb,0.0);w/=max(1.0,w.x+w.y+w.z);o=vec4(palette(w*0.95),1.0);}',
} as const;

type ProgramName = keyof typeof SHADERS;

const SIM_RES = 128;
const DYE_RES = 320;
const PRESSURE_ITERATIONS = 20;
const CURL = 18;
const PRESSURE_DECAY = 0.8;
const VELOCITY_DISSIPATION = 0.15;
const DYE_DISSIPATION = 0.35;
const TAU = 6.283;

/** Three slow currents, one per palette colour, each on its own looping path. */
const EMITTERS = [
  { ax: 0.32, ay: 0.3, fx: 0.11, fy: 0.07, px: 0.0, py: 1.3, ch: 0 },
  { ax: 0.3, ay: 0.34, fx: 0.08, fy: 0.12, px: 2.1, py: 0.4, ch: 1 },
  { ax: 0.34, ay: 0.28, fx: 0.13, fy: 0.09, px: 4.0, py: 2.6, ch: 2 },
] as const;

/** The first frame starts full: colour 1 top left, 2 right, 3 bottom, as the still paint draws them. */
const SEEDS: readonly (readonly [number, number, number, number, number])[] = [
  [0.15, 0.85, 0.9, 0, 0],
  [0.85, 0.55, 0, 0.9, 0],
  [0.25, 0.15, 0, 0, 0.9],
  [0.75, 0.2, 0.5, 0, 0],
  [0.4, 0.5, 0, 0.4, 0],
];

interface Target {
  tex: WebGLTexture;
  fb: WebGLFramebuffer;
  w: number;
  h: number;
}

interface DoubleTarget {
  read: Target;
  write: Target;
  w: number;
  h: number;
  tx: number;
  ty: number;
}

interface Pointer {
  id: number;
  x: number;
  y: number;
  dx: number;
  dy: number;
  moved: boolean;
  color: Float32Array;
}

function size(short: number, aspect: number): { w: number; h: number } {
  const a = aspect < 1 ? 1 / aspect : aspect;
  const mn = Math.round(short);
  const mx = Math.round(short * a);
  return aspect < 1 ? { w: mn, h: mx } : { w: mx, h: mn };
}

/** Renderer names of GPUs emulated on the CPU, where the simulation would cost the main thread dearly. */
const SOFTWARE = /swiftshader|llvmpipe|softpipe|software|microsoft basic render/i;

/**
 * Whether this context renders in software (SwiftShader, llvmpipe, ...). Without the debug renderer
 * extension (or if reading it fails) it is assumed to be a real GPU.
 */
export function isSoftwareRenderer(gl: WebGL2RenderingContext): boolean {
  try {
    const ext = gl.getExtension('WEBGL_debug_renderer_info');
    if (!ext) return false;
    const name: unknown = gl.getParameter(ext.UNMASKED_RENDERER_WEBGL);
    return typeof name === 'string' && SOFTWARE.test(name);
  } catch {
    return false;
  }
}

/**
 * Whether this context can run the simulation: a hardware renderer that can render to half-float
 * colour targets (enables the extension if so).
 */
export function supportsFluid(gl: WebGL2RenderingContext): boolean {
  if (isSoftwareRenderer(gl)) return false;
  try {
    return gl.getExtension('EXT_color_buffer_float') !== null || gl.getExtension('EXT_color_buffer_half_float') !== null;
  } catch {
    return false;
  }
}

/**
 * The fluid style, or null when this GPU cannot run it (a software renderer, no half-float targets,
 * incomplete framebuffers, a lost context). Never throws; when it returns null, every object it made
 * has been deleted.
 */
export function createFluid(gl: WebGL2RenderingContext, palette: AuroraPalette, w: number, h: number): StyleImpl | null {
  if (!supportsFluid(gl)) return null;

  const P = {} as Record<ProgramName, Program>;
  const programs: WebGLProgram[] = [];

  const pal = paletteUniforms();
  const scratch = new Float32Array(3);
  const points = new Float32Array(6);
  const velColours = new Float32Array(9);
  const dyeColours = new Float32Array(9);
  const pointers: Pointer[] = [];
  let colorTurn = 0;
  let width = w;
  let height = h;
  let t = 0;
  let targets: Target[] = [];
  let vel: DoubleTarget;
  let dye: DoubleTarget;
  let press: DoubleTarget;
  let div: Target;
  let curl: Target;

  /**
   * One render target, tracked in `targets` (and so released with them) as soon as both of its
   * objects exist. If only one of them could be made (a lost context), that one is deleted here.
   */
  const target = (tw: number, th: number): Target | null => {
    const tex = gl.createTexture();
    if (!tex) return null;
    let fb: WebGLFramebuffer | null = null;
    try {
      fb = gl.createFramebuffer();
    } finally {
      if (!fb) gl.deleteTexture(tex); // on a null or a throw: the texture is not left behind
    }
    if (!fb) return null;
    const t0: Target = { tex, fb, w: tw, h: th };
    targets.push(t0);
    gl.bindTexture(gl.TEXTURE_2D, tex);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
    gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA16F, tw, th, 0, gl.RGBA, gl.HALF_FLOAT, null);
    gl.bindFramebuffer(gl.FRAMEBUFFER, fb);
    gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, tex, 0);
    if (gl.checkFramebufferStatus(gl.FRAMEBUFFER) !== gl.FRAMEBUFFER_COMPLETE) return null;
    gl.viewport(0, 0, tw, th);
    gl.clearColor(0, 0, 0, 1);
    gl.clear(gl.COLOR_BUFFER_BIT);
    return t0;
  };

  const double = (tw: number, th: number): DoubleTarget | null => {
    const a = target(tw, th);
    const b = a && target(tw, th);
    return a && b ? { read: a, write: b, w: tw, h: th, tx: 1 / tw, ty: 1 / th } : null;
  };

  const swap = (d: DoubleTarget) => {
    const x = d.read;
    d.read = d.write;
    d.write = x;
  };

  const releaseTargets = () => {
    for (const x of targets) {
      gl.deleteFramebuffer(x.fb);
      gl.deleteTexture(x.tex);
    }
    targets = [];
  };

  const bindTex = (unit: number, tex: WebGLTexture) => {
    gl.activeTexture(gl.TEXTURE0 + unit);
    gl.bindTexture(gl.TEXTURE_2D, tex);
    return unit;
  };

  const blit = (to: Target | null) => {
    if (to) {
      gl.bindFramebuffer(gl.FRAMEBUFFER, to.fb);
      gl.viewport(0, 0, to.w, to.h);
    } else {
      gl.bindFramebuffer(gl.FRAMEBUFFER, null);
      gl.viewport(0, 0, width, height);
    }
    gl.drawArrays(gl.TRIANGLE_STRIP, 0, 4);
  };

  const bind = (pr: Program, tx: number, ty: number) => {
    gl.useProgram(pr.program);
    const texel = pr.uniforms.texel;
    if (texel) gl.uniform2f(texel, tx, ty);
    return pr.uniforms;
  };

  const splat = (d: DoubleTarget, x: number, y: number, color: Float32Array, radius: number) => {
    const aspect = width / height;
    const u = bind(P.splat, d.tx, d.ty);
    gl.uniform1i(u.uTarget ?? null, bindTex(0, d.read.tex));
    gl.uniform1f(u.uAspect ?? null, aspect);
    gl.uniform2f(u.uPoint ?? null, x, y);
    gl.uniform3fv(u.uColor ?? null, color);
    gl.uniform1f(u.uRadius ?? null, (radius / 100) * (aspect < 1 ? 1 : aspect));
    blit(d.write);
    swap(d);
  };

  /** Adds the three emitters' splats (`points`, `colours`) to `d` in one pass. */
  const splat3 = (d: DoubleTarget, colours: Float32Array, radius: number) => {
    const aspect = width / height;
    const u = bind(P.splat3, d.tx, d.ty);
    gl.uniform1i(u.uTarget ?? null, bindTex(0, d.read.tex));
    gl.uniform1f(u.uAspect ?? null, aspect);
    gl.uniform2fv(u['uPoints[0]'] ?? null, points);
    gl.uniform3fv(u['uColors[0]'] ?? null, colours);
    gl.uniform1f(u.uRadius ?? null, (radius / 100) * (aspect < 1 ? 1 : aspect));
    blit(d.write);
    swap(d);
  };

  /**
   * (Re)creates the buffers for the canvas size and seeds the dye. False if the GPU cannot (an
   * incomplete framebuffer, a lost context), with every buffer released: nothing half-built stays.
   */
  const init = (): boolean => {
    releaseTargets();
    try {
      const aspect = width / height;
      const s = size(SIM_RES, aspect);
      const d = size(DYE_RES, aspect);
      // Stop at the first failure: the rest would only be made to be deleted.
      const v = double(s.w, s.h);
      const dd = v && double(d.w, d.h);
      const p = dd && double(s.w, s.h);
      const dv = p && target(s.w, s.h);
      const c = dv && target(s.w, s.h);
      if (!v || !dd || !p || !dv || !c) {
        releaseTargets();
        return false;
      }
      vel = v;
      dye = dd;
      press = p;
      div = dv;
      curl = c;
      for (const [x, y, r, g, b] of SEEDS) {
        scratch[0] = r;
        scratch[1] = g;
        scratch[2] = b;
        splat(dye, x, y, scratch, 0.06);
      }
      return true;
    } catch {
      releaseTargets();
      return false;
    }
  };

  const releasePrograms = () => {
    for (const p of programs) gl.deleteProgram(p);
    programs.length = 0;
  };

  const setPalette = (p: AuroraPalette) => {
    fillPalette(pal, p);
    gl.useProgram(P.show.program);
    applyPalette(gl, P.show, pal);
  };

  // Build everything; on any failure (a compile error, a lost context, an incomplete framebuffer)
  // delete whatever was made and report that fluid cannot run.
  try {
    for (const name of Object.keys(SHADERS) as ProgramName[]) {
      P[name] = createProgram(gl, SHADERS[name]);
      programs.push(P[name].program);
    }
    if (!init()) throw new Error('fluid buffers');
    setPalette(palette);
  } catch {
    releaseTargets();
    releasePrograms();
    return null;
  }

  let ready = true;

  const step = (dt: number) => {
    if (!ready) return;
    t += dt;
    const k = dt * 60;
    for (let i = 0; i < EMITTERS.length; i++) {
      const e = EMITTERS[i]!;
      points[2 * i] = 0.5 + e.ax * Math.sin(t * e.fx * TAU + e.px);
      points[2 * i + 1] = 0.5 + e.ay * Math.sin(t * e.fy * TAU + e.py);
      const vx = e.ax * e.fx * TAU * Math.cos(t * e.fx * TAU + e.px);
      const vy = e.ay * e.fy * TAU * Math.cos(t * e.fy * TAU + e.py);
      velColours[3 * i] = vx * vel.w * 1.6 * k;
      velColours[3 * i + 1] = vy * vel.h * 1.6 * k;
      velColours[3 * i + 2] = 0;
      dyeColours[3 * i] = e.ch === 0 ? 0.012 * k : 0;
      dyeColours[3 * i + 1] = e.ch === 1 ? 0.012 * k : 0;
      dyeColours[3 * i + 2] = e.ch === 2 ? 0.012 * k : 0;
    }
    splat3(vel, velColours, 0.9);
    splat3(dye, dyeColours, 1.8);
    for (let i = 0; i < pointers.length; i++) {
      const p = pointers[i]!;
      if (!p.moved) continue;
      p.moved = false;
      scratch[0] = p.dx * 6000;
      scratch[1] = p.dy * 6000;
      scratch[2] = 0;
      splat(vel, p.x, p.y, scratch, 0.35);
      splat(dye, p.x, p.y, p.color, 0.5);
    }
    let u = bind(P.curl, vel.tx, vel.ty);
    gl.uniform1i(u.uVelocity ?? null, bindTex(0, vel.read.tex));
    blit(curl);

    u = bind(P.vort, vel.tx, vel.ty);
    gl.uniform1i(u.uVelocity ?? null, bindTex(0, vel.read.tex));
    gl.uniform1i(u.uCurl ?? null, bindTex(1, curl.tex));
    gl.uniform1f(u.uCurlK ?? null, CURL);
    gl.uniform1f(u.uDt ?? null, dt);
    blit(vel.write);
    swap(vel);

    u = bind(P.div, vel.tx, vel.ty);
    gl.uniform1i(u.uVelocity ?? null, bindTex(0, vel.read.tex));
    blit(div);

    u = bind(P.clear, vel.tx, vel.ty);
    gl.uniform1i(u.uTex ?? null, bindTex(0, press.read.tex));
    gl.uniform1f(u.uValue ?? null, PRESSURE_DECAY);
    blit(press.write);
    swap(press);

    u = bind(P.press, vel.tx, vel.ty);
    gl.uniform1i(u.uDivergence ?? null, bindTex(0, div.tex));
    for (let i = 0; i < PRESSURE_ITERATIONS; i++) {
      gl.uniform1i(u.uPressure ?? null, bindTex(1, press.read.tex));
      blit(press.write);
      swap(press);
    }

    u = bind(P.grad, vel.tx, vel.ty);
    gl.uniform1i(u.uPressure ?? null, bindTex(0, press.read.tex));
    gl.uniform1i(u.uVelocity ?? null, bindTex(1, vel.read.tex));
    blit(vel.write);
    swap(vel);

    u = bind(P.advect, vel.tx, vel.ty);
    gl.uniform2f(u.uSimTexel ?? null, vel.tx, vel.ty);
    gl.uniform1f(u.uDt ?? null, dt);
    gl.uniform1i(u.uVelocity ?? null, bindTex(0, vel.read.tex));
    gl.uniform1i(u.uSource ?? null, 0);
    gl.uniform1f(u.uDiss ?? null, VELOCITY_DISSIPATION);
    blit(vel.write);
    swap(vel);

    u = bind(P.advect, dye.tx, dye.ty);
    gl.uniform2f(u.uSimTexel ?? null, vel.tx, vel.ty);
    gl.uniform1f(u.uDt ?? null, dt);
    gl.uniform1i(u.uVelocity ?? null, bindTex(0, vel.read.tex));
    gl.uniform1i(u.uSource ?? null, bindTex(1, dye.read.tex));
    gl.uniform1f(u.uDiss ?? null, DYE_DISSIPATION);
    blit(dye.write);
    swap(dye);
  };

  return {
    style: 'fluid',
    step,
    draw() {
      if (!ready) return;
      const u = bind(P.show, 0, 0);
      gl.uniform1i(u.uDye ?? null, bindTex(0, dye.read.tex));
      blit(null);
    },
    setPalette,
    resize(nw, nh) {
      width = nw;
      height = nh;
      // False when the buffers cannot be rebuilt (an incomplete framebuffer at this size, or a lost
      // context): the renderer then falls back to flow.
      ready = init();
      return ready;
    },
    pointer(kind, id, x, y) {
      if (kind === 'down') {
        colorTurn = (colorTurn + 1) % 3;
        const color = new Float32Array(3);
        color[colorTurn] = 0.8;
        const i = pointers.findIndex((q) => q.id === id);
        if (i >= 0) pointers.splice(i, 1);
        pointers.push({ id, x, y, dx: 0, dy: 0, moved: false, color });
      } else if (kind === 'move') {
        const q = pointers.find((p) => p.id === id);
        if (!q) return;
        q.dx = x - q.x;
        q.dy = y - q.y;
        q.x = x;
        q.y = y;
        q.moved = true;
      } else {
        const i = pointers.findIndex((q) => q.id === id);
        if (i >= 0) pointers.splice(i, 1);
      }
    },
    release() {
      ready = false;
      releaseTargets();
      releasePrograms();
    },
  };
}
