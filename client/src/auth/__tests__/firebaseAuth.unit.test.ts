// Unit tests for the Firebase Auth adapter over a mocked modular SDK, and the account API's timeout.
import { createAccountApi } from '../accountApi';
import { createFirebaseAuthBackend } from '../firebaseAuth';
import { AuthError } from '../types';

const mockSdk = {
  signInWithEmailAndPassword: jest.fn(),
  createUserWithEmailAndPassword: jest.fn(),
  signOut: jest.fn(),
  sendPasswordResetEmail: jest.fn(),
  reauthenticateWithCredential: jest.fn(),
  getIdToken: jest.fn(),
  onAuthStateChanged: jest.fn(),
  onIdTokenChanged: jest.fn(),
  reload: jest.fn(),
  sendEmailVerification: jest.fn(),
  verifyBeforeUpdateEmail: jest.fn(),
  credential: jest.fn((email: string, password: string) => ({ email, password })),
};

jest.mock('firebase/auth', () => ({
  signInWithEmailAndPassword: (...a: unknown[]) => mockSdk.signInWithEmailAndPassword(...a),
  createUserWithEmailAndPassword: (...a: unknown[]) => mockSdk.createUserWithEmailAndPassword(...a),
  signOut: (...a: unknown[]) => mockSdk.signOut(...a),
  sendPasswordResetEmail: (...a: unknown[]) => mockSdk.sendPasswordResetEmail(...a),
  reauthenticateWithCredential: (...a: unknown[]) => mockSdk.reauthenticateWithCredential(...a),
  getIdToken: (...a: unknown[]) => mockSdk.getIdToken(...a),
  onAuthStateChanged: (...a: unknown[]) => mockSdk.onAuthStateChanged(...a),
  onIdTokenChanged: (...a: unknown[]) => mockSdk.onIdTokenChanged(...a),
  reload: (...a: unknown[]) => mockSdk.reload(...a),
  sendEmailVerification: (...a: unknown[]) => mockSdk.sendEmailVerification(...a),
  verifyBeforeUpdateEmail: (...a: unknown[]) => mockSdk.verifyBeforeUpdateEmail(...a),
  EmailAuthProvider: { credential: (e: string, p: string) => mockSdk.credential(e, p) },
}));

const fbError = (code: string) => Object.assign(new Error(`Firebase: Error (${code}).`), { code, name: 'FirebaseError' });

type FakeAuth = Parameters<typeof createFirebaseAuthBackend>[0];
const fbUser = { uid: 'u1', email: 'a@example.com' };
/** What the adapter reports for fbUser: emailVerified is always a boolean (this backend verifies emails). */
const mapped = { ...fbUser, emailVerified: false };

beforeEach(() => {
  for (const fn of Object.values(mockSdk)) fn.mockReset();
  mockSdk.credential.mockImplementation((email: string, password: string) => ({ email, password }));
});

describe('createFirebaseAuthBackend', () => {
  test('sign in trims the email and returns the user', async () => {
    mockSdk.signInWithEmailAndPassword.mockResolvedValue({ user: { ...fbUser, extra: 1 } });
    const auth = { currentUser: null } as unknown as FakeAuth;
    const user = await createFirebaseAuthBackend(auth).signIn({ kind: 'password', email: '  a@example.com ', password: 'pw' });
    expect(user).toEqual(mapped);
    expect(mockSdk.signInWithEmailAndPassword).toHaveBeenCalledWith(auth, 'a@example.com', 'pw');
  });

  test('rejections become AuthErrors', async () => {
    mockSdk.signInWithEmailAndPassword.mockRejectedValue(fbError('auth/invalid-credential'));
    mockSdk.createUserWithEmailAndPassword.mockRejectedValue(fbError('auth/email-already-in-use'));
    mockSdk.signOut.mockRejectedValue(new Error('boom'));
    const backend = createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth);
    await expect(backend.signIn({ kind: 'password', email: 'a@example.com', password: 'x' })).rejects.toMatchObject({ kind: 'wrong-credentials' });
    await expect(backend.signUp('a@example.com', 'x')).rejects.toMatchObject({ kind: 'email-in-use' });
    const e = await backend.signOut().catch((err: unknown) => err);
    expect(e).toBeInstanceOf(AuthError);
    expect((e as AuthError).kind).toBe('unknown');
  });

  test('password reset: an unknown email succeeds, other errors map', async () => {
    const backend = createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth);
    mockSdk.sendPasswordResetEmail.mockRejectedValueOnce(fbError('auth/user-not-found'));
    await expect(backend.sendPasswordReset(' who@example.com ')).resolves.toBeUndefined();
    expect(mockSdk.sendPasswordResetEmail.mock.calls[0]![1]).toBe('who@example.com');
    mockSdk.sendPasswordResetEmail.mockRejectedValueOnce(fbError('auth/invalid-email'));
    await expect(backend.sendPasswordReset('x@y')).rejects.toMatchObject({ kind: 'invalid-email' });
    mockSdk.sendPasswordResetEmail.mockClear();
    await expect(backend.sendPasswordReset('not an email')).rejects.toMatchObject({ kind: 'invalid-email' });
    expect(mockSdk.sendPasswordResetEmail).not.toHaveBeenCalled();
  });

  test('reauthenticate uses an email credential for the current user; signed out rejects', async () => {
    const auth = { currentUser: fbUser } as unknown as FakeAuth;
    mockSdk.reauthenticateWithCredential.mockResolvedValue(undefined);
    await createFirebaseAuthBackend(auth).reauthenticate({ kind: 'password', email: ' a@example.com', password: 'pw' });
    expect(mockSdk.reauthenticateWithCredential).toHaveBeenCalledWith(fbUser, { email: 'a@example.com', password: 'pw' });
    const signedOut = createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth);
    await expect(signedOut.reauthenticate({ kind: 'password', email: 'a@example.com', password: 'pw' })).rejects.toBeInstanceOf(AuthError);
  });

  test('getIdToken is null when signed out and passes forceRefresh through', async () => {
    mockSdk.getIdToken.mockResolvedValue('tok');
    expect(await createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth).getIdToken(true)).toBeNull();
    const backend = createFirebaseAuthBackend({ currentUser: fbUser } as unknown as FakeAuth);
    expect(await backend.getIdToken(true)).toBe('tok');
    expect(mockSdk.getIdToken).toHaveBeenCalledWith(fbUser, true);
  });

  test('onAuthStateChanged maps users and returns the unsubscribe', () => {
    const off = jest.fn();
    const offToken = jest.fn();
    let cb: (u: unknown) => void = () => undefined;
    let tokenCb: (u: unknown) => void = () => undefined;
    mockSdk.onAuthStateChanged.mockImplementation((_auth: unknown, l: (u: unknown) => void) => {
      cb = l;
      return off;
    });
    mockSdk.onIdTokenChanged.mockImplementation((_auth: unknown, l: (u: unknown) => void) => {
      tokenCb = l;
      return offToken;
    });
    const seen: unknown[] = [];
    const unsubscribe = createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth).onAuthStateChanged((u) => seen.push(u));
    cb({ ...fbUser, providerData: [] });
    cb(null);
    // A new ID token reports the user again (a confirmed email shows); a null token report is left to the first.
    tokenCb({ ...fbUser, emailVerified: true, metadata: { creationTime: 'Tue, 03 Nov 2026 10:00:00 GMT' } });
    tokenCb(null);
    expect(seen).toEqual([mapped, null, { ...fbUser, emailVerified: true, createdAt: Date.parse('2026-11-03T10:00:00Z') }]);
    unsubscribe();
    expect(off).toHaveBeenCalled();
    expect(offToken).toHaveBeenCalled();
  });

  test('the verification actions: languageCode and continue URL, mapped errors, reload', async () => {
    const user = { ...fbUser, emailVerified: false };
    const auth = { currentUser: user, languageCode: null } as unknown as FakeAuth & { languageCode: string | null };
    const backend = createFirebaseAuthBackend(auth);
    expect(backend.verifiesEmail).toBe(true);

    mockSdk.sendEmailVerification.mockResolvedValue(undefined);
    await backend.sendEmailVerification!({ url: 'https://x.test/me?verified=1', languageCode: 'zh-CN' });
    expect(mockSdk.sendEmailVerification).toHaveBeenCalledWith(user, { url: 'https://x.test/me?verified=1' });
    expect(auth.languageCode).toBe('zh-CN');

    mockSdk.verifyBeforeUpdateEmail.mockRejectedValue(fbError('auth/invalid-new-email'));
    const bad = await backend.verifyBeforeUpdateEmail!(' new@x.test ', { url: 'u', languageCode: 'en' }).catch((e: unknown) => e);
    expect(mockSdk.verifyBeforeUpdateEmail).toHaveBeenCalledWith(user, 'new@x.test', { url: 'u' });
    expect((bad as AuthError).kind).toBe('invalid-email');

    mockSdk.reload.mockImplementation(async (u: { emailVerified: boolean }) => {
      u.emailVerified = true;
    });
    expect(await backend.reload!()).toEqual({ ...fbUser, emailVerified: true });

    mockSdk.reload.mockRejectedValue(fbError('auth/user-token-expired'));
    const gone = await backend.reload!().catch((e: unknown) => e);
    expect((gone as AuthError).code).toBe('auth/user-token-expired');

    // An emailVerified that is not exactly true is unconfirmed.
    (auth as unknown as { currentUser: unknown }).currentUser = { ...fbUser, emailVerified: 'true' };
    expect(backend.currentUser()).toEqual(mapped);
  });
});

describe('account API timeout', () => {
  test('a request that outlives the timeout is aborted as network', async () => {
    const fetch = jest.fn(
      (_url: string, init?: RequestInit) =>
        new Promise<Response>((_resolve, reject) => {
          init?.signal?.addEventListener('abort', () => reject(new Error('aborted')));
        }),
    );
    const api = createAccountApi({ baseUrl: 'http://api.test/', fetch: fetch as unknown as typeof globalThis.fetch, timeoutMs: 10 });
    await expect(api.deleteAccount('tok')).rejects.toMatchObject({ kind: 'network' });
    expect(fetch.mock.calls[0]![0]).toBe('http://api.test/api/v1/account');
  });

  test('200 is not the agreed success status', async () => {
    const fetch = jest.fn(async () => ({ ok: true, status: 200, json: async () => ({}) }) as Response);
    await expect(createAccountApi({ baseUrl: 'http://api.test', fetch }).deleteAccount('tok')).rejects.toMatchObject({ kind: 'unknown' });
  });
});
