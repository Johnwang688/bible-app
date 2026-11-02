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
  EmailAuthProvider: { credential: (e: string, p: string) => mockSdk.credential(e, p) },
}));

const fbError = (code: string) => Object.assign(new Error(`Firebase: Error (${code}).`), { code, name: 'FirebaseError' });

type FakeAuth = Parameters<typeof createFirebaseAuthBackend>[0];
const fbUser = { uid: 'u1', email: 'a@example.com' };

beforeEach(() => {
  for (const fn of Object.values(mockSdk)) fn.mockReset();
  mockSdk.credential.mockImplementation((email: string, password: string) => ({ email, password }));
});

describe('createFirebaseAuthBackend', () => {
  test('sign in trims the email and returns the user', async () => {
    mockSdk.signInWithEmailAndPassword.mockResolvedValue({ user: { ...fbUser, extra: 1 } });
    const auth = { currentUser: null } as unknown as FakeAuth;
    const user = await createFirebaseAuthBackend(auth).signIn({ kind: 'password', email: '  a@example.com ', password: 'pw' });
    expect(user).toEqual(fbUser);
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
    let cb: (u: unknown) => void = () => undefined;
    mockSdk.onAuthStateChanged.mockImplementation((_auth: unknown, l: (u: unknown) => void) => {
      cb = l;
      return off;
    });
    const seen: unknown[] = [];
    const unsubscribe = createFirebaseAuthBackend({ currentUser: null } as unknown as FakeAuth).onAuthStateChanged((u) => seen.push(u));
    cb({ ...fbUser, providerData: [] });
    cb(null);
    expect(seen).toEqual([fbUser, null]);
    unsubscribe();
    expect(off).toHaveBeenCalled();
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
