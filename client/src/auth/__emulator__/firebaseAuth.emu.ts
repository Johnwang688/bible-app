// Acceptance tests for the Firebase Auth adapter against the Auth emulator (R-6b, orchestrator-owned;
// the implementer may not edit them). Run: npm run test:emulator
import { deleteApp, initializeApp } from 'firebase/app';
import { connectAuthEmulator, getAuth } from 'firebase/auth';

import { createFirebaseAuthBackend } from '../firebaseAuth';
import type { AuthBackend, AuthUser } from '../types';

const PROJECT = 'demo-r6b';
const AUTH_URL = 'http://127.0.0.1:9180';

let backend: AuthBackend;
const app = initializeApp({ projectId: PROJECT, apiKey: 'demo-key', authDomain: 'demo-r6b.firebaseapp.com' }, 'auth-emu');

beforeAll(() => {
  const auth = getAuth(app);
  connectAuthEmulator(auth, AUTH_URL, { disableWarnings: true });
  backend = createFirebaseAuthBackend(auth);
});
beforeEach(async () => {
  await backend.signOut();
  const res = await fetch(`${AUTH_URL}/emulator/v1/projects/${PROJECT}/accounts`, { method: 'DELETE' });
  if (!res.ok) throw new Error(`clear failed: ${res.status}`);
});
afterAll(async () => {
  await backend.signOut();
  await deleteApp(app);
});

const pw = { kind: 'password' as const, email: 'alice@example.com', password: 'correct horse' };

test('sign up, sign out, sign in; the state listener follows', async () => {
  const seen: (AuthUser | null)[] = [];
  const off = backend.onAuthStateChanged((u) => seen.push(u));
  const created = await backend.signUp(pw.email, pw.password);
  expect(created.email).toBe(pw.email);
  expect(backend.currentUser()?.uid).toBe(created.uid);
  await backend.signOut();
  expect(backend.currentUser()).toBeNull();
  expect(await backend.getIdToken()).toBeNull();
  const again = await backend.signIn(pw);
  expect(again.uid).toBe(created.uid);
  const token = await backend.getIdToken(true);
  expect(typeof token).toBe('string');
  await new Promise((r) => setTimeout(r, 50));
  off();
  expect(seen.some((u) => u?.uid === created.uid)).toBe(true);
  expect(seen).toContain(null);
});

test('errors map to AuthError kinds without enumeration', async () => {
  await backend.signUp(pw.email, pw.password);
  await backend.signOut();
  await expect(backend.signIn({ ...pw, password: 'wrong password' })).rejects.toMatchObject({ kind: 'wrong-credentials' });
  await expect(backend.signIn({ ...pw, email: 'nobody@example.com' })).rejects.toMatchObject({ kind: 'wrong-credentials' });
  await expect(backend.signIn({ ...pw, email: 'not an email' })).rejects.toMatchObject({ kind: 'invalid-email' });
  await expect(backend.signUp(pw.email, 'another one')).rejects.toMatchObject({ kind: 'email-in-use' });
  await expect(backend.signUp('bob@example.com', '123')).rejects.toMatchObject({ kind: 'weak-password' });
});

test('password reset resolves whether or not the account exists', async () => {
  await backend.signUp(pw.email, pw.password);
  await backend.signOut();
  await expect(backend.sendPasswordReset(pw.email)).resolves.toBeUndefined();
  await expect(backend.sendPasswordReset('nobody@example.com')).resolves.toBeUndefined();
  await expect(backend.sendPasswordReset('not an email')).rejects.toMatchObject({ kind: 'invalid-email' });
});

test('reauthenticate checks the password and refreshes auth_time', async () => {
  await backend.signUp(pw.email, pw.password);
  await expect(backend.reauthenticate({ ...pw, password: 'wrong password' })).rejects.toMatchObject({ kind: 'wrong-credentials' });
  const before = await backend.getIdToken(true);
  await new Promise((r) => setTimeout(r, 1100));
  await backend.reauthenticate(pw);
  const after = await backend.getIdToken();
  const authTime = (t: string | null) => JSON.parse(Buffer.from(t!.split('.')[1]!, 'base64url').toString()).auth_time as number;
  expect(authTime(after)).toBeGreaterThan(authTime(before));
});
