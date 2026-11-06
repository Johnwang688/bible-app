// Google sign-in on iOS and Android: not yet (it needs EAS builds and a native Google sign-in module). The button
// is hidden there (googleFlag.ts); this refuses anything that gets here anyway.
import type { Auth, User, UserCredential } from 'firebase/auth';

import { AuthError } from './types';

export interface GoogleFlow {
  signIn(auth: Auth, loginHint?: string): Promise<UserCredential>;
  reauthenticate(user: User, loginHint?: string): Promise<UserCredential>;
}

const unsupported = () => Promise.reject(new AuthError('unknown', 'Google sign-in is web only for now'));

export const googlePopupFlow: GoogleFlow = { signIn: unsupported, reauthenticate: unsupported };
