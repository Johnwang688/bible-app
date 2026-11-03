// A dev aid for the email-verification states (11-03), like account-preview: the account card and Home's banner over
// an inert auth backend that "is signed in" as a made-up, unconfirmed account and refuses every request (no
// Firebase, no network), with a remote that refuses everything, so this route can never send an email, change an
// account or sync, even in a production build. Its provider keeps its state in a memory store of its own.
//
// `?state=new` (default): an account made by this app's sign-up, link sent. `?state=paused`: an account made before
// verification shipped, never sent a link. `?state=pending`: a change of address waiting for its link.
import { useLocalSearchParams } from 'expo-router';
import { useMemo } from 'react';
import { View } from 'react-native';

import { AccountProvider, VERIFY_SHIPPED_AT } from '../auth/AccountProvider';
import { AccountCard } from '../auth/components/AccountCard';
import { ALWAYS_ALLOWED } from '../auth/signInGate';
import { AuthError, type AuthBackend, type AuthUser } from '../auth/types';
import { writeVerifyRecord } from '../auth/verifyStore';
import { Screen } from '../components/Screen';
import { VerifyBanner } from '../home/VerifyBanner';
import { createStorage, memoryBackend } from '../storage/storage';
import { RemoteError, type RemoteStore } from '../sync/types';

const refuse = async (): Promise<never> => {
  throw new AuthError('network');
};

function inertAuth(user: AuthUser): AuthBackend {
  return {
    verifiesEmail: true,
    currentUser: () => user,
    onAuthStateChanged(listener) {
      queueMicrotask(() => listener(user));
      return () => undefined;
    },
    signIn: refuse,
    signUp: refuse,
    signOut: refuse,
    sendPasswordReset: refuse,
    reauthenticate: refuse,
    getIdToken: async () => null,
    reload: refuse,
    sendEmailVerification: refuse,
    verifyBeforeUpdateEmail: refuse,
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

export default function VerifyPreview() {
  const { state } = useLocalSearchParams<{ state?: string }>();
  const kind = state === 'paused' || state === 'pending' ? state : 'new';
  const user = useMemo<AuthUser>(
    () => ({
      uid: 'preview-account',
      email: 'a.rather.long.preview.address@example.com',
      emailVerified: false,
      createdAt: kind === 'paused' ? VERIFY_SHIPPED_AT - 86_400_000 : VERIFY_SHIPPED_AT + 86_400_000,
    }),
    [kind],
  );
  const auth = useMemo(() => inertAuth(user), [user]);
  const storage = useMemo(() => {
    const store = createStorage(memoryBackend());
    if (kind !== 'paused') writeVerifyRecord(store, user.uid, { fresh: true, sent: true, pending: kind === 'pending' ? 'new.address@example.org' : null }, 0);
    return store;
  }, [kind, user]);
  return (
    <AccountProvider key={kind} auth={auth} storage={storage} remoteFor={() => inertRemote} signInGate={ALWAYS_ALLOWED} deleteAccountRequest={refuse}>
      <Screen titleKey="screen.me.title" testID="screen-verify-preview">
        <View style={{ gap: 14 }}>
          <VerifyBanner onPress={() => undefined} />
          <AccountCard />
        </View>
      </Screen>
    </AccountProvider>
  );
}
