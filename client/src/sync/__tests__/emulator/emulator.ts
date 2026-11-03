// Emulator helpers (R-6b, orchestrator-owned). The project id is a demo- project, so nothing can reach
// the real Firebase project; the ports match /firebase.json.
import { deleteApp, initializeApp, type FirebaseApp } from 'firebase/app';
import { applyActionCode, sendEmailVerification, type Auth, type User } from 'firebase/auth';
import { connectFirestoreEmulator, getFirestore, terminate, type Firestore } from 'firebase/firestore';

export const PROJECT = 'demo-r6b';
export const FIRESTORE_HOST = '127.0.0.1';
export const FIRESTORE_PORT = 8180;
export const AUTH_URL = 'http://127.0.0.1:9180';

/** Extra claims for a mock ID token. A claim set to undefined is left out of the token. */
export type MockClaims = Record<string, unknown>;

/**
 * A mock ID token for `uid`. It carries email_verified: true, as /firestore.rules require of an owner
 * (email verification, 11-03), unless `claims` overrides it ({ email_verified: false }, or undefined to
 * leave the claim out).
 */
export function mockToken(uid: string, claims: MockClaims = {}) {
  const token: MockClaims = { sub: uid, user_id: uid, email_verified: true, ...claims };
  for (const k of Object.keys(token)) if (token[k] === undefined) delete token[k];
  return token as { sub: string; user_id: string } & MockClaims;
}

const apps: FirebaseApp[] = [];
let n = 0;

/** A Firestore client signed in as `uid` (a mock token, verified email: mockToken), or signed out when uid is null. */
export function dbAs(uid: string | null, claims?: MockClaims): Firestore {
  const app = initializeApp({ projectId: PROJECT, apiKey: 'demo-key' }, `emu-${++n}`);
  apps.push(app);
  const db = getFirestore(app);
  connectFirestoreEmulator(db, FIRESTORE_HOST, FIRESTORE_PORT, uid ? { mockUserToken: mockToken(uid, claims) } : undefined);
  return db;
}

/**
 * Confirms `user`'s email on the Auth emulator the way a user does: sends the verification email, reads
 * the link's oobCode from the emulator, applies it, then reloads the user and forces a new ID token (the
 * email_verified claim changes only in a newly minted token).
 */
export async function verifyEmail(auth: Auth, user: User): Promise<void> {
  await sendEmailVerification(user);
  const res = await fetch(`${AUTH_URL}/emulator/v1/projects/${PROJECT}/oobCodes`);
  if (!res.ok) throw new Error(`oobCodes failed: ${res.status}`);
  const { oobCodes = [] } = (await res.json()) as { oobCodes?: { email: string; oobCode: string; requestType: string }[] };
  const code = oobCodes.filter((c) => c.requestType === 'VERIFY_EMAIL' && c.email === user.email).pop();
  if (!code) throw new Error(`no verification code for ${String(user.email)}`);
  await applyActionCode(auth, code.oobCode);
  await user.reload();
  await user.getIdToken(true);
}

export async function clearFirestore(): Promise<void> {
  const res = await fetch(
    `http://${FIRESTORE_HOST}:${FIRESTORE_PORT}/emulator/v1/projects/${PROJECT}/databases/(default)/documents`,
    { method: 'DELETE' },
  );
  if (!res.ok) throw new Error(`clear failed: ${res.status}`);
}

export async function closeAll(): Promise<void> {
  for (const app of apps.splice(0)) {
    await terminate(getFirestore(app)).catch(() => undefined);
    await deleteApp(app).catch(() => undefined);
  }
}

/** Resolves if the promise rejects with permission-denied; fails the test otherwise. */
export async function denied(p: Promise<unknown>): Promise<void> {
  await expect(p).rejects.toMatchObject({ code: 'permission-denied' });
}
