// A dev aid for the account card and its sheets (R-6b): the card on a bare screen, so the web e2e suite can
// open the sheets without the Me tab. It runs its own AccountProvider over an inert auth backend that never
// reaches Firebase and a remote that refuses everything, so this route can never create an account or sync,
// even in a production build (the app's own provider stays closed: SIGN_IN_OFF). R-6a mounts the card on Me;
// this route may be deleted then.
//
// Its provider keeps its state in a memory store of its own, so the preview never writes the device store.
// `?u13offer=1` shows the Under 13 offer (FOLLOW-UP item 2): sign-in off and an offer for a made-up account; its
// delete fails like any request here (the inert backend), and "Not now" drops it until the page reloads.
import { useLocalSearchParams } from 'expo-router';
import { useMemo } from 'react';

import { AccountProvider } from '../auth/AccountProvider';
import { AccountCard } from '../auth/components/AccountCard';
import { ALWAYS_ALLOWED, SIGN_IN_OFF } from '../auth/signInGate';
import { AuthError, type AuthBackend } from '../auth/types';
import { recordUnder13Offer } from '../auth/under13Offer';
import { Screen } from '../components/Screen';
import { createStorage, memoryBackend } from '../storage/storage';
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
  const { u13offer } = useLocalSearchParams<{ u13offer?: string }>();
  const offer = u13offer === '1';
  const auth = useMemo(() => inertAuth(), []);
  const storage = useMemo(() => {
    const store = createStorage(memoryBackend());
    if (offer) recordUnder13Offer(store, { uid: 'preview-account', email: 'preview@example.com' });
    return store;
  }, [offer]);
  return (
    <AccountProvider
      // The provider reads its dependencies once: a new store (the query changed) needs a new provider.
      key={offer ? 'offer' : 'plain'}
      auth={auth}
      storage={storage}
      remoteFor={() => inertRemote}
      signInGate={offer ? SIGN_IN_OFF : ALWAYS_ALLOWED}
      deleteAccountRequest={refuse}
    >
      <Screen titleKey="screen.me.title" testID="screen-account-preview">
        <AccountCard />
      </Screen>
    </AccountProvider>
  );
}
