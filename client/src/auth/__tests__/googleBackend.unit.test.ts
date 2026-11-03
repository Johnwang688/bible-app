// GOOGLE (board 11-03 row 7): the Firebase adapter's Google methods over a mocked SDK and an injected Google window.
// The web window and the web Auth instance: googleWeb.unit.test.ts.
import { createFirebaseAuthBackend } from '../firebaseAuth';
import { mapFirebaseAuthError } from '../firebaseErrors';
import type { GoogleFlow } from '../googlePopup';
import { AuthError } from '../types';

const mockSdk = {
  getAdditionalUserInfo: jest.fn(),
  deleteUser: jest.fn(),
  signOut: jest.fn(),
};

jest.mock('firebase/auth', () => ({
  getAdditionalUserInfo: (...a: unknown[]) => mockSdk.getAdditionalUserInfo(...a),
  deleteUser: (...a: unknown[]) => mockSdk.deleteUser(...a),
  signOut: (...a: unknown[]) => mockSdk.signOut(...a),
  EmailAuthProvider: { credential: jest.fn() },
}));

type FakeAuth = Parameters<typeof createFirebaseAuthBackend>[0];
const fbError = (code: string, extra: object = {}) => Object.assign(new Error(`Firebase: Error (${code}).`), { code, name: 'FirebaseError', ...extra });
// Firebase marks a Gmail address that signs in with Google verified (a trusted provider).
const googleUser = { uid: 'g1', email: 'g@gmail.com', emailVerified: true, providerData: [{ providerId: 'google.com' }] };

function flow(over: Partial<GoogleFlow> = {}): GoogleFlow & { signIn: jest.Mock; reauthenticate: jest.Mock } {
  return {
    signIn: jest.fn(async () => ({ user: googleUser })),
    reauthenticate: jest.fn(async () => ({ user: googleUser })),
    ...over,
  } as GoogleFlow & { signIn: jest.Mock; reauthenticate: jest.Mock };
}

let onLine: PropertyDescriptor | undefined;
beforeEach(() => {
  for (const fn of Object.values(mockSdk)) fn.mockReset();
  mockSdk.getAdditionalUserInfo.mockReturnValue({ isNewUser: false });
  onLine = Object.getOwnPropertyDescriptor(globalThis.navigator ?? {}, 'onLine');
});
afterEach(() => {
  if (onLine) Object.defineProperty(globalThis.navigator, 'onLine', onLine);
  else if (globalThis.navigator) delete (globalThis.navigator as { onLine?: boolean }).onLine;
});
function setOffline() {
  Object.defineProperty(globalThis.navigator, 'onLine', { value: false, configurable: true });
}

describe('signInWithGoogle', () => {
  test('opens the window with the auth and hint, and reports the sign-in methods and the confirmed email', async () => {
    const google = flow();
    const auth = { currentUser: null } as unknown as FakeAuth;
    const user = await createFirebaseAuthBackend(auth, google).signInWithGoogle!({ loginHint: 'g@gmail.com' });
    expect(google.signIn).toHaveBeenCalledWith(auth, 'g@gmail.com');
    expect(user).toEqual({ uid: 'g1', email: 'g@gmail.com', providers: ['google'], emailVerified: true });
  });

  test('maps both methods, sorted; unknown providers are ignored', async () => {
    const google = flow({
      signIn: jest.fn(async () => ({
        user: { uid: 'b', email: 'b@x.com', providerData: [{ providerId: 'google.com' }, { providerId: 'password' }, { providerId: 'phone' }] },
      })) as never,
    });
    const user = await createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth, google).signInWithGoogle!();
    expect(user.providers).toEqual(['google', 'password']);
  });

  test('offline: no window, a network error', async () => {
    setOffline();
    const google = flow();
    await expect(createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth, google).signInWithGoogle!()).rejects.toMatchObject({ kind: 'network' });
    expect(google.signIn).not.toHaveBeenCalled();
  });

  test('existingOnly: a Google account with no app account is removed again, signed out, and refused', async () => {
    mockSdk.getAdditionalUserInfo.mockReturnValue({ isNewUser: true });
    const google = flow();
    const auth = { currentUser: null } as unknown as FakeAuth;
    await expect(createFirebaseAuthBackend(auth, google).signInWithGoogle!({ existingOnly: true })).rejects.toMatchObject({ kind: 'wrong-credentials' });
    expect(mockSdk.deleteUser).toHaveBeenCalledWith(googleUser);
    expect(mockSdk.signOut).toHaveBeenCalledWith(auth);
  });

  test('existingOnly: still refused (and signed out) when removing the new account fails', async () => {
    mockSdk.getAdditionalUserInfo.mockReturnValue({ isNewUser: true });
    mockSdk.deleteUser.mockRejectedValue(fbError('auth/network-request-failed'));
    const warn = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
    const auth = { currentUser: null } as unknown as FakeAuth;
    await expect(createFirebaseAuthBackend(auth, flow()).signInWithGoogle!({ existingOnly: true })).rejects.toMatchObject({ kind: 'wrong-credentials' });
    expect(mockSdk.signOut).toHaveBeenCalledWith(auth);
    warn.mockRestore();
  });

  test('existingOnly: the removal is tried again when it fails (security review G-4)', async () => {
    mockSdk.getAdditionalUserInfo.mockReturnValue({ isNewUser: true });
    mockSdk.deleteUser.mockRejectedValueOnce(fbError('auth/network-request-failed')).mockRejectedValueOnce(fbError('auth/network-request-failed')).mockResolvedValue(undefined);
    const warn = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
    await expect(createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth, flow()).signInWithGoogle!({ existingOnly: true })).rejects.toMatchObject({ kind: 'wrong-credentials' });
    expect(mockSdk.deleteUser).toHaveBeenCalledTimes(3);
    warn.mockRestore();
  });

  test('an existing account is kept with existingOnly; a new one is kept without it', async () => {
    const auth = { currentUser: null } as unknown as FakeAuth;
    await createFirebaseAuthBackend(auth, flow()).signInWithGoogle!({ existingOnly: true });
    mockSdk.getAdditionalUserInfo.mockReturnValue({ isNewUser: true });
    await createFirebaseAuthBackend(auth, flow()).signInWithGoogle!();
    expect(mockSdk.deleteUser).not.toHaveBeenCalled();
  });

  test.each([
    ['auth/popup-closed-by-user', 'cancelled'],
    ['auth/cancelled-popup-request', 'cancelled'],
    ['auth/user-cancelled', 'cancelled'],
    ['auth/popup-blocked', 'popup-blocked'],
    ['auth/network-request-failed', 'network'],
    ['auth/operation-not-allowed', 'unknown'],
    ['auth/unauthorized-domain', 'unknown'],
  ])('%s maps to %s', async (code, kind) => {
    const google = flow({ signIn: jest.fn(async () => Promise.reject(fbError(code))) as never });
    await expect(createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth, google).signInWithGoogle!()).rejects.toMatchObject({ kind });
  });

  test('account-exists carries the email Firebase reports, and only for that kind', async () => {
    const google = flow({
      signIn: jest.fn(async () => Promise.reject(fbError('auth/account-exists-with-different-credential', { customData: { email: 'pat@example.com' } }))) as never,
    });
    const e = await createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth, google).signInWithGoogle!().catch((x: unknown) => x);
    expect(e).toBeInstanceOf(AuthError);
    expect(e).toMatchObject({ kind: 'account-exists', email: 'pat@example.com' });
    expect(mapFirebaseAuthError(fbError('auth/invalid-credential', { customData: { email: 'x@y.z' } })).email).toBeUndefined();
  });
});

describe('reauthenticateWithGoogle', () => {
  test('proves the signed-in user through the window', async () => {
    const google = flow();
    const auth = { currentUser: googleUser } as unknown as FakeAuth;
    await createFirebaseAuthBackend(auth, google).reauthenticateWithGoogle!('g@gmail.com');
    expect(google.reauthenticate).toHaveBeenCalledWith(googleUser, 'g@gmail.com');
  });

  test("Firebase's user-mismatch (another Google account) is wrong-credentials", async () => {
    const google = flow({ reauthenticate: jest.fn(async () => Promise.reject(fbError('auth/user-mismatch'))) as never });
    await expect(createFirebaseAuthBackend({ currentUser: googleUser } as unknown as FakeAuth, google).reauthenticateWithGoogle!()).rejects.toMatchObject({
      kind: 'wrong-credentials',
    });
  });

  test('a result for another uid is refused too', async () => {
    const google = flow({ reauthenticate: jest.fn(async () => ({ user: { ...googleUser, uid: 'other' } })) as never });
    await expect(createFirebaseAuthBackend({ currentUser: googleUser } as unknown as FakeAuth, google).reauthenticateWithGoogle!()).rejects.toMatchObject({
      kind: 'wrong-credentials',
    });
  });

  test('nobody signed in, or offline: refused before the window opens', async () => {
    const google = flow();
    await expect(createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth, google).reauthenticateWithGoogle!()).rejects.toMatchObject({ kind: 'unknown' });
    setOffline();
    await expect(createFirebaseAuthBackend({ currentUser: googleUser } as unknown as FakeAuth, google).reauthenticateWithGoogle!()).rejects.toMatchObject({ kind: 'network' });
    expect(google.reauthenticate).not.toHaveBeenCalled();
  });
});
