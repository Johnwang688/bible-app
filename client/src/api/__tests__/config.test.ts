// Acceptance (orchestrator-owned, B-1): build-time public config from EXPO_PUBLIC_* vars.
import { readFileSync } from 'node:fs';
import path from 'node:path';

import { getApiBaseUrl, getFirebaseWebConfig, isBetaBuild, PUBLIC_ENV_VARS } from '../config';

const VARS = [
  'EXPO_PUBLIC_API_BASE_URL',
  'EXPO_PUBLIC_RELEASE_CHANNEL',
  'EXPO_PUBLIC_FIREBASE_API_KEY',
  'EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN',
  'EXPO_PUBLIC_FIREBASE_PROJECT_ID',
  'EXPO_PUBLIC_FIREBASE_APP_ID',
  'EXPO_PUBLIC_FIREBASE_STORAGE_BUCKET',
  'EXPO_PUBLIC_FIREBASE_MESSAGING_SENDER_ID',
] as const;

const saved: Record<string, string | undefined> = {};
const savedNodeEnv = process.env.NODE_ENV;

beforeEach(() => {
  for (const v of VARS) {
    saved[v] = process.env[v];
    delete process.env[v];
  }
});

afterEach(() => {
  for (const v of VARS) {
    if (saved[v] === undefined) delete process.env[v];
    else process.env[v] = saved[v];
  }
  (process.env as Record<string, string | undefined>).NODE_ENV = savedNodeEnv;
});

function setNodeEnv(value: string) {
  (process.env as Record<string, string | undefined>).NODE_ENV = value;
}

const FIREBASE_REQUIRED = {
  EXPO_PUBLIC_FIREBASE_API_KEY: 'AIza-test-key',
  EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN: 'demo.firebaseapp.com',
  EXPO_PUBLIC_FIREBASE_PROJECT_ID: 'demo',
  EXPO_PUBLIC_FIREBASE_APP_ID: '1:1:web:abc',
};

describe('getApiBaseUrl', () => {
  it('falls back to the local backend outside production builds', () => {
    setNodeEnv('development');
    expect(getApiBaseUrl()).toBe('http://localhost:8000');
    setNodeEnv('test');
    process.env.EXPO_PUBLIC_API_BASE_URL = '   ';
    expect(getApiBaseUrl()).toBe('http://localhost:8000');
  });

  it('trims the value and drops trailing slashes', () => {
    process.env.EXPO_PUBLIC_API_BASE_URL = '  https://api.example.test//  ';
    expect(getApiBaseUrl()).toBe('https://api.example.test');
  });

  it('keeps a port', () => {
    process.env.EXPO_PUBLIC_API_BASE_URL = 'http://127.0.0.1:8000/';
    expect(getApiBaseUrl()).toBe('http://127.0.0.1:8000');
  });

  it('refuses a production build with no API URL instead of calling localhost', () => {
    setNodeEnv('production');
    expect(() => getApiBaseUrl()).toThrow(/EXPO_PUBLIC_API_BASE_URL/);
    process.env.EXPO_PUBLIC_API_BASE_URL = '';
    expect(() => getApiBaseUrl()).toThrow(/EXPO_PUBLIC_API_BASE_URL/);
  });

  it('requires https in a production build, except for a local backend', () => {
    setNodeEnv('production');
    process.env.EXPO_PUBLIC_API_BASE_URL = 'http://api.example.test';
    expect(() => getApiBaseUrl()).toThrow(/https/);
    process.env.EXPO_PUBLIC_API_BASE_URL = 'https://api.example.test';
    expect(getApiBaseUrl()).toBe('https://api.example.test');
    process.env.EXPO_PUBLIC_API_BASE_URL = 'http://localhost:8000';
    expect(getApiBaseUrl()).toBe('http://localhost:8000');
    process.env.EXPO_PUBLIC_API_BASE_URL = 'http://127.0.0.1:8000';
    expect(getApiBaseUrl()).toBe('http://127.0.0.1:8000');
  });

  it.each([
    'not a url',
    'ftp://api.example.test',
    'https://api.example.test/api/v1',
    'https://api.example.test?x=1',
    'https://api.example.test#top',
    'https://user:pw@api.example.test',
    'api.example.test',
  ])('rejects %j: the value must be a bare http(s) origin', (value) => {
    process.env.EXPO_PUBLIC_API_BASE_URL = value;
    expect(() => getApiBaseUrl()).toThrow(/EXPO_PUBLIC_API_BASE_URL/);
  });
});

describe('getFirebaseWebConfig', () => {
  it('is null when no Firebase var is set (auth is optional)', () => {
    expect(getFirebaseWebConfig()).toBeNull();
  });

  it('returns the config when the required vars are set', () => {
    Object.assign(process.env, FIREBASE_REQUIRED);
    expect(getFirebaseWebConfig()).toEqual({
      apiKey: 'AIza-test-key',
      authDomain: 'demo.firebaseapp.com',
      projectId: 'demo',
      appId: '1:1:web:abc',
    });
  });

  it('includes the optional vars when set, trimmed', () => {
    Object.assign(process.env, FIREBASE_REQUIRED, {
      EXPO_PUBLIC_FIREBASE_STORAGE_BUCKET: ' demo.firebasestorage.app ',
      EXPO_PUBLIC_FIREBASE_MESSAGING_SENDER_ID: '593',
    });
    expect(getFirebaseWebConfig()).toEqual({
      apiKey: 'AIza-test-key',
      authDomain: 'demo.firebaseapp.com',
      projectId: 'demo',
      appId: '1:1:web:abc',
      storageBucket: 'demo.firebasestorage.app',
      messagingSenderId: '593',
    });
  });

  it('throws, naming what is missing, when the config is only partly set', () => {
    process.env.EXPO_PUBLIC_FIREBASE_API_KEY = 'AIza-test-key';
    process.env.EXPO_PUBLIC_FIREBASE_PROJECT_ID = 'demo';
    process.env.EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN = '  ';
    expect(() => getFirebaseWebConfig()).toThrow(/EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN/);
    expect(() => getFirebaseWebConfig()).toThrow(/EXPO_PUBLIC_FIREBASE_APP_ID/);
  });

  it('does not count an optional var alone as a partial config', () => {
    process.env.EXPO_PUBLIC_FIREBASE_STORAGE_BUCKET = 'demo.firebasestorage.app';
    expect(getFirebaseWebConfig()).toBeNull();
  });
});

describe('isBetaBuild', () => {
  it('is true only for the beta release channel', () => {
    expect(isBetaBuild()).toBe(false);
    process.env.EXPO_PUBLIC_RELEASE_CHANNEL = 'beta';
    expect(isBetaBuild()).toBe(true);
    process.env.EXPO_PUBLIC_RELEASE_CHANNEL = ' beta ';
    expect(isBetaBuild()).toBe(true);
    process.env.EXPO_PUBLIC_RELEASE_CHANNEL = 'production';
    expect(isBetaBuild()).toBe(false);
    process.env.EXPO_PUBLIC_RELEASE_CHANNEL = '';
    expect(isBetaBuild()).toBe(false);
  });
});

describe('Expo inlining', () => {
  // Expo inlines EXPO_PUBLIC_* only for literal `process.env.NAME` reads; destructuring or
  // `process.env[name]` silently ships `undefined` in the bundle.
  const source = readFileSync(path.join(__dirname, '..', 'config.ts'), 'utf8');

  it('lists every public var it reads', () => {
    expect([...PUBLIC_ENV_VARS].sort()).toEqual([...VARS].sort());
  });

  it.each(VARS)('reads %s as a literal process.env member', (name) => {
    expect(source).toContain(`process.env.${name}`);
  });

  it('never reads process.env dynamically or by destructuring', () => {
    expect(source).not.toMatch(/process\.env\s*\[/);
    expect(source).not.toMatch(/\}\s*=\s*process\.env\b/);
    expect(source).not.toMatch(/\.\.\.\s*process\.env\b/);
  });
});
