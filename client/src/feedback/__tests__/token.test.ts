// The ID token a feedback message carries: only while signed in, and only Firebase's user that is the account's.
import { accountIdToken } from '../token';

const user = (uid: string) => ({ uid, email: `${uid}@example.com` }) as never;

describe('accountIdToken', () => {
  it('is null while signed out or loading, without asking Firebase', async () => {
    const current = jest.fn(async () => ({ uid: 'a', token: 't' }));
    expect(await accountIdToken({ status: 'signedOut', user: null }, current)).toBeNull();
    expect(await accountIdToken({ status: 'loading', user: null }, current)).toBeNull();
    expect(current).not.toHaveBeenCalled();
  });

  it("is the token when Firebase's user is the account's", async () => {
    expect(await accountIdToken({ status: 'signedIn', user: user('a') }, async () => ({ uid: 'a', token: 't' }))).toBe('t');
  });

  it('is null for another user, no user, or a failure', async () => {
    const signedIn = { status: 'signedIn' as const, user: user('a') };
    expect(await accountIdToken(signedIn, async () => ({ uid: 'b', token: 't' }))).toBeNull();
    expect(await accountIdToken(signedIn, async () => null)).toBeNull();
    expect(
      await accountIdToken(signedIn, async () => {
        throw new Error('token service');
      }),
    ).toBeNull();
  });
});
