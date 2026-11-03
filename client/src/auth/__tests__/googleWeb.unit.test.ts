// GOOGLE (board 11-03 row 7): the web Google window (the popup resolver is passed to the popup call only), and the
// web Auth instance (created with no popup resolver, so Google's script never loads for a signed-out visit: PR #40).
describe('the web window and the web Auth instance', () => {
  test('the popup calls get the resolver and always show the account chooser', () => {
    jest.isolateModules(() => {
      const signInWithPopup = jest.fn(async () => ({}));
      const reauthenticateWithPopup = jest.fn(async () => ({}));
      const resolver = { name: 'browserPopupRedirectResolver' };
      class GoogleAuthProvider {
        params: unknown;
        setCustomParameters(p: unknown) {
          this.params = p;
          return this;
        }
      }
      jest.doMock('firebase/auth', () => ({ signInWithPopup, reauthenticateWithPopup, browserPopupRedirectResolver: resolver, GoogleAuthProvider }));
      // The web file by its full name (jest resolves the bare name to the native one).
      // eslint-disable-next-line @typescript-eslint/no-require-imports
      const { googlePopupFlow } = require('../googlePopup.ts') as typeof import('../googlePopup');
      const auth = { kind: 'auth' } as never;
      void googlePopupFlow.signIn(auth);
      void googlePopupFlow.reauthenticate({ uid: 'u' } as never, 'g@gmail.com');
      expect(signInWithPopup).toHaveBeenCalledWith(auth, expect.objectContaining({ params: { prompt: 'select_account' } }), resolver);
      expect(reauthenticateWithPopup).toHaveBeenCalledWith(
        { uid: 'u' },
        expect.objectContaining({ params: { prompt: 'select_account', login_hint: 'g@gmail.com' } }),
        resolver,
      );
    });
  });

  test('the web Auth instance has no popup resolver (no Google script until the button is pressed)', () => {
    jest.isolateModules(() => {
      const initializeAuth = jest.fn(() => ({ kind: 'auth' }));
      jest.doMock('firebase/auth', () => ({
        initializeAuth,
        getAuth: jest.fn(() => {
          throw new Error('getAuth adds the popup resolver');
        }),
        indexedDBLocalPersistence: { p: 'idb' },
        browserLocalPersistence: { p: 'local' },
        browserSessionPersistence: { p: 'session' },
      }));
      jest.doMock('firebase/firestore', () => ({ getFirestore: jest.fn() }));
      jest.doMock('../firebaseCore', () => ({ getFirebaseApp: () => ({ name: '[DEFAULT]' }), withAuthEmulator: (a: unknown) => a, withFirestoreEmulator: (d: unknown) => d }));
      jest.doMock('../appCheck', () => ({ ensureAppCheck: jest.fn() }));
      // eslint-disable-next-line @typescript-eslint/no-require-imports
      const { getFirebaseAuth } = require('../firebaseApp.ts') as typeof import('../firebaseApp');
      getFirebaseAuth();
      expect(initializeAuth).toHaveBeenCalledTimes(1);
      const deps = (initializeAuth.mock.calls[0] as unknown[])[1] as Record<string, unknown>;
      expect(Object.keys(deps)).toEqual(['persistence']);
      expect(deps.popupRedirectResolver).toBeUndefined();
    });
  });
});
