// Security / privacy review round 3 (R6b-security-r3): the account UI. Each test states what should hold; the
// ones that fail on the reviewed code are findings (see the review notes). Do not "fix" a test to pass.
import { readdirSync } from 'fs';
import { join, relative, sep } from 'path';

import { act, fireEvent, render, screen, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../../i18n/I18nProvider';
import { en } from '../../../i18n/messages/en';
import type { DeviceLocale } from '../../../i18n/types';
import { createStorage, memoryBackend, type Storage } from '../../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../../../sync/memoryRemote';
import { DOMAINS } from '../../../sync/__tests__/fixtures';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import { AccountProvider } from '../../AccountProvider';
import { createAccountApi } from '../../accountApi';
import { AuthError, type AuthBackend, type AuthUser } from '../../types';
import { AccountCard } from '../AccountCard';

const mockPush = jest.fn();
jest.mock('expo-router', () => ({
  ...jest.requireActual('expo-router'),
  router: { push: (...args: unknown[]) => mockPush(...args), back: jest.fn(), replace: jest.fn() },
}));

const EN: DeviceLocale[] = [{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }];
const ALICE: AuthUser = { uid: 'alice', email: 'alice@example.com' };

type Fake = AuthBackend & { log: string[]; refreshFails: AuthError | null };

function fakeAuth(initial: AuthUser | null): Fake {
  let user = initial;
  const listeners = new Set<(u: AuthUser | null) => void>();
  const set = (u: AuthUser | null) => {
    user = u;
    listeners.forEach((l) => l(u));
  };
  const fake: Fake = {
    log: [],
    refreshFails: null,
    currentUser: () => user,
    onAuthStateChanged(l) {
      listeners.add(l);
      queueMicrotask(() => l(user));
      return () => void listeners.delete(l);
    },
    async signIn(m) {
      fake.log.push('signIn');
      const u = { uid: 'alice', email: m.email };
      set(u);
      return u;
    },
    async signUp(email) {
      fake.log.push('signUp');
      const u = { uid: 'new', email };
      set(u);
      return u;
    },
    async signOut() {
      fake.log.push('signOut');
      set(null);
    },
    async sendPasswordReset() {
      fake.log.push('reset');
    },
    async reauthenticate() {
      fake.log.push('reauth');
    },
    async getIdToken(force) {
      if (force && fake.refreshFails) throw fake.refreshFails;
      return user ? `h.${btoa(JSON.stringify({ sub: user.uid }))}.s` : null;
    },
  };
  return fake;
}

async function renderCard(opts: { auth: Fake; remote?: MemoryRemote; deleteRequest?: (token: string) => Promise<void> }) {
  const storage: Storage = createStorage(memoryBackend());
  const remote = opts.remote ?? createMemoryRemote();
  const Wrapper = ({ children }: { children: ReactNode }) => (
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={EN}>
        <ThemeProvider storage={storage} systemScheme="light">
          <AccountProvider
            auth={opts.auth}
            storage={storage}
            remoteFor={() => remote}
            domains={DOMAINS}
            deleteAccountRequest={opts.deleteRequest ?? (async () => undefined)}
          >
            {children}
          </AccountProvider>
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>
  );
  await render(<AccountCard />, { wrapper: Wrapper });
  return { remote };
}

const type = async (testID: string, text: string) => {
  await act(async () => fireEvent.changeText(screen.getByTestId(testID), text));
};
const press = async (testID: string) => {
  await act(async () => fireEvent.press(screen.getByTestId(testID)));
};

async function openDelete(auth: Fake, remote: MemoryRemote, deleteRequest: (token: string) => Promise<void>) {
  await renderCard({ auth, remote, deleteRequest });
  await screen.findByText('alice@example.com');
  // Let the first sync put the account's documents on the remote.
  await waitFor(() => expect(remote.devices.size).toBeGreaterThan(0));
  await press('account-delete');
  await type('delete-password', 'correct horse');
}

/** Every route path the app's file router serves (groups and index segments removed). */
function appRoutes(): Set<string> {
  const root = join(__dirname, '..', '..', '..', 'app');
  const out = new Set<string>();
  const walk = (dir: string) => {
    for (const e of readdirSync(dir, { withFileTypes: true })) {
      const p = join(dir, e.name);
      if (e.isDirectory()) walk(p);
      else if (/\.(tsx?|jsx?)$/.test(e.name) && !e.name.startsWith('_') && !e.name.startsWith('+')) {
        const segs = relative(root, p)
          .replace(/\.(tsx?|jsx?)$/, '')
          .split(sep)
          .filter((s) => !/^\(.*\)$/.test(s));
        if (segs[segs.length - 1] === 'index') segs.pop();
        out.add('/' + segs.join('/'));
      }
    }
  };
  walk(root);
  return out;
}

// PARKED (orchestrator): /privacy is built by B-1 (PR #29). Re-enable when B-1 is on main.
describe.skip('S3-1 the privacy link on sign-up', () => {
  test('goes to a route that exists, so the policy can be read before an email is handed over', async () => {
    mockPush.mockClear();
    await renderCard({ auth: fakeAuth(null) });
    await screen.findByTestId('account-sign-in');
    await press('account-sign-in');
    await press('auth-to-signup');
    await press('auth-privacy');
    expect(mockPush).toHaveBeenCalledTimes(1);
    const target = String(mockPush.mock.calls[0]![0]).split('?')[0]!;
    expect([...appRoutes()]).toContain(target);
  });
});

describe('S3-2 a delete that timed out after reaching the server', () => {
  test('does not tell the person that nothing was deleted', async () => {
    const auth = fakeAuth(ALICE);
    const remote = createMemoryRemote();
    // The server wiped the account's data, then the connection dropped before the 204 arrived; the probe's
    // forced refresh cannot reach the token service either (still offline).
    const deleteRequest = async () => {
      remote.items.clear();
      remote.devices.clear();
      remote.settings.clear();
      auth.refreshFails = new AuthError('network', 'offline', { code: 'auth/network-request-failed' });
      throw new AuthError('network', 'delete account timed out');
    };
    await openDelete(auth, remote, deleteRequest);
    await press('delete-confirm');
    const shown = await screen.findByTestId('delete-error');
    expect(remote.devices.size).toBe(0); // the data really is gone
    expect(shown).not.toHaveTextContent(/nothing was deleted/i);
  });
});

describe('S3-3 a 503 from the delete endpoint', () => {
  test('does not claim nothing has changed (the server answers 503 after revoking, disabling or part-wiping too)', async () => {
    const auth = fakeAuth(ALICE);
    const remote = createMemoryRemote();
    let wipedOnServer = false;
    const api = createAccountApi({
      baseUrl: 'https://api.example.test',
      // The backend revoked the tokens, wrote the marker and wiped the data, then deleting the auth user failed.
      fetch: (async () => {
        remote.items.clear();
        remote.devices.clear();
        remote.settings.clear();
        wipedOnServer = true;
        return new Response(JSON.stringify({ detail: "Couldn't delete the account. Try again." }), { status: 503 });
      }) as typeof fetch,
    });
    await openDelete(auth, remote, (t) => api.deleteAccount(t));
    await press('delete-confirm');
    const shown = await screen.findByTestId('delete-error');
    expect(wipedOnServer).toBe(true);
    expect(shown).not.toHaveTextContent(/nothing has changed/i);
  });
});

describe('S3-4 Cancel while the delete runs', () => {
  test('is not offered: it cannot stop the delete, which still completes after the sheet closes', async () => {
    const auth = fakeAuth(ALICE);
    const remote = createMemoryRemote();
    let release!: () => void;
    const held = new Promise<void>((r) => (release = r));
    await openDelete(auth, remote, () => held);
    await press('delete-confirm');
    await waitFor(() => expect(screen.getByTestId('delete-confirm')).toBeDisabled());
    const cancelOff = screen.getByTestId('delete-cancel').props.accessibilityState?.disabled === true;
    // What a press does today: the sheet closes, then the account is deleted anyway.
    if (!cancelOff) {
      await press('delete-cancel');
      expect(screen.queryByTestId('account-sheet')).toBeNull();
      await act(async () => release());
      expect(await screen.findByTestId('account-toast')).toHaveTextContent(en['account.deleted']);
    }
    expect(cancelOff).toBe(true);
  });
});
