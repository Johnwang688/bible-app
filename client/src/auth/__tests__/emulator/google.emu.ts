// GOOGLE (board 11-03 row 7): the Firebase adapter's Google methods against the Auth emulator. The emulator has no
// Google window, so the injected GoogleFlow signs in with an unsigned fake Google ID token (the emulator accepts
// one: `GoogleAuthProvider.credential('{"sub":…,"email":…}')`); everything after the window is real Firebase.
// Run: firebase emulators:exec --only firestore,auth --project demo-r6b "jest -c <config matching *.emu.ts>"
import { deleteApp, initializeApp } from 'firebase/app';
import {
  connectAuthEmulator,
  getAdditionalUserInfo,
  getAuth,
  GoogleAuthProvider,
  reauthenticateWithCredential,
  signInWithCredential,
  signOut,
  type Auth,
} from 'firebase/auth';

import { createFirebaseAuthBackend } from '../../firebaseAuth';
import type { GoogleFlow } from '../../googlePopup';
import type { AuthBackend } from '../../types';

const PROJECT = 'demo-r6b';
const AUTH_URL = 'http://127.0.0.1:9180';

/** Who the fake Google window picks next. */
let picked = { sub: 'g-gina', email: 'gina@gmail.com' };
const idToken = () => JSON.stringify({ sub: picked.sub, email: picked.email, email_verified: true });

const fakeWindow: GoogleFlow = {
  signIn: (auth) => signInWithCredential(auth, GoogleAuthProvider.credential(idToken())),
  reauthenticate: (user) => reauthenticateWithCredential(user, GoogleAuthProvider.credential(idToken())),
};

let auth: Auth;
let backend: AuthBackend;
const app = initializeApp({ projectId: PROJECT, apiKey: 'demo-key', authDomain: 'demo-r6b.firebaseapp.com' }, 'google-emu');

beforeAll(() => {
  auth = getAuth(app);
  connectAuthEmulator(auth, AUTH_URL, { disableWarnings: true });
  backend = createFirebaseAuthBackend(auth, fakeWindow);
});
beforeEach(async () => {
  await backend.signOut();
  picked = { sub: 'g-gina', email: 'gina@gmail.com' };
  const res = await fetch(`${AUTH_URL}/emulator/v1/projects/${PROJECT}/accounts`, { method: 'DELETE' });
  if (!res.ok) throw new Error(`clear failed: ${res.status}`);
});
afterAll(async () => {
  await backend.signOut();
  await deleteApp(app);
});

/** Whether the emulator has an account for the picked Google identity (a raw sign-in that reports isNewUser). */
async function googleAccountExists(): Promise<boolean> {
  const cred = await signInWithCredential(auth, GoogleAuthProvider.credential(idToken()));
  const isNew = getAdditionalUserInfo(cred)?.isNewUser ?? false;
  await signOut(auth);
  return !isNew;
}

test('a first Google sign-in creates the account; the next one signs in to it', async () => {
  const first = await backend.signInWithGoogle!();
  expect(first).toMatchObject({ email: 'gina@gmail.com', providers: ['google'] });
  await backend.signOut();
  const again = await backend.signInWithGoogle!();
  expect(again.uid).toBe(first.uid);
  expect(typeof (await backend.getIdToken(true))).toBe('string');
});

test('existingOnly: a Google identity with no account is refused and leaves no account behind', async () => {
  await expect(backend.signInWithGoogle!({ existingOnly: true })).rejects.toMatchObject({ kind: 'wrong-credentials' });
  expect(backend.currentUser()).toBeNull();
  expect(await googleAccountExists()).toBe(false);
});

test('existingOnly: an existing Google account signs in', async () => {
  const created = await backend.signInWithGoogle!();
  await backend.signOut();
  const again = await backend.signInWithGoogle!({ existingOnly: true });
  expect(again.uid).toBe(created.uid);
});

/** Signs in with a password over REST (a second device): its refresh token. */
async function restPasswordSession(email: string, password: string): Promise<string> {
  const res = await fetch(`${AUTH_URL}/identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=demo-key`, {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify({ email, password, returnSecureToken: true }),
  });
  if (!res.ok) throw new Error(`REST sign-in failed: ${res.status}`);
  return ((await res.json()) as { refreshToken: string }).refreshToken;
}

/** Whether a refresh token still gets an ID token (the session is alive). */
async function refreshes(refreshToken: string): Promise<boolean> {
  const res = await fetch(`${AUTH_URL}/securetoken.googleapis.com/v1/token?key=demo-key`, {
    method: 'POST',
    headers: { 'content-type': 'application/x-www-form-urlencoded' },
    body: `grant_type=refresh_token&refresh_token=${encodeURIComponent(refreshToken)}`,
  });
  return res.ok;
}

// What Firebase does when a Google identity signs in with the email of an existing password account. The app never
// verifies emails at sign-up, so that account's email is unverified, and Firebase (one account per email) lets the
// verified Google identity take the account over: same uid, the password unlinked. It raises
// auth/account-exists-with-different-credential only when the existing account's email is verified, which this app
// does not do today (the prototype's state 5 and the UI handle that error for when it does, and for providers Google
// is not authoritative for). These tests pin the behaviour the PR describes.
test('an unverified password account with the same email is taken over by Google: same uid, password unlinked', async () => {
  const pat = await backend.signUp('pat@gmail.com', 'correct horse');
  await backend.signOut();
  picked = { sub: 'g-pat', email: 'pat@gmail.com' };
  const viaGoogle = await backend.signInWithGoogle!();
  // Firebase marks the email verified (Google is trusted for @gmail.com), so the account syncs without Confirm your email.
  expect(viaGoogle).toMatchObject({ uid: pat.uid, email: 'pat@gmail.com', providers: ['google'], emailVerified: true });
  await backend.signOut();
  await expect(backend.signIn({ kind: 'password', email: 'pat@gmail.com', password: 'correct horse' })).rejects.toMatchObject({ kind: 'wrong-credentials' });
});

test('pre-registration: a session made with the password before the Google takeover', async () => {
  // Someone registers the victim's Gmail address with a password (the app does not verify emails) and keeps a session.
  const squatter = await backend.signUp('victim@gmail.com', 'squatter password');
  await backend.signOut();
  const squatterSession = await restPasswordSession('victim@gmail.com', 'squatter password');
  expect(await refreshes(squatterSession)).toBe(true);
  // The real owner then signs in with Google and gets the same account.
  picked = { sub: 'g-victim', email: 'victim@gmail.com' };
  const owner = await backend.signInWithGoogle!();
  expect(owner.uid).toBe(squatter.uid);
  // Recorded, not asserted either way: whether the squatter's session survives the takeover on the emulator.
  // The PR reports the value seen here (see the console line).
  console.log(`[google.emu] squatter session alive after the Google takeover: ${await refreshes(squatterSession)}`);
});

test('re-auth with Google: the same account passes; another Google account is wrong-credentials', async () => {
  await backend.signInWithGoogle!();
  await expect(backend.reauthenticateWithGoogle!('gina@gmail.com')).resolves.toBeUndefined();
  await backend.signInWithGoogle!(); // still gina
  picked = { sub: 'g-other', email: 'other@gmail.com' };
  await expect(backend.reauthenticateWithGoogle!()).rejects.toMatchObject({ kind: 'wrong-credentials' });
  expect(backend.currentUser()?.email).toBe('gina@gmail.com');
});
