const DEFAULT_API_BASE_URL = 'http://localhost:8000';

/** Backend base URL from `EXPO_PUBLIC_API_BASE_URL`, without a trailing slash. */
export function getApiBaseUrl(): string {
  const raw = process.env.EXPO_PUBLIC_API_BASE_URL;
  const url = raw && raw.trim() !== '' ? raw.trim() : DEFAULT_API_BASE_URL;
  return url.replace(/\/+$/, '');
}
