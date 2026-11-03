// The ID token a feedback message carries when the account is signed in: Firebase's current user's, and only while
// that user is the account's (as memory/voice/accountAuth.tsx does). Firebase is loaded only when a signed-in send
// asks for it, so the signed-out web app and jest never load it from here.
import type { AccountState } from '../auth';

export type AccountTokenView = Pick<AccountState, 'status' | 'user'>;

export interface CurrentUserToken {
  uid: string;
  token: string;
}

async function firebaseCurrentToken(): Promise<CurrentUserToken | null> {
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  const { getFirebaseAuth } = require('../auth/firebaseApp') as typeof import('../auth/firebaseApp');
  const user = getFirebaseAuth().currentUser;
  if (!user) return null;
  return { uid: user.uid, token: await user.getIdToken() };
}

/** The account's ID token, or null when signed out, when Firebase's user is someone else, or on any failure. */
export async function accountIdToken(
  account: AccountTokenView,
  currentToken: () => Promise<CurrentUserToken | null> = firebaseCurrentToken,
): Promise<string | null> {
  if (account.status !== 'signedIn' || account.user === null) return null;
  try {
    const got = await currentToken();
    return got !== null && got.uid === account.user.uid ? got.token : null;
  } catch {
    return null;
  }
}
