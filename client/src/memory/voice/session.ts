// Whether two Firebase ID tokens belong to the same sign-in session (one user). Firebase refreshes the ID token every
// hour, so a voice result whose request went out with the previous token of the same user is still that user's; one
// sent with another user's token, or before a sign-out, is not. Kept here (not in auth/) so the Memory voice code needs
// nothing from the account provider, which pulls in the sync engine.

const B64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

/** base64url (no padding) to a byte string; null when it isn't base64url. */
function decodeBase64Url(input: string): string | null {
  const text = input.replace(/-/g, '+').replace(/_/g, '/');
  if (!/^[A-Za-z0-9+/]*$/.test(text) || text.length % 4 === 1) return null;
  let bits = 0;
  let value = 0;
  let out = '';
  for (const ch of text) {
    value = (value << 6) | B64.indexOf(ch);
    bits += 6;
    if (bits >= 8) {
      bits -= 8;
      out += String.fromCharCode((value >> bits) & 0xff);
    }
  }
  return out;
}

/** The `sub` claim (the Firebase uid) of a JWT, or null when the token is not a decodable JWT with one. */
export function tokenSubject(token: string): string | null {
  const parts = token.split('.');
  if (parts.length !== 3) return null;
  const bytes = decodeBase64Url(parts[1]!);
  if (bytes === null) return null;
  try {
    // The payload is UTF-8 JSON: percent-escape the bytes so decodeURIComponent reads them as UTF-8.
    const json = decodeURIComponent(Array.from(bytes, (c) => `%${c.charCodeAt(0).toString(16).padStart(2, '0')}`).join(''));
    const payload: unknown = JSON.parse(json);
    const sub = typeof payload === 'object' && payload !== null ? (payload as { sub?: unknown }).sub : undefined;
    return typeof sub === 'string' && sub !== '' ? sub : null;
  } catch {
    return null;
  }
}

/**
 * Whether `sent` (the token a request went out with) and `current` (the token now) are the same session: equal, or
 * both decodable JWTs with the same `sub`. Null is the signed-out session: it matches only null.
 */
export function sameSession(sent: string | null, current: string | null): boolean {
  if (sent === null || current === null) return sent === current;
  if (sent === current) return true;
  const a = tokenSubject(sent);
  return a !== null && a === tokenSubject(current);
}
