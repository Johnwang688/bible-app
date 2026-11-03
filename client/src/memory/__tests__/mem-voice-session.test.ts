// Which ID tokens are the same sign-in session (SM-1): a voice result is applied only while the session is still the
// one its request went out with; Firebase's hourly refresh of the same user keeps it.
import { sameSession, tokenSubject } from '../voice/session';

const b64url = (text: string): string =>
  Buffer.from(text, 'utf8').toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
const jwt = (payload: object): string => `${b64url('{"alg":"RS256","typ":"JWT"}')}.${b64url(JSON.stringify(payload))}.sig`;

it('reads the sub claim of a JWT', () => {
  expect(tokenSubject(jwt({ sub: 'alice', iat: 1 }))).toBe('alice');
  expect(tokenSubject(jwt({ sub: 'ü-user' }))).toBe('ü-user');
});

it.each([['not a jwt'], ['a.b'], ['a.!!!.c'], [`x.${b64url('not json')}.y`], [jwt({ uid: 'alice' })], [jwt({ sub: '' })], [jwt({ sub: 7 })]])(
  'no subject in %s',
  (token) => {
    expect(tokenSubject(token)).toBeNull();
  },
);

it('equal tokens, and null with null, are the same session', () => {
  expect(sameSession('opaque', 'opaque')).toBe(true);
  expect(sameSession(null, null)).toBe(true);
});

it('a refreshed token of the same user is the same session', () => {
  expect(sameSession(jwt({ sub: 'alice', iat: 1 }), jwt({ sub: 'alice', iat: 3601 }))).toBe(true);
});

it('another user, a sign-out, a sign-in or two different opaque tokens are not', () => {
  expect(sameSession(jwt({ sub: 'alice' }), jwt({ sub: 'bob' }))).toBe(false);
  expect(sameSession(jwt({ sub: 'alice' }), null)).toBe(false);
  expect(sameSession(null, jwt({ sub: 'alice' }))).toBe(false);
  expect(sameSession('old-token', 'new-token')).toBe(false);
  expect(sameSession(jwt({ sub: 'alice' }), 'opaque')).toBe(false);
});
