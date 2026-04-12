export const AUTH_SESSION_STORAGE_KEY = 'bible-app-auth-session';

export interface AuthSession {
  accessToken: string;
  refreshToken: string;
  userId: string;
  email: string;
}

export interface AccountProfile {
  id: string;
  email: string;
  display_name: string | null;
  avatar_url: string | null;
  preferred_translation: string;
  preferred_language: string;
}

export interface SyncedStudyItem {
  id?: number;
  user_id?: string;
  translation: string;
  book_number: number;
  chapter: number;
  verse_start: number;
  verse_end?: number | null;
  kind: 'highlight' | 'bookmark' | 'note';
  color?: string | null;
  note?: string | null;
}

export interface SyncedReadingProgress {
  translation: string;
  book_number: number;
  chapter: number;
  last_verse: number;
}

export interface SyncedRecentPassage {
  book: string;
  chapter: number;
  translation: string;
  saved_at: number;
}

export type SyncedFontScale =
  | '8'
  | '10'
  | '12'
  | '14'
  | '16'
  | '18'
  | '20'
  | '22'
  | '24'
  | '26'
  | '28'
  | '30';
export type SyncedLineHeight = '1.5' | '2' | '2.5';
export type SyncedReaderFont =
  | 'georgia'
  | 'charter'
  | 'palatino'
  | 'garamond'
  | 'times'
  | 'sans'
  | 'openSans'
  | 'dyslexie';
export type SyncedHighlightColor =
  | 'yellow'
  | 'amber'
  | 'green'
  | 'blue'
  | 'pink'
  | 'lavender'
  | 'mint';
export type SyncedReadingMode =
  | 'single'
  | 'book'
  | 'paged-single'
  | 'paged-double';

export interface SyncedUserSettings {
  user_id?: string;
  theme: string;
  font_scale: SyncedFontScale;
  line_height: SyncedLineHeight;
  reduced_motion: boolean;
  page_flip_enabled: boolean;
  default_panel: 'none' | 'commentary' | 'ai' | 'study';
  side_panel_position: 'left' | 'right';
  /** Absent on older API responses; client defaults to Georgia / yellow. */
  reader_font?: SyncedReaderFont;
  highlight_color?: SyncedHighlightColor;
  reading_mode?: SyncedReadingMode;
  recent_passages: SyncedRecentPassage[];
}

interface RawAuthResponse {
  access_token: string;
  refresh_token: string;
  user_id: string;
  email: string;
}

function toSession(payload: RawAuthResponse): AuthSession {
  return {
    accessToken: payload.access_token,
    refreshToken: payload.refresh_token,
    userId: payload.user_id,
    email: payload.email,
  };
}

function formatApiError(payload: unknown, status: number): string {
  if (payload && typeof payload === 'object' && 'detail' in payload) {
    const detail = (payload as { detail?: unknown }).detail;
    if (typeof detail === 'string') return detail;
    if (Array.isArray(detail)) {
      const parts = detail.map((item: unknown) => {
        if (item && typeof item === 'object' && 'msg' in item) {
          return String((item as { msg: unknown }).msg);
        }
        return typeof item === 'string' ? item : JSON.stringify(item);
      });
      return parts.filter(Boolean).join(' ') || `Request failed: ${status}`;
    }
  }
  return `Request failed: ${status}`;
}

async function request<T>(
  path: string,
  init?: RequestInit,
  accessToken?: string,
): Promise<T> {
  const headers = new Headers(init?.headers ?? {});
  if (!headers.has('Content-Type') && init?.body) headers.set('Content-Type', 'application/json');
  if (accessToken) headers.set('Authorization', `Bearer ${accessToken}`);
  const response = await fetch(path, { ...init, headers });
  if (!response.ok) {
    const payload = await response.json().catch(() => null);
    throw new Error(formatApiError(payload, response.status));
  }
  if (response.status === 204) return undefined as T;
  return response.json() as Promise<T>;
}

function parseStoredSession(raw: string | null): AuthSession | null {
  if (!raw) return null;
  try {
    const parsed = JSON.parse(raw) as AuthSession;
    return parsed?.accessToken && parsed?.refreshToken ? parsed : null;
  } catch {
    return null;
  }
}

/** Restores session from localStorage (remember-me / legacy) or sessionStorage (this browser session only). */
export function restoreAuthSession(): AuthSession | null {
  if (typeof window === 'undefined') return null;
  return (
    parseStoredSession(window.localStorage.getItem(AUTH_SESSION_STORAGE_KEY))
    ?? parseStoredSession(window.sessionStorage.getItem(AUTH_SESSION_STORAGE_KEY))
  );
}

/**
 * Persists auth tokens. Use `remember: true` for localStorage (survives browser restarts),
 * `remember: false` for sessionStorage (cleared when the tab/window session ends).
 * Omit `remember` when refreshing tokens to keep the same storage as the active session.
 */
export function persistAuthSession(session: AuthSession | null, remember?: boolean) {
  if (typeof window === 'undefined') return;
  if (!session) {
    window.localStorage.removeItem(AUTH_SESSION_STORAGE_KEY);
    window.sessionStorage.removeItem(AUTH_SESSION_STORAGE_KEY);
    return;
  }
  const payload = JSON.stringify(session);
  let useLocal: boolean;
  if (remember === true) useLocal = true;
  else if (remember === false) useLocal = false;
  else {
    if (window.localStorage.getItem(AUTH_SESSION_STORAGE_KEY)) useLocal = true;
    else if (window.sessionStorage.getItem(AUTH_SESSION_STORAGE_KEY)) useLocal = false;
    else useLocal = true;
  }
  if (useLocal) {
    window.localStorage.setItem(AUTH_SESSION_STORAGE_KEY, payload);
    window.sessionStorage.removeItem(AUTH_SESSION_STORAGE_KEY);
  } else {
    window.sessionStorage.setItem(AUTH_SESSION_STORAGE_KEY, payload);
    window.localStorage.removeItem(AUTH_SESSION_STORAGE_KEY);
  }
}

export async function signUp(email: string, password: string, displayName?: string) {
  const response = await request<RawAuthResponse>('/api/v1/auth/signup', {
    method: 'POST',
    body: JSON.stringify({ email, password, display_name: displayName || null }),
  });
  return toSession(response);
}

export async function signIn(email: string, password: string) {
  const response = await request<RawAuthResponse>('/api/v1/auth/signin', {
    method: 'POST',
    body: JSON.stringify({ email, password }),
  });
  return toSession(response);
}

export async function refreshSession(session: AuthSession) {
  const response = await request<RawAuthResponse>('/api/v1/auth/refresh', {
    method: 'POST',
    body: JSON.stringify({ refresh_token: session.refreshToken }),
  });
  return toSession(response);
}

export async function signOut(session: AuthSession) {
  await request<void>('/api/v1/auth/signout', { method: 'POST' }, session.accessToken);
}

export async function getProfile(session: AuthSession) {
  return request<AccountProfile>('/api/v1/me', undefined, session.accessToken);
}

export async function updateProfile(session: AuthSession, payload: Partial<AccountProfile>) {
  return request<AccountProfile>('/api/v1/me', {
    method: 'PATCH',
    body: JSON.stringify(payload),
  }, session.accessToken);
}

export async function getStudyItems(session: AuthSession) {
  return request<SyncedStudyItem[]>('/api/v1/study-items', undefined, session.accessToken);
}

export async function putStudyItems(session: AuthSession, payload: SyncedStudyItem[]) {
  return request<SyncedStudyItem[]>('/api/v1/study-items', {
    method: 'PUT',
    body: JSON.stringify(payload),
  }, session.accessToken);
}

export async function getReadingProgress(session: AuthSession) {
  return request<SyncedReadingProgress[]>('/api/v1/reading-progress', undefined, session.accessToken);
}

export async function putReadingProgress(session: AuthSession, payload: SyncedReadingProgress[]) {
  return request<SyncedReadingProgress[]>('/api/v1/reading-progress', {
    method: 'PUT',
    body: JSON.stringify(payload),
  }, session.accessToken);
}

export async function getUserSettings(session: AuthSession) {
  return request<SyncedUserSettings>('/api/v1/user-settings', undefined, session.accessToken);
}

export async function putUserSettings(session: AuthSession, payload: SyncedUserSettings) {
  return request<SyncedUserSettings>('/api/v1/user-settings', {
    method: 'PUT',
    body: JSON.stringify(payload),
  }, session.accessToken);
}
