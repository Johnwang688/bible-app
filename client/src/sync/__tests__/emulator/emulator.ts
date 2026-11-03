// Emulator helpers (R-6b, orchestrator-owned). The project id is a demo- project, so nothing can reach
// the real Firebase project; the ports match /firebase.json.
import { deleteApp, initializeApp, type FirebaseApp } from 'firebase/app';
import { connectFirestoreEmulator, getFirestore, terminate, type Firestore } from 'firebase/firestore';

export const PROJECT = 'demo-r6b';
export const FIRESTORE_HOST = '127.0.0.1';
export const FIRESTORE_PORT = 8180;

const apps: FirebaseApp[] = [];
let n = 0;

/** A Firestore client signed in as `uid` (a mock token), or signed out when uid is null. */
export function dbAs(uid: string | null): Firestore {
  const app = initializeApp({ projectId: PROJECT, apiKey: 'demo-key' }, `emu-${++n}`);
  apps.push(app);
  const db = getFirestore(app);
  connectFirestoreEmulator(db, FIRESTORE_HOST, FIRESTORE_PORT, uid ? { mockUserToken: { sub: uid, user_id: uid } } : undefined);
  return db;
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
