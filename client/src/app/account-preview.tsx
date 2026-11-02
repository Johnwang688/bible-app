// A dev aid for the account card and its sheets (R-6b): the card on a bare screen, so the web e2e suite can
// open the sheets without the Me tab. It runs its own AccountProvider over an inert auth backend that never
// reaches Firebase and a remote that refuses everything, so this route can never create an account or sync,
// even in a production build (the app's own provider stays closed: SIGN_IN_OFF). R-6a mounts the card on Me;
// this route may be deleted then.
import { useMemo } from 'react';

import { AccountProvider } from '../auth/AccountProvider';
import { AccountCard } from '../auth/components/AccountCard';
import { ALWAYS_ALLOWED } from '../auth/signInGate';
import { AuthError, type AuthBackend } from '../auth/types';
import { Screen } from '../components/Screen';
import { RemoteError, type RemoteStore } from '../sync/types';

const refuse = async (): Promise<never> => {
  throw new AuthError('network');
};

function inertAuth(): AuthBackend {
  return {
    currentUser: () => null,
    onAuthStateChanged(listener) {
      queueMicrotask(() => listener(null));
      return () => undefined;
    },
    signIn: refuse,
    signUp: refuse,
    signOut: async () => undefined,
    sendPasswordReset: refuse,
    reauthenticate: refuse,
    getIdToken: async () => null,
  };
}

const offline = async (): Promise<never> => {
  throw new RemoteError('offline');
};
const inertRemote: RemoteStore = {
  pullItems: offline,
  pushItems: offline,
  pullDevices: offline,
  pushDevice: offline,
  pullSettings: offline,
  pushSettings: offline,
};

export default function AccountPreview() {
  const auth = useMemo(() => inertAuth(), []);
  return (
    <AccountProvider
      auth={auth}
      remoteFor={() => inertRemote}
      signInGate={ALWAYS_ALLOWED}
      deleteAccountRequest={refuse}
    >
      <Screen titleKey="screen.me.title" testID="screen-account-preview">
        <AccountCard />
      </Screen>
    </AccountProvider>
  );
}
