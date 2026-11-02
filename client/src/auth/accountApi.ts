// The backend's account endpoints (R-6b): "delete my data". The ID token goes in the Authorization
// header and is never logged.
import { AuthError } from './types';

export const ACCOUNT_REQUEST_TIMEOUT_MS = 15_000;

export interface AccountApiOptions {
  /** The backend base URL without a trailing slash (api/config.ts `getApiBaseUrl`). */
  baseUrl: string;
  fetch?: typeof fetch;
  timeoutMs?: number;
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

export function createAccountApi(opts: AccountApiOptions): AccountApi {
  const baseUrl = opts.baseUrl.replace(/\/+$/, '');
  const timeoutMs = opts.timeoutMs ?? ACCOUNT_REQUEST_TIMEOUT_MS;

  return {
    async deleteAccount(idToken) {
      const doFetch = opts.fetch ?? globalThis.fetch;
      const controller = new AbortController();
      const timer = setTimeout(() => controller.abort(), timeoutMs);
      let res: Response;
      try {
        res = await doFetch(`${baseUrl}/api/v1/account`, {
          method: 'DELETE',
          headers: { Authorization: `Bearer ${idToken}` },
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
