// Acceptance (orchestrator-owned, B-1): the web beta's public build config (client/.env.production)
// and its Firebase Hosting config (the `hosting` key of the repo-root firebase.json).
import { readFileSync } from 'node:fs';
import path from 'node:path';

import { getApiBaseUrl, getFirebaseWebConfig, isBetaBuild, PUBLIC_ENV_VARS } from '../api/config';

const CLIENT = path.join(__dirname, '..', '..');
const REPO = path.join(CLIENT, '..');

function readEnvFile(file: string): Record<string, string> {
  const out: Record<string, string> = {};
  for (const raw of readFileSync(file, 'utf8').split(/\r?\n/)) {
    const line = raw.trim();
    if (line === '' || line.startsWith('#')) continue;
    const eq = line.indexOf('=');
    if (eq < 1) throw new Error(`not KEY=VALUE: ${line}`);
    out[line.slice(0, eq).trim()] = line.slice(eq + 1).trim();
  }
  return out;
}

const env = readEnvFile(path.join(CLIENT, '.env.production'));
const firebaseJson: any = JSON.parse(readFileSync(path.join(REPO, 'firebase.json'), 'utf8'));
const hosting = firebaseJson.hosting;

describe('client/.env.production', () => {
  it('holds only EXPO_PUBLIC_* vars that the config module reads', () => {
    const keys = Object.keys(env);
    expect(keys.length).toBeGreaterThan(0);
    for (const k of keys) {
      expect(k).toMatch(/^EXPO_PUBLIC_[A-Z0-9_]+$/);
      expect(PUBLIC_ENV_VARS).toContain(k);
    }
  });

  it('holds no secrets', () => {
    for (const [k, v] of Object.entries(env)) {
      expect(k).not.toMatch(/SECRET|PRIVATE|PASSWORD|SERVICE_ACCOUNT|TOKEN|CREDENTIAL/i);
      expect(v).not.toMatch(/-----BEGIN|private_key|client_secret|sk-[A-Za-z0-9]/);
    }
  });

  it('points at the Cloud Run backend over https and marks the build as beta', () => {
    expect(env.EXPO_PUBLIC_API_BASE_URL).toMatch(/^https:\/\/[a-z0-9-]+\.us-central1\.run\.app$/);
    expect(env.EXPO_PUBLIC_RELEASE_CHANNEL).toBe('beta');
    expect(env.EXPO_PUBLIC_FIREBASE_PROJECT_ID).toBe('bible-app-492520');
    expect(env.EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN).toBe('bible-app-492520.firebaseapp.com');
  });

  it('resolves through the config module as a production build would', () => {
    const before = { ...process.env };
    try {
      Object.assign(process.env, env);
      (process.env as Record<string, string | undefined>).NODE_ENV = 'production';
      expect(getApiBaseUrl()).toBe(env.EXPO_PUBLIC_API_BASE_URL);
      expect(getFirebaseWebConfig()).toMatchObject({ projectId: 'bible-app-492520' });
      expect(isBetaBuild()).toBe(true);
    } finally {
      for (const k of Object.keys(process.env)) if (!(k in before)) delete process.env[k];
      Object.assign(process.env, before);
    }
  });
});

// ---- Firebase Hosting ----

/** Firebase-style glob for a request path: `**` spans segments, `*` stays in one, `@(a|b)` alternates. */
function globToRegExp(glob: string): RegExp {
  let re = '';
  for (let i = 0; i < glob.length; i++) {
    const c = glob[i]!;
    if (c === '*' && glob[i + 1] === '*') {
      i++;
      if (glob[i + 1] === '/') {
        i++;
        re += '(?:.*/)?';
      } else re += '.*';
    } else if (c === '*') re += '[^/]*';
    else if (c === '?') re += '[^/]';
    else if (c === '@' && glob[i + 1] === '(') {
      const end = glob.indexOf(')', i);
      re += `(?:${glob.slice(i + 2, end).split('|').map(escape).join('|')})`;
      i = end;
    } else re += escape(c);
  }
  return new RegExp(`^${re}$`);
}
function escape(s: string) {
  return s.replace(/[.+^${}()|[\]\\]/g, '\\$&');
}
function matches(rule: any, p: string): boolean {
  if (typeof rule.regex === 'string') return new RegExp(rule.regex).test(p);
  return globToRegExp(rule.source.startsWith('/') || rule.source.startsWith('*') ? rule.source : `/${rule.source}`).test(p);
}

/** Headers for a request path: every matching rule applies in order, a later rule overriding an earlier one per header. */
function headersFor(p: string): Record<string, string> {
  const out: Record<string, string> = {};
  for (const rule of hosting.headers ?? []) {
    if (!matches(rule, p)) continue;
    for (const h of rule.headers) out[h.key.toLowerCase()] = h.value;
  }
  return out;
}

const HTML_PATHS = ['/', '/index.html', '/privacy', '/bible', '/me/about'];
const HASHED_PATHS = [
  '/_expo/static/js/web/entry-fe40062b80d9a32cde8e3855bc88af62.js',
  '/assets/node_modules/@expo-google-fonts/literata/400Regular/Literata_400Regular.6e7a16b655c266b0278e1de57045a4e5.ttf',
  '/assets/___bible-app/.claude/worktrees/x/client/node_modules/@expo-google-fonts/literata/400Regular/Literata_400Regular.6e7a16b655c266b0278e1de57045a4e5.ttf',
];

function csp(): Map<string, string[]> {
  const value = headersFor('/')['content-security-policy'];
  expect(value).toBeDefined();
  const map = new Map<string, string[]>();
  for (const part of value!.split(';')) {
    const [name, ...sources] = part.trim().split(/\s+/);
    if (name) map.set(name.toLowerCase(), sources);
  }
  return map;
}

describe('firebase.json hosting', () => {
  it('serves the Expo web export from client/dist', () => {
    expect(hosting).toBeDefined();
    expect(hosting.public).toBe('client/dist');
  });

  it('ignores none of the exported files (asset paths contain node_modules and dot folders)', () => {
    // The CLI skips a matching folder with everything in it, so check every ancestor folder too.
    const files = ['index.html', 'favicon.ico', ...HASHED_PATHS.map((p) => p.slice(1))];
    const entries = new Set<string>();
    for (const f of files) {
      const parts = f.split('/');
      for (let i = 1; i <= parts.length; i++) entries.add(parts.slice(0, i).join('/'));
    }
    for (const pattern of hosting.ignore ?? []) {
      const re = globToRegExp(pattern);
      for (const e of entries) expect({ pattern, entry: e, ignored: re.test(e) }).toEqual({ pattern, entry: e, ignored: false });
    }
  });

  it('falls back to index.html for every route (single-page export)', () => {
    const rewrites = hosting.rewrites ?? [];
    expect(rewrites[rewrites.length - 1]).toEqual({ source: '**', destination: '/index.html' });
  });

  it.each(HTML_PATHS)('never caches the HTML at %s', (p) => {
    expect(headersFor(p)['cache-control']).toMatch(/no-cache|no-store/);
  });

  it.each(HASHED_PATHS)('caches hashed assets for a year: %s', (p) => {
    expect(headersFor(p)['cache-control']).toBe('public, max-age=31536000, immutable');
  });

  it.each([...HTML_PATHS, ...HASHED_PATHS])('sends the security headers on %s', (p) => {
    const h = headersFor(p);
    expect(h['x-content-type-options']).toBe('nosniff');
    expect(h['referrer-policy']).toBe('strict-origin-when-cross-origin');
  });

  it.each(HTML_PATHS)('sends the CSP on %s', (p) => {
    expect(headersFor(p)['content-security-policy']).toBe(headersFor('/')['content-security-policy']);
  });

  it('CSP: locks scripts, objects, framing and the base URL down', () => {
    const d = csp();
    expect(d.get('default-src')).toEqual(["'self'"]);
    expect(d.get('script-src')).toContain("'self'");
    expect(d.get('script-src')).not.toContain("'unsafe-eval'");
    expect(d.get('script-src')).not.toContain("'unsafe-inline'");
    expect(d.get('object-src')).toEqual(["'none'"]);
    expect(d.get('base-uri')).toEqual(["'self'"]);
    expect(d.get('frame-ancestors')).toEqual(["'none'"]);
    for (const [name, sources] of d) {
      for (const s of sources) {
        expect({ name, s, wild: s === '*' || s === 'http:' || s === 'https:' || s.startsWith('http://') }).toEqual({ name, s, wild: false });
      }
    }
  });

  it('CSP: allows the API origin from .env.production, and Firebase Auth and Firestore', () => {
    const connect = csp().get('connect-src') ?? [];
    expect(connect).toContain("'self'");
    expect(connect).toContain(env.EXPO_PUBLIC_API_BASE_URL);
    expect(connect).toEqual(
      expect.arrayContaining([
        'https://identitytoolkit.googleapis.com',
        'https://securetoken.googleapis.com',
        'https://firestore.googleapis.com',
      ]),
    );
    expect(csp().get('frame-src')).toContain(`https://${env.EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN}`);
  });

  it('CSP: allows Google Fonts (the Chinese Scripture font on the web)', () => {
    const d = csp();
    expect(d.get('style-src')).toContain('https://fonts.googleapis.com');
    expect(d.get('font-src')).toEqual(expect.arrayContaining(["'self'", 'https://fonts.gstatic.com']));
  });
});

describe('the glob helper bites', () => {
  it('matches like Firebase Hosting globs', () => {
    expect(globToRegExp('**').test('/privacy')).toBe(true);
    expect(globToRegExp('/_expo/**').test('/_expo/static/js/web/a.js')).toBe(true);
    expect(globToRegExp('/_expo/**').test('/privacy')).toBe(false);
    expect(globToRegExp('**/*.@(js|css)').test('/a/b.js')).toBe(true);
    expect(globToRegExp('**/*.@(js|css)').test('/a/b.html')).toBe(false);
    expect(globToRegExp('**/node_modules/**').test('assets/node_modules/x.ttf')).toBe(true);
    expect(globToRegExp('**/.*').test('assets/.claude')).toBe(true);
    expect(globToRegExp('**/.*').test('assets/.claude/x/Literata.6e7a.ttf')).toBe(false);
    expect(globToRegExp('firebase.json').test('firebase.json')).toBe(true);
  });
});
