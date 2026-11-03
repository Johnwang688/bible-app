// The backend's account endpoints (R-6b): "delete my data". The ID token goes in the Authorization
// header and is never logged. The App Check token (web only; null on native for now) goes in
// X-Firebase-AppCheck when there is one; without one the request still goes (the backend is in monitor
// mode, docs/app-check.md).
import { AuthError } from './types';

export const ACCOUNT_REQUEST_TIMEOUT_MS = 15_000;
/** How long a request waits for an App Check token (including starting App Check) before it goes without one. */
export const APP_CHECK_TOKEN_TIMEOUT_MS = 3_000;

export interface AccountApiOptions {
  /** The backend base URL without a trailing slash (api/config.ts `getApiBaseUrl`). */
  baseUrl: string;
  /** Called with a string URL; `globalThis.fetch` by default. */
  fetch?: (url: string, init?: RequestInit) => Promise<Response>;
  timeoutMs?: number;
  /**
   * The App Check token for the request; null or a rejection sends no header. Defaults to
   * `getAppCheckTokenForRequest` from ./appCheck, loaded only when a request is made (loading this file loads
   * nothing from Firebase); on the web it starts App Check first, so a call made signed out (the Under 13
   * delete, which never creates Firestore) carries a token too.
   */
  appCheckToken?: () => Promise<string | null>;
}

export interface AccountApi {
  /** Deletes the signed-in account and its synced data. Rejects with AuthError. */
  deleteAccount(idToken: string): Promise<void>;
}

async function detailOf(res: Response): Promise<unknown> {
  try {
    const body: unknown = await res.json();
    return body && typeof body === 'object' ? (body as { detail?: unknown }).detail : undefined;
  } catch {
    return undefined;
  }
}

function defaultAppCheckToken(): Promise<string | null> {
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  const appCheck = require('./appCheck') as Partial<typeof import('./appCheck')>;
  // Web: starts App Check, then the token; native: null. A module without it (a test double) gives its token.
  const source = appCheck.getAppCheckTokenForRequest ?? appCheck.getAppCheckToken;
  return source ? source() : Promise.resolve(null);
}

/**
 * The App Check token, or null; never rejects and waits at most APP_CHECK_TOKEN_TIMEOUT_MS (a failing or
 * slow provider means "no header", not "no request").
 */
async function appCheckTokenOf(source: () => Promise<string | null>): Promise<string | null> {
  let timer: ReturnType<typeof setTimeout> | undefined;
  const timeout = new Promise<null>((resolve) => {
    timer = setTimeout(() => resolve(null), APP_CHECK_TOKEN_TIMEOUT_MS);
  });
  const token = (async () => {
    try {
      const value = await source();
      return typeof value === 'string' && value.trim() !== '' ? value : null;
    } catch {
      return null;
    }
  })();
  try {
    return await Promise.race([token, timeout]);
  } finally {
    clearTimeout(timer);
  }
}

export function createAccountApi(opts: AccountApiOptions): AccountApi {
  const baseUrl = opts.baseUrl.replace(/\/+$/, '');
  const timeoutMs = opts.timeoutMs ?? ACCOUNT_REQUEST_TIMEOUT_MS;

  return {
    async deleteAccount(idToken) {
      const doFetch = opts.fetch ?? globalThis.fetch;
      const headers: Record<string, string> = { Authorization: `Bearer ${idToken}` };
      const appCheckToken = await appCheckTokenOf(opts.appCheckToken ?? defaultAppCheckToken);
      if (appCheckToken) headers['X-Firebase-AppCheck'] = appCheckToken;
      const controller = new AbortController();
      const timer = setTimeout(() => controller.abort(), timeoutMs);
      let res: Response;
      try {
        res = await doFetch(`${baseUrl}/api/v1/account`, {
          method: 'DELETE',
          headers,
          signal: controller.signal,
        });
      } catch (e) {
        throw new AuthError('network', controller.signal.aborted ? 'delete account timed out' : 'delete account failed', { cause: e });
      } finally {
        clearTimeout(timer);
      }
      if (res.status === 204) return;
      if (res.status === 403 && (await detailOf(res)) === 'recent-login-required') {
        throw new AuthError('requires-recent-login');
      }
      throw new AuthError('unknown', `delete account failed: HTTP ${res.status}`);
    },
  };
}
