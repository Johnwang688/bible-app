// Build-time public config. Expo inlines `EXPO_PUBLIC_*` only where the source says literally
// `process.env.EXPO_PUBLIC_NAME`, so every var below is read with its own member expression, at call
// time. Never read the env object by computed key, destructuring or spread here: the bundle would ship
// `undefined`.

const DEFAULT_API_BASE_URL = 'http://localhost:8000';
const API_VAR = 'EXPO_PUBLIC_API_BASE_URL';

/** Every public build var the app reads (the keys allowed in `client/.env.production`). */
export const PUBLIC_ENV_VARS = [
  'EXPO_PUBLIC_API_BASE_URL',
  'EXPO_PUBLIC_RELEASE_CHANNEL',
  'EXPO_PUBLIC_FIREBASE_API_KEY',
  'EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN',
  'EXPO_PUBLIC_FIREBASE_PROJECT_ID',
  'EXPO_PUBLIC_FIREBASE_APP_ID',
  'EXPO_PUBLIC_FIREBASE_STORAGE_BUCKET',
  'EXPO_PUBLIC_FIREBASE_MESSAGING_SENDER_ID',
] as const;

/** Trim an already-read env value; blank counts as unset. */
function clean(value: string | undefined): string | undefined {
  const trimmed = value?.trim();
  return trimmed ? trimmed : undefined;
}

/**
 * Backend origin from `EXPO_PUBLIC_API_BASE_URL`. Unset falls back to the local backend, except in a
 * production build, where it throws. The value must be a bare http(s) origin; a production build
 * accepts plain http only for a local backend.
 */
export function getApiBaseUrl(): string {
  const raw = clean(process.env.EXPO_PUBLIC_API_BASE_URL);
  const production = process.env.NODE_ENV === 'production';
  if (raw === undefined) {
    if (production) {
      throw new Error(`${API_VAR} is not set; a production build must name its backend (https origin).`);
    }
    return DEFAULT_API_BASE_URL;
  }

  const value = raw.replace(/\/+$/, '');
  const invalid = (why: string) => new Error(`${API_VAR} ${why}: got ${JSON.stringify(raw)}.`);

  let url: URL;
  try {
    url = new URL(value);
  } catch {
    throw invalid('is not a valid URL');
  }
  if (url.protocol !== 'http:' && url.protocol !== 'https:') {
    throw invalid('must use http: or https:');
  }
  if (url.username !== '' || url.password !== '') {
    throw invalid('must not contain a username or password');
  }
  if (url.pathname !== '/' || url.search !== '' || url.hash !== '' || /[?#]/.test(value)) {
    throw invalid('must be a bare origin (no path, query or hash)');
  }
  if (production && url.protocol === 'http:' && url.hostname !== 'localhost' && url.hostname !== '127.0.0.1') {
    throw invalid('must use https in a production build (http is allowed only for localhost and 127.0.0.1)');
  }
  return url.origin;
}

/** The public Firebase web app config (identifiers, not secrets). */
export interface FirebaseWebConfig {
  apiKey: string;
  authDomain: string;
  projectId: string;
  appId: string;
  storageBucket?: string;
  messagingSenderId?: string;
}

/**
 * Firebase web config from the `EXPO_PUBLIC_FIREBASE_*` vars: `null` when none of the required four is
 * set (auth is optional), an `Error` naming every missing one when only some are.
 */
export function getFirebaseWebConfig(): FirebaseWebConfig | null {
  const apiKey = clean(process.env.EXPO_PUBLIC_FIREBASE_API_KEY);
  const authDomain = clean(process.env.EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN);
  const projectId = clean(process.env.EXPO_PUBLIC_FIREBASE_PROJECT_ID);
  const appId = clean(process.env.EXPO_PUBLIC_FIREBASE_APP_ID);
  const storageBucket = clean(process.env.EXPO_PUBLIC_FIREBASE_STORAGE_BUCKET);
  const messagingSenderId = clean(process.env.EXPO_PUBLIC_FIREBASE_MESSAGING_SENDER_ID);

  const required = [
    ['EXPO_PUBLIC_FIREBASE_API_KEY', apiKey],
    ['EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN', authDomain],
    ['EXPO_PUBLIC_FIREBASE_PROJECT_ID', projectId],
    ['EXPO_PUBLIC_FIREBASE_APP_ID', appId],
  ] as const;
  const missing = required.filter(([, v]) => v === undefined).map(([name]) => name);
  if (missing.length === required.length) return null;
  if (missing.length > 0) {
    throw new Error(`Firebase web config is incomplete; missing ${missing.join(', ')}.`);
  }

  const config: FirebaseWebConfig = {
    apiKey: apiKey!,
    authDomain: authDomain!,
    projectId: projectId!,
    appId: appId!,
  };
  if (storageBucket !== undefined) config.storageBucket = storageBucket;
  if (messagingSenderId !== undefined) config.messagingSenderId = messagingSenderId;
  return config;
}

/** True for the web beta build (`EXPO_PUBLIC_RELEASE_CHANNEL=beta`). */
export function isBetaBuild(): boolean {
  return clean(process.env.EXPO_PUBLIC_RELEASE_CHANNEL) === 'beta';
}
